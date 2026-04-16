/**
 * Type guard: value is not null or undefined.
 */
export function isNonNull<T>(value: T | null | undefined): value is T {
  return value != null
}

/**
 * Type guard: value is a string.
 */
export function isString(value: unknown): value is string {
  return typeof value === 'string'
}

/**
 * Type guard: value is a number (and not NaN).
 */
export function isNumber(value: unknown): value is number {
  return typeof value === 'number' && !Number.isNaN(value)
}

/**
 * Type guard: value is an array.
 */
export function isArray<T = unknown>(value: unknown): value is T[] {
  return Array.isArray(value)
}

/**
 * Type guard: value is a plain object (not null, not array).
 */
export function isObject(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

/**
 * Type guard: value is a non-empty string.
 */
export function isNonEmptyString(value: unknown): value is string {
  return typeof value === 'string' && value.length > 0
}

/**
 * Type guard: value is a boolean.
 */
export function isBoolean(value: unknown): value is boolean {
  return typeof value === 'boolean'
}

/**
 * Filter an array to remove null/undefined values with correct typing.
 *
 * @example
 * ```ts
 * const names = [null, 'Ana', undefined, 'Bruno'].filter(isNonNull) // string[]
 * ```
 */
export function filterNonNull<T>(arr: (T | null | undefined)[]): T[] {
  return arr.filter(isNonNull)
}
