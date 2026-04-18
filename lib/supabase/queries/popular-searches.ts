/**
 * Public "popular searches" queries — shared between the homepage
 * widget and the dedicated /buscas-populares page. All results are
 * server-rendered and cached at the page level; nothing exposes
 * per-reader data.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface PopularQuery {
  q: string
  hits: number
  last_result_count: number | null
  last_seen_at: string
}

export async function getPopularSearches(
  supabase: SupabaseClient,
  opts: { days?: number; limit?: number; minHits?: number } = {},
): Promise<PopularQuery[]> {
  const { days = 7, limit = 10, minHits = 2 } = opts
  const since = new Date(Date.now() - days * 86400_000).toISOString().slice(0, 10)

  const { data } = await (supabase.from('search_queries') as any)
    .select('q_normalized, hits, last_result_count, last_seen_at')
    .gte('day', since)
    .order('hits', { ascending: false })
    .limit(200)

  type Row = { q_normalized: string; hits: number; last_result_count: number | null; last_seen_at: string }
  const byQ = new Map<string, PopularQuery>()
  for (const r of ((data ?? []) as Row[])) {
    const ex = byQ.get(r.q_normalized) ?? { q: r.q_normalized, hits: 0, last_result_count: r.last_result_count, last_seen_at: r.last_seen_at }
    ex.hits += r.hits
    if (r.last_seen_at > ex.last_seen_at) {
      ex.last_seen_at = r.last_seen_at
      ex.last_result_count = r.last_result_count
    }
    byQ.set(r.q_normalized, ex)
  }

  return [...byQ.values()]
    .filter((q) => q.hits >= minHits && (q.last_result_count ?? 1) > 0)
    .sort((a, b) => b.hits - a.hits)
    .slice(0, limit)
}

export async function getZeroResultSearches(
  supabase: SupabaseClient,
  opts: { days?: number; limit?: number; minHits?: number } = {},
): Promise<PopularQuery[]> {
  const { days = 30, limit = 20, minHits = 2 } = opts
  const since = new Date(Date.now() - days * 86400_000).toISOString().slice(0, 10)

  const { data } = await (supabase.from('search_queries') as any)
    .select('q_normalized, hits, last_result_count, last_seen_at')
    .gte('day', since)
    .eq('last_result_count', 0)
    .order('hits', { ascending: false })
    .limit(200)

  type Row = { q_normalized: string; hits: number; last_result_count: number | null; last_seen_at: string }
  const byQ = new Map<string, PopularQuery>()
  for (const r of ((data ?? []) as Row[])) {
    const ex = byQ.get(r.q_normalized) ?? { q: r.q_normalized, hits: 0, last_result_count: 0, last_seen_at: r.last_seen_at }
    ex.hits += r.hits
    if (r.last_seen_at > ex.last_seen_at) ex.last_seen_at = r.last_seen_at
    byQ.set(r.q_normalized, ex)
  }

  return [...byQ.values()]
    .filter((q) => q.hits >= minHits)
    .sort((a, b) => b.hits - a.hits)
    .slice(0, limit)
}
