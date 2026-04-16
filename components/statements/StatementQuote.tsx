interface StatementQuoteProps {
  quote: string
  politicianName: string
  date: string
  venue?: string | null
  className?: string
}

/**
 * Styled blockquote for statement full quotes
 */
export function StatementQuote({
  quote,
  politicianName,
  date,
  venue,
  className = '',
}: StatementQuoteProps) {
  return (
    <figure className={className}>
      <blockquote
        className="relative border-l-4 border-blue-500 pl-4 py-2 italic text-zinc-700 text-lg leading-relaxed"
        dir="auto"
      >
        <span className="text-4xl text-blue-200 absolute -top-2 -left-1 font-serif" aria-hidden="true">
          &ldquo;
        </span>
        <p className="relative z-10">{quote}</p>
      </blockquote>
      <figcaption className="mt-3 text-sm text-zinc-500">
        <span className="font-semibold text-zinc-700" translate="no">{politicianName}</span>
        {venue && <span> — {venue}</span>}
        <time className="block text-xs text-zinc-400 mt-0.5" dateTime={date}>
          {date}
        </time>
      </figcaption>
    </figure>
  )
}
