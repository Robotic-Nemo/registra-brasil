import Link from 'next/link'
import type { Metadata } from 'next'
import { History, Rss } from 'lucide-react'
import { getPublicRevisionFeed, labelField } from '@/lib/moderation/feed'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Registro editorial — Registra Brasil',
  description:
    'Histórico público das últimas alterações feitas em declarações do Registra Brasil. Cada edição é auditável e vem com o motivo informado pela equipe.',
  alternates: {
    canonical: '/registro-editorial',
    types: { 'application/rss+xml': '/registro-editorial/feed.xml' },
  },
  openGraph: {
    title: 'Registro editorial — Registra Brasil',
    description: 'Histórico público de alterações nas declarações.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Registro editorial — Registra Brasil',
    description: 'Histórico público de alterações nas declarações.',
  },
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

export default async function RegistroEditorialPage() {
  const rows = await getPublicRevisionFeed(120)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-8 flex flex-wrap items-start justify-between gap-3">
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Transparência editorial
          </p>
          <h1 className="mt-1 flex items-center gap-2 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            <History className="h-7 w-7 text-indigo-600" aria-hidden />
            Registro editorial
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Toda vez que uma declaração é editada depois de publicada, a mudança
            fica registrada aqui. Não mostramos o nome do editor, mas sim o
            motivo curto que ele informou e quais campos foram alterados.
          </p>
        </div>
        <a
          href="/registro-editorial/feed.xml"
          className="inline-flex items-center gap-1.5 rounded-full border border-orange-300 bg-orange-50 px-3 py-1 text-sm text-orange-800 hover:bg-orange-100 dark:border-orange-800 dark:bg-orange-950/40 dark:text-orange-200"
        >
          <Rss className="h-3.5 w-3.5" />
          RSS
        </a>
      </header>

      {rows.length === 0 ? (
        <p className="text-gray-500">Nenhuma revisão pública registrada ainda.</p>
      ) : (
        <ol className="relative flex flex-col gap-4 border-l border-gray-200 pl-6 dark:border-gray-800">
          {rows.map((r) => (
            <li
              key={r.revision_id}
              className="relative before:absolute before:-left-[27px] before:top-3 before:h-2.5 before:w-2.5 before:rounded-full before:bg-indigo-500 before:ring-4 before:ring-white dark:before:ring-gray-950"
            >
              <article className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
                <header className="mb-2 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                  <time dateTime={r.created_at}>{fmt(r.created_at)}</time>
                  <span aria-hidden>·</span>
                  <span>revisão #{r.revision_number}</span>
                  <span aria-hidden>·</span>
                  <Link
                    href={`/politico/${r.politician_slug}`}
                    className="font-medium text-gray-700 hover:underline dark:text-gray-300"
                  >
                    {r.politician_name}
                  </Link>
                </header>
                <Link
                  href={`/declaracao/${r.statement_slug ?? r.statement_id}`}
                  className="block text-sm font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                >
                  {r.statement_summary.slice(0, 140)}
                  {r.statement_summary.length > 140 ? '…' : ''}
                </Link>
                {r.changed_keys.length > 0 && (
                  <div className="mt-2 flex flex-wrap gap-1.5">
                    {r.changed_keys.map((k) => (
                      <span
                        key={k}
                        className="inline-block rounded-full bg-gray-100 px-2 py-0.5 text-[11px] text-gray-700 dark:bg-gray-800 dark:text-gray-300"
                      >
                        {labelField(k)}
                      </span>
                    ))}
                  </div>
                )}
                {r.reason && r.reason.trim().length > 0 && (
                  <p className="mt-2 rounded border-l-2 border-indigo-300 bg-indigo-50/50 px-3 py-2 text-sm italic text-gray-700 dark:border-indigo-700 dark:bg-indigo-950/20 dark:text-gray-300">
                    “{r.reason}”
                  </p>
                )}
              </article>
            </li>
          ))}
        </ol>
      )}

      <footer className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          O histórico completo de cada declaração, incluindo valores anteriores,
          fica acessível apenas ao time editorial para proteção do arquivo.
          Esta lista serve como registro público de que edições acontecem e por
          que — assinar o{' '}
          <a href="/registro-editorial/feed.xml" className="underline">feed RSS</a>{' '}
          é a forma recomendada para jornalistas acompanharem.
        </p>
      </footer>
    </main>
  )
}
