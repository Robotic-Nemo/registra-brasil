import type { ReactNode } from 'react'
import { Quote as QuoteIcon } from 'lucide-react'

interface Props {
  children: ReactNode
  citation?: string
  citationUrl?: string
  className?: string
}

/**
 * Styled quote component with optional citation and link.
 */
export function Quote({ children, citation, citationUrl, className = '' }: Props) {
  return (
    <blockquote
      className={`relative border-l-4 border-blue-300 bg-blue-50/50 rounded-r-lg pl-5 pr-4 py-4 ${className}`}
    >
      <QuoteIcon
        className="absolute -top-2 -left-3 w-6 h-6 text-blue-300 bg-white rounded-full p-0.5"
        aria-hidden="true"
      />
      <div className="text-gray-800 text-sm leading-relaxed italic">{children}</div>
      {citation && (
        <footer className="mt-3 text-xs text-gray-500">
          {'— '}
          {citationUrl ? (
            <a
              href={citationUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-blue-700 underline underline-offset-2 transition-colors"
            >
              {citation}
            </a>
          ) : (
            <span>{citation}</span>
          )}
        </footer>
      )}
    </blockquote>
  )
}
