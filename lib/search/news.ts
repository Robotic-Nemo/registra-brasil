import type { NewsResult } from '@/types/search'

interface GoogleCSEItem {
  title: string
  link: string
  snippet: string
  displayLink: string
  pagemap?: {
    metatags?: { 'article:published_time'?: string }[]
  }
}

export async function searchNews(query: string, num = 5): Promise<NewsResult[]> {
  if (!process.env.GOOGLE_CSE_API_KEY || !process.env.GOOGLE_CSE_ID) return []

  const clampedNum = Math.min(Math.max(Math.floor(num), 1), 10)

  const params = new URLSearchParams({
    key: process.env.GOOGLE_CSE_API_KEY,
    cx: process.env.GOOGLE_CSE_ID,
    q: query,
    num: String(clampedNum),
    lr: 'lang_pt',
  })

  try {
    const res = await fetch(`https://www.googleapis.com/customsearch/v1?${params}`, {
      next: { revalidate: 0 },
    })
    if (!res.ok) return []

    const data = await res.json()
    return ((data.items ?? []) as GoogleCSEItem[])
      .filter((item) => {
        try {
          const u = new URL(item.link)
          if (!['http:', 'https:'].includes(u.protocol)) {
            console.warn('[news] Invalid protocol in search result:', item.link)
            return false
          }
          return true
        } catch {
          console.warn('[news] Invalid URL in search result:', item.link)
          return false
        }
      })
      .map((item) => ({
        title: item.title ?? '',
        url: item.link,
        snippet: item.snippet ?? '',
        outlet: (item.displayLink ?? '').replace(/^www\./, ''),
        publishedAt: item.pagemap?.metatags?.[0]?.['article:published_time'] ?? null,
      }))
  } catch {
    return []
  }
}
