/**
 * Preload critical data on route transitions.
 * Uses fetch with low priority to avoid blocking current page resources.
 */

const preloadedUrls = new Set<string>()

export function preloadData(url: string): void {
  if (typeof window === 'undefined') return
  if (preloadedUrls.has(url)) return

  preloadedUrls.add(url)

  // Use low-priority fetch
  const link = document.createElement('link')
  link.rel = 'prefetch'
  link.href = url
  link.as = 'fetch'
  link.setAttribute('crossorigin', 'anonymous')
  document.head.appendChild(link)
}

/** Preload multiple data URLs at once */
export function preloadDataBatch(urls: string[]): void {
  urls.forEach(preloadData)
}

/** Clear the preload cache (useful on navigation) */
export function clearPreloadCache(): void {
  preloadedUrls.clear()
}

/** Preload a page route for faster Next.js navigation */
export function preloadRoute(path: string): void {
  if (typeof window === 'undefined') return
  if (preloadedUrls.has(`route:${path}`)) return

  preloadedUrls.add(`route:${path}`)

  const link = document.createElement('link')
  link.rel = 'prefetch'
  link.href = path
  document.head.appendChild(link)
}
