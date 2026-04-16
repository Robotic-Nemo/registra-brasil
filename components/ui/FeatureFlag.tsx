import type { ReactNode } from 'react'
import { isFeatureEnabled, type FeatureFlag as FeatureFlagType } from '@/lib/utils/feature-flags'

interface FeatureFlagProps {
  flag: FeatureFlagType
  children: ReactNode
  fallback?: ReactNode
}

/**
 * Conditionally renders children based on a feature flag.
 */
export function FeatureFlag({ flag, children, fallback = null }: FeatureFlagProps) {
  if (isFeatureEnabled(flag)) {
    return <>{children}</>
  }
  return <>{fallback}</>
}
