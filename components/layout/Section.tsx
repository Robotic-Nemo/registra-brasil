import type { ReactNode } from 'react'

interface Props {
  title?: string
  description?: string
  children: ReactNode
  className?: string
  id?: string
}

export function Section({ title, description, children, className = '', id }: Props) {
  return (
    <section id={id} className={`py-8 ${className}`}>
      {(title || description) && (
        <div className="mb-6">
          {title && <h2 className="text-xl font-bold text-gray-900">{title}</h2>}
          {description && <p className="text-sm text-gray-500 mt-1">{description}</p>}
        </div>
      )}
      {children}
    </section>
  )
}
