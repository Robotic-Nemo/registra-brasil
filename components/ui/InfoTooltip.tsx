import { Info } from 'lucide-react'

interface Props {
  text: string
  className?: string
}

/**
 * Small info icon with a tooltip on hover.
 * Uses CSS-only tooltip via `group` and `peer`.
 */
export function InfoTooltip({ text, className = '' }: Props) {
  return (
    <span className={`relative inline-flex items-center group ${className}`}>
      <Info className="w-3.5 h-3.5 text-gray-400 cursor-help" aria-label={text} />
      <span
        className="absolute bottom-full left-1/2 -translate-x-1/2 mb-1.5 px-2 py-1 text-xs text-white bg-gray-900 rounded shadow-lg whitespace-nowrap opacity-0 group-hover:opacity-100 pointer-events-none transition-opacity duration-150 z-10"
        role="tooltip"
      >
        {text}
        <span className="absolute top-full left-1/2 -translate-x-1/2 w-0 h-0 border-4 border-transparent border-t-gray-900" />
      </span>
    </span>
  )
}
