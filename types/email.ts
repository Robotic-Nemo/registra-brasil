/**
 * Email system types.
 */

export interface EmailRecipient {
  email: string
  name?: string
}

export interface EmailMessage {
  to: EmailRecipient | EmailRecipient[]
  subject: string
  html: string
  text?: string
  from?: EmailRecipient
  replyTo?: string
  tags?: string[]
}

export interface EmailSendResult {
  success: boolean
  messageId?: string
  error?: string
}

export type EmailProvider = 'resend' | 'smtp'

export interface EmailConfig {
  provider: EmailProvider
  from: EmailRecipient
  replyTo?: string
}

export interface NewsletterSubscriber {
  id: string
  email: string
  name: string | null
  is_active: boolean
  preferences: NewsletterPreferences
  confirmed_at: string | null
  unsubscribed_at: string | null
  created_at: string
}

export interface NewsletterPreferences {
  weeklyDigest: boolean
  newStatements: boolean
  verificationUpdates: boolean
  parties?: string[]
  states?: string[]
}

export interface DigestData {
  period: string
  totalNew: number
  totalVerified: number
  topStatements: {
    summary: string
    politician: string
    party: string
    date: string
    url: string
  }[]
}
