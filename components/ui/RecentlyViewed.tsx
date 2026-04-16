'use client'

import Link from 'next/link'
import { Clock, X } from 'lucide-react'
import { useRecentlyViewed, type RecentlyViewedItem } from '@/lib/hooks/useRecentlyViewed'

function itemHref(item: RecentlyViewedItem): string {
  if (item.type === 'politician') return `/politico/${item.slug}`
  return `/declaracoes-recentes/${item.slug}`
}

export function RecentlyViewed() {
  const { items, removeItem, clearAll } = useRecentlyViewed()

  if (items.length === 0) return null

  return (
    <section aria-label="Visualizados recentemente" className="space-y-3">
      <div className="flex items-center justify-between">
        <h3 className="text-sm font-semibold text-gray-700 dark:text-gray-300 flex items-center gap-1.5">
          <Clock className="h-4 w-4" aria-hidden="true" />
          Visualizados recentemente
        </h3>
        <button
          onClick={clearAll}
          className="text-xs text-gray-500 hover:text-gray-700 dark:hover:text-gray-300 transition-colors"
          aria-label="Limpar historico de visualizacoes"
        >
          Limpar
        </button>
      </div>
      <ul className="space-y-1" role="list">
        {items.slice(0, 10).map((item) => (
          <li key={`${item.type}-${item.id}`} className="group flex items-center gap-2">
            <Link
              href={itemHref(item)}
              className="flex-1 text-sm text-gray-600 dark:text-gray-400 hover:text-blue-600 dark:hover:text-blue-400 truncate transition-colors"
            >
              <span className="inline-block w-5 text-xs text-gray-400">
                {item.type === 'politician' ? 'P' : 'D'}
              </span>
              {item.title}
            </Link>
            <button
              onClick={() => removeItem(item.id, item.type)}
              className="opacity-0 group-hover:opacity-100 p-0.5 text-gray-400 hover:text-red-500 transition-all"
              aria-label={`Remover ${item.title} do historico`}
            >
              <X className="h-3 w-3" />
            </button>
          </li>
        ))}
      </ul>
    </section>
  )
}
