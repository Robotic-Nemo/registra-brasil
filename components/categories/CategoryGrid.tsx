import type { Category } from '@/types/database'
import { CategoryCard } from './CategoryCard'

interface CategoryGridProps {
  categories: Category[]
  countMap?: Record<string, number>
}

/**
 * Responsive grid of category cards.
 */
export function CategoryGrid({ categories, countMap }: CategoryGridProps) {
  if (categories.length === 0) {
    return (
      <p className="text-center text-gray-500 py-8">
        Nenhuma categoria encontrada.
      </p>
    )
  }

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      {categories.map((cat) => (
        <CategoryCard
          key={cat.id}
          category={cat}
          count={countMap?.[cat.id]}
        />
      ))}
    </div>
  )
}
