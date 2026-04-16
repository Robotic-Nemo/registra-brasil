/**
 * Pipe a value through a series of unary functions, left to right.
 *
 * @example
 * ```ts
 * const result = pipe(
 *   '  Hello World  ',
 *   (s) => s.trim(),
 *   (s) => s.toLowerCase(),
 *   (s) => s.replace(/\s+/g, '-'),
 * )
 * // => 'hello-world'
 * ```
 */
export function pipe<A>(value: A): A
export function pipe<A, B>(value: A, fn1: (a: A) => B): B
export function pipe<A, B, C>(value: A, fn1: (a: A) => B, fn2: (b: B) => C): C
export function pipe<A, B, C, D>(
  value: A,
  fn1: (a: A) => B,
  fn2: (b: B) => C,
  fn3: (c: C) => D
): D
export function pipe<A, B, C, D, E>(
  value: A,
  fn1: (a: A) => B,
  fn2: (b: B) => C,
  fn3: (c: C) => D,
  fn4: (d: D) => E
): E
export function pipe<A, B, C, D, E, F>(
  value: A,
  fn1: (a: A) => B,
  fn2: (b: B) => C,
  fn3: (c: C) => D,
  fn4: (d: D) => E,
  fn5: (e: E) => F
): F
export function pipe(value: unknown, ...fns: ((arg: unknown) => unknown)[]): unknown {
  return fns.reduce((acc, fn) => fn(acc), value)
}

/**
 * Compose functions right to left (opposite of pipe).
 *
 * @example
 * ```ts
 * const slugify = compose(
 *   (s: string) => s.replace(/\s+/g, '-'),
 *   (s: string) => s.toLowerCase(),
 *   (s: string) => s.trim(),
 * )
 * slugify('  Hello World  ') // => 'hello-world'
 * ```
 */
export function compose<T>(...fns: ((arg: T) => T)[]): (value: T) => T {
  return (value: T) => fns.reduceRight((acc, fn) => fn(acc), value)
}
