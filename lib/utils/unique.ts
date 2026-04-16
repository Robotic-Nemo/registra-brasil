/**
 * Unique array helpers.
 */

/**
 * Return unique values from an array (preserving order).
 *
 * @example
 * unique([1, 2, 2, 3]) // [1, 2, 3]
 */
export function unique<T>(arr: T[]): T[] {
  return [...new Set(arr)]
}

/**
 * Return unique values based on a key extractor function.
 *
 * @example
 * uniqueBy([{ id: 1, n: 'a' }, { id: 1, n: 'b' }, { id: 2, n: 'c' }], x => x.id)
 * // [{ id: 1, n: 'a' }, { id: 2, n: 'c' }]
 */
export function uniqueBy<T, K>(arr: T[], keyFn: (item: T) => K): T[] {
  const seen = new Set<K>()
  const result: T[] = []

  for (const item of arr) {
    const key = keyFn(item)
    if (!seen.has(key)) {
      seen.add(key)
      result.push(item)
    }
  }

  return result
}

/**
 * Count occurrences of each value in an array.
 *
 * @example
 * countBy(['a', 'b', 'a']) // Map { 'a' => 2, 'b' => 1 }
 */
export function countBy<T>(arr: T[]): Map<T, number> {
  const counts = new Map<T, number>()
  for (const item of arr) {
    counts.set(item, (counts.get(item) ?? 0) + 1)
  }
  return counts
}

/**
 * Return items that appear in both arrays.
 *
 * @example
 * intersection([1, 2, 3], [2, 3, 4]) // [2, 3]
 */
export function intersection<T>(a: T[], b: T[]): T[] {
  const setB = new Set(b)
  return unique(a.filter((item) => setB.has(item)))
}

/**
 * Return items that appear in the first array but not the second.
 *
 * @example
 * difference([1, 2, 3], [2, 3, 4]) // [1]
 */
export function difference<T>(a: T[], b: T[]): T[] {
  const setB = new Set(b)
  return unique(a.filter((item) => !setB.has(item)))
}
