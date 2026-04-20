import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const ID_RE = /^[a-z0-9-]{1,120}$/i

/**
 * GET /api/declaracao/:id/similar.json — statements "like" a given
 * one. Ranking: Jaccard-ish over shared categories (primary weights
 * double). Prefers the same politician when possible, then falls
 * back across politicians in the same party/state. Excludes self.
 *   ?limite=1..25 (default 8)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'decl-similar'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id } = await params
  if (!ID_RE.test(id)) {
    return NextResponse.json({ error: 'id inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(25, Number(request.nextUrl.searchParams.get('limite')) || 8))

  const supabase = getSupabaseServiceClient()
  // Resolve by UUID or slug.
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(id)
  const { data: target } = await (supabase.from('statements') as any)
    .select('id, slug, politician_id, statement_date, politicians!inner(slug, common_name, party, state)')
    .eq(isUuid ? 'id' : 'slug', id)
    .maybeSingle()
  if (!target) {
    return NextResponse.json({ error: 'Declaração não encontrada' }, { status: 404 })
  }

  // Target category set (primary + all).
  const { data: targetCats } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary')
    .eq('statement_id', target.id)
  type Sc = { category_id: string; is_primary: boolean }
  const targetSet = new Map<string, boolean>()
  for (const c of ((targetCats ?? []) as Sc[])) targetSet.set(c.category_id, c.is_primary)
  if (targetSet.size === 0) {
    return NextResponse.json({
      target: { id: target.id, slug: target.slug },
      similar: [],
      note: 'target has no category tags — similarity undefined',
      generated_at: new Date().toISOString(),
    })
  }

  // Candidate statements: share at least one category with target.
  // Chunked IN() to stay under PostgREST limits.
  const catIds = [...targetSet.keys()]
  const { data: candRows } = await (supabase.from('statement_categories') as any)
    .select('statement_id, category_id, is_primary')
    .in('category_id', catIds)
    .neq('statement_id', target.id)
    .limit(5000)

  type CandRow = { statement_id: string; category_id: string; is_primary: boolean }
  const scoreByStmt = new Map<string, number>()
  for (const r of ((candRows ?? []) as CandRow[])) {
    const tPrimary = targetSet.get(r.category_id)
    if (tPrimary === undefined) continue
    // Weight: both primary = 4, either primary = 2, neither = 1.
    const w = (tPrimary && r.is_primary) ? 4 : (tPrimary || r.is_primary) ? 2 : 1
    scoreByStmt.set(r.statement_id, (scoreByStmt.get(r.statement_id) ?? 0) + w)
  }

  const top = [...scoreByStmt.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit * 3)
  const topIds = top.map(([sid]) => sid)
  if (topIds.length === 0) {
    return NextResponse.json({
      target: { id: target.id, slug: target.slug },
      similar: [],
      generated_at: new Date().toISOString(),
    })
  }

  const { data: stmts } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, politician_id, politicians!inner(slug, common_name, party, state)')
    .in('id', topIds)
    .neq('verification_status', 'removed')
    .limit(topIds.length)

  type Stmt = {
    id: string; slug: string | null; summary: string; statement_date: string
    severity_score: number | null; verification_status: string
    politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const byId = new Map<string, Stmt>()
  for (const s of ((stmts ?? []) as Stmt[])) byId.set(s.id, s)

  // Prefer same-politician > same-party > same-state > other, tie-break on score.
  const samePol = target.politician_id
  const sameParty = target.politicians?.party ?? null
  const sameState = target.politicians?.state ?? null
  const ranked = top
    .map(([sid, score]) => {
      const s = byId.get(sid)
      if (!s) return null
      const bonus =
        (s.politician_id === samePol ? 1000 : 0) +
        (s.politicians.party && s.politicians.party === sameParty ? 10 : 0) +
        (s.politicians.state && s.politicians.state === sameState ? 5 : 0)
      return { s, score: score + bonus, raw: score }
    })
    .filter((x): x is { s: Stmt; score: number; raw: number } => x !== null)
    .sort((a, b) => b.score - a.score)
    .slice(0, limit)
    .map(({ s, raw }) => ({
      id: s.id, slug: s.slug, summary: s.summary,
      statement_date: s.statement_date,
      severity_score: s.severity_score,
      verification_status: s.verification_status,
      similarity_score: raw,
      politician: {
        slug: s.politicians.slug, common_name: s.politicians.common_name,
        party: s.politicians.party, state: s.politicians.state,
        url: `${SITE_URL}/politico/${s.politicians.slug}`,
      },
      permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    }))

  const etag = `W/"sim-${String(target.id).slice(0, 8)}-${ranked.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    target: {
      id: target.id,
      slug: target.slug,
      url: `${SITE_URL}/declaracao/${target.slug ?? target.id}`,
    },
    similar: ranked,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
