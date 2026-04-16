/**
 * Telegram message formatting and share utilities.
 */

const TELEGRAM_SHARE_BASE = 'https://t.me/share/url'

/**
 * Build a Telegram share URL.
 */
export function buildTelegramShareUrl(url: string, text?: string): string {
  const params = new URLSearchParams({ url })
  if (text) params.set('text', text)
  return `${TELEGRAM_SHARE_BASE}?${params.toString()}`
}

/**
 * Format a statement for Telegram (supports Markdown).
 */
export function formatStatementForTelegram(params: {
  summary: string
  politicianName: string
  party: string
  date: string
  url: string
}): string {
  const lines = [
    `*${params.politicianName}* (${params.party})`,
    `_${params.date}_`,
    '',
    params.summary,
    '',
    `[Ver no Registra Brasil](${params.url})`,
  ]
  return lines.join('\n')
}

/**
 * Build a share URL for a statement.
 */
export function buildStatementTelegramUrl(params: {
  summary: string
  politicianName: string
  url: string
}): string {
  const text = `${params.politicianName}: "${params.summary}"`
  return buildTelegramShareUrl(params.url, text)
}
