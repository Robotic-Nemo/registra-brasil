'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAdmin() {
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) throw new Error('Unauthorized')
  const cookieStore = await cookies()
  const token = cookieStore.get(SESSION_COOKIE)?.value
  if (!token) throw new Error('Unauthorized')
  const expected = await deriveSessionToken(adminSecret)
  if (!timingSafeEqual(token, expected)) throw new Error('Unauthorized')
}

/**
 * Reject a submission outright. Used for spam, opinion-pieces, or when
 * the evidence link doesn't actually back the stated claim.
 */
export async function rejectSubmission(id: string, reviewerNotes: string) {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('statement_submissions') as any)
    .update({
      status: 'rejected',
      reviewer_notes: reviewerNotes || null,
      reviewed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/submissions')
}

/**
 * Mark a submission as a duplicate — the content is legitimate but
 * already in the archive. Doesn't count as a rejection for submitter
 * reputation purposes.
 */
export async function markDuplicate(id: string, existingStatementId?: string) {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('statement_submissions') as any)
    .update({
      status: 'duplicate',
      resulting_statement_id: existingStatementId || null,
      reviewed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/submissions')
}

/**
 * Approve a submission: creates a real statement row and links back.
 * Requires a valid politician_id (reviewer resolves politician_name_raw
 * beforehand, either by picking an existing politician or creating one
 * via the regular /admin/politicos flow).
 */
export async function approveSubmission(
  id: string,
  politicianId: string,
  verificationStatus: 'verified' | 'unverified' = 'unverified',
) {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()

  const { data: sub, error: fetchErr } = await (supabase.from('statement_submissions') as any)
    .select('*')
    .eq('id', id)
    .single()
  if (fetchErr || !sub) throw new Error('Submission not found')

  const { data: stmt, error: insertErr } = await (supabase.from('statements') as any)
    .insert({
      politician_id: politicianId,
      summary: sub.summary,
      full_quote: sub.full_quote,
      statement_date: sub.statement_date ?? new Date().toISOString().slice(0, 10),
      venue: sub.venue,
      primary_source_url: sub.primary_source_url,
      primary_source_type: 'other',
      verification_status: verificationStatus,
      editor_notes: `Aprovado de submissão pública ${id}`,
    })
    .select('id')
    .single()
  if (insertErr || !stmt) throw new Error(insertErr?.message ?? 'Failed to create statement')

  const { error: updErr } = await (supabase.from('statement_submissions') as any)
    .update({
      status: 'approved',
      resulting_statement_id: stmt.id,
      reviewed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', id)
  if (updErr) throw new Error(updErr.message)

  revalidatePath('/admin/submissions')
}
