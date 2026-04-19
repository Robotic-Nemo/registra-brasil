import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface RevisionEntry {
  revision_id: string
  statement_id: string
  statement_slug: string | null
  statement_summary: string
  politician_slug: string
  politician_name: string
  revision_number: number
  changed_keys: string[]
  reason: string | null
  created_at: string
}

export async function getPublicRevisionFeed(limit = 100): Promise<RevisionEntry[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('public_revision_feed', {
    result_limit: limit,
  })
  if (error) throw error
  return (data ?? []) as RevisionEntry[]
}

/**
 * Human-friendly relabel for field names that appear in changed_keys.
 * Unknown keys fall through verbatim.
 */
const FIELD_LABELS: Record<string, string> = {
  summary: 'resumo',
  full_quote: 'citação completa',
  context: 'contexto',
  verification_status: 'status de verificação',
  severity_score: 'gravidade editorial',
  primary_source_url: 'fonte primária',
  primary_source_type: 'tipo de fonte',
  secondary_sources: 'fontes secundárias',
  venue: 'local',
  event_name: 'evento',
  statement_date: 'data',
  statement_date_approx: 'data aproximada',
  editor_notes: 'notas editoriais',
  youtube_video_id: 'vídeo YouTube',
  youtube_timestamp_sec: 'timestamp YouTube',
  youtube_channel_id: 'canal YouTube',
  transcript_excerpt: 'trecho do transcript',
  is_featured: 'destaque',
  slug: 'slug',
  categories: 'categorias',
}

export function labelField(key: string): string {
  return FIELD_LABELS[key] ?? key
}
