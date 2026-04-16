/**
 * Helper to analyze component import costs in development.
 * Logs approximate module sizes when components are loaded.
 */

const importTimings = new Map<string, number>()

/**
 * Wraps a dynamic import to measure how long it takes to load.
 * Usage: const Comp = lazy(() => measureImport('HeavyComponent', () => import('./HeavyComponent')))
 */
export async function measureImport<T>(label: string, importer: () => Promise<T>): Promise<T> {
  if (process.env.NODE_ENV !== 'development') return importer()

  const start = performance.now()
  try {
    const result = await importer()
    const elapsed = performance.now() - start
    importTimings.set(label, elapsed)
    console.debug(`[bundle] ${label}: loaded in ${elapsed.toFixed(1)}ms`)
    return result
  } catch (err) {
    console.error(`[bundle] ${label}: failed to load`, err)
    throw err
  }
}

/** Get all recorded import timings */
export function getImportTimings(): Map<string, number> {
  return new Map(importTimings)
}

/** Log a summary of all recorded import timings */
export function logImportSummary(): void {
  if (importTimings.size === 0) {
    console.debug('[bundle] No imports recorded')
    return
  }
  const sorted = [...importTimings.entries()].sort((a, b) => b[1] - a[1])
  console.table(sorted.map(([name, time]) => ({ component: name, loadTime: `${time.toFixed(1)}ms` })))
}
