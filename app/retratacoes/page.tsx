import Link from 'next/link'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { AlertTriangle } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Retratações e correções — Registra Brasil',
  description:
    'Histórico público de declarações removidas ou corrigidas do arquivo após revisão editorial.',
  alternates: { canonical: '/retratacoes' },
  openGraph: {
    title: 'Retratações e correções — Registra Brasil',
    description: 'Histórico público de declarações removidas ou corrigidas.',
    type: 'website',
    url: `${SITE_URL}/retratacoes`,
    siteName: 'Registra Brasil',
  },
}

interface RemovedRow {
  id: string
  slug: string | null
  summary: string
  updated_at: string
  editor_notes: string | null
  politicians: { common_name: string; slug: string }
}

async function getRetractions(): Promise<RemovedRow[]> {
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('statements')
    .select('id, slug, summary, updated_at, editor_notes, politicians!inner(common_name, slug)')
    .eq('verification_status', 'removed')
    .order('updated_at', { ascending: false })
    .limit(200)

  return (data ?? []) as unknown as RemovedRow[]
}

export default async function RetratacoesPage() {
  const rows = await getRetractions()

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: 'Retratações e correções — Registra Brasil',
    description:
      'Histórico público de declarações removidas ou corrigidas após revisão editorial.',
    url: `${SITE_URL}/retratacoes`,
    inLanguage: 'pt-BR',
    numberOfItems: rows.length,
    publisher: { '@type': 'Organization', name: 'Registra Brasil', url: SITE_URL },
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <Breadcrumbs items={[{ label: 'Retratações' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <AlertTriangle className="w-8 h-8 text-amber-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Retratações e correções</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          Este registro público lista declarações que foram removidas ou corrigidas após revisão
          editorial. Transparência é parte do compromisso do Registra Brasil: erros acontecem e são
          registrados publicamente quando identificados.
        </p>
      </header>

      {rows.length === 0 ? (
        <p className="text-gray-500">
          Nenhuma retratação registrada até o momento. Se você identificou um erro, use o{' '}
          <Link href="/contato" className="underline">formulário de contato</Link>.
        </p>
      ) : (
        <ol className="space-y-4">
          {rows.map((r) => (
            <li
              key={r.id}
              className="bg-white border border-amber-200 rounded-lg p-5"
              aria-label={`Retratação referente a ${r.politicians.common_name}`}
            >
              <div className="flex items-start justify-between gap-3 mb-2 flex-wrap">
                <div>
                  <Link
                    href={`/politico/${r.politicians.slug}`}
                    className="font-semibold text-gray-900 hover:underline"
                  >
                    {r.politicians.common_name}
                  </Link>
                  <p className="text-xs text-gray-500">
                    Atualizado em{' '}
                    <time dateTime={r.updated_at}>
                      {new Date(r.updated_at).toLocaleDateString('pt-BR')}
                    </time>
                  </p>
                </div>
                <span className="text-xs bg-amber-100 text-amber-800 px-2 py-1 rounded">
                  Removida do arquivo
                </span>
              </div>
              <p className="text-gray-700 mb-2 line-through decoration-gray-400">
                {r.summary}
              </p>
              {r.editor_notes && (
                <p className="text-sm text-gray-600 bg-gray-50 border-l-4 border-gray-300 pl-3 py-2">
                  <strong>Nota editorial:</strong> {r.editor_notes}
                </p>
              )}
            </li>
          ))}
        </ol>
      )}

      <aside className="mt-12 bg-blue-50 border border-blue-200 rounded-lg p-5 text-sm text-blue-900">
        <strong>Encontrou um erro?</strong> Entre em{' '}
        <Link href="/contato" className="underline">contato</Link> ou use o botão &quot;Propor
        correção&quot; em qualquer página de declaração.
      </aside>
    </main>
  )
}
