/**
 * Twitter/X share utilities.
 */

const TWITTER_SHARE_BASE = 'https://twitter.com/intent/tweet'
const MAX_TWEET_LENGTH = 280

export interface TwitterShareParams {
  text: string
  url?: string
  hashtags?: string[]
  via?: string
}

/**
 * Build a Twitter/X share URL.
 */
export function buildTwitterShareUrl({ text, url, hashtags, via }: TwitterShareParams): string {
  const params = new URLSearchParams()
  params.set('text', text)
  if (url) params.set('url', url)
  if (hashtags?.length) params.set('hashtags', hashtags.join(','))
  if (via) params.set('via', via)
  return `${TWITTER_SHARE_BASE}?${params.toString()}`
}

/**
 * Truncate text to fit within tweet length, accounting for the URL.
 * Twitter shortens URLs to ~23 characters.
 */
export function truncateForTweet(text: string, url?: string): string {
  const urlLength = url ? 24 : 0 // t.co shortener + space
  const maxTextLength = MAX_TWEET_LENGTH - urlLength
  if (text.length <= maxTextLength) return text
  return text.slice(0, maxTextLength - 1) + '\u2026'
}

/**
 * Build a share URL for a statement.
 */
export function buildStatementTweetUrl(params: {
  summary: string
  politicianName: string
  url: string
}): string {
  const text = truncateForTweet(
    `${params.politicianName}: "${params.summary}"`,
    params.url
  )
  return buildTwitterShareUrl({
    text,
    url: params.url,
    hashtags: ['RegistraBrasil'],
  })
}
