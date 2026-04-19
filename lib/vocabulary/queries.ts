import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface CorpusRow {
  summary: string
  full_quote: string | null
  transcript_excerpt: string | null
}

/**
 * Fetch the corpus of non-removed statements for a politician.
 * Pages through Supabase in 1000-row chunks so politicians with
 * many statements still load, but caps at 20k statements to keep
 * SSR under ~2s on the happy path.
 */
export async function fetchPoliticianCorpus(politicianId: string): Promise<CorpusRow[]> {
  const supabase = getSupabaseServiceClient()
  const CHUNK = 1000
  const CAP = 20000
  const all: CorpusRow[] = []

  for (let offset = 0; offset < CAP; offset += CHUNK) {
    const { data, error } = await (supabase.from('statements') as any)
      .select('summary, full_quote, transcript_excerpt')
      .eq('politician_id', politicianId)
      .neq('verification_status', 'removed')
      .range(offset, offset + CHUNK - 1)
    if (error) throw error
    const rows = (data ?? []) as CorpusRow[]
    all.push(...rows)
    if (rows.length < CHUNK) break
  }
  return all
}

/**
 * Archive-wide token counts, pulled from a small sample of ~5k statements
 * (newest first) to keep this query fast. For over-index comparison we
 * don't need the entire corpus; 5k summaries is already a robust baseline.
 */
export async function fetchArchiveSample(): Promise<CorpusRow[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('summary, full_quote, transcript_excerpt')
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(5000)
  if (error) throw error
  return (data ?? []) as CorpusRow[]
}

export function corpusText(rows: CorpusRow[]): string {
  const parts: string[] = []
  for (const r of rows) {
    parts.push(r.summary)
    if (r.full_quote) parts.push(r.full_quote)
    if (r.transcript_excerpt) parts.push(r.transcript_excerpt)
  }
  return parts.join('\n')
}
