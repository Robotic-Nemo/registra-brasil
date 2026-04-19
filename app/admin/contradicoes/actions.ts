'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { orderPair } from '@/lib/contradictions/queries'

async function assertAdmin(): Promise<string> {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
  return c.get('admin_user')?.value ?? 'admin'
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export async function createContradiction(input: {
  politician_id: string
  statement_a_id: string
  statement_b_id: string
  headline: string
  editor_note: string
  severity: number
  is_published: boolean
}): Promise<{ id: string }> {
  const who = await assertAdmin()

  if (!UUID_RE.test(input.politician_id)) throw new Error('politician_id inválido')
  if (!UUID_RE.test(input.statement_a_id) || !UUID_RE.test(input.statement_b_id)) {
    throw new Error('statement ids inválidos')
  }
  if (input.statement_a_id === input.statement_b_id) {
    throw new Error('Os dois registros precisam ser diferentes')
  }
  const headline = input.headline.trim()
  const note = input.editor_note.trim()
  if (headline.length < 4 || headline.length > 180) throw new Error('Manchete inválida')
  if (note.length < 10 || note.length > 4000) throw new Error('Nota editorial inválida')
  const sev = Math.max(1, Math.min(4, Math.round(input.severity))) as 1 | 2 | 3 | 4

  const supabase = getSupabaseServiceClient()

  // Verify both statements belong to the claimed politician
  const { data: stmts, error: stErr } = await (supabase.from('statements') as any)
    .select('id, politician_id')
    .in('id', [input.statement_a_id, input.statement_b_id])
  if (stErr) throw new Error('Falha ao carregar declarações')
  if (!stmts || stmts.length !== 2) throw new Error('Uma das declarações não foi encontrada')
  for (const s of stmts) {
    if (s.politician_id !== input.politician_id) {
      throw new Error('Ambas as declarações devem ser do mesmo político')
    }
  }

  const { low, high } = orderPair(input.statement_a_id, input.statement_b_id)

  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .insert({
      politician_id: input.politician_id,
      statement_low_id: low,
      statement_high_id: high,
      headline: headline.slice(0, 180),
      editor_note: note,
      severity: sev,
      is_published: !!input.is_published,
      created_by: who,
    })
    .select('id')
    .single()
  if (error) {
    if (/duplicate key/i.test(error.message)) {
      throw new Error('Esse par já foi registrado')
    }
    throw new Error(error.message)
  }

  revalidatePath('/contradicoes')
  revalidatePath('/admin/contradicoes')
  return { id: data.id as string }
}

export async function togglePublishContradiction(id: string, publish: boolean): Promise<void> {
  await assertAdmin()
  if (!UUID_RE.test(id)) throw new Error('id inválido')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('contradiction_pairs') as any)
    .update({ is_published: publish })
    .eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/contradicoes')
  revalidatePath('/admin/contradicoes')
  revalidatePath(`/contradicoes/${id}`)
}

export async function deleteContradiction(id: string): Promise<void> {
  await assertAdmin()
  if (!UUID_RE.test(id)) throw new Error('id inválido')
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('contradiction_pairs') as any).delete().eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/contradicoes')
  revalidatePath('/admin/contradicoes')
}
