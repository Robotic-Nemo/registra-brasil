/**
 * Saved-search helpers: normalize query shape, produce a stable hash,
 * and reconstruct the Supabase query at notifier-run time.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface SavedSearchQuery {
  q?: string
  politico?: string
  categoria?: string[]
  partido?: string
  estado?: string
  status?: 'verified' | 'unverified' | 'disputed'
  de?: string
  ate?: string
}

/**
 * Normalize + canonicalize a query object so semantically identical
 * searches hash the same. Empty/undefined fields dropped; arrays sorted;
 * keys sorted alphabetically.
 */
export function normalizeQuery(q: SavedSearchQuery): SavedSearchQuery {
  const clean: Record<string, unknown> = {}
  for (const [k, v] of Object.entries(q)) {
    if (v === undefined || v === null || v === '') continue
    if (Array.isArray(v)) {
      const filtered = v.filter((x) => typeof x === 'string' && x.length > 0)
      if (filtered.length === 0) continue
      clean[k] = [...new Set(filtered)].sort()
      continue
    }
    clean[k] = v
  }
  // Sort keys so JSON.stringify emits canonical form
  return Object.fromEntries(Object.keys(clean).sort().map((k) => [k, clean[k]])) as SavedSearchQuery
}

export async function hashQuery(q: SavedSearchQuery): Promise<string> {
  const canonical = JSON.stringify(normalizeQuery(q))
  const enc = new TextEncoder().encode(canonical)
  const buf = await crypto.subtle.digest('SHA-256', enc)
  return Array.from(new Uint8Array(buf))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
    .slice(0, 32)
}

export function queryToSearchString(q: SavedSearchQuery): string {
  const params = new URLSearchParams()
  if (q.q) params.set('q', q.q)
  if (q.politico) params.set('politico', q.politico)
  if (q.partido) params.set('partido', q.partido)
  if (q.estado) params.set('estado', q.estado)
  if (q.status) params.set('status', q.status)
  if (q.de) params.set('de', q.de)
  if (q.ate) params.set('ate', q.ate)
  for (const c of q.categoria ?? []) params.append('categoria', c)
  return params.toString()
}

export function describeQuery(q: SavedSearchQuery): string {
  const parts: string[] = []
  if (q.q) parts.push(`"${q.q}"`)
  if (q.politico) parts.push(`político=${q.politico}`)
  if (q.partido) parts.push(`partido=${q.partido}`)
  if (q.estado) parts.push(`estado=${q.estado}`)
  if (q.categoria?.length) parts.push(`categorias=${q.categoria.join('+')}`)
  if (q.status) parts.push(`status=${q.status}`)
  if (q.de) parts.push(`desde=${q.de}`)
  if (q.ate) parts.push(`até=${q.ate}`)
  return parts.join(' · ') || 'todas as declarações'
}

/**
 * Run a saved search as "what's new since `sinceIso`". Used by the
 * notifier cron. Returns only the minimal fields we need to render
 * notification emails.
 */
export async function runSavedSearchIncremental(
  supabase: SupabaseClient,
  q: SavedSearchQuery,
  sinceIso: string,
  limit = 20,
): Promise<Array<{ id: string; slug: string | null; summary: string; statement_date: string; politician: { common_name: string; slug: string; party: string } | null }>> {
  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, partido:politicians(party, state, slug, common_name), politicians(id, slug, common_name, party, state)')
    .gt('created_at', sinceIso)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (q.q) query = query.textSearch('summary_fts', q.q, { type: 'websearch', config: 'portuguese' }).or(`summary.ilike.%${q.q.replace(/[%_]/g, '')}%`)
  if (q.status) query = query.eq('verification_status', q.status)
  if (q.de) query = query.gte('statement_date', q.de)
  if (q.ate) query = query.lte('statement_date', q.ate)
  if (q.politico) {
    const { data: pol } = await (supabase.from('politicians') as any).select('id').eq('slug', q.politico).maybeSingle()
    if (pol?.id) query = query.eq('politician_id', pol.id)
    else return []
  }
  if (q.partido) query = query.eq('politicians.party', q.partido)
  if (q.estado) query = query.eq('politicians.state', q.estado)

  const { data, error } = await query
  if (error) {
    console.error('[saved-searches] query error:', error)
    return []
  }

  return ((data ?? []) as any[]).map((s) => ({
    id: s.id,
    slug: s.slug,
    summary: s.summary,
    statement_date: s.statement_date,
    politician: s.politicians ? { common_name: s.politicians.common_name, slug: s.politicians.slug, party: s.politicians.party } : null,
  }))
}
