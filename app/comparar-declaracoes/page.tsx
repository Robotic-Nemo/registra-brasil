import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementById, getStatementBySlug } from '@/lib/supabase/queries/statements'
import { compareTexts } from '@/lib/compare/statements'

export const revalidate = 300

export const metadata: Metadata = {
  title: 'Comparar declarações — Registra Brasil',
  description:
    'Compare lado a lado quaisquer duas declarações arquivadas: texto, fonte, contexto e sobreposição lexical.',
  alternates: { canonical: '/comparar-declaracoes' },
  openGraph: {
    title: 'Comparar declarações — Registra Brasil',
    description: 'Compare lado a lado duas declarações do arquivo.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Comparar declarações — Registra Brasil',
    description: 'Compare lado a lado duas declarações do arquivo.',
  },
}

interface PageProps {
  searchParams: Promise<{ a?: string; b?: string }>
}

async function resolve(supabase: Awaited<ReturnType<typeof getSupabaseServerClient>>, key: string | undefined) {
  if (!key) return null
  return (await getStatementBySlug(supabase, key)) ?? (await getStatementById(supabase, key))
}

function fmtDate(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', {
    year: 'numeric', month: 'long', day: '2-digit',
  })
}

export default async function ComparePage({ searchParams }: PageProps) {
  const { a: aKey, b: bKey } = await searchParams
  const supabase = await getSupabaseServerClient()
  const [a, b] = await Promise.all([resolve(supabase, aKey), resolve(supabase, bKey)])

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-6">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Ferramenta de análise
        </p>
        <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          Comparar declarações
        </h1>
        <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
          Cole o slug ou UUID de duas declarações — ou copie o trecho final de
          uma URL <code className="font-mono text-xs">/declaracao/…</code> — e
          veja-as lado a lado, com contagem de palavras compartilhadas.
        </p>
      </header>

      <form
        method="get"
        className="mb-8 grid gap-3 rounded-xl border border-gray-200 bg-white p-4 md:grid-cols-[1fr_1fr_auto] dark:border-gray-800 dark:bg-gray-900"
        action="/comparar-declaracoes"
      >
        <label className="grid gap-1">
          <span className="text-xs font-medium uppercase tracking-wider text-gray-600 dark:text-gray-400">
            Declaração A
          </span>
          <input
            name="a"
            defaultValue={aKey ?? ''}
            placeholder="slug-ou-uuid"
            className="rounded border border-gray-300 px-2 py-1.5 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          />
        </label>
        <label className="grid gap-1">
          <span className="text-xs font-medium uppercase tracking-wider text-gray-600 dark:text-gray-400">
            Declaração B
          </span>
          <input
            name="b"
            defaultValue={bKey ?? ''}
            placeholder="slug-ou-uuid"
            className="rounded border border-gray-300 px-2 py-1.5 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          />
        </label>
        <button
          type="submit"
          className="self-end rounded bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-700"
        >
          Comparar
        </button>
      </form>

      {!aKey && !bKey && <EmptyState />}

      {aKey && !a && <MissingNotice which="A" key_={aKey} />}
      {bKey && !b && <MissingNotice which="B" key_={bKey} />}

      {a && b && <CompareView a={a} b={b} />}
    </main>
  )
}

function MissingNotice({ which, key_ }: { which: 'A' | 'B'; key_: string }) {
  return (
    <section className="mb-6 rounded-lg border border-rose-200 bg-rose-50 p-4 text-sm text-rose-900 dark:border-rose-900/50 dark:bg-rose-950/20 dark:text-rose-200">
      Declaração {which} não encontrada para chave <code className="font-mono">{key_}</code>.
    </section>
  )
}

