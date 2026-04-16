import type { Category } from '@/types/database'

interface CategoryTagProps {
  category: Pick<Category, 'slug' | 'label_pt' | 'color_hex'>
  size?: 'sm' | 'md'
}

export function CategoryTag({ category, size = 'md' }: CategoryTagProps) {
  const sizeClass = size === 'sm' ? 'text-xs px-2 py-0.5' : 'text-sm px-2.5 py-1'
  const color = category.color_hex || '#6b7280'

  return (
    <span
      className={`inline-flex items-center gap-1.5 rounded-full font-medium ${sizeClass}`}
      style={{
        backgroundColor: `${color}20`,
        color,
        border: `1px solid ${color}40`,
      }}
    >
      <span
        className="w-1.5 h-1.5 rounded-full flex-shrink-0"
        style={{ backgroundColor: color }}
      />
      {category.label_pt}
    </span>
  )
}
