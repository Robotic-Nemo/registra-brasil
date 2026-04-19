import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface DayStatement {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  severity_score: number | null
  verification_status: string
  politician_slug: string
  politician_name: string
  politician_party: string | null
  politician_state: string | null
  politician_photo_url: string | null
}

export async function statementsOnDayOfYear(month: number, day: number, limit = 200): Promise<DayStatement[]> {
  const supabase = getSupabaseServiceClient()
  const mmdd = month * 100 + day
  const { data, error } = await (supabase.rpc as any)('statements_on_day_of_year', {
    mmdd, result_limit: limit,
  })
  if (error) return []
  return ((data ?? []) as any[]).map((r) => ({
    id: r.id,
    slug: r.slug,
    summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    verification_status: r.verification_status,
    politician_slug: r.politician_slug,
    politician_name: r.politician_name,
    politician_party: r.politician_party,
    politician_state: r.politician_state,
    politician_photo_url: r.politician_photo_url,
  }))
}

const MONTH_NAMES = [
  'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
  'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro',
]

export function todayDateLabel(month: number, day: number): string {
  return `${day} de ${MONTH_NAMES[month - 1]}`
}

export function parseDateParam(str: string): { month: number; day: number } | null {
  const m = str.match(/^(\d{2})-(\d{2})$/)
  if (!m) return null
  const month = Number(m[1])
  const day = Number(m[2])
  if (month < 1 || month > 12) return null
  if (day < 1 || day > 31) return null
  return { month, day }
}

export function formatDateParam(month: number, day: number): string {
  return `${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`
}
