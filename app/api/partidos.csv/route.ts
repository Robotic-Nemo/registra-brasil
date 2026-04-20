import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 10800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/partidos.csv — CSV directory of parties with active
 * politician counts. Sibling to /api/partidos.json.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'partidos-csv'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('politicians') as any)
    .select('party')
    .eq('is_active', true)
    .not('party', 'is', null)
    .limit(20000)

  const counts = new Map<string, number>()
  for (const r of ((data ?? []) as Array<{ party: string | null }>)) {
    if (!r.party) continue
    counts.set(r.party, (counts.get(r.party) ?? 0) + 1)
  }
  const parties = [...counts.entries()].sort((a, b) => b[1] - a[1])

  const lines = ['party,active_politician_count,url']
  for (const [party, count] of parties) {
    lines.push([
      csvEscape(party),
      csvEscape(count),
      csvEscape(`${SITE_URL}/partidos/${encodeURIComponent(party)}`),
    ].join(','))
  }

  return new Response(lines.join('\n') + '\n', {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="partidos.csv"',
      'Cache-Control': 'public, max-age=3600, s-maxage=10800, stale-while-revalidate=86400',
    },
  })
}
