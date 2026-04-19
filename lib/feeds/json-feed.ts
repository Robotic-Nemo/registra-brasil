/**
 * Shared JSON Feed 1.1 (https://www.jsonfeed.org/version/1.1/) builders.
 * One source of truth for the root, per-politician, and per-category
 * JSON Feed endpoints so we can't diverge across routes.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export interface JsonFeedItemInput {
  id: string
  slug: string | null
  summary: string
  full_quote?: string | null
  context?: string | null
  statement_date: string
  created_at?: string | null
  primary_source_url?: string | null
  primary_source_type?: string | null
  venue?: string | null
  event_name?: string | null
  verification_status?: string | null
  severity_score?: number | null
  politician_name?: string | null
  party?: string | null
  state?: string | null
  category_labels?: string[]
}

export interface JsonFeedInput {
  title: string
  description: string
  feed_url: string
  home_page_url: string
  icon?: string
  items: JsonFeedItemInput[]
}

function itemUrl(it: JsonFeedItemInput): string {
  return `${SITE_URL}/declaracao/${it.slug ?? it.id}`
}

function itemHtml(it: JsonFeedItemInput): string {
  const parts = [`<p>${escapeHtml(it.summary)}</p>`]
  if (it.full_quote) parts.push(`<blockquote>${escapeHtml(it.full_quote)}</blockquote>`)
  if (it.context) parts.push(`<p><strong>Contexto:</strong> ${escapeHtml(it.context)}</p>`)
  if (it.venue) parts.push(`<p><strong>Local:</strong> ${escapeHtml(it.venue)}${it.event_name ? ' — ' + escapeHtml(it.event_name) : ''}</p>`)
  if (it.primary_source_url) {
    parts.push(`<p><a href="${escapeHtmlAttr(it.primary_source_url)}">Fonte primária</a></p>`)
  }
  return parts.join('\n')
}

function escapeHtml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}
function escapeHtmlAttr(s: string): string {
  return escapeHtml(s).replace(/"/g, '&quot;')
}

export function buildJsonFeed(input: JsonFeedInput): unknown {
  return {
    version: 'https://jsonfeed.org/version/1.1',
    title: input.title,
    home_page_url: input.home_page_url,
    feed_url: input.feed_url,
    description: input.description,
    language: 'pt-BR',
    ...(input.icon ? { icon: input.icon } : {}),
    items: input.items.map((it) => {
      const url = itemUrl(it)
      const author = it.politician_name
        ? [{
            name: it.politician_name + (it.party ? ` (${it.party}${it.state ? '-' + it.state : ''})` : ''),
          }]
        : undefined
      return {
        id: url,
        url,
        title: it.summary.length > 140 ? it.summary.slice(0, 137) + '…' : it.summary,
        content_html: itemHtml(it),
        summary: it.summary,
        date_published: new Date(it.statement_date).toISOString(),
        ...(it.created_at ? { date_modified: new Date(it.created_at).toISOString() } : {}),
        ...(author ? { authors: author } : {}),
        tags: [
          ...(it.category_labels ?? []),
          ...(it.verification_status ? [it.verification_status] : []),
        ],
        ...(it.primary_source_url ? { external_url: it.primary_source_url } : {}),
        _registra_brasil: {
          severity: it.severity_score,
          verification: it.verification_status,
          source_type: it.primary_source_type,
        },
      }
    }),
  }
}

export const JSON_FEED_HEADERS = {
  'Content-Type': 'application/feed+json; charset=utf-8',
  'Cache-Control': 'public, max-age=600, s-maxage=3600, stale-while-revalidate=1800',
}
