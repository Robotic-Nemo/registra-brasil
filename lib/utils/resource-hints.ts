/**
 * Resource hint utilities for preload, prefetch, and preconnect.
 * Call these from client components to inject link hints into the document head.
 */

function addLink(rel: string, href: string, extra?: Record<string, string>): void {
  if (typeof document === 'undefined') return
  // Avoid duplicates
  const existing = document.querySelector(`link[rel="${rel}"][href="${href}"]`)
  if (existing) return

  const link = document.createElement('link')
  link.rel = rel
  link.href = href
  if (extra) {
    Object.entries(extra).forEach(([k, v]) => link.setAttribute(k, v))
  }
  document.head.appendChild(link)
}

/** Preconnect to an origin to reduce connection latency. */
export function preconnect(origin: string): void {
  addLink('preconnect', origin, { crossorigin: '' })
}

/** Prefetch a resource for future navigation. */
export function prefetch(url: string): void {
  addLink('prefetch', url)
}

/** Preload a critical resource for the current page. */
export function preload(url: string, as: string, type?: string): void {
  const extra: Record<string, string> = { as }
  if (type) extra.type = type
  addLink('preload', url, extra)
}

/** DNS prefetch for an origin. */
export function dnsPrefetch(origin: string): void {
  addLink('dns-prefetch', origin)
}
