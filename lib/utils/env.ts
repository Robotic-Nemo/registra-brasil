/**
 * Runtime environment validation.
 * Import at app startup to fail fast on missing required env vars.
 */

interface EnvConfig {
  /** Required variables that MUST be set */
  required: string[]
  /** Optional variables — logged as warnings if missing */
  optional: string[]
}

const ENV_CONFIG: EnvConfig = {
  required: [
    'NEXT_PUBLIC_SUPABASE_URL',
    'NEXT_PUBLIC_SUPABASE_ANON_KEY',
    'SUPABASE_SERVICE_ROLE_KEY',
    'ADMIN_SECRET',
  ],
  optional: [
    'YOUTUBE_API_KEY',
    'GOOGLE_CSE_API_KEY',
    'GOOGLE_CSE_ID',
    'ANTHROPIC_API_KEY',
    'REVALIDATE_SECRET',
    'NEXT_PUBLIC_SITE_URL',
  ],
}

export function validateEnv(): { valid: boolean; errors: string[]; warnings: string[] } {
  const errors: string[] = []
  const warnings: string[] = []

  for (const key of ENV_CONFIG.required) {
    if (!process.env[key]) {
      errors.push(`Missing required env var: ${key}`)
    }
  }

  for (const key of ENV_CONFIG.optional) {
    if (!process.env[key]) {
      warnings.push(`Missing optional env var: ${key}`)
    }
  }

  return { valid: errors.length === 0, errors, warnings }
}

/** Call during build/startup to log env status */
export function logEnvStatus(): void {
  const { errors, warnings } = validateEnv()

  for (const w of warnings) {
    console.warn(`[env] ${w}`)
  }
  for (const e of errors) {
    console.error(`[env] ${e}`)
  }
}
