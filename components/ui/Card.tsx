import type { ReactNode } from 'react'

interface CardProps {
  children: ReactNode
  className?: string
  as?: 'div' | 'article' | 'section'
  padding?: 'sm' | 'md' | 'lg'
  hoverable?: boolean
}

const paddingMap = {
  sm: 'p-3',
  md: 'p-4',
  lg: 'p-6',
} as const

export function Card({ children, className = '', as: Tag = 'div', padding = 'md', hoverable = false }: CardProps) {
  const hoverClass = hoverable ? 'hover:shadow-md transition-shadow' : ''
  return (
    <Tag className={`bg-white border border-gray-200 rounded-xl ${paddingMap[padding]} ${hoverClass} ${className}`}>
      {children}
    </Tag>
  )
}
