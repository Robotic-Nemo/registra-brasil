/**
 * Sitemap generation helpers for dynamic route building.
 */

export interface SitemapEntry {
  url: string
  lastModified?: string | Date
  changeFrequency?: 'always' | 'hourly' | 'daily' | 'weekly' | 'monthly' | 'yearly' | 'never'
  priority?: number
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * Build a full URL from a path segment.
 */
export function buildSitemapUrl(path: string): string {
  const cleanPath = path.startsWith('/') ? path : `/${path}`
  return `${SITE_URL}${cleanPath}`
}

/**
 * Create a sitemap entry with sensible defaults.
 */
export function createSitemapEntry(
  path: string,
  options?: Partial<Omit<SitemapEntry, 'url'>>
): SitemapEntry {
  return {
    url: buildSitemapUrl(path),
    lastModified: options?.lastModified ?? new Date(),
    changeFrequency: options?.changeFrequency ?? 'weekly',
    priority: options?.priority ?? 0.5,
  }
}

/**
 * Generate sitemap entries for static pages.
 */
export function getStaticSitemapEntries(): SitemapEntry[] {
  return [
    createSitemapEntry('/', { changeFrequency: 'daily', priority: 1.0 }),
    createSitemapEntry('/politicos', { changeFrequency: 'daily', priority: 0.8 }),
    createSitemapEntry('/categorias', { changeFrequency: 'weekly', priority: 0.7 }),
    createSitemapEntry('/buscar', { changeFrequency: 'daily', priority: 0.7 }),
    createSitemapEntry('/estatisticas', { changeFrequency: 'weekly', priority: 0.6 }),
    createSitemapEntry('/sobre', { changeFrequency: 'monthly', priority: 0.5 }),
    createSitemapEntry('/faq', { changeFrequency: 'monthly', priority: 0.5 }),
    createSitemapEntry('/changelog', { changeFrequency: 'monthly', priority: 0.3 }),
    createSitemapEntry('/mapa', { changeFrequency: 'weekly', priority: 0.5 }),
    createSitemapEntry('/nuvem-de-palavras', { changeFrequency: 'weekly', priority: 0.4 }),
    createSitemapEntry('/linha-do-tempo', { changeFrequency: 'daily', priority: 0.6 }),
    createSitemapEntry('/comparar', { changeFrequency: 'weekly', priority: 0.5 }),
    createSitemapEntry('/privacidade', { changeFrequency: 'yearly', priority: 0.2 }),
    createSitemapEntry('/termos', { changeFrequency: 'yearly', priority: 0.2 }),
    createSitemapEntry('/contato', { changeFrequency: 'yearly', priority: 0.3 }),
    createSitemapEntry('/acessibilidade', { changeFrequency: 'yearly', priority: 0.3 }),
  ]
}

/**
 * Generate sitemap entries from a list of slugs (e.g., politicians or statements).
 */
export function generateSlugEntries(
  basePath: string,
  slugs: { slug: string; updatedAt?: string }[],
  options?: Partial<Omit<SitemapEntry, 'url'>>
): SitemapEntry[] {
  return slugs.map((item) =>
    createSitemapEntry(`${basePath}/${item.slug}`, {
      lastModified: item.updatedAt ?? options?.lastModified,
      changeFrequency: options?.changeFrequency ?? 'weekly',
      priority: options?.priority ?? 0.6,
    })
  )
}
