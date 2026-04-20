import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildCompareEntities, compareStartStr } from '@/lib/stats/compare-scope'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9-]{2,80}$/

/**
 * GET /api/comparar/politicos.json?slugs=lula-da-silva,bolsonaro — dense
 * compare payload for 2..6 politicians. Two-step resolve (slugs → ids)
 * sidesteps PostgREST `!inner` silent-drop on or()+join.
 *   ?slugs=... (required; 2..6 lowercase slugs)
 *   ?meses=3..24 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'compare-pol'), {
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

  // Resolve slugs → ids first (avoids !inner+or silent-drop on politicians.slug).
  const { data: pols, error: polErr } = await (supabase.from('politicians') as any)
    .select('id, slug, full_name, party, uf, photo_url')
    .in('slug', slugs)
    .eq('is_active', true)
  if (polErr) return NextResponse.json({ error: polErr.message }, { status: 500 })

  type Pol = { id: string; slug: string; full_name: string; party: string | null; uf: string | null; photo_url: string | null }
  const polList = (pols ?? []) as Pol[]
  if (polList.length < 2) {
    return NextResponse.json({ error: 'politicos_nao_encontrados', found: polList.map((p) => p.slug) }, { status: 404 })
  }
  const ids = polList.map((p) => p.id)
  const bySlugOrder = new Map(polList.map((p) => [p.slug, p]))

  const { data, error } = await (supabase.from('statements') as any)
    .select('politician_id, statement_date, severity_score, verification_status')
    .in('politician_id', ids)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { politician_id: string; statement_date: string; severity_score: number | null; verification_status: string }
  const mapped = ((data ?? []) as Row[]).map((r) => ({
    key: r.politician_id,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    verification_status: r.verification_status,
  }))

  const entities = buildCompareEntities(mapped, ids, meses).map((e) => {
    const p = polList.find((x) => x.id === e.key)!
    return {
      ...e,
      politician_id: e.key,
      slug: p.slug,
      full_name: p.full_name,
      party: p.party,
      uf: p.uf,
      photo_url: p.photo_url,
      url: `${SITE_URL}/politicos/${p.slug}`,
    }
  })

  // Preserve request order when possible
  entities.sort((a, b) => slugs.indexOf(a.slug) - slugs.indexOf(b.slug))

  const missing = slugs.filter((s) => !bySlugOrder.has(s))
  const total = entities.reduce((s, e) => s + e.total, 0)
  const etag = `W/"cmp-pol-${ids.join('.')}-${meses}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    scope: 'politicos',
    meses,
    requested: slugs,
    missing,
    entities,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
