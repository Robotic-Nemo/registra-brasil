import { Search } from 'lucide-react'
import Link from 'next/link'

interface SearchEmptyStateProps {
  query?: string
}

const SUGGESTIONS = [
  { label: 'Ver todos os politicos', href: '/politicos' },
  { label: 'Explorar por categoria', href: '/categorias' },
  { label: 'Declaracoes recentes', href: '/declaracoes-recentes' },
  { label: 'Politicos por estado', href: '/politicos/por-estado' },
]

/**
 * Helpful empty state shown when a search yields zero results.
 * Includes tips and navigation suggestions.
 */
export function SearchEmptyState({ query }: SearchEmptyStateProps) {
  return (
    <div className="text-center py-16" role="status" aria-live="polite">
      <Search className="w-12 h-12 text-gray-300 mx-auto mb-4" />
      <h2 className="text-lg font-semibold text-gray-900 mb-2">
        Nenhum resultado encontrado
      </h2>
      {query && (
        <p className="text-sm text-gray-500 mb-6">
          Nao encontramos resultados para <strong>&quot;{query}&quot;</strong>.
        </p>
      )}

      <div className="max-w-md mx-auto">
        <p className="text-sm text-gray-500 mb-3">Sugestoes:</p>
        <ul className="text-sm text-gray-600 space-y-1 mb-6">
          <li>Verifique a ortografia dos termos</li>
          <li>Use palavras mais genericas</li>
          <li>Tente remover filtros aplicados</li>
        </ul>

        <p className="text-sm text-gray-500 mb-3">Ou explore:</p>
        <div className="flex flex-wrap justify-center gap-2">
          {SUGGESTIONS.map((s) => (
            <Link
              key={s.href}
              href={s.href}
              className="text-sm text-blue-600 hover:text-blue-800 bg-blue-50 px-3 py-1.5 rounded-lg transition-colors"
            >
              {s.label}
            </Link>
          ))}
        </div>
      </div>
    </div>
  )
}
