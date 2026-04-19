import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface MonthlyRecap {
  month: string // YYYY-MM
  startDate: string
  endDate: string
  totalStatements: number
  topByseverity: TopStatement[]
  topPoliticians: Array<{ slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null; count: number }>
  topCategories: Array<{ slug: string; label_pt: string; color_hex: string | null; count: number }>
}

export interface TopStatement {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  severity_score: number | null
  politician_slug: string
  politician_name: string
  categories: Array<{ slug: string; label_pt: string; color_hex: string | null }>
}

const MONTH_RE = /^(\d{4})-(\d{2})$/

export function currentMonth(): string {
  const d = new Date()
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`
}

export function isValidMonth(m: string): boolean {
  const match = m.match(MONTH_RE)
  if (!match) return false
  const year = Number(match[1])
  const month = Number(match[2])
  return year >= 1990 && year <= 2100 && month >= 1 && month <= 12
}

export function monthBounds(m: string): { start: string; end: string } | null {
  const match = m.match(MONTH_RE)
  if (!match) return null
  const year = Number(match[1])
  const month = Number(match[2])
  const start = `${year}-${String(month).padStart(2, '0')}-01`
  const lastDay = new Date(Date.UTC(year, month, 0)).getUTCDate()
  const end = `${year}-${String(month).padStart(2, '0')}-${String(lastDay).padStart(2, '0')}`
  return { start, end }
}

export function adjacentMonth(m: string, delta: number): string {
  const match = m.match(MONTH_RE)!
  const year = Number(match[1])
  const month = Number(match[2])
  let newMonth = month + delta
  let newYear = year
  while (newMonth < 1) { newMonth += 12; newYear-- }
  while (newMonth > 12) { newMonth -= 12; newYear++ }
  return `${newYear}-${String(newMonth).padStart(2, '0')}`
}

export async function computeMonthlyRecap(month: string): Promise<MonthlyRecap | null> {
  const bounds = monthBounds(month)
  if (!bounds) return null
  const supabase = getSupabaseServiceClient()

  const { data: rows } = await (supabase.from('statements') as any)
    .select(`
      id, slug, summary, statement_date, severity_score, politician_id,
      politicians!inner ( slug, common_name, party, state, photo_url ),
      statement_categories ( categories ( slug, label_pt, color_hex ) )
    `)
    .gte('statement_date', bounds.start)
    .lte('statement_date', bounds.end)
    .neq('verification_status', 'removed')
    .order('severity_score', { ascending: false, nullsFirst: false })
    .order('statement_date', { ascending: false })
    .limit(5000)

  type Row = {
    id: string; slug: string | null; summary: string; statement_date: string
    severity_score: number | null; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null }
    statement_categories: Array<{ categories: { slug: string; label_pt: string; color_hex: string | null } | null }>
  }

  const data = (rows ?? []) as Row[]
  const topByseverity: TopStatement[] = data.slice(0, 20).map((r) => ({
    id: r.id,
    slug: r.slug,
    summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    politician_slug: r.politicians.slug,
    politician_name: r.politicians.common_name,
    categories: (r.statement_categories ?? []).map((sc) => sc.categories).filter((c): c is NonNullable<typeof c> => c !== null),
  }))

  const polCount = new Map<string, { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null; count: number }>()
  for (const r of data) {
    const e = polCount.get(r.politician_id)
    if (e) e.count++
    else polCount.set(r.politician_id, { ...r.politicians, count: 1 })
  }
  const topPoliticians = [...polCount.values()].sort((a, b) => b.count - a.count).slice(0, 10)

  const catCount = new Map<string, { slug: string; label_pt: string; color_hex: string | null; count: number }>()
  for (const r of data) {
    for (const sc of r.statement_categories ?? []) {
      const c = sc.categories
      if (!c) continue
      const e = catCount.get(c.slug)
      if (e) e.count++
      else catCount.set(c.slug, { ...c, count: 1 })
    }
  }
  const topCategories = [...catCount.values()].sort((a, b) => b.count - a.count).slice(0, 8)

  return {
    month,
    startDate: bounds.start,
    endDate: bounds.end,
    totalStatements: data.length,
    topByseverity,
    topPoliticians,
    topCategories,
  }
}

const MONTH_NAMES = [
  'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
  'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro',
]

export function monthLabel(m: string): string {
  const match = m.match(MONTH_RE)
  if (!match) return m
  return `${MONTH_NAMES[Number(match[2]) - 1]} de ${match[1]}`
}
