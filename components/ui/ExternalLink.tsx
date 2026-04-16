import { ExternalLink as ExternalLinkIcon } from 'lucide-react'
import type { ReactNode } from 'react'

interface Props {
  href: string
  children: ReactNode
  className?: string
  showIcon?: boolean
}

/**
 * Consistently styled external link with security attributes.
 */
export function ExternalLink({ href, children, className = '', showIcon = true }: Props) {
  return (
    <a
      href={href}
      target="_blank"
      rel="noopener noreferrer"
      className={`inline-flex items-center gap-1 text-blue-700 hover:text-blue-900 hover:underline ${className}`}
    >
      {children}
      {showIcon && <ExternalLinkIcon className="w-3 h-3 text-gray-400 flex-shrink-0" />}
    </a>
  )
}
