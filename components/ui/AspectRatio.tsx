import type { ReactNode } from 'react'

interface Props {
  ratio?: number // width / height (e.g., 16/9)
  children: ReactNode
  className?: string
}

export function AspectRatio({ ratio = 16 / 9, children, className = '' }: Props) {
  return (
    <div
      className={`relative overflow-hidden ${className}`}
      style={{ paddingBottom: `${(1 / ratio) * 100}%` }}
    >
      <div className="absolute inset-0">{children}</div>
    </div>
  )
}
