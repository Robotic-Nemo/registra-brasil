import Link from 'next/link'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { Politician } from '@/types/database'
import { Plus, ArrowLeft, Search } from 'lucide-react'
import type { Metadata } from 'next'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Gerenciar Politicos — Admin',
}

export default async function AdminPoliticosPage() {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await supabase
    .from('politicians')
    .select('id, slug, full_name, common_name, party, state, role, is_active, photo_url')
    .order('common_name')

  const politicians = (data ?? []) as Pick<
    Politician,
    'id' | 'slug' | 'full_name' | 'common_name' | 'party' | 'state' | 'role' | 'is_active' | 'photo_url'
  >[]

  return (
    <main className="max-w-4xl mx-auto px-4 py-12">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-3">
          <Link
            href="/admin"
            className="text-gray-400 hover:text-gray-600 transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Politicos</h1>
            <p className="text-sm text-gray-500">{politicians.length} cadastrados</p>
          </div>
        </div>
        <Link
          href="/admin/adicionar"
          className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <Plus className="w-4 h-4" />
          Novo politico
        </Link>
      </div>

      {error && (
        <div className="bg-red-50 text-red-700 px-4 py-3 rounded-lg mb-6 text-sm">
          Erro ao carregar politicos: {error.message}
        </div>
      )}

      <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50 border-b border-gray-200">
            <tr>
              <th className="text-left px-4 py-3 font-medium text-gray-600">Nome</th>
              <th className="text-left px-4 py-3 font-medium text-gray-600">Partido</th>
              <th className="text-left px-4 py-3 font-medium text-gray-600">Estado</th>
              <th className="text-left px-4 py-3 font-medium text-gray-600">Cargo</th>
              <th className="text-left px-4 py-3 font-medium text-gray-600">Status</th>
              <th className="text-right px-4 py-3 font-medium text-gray-600">Acoes</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {politicians.map((p) => (
              <tr key={p.id} className="hover:bg-gray-50 transition-colors">
                <td className="px-4 py-3">
                  <div className="flex items-center gap-2">
                    {p.photo_url ? (
                      <img
                        src={p.photo_url}
                        alt=""
                        className="w-8 h-8 rounded-full object-cover"
                      />
                    ) : (
                      <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-xs font-medium">
                        {p.common_name.charAt(0)}
                      </div>
                    )}
                    <div>
                      <p className="font-medium text-gray-900">{p.common_name}</p>
                      <p className="text-xs text-gray-500">{p.full_name}</p>
                    </div>
                  </div>
                </td>
                <td className="px-4 py-3 text-gray-700">{p.party}</td>
                <td className="px-4 py-3 text-gray-700">{p.state ?? '—'}</td>
                <td className="px-4 py-3 text-gray-700">{p.role ?? '—'}</td>
                <td className="px-4 py-3">
                  <span
                    className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${
                      p.is_active
                        ? 'bg-green-100 text-green-700'
                        : 'bg-gray-100 text-gray-500'
                    }`}
                  >
                    {p.is_active ? 'Ativo' : 'Inativo'}
                  </span>
                </td>
                <td className="px-4 py-3 text-right">
                  <Link
                    href={`/admin/politicos/${p.slug}`}
                    className="text-blue-600 hover:text-blue-800 text-sm font-medium"
                  >
                    Editar
                  </Link>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {politicians.length === 0 && !error && (
          <div className="text-center py-12 text-gray-500 text-sm">
            Nenhum politico cadastrado.
          </div>
        )}
      </div>
    </main>
  )
}
