/**
 * Simple A/B test helper using cookies.
 *
 * Assigns users to test variants consistently using a cookie.
 * Works on both server and client side.
 */

/**
 * Generate a variant assignment (0 to numVariants-1) based on a seed string.
 * Uses a simple hash for deterministic assignment.
 */
function hashToVariant(seed: string, numVariants: number): number {
  let hash = 0
  for (let i = 0; i < seed.length; i++) {
    const char = seed.charCodeAt(i)
    hash = (hash << 5) - hash + char
    hash |= 0 // Convert to 32-bit integer
  }
  return Math.abs(hash) % numVariants
}

export interface ABTestConfig {
  /** Unique test name */
  name: string
  /** Variant names (e.g. ['control', 'variant_a', 'variant_b']) */
  variants: string[]
}

/**
 * Get or assign a variant for an A/B test.
 * Uses the provided userId/cookieValue as the assignment seed.
 *
 * @param config - Test configuration
 * @param userId - Unique user identifier (cookie value, session id, etc.)
 * @returns The assigned variant name
 */
export function getVariant(config: ABTestConfig, userId: string): string {
  if (config.variants.length === 0) {
    throw new Error(`A/B test "${config.name}" must have at least one variant`)
  }
  const seed = `${config.name}:${userId}`
  const index = hashToVariant(seed, config.variants.length)
  return config.variants[index]
}

/**
 * Check if user is in a specific variant.
 */
export function isInVariant(
  config: ABTestConfig,
  userId: string,
  variant: string
): boolean {
  return getVariant(config, userId) === variant
}

/**
 * Cookie name used to store the A/B test user ID.
 */
export const AB_TEST_COOKIE = 'rb_ab_uid'

/**
 * Generate a random user ID for A/B testing.
 */
export function generateABTestUserId(): string {
  return Math.random().toString(36).substring(2) + Date.now().toString(36)
}