function EmptyState() {
  return (
    <section className="rounded-xl border border-dashed border-gray-300 bg-gray-50 p-8 text-center dark:border-gray-700 dark:bg-gray-900/40">
      <p className="text-sm text-gray-600 dark:text-gray-400">
        Para começar, abra duas declarações diferentes e cole o trecho final da
        URL (o slug) em cada campo acima. Também pode ser o UUID completo.
      </p>
      <p className="mt-2 text-xs text-gray-500 dark:text-gray-500">
        Dica: esta página é ótima para verificar se um mesmo político disse
        coisas parecidas em momentos distintos ou para preparar o relato de
        uma{' '}
        <Link href="/contradicoes" className="underline">contradição</Link>.
      </p>
    </section>
  )
}

type Stmt = NonNullable<Awaited<ReturnType<typeof getStatementBySlug>>>

function SideCard({ s, badge }: { s: Stmt; badge: 'A' | 'B' }) {
  const tone =
    badge === 'A'
      ? 'border-sky-200 bg-sky-50/40 dark:border-sky-900/50 dark:bg-sky-950/20'
      : 'border-amber-200 bg-amber-50/40 dark:border-amber-900/50 dark:bg-amber-950/20'
  const badgeTone =
    badge === 'A'
      ? 'bg-sky-600 text-white'
      : 'bg-amber-600 text-white'
  const p = s.politicians
  const categories = s.statement_categories?.map((c) => c.categories) ?? []
  return (
    <article className={`flex h-full flex-col rounded-xl border p-5 ${tone}`}>
      <header className="mb-3 flex items-center gap-3">
        <span className={`inline-flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-sm font-bold ${badgeTone}`}>
          {badge}
        </span>
        {p.photo_url && (
          <Image
            src={p.photo_url}
            alt=""
            width={32}
            height={32}
            unoptimized
            className="h-8 w-8 rounded-full object-cover"
          />
        )}
        <div className="min-w-0">
          <Link href={`/politico/${p.slug}`} className="block truncate text-sm font-medium text-indigo-700 hover:underline dark:text-indigo-300">
            {p.common_name}
          </Link>
          <div className="truncate text-xs text-gray-500 dark:text-gray-400">
            {p.party}
            {p.state ? `-${p.state}` : ''} · {fmtDate(s.statement_date)}
          </div>
        </div>
      </header>

      <blockquote className="mb-4 text-base leading-relaxed text-gray-900 dark:text-gray-100">
        “{s.summary}”
      </blockquote>

      {s.full_quote && s.full_quote !== s.summary && (
        <details className="mb-4 text-sm text-gray-700 dark:text-gray-300">
          <summary className="cursor-pointer text-gray-600 dark:text-gray-400">
            Citação completa
          </summary>
          <p className="mt-2 whitespace-pre-wrap">{s.full_quote}</p>
        </details>
      )}

      {categories.length > 0 && (
        <div className="mb-4 flex flex-wrap gap-1.5">
          {categories.map((c) => (
            <Link
              key={c.id}
              href={`/categorias/${c.slug}`}
              className="rounded-full px-2 py-0.5 text-[11px] font-medium"
              style={{
                backgroundColor: (c.color_hex ?? '#6b7280') + '22',
                color: c.color_hex ?? '#374151',
              }}
            >
              {c.label_pt}
            </Link>
          ))}
        </div>
      )}

      <footer className="mt-auto flex flex-wrap items-center justify-between gap-2 pt-2 text-xs">
        <Link
          href={`/declaracao/${s.slug ?? s.id}`}
          className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
        >
          Ver registro completo →
        </Link>
        <a
          href={s.primary_source_url}
          target="_blank"
          rel="noopener noreferrer"
          className="text-gray-500 underline-offset-2 hover:underline dark:text-gray-400"
        >
          Fonte original ↗
        </a>
      </footer>
    </article>
  )
}

