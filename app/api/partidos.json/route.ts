import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/partidos.json — directory of parties with active-politician
 * counts. Thin payload suitable for integrations that need the full
 * set of sigla values currently represented in the archive.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  // Cap at 20k so a runaway `politicians` table (e.g. bulk import
  // of historical candidates) doesn't force us to stream tens of
  // thousands of single-column rows through the edge just to count.
  const { data, error } = await (supabase.from('politicians') as any)
    .select('party')
    .eq('is_active', true)
    .not('party', 'is', null)
    .limit(20000)
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = { party: string | null }
  const rows = (data ?? []) as Row[]
  const counts = new Map<string, number>()
  for (const r of rows) {
    if (!r.party) continue
    counts.set(r.party, (counts.get(r.party) ?? 0) + 1)
  }

  const parties = [...counts.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([party, count]) => ({
      party,
      active_politician_count: count,
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    }))

  return NextResponse.json({
    count: parties.length,
    parties,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=10800, stale-while-revalidate=86400',
    },
  })
}
