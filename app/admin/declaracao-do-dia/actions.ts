'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
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

const DATE_RE = /^\d{4}-\d{2}-\d{2}$/
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const SLUG_RE = /^[a-z0-9][a-z0-9-]*[a-z0-9]$/

export async function schedulePick(input: {
  pick_date: string
  identifier: string // UUID or slug
  note?: string
}): Promise<void> {
  await assertAdmin()
  if (!DATE_RE.test(input.pick_date)) throw new Error('Data inválida (YYYY-MM-DD).')

  const supabase = getSupabaseServiceClient()

  // Resolve identifier → statement id.
  let statementId: string | null = null
  if (UUID_RE.test(input.identifier)) {
    const { data } = await (supabase.from('statements') as any)
      .select('id').eq('id', input.identifier).maybeSingle()
    statementId = data?.id ?? null
  } else if (SLUG_RE.test(input.identifier)) {
    const { data } = await (supabase.from('statements') as any)
      .select('id').eq('slug', input.identifier).maybeSingle()
    statementId = data?.id ?? null
  }
  if (!statementId) throw new Error('Declaração não encontrada.')

  const { error } = await (supabase.from('daily_picks') as any).upsert({
    pick_date: input.pick_date,
    statement_id: statementId,
    curator_note: input.note?.trim().slice(0, 500) || null,
    created_by: 'admin',
  }, { onConflict: 'pick_date' })
  if (error) throw new Error(error.message)

  revalidatePath('/admin/declaracao-do-dia')
  revalidatePath('/declaracao-do-dia')
  revalidatePath('/')
}

export async function deletePick(pickDate: string): Promise<void> {
  await assertAdmin()
  if (!DATE_RE.test(pickDate)) throw new Error('Data inválida.')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('daily_picks') as any).delete().eq('pick_date', pickDate)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/declaracao-do-dia')
  revalidatePath('/declaracao-do-dia')
  revalidatePath('/')
}
