/**
 * Batch processing utilities
 */

/**
 * Split an array into chunks of a given size
 */
export function chunk<T>(array: T[], size: number): T[][] {
  if (size <= 0) return array.length > 0 ? [array] : []
  const chunks: T[][] = []
  for (let i = 0; i < array.length; i += size) {
    chunks.push(array.slice(i, i + size))
  }
  return chunks
}

/**
 * Process items in parallel with a concurrency limit
 */
export async function processInParallel<T, R>(
  items: T[],
  fn: (item: T, index: number) => Promise<R>,
  concurrency = 5
): Promise<R[]> {
  const results: R[] = new Array(items.length)
  let nextIndex = 0

  async function worker() {
    while (nextIndex < items.length) {
      const index = nextIndex++
      results[index] = await fn(items[index], index)
    }
  }

  const workers = Array.from({ length: Math.min(concurrency, items.length) }, () => worker())
  await Promise.all(workers)

  return results
}

/**
 * Process items sequentially with optional delay between items
 */
export async function processSequentially<T, R>(
  items: T[],
  fn: (item: T, index: number) => Promise<R>,
  delayMs = 0
): Promise<R[]> {
  const results: R[] = []
  for (let i = 0; i < items.length; i++) {
    results.push(await fn(items[i], i))
    if (delayMs > 0 && i < items.length - 1) {
      await new Promise(r => setTimeout(r, delayMs))
    }
  }
  return results
}

/**
 * Collect results and errors separately
 */
export async function collectResults<T, R>(
  items: T[],
  fn: (item: T) => Promise<R>
): Promise<{ successes: R[]; errors: { item: T; error: unknown }[] }> {
  const successes: R[] = []
  const errors: { item: T; error: unknown }[] = []

  for (const item of items) {
    try {
      successes.push(await fn(item))
    } catch (error) {
      errors.push({ item, error })
    }
  }

  return { successes, errors }
}

/**
 * Process items in sequential batches — items within a batch run in parallel,
 * but batches run one after another.
 */
export async function batchSequential<T, R>(
  items: T[],
  batchSize: number,
  fn: (item: T, index: number) => Promise<R>
): Promise<R[]> {
  const batches = chunk(items, batchSize)
  const results: R[] = []
  let globalIndex = 0

  for (const batch of batches) {
    const batchResults = await Promise.all(
      batch.map((item, i) => fn(item, globalIndex + i))
    )
    results.push(...batchResults)
    globalIndex += batch.length
  }

  return results
}
