/**
 * Embed URL and iframe code generation utilities.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function escapeHtmlAttr(s: string): string {
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

/**
 * Generate the embed URL for a statement.
 */
export function getStatementEmbedUrl(idOrSlug: string): string {
  return `${SITE_URL}/embed/declaracao/${idOrSlug}`
}

/**
 * Generate the embed URL for a politician.
 */
export function getPoliticianEmbedUrl(slug: string): string {
  return `${SITE_URL}/embed/politico/${slug}`
}

/**
 * Generate an iframe HTML snippet for embedding a statement.
 */
export function getStatementIframeCode(
  idOrSlug: string,
  options: { width?: number | string; height?: number | string } = {}
): string {
  const { width = 600, height = 300 } = options
  const url = getStatementEmbedUrl(idOrSlug)
  const w = typeof width === 'number' ? `${width}px` : width
  const h = typeof height === 'number' ? `${height}px` : height
  return `<iframe src="${escapeHtmlAttr(url)}" width="${escapeHtmlAttr(w)}" height="${escapeHtmlAttr(h)}" frameborder="0" style="border:1px solid #e5e7eb;border-radius:8px;" loading="lazy" title="Registra Brasil - Declaracao"></iframe>`
}

/**
 * Generate an iframe HTML snippet for embedding a politician card.
 */
export function getPoliticianIframeCode(
  slug: string,
  options: { width?: number | string; height?: number | string } = {}
): string {
  const { width = 400, height = 200 } = options
  const url = getPoliticianEmbedUrl(slug)
  const w = typeof width === 'number' ? `${width}px` : width
  const h = typeof height === 'number' ? `${height}px` : height
  return `<iframe src="${escapeHtmlAttr(url)}" width="${escapeHtmlAttr(w)}" height="${escapeHtmlAttr(h)}" frameborder="0" style="border:1px solid #e5e7eb;border-radius:8px;" loading="lazy" title="Registra Brasil - Politico"></iframe>`
}

/**
 * Generate a simple link embed (oEmbed-compatible).
 */
export function getOEmbedUrl(statementUrl: string): string {
  return `${SITE_URL}/api/embed?url=${encodeURIComponent(statementUrl)}`
}
