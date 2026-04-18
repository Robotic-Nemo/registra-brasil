'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { updateStatementStatus } from '@/lib/supabase/queries/statements'
import { scanForScandals } from '@/lib/scanner'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAuthenticated() {
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) throw new Error('Unauthorized')
  const cookieStore = await cookies()
  const token = cookieStore.get(SESSION_COOKIE)?.value
  if (!token) throw new Error('Unauthorized')
  const expectedToken = await deriveSessionToken(adminSecret)
  if (!timingSafeEqual(token, expectedToken)) throw new Error('Unauthorized')
}

const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

function assertUuid(id: unknown): string {
  if (typeof id !== 'string' || !UUID_PATTERN.test(id)) {
    throw new Error('Invalid statement id')
  }
  return id
}

function revalidateAfterStatusChange() {
  // Pages that surface verified-count or status indicators.
  revalidatePath('/admin')
  revalidatePath('/')
  revalidatePath('/buscar')
  revalidatePath('/declaracoes-recentes')
  revalidatePath('/estatisticas')
  revalidatePath('/retratacoes')
}

export async function verifyStatement(id: string) {
  await assertAuthenticated()
  const safeId = assertUuid(id)
  const supabase = getSupabaseServiceClient()
  await updateStatementStatus(supabase, safeId, 'verified')
  revalidateAfterStatusChange()
}

export async function disputeStatement(id: string) {
  await assertAuthenticated()
  const safeId = assertUuid(id)
  const supabase = getSupabaseServiceClient()
  await updateStatementStatus(supabase, safeId, 'disputed')
  revalidateAfterStatusChange()
}

export async function removeStatement(id: string) {
  await assertAuthenticated()
  const safeId = assertUuid(id)
  const supabase = getSupabaseServiceClient()
  await updateStatementStatus(supabase, safeId, 'removed')
  revalidateAfterStatusChange()
}

type BulkStatus = 'verified' | 'disputed' | 'removed'

/**
 * Apply `status` to every `ids[]` in a single UPDATE. Runs
 * `set_revision_annotation` first so the revision trigger records
 * the batch reason against every row. Returns count affected.
 *
 * Sanity guard: rejects > 200 ids per call to keep the revision
 * trigger output bounded.
 */
export async function bulkChangeStatus(
  ids: string[],
  status: BulkStatus,
  reason: string,
): Promise<{ updated: number }> {
  await assertAuthenticated()
  if (!Array.isArray(ids) || ids.length === 0) throw new Error('Nenhum ID selecionado.')
  if (ids.length > 200) throw new Error('Limite de 200 itens por lote.')
  const trimmed = (reason ?? '').trim().slice(0, 300)
  if (trimmed.length < 3) throw new Error('Informe um motivo (≥3 caracteres).')
  const valid = ids.every((i) => UUID_PATTERN.test(i))
  if (!valid) throw new Error('ID inválido na seleção.')
  if (!['verified', 'disputed', 'removed'].includes(status)) throw new Error('Status inválido.')

  const supabase = getSupabaseServiceClient()

  await (supabase as any).rpc('set_revision_annotation', {
    reason: `Lote ${status}: ${trimmed}`,
    actor: 'admin:bulk-review',
  }).catch(() => {})

  const { error, count } = await (supabase.from('statements') as any)
    .update({ verification_status: status, updated_at: new Date().toISOString() }, { count: 'exact' })
    .in('id', ids)

  if (error) throw new Error(error.message)
  revalidateAfterStatusChange()
  return { updated: count ?? 0 }
}

export async function triggerScan(dryRun: boolean): Promise<{
  ok: boolean
  inserted?: number
  skipped?: number
  errors?: number
  elapsed_ms?: number
  error?: string
}> {
  await assertAuthenticated()
  const startTime = Date.now()
  try {
    const result = await scanForScandals({
      dryRun,
      limit: 5,
      verbose: false,
    })
    revalidatePath('/admin')
    return {
      ok: true,
      inserted: result.inserted,
      skipped: result.skipped,
      errors: result.errors,
      elapsed_ms: Date.now() - startTime,
    }
  } catch (err) {
    return {
      ok: false,
      error: err instanceof Error ? err.message : 'Erro desconhecido',
      elapsed_ms: Date.now() - startTime,
    }
  }
}
