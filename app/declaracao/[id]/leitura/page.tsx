import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { ArrowLeft, ExternalLink } from 'lucide-react'
import { PrintButton } from '@/components/statements/PrintButton'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementById, getStatementBySlug } from '@/lib/supabase/queries/statements'
import { formatDatePtBR } from '@/lib/utils/date'
import { readingTime, wordCount } from '@/lib/utils/text'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const s = (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!s) return { title: 'Declaração — modo leitura' }
  return {
    title: `${s.politicians.common_name} — modo leitura — Registra Brasil`,
    description: s.summary.slice(0, 160),
    alternates: { canonical: `/declaracao/${id}` },
    robots: { index: false, follow: true },
  }
}

export default async function ReaderModePage({ params }: PageProps) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement =
    (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!statement) notFound()

  const p = statement.politicians
  const quote = statement.full_quote ?? statement.summary
  const wc = wordCount(quote)
  const rt = readingTime(quote)

  return (
    <main className="mx-auto max-w-2xl px-6 py-16 font-serif">
      <nav className="no-print mb-10 flex items-center justify-between text-sm">
        <Link
          href={`/declaracao/${statement.slug ?? statement.id}`}
          className="inline-flex items-center gap-1 text-gray-500 hover:text-gray-900"
        >
          <ArrowLeft className="h-3.5 w-3.5" /> Voltar ao registro completo
        </Link>
        <PrintButton />
      </nav>

      <header className="mb-10 flex items-center gap-4">
        {p.photo_url && (
          <Image
            src={p.photo_url}
            alt=""
            width={56}
            height={56}
            unoptimized
            className="h-14 w-14 rounded-full object-cover"
          />
        )}
        <div>
          <Link
            href={`/politico/${p.slug}`}
            className="block text-sm font-semibold uppercase tracking-wider text-gray-500 hover:text-gray-900"
          >
            {p.common_name}
          </Link>
          <p className="text-xs text-gray-500">
            {p.party}{p.state ? `-${p.state}` : ''}
            {statement.venue && ` · ${statement.venue}`}
          </p>
        </div>
      </header>

      <article>
        <blockquote className="mb-8 border-l-4 border-gray-900 pl-6 text-2xl leading-relaxed text-gray-900 md:text-[28px]">
          “{quote}”
        </blockquote>

        {statement.context && (
          <p className="mb-8 text-base leading-relaxed text-gray-700">
            {statement.context}
          </p>
        )}

        <footer className="mt-12 flex flex-wrap items-center justify-between gap-4 border-t border-gray-300 pt-4 text-sm font-sans">
          <div className="text-gray-600">
            <time dateTime={statement.statement_date} className="font-medium text-gray-800">
              {formatDatePtBR(statement.statement_date)}
            </time>
            <span className="ml-2 text-xs text-gray-400">
              · {wc.toLocaleString('pt-BR')} palavras · ~{rt} min de leitura
            </span>
          </div>
          <a
            href={statement.primary_source_url}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-1 text-gray-700 underline-offset-2 hover:underline"
          >
            Fonte original <ExternalLink className="h-3 w-3" aria-hidden />
          </a>
        </footer>
      </article>

      <aside className="no-print mt-16 rounded-lg border border-gray-200 bg-gray-50 p-4 text-xs text-gray-500">
        Este é o modo de leitura: layout mínimo, tipografia serifada, sem
        distrações. O registro completo com fontes secundárias, categorias,
        fact-checks e controles de compartilhamento está em{' '}
        <Link
          href={`/declaracao/${statement.slug ?? statement.id}`}
          className="underline"
        >
          /declaracao/{statement.slug ?? statement.id}
        </Link>.
      </aside>
    </main>
  )
}
