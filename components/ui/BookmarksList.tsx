'use client'

import Link from 'next/link'
import { Bookmark, Trash2 } from 'lucide-react'
import { useBookmarks, type BookmarkItem } from '@/lib/hooks/useBookmarks'

function itemHref(item: BookmarkItem): string {
  if (item.type === 'politician') return `/politico/${item.slug}`
  return `/declaracoes-recentes/${item.slug}`
}

export function BookmarksList() {
  const { bookmarks, removeBookmark, clearAll } = useBookmarks()

  if (bookmarks.length === 0) {
    return (
      <div className="text-center py-12">
        <Bookmark className="h-12 w-12 mx-auto text-gray-300 dark:text-gray-600 mb-4" aria-hidden="true" />
        <p className="text-gray-500 dark:text-gray-400">Nenhum favorito salvo ainda.</p>
        <p className="text-sm text-gray-400 dark:text-gray-500 mt-1">
          Use o botao de salvar em declaracoes e politicos para adicioná-los aqui.
        </p>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <p className="text-sm text-gray-500 dark:text-gray-400">
          {bookmarks.length} {bookmarks.length === 1 ? 'item salvo' : 'itens salvos'}
        </p>
        <button
          onClick={clearAll}
          className="text-sm text-red-500 hover:text-red-700 dark:hover:text-red-400 flex items-center gap-1 transition-colors"
          aria-label="Remover todos os favoritos"
        >
          <Trash2 className="h-3.5 w-3.5" aria-hidden="true" />
          Limpar tudo
        </button>
      </div>
      <ul className="divide-y divide-gray-100 dark:divide-gray-800" role="list">
        {bookmarks.map((item) => (
          <li key={`${item.type}-${item.id}`} className="group flex items-center gap-3 py-3">
            <span className="shrink-0 text-xs font-medium uppercase text-gray-400 dark:text-gray-500 w-16">
              {item.type === 'politician' ? 'Politico' : 'Declaracao'}
            </span>
            <Link
              href={itemHref(item)}
              className="flex-1 text-sm font-medium text-gray-700 dark:text-gray-300 hover:text-blue-600 dark:hover:text-blue-400 truncate transition-colors"
            >
              {item.title}
            </Link>
            <button
              onClick={() => removeBookmark(item.id, item.type)}
              className="opacity-0 group-hover:opacity-100 p-1 text-gray-400 hover:text-red-500 transition-all"
              aria-label={`Remover ${item.title} dos favoritos`}
            >
              <Trash2 className="h-4 w-4" />
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}
