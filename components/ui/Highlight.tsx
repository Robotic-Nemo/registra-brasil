interface Props {
  text: string
  query: string
  className?: string
}

/**
 * Highlights matching parts of text with a yellow background.
 * Case-insensitive matching.
 */
export function Highlight({ text, query, className = '' }: Props) {
  if (!query || query.length < 2) {
    return <span className={className}>{text}</span>
  }

  const regex = new RegExp(`(${query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')})`, 'gi')
  const parts = text.split(regex)

  return (
    <span className={className}>
      {parts.map((part, i) =>
        regex.test(part) ? (
          <mark key={i} className="bg-yellow-200 text-yellow-900 rounded-sm px-0.5">
            {part}
          </mark>
        ) : (
          <span key={i}>{part}</span>
        )
      )}
    </span>
  )
}
