import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface WeeklyRecap {
  weekStart: string // ISO YYYY-MM-DD (Monday)
  weekEnd: string // ISO YYYY-MM-DD (Sunday)
  isoWeek: string // "YYYY-Www"
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

export function isoWeekFor(date: Date): string {
  const d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()))
  const dayNum = d.getUTCDay() || 7
  d.setUTCDate(d.getUTCDate() + 4 - dayNum)
  const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1))
  const weekNum = Math.ceil(((d.getTime() - yearStart.getTime()) / 86400000 + 1) / 7)
  return `${d.getUTCFullYear()}-W${String(weekNum).padStart(2, '0')}`
}

/**
 * Parse "YYYY-Www" back into a Date range (UTC Monday 00:00 → Sunday 23:59).
 * Returns null if malformed.
 */
export function parseIsoWeek(weekStr: string): { start: Date; end: Date } | null {
  const m = weekStr.match(/^(\d{4})-W(\d{2})$/)
  if (!m) return null
  const year = Number(m[1])
  const week = Number(m[2])
  if (year < 1990 || year > 2200 || week < 1 || week > 53) return null
  // ISO: week 1 contains first Thursday.
  const jan4 = new Date(Date.UTC(year, 0, 4))
  const jan4DayNum = jan4.getUTCDay() || 7
  const week1Monday = new Date(jan4)
  week1Monday.setUTCDate(jan4.getUTCDate() - jan4DayNum + 1)
  const start = new Date(week1Monday)
  start.setUTCDate(week1Monday.getUTCDate() + (week - 1) * 7)
  const end = new Date(start)
  end.setUTCDate(start.getUTCDate() + 6)
  end.setUTCHours(23, 59, 59, 999)
  return { start, end }
}

export function currentWeek(): { start: Date; end: Date } {
  const now = new Date()
  const range = parseIsoWeek(isoWeekFor(now))!
  return range
}

export async function computeWeeklyRecap(weekStart: Date, weekEnd: Date): Promise<WeeklyRecap> {
  const supabase = getSupabaseServiceClient()
  const startIso = weekStart.toISOString().slice(0, 10)
  const endIso = weekEnd.toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select(`
      id, slug, summary, statement_date, severity_score, politician_id,
      politicians!inner ( id, slug, common_name, party, state, photo_url ),
      statement_categories ( categories ( slug, label_pt, color_hex ) )
    `)
    .gte('statement_date', startIso)
    .lte('statement_date', endIso)
    .neq('verification_status', 'removed')
    .order('severity_score', { ascending: false, nullsFirst: false })
    .order('statement_date', { ascending: false })
    .limit(2000)

  type Row = {
    id: string
    slug: string | null
    summary: string
    statement_date: string
    severity_score: number | null
    politician_id: string
    politicians: { id: string; slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null }
    statement_categories: Array<{ categories: { slug: string; label_pt: string; color_hex: string | null } | null }>
  }

  const data = (rows ?? []) as Row[]

  const topByseverity: TopStatement[] = data.slice(0, 5).map((r) => ({
    id: r.id,
    slug: r.slug,
    summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    politician_slug: r.politicians.slug,
    politician_name: r.politicians.common_name,
    categories: (r.statement_categories ?? [])
      .map((sc) => sc.categories)
      .filter((c): c is NonNullable<typeof c> => c !== null),
  }))

  // Politicians count
  const polCount = new Map<string, {
    slug: string; common_name: string; party: string | null; state: string | null;
    photo_url: string | null; count: number
  }>()
  for (const r of data) {
    const e = polCount.get(r.politician_id)
    if (e) e.count++
    else {
      polCount.set(r.politician_id, {
        slug: r.politicians.slug,
        common_name: r.politicians.common_name,
        party: r.politicians.party,
        state: r.politicians.state,
        photo_url: r.politicians.photo_url,
        count: 1,
      })
    }
  }
  const topPoliticians = [...polCount.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, 5)

  // Categories count
  const catCount = new Map<string, { slug: string; label_pt: string; color_hex: string | null; count: number }>()
  for (const r of data) {
    for (const sc of r.statement_categories ?? []) {
      const c = sc.categories
      if (!c) continue
      const e = catCount.get(c.slug)
      if (e) e.count++
      else catCount.set(c.slug, { slug: c.slug, label_pt: c.label_pt, color_hex: c.color_hex, count: 1 })
    }
  }
  const topCategories = [...catCount.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, 5)

  return {
    weekStart: startIso,
    weekEnd: endIso,
    isoWeek: isoWeekFor(weekStart),
    totalStatements: data.length,
    topByseverity,
    topPoliticians,
    topCategories,
  }
}
