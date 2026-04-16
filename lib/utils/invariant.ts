/**
 * Asserts a condition is truthy, throwing an error with the given message if not.
 * Useful for asserting preconditions and narrowing types.
 *
 * @example
 * ```ts
 * invariant(user != null, 'User must be logged in')
 * // TypeScript now knows `user` is non-null
 * ```
 */
export function invariant(
  condition: unknown,
  message: string
): asserts condition {
  if (!condition) {
    throw new Error(`Invariant violation: ${message}`)
  }
}

/**
 * Like invariant, but returns the value if truthy (useful in expressions).
 *
 * @example
 * ```ts
 * const id = ensure(params.id, 'Missing route parameter: id')
 * ```
 */
export function ensure<T>(
  value: T | null | undefined,
  message: string
): T {
  if (value == null) {
    throw new Error(`Invariant violation: ${message}`)
  }
  return value
}
