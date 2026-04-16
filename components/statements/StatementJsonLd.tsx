import { canonicalUrl } from '@/lib/utils/seo'

interface Props {
  summary: string
  date: string
  fullName: string
  commonName: string
  fullQuote?: string | null
  permalink: string
}

export function StatementJsonLd({ summary, date, fullName, commonName, fullQuote, permalink }: Props) {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Claim',
    text: summary,
    datePublished: date,
    author: {
      '@type': 'Person',
      name: fullName,
      alternateName: commonName,
    },
    ...(fullQuote ? { description: fullQuote } : {}),
    url: canonicalUrl(permalink),
    publisher: {
      '@type': 'Organization',
      name: 'Registra Brasil',
    },
  }

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
    />
  )
}
