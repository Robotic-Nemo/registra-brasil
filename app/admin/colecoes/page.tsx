import Link from 'next/link'
import { FolderKanban, Plus, ArrowLeft } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

export default async function AdminCollectionsIndex() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, is_published, published_at, updated_at')
    .order('updated_at', { ascending: false })

  const rows = (data ?? []) as Array<{
    id: string
    slug: string
    title: string
    subtitle: string | null
    is_published: boolean
    published_at: string | null
    updated_at: string
  }>

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <FolderKanban className="w-5 h-5 text-blue-700" />
            Coleções editoriais
          </h1>
        </div>
        <Link
          href="/admin/colecoes/nova"
          className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 text-white text-sm rounded hover:bg-blue-700"
        >
          <Plus className="w-4 h-4" /> Nova coleção
        </Link>
      </div>

      {rows.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-4">
          Nenhuma coleção criada. Comece com o botão acima.
        </p>
      ) : (
        <ul className="flex flex-col gap-2">
          {rows.map((c) => (
            <li key={c.id}>
              <Link
                href={`/admin/colecoes/${c.slug}`}
                className="block bg-white border border-gray-200 rounded-lg p-4 hover:border-blue-400 hover:shadow-sm transition-all"
              >
                <div className="flex items-center justify-between gap-3 mb-1">
                  <p className="font-semibold text-gray-900">{c.title}</p>
                  <span className={`text-xs px-2 py-0.5 rounded font-medium ${c.is_published ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-700'}`}>
                    {c.is_published ? 'publicada' : 'rascunho'}
                  </span>
                </div>
                {c.subtitle && <p className="text-sm text-gray-600 mb-1">{c.subtitle}</p>}
                <p className="text-xs text-gray-500">
                  /colecao/{c.slug} · atualizada em {new Date(c.updated_at).toLocaleString('pt-BR')}
                </p>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
