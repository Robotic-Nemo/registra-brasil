import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  direction?: 'row' | 'col'
  gap?: 'xs' | 'sm' | 'md' | 'lg'
  align?: 'start' | 'center' | 'end' | 'stretch'
  justify?: 'start' | 'center' | 'end' | 'between'
  wrap?: boolean
  className?: string
}

const gapMap = {
  xs: 'gap-1',
  sm: 'gap-2',
  md: 'gap-4',
  lg: 'gap-6',
} as const

const alignMap = {
  start: 'items-start',
  center: 'items-center',
  end: 'items-end',
  stretch: 'items-stretch',
} as const

const justifyMap = {
  start: 'justify-start',
  center: 'justify-center',
  end: 'justify-end',
  between: 'justify-between',
} as const

export function Stack({
  children,
  direction = 'col',
  gap = 'md',
  align = 'stretch',
  justify = 'start',
  wrap = false,
  className = '',
}: Props) {
  return (
    <div
      className={`flex ${direction === 'row' ? 'flex-row' : 'flex-col'} ${gapMap[gap]} ${alignMap[align]} ${justifyMap[justify]} ${wrap ? 'flex-wrap' : ''} ${className}`}
    >
      {children}
    </div>
  )
}
