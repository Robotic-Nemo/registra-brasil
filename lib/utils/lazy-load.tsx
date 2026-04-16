import dynamic from 'next/dynamic'
import type { ComponentType } from 'react'

/**
 * Helper for lazy loading components with a consistent loading state.
 * Wraps Next.js `dynamic()` with sensible defaults.
 *
 * @example
 * const HeavyChart = lazyLoad(() => import('@/components/charts/HeavyChart'))
 */
export function lazyLoad<P extends object>(
  importFn: () => Promise<{ default: ComponentType<P> }>,
  options?: {
    ssr?: boolean
    loading?: () => React.ReactElement | null
  }
) {
  return dynamic(importFn, {
    ssr: options?.ssr ?? false,
    loading: options?.loading ?? (() => null),
  })
}

/**
 * Helper for lazy loading components with a skeleton placeholder.
 *
 * @example
 * const HeavyChart = lazyLoadWithSkeleton(
 *   () => import('@/components/charts/HeavyChart'),
 *   'h-64 w-full'
 * )
 */
export function lazyLoadWithSkeleton<P extends object>(
  importFn: () => Promise<{ default: ComponentType<P> }>,
  skeletonClassName = 'h-32 w-full'
) {
  return dynamic(importFn, {
    ssr: false,
    loading: () => {
      // Using a simple div instead of importing Skeleton to avoid circular deps
      const el = (
        <div
          className={`animate-pulse bg-gray-200 rounded-lg ${skeletonClassName}`}
          role="status"
          aria-label="Carregando componente"
        />
      )
      return el
    },
  })
}
