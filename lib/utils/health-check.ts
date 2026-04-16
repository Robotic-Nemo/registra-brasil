/**
 * Application health check utility.
 * Checks database connectivity, required environment variables, etc.
 */

export interface HealthStatus {
  status: 'healthy' | 'degraded' | 'unhealthy'
  timestamp: string
  checks: HealthCheck[]
  version?: string
}

export interface HealthCheck {
  name: string
  status: 'pass' | 'fail' | 'warn'
  message?: string
  durationMs?: number
}

/**
 * Check that required environment variables are present.
 */
function checkEnvVars(): HealthCheck {
  const required = [
    'NEXT_PUBLIC_SUPABASE_URL',
    'NEXT_PUBLIC_SUPABASE_ANON_KEY',
  ]

  const missing = required.filter((key) => !process.env[key])

  if (missing.length > 0) {
    return {
      name: 'env_vars',
      status: 'fail',
      message: `Variáveis faltando: ${missing.join(', ')}`,
    }
  }

  // Optional but recommended
  const optional = ['SUPABASE_SERVICE_ROLE_KEY', 'ADMIN_SECRET']
  const missingOptional = optional.filter((key) => !process.env[key])

  if (missingOptional.length > 0) {
    return {
      name: 'env_vars',
      status: 'warn',
      message: `Variáveis opcionais faltando: ${missingOptional.join(', ')}`,
    }
  }

  return { name: 'env_vars', status: 'pass' }
}

/**
 * Check database connectivity by running a simple query.
 * Accepts a Supabase client to avoid importing server-only code.
 */
async function checkDatabase(
  supabase: { from: (table: string) => any } | null
): Promise<HealthCheck> {
  if (!supabase) {
    return { name: 'database', status: 'fail', message: 'Supabase client não disponível' }
  }

  const start = Date.now()
  try {
    const { error } = await supabase
      .from('politicians')
      .select('id', { count: 'exact', head: true })

    const durationMs = Date.now() - start

    if (error) {
      return {
        name: 'database',
        status: 'fail',
        message: `Erro de conexão: ${error.message}`,
        durationMs,
      }
    }

    if (durationMs > 5000) {
      return {
        name: 'database',
        status: 'warn',
        message: `Consulta lenta (${durationMs}ms)`,
        durationMs,
      }
    }

    return { name: 'database', status: 'pass', durationMs }
  } catch (err) {
    return {
      name: 'database',
      status: 'fail',
      message: `Exceção: ${err instanceof Error ? err.message : 'desconhecido'}`,
      durationMs: Date.now() - start,
    }
  }
}

/**
 * Run all health checks.
 *
 * @param supabase - Optional Supabase client for DB check.
 *   Pass null to skip the database check (e.g., in edge runtime where
 *   the service client is not available).
 */
export async function runHealthCheck(
  supabase: { from: (table: string) => any } | null = null
): Promise<HealthStatus> {
  const checks: HealthCheck[] = []

  // Env vars (sync)
  checks.push(checkEnvVars())

  // Database (async)
  checks.push(await checkDatabase(supabase))

  // Determine overall status
  const hasFailure = checks.some((c) => c.status === 'fail')
  const hasWarning = checks.some((c) => c.status === 'warn')

  return {
    status: hasFailure ? 'unhealthy' : hasWarning ? 'degraded' : 'healthy',
    timestamp: new Date().toISOString(),
    checks,
    version: process.env.npm_package_version ?? '0.1.0',
  }
}
