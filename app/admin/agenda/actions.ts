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
const KINDS = new Set([
  'votacao','cpi','debate','discurso','decreto',
  'audiencia','reuniao','comissao','agenda_oficial','other',
])

export async function createEvent(input: {
  title: string
  summary: string
  body?: string
  event_date: string
  event_end_date?: string
  location?: string
  source_url?: string
  kind: string
  politician_id?: string
  is_published?: boolean
}): Promise<{ id: string }> {
  const who = await assertAdmin()

  const title = input.title.trim()
  const summary = input.summary.trim()
  if (title.length < 4 || title.length > 200) throw new Error('Título inválido')
  if (summary.length < 4 || summary.length > 1000) throw new Error('Resumo inválido')
  if (!KINDS.has(input.kind)) throw new Error('Tipo inválido')
  const eventDate = new Date(input.event_date)
  if (Number.isNaN(eventDate.getTime())) throw new Error('Data inválida')
  if (input.politician_id && !UUID.test(input.politician_id)) throw new Error('politician_id inválido')
  if (input.source_url && !/^https?:\/\//i.test(input.source_url)) throw new Error('URL de fonte inválida')

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('political_events') as any)
    .insert({
      title: title.slice(0, 200),
      summary: summary.slice(0, 1000),
      body: input.body?.trim().slice(0, 8000) || null,
      event_date: eventDate.toISOString(),
      event_end_date: input.event_end_date ? new Date(input.event_end_date).toISOString() : null,
      location: input.location?.trim().slice(0, 200) || null,
      source_url: input.source_url?.slice(0, 2000) || null,
      kind: input.kind,
      politician_id: input.politician_id || null,
      is_published: !!input.is_published,
      created_by: who,
    })
    .select('id')
    .single()
  if (error) throw new Error(error.message)
  revalidatePath('/agenda')
  revalidatePath('/admin/agenda')
  return { id: data.id as string }
}

export async function togglePublishEvent(id: string, publish: boolean): Promise<void> {
  await assertAdmin()
  if (!UUID.test(id)) throw new Error('id inválido')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('political_events') as any)
    .update({ is_published: publish }).eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/agenda')
  revalidatePath('/admin/agenda')
}

export async function deleteEvent(id: string): Promise<void> {
  await assertAdmin()
  if (!UUID.test(id)) throw new Error('id inválido')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('political_events') as any).delete().eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/agenda')
  revalidatePath('/admin/agenda')
}
