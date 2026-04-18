'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { invalidateSetting } from '@/lib/utils/db-settings'

async function assertAdmin() {
  const secret = process.env.ADMIN_SECRET
  if (!secret) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  const expected = await deriveSessionToken(secret)
  if (!timingSafeEqual(t, expected)) throw new Error('Unauthorized')
}

export async function saveSetting(key: string, value: unknown): Promise<void> {
  await assertAdmin()
  if (typeof key !== 'string' || key.length < 2 || key.length > 80) {
    throw new Error('Chave inválida.')
  }
  // Cheap JSON sanity check
  try { JSON.stringify(value) } catch { throw new Error('Valor inválido.') }

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('site_settings') as any)
    .upsert(
      { key, value, updated_at: new Date().toISOString(), updated_by: 'admin' },
      { onConflict: 'key' },
    )
  if (error) throw new Error(error.message)

  invalidateSetting(key)
  revalidatePath('/', 'layout')
}
