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

type Decision = 'accept' | 'reject' | 'reply' | 'in_review'

export async function decideRetraction(
  id: string,
  decision: Decision,
  reviewerNotes: string,
  publicReply?: string,
): Promise<void> {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()

  const patch: Record<string, unknown> = {
    reviewer_notes: reviewerNotes.trim() || null,
    reviewed_at: new Date().toISOString(),
    reviewed_by: 'admin',
    updated_at: new Date().toISOString(),
  }

  switch (decision) {
    case 'in_review':
      patch.status = 'in_review'
      break
    case 'accept':
      patch.status = 'accepted'
      break
    case 'reject':
      patch.status = 'rejected'
      break
    case 'reply':
      if (!publicReply || publicReply.trim().length < 10) {
        throw new Error('Réplica pública muito curta (mín. 10 caracteres).')
      }
      patch.status = 'replied'
      patch.public_reply = publicReply.trim().slice(0, 5000)
      patch.public_reply_published_at = new Date().toISOString()
      break
  }

  const { error } = await (supabase.from('retraction_requests') as any).update(patch).eq('id', id)
  if (error) throw new Error(error.message)

  revalidatePath('/admin/retratacoes')
  revalidatePath('/retratacoes')
}
