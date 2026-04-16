/**
 * Newsletter management utilities.
 */

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { NewsletterPreferences } from '@/types/email'

/**
 * Generate a secure unsubscribe token from an email address.
 */
export async function generateUnsubscribeToken(email: string): Promise<string> {
  const secret = process.env.NEWSLETTER_SECRET ?? 'registra-brasil-newsletter'
  const encoder = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    encoder.encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  )
  const signature = await crypto.subtle.sign('HMAC', key, encoder.encode(email))
  return Array.from(new Uint8Array(signature))
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
}

/**
 * Verify an unsubscribe token.
 */
export async function verifyUnsubscribeToken(email: string, token: string): Promise<boolean> {
  const expected = await generateUnsubscribeToken(email)
  if (expected.length !== token.length) return false
  let result = 0
  for (let i = 0; i < expected.length; i++) {
    result |= expected.charCodeAt(i) ^ token.charCodeAt(i)
  }
  return result === 0
}

/**
 * Subscribe an email to the newsletter.
 */
export async function subscribeEmail(
  email: string,
  name?: string,
  preferences?: Partial<NewsletterPreferences>
): Promise<{ success: boolean; error?: string }> {
  const supabase = getSupabaseServiceClient()

  const defaultPrefs: NewsletterPreferences = {
    weeklyDigest: true,
    newStatements: false,
    verificationUpdates: false,
    ...preferences,
  }

  const { error } = await (supabase.from('newsletter_subscribers') as any).upsert(
    {
      email: email.toLowerCase().trim(),
      name: name ?? null,
      is_active: true,
      preferences: defaultPrefs,
      unsubscribed_at: null,
    },
    { onConflict: 'email' }
  )

  if (error) {
    console.error('[newsletter] Subscribe error:', error)
    return { success: false, error: 'Failed to subscribe' }
  }

  return { success: true }
}

/**
 * Unsubscribe an email from the newsletter.
 */
export async function unsubscribeEmail(email: string): Promise<{ success: boolean; error?: string }> {
  const supabase = getSupabaseServiceClient()

  const { error } = await (supabase.from('newsletter_subscribers') as any)
    .update({
      is_active: false,
      unsubscribed_at: new Date().toISOString(),
    })
    .eq('email', email.toLowerCase().trim())

  if (error) {
    console.error('[newsletter] Unsubscribe error:', error)
    return { success: false, error: 'Failed to unsubscribe' }
  }

  return { success: true }
}

/**
 * Get all active subscribers.
 */
export async function getActiveSubscribers(): Promise<{ email: string; name: string | null; preferences: NewsletterPreferences }[]> {
  const supabase = getSupabaseServiceClient()

  const { data } = await (supabase.from('newsletter_subscribers') as any)
    .select('email, name, preferences')
    .eq('is_active', true)

  return (data ?? []) as { email: string; name: string | null; preferences: NewsletterPreferences }[]
}

/**
 * Validate email format.
 */
export function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}
