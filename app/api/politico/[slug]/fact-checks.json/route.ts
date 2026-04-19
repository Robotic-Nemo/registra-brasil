import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { RATING_LABELS } from '@/lib/fact-checks/outlets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/fact-checks.json — external fact-check
 * cross-references for statements by one politician. Two-step query:
 *   1) fetch statement ids by politician_id (cheap, indexed).
 *   2) fetch fact_checks where statement_id in (…).
 * Includes rating_counts tally so clients can render filter chips.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-fc'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const lim = Math.max(1, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 50))
  const supabase = getSupabaseServiceClient()

  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  // Get this politician's statement ids (capped — fact-checks are rare).
  const { data: stmtRows } = await (supabase.from('statements') as any)
    .select('id, slug, summary')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .limit(2000)

  type Stmt = { id: string; slug: string | null; summary: string }
  const stmts = (stmtRows ?? []) as Stmt[]
  const byId = new Map(stmts.map((s) => [s.id, s]))
  const ids = stmts.map((s) => s.id)

  if (ids.length === 0) {
    return NextResponse.json({
      politician: { slug: p.slug, common_name: p.common_name, party: p.party, state: p.state },
      count: 0, rating_counts: [], results: [], generated_at: new Date().toISOString(),
    })
  }

  const { data: fcRows } = await (supabase.from('statement_fact_checks') as any)
    .select('id, statement_id, outlet, outlet_label, url, title, rating, rating_label, published_at, created_at')
    .in('statement_id', ids)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(lim)

  type Fc = {
    id: string; statement_id: string; outlet: string; outlet_label: string | null
    url: string; title: string | null; rating: string | null; rating_label: string | null
    published_at: string | null; created_at: string
  }
  const fcs = (fcRows ?? []) as Fc[]

  const counts = new Map<string, number>()
  for (const r of fcs) {
    const k = r.rating ?? 'unrated'
    counts.set(k, (counts.get(k) ?? 0) + 1)
  }

  const latest = fcs.length ? (fcs[0].published_at ?? fcs[0].created_at) : '0'
  const etag = `W/"pfc-${p.id.slice(0, 8)}-${fcs.length}-${latest.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: p.slug, common_name: p.common_name, party: p.party, state: p.state,
      url: `${SITE_URL}/politico/${p.slug}`,
    },
    count: fcs.length,
    rating_counts: [...counts.entries()].map(([r, c]) => ({
      rating: r, label: RATING_LABELS[r] ?? r, total: c,
    })),
    results: fcs.map((r) => {
      const s = byId.get(r.statement_id)
      return {
        id: r.id,
        outlet: r.outlet,
        outlet_label: r.outlet_label,
        title: r.title,
        url: r.url,
        rating: r.rating,
        rating_label: r.rating_label ?? (r.rating ? RATING_LABELS[r.rating] : null),
        published_at: r.published_at,
        statement: s ? {
          id: s.id, slug: s.slug, summary: s.summary,
          permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
        } : null,
      }
    }),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
