/**
 * Group an array of items by a key function.
 */
export function groupBy<T, K extends string>(items: T[], keyFn: (item: T) => K): Record<K, T[]> {
  const result = {} as Record<K, T[]>
  for (const item of items) {
    const key = keyFn(item)
    if (!result[key]) result[key] = []
    result[key].push(item)
  }
  return result
}

/**
 * Remove duplicates from an array by a key function.
 */
export function uniqueBy<T>(items: T[], keyFn: (item: T) => string): T[] {
  const seen = new Set<string>()
  return items.filter((item) => {
    const key = keyFn(item)
    if (seen.has(key)) return false
    seen.add(key)
    return true
  })
}

/**
 * Chunk an array into groups of a given size.
 */
export function chunk<T>(items: T[], size: number): T[][] {
  if (!Number.isFinite(size) || size <= 0) return items.length > 0 ? [items] : []
  const chunkSize = Math.floor(size)
  const result: T[][] = []
  for (let i = 0; i < items.length; i += chunkSize) {
    result.push(items.slice(i, i + chunkSize))
  }
  return result
}
