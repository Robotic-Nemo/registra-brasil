/**
 * Portuguese Wikipedia summary fetcher. Uses the REST v1 summary
 * endpoint which returns a clean extract sized for article teasers.
 * Attribution required (CC-BY-SA 4.0) — caller renders the source URL
 * alongside the excerpt.
 */

const USER_AGENT = 'RegistraBrasilBot/1.0 (https://registrabrasil.com.br; contato via GitHub Issues)'
const TIMEOUT_MS = 8000
const MAX_EXCERPT = 1200

export interface WikipediaSummary {
  title: string
  extract: string
  url: string
}

function parseWikipediaTitleFromUrl(articleUrl: string): string | null {
  try {
    const u = new URL(articleUrl)
    if (!u.hostname.endsWith('wikipedia.org')) return null
    // /wiki/Article_Title or /wiki/Namespace:Article_Title
    const m = u.pathname.match(/^\/wiki\/(.+)$/)
    return m ? decodeURIComponent(m[1]) : null
  } catch { return null }
}

export async function fetchWikipediaSummary(input: { articleUrl?: string | null; title?: string }): Promise<WikipediaSummary | null> {
  const title = input.title ?? (input.articleUrl ? parseWikipediaTitleFromUrl(input.articleUrl) : null)
  if (!title) return null

  const api = `https://pt.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title)}`
  try {
    const res = await fetch(api, {
      headers: { 'User-Agent': USER_AGENT, Accept: 'application/json' },
      signal: AbortSignal.timeout(TIMEOUT_MS),
    })
    if (!res.ok) return null
    const json = (await res.json()) as { title?: string; extract?: string; content_urls?: { desktop?: { page?: string } } }
    if (!json.extract) return null
    return {
      title: json.title ?? title,
      extract: json.extract.slice(0, MAX_EXCERPT),
      url: json.content_urls?.desktop?.page ?? `https://pt.wikipedia.org/wiki/${encodeURIComponent(title)}`,
    }
  } catch {
    return null
  }
}
