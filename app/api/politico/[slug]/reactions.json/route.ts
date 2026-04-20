import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/reactions.json — aggregate public
 * reaction counts across every non-removed statement by one
 * politician. Also returns the top-10 most-reacted statements
 * (by total reactions) so moderators can spot lightning rods.
 *   ?limite=1..50 (default 10) — size of top-list.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-reactions'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 10))

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  // Fetch politician's statement ids.
  const { data: stmtRows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .limit(20000)

  type StmtRow = {
    id: string; slug: string | null; summary: string
    statement_date: string; verification_status: string
  }
  const stmts = (stmtRows ?? []) as StmtRow[]
  const byId = new Map(stmts.map((s) => [s.id, s]))
  const ids = stmts.map((s) => s.id)

  // Aggregate reaction counts. Chunk to stay within PostgREST URL
  // limits on politicians with thousands of statements.
  type Counts = {
    statement_id: string
    importante: number
    contestada: number
    fora_de_contexto: number
    erro: number
    total: number
    last_reacted_at: string | null
  }
  const counts: Counts[] = []
  const CHUNK = 500
  for (let i = 0; i < ids.length; i += CHUNK) {
    const slice = ids.slice(i, i + CHUNK)
    const { data } = await (supabase.from('statement_reaction_counts') as any)
      .select('statement_id, importante, contestada, fora_de_contexto, erro, total, last_reacted_at')
      .in('statement_id', slice)
      .limit(CHUNK)
    for (const r of ((data ?? []) as Counts[])) counts.push(r)
  }

  let importante = 0, contestada = 0, fora_de_contexto = 0, erro = 0, total = 0
  let lastReacted: string | null = null
  for (const c of counts) {
    importante += c.importante ?? 0
    contestada += c.contestada ?? 0
    fora_de_contexto += c.fora_de_contexto ?? 0
    erro += c.erro ?? 0
    total += c.total ?? 0
    if (c.last_reacted_at && (!lastReacted || c.last_reacted_at > lastReacted)) {
      lastReacted = c.last_reacted_at
    }
  }

  const top = [...counts]
    .sort((a, b) => (b.total ?? 0) - (a.total ?? 0))
    .slice(0, limit)
    .map((c) => {
      const s = byId.get(c.statement_id)
      return {
        id: c.statement_id,
        slug: s?.slug ?? null,
        summary: s?.summary ?? null,
        statement_date: s?.statement_date ?? null,
        verification_status: s?.verification_status ?? null,
        counts: {
          importante: c.importante ?? 0,
          contestada: c.contestada ?? 0,
          fora_de_contexto: c.fora_de_contexto ?? 0,
          erro: c.erro ?? 0,
          total: c.total ?? 0,
        },
        last_reacted_at: c.last_reacted_at,
        permalink: s ? `${SITE_URL}/declaracao/${s.slug ?? s.id}` : null,
      }
    })

  const etag = `W/"pol-react-${pol.id.slice(0, 8)}-${total}-${counts.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: pol.slug, common_name: pol.common_name,
      party: pol.party, state: pol.state,
      url: `${SITE_URL}/politico/${pol.slug}`,
    },
    totals: { importante, contestada, fora_de_contexto, erro, total },
    statement_count: stmts.length,
    reacted_statement_count: counts.length,
    last_reacted_at: lastReacted,
    top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=900, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
