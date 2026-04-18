'use client'

import { Bookmark } from 'lucide-react'
import { BookmarksList } from '@/components/ui/BookmarksList'

export default function FavoritosPage() {
  return (
    <main className="container mx-auto max-w-3xl px-4 py-8">
      <div className="flex items-center gap-3 mb-8">
        <Bookmark className="h-7 w-7 text-yellow-500" aria-hidden="true" />
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">Favoritos</h1>
      </div>
      <p className="text-gray-500 dark:text-gray-400 mb-6">
        Seus itens salvos ficam armazenados apenas neste navegador.
      </p>
      <BookmarksList />
    </main>
  )
}
