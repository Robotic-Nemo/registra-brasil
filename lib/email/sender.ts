/**
 * Email sending utility — supports Resend API or generic SMTP via fetch.
 */

import type { EmailMessage, EmailSendResult, EmailRecipient } from '@/types/email'

const DEFAULT_FROM: EmailRecipient = {
  email: process.env.EMAIL_FROM ?? 'noreply@registrabrasil.com.br',
  name: 'Registra Brasil',
}

/**
 * Send an email using the configured provider.
 *
 * Supports Resend (default) or falls back to a generic SMTP relay endpoint.
 */
export async function sendEmail(message: EmailMessage): Promise<EmailSendResult> {
  const from = message.from ?? DEFAULT_FROM
  const recipients = Array.isArray(message.to) ? message.to : [message.to]

  // Resend API
  const resendKey = process.env.RESEND_API_KEY
  if (resendKey) {
    return sendViaResend(resendKey, { ...message, from, to: recipients })
  }

  // SMTP relay (generic POST endpoint)
  const smtpUrl = process.env.SMTP_RELAY_URL
  if (smtpUrl) {
    return sendViaSMTPRelay(smtpUrl, { ...message, from, to: recipients })
  }

  console.warn('[email/sender] No email provider configured (set RESEND_API_KEY or SMTP_RELAY_URL)')
  return { success: false, error: 'No email provider configured' }
}

async function sendViaResend(
  apiKey: string,
  message: EmailMessage & { from: EmailRecipient; to: EmailRecipient[] }
): Promise<EmailSendResult> {
  try {
    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: message.from.name
          ? `${message.from.name} <${message.from.email}>`
          : message.from.email,
        to: message.to.map(r => r.email),
        subject: message.subject,
        html: message.html,
        text: message.text,
        reply_to: message.replyTo,
        tags: message.tags?.map(t => ({ name: t, value: 'true' })),
      }),
      signal: AbortSignal.timeout(10_000),
    })

    if (response.ok) {
      const data = await response.json()
      return { success: true, messageId: data.id }
    }

    const errorBody = await response.text().catch(() => '')
    return { success: false, error: `Resend API error ${response.status}: ${errorBody}` }
  } catch (err) {
    return { success: false, error: err instanceof Error ? err.message : 'Unknown error' }
  }
}

async function sendViaSMTPRelay(
  url: string,
  message: EmailMessage & { from: EmailRecipient; to: EmailRecipient[] }
): Promise<EmailSendResult> {
  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        from: message.from,
        to: message.to,
        subject: message.subject,
        html: message.html,
        text: message.text,
      }),
      signal: AbortSignal.timeout(15_000),
    })

    if (response.ok) {
      const data = await response.json()
      return { success: true, messageId: data.messageId ?? data.id }
    }

    return { success: false, error: `SMTP relay error: ${response.status}` }
  } catch (err) {
    return { success: false, error: err instanceof Error ? err.message : 'Unknown error' }
  }
}

/**
 * Send an email to multiple recipients in batches.
 */
export async function sendBulkEmail(
  recipients: EmailRecipient[],
  subject: string,
  html: string,
  options: { batchSize?: number; text?: string } = {}
): Promise<{ sent: number; failed: number }> {
  const { batchSize = 50, text } = options
  let sent = 0
  let failed = 0

  for (let i = 0; i < recipients.length; i += batchSize) {
    const batch = recipients.slice(i, i + batchSize)

    // Send individually (most providers require individual sends for personalization)
    const results = await Promise.allSettled(
      batch.map(recipient =>
        sendEmail({ to: recipient, subject, html, text })
      )
    )

    for (const result of results) {
      if (result.status === 'fulfilled' && result.value.success) {
        sent++
      } else {
        failed++
      }
    }
  }

  return { sent, failed }
}
