/**
 * A Result type for error handling without exceptions.
 * Inspired by Rust's Result<T, E>.
 */

export type Result<T, E = Error> =
  | { ok: true; value: T }
  | { ok: false; error: E }

/**
 * Create a success result.
 */
export function ok<T>(value: T): Result<T, never> {
  return { ok: true, value }
}

/**
 * Create an error result.
 */
export function err<E>(error: E): Result<never, E> {
  return { ok: false, error }
}

/**
 * Unwrap a Result, returning the value or throwing the error.
 */
export function unwrap<T, E>(result: Result<T, E>): T {
  if (result.ok) return result.value
  throw result.error instanceof Error
    ? result.error
    : new Error(String(result.error))
}

/**
 * Unwrap a Result, returning the value or a default.
 */
export function unwrapOr<T, E>(result: Result<T, E>, defaultValue: T): T {
  return result.ok ? result.value : defaultValue
}

/**
 * Map the success value of a Result.
 */
export function mapResult<T, U, E>(
  result: Result<T, E>,
  fn: (value: T) => U
): Result<U, E> {
  if (result.ok) return ok(fn(result.value))
  return result
}

/**
 * Map the error of a Result.
 */
export function mapError<T, E, F>(
  result: Result<T, E>,
  fn: (error: E) => F
): Result<T, F> {
  if (!result.ok) return err(fn(result.error))
  return result
}

/**
 * Wrap an async function call in a Result.
 *
 * @example
 * ```ts
 * const result = await tryCatch(() => fetchUser(id))
 * if (!result.ok) console.error(result.error)
 * ```
 */
export async function tryCatch<T>(
  fn: () => Promise<T>
): Promise<Result<T, Error>> {
  try {
    return ok(await fn())
  } catch (error) {
    return err(error instanceof Error ? error : new Error(String(error)))
  }
}

/**
 * Synchronous version of tryCatch.
 */
export function tryCatchSync<T>(fn: () => T): Result<T, Error> {
  try {
    return ok(fn())
  } catch (error) {
    return err(error instanceof Error ? error : new Error(String(error)))
  }
}
