/**
 * Enhanced Open Graph metadata utilities.
 */

import type { Metadata } from 'next'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const DEFAULT_DESCRIPTION = 'Acompanhe e verifique as declaracoes dos politicos brasileiros.'
const DEFAULT_OG_IMAGE = `${SITE_URL}/og-default.png`

export interface OGMetadataParams {
  title: string
  description?: string
  path: string
  image?: string
  imageAlt?: string
  type?: 'website' | 'article' | 'profile'
  locale?: string
  publishedTime?: string
  modifiedTime?: string
  authors?: string[]
  tags?: string[]
}

/**
 * Build enhanced Open Graph metadata for Next.js Metadata API.
 */
export function buildOGMetadata(params: OGMetadataParams): Metadata {
  const {
    title,
    description = DEFAULT_DESCRIPTION,
    path,
    image = DEFAULT_OG_IMAGE,
    imageAlt,
    type = 'website',
    locale = 'pt_BR',
    publishedTime,
    modifiedTime,
    authors,
    tags,
  } = params

  const url = `${SITE_URL}${path}`
  const fullTitle = `${title} | ${SITE_NAME}`

  return {
    title: fullTitle,
    description,
    openGraph: {
      title: fullTitle,
      description,
      url,
      siteName: SITE_NAME,
      locale,
      type,
      images: [
        {
          url: image,
          width: 1200,
          height: 630,
          alt: imageAlt ?? title,
        },
      ],
      ...(publishedTime ? { publishedTime } : {}),
      ...(modifiedTime ? { modifiedTime } : {}),
      ...(authors?.length ? { authors } : {}),
      ...(tags?.length ? { tags } : {}),
    },
    twitter: {
      card: 'summary_large_image',
      title: fullTitle,
      description,
      images: [image],
    },
    alternates: {
      canonical: url,
    },
  }
}

/**
 * Build OG metadata for a statement page.
 */
export function buildStatementOGMetadata(params: {
  summary: string
  politicianName: string
  party: string
  slug: string
  date: string
  image?: string
}): Metadata {
  return buildOGMetadata({
    title: `${params.politicianName} (${params.party}): ${params.summary}`,
    description: `Declaracao de ${params.politicianName} em ${params.date}. Acompanhe no Registra Brasil.`,
    path: `/declaracao/${params.slug}`,
    image: params.image,
    type: 'article',
    publishedTime: params.date,
    tags: ['politica', 'declaracao', params.party],
  })
}

/**
 * Build OG metadata for a politician profile page.
 */
export function buildPoliticianOGMetadata(params: {
  name: string
  party: string
  state: string | null
  slug: string
  image?: string
}): Metadata {
  const stateLabel = params.state ? ` - ${params.state}` : ''
  return buildOGMetadata({
    title: `${params.name} (${params.party}${stateLabel})`,
    description: `Veja todas as declaracoes de ${params.name} no Registra Brasil.`,
    path: `/politico/${params.slug}`,
    image: params.image,
    type: 'profile',
  })
}
