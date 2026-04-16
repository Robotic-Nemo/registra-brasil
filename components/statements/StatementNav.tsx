import Link from 'next/link'
import { ChevronLeft, ChevronRight } from 'lucide-react'

interface NavStatement {
  slug: string | null
  id: string
  summary: string
}

interface Props {
  prev: NavStatement | null
  next: NavStatement | null
}

export function StatementNav({ prev, next }: Props) {
  if (!prev && !next) return null

  return (
    <nav className="flex items-stretch gap-4 mt-8" aria-label="Navegação entre declarações">
      {prev ? (
        <Link
          href={`/declaracao/${prev.slug ?? prev.id}`}
          className="flex-1 flex items-center gap-2 p-3 rounded-lg border border-gray-200 hover:border-blue-300 hover:bg-blue-50 transition-all text-left group"
        >
          <ChevronLeft className="w-4 h-4 text-gray-400 group-hover:text-blue-500 flex-shrink-0" />
          <div className="min-w-0">
            <p className="text-xs text-gray-400">Anterior</p>
            <p className="text-sm text-gray-700 group-hover:text-blue-800 line-clamp-1">{prev.summary}</p>
          </div>
        </Link>
      ) : (
        <div className="flex-1" />
      )}
      {next ? (
        <Link
          href={`/declaracao/${next.slug ?? next.id}`}
          className="flex-1 flex items-center gap-2 p-3 rounded-lg border border-gray-200 hover:border-blue-300 hover:bg-blue-50 transition-all text-right group justify-end"
        >
          <div className="min-w-0">
            <p className="text-xs text-gray-400">Próxima</p>
            <p className="text-sm text-gray-700 group-hover:text-blue-800 line-clamp-1">{next.summary}</p>
          </div>
          <ChevronRight className="w-4 h-4 text-gray-400 group-hover:text-blue-500 flex-shrink-0" />
        </Link>
      ) : (
        <div className="flex-1" />
      )}
    </nav>
  )
}
