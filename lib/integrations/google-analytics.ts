/**
 * Google Analytics 4 event tracking helpers.
 */

declare global {
  interface Window {
    gtag?: (...args: unknown[]) => void
  }
}

export const GA_MEASUREMENT_ID = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID ?? ''

/**
 * Check if GA is loaded and available.
 */
export function isGAAvailable(): boolean {
  return typeof window !== 'undefined' && typeof window.gtag === 'function' && GA_MEASUREMENT_ID !== ''
}

/**
 * Send a GA4 event.
 */
export function trackEvent(eventName: string, params?: Record<string, string | number | boolean>): void {
  if (!isGAAvailable()) return
  window.gtag!('event', eventName, params)
}

/**
 * Track a page view.
 */
export function trackPageView(url: string, title?: string): void {
  if (!isGAAvailable()) return
  window.gtag!('config', GA_MEASUREMENT_ID, {
    page_path: url,
    page_title: title,
  })
}

/**
 * Track a statement view.
 */
export function trackStatementView(statementId: string, politicianSlug: string): void {
  trackEvent('view_statement', {
    statement_id: statementId,
    politician_slug: politicianSlug,
  })
}

/**
 * Track a share action.
 */
export function trackShare(platform: string, contentType: string, contentId: string): void {
  trackEvent('share', {
    method: platform,
    content_type: contentType,
    content_id: contentId,
  })
}

/**
 * Track a newsletter subscription.
 */
export function trackNewsletterSubscribe(): void {
  trackEvent('newsletter_subscribe')
}

/**
 * Track a search action.
 */
export function trackSearch(searchTerm: string, resultsCount: number): void {
  trackEvent('search', {
    search_term: searchTerm,
    results_count: resultsCount,
  })
}

/**
 * Return the GA4 script tags as raw HTML strings for inclusion in head.
 */
export function getGAScriptSrc(): string {
  return `https://www.googletagmanager.com/gtag/js?id=${GA_MEASUREMENT_ID}`
}

export function getGAInlineScript(): string {
  return `window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','${GA_MEASUREMENT_ID}');`
}
