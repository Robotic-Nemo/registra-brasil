/**
 * Measure the execution time of an async function.
 * Logs the result in development.
 */
export async function measure<T>(label: string, fn: () => Promise<T>): Promise<T> {
  const start = performance.now()
  try {
    return await fn()
  } finally {
    const elapsed = performance.now() - start
    if (process.env.NODE_ENV === 'development') {
      console.debug(`[perf] ${label}: ${elapsed.toFixed(1)}ms`)
    }
  }
}

/**
 * Report Web Vitals metrics (for use with Next.js reportWebVitals).
 */
export function reportWebVital(metric: { name: string; value: number; id: string }) {
  if (process.env.NODE_ENV !== 'production') return
  console.debug(`[web-vital] ${metric.name}: ${metric.value.toFixed(1)}`)
}
