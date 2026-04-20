import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildCompareEntities, compareStartStr } from '@/lib/stats/compare-scope'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/comparar/categorias.json?slugs=economia,saude — dense
 * compare for 2..6 primary-tag categories.
 *   ?meses=3..24 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'compare-cat'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const raw = (request.nextUrl.searchParams.get('slugs') ?? '').trim()
  if (!raw) return NextResponse.json({ error: 'missing_slugs' }, { status: 400 })
  const slugs = [...new Set(raw.split(',').map((s) => s.trim().toLowerCase()).filter(Boolean))]
  if (slugs.length < 2 || slugs.length > 6) {
    return NextResponse.json({ error: 'slugs_must_be_2_to_6' }, { status: 400 })
  }
  if (!slugs.every((s) => SLUG_RE.test(s))) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const startStr = compareStartStr(meses)

  const supabase = getSupabaseServiceClient()
  const { data: cats } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .in('slug', slugs)
  type Cat = { id: string; slug: string; label_pt: string | null; color_hex: string | null }
  const catArr = (cats ?? []) as Cat[]
  if (catArr.length < 2) {
    return NextResponse.json({ error: 'not_enough_categories_found', found: catArr.map((c) => c.slug) }, { status: 404 })
  }
  const idToSlug = new Map<string, string>(catArr.map((c) => [c.id, c.slug]))
  const byId = new Map<string, Cat>(catArr.map((c) => [c.id, c]))
  const ids = catArr.map((c) => c.id)
  const foundSlugs = catArr.map((c) => c.slug)

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary, statements!inner(statement_date, severity_score, verification_status)')
    .in('category_id', ids)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = {
    category_id: string | null
    statements: { statement_date: string; severity_score: number | null; verification_status: string } | null
  }
  const mapped = ((data ?? []) as Pivot[])
    .filter((r) => r.category_id && r.statements)
    .map((r) => {
      const slug = idToSlug.get(r.category_id as string)!
      return {
        key: slug,
        statement_date: r.statements!.statement_date,
        severity_score: r.statements!.severity_score,
        verification_status: r.statements!.verification_status,
      }
    })

  const entities = buildCompareEntities(mapped, foundSlugs, meses).map((e) => {
    const cat = catArr.find((c) => c.slug === e.key)!
    const meta = byId.get(cat.id)
    return {
      ...e,
      slug: e.key,
      label: meta?.label_pt ?? null,
      color: meta?.color_hex ?? null,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    }
  })

  const total = entities.reduce((s, e) => s + e.total, 0)
  const etag = `W/"cmp-cat-${foundSlugs.join('.')}-${meses}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    scope: 'categorias',
    meses,
    requested: slugs,
    found: foundSlugs,
    entities,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
