import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { BRAZIL_TILES } from '@/lib/maps/brazil-tile'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estados.json — directory of Brazilian states with active-
 * politician and verified-statement counts. Uses the curated tile
 * cartogram as the source of truth for UF metadata (name, region).
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const [polRes, stmtRes] = await Promise.all([
    // Cap politician scan so a runaway bulk-import can't force us
    // to stream tens of thousands of single-column rows. Same
    // reasoning as the /api/partidos.json fix.
    (supabase.from('politicians') as any)
      .select('state')
      .eq('is_active', true)
      .not('state', 'is', null)
      .limit(20000),
    (supabase.from('statements') as any)
      .select('politicians!inner(state)')
      .eq('verification_status', 'verified')
      .not('politicians.state', 'is', null)
      .limit(15000),
  ])

  type PolRow = { state: string | null }
  type StmtRow = { politicians: { state: string | null } | null }

  const polCount = new Map<string, number>()
  for (const r of ((polRes.data ?? []) as PolRow[])) {
    if (r.state) polCount.set(r.state, (polCount.get(r.state) ?? 0) + 1)
  }

  const stmtCount = new Map<string, number>()
  for (const r of ((stmtRes.data ?? []) as StmtRow[])) {
    const st = r.politicians?.state
    if (st) stmtCount.set(st, (stmtCount.get(st) ?? 0) + 1)
  }

  const states = BRAZIL_TILES.map((t) => ({
    uf: t.uf,
    name: t.name,
    region: t.region,
    active_politician_count: polCount.get(t.uf) ?? 0,
    verified_statement_count: stmtCount.get(t.uf) ?? 0,
    url: `${SITE_URL}/estados/${t.uf.toLowerCase()}`,
  })).sort((a, b) => b.verified_statement_count - a.verified_statement_count)

  return NextResponse.json({
    count: states.length,
    states,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=10800, stale-while-revalidate=86400',
    },
  })
}
