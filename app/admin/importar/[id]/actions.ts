'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAdmin() {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
}

/**
 * Revert a batch: soft-delete every statement it produced (verification
 * status → 'removed'). The revision trigger from migration 011 records
 * the change automatically for each row, so the audit trail includes
 * the revert.
 *
 * We annotate each UPDATE with a Postgres session GUC so the trigger
 * knows who did it and why.
 */
export async function revertBatch(batchId: string, reason: string): Promise<void> {
  await assertAdmin()
  const trimmedReason = reason.trim().slice(0, 300)
  if (trimmedReason.length < 3) throw new Error('Motivo muito curto')

  const supabase = getSupabaseServiceClient()

  // Annotate the revision trigger via SECURITY DEFINER helper (mig 016).
  await (supabase as any).rpc('set_revision_annotation', {
    reason: `Reverso de lote ${batchId.slice(0, 8)}: ${trimmedReason}`,
    actor: 'admin:revert-batch',
  }).catch((e: unknown) => {
    console.error('[revert] annotate failed:', e)
    // Non-fatal — trigger still records with default 'admin' actor.
  })

  // Soft-delete every still-active statement in the batch. Already-removed
  // rows are left alone (no-op on same value).
  const { error: updErr, count } = await (supabase.from('statements') as any)
    .update({
      verification_status: 'removed',
      editor_notes: `Reverso de lote ${batchId.slice(0, 8)}: ${trimmedReason}`,
      updated_at: new Date().toISOString(),
    }, { count: 'exact' })
    .eq('import_batch_id', batchId)
    .neq('verification_status', 'removed')

  if (updErr) throw new Error(updErr.message)

  const { error: batchErr } = await (supabase.from('import_batches') as any)
    .update({
      status: 'reverted',
      note: (supabase as any).raw ? undefined : undefined, // keep existing note
    })
    .eq('id', batchId)

  if (batchErr) throw new Error(batchErr.message)

  revalidatePath('/admin/importar')
  revalidatePath(`/admin/importar/${batchId}`)
  void count // silence unused
  redirect(`/admin/importar/${batchId}`)
}
