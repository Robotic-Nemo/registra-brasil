import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { listPublishedContradictions } from '@/lib/contradictions/queries'

export const revalidate = 900

export const metadata: Metadata = {
  title: 'Contradições — Registra Brasil',
  description:
    'Registro de momentos em que um mesmo político fez declarações que se contradizem ao longo do tempo. Cada par traz as duas fontes originais e uma nota editorial curta.',
  alternates: { canonical: '/contradicoes' },
  openGraph: {
    title: 'Contradições — Registra Brasil',
    description: 'Pares de declarações contraditórias arquivadas.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Contradições — Registra Brasil',
    description: 'Pares de declarações contraditórias arquivadas.',
  },
}

const SEV_LABEL: Record<number, string> = {
  1: 'Leve',
  2: 'Moderada',
  3: 'Relevante',
  4: 'Grave',
}
const SEV_CLASS: Record<number, string> = {
  1: 'bg-gray-100 text-gray-800 dark:bg-gray-800 dark:text-gray-200',
  2: 'bg-amber-100 text-amber-900 dark:bg-amber-950/50 dark:text-amber-200',
  3: 'bg-orange-100 text-orange-900 dark:bg-orange-950/50 dark:text-orange-200',
  4: 'bg-rose-100 text-rose-900 dark:bg-rose-950/50 dark:text-rose-200',
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

export default async function ContradicoesPage() {
  const pairs = await listPublishedContradictions(80)

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <header className="mb-8">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Fact-trail editorial
        </p>
        <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          Contradições
        </h1>
        <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
          Pares de declarações do próprio político que se contradizem. Cada
          entrada é selecionada à mão pela equipe editorial — links levam às
          duas fontes originais e à explicação curta da contradição.
        </p>
      </header>

      {pairs.length === 0 ? (
        <p className="text-gray-500">
          Nenhuma contradição publicada ainda. Sugestões podem ser enviadas
          por{' '}
          <Link href="/contato" className="underline">
            contato
          </Link>
          .
        </p>
      ) : (
        <ul className="flex flex-col gap-4">
          {pairs.map((p) => (
            <li key={p.id}>
              <Link
                href={`/contradicoes/${p.id}`}
                className="block rounded-xl border border-gray-200 bg-white p-5 transition hover:border-indigo-400 hover:shadow-sm dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-600"
              >
                <div className="flex items-start gap-4">
                  {p.politician.photo_url ? (
                    <Image
                      src={p.politician.photo_url}
                      alt=""
                      width={56}
                      height={56}
                      unoptimized
                      className="h-14 w-14 shrink-0 rounded-full object-cover"
                    />
                  ) : (
                    <div className="h-14 w-14 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />
                  )}
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-2 text-sm text-gray-500 dark:text-gray-400">
                      <span className="font-medium text-gray-900 dark:text-gray-100">
                        {p.politician.common_name}
                      </span>
                      {p.politician.party && (
                        <span>
                          {p.politician.party}
                          {p.politician.state ? `-${p.politician.state}` : ''}
                        </span>
                      )}
                      <span
                        className={`rounded-full px-2 py-0.5 text-[11px] font-semibold ${SEV_CLASS[p.severity]}`}
                      >
                        {SEV_LABEL[p.severity]}
                      </span>
                    </div>
                    <h2 className="mt-1 text-lg font-semibold text-gray-900 group-hover:text-indigo-700 dark:text-gray-100">
                      {p.headline}
                    </h2>
                    <p className="mt-1 line-clamp-2 text-sm text-gray-600 dark:text-gray-300">
                      {p.editor_note}
                    </p>
                    <p className="mt-2 text-xs text-gray-500 dark:text-gray-500">
                      {fmt(p.statement_low.statement_date)} ↔{' '}
                      {fmt(p.statement_high.statement_date)}
                    </p>
                  </div>
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
