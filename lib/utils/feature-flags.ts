/**
 * Simple feature flag system using environment variables
 *
 * Usage: FEATURE_DARK_MODE=true → isFeatureEnabled('dark_mode') returns true
 */

const FLAGS = {
  dark_mode: 'FEATURE_DARK_MODE',
  advanced_search: 'FEATURE_ADVANCED_SEARCH',
  notifications: 'FEATURE_NOTIFICATIONS',
  export_api: 'FEATURE_EXPORT_API',
  webhook: 'FEATURE_WEBHOOK',
  ai_analysis: 'FEATURE_AI_ANALYSIS',
  user_accounts: 'FEATURE_USER_ACCOUNTS',
  comments: 'FEATURE_COMMENTS',
  state_map: 'FEATURE_STATE_MAP',
  politician_bio: 'FEATURE_POLITICIAN_BIO',
  share_card: 'FEATURE_SHARE_CARD',
  ab_testing: 'FEATURE_AB_TESTING',
  enhanced_search: 'FEATURE_ENHANCED_SEARCH',
} as const

export type FeatureFlag = keyof typeof FLAGS

/**
 * Check if a feature flag is enabled
 */
export function isFeatureEnabled(flag: FeatureFlag): boolean {
  const envKey = FLAGS[flag]
  const value = process.env[envKey]
  return value === 'true' || value === '1'
}

/**
 * Get all enabled features
 */
export function getEnabledFeatures(): FeatureFlag[] {
  return (Object.keys(FLAGS) as FeatureFlag[]).filter(isFeatureEnabled)
}

/**
 * Server-side feature gate — throws if feature is disabled
 */
export function requireFeature(flag: FeatureFlag): void {
  if (!isFeatureEnabled(flag)) {
    throw new Error(`Feature "${flag}" is not enabled.`)
  }
}

/**
 * Client-safe feature check (only reads NEXT_PUBLIC_ prefixed vars)
 * For client components, use NEXT_PUBLIC_FEATURE_X env vars
 */
export function isClientFeatureEnabled(flag: string): boolean {
  if (typeof window === 'undefined') return false
  const key = `NEXT_PUBLIC_FEATURE_${flag.toUpperCase()}`
  return process.env[key] === 'true' || process.env[key] === '1'
}
