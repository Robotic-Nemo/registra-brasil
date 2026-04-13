import Link from 'next/link'
import { Suspense } from 'react'
import { SearchBar } from '@/components/search/SearchBar'
import { Archive } from 'lucide-react'

export function Header() {
  return (
    <header className="sticky top-0 z-40 bg-white/95 backdrop-blur border-b border-gray-200">
      <div className="max-w-7xl mx-auto px-4 h-14 flex items-center gap-4">
        <Link href="/" className="flex items-center gap-2 flex-shrink-0">
          <Archive className="w-5 h-5 text-blue-700" />
          <span className="font-bold text-gray-900 hidden sm:block">Registra Brasil</span>
        </Link>

        <div className="flex-1 max-w-lg">
          <Suspense fallback={<div className="h-10 bg-gray-100 rounded-lg animate-pulse" />}>
            <SearchBar placeholder="Buscar declarações de políticos..." />
          </Suspense>
        </div>

        <nav className="hidden md:flex items-center gap-4 text-sm text-gray-600">
          <Link href="/buscar" className="hover:text-gray-900">Buscar</Link>
          <Link href="/categorias/racismo" className="hover:text-gray-900">Categorias</Link>
          <Link href="/sobre" className="hover:text-gray-900">Sobre</Link>
        </nav>
      </div>
    </header>
  )
}
