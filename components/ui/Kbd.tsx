import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  className?: string
}

export function Kbd({ children, className = '' }: Props) {
  return (
    <kbd
      className={`inline-block text-xs font-mono bg-gray-100 border border-gray-200 rounded px-1.5 py-0.5 text-gray-600 shadow-[0_1px_0_0_rgba(0,0,0,0.08)] ${className}`}
    >
      {children}
    </kbd>
  )
}
