import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface SimilarPolitician {
  id: string
  slug: string
  common_name: string
  party: string | null
  state: string | null
  photo_url: string | null
  similarity: number
  shared_categories: number
}

export async function getSimilarPoliticians(
  politicianId: string,
  limit = 6,
): Promise<SimilarPolitician[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('similar_politicians', {
    pid: politicianId,
    result_limit: limit,
  })
  if (error) return []
  return (data ?? []) as SimilarPolitician[]
}
