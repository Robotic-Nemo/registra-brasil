import { SearchX } from 'lucide-react'
import Link from 'next/link'

interface NoResultsProps {
  query?: string
  message?: string
  suggestions?: string[]
}

export function NoResults({
  query,
  message = 'Nenhum resultado encontrado.',
  suggestions,
}: NoResultsProps) {
  return (
    <div className="flex flex-col items-center justify-center py-12 px-4 text-center">
      <div className="flex items-center justify-center w-14 h-14 rounded-full bg-gray-100 mb-4">
        <SearchX className="w-7 h-7 text-gray-400" />
      </div>
      <p className="text-base font-medium text-gray-900 mb-1">{message}</p>
      {query && (
        <p className="text-sm text-gray-500 mb-4">
          Nenhum resultado para <span className="font-semibold">&ldquo;{query}&rdquo;</span>.
        </p>
      )}
      {suggestions && suggestions.length > 0 && (
        <div className="text-sm text-gray-500 mb-4">
          <p className="mb-2">Tente:</p>
          <ul className="list-disc list-inside text-left space-y-1">
            {suggestions.map((s) => (
              <li key={s}>{s}</li>
            ))}
          </ul>
        </div>
      )}
      <Link
        href="/buscar"
        className="text-sm text-blue-700 hover:text-blue-800 hover:underline transition-colors"
      >
        Nova busca
      </Link>
    </div>
  )
}
