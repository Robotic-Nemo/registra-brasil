/**
 * DB-persisted site-setting reader/writer. Values live in the
 * `site_settings` table and are cached in-process for 60s. Separate
 * from `lib/utils/settings.ts` (which handles env-var-backed settings).
 */

import { getSupabaseServiceClient } from '@/lib/supabase/server'

interface CacheEntry { value: unknown; at: number }
const cache = new Map<string, CacheEntry>()
const TTL_MS = 60_000

export async function getSetting<T>(key: string, fallback: T): Promise<T> {
  const now = Date.now()
  const hit = cache.get(key)
  if (hit && now - hit.at < TTL_MS) return hit.value as T

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('site_settings') as any)
    .select('value')
    .eq('key', key)
    .maybeSingle()

  if (error || !data) {
    cache.set(key, { value: fallback, at: now })
    return fallback
  }
  cache.set(key, { value: data.value, at: now })
  return data.value as T
}

export function invalidateSetting(key?: string) {
  if (key) cache.delete(key)
  else cache.clear()
}

export interface MaintenanceBanner {
  enabled: boolean
  text: string
  tone: 'info' | 'warn' | 'critical'
}

export async function getMaintenanceBanner(): Promise<MaintenanceBanner | null> {
  const v = await getSetting<MaintenanceBanner>('maintenance_banner', { enabled: false, text: '', tone: 'info' })
  if (!v?.enabled || !v.text?.trim()) return null
  return v
}

export async function getFooterMessage(): Promise<string> {
  return await getSetting<string>('footer_message', '')
}
