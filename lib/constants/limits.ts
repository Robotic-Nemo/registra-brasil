/** Pagination defaults */
export const DEFAULT_PAGE_SIZE = 20
export const MAX_PAGE_SIZE = 50

/** Search */
export const MIN_SEARCH_LENGTH = 2
export const MAX_SEARCH_LENGTH = 200
export const SEARCH_DEBOUNCE_MS = 400
export const SUGGEST_DEBOUNCE_MS = 250
export const MAX_SUGGESTIONS = 8

/** Rate limiting */
export const RATE_LIMIT_SEARCH = 60 // requests per minute
export const RATE_LIMIT_SUGGEST = 120 // requests per minute
export const RATE_LIMIT_API = 100 // requests per minute

/** Content */
export const MAX_SUMMARY_LENGTH = 500
export const MAX_QUOTE_LENGTH = 5000
export const MAX_CONTEXT_LENGTH = 2000
export const MAX_EDITOR_NOTES_LENGTH = 1000

/** RSS */
export const RSS_MAX_ITEMS = 30

/** Sitemap */
export const SITEMAP_MAX_STATEMENTS = 2000

/** Cache TTLs (seconds) */
export const CACHE_SHORT = 300 // 5 minutes
export const CACHE_MEDIUM = 3600 // 1 hour
export const CACHE_LONG = 86400 // 24 hours
