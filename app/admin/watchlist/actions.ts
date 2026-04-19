'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAdmin(): Promise<string> {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
  return c.get('admin_user')?.value ?? 'admin'
}

const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export async function addToWatchlist(input: {
  politician_id: string
  priority: number
  reason?: string
}): Promise<void> {
  const who = await assertAdmin()
  if (!UUID.test(input.politician_id)) throw new Error('politician_id inválido')
  const priority = Math.max(1, Math.min(4, Math.round(input.priority)))
  const supabase = getSupabaseServiceClient()

  const { error } = await (supabase.from('admin_watchlist') as any)
    .upsert(
      {
        politician_id: input.politician_id,
        priority,
        reason: input.reason?.trim().slice(0, 1000) || null,
        added_by: who,
      },
      { onConflict: 'politician_id' },
    )
  if (error) throw new Error(error.message)
  revalidatePath('/admin/watchlist')
  revalidatePath('/admin')
}

export async function removeFromWatchlist(politicianId: string): Promise<void> {
  await assertAdmin()
  if (!UUID.test(politicianId)) throw new Error('politician_id inválido')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('admin_watchlist') as any)
    .delete()
    .eq('politician_id', politicianId)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/watchlist')
  revalidatePath('/admin')
}

export async function updatePriority(politicianId: string, priority: number): Promise<void> {
  await assertAdmin()
  if (!UUID.test(politicianId)) throw new Error('politician_id inválido')
  const p = Math.max(1, Math.min(4, Math.round(priority)))
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('admin_watchlist') as any)
    .update({ priority: p })
    .eq('politician_id', politicianId)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/watchlist')
}
