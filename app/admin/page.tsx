import Link from 'next/link'
import { redirect } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { PlusCircle, List } from 'lucide-react'

// Protect with ADMIN_SECRET env var checked via cookie
export default async function AdminPage() {
  return (
    <main className="max-w-2xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Painel de Edição</h1>
      <p className="text-gray-500 text-sm mb-8">Área restrita a editores.</p>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <Link
          href="/admin/adicionar"
          className="flex flex-col gap-2 p-5 border border-gray-200 rounded-xl hover:shadow-md transition-shadow"
        >
          <PlusCircle className="w-6 h-6 text-blue-600" />
          <p className="font-semibold text-gray-900">Adicionar declaração</p>
          <p className="text-sm text-gray-500">Registrar nova declaração com fonte primária</p>
        </Link>

        <Link
          href="/buscar"
          className="flex flex-col gap-2 p-5 border border-gray-200 rounded-xl hover:shadow-md transition-shadow"
        >
          <List className="w-6 h-6 text-gray-600" />
          <p className="font-semibold text-gray-900">Ver arquivo</p>
          <p className="text-sm text-gray-500">Buscar e revisar declarações existentes</p>
        </Link>
      </div>
    </main>
  )
}
