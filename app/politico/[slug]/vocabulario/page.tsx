import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug } from '@/lib/supabase/queries/politicians'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import {
  tokenize, bigrams, countMap, topN, overIndexedWords,
} from '@/lib/vocabulary/analyze'
import {
  fetchPoliticianCorpus, fetchArchiveSample, corpusText,
} from '@/lib/vocabulary/queries'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) return { title: 'Vocabulário não encontrado' }
  return {
    title: `Vocabulário de ${p.common_name} — Registra Brasil`,
    description: `Palavras e expressões mais usadas por ${p.common_name} em declarações registradas — com comparação contra o restante do arquivo.`,
    alternates: { canonical: `/politico/${slug}/vocabulario` },
    openGraph: {
      title: `Vocabulário de ${p.common_name} — Registra Brasil`,
      description: `Análise lexical das declarações de ${p.common_name}.`,
      type: 'profile',
      siteName: 'Registra Brasil',
    },
  }
}

function wordSize(count: number, max: number): string {
  const pct = Math.min(1, count / max)
  const size = 14 + Math.round(pct * 28)
  return `${size}px`
}

export default async function VocabularyPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const politician = await getPoliticianBySlug(supabase, slug)
  if (!politician) notFound()

  const [pRows, archiveRows] = await Promise.all([
    fetchPoliticianCorpus(politician.id),
    fetchArchiveSample(),
  ])

  const pTokens = tokenize(corpusText(pRows))
  const aTokens = tokenize(corpusText(archiveRows))
  const pCounts = countMap(pTokens)
  const aCounts = countMap(aTokens)

  const top = topN(pCounts, 60)
  const maxTop = top[0]?.count ?? 1
  const uniqueWords = pCounts.size
  const totalWords = pTokens.length
  const lexicalDensity = totalWords === 0 ? 0 : uniqueWords / totalWords

  const over = overIndexedWords(
    pCounts, aCounts, pTokens.length, aTokens.length,
    Math.max(3, Math.round(pTokens.length / 2000)),
    24,
  )

  const pBigrams = topN(countMap(bigrams(pTokens)), 20)

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <Breadcrumbs items={[
        { label: 'Políticos', href: '/politicos' },
        { label: politician.common_name, href: `/politico/${politician.slug}` },
        { label: 'Vocabulário' },
      ]} />

      <header className="mb-8 mt-4 flex items-start gap-4">
        {politician.photo_url && (
          <Image
            src={politician.photo_url}
            alt=""
            width={64}
            height={64}
            unoptimized
            className="h-16 w-16 rounded-full object-cover"
          />
        )}
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Análise lexical
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Vocabulário de {politician.common_name}
          </h1>
          <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">
            Calculado sobre {pRows.length.toLocaleString('pt-BR')} declarações registradas — resumo, citação completa e trecho de transcript, quando disponíveis.
          </p>
        </div>
      </header>

      <section className="mb-8 grid grid-cols-2 gap-4 md:grid-cols-4">
        <Stat label="Tokens totais" value={totalWords.toLocaleString('pt-BR')} />
        <Stat label="Palavras únicas" value={uniqueWords.toLocaleString('pt-BR')} />
        <Stat
          label="Diversidade lexical"
          value={`${(lexicalDensity * 100).toFixed(1)}%`}
          sub="únicas / totais"
        />
        <Stat label="Declarações" value={pRows.length.toLocaleString('pt-BR')} />
      </section>

      <section className="mb-10 rounded-xl border border-gray-200 bg-white p-6 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-4 text-xl font-semibold text-gray-900 dark:text-gray-100">
          Palavras mais frequentes
        </h2>
        {top.length === 0 ? (
          <p className="text-gray-500">Nenhum texto disponível ainda.</p>
        ) : (
          <div className="flex flex-wrap gap-x-4 gap-y-2 leading-tight">
            {top.map((w) => (
              <Link
                key={w.term}
                href={`/buscar?q=${encodeURIComponent(w.term)}&politico=${politician.slug}`}
                className="group"
                style={{ fontSize: wordSize(w.count, maxTop) }}
                title={`${w.count} ocorrências`}
              >
                <span className="text-indigo-700 group-hover:underline dark:text-indigo-300">
                  {w.term}
                </span>
                <span className="ml-1 text-[10px] align-super text-gray-500 dark:text-gray-500">
                  {w.count}
                </span>
              </Link>
            ))}
          </div>
        )}
      </section>

      <section className="mb-10 rounded-xl border border-amber-200 bg-amber-50/50 p-6 dark:border-amber-900/40 dark:bg-amber-950/20">
        <h2 className="mb-1 text-xl font-semibold text-amber-900 dark:text-amber-200">
          Palavras características
        </h2>
        <p className="mb-4 text-sm text-amber-800/80 dark:text-amber-300/80">
          Termos que aparecem no vocabulário de {politician.common_name} com frequência
          bem acima da média do arquivo — o que distingue o jeito de falar dele(a).
        </p>
        {over.length === 0 ? (
          <p className="text-gray-500">Dados insuficientes para comparação.</p>
        ) : (
          <ol className="grid grid-cols-1 gap-2 sm:grid-cols-2 md:grid-cols-3">
            {over.map((w) => (
              <li
                key={w.term}
                className="flex items-center justify-between rounded border border-amber-200 bg-white px-3 py-1.5 text-sm dark:border-amber-900/40 dark:bg-gray-900"
              >
                <Link
                  href={`/buscar?q=${encodeURIComponent(w.term)}&politico=${politician.slug}`}
                  className="font-medium text-amber-900 hover:underline dark:text-amber-200"
                >
                  {w.term}
                </Link>
                <span className="text-xs text-gray-500 dark:text-gray-400">
                  {w.politicianCount} × ({w.score.toFixed(1)}×)
                </span>
              </li>
            ))}
          </ol>
        )}
      </section>

      <section className="rounded-xl border border-gray-200 bg-white p-6 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-4 text-xl font-semibold text-gray-900 dark:text-gray-100">
          Expressões mais repetidas (bigramas)
        </h2>
        {pBigrams.length === 0 ? (
          <p className="text-gray-500">Nenhuma expressão recorrente.</p>
        ) : (
          <ol className="grid grid-cols-1 gap-1 text-sm md:grid-cols-2">
            {pBigrams.map((b) => (
              <li
                key={b.term}
                className="flex items-center justify-between border-b border-gray-100 py-1 dark:border-gray-800"
              >
                <span className="font-mono text-gray-800 dark:text-gray-200">{b.term}</span>
                <span className="text-xs tabular-nums text-gray-500 dark:text-gray-400">
                  {b.count}
                </span>
              </li>
            ))}
          </ol>
        )}
      </section>

      <footer className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Análise computada direto dos textos arquivados, sem lematização —
          plurais e flexões verbais contam como tokens distintos. A comparação
          "acima da média" usa uma amostra de até 5.000 declarações recentes
          como baseline do arquivo. Palavras comuns do português (artigos,
          pronomes, verbos de ligação) são removidas por uma lista de stopwords.
        </p>
      </footer>
    </main>
  )
}

function Stat({ label, value, sub }: { label: string; value: string; sub?: string }) {
  return (
    <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
      <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
        {label}
      </dt>
      <dd className="mt-1 text-2xl font-bold tabular-nums text-gray-900 dark:text-gray-100">
        {value}
      </dd>
      {sub && <div className="text-xs text-gray-500 dark:text-gray-400">{sub}</div>}
    </div>
  )
}
