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
 * Merge statement B into A.
 *
 * - Applies user-chosen field values to A.
 * - Re-parents B's secondary rows (fact_checks, reactions, collection_statements,
 *   story_statements, retraction_requests.statement_id, submissions.resulting_statement_id)
 *   to A, dropping rows that would violate unique constraints.
 * - Soft-removes B (verification_status = 'removed') with a note pointing at A.
 * - Annotates revision trigger so both rows' revisions explain "Merge de B em A".
 */
export async function mergeStatements(input: {
  keeper_id: string
  removed_id: string
  field_values: Record<string, unknown>
  reason: string
}): Promise<void> {
  await assertAdmin()
  if (input.keeper_id === input.removed_id) throw new Error('IDs iguais.')
  const trimmed = input.reason.trim().slice(0, 300)
  if (trimmed.length < 3) throw new Error('Motivo muito curto.')

  const supabase = getSupabaseServiceClient()

  // Annotate trigger once; subsequent UPDATEs in this request re-use it.
  await (supabase as any).rpc('set_revision_annotation', {
    reason: `Merge: ${input.removed_id.slice(0, 8)} → ${input.keeper_id.slice(0, 8)}. ${trimmed}`,
    actor: 'admin:merge',
  }).catch(() => {})

  // Re-parent secondary rows. Order matters: do the ones with unique constraints
  // (fact_checks URL per statement, reactions per IP per reaction) with a
  // conflict-safe strategy — delete dupes on B, then move unique ones.

  // fact_checks: drop any URL on B that already exists on A, then re-parent rest.
  const { data: aFcs } = await (supabase.from('statement_fact_checks') as any)
    .select('url').eq('statement_id', input.keeper_id)
  const aFcUrls = new Set<string>(((aFcs ?? []) as { url: string }[]).map((x) => x.url))
  if (aFcUrls.size > 0) {
    await (supabase.from('statement_fact_checks') as any)
      .delete().eq('statement_id', input.removed_id).in('url', [...aFcUrls])
  }
  await (supabase.from('statement_fact_checks') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)

  // reactions: drop any (ip_hash, reaction) pair already present on A.
  const { data: aRx } = await (supabase.from('statement_reactions') as any)
    .select('submitter_ip_hash, reaction').eq('statement_id', input.keeper_id)
  for (const r of (aRx ?? []) as Array<{ submitter_ip_hash: string; reaction: string }>) {
    await (supabase.from('statement_reactions') as any)
      .delete()
      .eq('statement_id', input.removed_id)
      .eq('submitter_ip_hash', r.submitter_ip_hash)
      .eq('reaction', r.reaction)
  }
  await (supabase.from('statement_reactions') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)

  // collection_statements + story_statements: composite PK on (owner, statement)
  // so dupes would fail. Drop overlaps, then re-parent.
  const { data: aColl } = await (supabase.from('collection_statements') as any)
    .select('collection_id').eq('statement_id', input.keeper_id)
  for (const r of (aColl ?? []) as Array<{ collection_id: string }>) {
    await (supabase.from('collection_statements') as any)
      .delete().eq('statement_id', input.removed_id).eq('collection_id', r.collection_id)
  }
  await (supabase.from('collection_statements') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)

  const { data: aStories } = await (supabase.from('story_statements') as any)
    .select('story_id').eq('statement_id', input.keeper_id)
  for (const r of (aStories ?? []) as Array<{ story_id: string }>) {
    await (supabase.from('story_statements') as any)
      .delete().eq('statement_id', input.removed_id).eq('story_id', r.story_id)
  }
  await (supabase.from('story_statements') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)

  // retraction_requests + submissions just need a statement_id bump.
  await (supabase.from('retraction_requests') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)
  await (supabase.from('statement_submissions') as any)
    .update({ resulting_statement_id: input.keeper_id })
    .eq('resulting_statement_id', input.removed_id)
  await (supabase.from('statement_submissions') as any)
    .update({ similar_statement_id: input.keeper_id })
    .eq('similar_statement_id', input.removed_id)

  // statement_categories: (statement_id, category_id) PK.
  const { data: aCats } = await (supabase.from('statement_categories') as any)
    .select('category_id').eq('statement_id', input.keeper_id)
  const aCatIds = new Set(((aCats ?? []) as { category_id: string }[]).map((x) => x.category_id))
  if (aCatIds.size > 0) {
    await (supabase.from('statement_categories') as any)
      .delete().eq('statement_id', input.removed_id).in('category_id', [...aCatIds])
  }
  await (supabase.from('statement_categories') as any)
    .update({ statement_id: input.keeper_id })
    .eq('statement_id', input.removed_id)

  // Finally: apply user-chosen field values to the keeper + soft-remove B.
  const updatePatch: Record<string, unknown> = {
    ...input.field_values,
    updated_at: new Date().toISOString(),
  }
  const { error: keepErr } = await (supabase.from('statements') as any)
    .update(updatePatch)
    .eq('id', input.keeper_id)
  if (keepErr) throw new Error(`Keeper update: ${keepErr.message}`)

  const { error: rmErr } = await (supabase.from('statements') as any)
    .update({
      verification_status: 'removed',
      editor_notes: `Merged into ${input.keeper_id}: ${trimmed}`,
      updated_at: new Date().toISOString(),
    })
    .eq('id', input.removed_id)
  if (rmErr) throw new Error(`Remove update: ${rmErr.message}`)

  revalidatePath('/admin/duplicatas')
  revalidatePath(`/admin/editar/${input.keeper_id}`)
  revalidatePath(`/admin/editar/${input.removed_id}`)
  redirect(`/admin/editar/${input.keeper_id}`)
}
