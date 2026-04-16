import Link from 'next/link'

interface CategoryBadgeProps {
  slug: string
  label: string
  colorHex: string
  /** If true, renders as a link to the category page */
  linked?: boolean
}

/**
 * Inline category badge with color indicator.
 * Used in statement cards and search results.
 */
export function CategoryBadge({ slug, label, colorHex, linked = true }: CategoryBadgeProps) {
  const content = (
    <>
      <span
        className="w-2 h-2 rounded-full flex-shrink-0"
        style={{ backgroundColor: colorHex }}
        aria-hidden="true"
      />
      <span>{label}</span>
    </>
  )

  const className =
    'inline-flex items-center gap-1.5 text-xs px-2 py-1 rounded-full bg-gray-100 text-gray-700 hover:bg-gray-200 transition-colors'

  if (linked) {
    return (
      <Link href={`/categorias/${slug}`} className={className}>
        {content}
      </Link>
    )
  }

  return <span className={className}>{content}</span>
}
