/**
 * WhatsApp share link generation.
 */

const WHATSAPP_SHARE_BASE = 'https://api.whatsapp.com/send'

/**
 * Build a WhatsApp share URL.
 */
export function buildWhatsAppShareUrl(text: string): string {
  const params = new URLSearchParams({ text })
  return `${WHATSAPP_SHARE_BASE}?${params.toString()}`
}

/**
 * Format a statement for WhatsApp sharing.
 */
export function formatStatementForWhatsApp(params: {
  summary: string
  politicianName: string
  party: string
  date: string
  url: string
}): string {
  const lines = [
    `*${params.politicianName}* (${params.party})`,
    params.date,
    '',
    params.summary,
    '',
    params.url,
  ]
  return lines.join('\n')
}

/**
 * Build a share URL for a statement.
 */
export function buildStatementWhatsAppUrl(params: {
  summary: string
  politicianName: string
  party: string
  date: string
  url: string
}): string {
  const text = formatStatementForWhatsApp(params)
  return buildWhatsAppShareUrl(text)
}
