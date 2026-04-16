import type { ReactNode } from 'react'

interface Props {
  label: string
  htmlFor?: string
  required?: boolean
  error?: string
  help?: string
  children: ReactNode
  className?: string
}

export function FormField({ label, htmlFor, required, error, help, children, className = '' }: Props) {
  return (
    <div className={className}>
      <label htmlFor={htmlFor} className="block text-sm font-medium text-gray-700 mb-1">
        {label}
        {required && <span className="text-red-500 ml-0.5">*</span>}
      </label>
      {children}
      {help && !error && (
        <p className="text-xs text-gray-400 mt-1" id={htmlFor ? `${htmlFor}-help` : undefined}>
          {help}
        </p>
      )}
      {error && (
        <p className="text-xs text-red-600 mt-1" role="alert" id={htmlFor ? `${htmlFor}-error` : undefined}>
          {error}
        </p>
      )}
    </div>
  )
}
