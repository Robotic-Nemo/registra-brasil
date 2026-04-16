/**
 * Server component that renders metadata tags for a statement
 * Used for oEmbed and social media crawlers
 */

interface StatementMetaTagsProps {
  summary: string
  politicianName: string
  party: string
  date: string
  category?: string
  url: string
  imageUrl?: string
}

export function StatementMetaTags({
  summary,
  politicianName,
  party,
  date,
  category,
  url,
  imageUrl,
}: StatementMetaTagsProps) {
  const title = `${summary} — ${politicianName} (${party})`
  const description = `Declaração de ${politicianName} (${party}) em ${date}${category ? ` sobre ${category}` : ''}. Registra Brasil.`

  return (
    <>
      {/* Open Graph */}
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:url" content={url} />
      <meta property="og:type" content="article" />
      <meta property="og:site_name" content="Registra Brasil" />
      <meta property="og:locale" content="pt_BR" />
      {imageUrl && <meta property="og:image" content={imageUrl} />}

      {/* Twitter Card */}
      <meta name="twitter:card" content={imageUrl ? 'summary_large_image' : 'summary'} />
      <meta name="twitter:title" content={title} />
      <meta name="twitter:description" content={description} />
      {imageUrl && <meta name="twitter:image" content={imageUrl} />}

      {/* Article metadata */}
      <meta property="article:published_time" content={date} />
      <meta property="article:section" content={category ?? 'Política'} />
      <meta property="article:tag" content={party} />
    </>
  )
}
