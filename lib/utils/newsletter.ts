/**
 * Newsletter management utilities.
 *
 * LGPD art. 8 requires explicit, specific, informed consent. Subscription
 * is two-step: (1) row created with is_active=false + confirmation token,
 * (2) user clicks link with token, row flipped to is_active=true. Until
 * confirmation, the email does not count as a subscriber for any purpose.
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
 * Cryptographically random opaque confirmation token (32 bytes hex).
 */
function generateConfirmationToken(): string {
  const bytes = new Uint8Array(32)
  crypto.getRandomValues(bytes)
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('')
}

/**
 * Begin a subscription. Creates or refreshes a pending row with a fresh
 * confirmation token; returns the token so the caller can dispatch a
 * confirmation email. The row is NOT active until `confirmSubscription`
 * succeeds with the same token.
 */
export async function beginSubscription(
  email: string,
  name?: string,
  preferences?: Partial<NewsletterPreferences>
): Promise<{ success: boolean; token?: string; alreadyActive?: boolean; error?: string }> {
  const supabase = getSupabaseServiceClient()
  const normalized = email.toLowerCase().trim()

  const defaultPrefs: NewsletterPreferences = {
    weeklyDigest: true,
    newStatements: false,
    verificationUpdates: false,
    ...preferences,
  }

  // Short-circuit if already confirmed — don't reset consent or re-issue a token.
  const { data: existing } = await (supabase.from('newsletter_subscribers') as any)
    .select('is_active, confirmed_at')
    .eq('email', normalized)
    .maybeSingle()

  if (existing?.is_active && existing.confirmed_at) {
    return { success: true, alreadyActive: true }
  }

  const token = generateConfirmationToken()

  const { error } = await (supabase.from('newsletter_subscribers') as any).upsert(
    {
      email: normalized,
      name: name ?? null,
      is_active: false,
      preferences: defaultPrefs,
      confirmation_token: token,
      confirmation_sent_at: new Date().toISOString(),
      confirmed_at: null,
      unsubscribed_at: null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: 'email' }
  )

  if (error) {
    console.error('[newsletter] beginSubscription error:', error)
    return { success: false, error: 'Failed to subscribe' }
  }

  return { success: true, token }
}

/**
 * Complete a subscription by exchanging a token for `is_active=true`.
 * Single-use: the token is cleared on success so it can't be replayed.
 */
export async function confirmSubscription(
  email: string,
  token: string
): Promise<{ success: boolean; error?: string }> {
  const supabase = getSupabaseServiceClient()
  const normalized = email.toLowerCase().trim()

  const { data: row } = await (supabase.from('newsletter_subscribers') as any)
    .select('confirmation_token, is_active')
    .eq('email', normalized)
    .maybeSingle()

  if (!row?.confirmation_token) {
    return { success: false, error: 'Invalid or expired token' }
  }

  // Timing-safe compare
  const a = row.confirmation_token as string
  if (a.length !== token.length) return { success: false, error: 'Invalid token' }
  let diff = 0
  for (let i = 0; i < a.length; i++) diff |= a.charCodeAt(i) ^ token.charCodeAt(i)
  if (diff !== 0) return { success: false, error: 'Invalid token' }

  const { error } = await (supabase.from('newsletter_subscribers') as any)
    .update({
      is_active: true,
      confirmed_at: new Date().toISOString(),
      confirmation_token: null,
      updated_at: new Date().toISOString(),
    })
    .eq('email', normalized)

  if (error) {
    console.error('[newsletter] confirmSubscription error:', error)
    return { success: false, error: 'Failed to confirm' }
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
      updated_at: new Date().toISOString(),
    })
    .eq('email', email.toLowerCase().trim())

  if (error) {
    console.error('[newsletter] Unsubscribe error:', error)
    return { success: false, error: 'Failed to unsubscribe' }
  }

  return { success: true }
}

/**
 * Get all active (confirmed) subscribers.
 */
export async function getActiveSubscribers(): Promise<{ email: string; name: string | null; preferences: NewsletterPreferences }[]> {
  const supabase = getSupabaseServiceClient()

  const { data } = await (supabase.from('newsletter_subscribers') as any)
    .select('email, name, preferences')
    .eq('is_active', true)
    .not('confirmed_at', 'is', null)

  return (data ?? []) as { email: string; name: string | null; preferences: NewsletterPreferences }[]
}

/**
 * Validate email format.
 */
export function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}
