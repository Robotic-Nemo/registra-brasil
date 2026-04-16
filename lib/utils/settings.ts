import type { SiteSettings } from '@/types/settings'
import { DEFAULT_SETTINGS } from '@/types/settings'

/**
 * Load settings from environment variables, falling back to defaults.
 */
export function loadSettings(): SiteSettings {
  return {
    siteName: process.env.SITE_NAME ?? DEFAULT_SETTINGS.siteName,
    siteDescription: process.env.SITE_DESCRIPTION ?? DEFAULT_SETTINGS.siteDescription,
    siteUrl: process.env.NEXT_PUBLIC_SITE_URL ?? DEFAULT_SETTINGS.siteUrl,
    statementsPerPage: parseInt(process.env.STATEMENTS_PER_PAGE ?? '', 10) || DEFAULT_SETTINGS.statementsPerPage,
    requireReview: process.env.REQUIRE_REVIEW !== 'false',
    alertEmail: process.env.ALERT_EMAIL ?? DEFAULT_SETTINGS.alertEmail,
    notifyNewSuggestions: process.env.NOTIFY_NEW_SUGGESTIONS !== 'false',
    maintenanceMode: process.env.MAINTENANCE_MODE === 'true',
    enableApi: process.env.ENABLE_API !== 'false',
    cacheEnabled: process.env.CACHE_ENABLED !== 'false',
    cacheTtlSeconds: parseInt(process.env.CACHE_TTL_SECONDS ?? '', 10) || DEFAULT_SETTINGS.cacheTtlSeconds,
  }
}

/**
 * Format a settings key for display.
 */
export function formatSettingKey(key: string): string {
  return key
    .replace(/([A-Z])/g, ' $1')
    .replace(/^./, (s) => s.toUpperCase())
    .trim()
}

/**
 * Get the environment variable name for a setting key.
 */
export function getEnvVarName(key: keyof SiteSettings): string {
  const map: Record<keyof SiteSettings, string> = {
    siteName: 'SITE_NAME',
    siteDescription: 'SITE_DESCRIPTION',
    siteUrl: 'NEXT_PUBLIC_SITE_URL',
    statementsPerPage: 'STATEMENTS_PER_PAGE',
    requireReview: 'REQUIRE_REVIEW',
    alertEmail: 'ALERT_EMAIL',
    notifyNewSuggestions: 'NOTIFY_NEW_SUGGESTIONS',
    maintenanceMode: 'MAINTENANCE_MODE',
    enableApi: 'ENABLE_API',
    cacheEnabled: 'CACHE_ENABLED',
    cacheTtlSeconds: 'CACHE_TTL_SECONDS',
  }
  return map[key]
}
