'use client'

import type { ReactNode, ButtonHTMLAttributes } from 'react'

interface Props extends ButtonHTMLAttributes<HTMLButtonElement> {
  /** Icon or content to display. */
  children: ReactNode
  /** Position on screen. */
  position?: 'bottom-right' | 'bottom-left' | 'bottom-center'
  /** Size variant. */
  size?: 'sm' | 'md' | 'lg'
  /** Color variant. */
  variant?: 'primary' | 'secondary'
}

const positionMap = {
  'bottom-right': 'bottom-6 right-6',
  'bottom-left': 'bottom-6 left-6',
  'bottom-center': 'bottom-6 left-1/2 -translate-x-1/2',
} as const

const sizeMap = {
  sm: 'w-10 h-10',
  md: 'w-12 h-12',
  lg: 'w-14 h-14',
} as const

const variantMap = {
  primary: 'bg-blue-600 text-white hover:bg-blue-700 shadow-lg shadow-blue-600/25',
  secondary: 'bg-white text-gray-900 hover:bg-gray-50 shadow-lg border border-gray-200',
} as const

/**
 * Material-style floating action button positioned fixed on screen.
 */
export function FloatingActionButton({
  children,
  position = 'bottom-right',
  size = 'md',
  variant = 'primary',
  className = '',
  ...rest
}: Props) {
  return (
    <button
      type="button"
      className={`fixed ${positionMap[position]} ${sizeMap[size]} ${variantMap[variant]} rounded-full flex items-center justify-center transition-all hover:scale-105 active:scale-95 z-40 ${className}`}
      {...rest}
    >
      {children}
    </button>
  )
}
