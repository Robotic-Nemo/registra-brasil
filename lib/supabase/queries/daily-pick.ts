import type { SupabaseClient } from '@supabase/supabase-js'

export interface DailyPickedStatement {
  pickDate: string
  curatorNote: string | null
  isManual: boolean
  statement: {
    id: string
    slug: string | null
    summary: string
    full_quote: string | null
    statement_date: string
    severity_score: number | null
    verification_status: string
    primary_source_url: string
    politicians: { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null } | null
  }
}

function todayIso(): string {
  return new Date().toISOString().slice(0, 10)
}

/**
 * Find today's pick. First tries the `daily_picks` table; if no row
 * for today, picks the highest-severity verified statement from the
 * last 30 days as an editorial fallback — so the homepage widget is
 * never empty.
 */
export async function getTodaysPick(supabase: SupabaseClient): Promise<DailyPickedStatement | null> {
  const today = todayIso()

  // Try manual pick first
  const { data: manual } = await (supabase.from('daily_picks') as any)
    .select('pick_date, curator_note, statements(id, slug, summary, full_quote, statement_date, severity_score, verification_status, primary_source_url, politicians(id, slug, common_name, party, state, photo_url))')
    .eq('pick_date', today)
    .maybeSingle()

  if (manual?.statements) {
    return {
      pickDate: today,
      curatorNote: manual.curator_note ?? null,
      isManual: true,
      statement: manual.statements,
    }
  }

  // Fallback: highest-severity verified in the last 30 days
  const thirtyAgo = new Date(Date.now() - 30 * 86400_000).toISOString().slice(0, 10)
  const { data: auto } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, severity_score, verification_status, primary_source_url, politicians(id, slug, common_name, party, state, photo_url)')
    .eq('verification_status', 'verified')
    .gte('statement_date', thirtyAgo)
    .not('severity_score', 'is', null)
    .order('severity_score', { ascending: false })
    .order('statement_date', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!auto) return null
  return { pickDate: today, curatorNote: null, isManual: false, statement: auto }
}

export async function getRecentPicks(supabase: SupabaseClient, limit = 30): Promise<DailyPickedStatement[]> {
  const { data } = await (supabase.from('daily_picks') as any)
    .select('pick_date, curator_note, statements(id, slug, summary, full_quote, statement_date, severity_score, verification_status, primary_source_url, politicians(id, slug, common_name, party, state, photo_url))')
    .order('pick_date', { ascending: false })
    .limit(limit)

  return ((data ?? []) as any[])
    .filter((r) => r.statements)
    .map((r) => ({
      pickDate: r.pick_date,
      curatorNote: r.curator_note ?? null,
      isManual: true,
      statement: r.statements,
    }))
}
