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

const VALID = new Set(['open', 'acknowledged', 'resolved', 'spam'])
const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export async function setIssueStatus(id: string, status: string, note?: string): Promise<void> {
  const who = await assertAdmin()
  if (!UUID.test(id)) throw new Error('id inválido')
  if (!VALID.has(status)) throw new Error('status inválido')
  const supabase = getSupabaseServiceClient()
  const update: Record<string, unknown> = { status }
  if (status === 'resolved' || status === 'spam') {
    update.resolved_at = new Date().toISOString()
    update.resolved_by = who
  }
  if (note !== undefined) update.resolution_note = note.slice(0, 4000)
  const { error } = await (supabase.from('page_issues') as any).update(update).eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/feedback')
}
