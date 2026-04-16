import type { ReactNode, ElementType, HTMLAttributes } from 'react'

interface Props extends HTMLAttributes<HTMLElement> {
  children: ReactNode
  /** HTML element to render. */
  as?: ElementType
  /** If true, becomes visible on focus (useful for skip links). */
  focusable?: boolean
}

/**
 * Visually hidden text accessible to screen readers.
 * When `focusable` is true, the element becomes visible on focus (e.g. skip links).
 */
export function ScreenReaderOnly({
  children,
  as: Tag = 'span',
  focusable = false,
  ...rest
}: Props) {
  const className = focusable
    ? 'sr-only focus:not-sr-only focus:absolute focus:z-50 focus:bg-white focus:px-4 focus:py-2 focus:text-sm focus:font-medium focus:shadow-lg focus:rounded'
    : 'sr-only'

  return (
    <Tag className={className} tabIndex={focusable ? 0 : undefined} {...rest}>
      {children}
    </Tag>
  )
}
