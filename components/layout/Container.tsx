import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  size?: 'sm' | 'md' | 'lg' | 'xl'
  className?: string
  as?: 'div' | 'main' | 'section'
}

const sizeMap = {
  sm: 'max-w-2xl',
  md: 'max-w-3xl',
  lg: 'max-w-5xl',
  xl: 'max-w-7xl',
} as const

export function Container({ children, size = 'xl', className = '', as: Tag = 'div' }: Props) {
  return (
    <Tag className={`${sizeMap[size]} mx-auto px-4 ${className}`}>
      {children}
    </Tag>
  )
}
