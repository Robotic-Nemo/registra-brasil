import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { extractDomain } from '@/lib/sources/domain'

export interface Scorecard {
  total: number
  verifiedCount: number
  featuredCount: number
  withVideoCount: number
  firstDate: string | null
  lastDate: string | null
  severityHistogram: Record<1 | 2 | 3 | 4 | 5, number>
  sourceTypeHistogram: Record<string, number>
  topDomains: Array<{ domain: string; count: number }>
  monthly: Array<{ month: string; count: number }>
  partyRank: { rank: number | null; total: number }
  stateRank: { rank: number | null; total: number }
  contradictionCount: number
  factCheckCount: number
}

interface StatementSlice {
  statement_date: string
  verification_status: string
  is_featured: boolean
  severity_score: number | null
  primary_source_url: string | null
  primary_source_type: string | null
  youtube_video_id: string | null
}

export async function computeScorecard(
  politicianId: string,
  party: string,
  state: string | null,
): Promise<Scorecard> {
  const supabase = getSupabaseServiceClient()

  // Pull the full corpus slim — only the columns we need for histograms.
  const all: StatementSlice[] = []
  const CHUNK = 1000
  for (let offset = 0; offset < 25_000; offset += CHUNK) {
    const { data, error } = await (supabase.from('statements') as any)
      .select('statement_date, verification_status, is_featured, severity_score, primary_source_url, primary_source_type, youtube_video_id')
      .eq('politician_id', politicianId)
      .neq('verification_status', 'removed')
      .order('statement_date', { ascending: false })
      .range(offset, offset + CHUNK - 1)
    if (error) break
    const rows = (data ?? []) as StatementSlice[]
    all.push(...rows)
    if (rows.length < CHUNK) break
  }

  const total = all.length
  const verifiedCount = all.filter((s) => s.verification_status === 'verified').length
  const featuredCount = all.filter((s) => s.is_featured).length
  const withVideoCount = all.filter((s) => s.youtube_video_id).length

  // Severity histogram, treating null as "unclassified" → bucket 1.
  const severityHistogram: Scorecard['severityHistogram'] = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const s of all) {
    const sv = (s.severity_score ?? 1) as 1 | 2 | 3 | 4 | 5
    if (sv >= 1 && sv <= 5) severityHistogram[sv]++
  }

  const sourceTypeHistogram: Record<string, number> = {}
  const domainCounts = new Map<string, number>()
  for (const s of all) {
    if (s.primary_source_type) {
      sourceTypeHistogram[s.primary_source_type] = (sourceTypeHistogram[s.primary_source_type] ?? 0) + 1
    }
    const d = extractDomain(s.primary_source_url)
    if (d) domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1)
  }
  const topDomains = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, 6)
    .map(([domain, count]) => ({ domain, count }))

  // Monthly bucket over last 24 months
  const now = new Date()
  const months: string[] = []
  for (let i = 23; i >= 0; i--) {
    const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
    months.push(`${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`)
  }
  const monthMap = new Map<string, number>(months.map((m) => [m, 0]))
  for (const s of all) {
    const key = s.statement_date.slice(0, 7)
    if (monthMap.has(key)) monthMap.set(key, (monthMap.get(key) ?? 0) + 1)
  }
  const monthly = months.map((m) => ({ month: m, count: monthMap.get(m) ?? 0 }))

  // First/last from sorted list (desc).
  const lastDate = all[0]?.statement_date ?? null
  const firstDate = all[all.length - 1]?.statement_date ?? null

  // Peer rank (best-effort: count declarations per peer, compare vs mine).
  const partyRank = await rankAgainstPeers(politicianId, total, { party })
  const stateRank = state ? await rankAgainstPeers(politicianId, total, { state }) : { rank: null, total: 0 }

  // Contradictions mentioning this politician (any pair).
  let contradictionCount = 0
  try {
    const { count } = await (supabase.from('contradiction_pairs') as any)
      .select('id', { count: 'exact', head: true })
      .eq('politician_id', politicianId)
      .eq('is_published', true)
    contradictionCount = count ?? 0
  } catch {}

  // Fact-checks cross-referenced (statement_fact_checks table from prior work).
  let factCheckCount = 0
  try {
    const { count } = await (supabase
      .from('statement_fact_checks') as any)
      .select('id, statements!inner(politician_id)', { count: 'exact', head: true })
      .eq('statements.politician_id', politicianId)
    factCheckCount = count ?? 0
  } catch {}

  return {
    total,
    verifiedCount,
    featuredCount,
    withVideoCount,
    firstDate,
    lastDate,
    severityHistogram,
    sourceTypeHistogram,
    topDomains,
    monthly,
    partyRank,
    stateRank,
    contradictionCount,
    factCheckCount,
  }
}

async function rankAgainstPeers(
  politicianId: string,
  myCount: number,
  filter: { party?: string; state?: string },
): Promise<{ rank: number | null; total: number }> {
  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('politicians') as any).select('id').eq('is_active', true)
  if (filter.party) q = q.eq('party', filter.party)
  if (filter.state) q = q.eq('state', filter.state)
  const { data: peers } = await q.limit(400)
  const ids = (peers ?? []).map((p: { id: string }) => p.id)
  if (ids.length === 0) return { rank: null, total: 0 }

  // Pull aggregate counts per peer via a single `rpc`? No RPC available here.
  // Fallback: count statements per peer via an IN query (capped at 400 peers).
  const { data: stmts } = await (supabase.from('statements') as any)
    .select('politician_id')
    .in('politician_id', ids)
    .neq('verification_status', 'removed')
    .limit(20_000)

  const counts = new Map<string, number>(ids.map((id: string) => [id, 0]))
  for (const s of ((stmts ?? []) as Array<{ politician_id: string }>)) {
    counts.set(s.politician_id, (counts.get(s.politician_id) ?? 0) + 1)
  }
  const sorted = [...counts.values()].sort((a, b) => b - a)
  const rank = sorted.indexOf(counts.get(politicianId) ?? myCount) + 1
  return { rank: rank || null, total: ids.length }
}
