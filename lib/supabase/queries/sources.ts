import type { SupabaseClient } from '@supabase/supabase-js'
import type { SourceType } from '@/types/database'

export interface SourceInfo {
  id: string
  summary: string
  politician_name: string
  primary_source_url: string
  primary_source_type: SourceType
  statement_date: string
  verification_status: string
}

export interface SourceStats {
  type: SourceType
  count: number
}

export async function getAllSources(
  supabase: SupabaseClient,
  opts: {
    page?: number
    limit?: number
    sourceType?: SourceType
    search?: string
    sortBy?: 'date' | 'type' | 'politician'
    sortDir?: 'asc' | 'desc'
  } = {}
): Promise<{ sources: SourceInfo[]; total: number }> {
  const page = opts.page ?? 1
  const limit = opts.limit ?? 25
  const offset = (page - 1) * limit

  let query = supabase
    .from('statements')
    .select('id, summary, primary_source_url, primary_source_type, statement_date, verification_status, politicians(common_name)', { count: 'exact' })
    .neq('verification_status', 'removed')

  if (opts.sourceType) {
    query = query.eq('primary_source_type', opts.sourceType)
  }

  if (opts.search) {
    query = query.ilike('primary_source_url', `%${opts.search}%`)
  }

  const sortCol = opts.sortBy === 'type' ? 'primary_source_type' : 'statement_date'
  query = query.order(sortCol, { ascending: opts.sortDir === 'asc' })
  query = query.range(offset, offset + limit - 1)

  const { data, count, error } = await query

  if (error) return { sources: [], total: 0 }

  const sources: SourceInfo[] = (data ?? []).map((row: unknown) => {
    const r = row as {
      id: string
      summary: string
      primary_source_url: string
      primary_source_type: SourceType
      statement_date: string
      verification_status: string
      politicians: { common_name: string }
    }
    return {
      id: r.id,
      summary: r.summary,
      politician_name: r.politicians?.common_name ?? 'Desconhecido',
      primary_source_url: r.primary_source_url,
      primary_source_type: r.primary_source_type,
      statement_date: r.statement_date,
      verification_status: r.verification_status,
    }
  })

  return { sources, total: count ?? 0 }
}

export async function getSourceStats(supabase: SupabaseClient): Promise<SourceStats[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('primary_source_type')
    .neq('verification_status', 'removed')

  if (error || !data) return []

  const counts = new Map<string, number>()
  for (const row of data as { primary_source_type: string }[]) {
    const type = row.primary_source_type
    counts.set(type, (counts.get(type) ?? 0) + 1)
  }

  return Array.from(counts.entries())
    .sort((a, b) => b[1] - a[1])
    .map(([type, count]) => ({ type: type as SourceType, count }))
}

export async function getSourceUrls(
  supabase: SupabaseClient,
  limit = 100
): Promise<{ id: string; url: string }[]> {
  const { data, error } = await supabase
    .from('statements')
    .select('id, primary_source_url')
    .neq('verification_status', 'removed')
    .not('primary_source_url', 'is', null)
    .limit(limit)

  if (error || !data) return []

  return (data as { id: string; primary_source_url: string }[]).map((r) => ({
    id: r.id,
    url: r.primary_source_url,
  }))
}
