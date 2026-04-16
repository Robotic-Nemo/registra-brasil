import type { SourceType } from '@/types/database'

interface PatternRule {
  pattern: RegExp
  type: SourceType
}

const URL_PATTERNS: PatternRule[] = [
  { pattern: /youtube\.com\/watch|youtu\.be\//, type: 'youtube_video' },
  { pattern: /youtube\.com\/live\//, type: 'youtube_live_archive' },
  { pattern: /camara\.leg\.br.*tv|tv\.camara\.leg\.br/, type: 'camara_tv' },
  { pattern: /senado\.leg\.br.*tv|tv\.senado\.leg\.br/, type: 'senado_tv' },
  { pattern: /imprensanacional\.gov\.br|in\.gov\.br\/web\/dou/, type: 'diario_oficial' },
  { pattern: /\.pdf$/i, type: 'transcript_pdf' },
  { pattern: /twitter\.com|x\.com|instagram\.com|facebook\.com|threads\.net/, type: 'social_media_post' },
  { pattern: /g1\.globo\.com|uol\.com\.br|folha\.uol|estadao\.com|bbc\.com/, type: 'news_article' },
]

/** Detect the source type based on a URL pattern. Returns null if no match. */
export function detectSourceType(url: string): SourceType | null {
  try {
    const normalized = new URL(url).href.toLowerCase()
    for (const rule of URL_PATTERNS) {
      if (rule.pattern.test(normalized)) return rule.type
    }
    return null
  } catch {
    return null
  }
}

/** Returns true if the URL looks like a video source. */
export function isVideoUrl(url: string): boolean {
  const type = detectSourceType(url)
  return type === 'youtube_video' || type === 'youtube_live_archive' || type === 'camara_tv' || type === 'senado_tv'
}

/** Returns true if the URL is from an official government domain. */
export function isOfficialDomain(url: string): boolean {
  try {
    const hostname = new URL(url).hostname
    return hostname.endsWith('.gov.br') || hostname.endsWith('.leg.br') || hostname.endsWith('.jus.br')
  } catch {
    return false
  }
}
