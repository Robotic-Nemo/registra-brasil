import type { SupabaseClient } from '@supabase/supabase-js'

export interface TimelineEntry {
  id: string
  type: 'statement' | 'verification' | 'dispute'
  date: string
  summary: string
  politicianName: string
  politicianSlug: string
  categoryLabel?: string
  categoryColor?: string
}

/**
 * Get a chronological timeline of events for a politician
 */
export async function getPoliticianTimeline(
  supabase: SupabaseClient,
  slug: string,
  limit = 50
): Promise<TimelineEntry[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(`
      id, summary, statement_date, verification_status, reviewed_at,
      politicians!inner (slug, common_name),
      statement_categories (
        is_primary,
        categories (label_pt, color_hex)
      )
    `)
    .eq('politicians.slug', slug)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error || !data) return []

  return data.map((s: Record<string, unknown>) => {
    const pol = s.politicians as { slug: string; common_name: string }
    const cats = s.statement_categories as { is_primary: boolean; categories: { label_pt: string; color_hex: string } }[]
    const primaryCat = cats?.find(c => c.is_primary)?.categories

    let type: TimelineEntry['type'] = 'statement'
    if (s.verification_status === 'verified') type = 'verification'
    if (s.verification_status === 'disputed') type = 'dispute'

    return {
      id: s.id as string,
      type,
      date: s.statement_date as string,
      summary: s.summary as string,
      politicianName: pol?.common_name ?? '',
      politicianSlug: pol?.slug ?? '',
      categoryLabel: primaryCat?.label_pt,
      categoryColor: primaryCat?.color_hex,
    }
  })
}

/**
 * Get a global timeline of recent events
 */
export async function getGlobalTimeline(
  supabase: SupabaseClient,
  limit = 30
): Promise<TimelineEntry[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(`
      id, summary, statement_date, verification_status,
      politicians (slug, common_name),
      statement_categories (
        is_primary,
        categories (label_pt, color_hex)
      )
    `)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error || !data) return []

  return data.map((s: Record<string, unknown>) => {
    const pol = s.politicians as { slug: string; common_name: string } | null
    const cats = s.statement_categories as { is_primary: boolean; categories: { label_pt: string; color_hex: string } }[]
    const primaryCat = cats?.find(c => c.is_primary)?.categories

    return {
      id: s.id as string,
      type: 'statement' as const,
      date: s.statement_date as string,
      summary: s.summary as string,
      politicianName: pol?.common_name ?? '',
      politicianSlug: pol?.slug ?? '',
      categoryLabel: primaryCat?.label_pt,
      categoryColor: primaryCat?.color_hex,
    }
  })
}
