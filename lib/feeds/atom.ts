/**
 * Shared Atom 1.0 feed renderer for scope pages. Keeps the per-
 * politico, per-partido, per-categoria, per-estado, and global
 * /feed.atom endpoints from drifting apart.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export interface AtomStatement {
  id: string
  slug: string | null
  summary: string
  full_quote?: string | null
  context?: string | null
  statement_date: string
  updated_at?: string | null
  primary_source_url?: string | null
  verification_status?: string | null
  venue?: string | null
  event_name?: string | null
  politicians?: {
    common_name: string
    party?: string | null
    state?: string | null
  } | null
}

export interface AtomFeedOptions {
  /** Canonical id (typically the HTML URL of the scope page). */
  id: string
  /** Feed title. */
  title: string
  /** Subtitle, shown in most aggregators. */
  subtitle?: string
  /** Absolute URL to this Atom feed. */
  selfUrl: string
  /** Absolute URL to the HTML page this feed mirrors. */
  htmlUrl: string
  /** Optional author used when a statement has no politicians relation. */
  defaultAuthor?: string
}

export function renderAtomFeed(
  statements: AtomStatement[],
  opts: AtomFeedOptions,
): string {
  const updated = new Date().toISOString()
  const entries = statements.map((s) => {
    const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const published = new Date(s.statement_date).toISOString()
    const modified = s.updated_at ? new Date(s.updated_at).toISOString() : published
    const author = s.politicians?.common_name ?? opts.defaultAuthor ?? 'Registra Brasil'

    const parts: string[] = [`<h2>${escapeXml(s.summary)}</h2>`]
    if (s.full_quote) parts.push(`<blockquote>${escapeXml(s.full_quote)}</blockquote>`)
    if (s.context) parts.push(`<p><strong>Contexto:</strong> ${escapeXml(s.context)}</p>`)
    if (s.venue) {
      parts.push(`<p><strong>Local:</strong> ${escapeXml(s.venue)}${s.event_name ? ` — ${escapeXml(s.event_name)}` : ''}</p>`)
    }
    if (s.primary_source_url) {
      parts.push(`<p><a href="${escapeXml(s.primary_source_url)}">Fonte primária</a></p>`)
    }
    const content = `<![CDATA[${parts.join('\n')}]]>`

    return `  <entry>
    <id>${escapeXml(link)}</id>
    <title>${escapeXml(s.summary.slice(0, 140))}</title>
    <link rel="alternate" type="text/html" href="${escapeXml(link)}"/>
    <published>${published}</published>
    <updated>${modified}</updated>
    <author><name>${escapeXml(author)}</name></author>
    <summary>${escapeXml(s.summary)}</summary>
    <content type="html">${content}</content>${s.verification_status ? `
    <category term="${escapeXml(s.verification_status)}"/>` : ''}
  </entry>`
  })

  return `<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <id>${escapeXml(opts.id)}</id>
  <title>${escapeXml(opts.title)}</title>${opts.subtitle ? `
  <subtitle>${escapeXml(opts.subtitle)}</subtitle>` : ''}
  <link rel="self" type="application/atom+xml" href="${escapeXml(opts.selfUrl)}"/>
  <link rel="alternate" type="text/html" href="${escapeXml(opts.htmlUrl)}"/>
  <updated>${updated}</updated>
${entries.join('\n')}
</feed>`
}

export function atomHeaders(): HeadersInit {
  return {
    'Content-Type': 'application/atom+xml; charset=utf-8',
    'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
  }
}
