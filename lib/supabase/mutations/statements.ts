'use server'

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import type { Statement, VerificationStatus, SourceType } from '@/types/database'

export interface StatementInput {
  politician_id: string
  summary: string
  full_quote?: string | null
  context?: string | null
  verification_status: VerificationStatus
  is_featured?: boolean
  statement_date: string
  statement_date_approx?: boolean
  primary_source_url: string
  primary_source_type: SourceType
  youtube_video_id?: string | null
  youtube_timestamp_sec?: number | null
  youtube_channel_id?: string | null
  transcript_excerpt?: string | null
  venue?: string | null
  event_name?: string | null
  editor_notes?: string | null
  slug?: string | null
}

export async function updateStatement(id: string, input: Partial<StatementInput>) {
  const supabase = getSupabaseServiceClient()

  const { data, error } = await (supabase
    .from('statements') as any)
    .update({ ...input, updated_at: new Date().toISOString() })
    .eq('id', id)
    .select()
    .single()

  if (error) {
    return { success: false as const, error: error.message }
  }

  const statement = data as Statement
  revalidatePath('/admin')
  revalidatePath('/admin/statements')
  revalidatePath(`/declaracao/${statement.slug ?? statement.id}`)
  return { success: true as const, data: statement }
}

export async function deleteStatement(id: string) {
  const supabase = getSupabaseServiceClient()

  // First get the statement to know what paths to revalidate
  const { data: existing } = await supabase
    .from('statements')
    .select('slug, politician_id, politicians(slug)')
    .eq('id', id)
    .single()

  const { error } = await supabase
    .from('statements')
    .delete()
    .eq('id', id)

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin')
  revalidatePath('/admin/statements')
  if (existing) {
    const politician = (existing as unknown as { politicians: { slug: string } }).politicians
    if (politician?.slug) {
      revalidatePath(`/politico/${politician.slug}`)
    }
  }
  return { success: true as const }
}

export async function bulkUpdateStatementStatus(
  ids: string[],
  status: VerificationStatus
) {
  const supabase = getSupabaseServiceClient()

  const { error } = await (supabase
    .from('statements') as any)
    .update({ verification_status: status, updated_at: new Date().toISOString() })
    .in('id', ids)

  if (error) {
    return { success: false as const, error: error.message }
  }

  revalidatePath('/admin')
  return { success: true as const }
}
