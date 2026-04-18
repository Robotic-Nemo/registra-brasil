'use server'

import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { verifyAlertAccessToken } from '@/lib/utils/alert-access'

export async function cancelAlert(
  email: string,
  token: string,
  alertId: string,
): Promise<{ success: boolean; error?: string }> {
  if (!(await verifyAlertAccessToken(email, token))) {
    return { success: false, error: 'Link expirado ou inválido.' }
  }
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('saved_searches') as any)
    .update({
      is_confirmed: false,
      unsubscribed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    })
    .eq('id', alertId)
    .eq('email', email.toLowerCase())
  if (error) return { success: false, error: error.message }
  revalidatePath('/meus-alertas')
  return { success: true }
}

export async function cancelAllAlerts(
  email: string,
  token: string,
): Promise<{ success: boolean; count: number; error?: string }> {
  if (!(await verifyAlertAccessToken(email, token))) {
    return { success: false, count: 0, error: 'Link expirado ou inválido.' }
  }
  const supabase = getSupabaseServiceClient()
  const { error, count } = await (supabase.from('saved_searches') as any)
    .update({
      is_confirmed: false,
      unsubscribed_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    }, { count: 'exact' })
    .eq('email', email.toLowerCase())
    .is('unsubscribed_at', null)
  if (error) return { success: false, count: 0, error: error.message }
  revalidatePath('/meus-alertas')
  return { success: true, count: count ?? 0 }
}