function CompareView({ a, b }: { a: Stmt; b: Stmt }) {
  const textA = [a.summary, a.full_quote].filter(Boolean).join(' ')
  const textB = [b.summary, b.full_quote].filter(Boolean).join(' ')
  const overlap = compareTexts(textA, textB)
  const sameAuthor = a.politicians.id === b.politicians.id
  const dayDiff = Math.abs(
    Math.round(
      (new Date(a.statement_date).getTime() - new Date(b.statement_date).getTime()) / 86_400_000,
    ),
  )
  const jaccardPct = Math.round(overlap.jaccard * 100)

  const catA = new Set(a.statement_categories?.map((c) => c.categories.id) ?? [])
  const catB = new Set(b.statement_categories?.map((c) => c.categories.id) ?? [])
  const sharedCategoryCount = [...catA].filter((id) => catB.has(id)).length

  return (
    <>
      <section className="mb-6 grid grid-cols-2 gap-4">
        <SideCard s={a} badge="A" />
        <SideCard s={b} badge="B" />
      </section>

      <section className="mb-6 grid grid-cols-2 gap-4 md:grid-cols-4">
        <Stat label="Mesmo político" value={sameAuthor ? 'Sim' : 'Não'} tone={sameAuthor ? 'good' : 'warn'} />
        <Stat label="Distância" value={`${dayDiff} dias`} />
        <Stat label="Sobreposição lexical" value={`${jaccardPct}%`} sub={`${overlap.shared.length} palavras compartilhadas`} />
        <Stat label="Categorias em comum" value={String(sharedCategoryCount)} />
      </section>

      <section className="grid grid-cols-1 gap-4 md:grid-cols-3">
        <TokenList title="Só em A" tone="sky" tokens={overlap.onlyA.slice(0, 60)} />
        <TokenList title="Compartilhadas" tone="neutral" tokens={overlap.shared.slice(0, 80)} />
        <TokenList title="Só em B" tone="amber" tokens={overlap.onlyB.slice(0, 60)} />
      </section>

      {sameAuthor && (
        <section className="mt-8 rounded-xl border border-indigo-200 bg-indigo-50 p-5 dark:border-indigo-900/50 dark:bg-indigo-950/20">
          <h2 className="text-sm font-semibold text-indigo-900 dark:text-indigo-200">
            Sugerir contradição
          </h2>
          <p className="mt-1 text-sm text-indigo-900/80 dark:text-indigo-300/80">
            Se essas duas declarações de {a.politicians.common_name} se
            contradizem, envie um email para{' '}
            <a href="mailto:contato@registrabrasil.com.br" className="underline">
              contato@registrabrasil.com.br
            </a>{' '}
            com os dois slugs. A equipe avalia e publica na página de{' '}
            <Link href="/contradicoes" className="underline">contradições</Link>.
          </p>
        </section>
      )}
    </>
  )
}

function Stat({
  label, value, sub, tone = 'neutral',
}: { label: string; value: string; sub?: string; tone?: 'good' | 'warn' | 'neutral' }) {
  const toneCls = {
    good: 'border-emerald-200 bg-emerald-50 dark:border-emerald-900/50 dark:bg-emerald-950/20',
    warn: 'border-amber-200 bg-amber-50 dark:border-amber-900/50 dark:bg-amber-950/20',
    neutral: 'border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900',
  }[tone]
  return (
    <div className={`rounded-lg border p-4 ${toneCls}`}>
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

function TokenList({
  title, tokens, tone,
}: { title: string; tokens: string[]; tone: 'sky' | 'amber' | 'neutral' }) {
  const toneCls = {
    sky: 'border-sky-200 bg-sky-50 dark:border-sky-900/50 dark:bg-sky-950/20',
    amber: 'border-amber-200 bg-amber-50 dark:border-amber-900/50 dark:bg-amber-950/20',
    neutral: 'border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900',
  }[tone]
  return (
    <div className={`rounded-xl border p-4 ${toneCls}`}>
      <h3 className="mb-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
        {title} ({tokens.length})
      </h3>
      {tokens.length === 0 ? (
        <p className="text-xs text-gray-500">—</p>
      ) : (
        <div className="flex flex-wrap gap-1.5 text-xs">
          {tokens.map((t) => (
            <span
              key={t}
              className="rounded bg-white px-1.5 py-0.5 font-mono text-gray-700 shadow-sm dark:bg-gray-900 dark:text-gray-300"
            >
              {t}
            </span>
          ))}
        </div>
      )}
    </div>
  )
}
