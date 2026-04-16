import Link from 'next/link'
import type { Category } from '@/types/database'

interface CategoryCardProps {
  category: Category
  count?: number
}

/**
 * Category card with color indicator, name, description, and count.
 */
export function CategoryCard({ category, count }: CategoryCardProps) {
  return (
    <Link
      href={`/categorias/${category.slug}`}
      className="flex items-start gap-3 p-4 border border-gray-200 rounded-xl hover:shadow-md transition-shadow bg-white group"
      data-testid="category-card"
    >
      <span
        className="w-4 h-4 rounded-full mt-0.5 flex-shrink-0 ring-2 ring-white"
        style={{ backgroundColor: category.color_hex }}
        aria-hidden="true"
      />
      <div className="flex-1 min-w-0">
        <div className="flex items-center justify-between gap-2">
          <h3 className="font-semibold text-gray-900 group-hover:text-blue-700 transition-colors truncate">
            {category.label_pt}
          </h3>
          {count != null && count > 0 && (
            <span className="text-xs text-gray-400 tabular-nums flex-shrink-0">{count}</span>
          )}
        </div>
        {category.description && (
          <p className="text-sm text-gray-500 mt-1 line-clamp-2">{category.description}</p>
        )}
        {category.icon && (
          <span className="text-xs text-gray-400 mt-1 block">{category.icon}</span>
        )}
      </div>
    </Link>
  )
}
