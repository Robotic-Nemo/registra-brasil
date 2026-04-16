'use client'

import { useCallback, useMemo } from 'react'
import { useRouter, usePathname, useSearchParams as useNextSearchParams } from 'next/navigation'

/**
 * Type-safe hook for managing URL search params.
 * Wraps Next.js useSearchParams with convenient getters/setters.
 */
export function useTypedSearchParams() {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useNextSearchParams()

  const params = useMemo(
    () => new URLSearchParams(searchParams?.toString() ?? ''),
    [searchParams]
  )

  /** Get a single param value */
  const get = useCallback(
    (key: string): string | null => params.get(key),
    [params]
  )

  /** Get a param as number, or default */
  const getNumber = useCallback(
    (key: string, defaultValue: number): number => {
      const val = params.get(key)
      if (!val) return defaultValue
      const n = parseInt(val, 10)
      return isNaN(n) ? defaultValue : n
    },
    [params]
  )

  /** Get all values for a key (for multi-select) */
  const getAll = useCallback(
    (key: string): string[] => params.getAll(key),
    [params]
  )

  /** Set one or more params and push to URL */
  const set = useCallback(
    (updates: Record<string, string | number | null | undefined>) => {
      const newParams = new URLSearchParams(params)
      for (const [key, value] of Object.entries(updates)) {
        if (value == null || value === '') {
          newParams.delete(key)
        } else {
          newParams.set(key, String(value))
        }
      }
      const qs = newParams.toString()
      router.push(qs ? `${pathname}?${qs}` : pathname)
    },
    [params, pathname, router]
  )

  /** Toggle a value in a multi-value param */
  const toggle = useCallback(
    (key: string, value: string) => {
      const newParams = new URLSearchParams(params)
      const existing = newParams.getAll(key)
      if (existing.includes(value)) {
        newParams.delete(key)
        for (const v of existing) {
          if (v !== value) newParams.append(key, v)
        }
      } else {
        newParams.append(key, value)
      }
      const qs = newParams.toString()
      router.push(qs ? `${pathname}?${qs}` : pathname)
    },
    [params, pathname, router]
  )

  /** Remove a param and push */
  const remove = useCallback(
    (key: string) => {
      const newParams = new URLSearchParams(params)
      newParams.delete(key)
      const qs = newParams.toString()
      router.push(qs ? `${pathname}?${qs}` : pathname)
    },
    [params, pathname, router]
  )

  /** Clear all params */
  const clear = useCallback(() => {
    router.push(pathname)
  }, [pathname, router])

  return { get, getNumber, getAll, set, toggle, remove, clear, params }
}
