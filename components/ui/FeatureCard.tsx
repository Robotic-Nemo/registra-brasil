import type { ReactNode } from 'react'

interface Props {
  icon: ReactNode
  title: string
  description: string
  className?: string
}

/**
 * Feature highlight card with icon, title, and description.
 * Useful for landing pages and feature lists.
 */
export function FeatureCard({ icon, title, description, className = '' }: Props) {
  return (
    <div className={`p-5 rounded-xl border border-gray-200 bg-white hover:shadow-sm transition-shadow ${className}`}>
      <div className="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600 mb-3">
        {icon}
      </div>
      <h3 className="text-sm font-semibold text-gray-900 mb-1">{title}</h3>
      <p className="text-sm text-gray-500 leading-relaxed">{description}</p>
    </div>
  )
}
