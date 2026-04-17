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
