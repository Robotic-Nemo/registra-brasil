const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

/** Build an absolute canonical URL from a path */
export function canonicalUrl(path: string): string {
  return `${SITE_URL}${path.startsWith('/') ? path : `/${path}`}`
}

/** Truncate text to a max-length meta description, cutting at word boundary */
export function metaDescription(text: string, maxLen = 160): string {
  if (text.length <= maxLen) return text
  const truncated = text.slice(0, maxLen)
  const lastSpace = truncated.lastIndexOf(' ')
  return (lastSpace > maxLen * 0.6 ? truncated.slice(0, lastSpace) : truncated) + '…'
}

/** Generate a page title following the site template convention */
export function pageTitle(title: string): string {
  return `${title} — ${SITE_NAME}`
}

/** Generate Open Graph metadata for a statement page */
export function statementOgMeta(politician: string, summary: string, path: string) {
  const title = `${politician}: "${metaDescription(summary, 60)}" — ${SITE_NAME}`
  return {
    title,
    description: metaDescription(summary),
    url: canonicalUrl(path),
    siteName: SITE_NAME,
    type: 'article' as const,
  }
}

/** Generate Open Graph metadata for a politician page */
export function politicianOgMeta(name: string, party: string, path: string) {
  const title = `${name} (${party}) — Declarações | ${SITE_NAME}`
  const description = `Arquivo completo de declarações de ${name} (${party}) com fontes primárias verificáveis.`
  return {
    title,
    description,
    url: canonicalUrl(path),
    siteName: SITE_NAME,
    type: 'profile' as const,
  }
}
