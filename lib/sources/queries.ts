import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface SourceDomainRow {
  domain: string
  citation_count: number
  politician_count: number
  first_seen: string | null
  last_seen: string | null
}

export interface SourceDomainStatement {
  statement_id: string
  slug: string | null
  summary: string
  statement_date: string
  politician_slug: string
  politician_name: string
  primary_source_url: string
}

export async function listSourceDomains(
  limit = 200,
  offset = 0,
): Promise<SourceDomainRow[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('get_source_domains', {
    result_limit: limit,
    result_offset: offset,
  })
  if (error) throw error
  return (data ?? []) as SourceDomainRow[]
}

export async function getSourceDomainDetail(
  domain: string,
  statementLimit = 20,
): Promise<SourceDomainStatement[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('get_source_domain_detail', {
    domain_name: domain,
    stmt_limit: statementLimit,
  })
  if (error) throw error
  return (data ?? []) as SourceDomainStatement[]
}
