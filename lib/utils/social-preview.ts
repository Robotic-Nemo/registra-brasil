/**
 * Social media preview helpers.
 * Utilities for generating preview data for how content appears when shared.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export interface SocialPreviewData {
  title: string
  description: string
  url: string
  image: string
  siteName: string
}

/**
 * Truncate text to a maximum length, adding ellipsis if needed.
 */
export function truncateText(text: string, maxLength: number): string {
  if (text.length <= maxLength) return text
  return text.slice(0, maxLength - 1) + '\u2026'
}

/**
 * Build preview data for a statement.
 */
export function buildStatementPreview(params: {
  summary: string
  politicianName: string
  party: string
  slug: string
  date: string
  image?: string
}): SocialPreviewData {
  return {
    title: truncateText(`${params.politicianName} (${params.party}): ${params.summary}`, 70),
    description: truncateText(
      `Declaracao de ${params.politicianName} em ${params.date}. Acompanhe no Registra Brasil.`,
      200
    ),
    url: `${SITE_URL}/declaracao/${params.slug}`,
    image: params.image ?? `${SITE_URL}/og-default.png`,
    siteName: 'Registra Brasil',
  }
}

/**
 * Build preview data for a politician profile.
 */
export function buildPoliticianPreview(params: {
  name: string
  party: string
  state: string | null
  slug: string
  image?: string
  statementCount?: number
}): SocialPreviewData {
  const stateLabel = params.state ? ` - ${params.state}` : ''
  const countLabel = params.statementCount != null
    ? ` ${params.statementCount} declaracoes registradas.`
    : ''

  return {
    title: truncateText(`${params.name} (${params.party}${stateLabel})`, 70),
    description: truncateText(
      `Perfil de ${params.name}.${countLabel} Acompanhe no Registra Brasil.`,
      200
    ),
    url: `${SITE_URL}/politico/${params.slug}`,
    image: params.image ?? `${SITE_URL}/og-default.png`,
    siteName: 'Registra Brasil',
  }
}

/**
 * Get the OG image URL for a given path (for dynamic OG images).
 */
export function getOGImageUrl(path: string, params?: Record<string, string>): string {
  const url = new URL(`${SITE_URL}/api/og`)
  url.searchParams.set('path', path)
  if (params) {
    for (const [key, value] of Object.entries(params)) {
      url.searchParams.set(key, value)
    }
  }
  return url.toString()
}
