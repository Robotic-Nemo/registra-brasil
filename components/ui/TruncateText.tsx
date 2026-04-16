'use client'

import { useState } from 'react'

interface Props {
  text: string
  maxLength?: number
  className?: string
}

export function TruncateText({ text, maxLength = 200, className = '' }: Props) {
  const [expanded, setExpanded] = useState(false)

  if (text.length <= maxLength) {
    return <p className={className}>{text}</p>
  }

  const truncated = text.slice(0, maxLength)
  const lastSpace = truncated.lastIndexOf(' ')
  const display = lastSpace > maxLength * 0.6 ? truncated.slice(0, lastSpace) : truncated

  return (
    <p className={className}>
      {expanded ? text : `${display}…`}{' '}
      <button
        onClick={() => setExpanded(!expanded)}
        className="text-blue-600 hover:text-blue-800 text-sm font-medium"
      >
        {expanded ? 'Menos' : 'Mais'}
      </button>
    </p>
  )
}
