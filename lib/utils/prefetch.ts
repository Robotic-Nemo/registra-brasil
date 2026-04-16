/**
 * Prefetch helper for Next.js routes.
 * Adds hover/focus-based route prefetching for faster navigation.
 */

const prefetched = new Set<string>()

/**
 * Prefetch a route by injecting a <link rel="prefetch"> tag.
 * Deduplicates to avoid redundant network requests.
 */
export function prefetchRoute(href: string): void {
  if (typeof document === 'undefined') return
  if (prefetched.has(href)) return

  // Only prefetch internal routes
  if (href.startsWith('http') && !href.startsWith(window.location.origin)) return

  prefetched.add(href)

  const link = document.createElement('link')
  link.rel = 'prefetch'
  link.href = href
  link.as = 'document'
  document.head.appendChild(link)
}

/**
 * Returns onMouseEnter and onFocus handlers that trigger route prefetch.
 * Use with Link or anchor elements for hover-based prefetching.
 *
 * @example
 * ```tsx
 * <a href="/politico/lula" {...prefetchOnHover('/politico/lula')}>
 *   Lula
 * </a>
 * ```
 */
export function prefetchOnHover(href: string) {
  const handler = () => prefetchRoute(href)
  return {
    onMouseEnter: handler,
    onFocus: handler,
  } as const
}

/**
 * Prefetch multiple routes at once (e.g., for visible links in a list).
 * Uses requestIdleCallback when available for non-blocking prefetch.
 */
export function prefetchRoutes(hrefs: string[]): void {
  if (typeof window === 'undefined') return

  const callback = () => {
    hrefs.forEach(prefetchRoute)
  }

  if ('requestIdleCallback' in window) {
    ;(window as unknown as { requestIdleCallback: (cb: () => void) => void }).requestIdleCallback(callback)
  } else {
    setTimeout(callback, 100)
  }
}

/** Clear the prefetch cache (useful for testing) */
export function clearPrefetchCache(): void {
  prefetched.clear()
}
