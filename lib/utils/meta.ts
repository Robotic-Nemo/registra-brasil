import type { Metadata } from 'next'

const SITE_NAME = 'Registra Brasil'
const DEFAULT_DESCRIPTION =
  'Arquivo público de declarações de políticos brasileiros com ligação obrigatória a fontes primárias.'

interface PageMetaOptions {
  title: string
  description?: string
  path?: string
  ogImage?: string
  noIndex?: boolean
}

/**
 * Generate consistent page metadata for Next.js pages.
 */
export function pageMeta({
  title,
  description = DEFAULT_DESCRIPTION,
  path,
  ogImage,
  noIndex = false,
}: PageMetaOptions): Metadata {
  const fullTitle = `${title} — ${SITE_NAME}`

  return {
    title: fullTitle,
    description,
    ...(path && { alternates: { canonical: path } }),
    openGraph: {
      title: fullTitle,
      description,
      siteName: SITE_NAME,
      locale: 'pt_BR',
      type: 'website',
      ...(ogImage && { images: [{ url: ogImage, width: 1200, height: 630, alt: title }] }),
    },
    twitter: {
      card: ogImage ? 'summary_large_image' : 'summary',
      title: fullTitle,
      description,
    },
    ...(noIndex && { robots: { index: false, follow: false } }),
  }
}

/**
 * Generate metadata for a politician page.
 */
export function politicianMeta(name: string, party: string, slug: string): Metadata {
  return pageMeta({
    title: `${name} (${party})`,
    description: `Declarações registradas de ${name} (${party}) com fontes primárias verificáveis.`,
    path: `/politico/${slug}`,
  })
}

/**
 * Generate metadata for a statement page.
 */
export function statementMeta(summary: string, politicianName: string, slug: string): Metadata {
  const description = `Declaração de ${politicianName}: ${summary.slice(0, 150)}${summary.length > 150 ? '...' : ''}`

  return pageMeta({
    title: `${politicianName}: ${summary.slice(0, 60)}${summary.length > 60 ? '...' : ''}`,
    description,
    path: `/declaracao/${slug}`,
  })
}
