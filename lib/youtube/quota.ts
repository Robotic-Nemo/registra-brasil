import { getSupabaseServiceClient } from '@/lib/supabase/server'

const DAILY_LIMIT = Number(process.env.YOUTUBE_DAILY_QUOTA_LIMIT ?? 9000)
// Conservative buffer: reserve 5% to absorb race conditions
const SAFETY_BUFFER = Math.ceil(DAILY_LIMIT * 0.05)

export async function getQuotaUsedToday(): Promise<number> {
  const supabase = getSupabaseServiceClient()
  const today = new Date().toISOString().slice(0, 10)

  const { data } = await supabase
    .from('youtube_quota_log')
    .select('units_used')
    .eq('date', today)

  return (data ?? []).reduce((sum: number, row: { units_used: number }) => sum + row.units_used, 0)
}

export async function hasQuotaAvailable(needed = 100): Promise<boolean> {
  const used = await getQuotaUsedToday()
  // Apply safety buffer to reduce window for race conditions
  return used + needed + SAFETY_BUFFER <= DAILY_LIMIT
}

export async function logQuotaUsage(endpoint: string, units: number, query?: string) {
  const supabase = getSupabaseServiceClient()
  // Log before returning result — ensures usage is recorded even if caller crashes
  await supabase.from('youtube_quota_log').insert({
    endpoint,
    units_used: units,
    query,
  } as any)
}

export async function getQuotaRemaining(): Promise<number> {
  const used = await getQuotaUsedToday()
  return Math.max(0, DAILY_LIMIT - used - SAFETY_BUFFER)
}
