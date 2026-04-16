/**
 * Error boundary helper utilities.
 */

/**
 * Extract a user-friendly message from an unknown error value.
 */
export function getErrorMessage(error: unknown): string {
  if (error instanceof Error) return error.message
  if (typeof error === 'string') return error
  return 'Ocorreu um erro inesperado.'
}

/**
 * Extract error digest (Next.js specific) if available.
 */
export function getErrorDigest(error: unknown): string | undefined {
  if (
    error &&
    typeof error === 'object' &&
    'digest' in error &&
    typeof (error as { digest?: unknown }).digest === 'string'
  ) {
    return (error as { digest: string }).digest
  }
  return undefined
}

/**
 * Create a "report problem" mailto link with error context.
 */
export function buildReportUrl(error: unknown, pageUrl?: string): string {
  const message = getErrorMessage(error)
  const digest = getErrorDigest(error)
  const subject = encodeURIComponent('Relato de problema - Registra Brasil')
  const body = encodeURIComponent(
    [
      'Descreva o que estava fazendo quando o erro ocorreu:',
      '',
      '---',
      `Mensagem: ${message}`,
      digest ? `Código: ${digest}` : '',
      pageUrl ? `Página: ${pageUrl}` : '',
      `Data: ${new Date().toISOString()}`,
    ]
      .filter(Boolean)
      .join('\n')
  )
  return `mailto:contato@registrabrasil.com.br?subject=${subject}&body=${body}`
}

/**
 * Safely execute a function and return a Result-like tuple.
 */
export function trySafe<T>(fn: () => T): [T, null] | [null, Error] {
  try {
    const result = fn()
    return [result, null]
  } catch (err) {
    return [null, err instanceof Error ? err : new Error(String(err))]
  }
}

/**
 * Async version of trySafe.
 */
export async function trySafeAsync<T>(fn: () => Promise<T>): Promise<[T, null] | [null, Error]> {
  try {
    const result = await fn()
    return [result, null]
  } catch (err) {
    return [null, err instanceof Error ? err : new Error(String(err))]
  }
}
