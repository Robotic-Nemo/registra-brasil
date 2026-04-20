import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'
import { BRAZIL_TILES } from '@/lib/maps/brazil-tile'

export const runtime = 'nodejs'
export const revalidate = 10800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/estados.csv — CSV directory of Brazilian states with
 * active-politician and verified-statement counts. Sibling to
 * /api/estados.json. Sorted by verified-statement count desc.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estados-csv'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const supabase = getSupabaseServiceClient()
  const [polRes, stmtRes] = await Promise.all([
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

  const polCount = new Map<string, number>()
  for (const r of ((polRes.data ?? []) as Array<{ state: string | null }>)) {
    if (r.state) polCount.set(r.state, (polCount.get(r.state) ?? 0) + 1)
  }
  const stmtCount = new Map<string, number>()
  for (const r of ((stmtRes.data ?? []) as Array<{ politicians: { state: string | null } | null }>)) {
    const st = r.politicians?.state
    if (st) stmtCount.set(st, (stmtCount.get(st) ?? 0) + 1)
  }

  const rows = BRAZIL_TILES.map((t) => ({
    uf: t.uf, name: t.name, region: t.region,
    pol: polCount.get(t.uf) ?? 0,
    stmt: stmtCount.get(t.uf) ?? 0,
  })).sort((a, b) => b.stmt - a.stmt)

  const header = ['uf', 'name', 'region', 'active_politician_count', 'verified_statement_count', 'url']
  const lines = [header.join(',')]
  for (const r of rows) {
    lines.push([
      csvEscape(r.uf),
      csvEscape(r.name),
      csvEscape(r.region),
      csvEscape(r.pol),
      csvEscape(r.stmt),
      csvEscape(`${SITE_URL}/estados/${r.uf.toLowerCase()}`),
    ].join(','))
  }

  return new Response(lines.join('\n') + '\n', {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="estados.csv"',
      'Cache-Control': 'public, max-age=1800, s-maxage=10800, stale-while-revalidate=86400',
    },
  })
}
