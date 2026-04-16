/**
 * Analytics event tracking helper -- stub for future analytics integration.
 * Replace the implementation with your analytics provider (e.g. Plausible, Umami, PostHog).
 */

type EventName =
  | 'page_view'
  | 'search'
  | 'statement_view'
  | 'politician_view'
  | 'category_view'
  | 'source_click'
  | 'share'
  | 'filter_applied'
  | 'sort_changed'

interface EventProperties {
  [key: string]: string | number | boolean | undefined
}

/** Track a named event with optional properties */
export function trackEvent(name: EventName, properties?: EventProperties): void {
  if (process.env.NODE_ENV === 'development') {
    // eslint-disable-next-line no-console
    console.debug('[analytics]', name, properties)
  }
  // Future: send to analytics provider
  // e.g. plausible(name, { props: properties })
}

/** Track a page view with optional metadata */
export function trackPageView(path: string, referrer?: string): void {
  trackEvent('page_view', { path, referrer })
}

/** Track a search query */
export function trackSearch(query: string, resultCount: number): void {
  trackEvent('search', { query, result_count: resultCount })
}
