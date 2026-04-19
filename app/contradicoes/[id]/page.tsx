import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getContradictionById } from '@/lib/contradictions/queries'

export const revalidate = 900

interface PageProps {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  const pair = await getContradictionById(id)
  if (!pair) return { title: 'Contradição não encontrada — Registra Brasil' }
  const title = `${pair.politician.common_name}: ${pair.headline} — Registra Brasil`
  const description = pair.editor_note.slice(0, 170)
  return {
    title,
    description,
    alternates: { canonical: `/contradicoes/${pair.id}` },
    openGraph: {
      title,
      description,
      type: 'article',
      siteName: 'Registra Brasil',
    },
    twitter: { card: 'summary_large_image', title, description },
  }
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', {
    year: 'numeric', month: 'long', day: '2-digit',
  })
}

export default async function ContradictionDetailPage({ params }: PageProps) {
  const { id } = await params
  const pair = await getContradictionById(id)
  if (!pair) notFound()

  const side = (
    label: string,
    stmt: typeof pair.statement_low,
    tone: 'low' | 'high',
  ) => (
    <article
      className={`flex h-full flex-col rounded-xl border p-5 ${
        tone === 'low'
          ? 'border-sky-200 bg-sky-50/40 dark:border-sky-900/50 dark:bg-sky-950/20'
          : 'border-amber-200 bg-amber-50/40 dark:border-amber-900/50 dark:bg-amber-950/20'
      }`}
    >
      <header className="mb-3 flex items-center justify-between text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
        <span>{label}</span>
        <time dateTime={stmt.statement_date}>{fmt(stmt.statement_date)}</time>
      </header>
      <blockquote className="flex-1 text-lg leading-relaxed text-gray-900 dark:text-gray-100">
        “{stmt.summary}”
      </blockquote>
      <footer className="mt-4 flex items-center justify-between text-sm">
        <Link
          href={`/declaracao/${stmt.slug ?? stmt.id}`}
          className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
        >
          Ver registro completo →
        </Link>
        <a
          href={stmt.primary_source_url}
          target="_blank"
          rel="noopener noreferrer"
          className="text-xs text-gray-500 underline-offset-2 hover:underline dark:text-gray-400"
        >
          Fonte original ↗
        </a>
      </footer>
    </article>
  )

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <nav className="mb-4 text-sm text-gray-500 dark:text-gray-400">
        <Link href="/contradicoes" className="hover:underline">Contradições</Link>
        {' › '}
        <span className="text-gray-700 dark:text-gray-300">{pair.politician.common_name}</span>
      </nav>

      <header className="mb-8 flex items-start gap-4">
        {pair.politician.photo_url ? (
          <Image
            src={pair.politician.photo_url}
            alt=""
            width={72}
            height={72}
            unoptimized
            className="h-18 w-18 rounded-full object-cover"
          />
        ) : null}
        <div>
          <Link
            href={`/politico/${pair.politician.slug}`}
            className="text-sm font-medium text-indigo-700 hover:underline dark:text-indigo-300"
          >
            {pair.politician.common_name}
            {pair.politician.party && (
              <span className="ml-1 text-gray-500 dark:text-gray-400">
                ({pair.politician.party}
                {pair.politician.state ? `-${pair.politician.state}` : ''})
              </span>
            )}
          </Link>
          <h1 className="mt-1 text-3xl font-bold text-gray-900 dark:text-gray-100">
            {pair.headline}
          </h1>
        </div>
      </header>

      <section className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {side('Primeiro registro', pair.statement_low, 'low')}
        {side('Segundo registro', pair.statement_high, 'high')}
      </section>

      <section className="mt-8 rounded-xl border border-indigo-200 bg-indigo-50/60 p-5 dark:border-indigo-900/50 dark:bg-indigo-950/20">
        <h2 className="mb-2 text-sm font-semibold uppercase tracking-wider text-indigo-900 dark:text-indigo-200">
          Nota editorial
        </h2>
        <p className="whitespace-pre-wrap text-gray-800 dark:text-gray-200">
          {pair.editor_note}
        </p>
      </section>

      <footer className="mt-8 text-sm text-gray-500 dark:text-gray-400">
        Publicado em {fmt(pair.created_at)}.
        {pair.updated_at !== pair.created_at && (
          <> Atualizado em {fmt(pair.updated_at)}.</>
        )}
      </footer>
    </main>
  )
}
