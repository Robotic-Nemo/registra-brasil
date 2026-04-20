import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/leaderboard.json — top politicians whose
 * statements are primary-tagged with this category, scored by
 * severity × exp(-ageDays/365). Completes the scope leaderboard
 * set (partidos, estados, categorias).
 *
 *   ?limite=1..50 (default 20)
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-lb'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const lim = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) return NextResponse.json({ error: 'not_found', slug }, { status: 404 })
  const category = cat as { id: string; slug: string; label_pt: string }

  // Pull primary-tagged statements through the pivot table, filter
  // to verified, and score in-memory. Bounded at 30k — categories
  // fan wide but this covers years of scope-level volume.
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(id, statement_date, severity_score, verification_status, politicians!inner(slug, common_name, party, state, is_active, photo_url))')
    .eq('category_id', category.id)
    .eq('is_primary', true)
    .eq('statements.verification_status', 'verified')
    .eq('statements.politicians.is_active', true)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Stmt = {
    id: string; statement_date: string; severity_score: number | null
    verification_status: string
    politicians: {
      slug: string; common_name: string; party: string | null; state: string | null
      is_active: boolean; photo_url: string | null
    }
  }
  const rows = ((data ?? []) as Array<{ statements: Stmt | null }>)
    .map((r) => r.statements)
    .filter((s): s is Stmt => !!s)

  const now = Date.now()
  type Entry = {
    slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null
    count: number; score: number; severity_sum: number; severity_n: number
  }
  const byPolitico = new Map<string, Entry>()
  for (const s of rows) {
    const p = s.politicians
    if (!p?.slug) continue
    const ageDays = (now - Date.parse(s.statement_date)) / 86_400_000
    if (!Number.isFinite(ageDays) || ageDays < 0) continue
    const severity = s.severity_score ?? 0
    const e = byPolitico.get(p.slug) ?? {
      slug: p.slug, common_name: p.common_name, party: p.party, state: p.state, photo_url: p.photo_url,
      count: 0, score: 0, severity_sum: 0, severity_n: 0,
    }
    e.count++
    e.score += severity * Math.exp(-ageDays / 365)
    if (s.severity_score !== null) {
      e.severity_sum += s.severity_score
      e.severity_n++
    }
    byPolitico.set(p.slug, e)
  }

  const results = Array.from(byPolitico.values())
    .map((e) => ({
      slug: e.slug,
      common_name: e.common_name,
      party: e.party,
      state: e.state,
      photo_url: e.photo_url,
      statement_count: e.count,
      avg_severity: e.severity_n > 0 ? Number((e.severity_sum / e.severity_n).toFixed(2)) : null,
      score: Number(e.score.toFixed(3)),
      url: `${SITE_URL}/politico/${e.slug}`,
    }))
    .sort((a, b) => b.score - a.score)
    .slice(0, lim)

  const etag = `W/"cat-lb-${category.slug}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: { slug: category.slug, label_pt: category.label_pt },
    scope_total: rows.length,
    count: results.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
