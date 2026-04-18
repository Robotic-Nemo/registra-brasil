'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { outletFor } from '@/lib/fact-checks/outlets'

async function assertAdmin() {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
}

const BLOCKED_HOSTS = /^(localhost|127\.|0\.|10\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.|::1|fe80:|fc00:|fd)/i
const VALID_RATINGS = new Set(['true', 'mostly_true', 'half_true', 'mostly_false', 'false', 'misleading', 'unproven', 'satire'])

function validUrl(u: string): boolean {
  if (!u || u.length > 2048) return false
  try {
    const p = new URL(u)
    if (p.protocol !== 'http:' && p.protocol !== 'https:') return false
    if (BLOCKED_HOSTS.test(p.hostname)) return false
    return true
  } catch { return false }
}

export async function addFactCheck(input: {
  statement_id: string
  outlet_key: string
  outlet_label_override?: string
  url: string
  title?: string
  rating?: string
  rating_label?: string
  published_at?: string
}): Promise<void> {
  await assertAdmin()

  if (!validUrl(input.url)) throw new Error('URL inválida ou bloqueada.')
  const outlet = outletFor(input.outlet_key)
  const outlet_label = (input.outlet_key === 'outro' ? input.outlet_label_override : outlet?.label)?.trim()
  if (!outlet_label || outlet_label.length < 2) throw new Error('Outlet obrigatório.')

  const rating = input.rating && VALID_RATINGS.has(input.rating) ? input.rating : null
  const published_at = input.published_at && /^\d{4}-\d{2}-\d{2}$/.test(input.published_at)
    ? input.published_at : null

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('statement_fact_checks') as any).insert({
    statement_id: input.statement_id,
    outlet: input.outlet_key.slice(0, 60),
    outlet_label: outlet_label.slice(0, 100),
    url: input.url,
    title: input.title?.slice(0, 300) || null,
    rating,
    rating_label: input.rating_label?.slice(0, 100) || null,
    published_at,
    added_by: 'admin',
  })

  if (error) {
    if ((error as any).code === '23505') throw new Error('Essa URL já foi adicionada a esta declaração.')
    throw new Error(error.message)
  }

  revalidatePath('/admin/fact-checks')
}

export async function removeFactCheck(id: string): Promise<void> {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('statement_fact_checks') as any).delete().eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/admin/fact-checks')
}
