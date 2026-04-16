import Link from 'next/link'
import { UserX, Search, Users } from 'lucide-react'

export default function PoliticianNotFound() {
  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center">
      <UserX className="w-12 h-12 text-gray-300 mx-auto mb-4" />
      <h1 className="text-xl font-bold text-gray-900 mb-2">Político não encontrado</h1>
      <p className="text-gray-500 text-sm mb-6">
        Não encontramos um político com esse identificador. Pode ser que o link esteja incorreto ou o perfil ainda não foi cadastrado.
      </p>
      <div className="flex items-center justify-center gap-3">
        <Link
          href="/politicos"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <Users className="w-4 h-4" />
          Ver políticos
        </Link>
        <Link
          href="/buscar"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors"
        >
          <Search className="w-4 h-4" />
          Buscar
        </Link>
      </div>
    </main>
  )
}
