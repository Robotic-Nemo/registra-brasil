import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface TimeSegment {
  label: string
  from: string // ISO date
  to: string | null // ISO date or null for ongoing
}

export interface YearActivity {
  year: number
  count: number
}

/**
 * Pulls the politician's statement activity bucketed by year. Used to
 * overlay a volume curve beneath the party/role Gantt bars.
 */
export async function getYearlyActivity(politicianId: string): Promise<YearActivity[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date')
    .eq('politician_id', politicianId)
    .neq('verification_status', 'removed')
    .limit(30000)
  if (error) return []
  const counts = new Map<number, number>()
  for (const r of ((data ?? []) as Array<{ statement_date: string }>)) {
    const y = Number(r.statement_date.slice(0, 4))
    if (y) counts.set(y, (counts.get(y) ?? 0) + 1)
  }
  return [...counts.entries()]
    .sort((a, b) => a[0] - b[0])
    .map(([year, count]) => ({ year, count }))
}

/**
 * Returns the min/max year spanning party_history, role_history, and
 * observed activity, plus the clamp-safe current year for open segments.
 */
export function computeRange(
  parties: TimeSegment[],
  roles: TimeSegment[],
  activity: YearActivity[],
): { minYear: number; maxYear: number } {
  const nowYear = new Date().getFullYear()
  let minY = nowYear
  let maxY = nowYear
  for (const seg of [...parties, ...roles]) {
    const f = seg.from ? Number(seg.from.slice(0, 4)) : null
    const t = seg.to ? Number(seg.to.slice(0, 4)) : nowYear
    if (f && f < minY) minY = f
    if (t && t > maxY) maxY = t
  }
  for (const a of activity) {
    if (a.year < minY) minY = a.year
    if (a.year > maxY) maxY = a.year
  }
  if (minY === maxY) minY = maxY - 1
  return { minYear: minY, maxYear: maxY }
}

// Legend palette keyed loosely to Brazilian parties. Falls back to an
// indexed palette for parties we don't have hand-picked colors for.
const PARTY_PALETTE: Record<string, string> = {
  PT: '#dc2626',
  'PT-GO': '#dc2626',
  PSDB: '#2563eb',
  PSB: '#f59e0b',
  PCdoB: '#b91c1c',
  PL: '#fbbf24',
  'União Brasil': '#0ea5e9',
  UNIÃO: '#0ea5e9',
  PP: '#8b5cf6',
  'Progressistas': '#8b5cf6',
  Novo: '#f97316',
  PSOL: '#ef4444',
  REDE: '#22c55e',
  Rede: '#22c55e',
  'Republicanos': '#3b82f6',
  PSD: '#06b6d4',
  MDB: '#eab308',
  PDT: '#dc2626',
  'PV': '#16a34a',
  'Cidadania': '#0ea5e9',
  'Podemos': '#3b82f6',
  'Solidariedade': '#f59e0b',
  Avante: '#10b981',
  PSC: '#6366f1',
  PTB: '#ef4444',
  DC: '#8b5cf6',
  Indep: '#6b7280',
  'Indep.': '#6b7280',
}

const FALLBACK_PALETTE = ['#64748b', '#0369a1', '#7c3aed', '#16a34a', '#ea580c', '#db2777']

export function partyColor(party: string, fallbackIndex: number): string {
  const key = party.replace(/\s+/g, ' ').trim()
  return PARTY_PALETTE[key] ?? FALLBACK_PALETTE[fallbackIndex % FALLBACK_PALETTE.length]
}
