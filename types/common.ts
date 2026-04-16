/**
 * Shared utility types used across the application.
 */

/** A value that may be null or undefined. */
export type Maybe<T> = T | null | undefined

/** A value that may be null. */
export type Nullable<T> = T | null

/** Make all properties of T optionally undefined, recursively. */
export type DeepPartial<T> = {
  [P in keyof T]?: T[P] extends object ? DeepPartial<T[P]> : T[P]
}

/** Make all properties of T readonly, recursively. */
export type DeepReadonly<T> = {
  readonly [P in keyof T]: T[P] extends object ? DeepReadonly<T[P]> : T[P]
}

/**
 * Extract the resolved type of a Promise.
 * NOTE: TypeScript 4.5+ includes a built-in `Awaited<T>` utility type.
 * This alias is kept for backwards compatibility but defers to the built-in.
 */
export type AwaitedType<T> = T extends Promise<infer U> ? U : T

/** Make specific keys required while keeping the rest unchanged. */
export type RequireKeys<T, K extends keyof T> = T & Required<Pick<T, K>>

/** Make specific keys optional while keeping the rest unchanged. */
export type OptionalKeys<T, K extends keyof T> = Omit<T, K> & Partial<Pick<T, K>>

/** A string literal union that still allows arbitrary strings (for autocomplete). */
export type LiteralUnion<T extends string> = T | (string & Record<never, never>)

/** Record with string keys and values of type T. */
export type Dict<T = unknown> = Record<string, T>

/** A function that takes no arguments and returns void. */
export type VoidFn = () => void

/** Extracts the element type from an array type. */
export type ArrayElement<A> = A extends readonly (infer T)[] ? T : never

/** Omit properties whose values are of type V. */
export type OmitByValue<T, V> = {
  [K in keyof T as T[K] extends V ? never : K]: T[K]
}

/** Pick properties whose values are of type V. */
export type PickByValue<T, V> = {
  [K in keyof T as T[K] extends V ? K : never]: T[K]
}

/** Branded type for nominal typing. */
export type Brand<T, B extends string> = T & { readonly __brand: B }

/** Common branded ID types. */
export type UUID = Brand<string, 'UUID'>
export type Slug = Brand<string, 'Slug'>
