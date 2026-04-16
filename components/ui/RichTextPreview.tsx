'use client'

import { useMemo } from 'react'

interface Props {
  /** Raw text with simple markdown-like formatting: **bold**, *italic*, [link](url), \n for line breaks */
  content: string
  className?: string
}

/**
 * Renders simple markdown-like text safely without dangerouslySetInnerHTML.
 * Supports: **bold**, *italic*, [link](url), and line breaks.
 */
export function RichTextPreview({ content, className = '' }: Props) {
  const elements = useMemo(() => parseRichText(content), [content])

  return (
    <div className={`text-gray-700 leading-relaxed ${className}`}>
      {elements}
    </div>
  )
}

function parseRichText(text: string): React.ReactNode[] {
  const lines = text.split('\n')
  const result: React.ReactNode[] = []

  for (let i = 0; i < lines.length; i++) {
    if (i > 0) result.push(<br key={`br-${i}`} />)
    result.push(...parseInline(lines[i], `line-${i}`))
  }

  return result
}

function parseInline(text: string, prefix: string): React.ReactNode[] {
  const result: React.ReactNode[] = []
  // Match **bold**, *italic*, and [text](url) patterns
  const pattern = /(\*\*(.+?)\*\*|\*(.+?)\*|\[(.+?)\]\((https?:\/\/[^\s)]+)\))/g
  let lastIndex = 0
  let match: RegExpExecArray | null
  let idx = 0

  while ((match = pattern.exec(text)) !== null) {
    // Push text before match
    if (match.index > lastIndex) {
      result.push(text.slice(lastIndex, match.index))
    }

    if (match[2]) {
      // **bold**
      result.push(
        <strong key={`${prefix}-b-${idx}`} className="font-semibold">
          {match[2]}
        </strong>
      )
    } else if (match[3]) {
      // *italic*
      result.push(
        <em key={`${prefix}-i-${idx}`}>
          {match[3]}
        </em>
      )
    } else if (match[4] && match[5]) {
      // [text](url)
      result.push(
        <a
          key={`${prefix}-a-${idx}`}
          href={match[5]}
          target="_blank"
          rel="noopener noreferrer"
          className="text-blue-700 underline hover:text-blue-900"
        >
          {match[4]}
        </a>
      )
    }

    lastIndex = match.index + match[0].length
    idx++
  }

  // Push remaining text
  if (lastIndex < text.length) {
    result.push(text.slice(lastIndex))
  }

  return result
}
