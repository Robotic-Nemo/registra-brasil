import Link from 'next/link'
import { Home, Search, BookOpen, Users, FileText } from 'lucide-react'
import type { Metadata } from 'next'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const metadata: Metadata = {
  title: 'Pagina nao encontrada - Registra Brasil',
  robots: { index: false, follow: false },
}

async function getRecentSuggestions() {
  try {
    const supabase = getSupabaseServiceClient()
    const { data } = await supabase
      .from('statements')
      .select('id, slug, summary, politicians(common_name)')
      .eq('verification_status', 'verified')
      .order('created_at', { ascending: false })
      .limit(3)
    return (data ?? []) as unknown as { id: string; slug: string | null; summary: string; politicians: { common_name: string } }[]
  } catch {
    return []
  }
}

export default async function NotFound() {
  const recent = await getRecentSuggestions()

  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center" role="main">
      <h1 className="text-6xl font-bold text-gray-200 mb-4" aria-label="Erro 404">404</h1>
      <p className="text-gray-700 text-lg font-semibold mb-2">Pagina nao encontrada</p>
      <p className="text-gray-500 text-sm mb-8">
        O conteudo que voce procura pode ter sido removido ou o endereco esta incorreto.
      </p>
      <div className="flex items-center justify-center gap-3 flex-wrap mb-10">
        <Link href="/"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors">
          <Home className="w-4 h-4" />
          Inicio
        </Link>
        <Link href="/buscar"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors">
          <Search className="w-4 h-4" />
          Buscar
        </Link>
      </div>

      {recent.length > 0 && (
        <div className="border-t border-gray-100 pt-8 mb-8">
          <p className="text-xs text-gray-400 uppercase tracking-wider mb-4">Declaracoes recentes</p>
          <div className="flex flex-col gap-2 text-left">
            {recent.map((s) => (
              <Link
                key={s.id}
                href={`/declaracao/${s.slug ?? s.id}`}
                className="flex items-start gap-2 text-sm text-gray-600 hover:text-blue-700 transition-colors p-2 rounded-lg hover:bg-gray-50"
              >
                <FileText className="w-4 h-4 mt-0.5 flex-shrink-0" />
                <div>
                  <span className="font-medium text-gray-800">{s.politicians.common_name}:</span>{' '}
                  <span className="line-clamp-1">{s.summary}</span>
                </div>
              </Link>
            ))}
          </div>
        </div>
      )}

      <div className="border-t border-gray-100 pt-8">
        <p className="text-xs text-gray-400 uppercase tracking-wider mb-4">Talvez voce procure</p>
        <div className="flex flex-col gap-2">
          <Link href="/politicos" className="flex items-center gap-2 text-sm text-gray-600 hover:text-blue-700 justify-center transition-colors">
            <Users className="w-4 h-4" />
            Lista de politicos monitorados
          </Link>
          <Link href="/categorias" className="flex items-center gap-2 text-sm text-gray-600 hover:text-blue-700 justify-center transition-colors">
            <BookOpen className="w-4 h-4" />
            Categorias de declaracoes
          </Link>
          <Link href="/sobre" className="flex items-center gap-2 text-sm text-gray-600 hover:text-blue-700 justify-center transition-colors">
            <BookOpen className="w-4 h-4" />
            Sobre o projeto
          </Link>
        </div>
      </div>
    </main>
  )
}
