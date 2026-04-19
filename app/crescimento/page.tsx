import Link from 'next/link'
import type { Metadata } from 'next'
import { TrendingUp } from 'lucide-react'
import { getArchiveGrowth } from '@/lib/growth/queries'
import { areaChartSvg, sparklineSvg } from '@/lib/trends/sparkline'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Crescimento do arquivo — Registra Brasil',
  description:
    'Como o arquivo do Registra Brasil cresceu ao longo dos últimos anos — declarações, políticos cobertos e categorias ativas, mês a mês.',
  alternates: { canonical: '/crescimento' },
  openGraph: {
    title: 'Crescimento do arquivo — Registra Brasil',
    description: 'Visão histórica do acervo editorial.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Crescimento do arquivo — Registra Brasil',
    description: 'Visão histórica do acervo editorial.',
  },
}

const ALLOWED_WINDOWS = [12, 24, 36, 60] as const
type Window = (typeof ALLOWED_WINDOWS)[number]

interface PageProps {
  searchParams: Promise<Record<string, string | string[]>>
}

function parseWindow(raw: string | string[] | undefined): Window {
  const n = Number(Array.isArray(raw) ? raw[0] : raw)
  return (ALLOWED_WINDOWS as readonly number[]).includes(n) ? (n as Window) : 36
}

export default async function CrescimentoPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const months = parseWindow(sp.janela)

  const rows = await getArchiveGrowth(months)
  const last = rows[rows.length - 1]
  const first = rows[0]

  const stmtAreaSvg = areaChartSvg(
    rows.map((r) => r.cumulative_statements),
    rows.map((r) => r.month),
    { color: '#4f46e5' },
  )
  const polSparkline = sparklineSvg(rows.map((r) => r.cumulative_politicians), {
    width: 320, height: 60, color: '#0ea5e9', ariaLabel: 'Políticos cobertos',
  })
  const catSparkline = sparklineSvg(rows.map((r) => r.cumulative_categories), {
    width: 320, height: 60, color: '#10b981', ariaLabel: 'Categorias ativas',
  })
  const newPerMonthSvg = areaChartSvg(
    rows.map((r) => r.new_statements),
    rows.map((r) => r.month),
    { color: '#f97316' },
  )

  const statementsGrowth = last && first
    ? last.cumulative_statements - first.cumulative_statements
    : 0
  const politiciansGrowth = last && first
    ? last.cumulative_politicians - first.cumulative_politicians
    : 0

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <TrendingUp className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Transparência
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Crescimento do arquivo
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Como o acervo do Registra Brasil evoluiu ao longo do tempo. Três
            curvas de cobertura (declarações, políticos, categorias) e o ritmo
            mensal de novos registros. Dados calculados diretamente do banco a
            cada hora.
          </p>
        </div>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Janela">
        {ALLOWED_WINDOWS.map((w) => {
          const active = w === months
          return (
            <Link
              key={w}
              href={`/crescimento?janela=${w}`}
              className={`rounded-full border px-3 py-1 text-xs font-medium ${
                active
                  ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200'
                  : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'
              }`}
            >
              Últimos {w} meses
            </Link>
          )
        })}
      </nav>

      <section className="mb-8 grid grid-cols-1 gap-4 md:grid-cols-3">
        <Stat
          label="Declarações arquivadas"
          value={last ? last.cumulative_statements.toLocaleString('pt-BR') : '—'}
          sub={statementsGrowth > 0 ? `+${statementsGrowth.toLocaleString('pt-BR')} na janela` : 'janela estável'}
        />
        <Stat
          label="Políticos cobertos"
          value={last ? last.cumulative_politicians.toLocaleString('pt-BR') : '—'}
          sub={politiciansGrowth > 0 ? `+${politiciansGrowth}` : undefined}
        />
        <Stat
          label="Categorias ativas"
          value={last ? last.cumulative_categories.toLocaleString('pt-BR') : '—'}
        />
      </section>

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-3 text-lg font-semibold text-gray-900 dark:text-gray-100">
          Declarações arquivadas (cumulativo)
        </h2>
        <div
          className="text-indigo-600 dark:text-indigo-300"
          dangerouslySetInnerHTML={{ __html: stmtAreaSvg }}
        />
      </section>

      <section className="mb-8 grid grid-cols-1 gap-4 md:grid-cols-2">
        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Políticos cobertos
          </h2>
          <div
            className="text-sky-600 dark:text-sky-300"
            dangerouslySetInnerHTML={{ __html: polSparkline }}
          />
          <p className="mt-2 text-xs text-gray-500 dark:text-gray-400">
            {first?.cumulative_politicians.toLocaleString('pt-BR') ?? 0} →{' '}
            {last?.cumulative_politicians.toLocaleString('pt-BR') ?? 0}
          </p>
        </div>
        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Categorias ativas
          </h2>
          <div
            className="text-emerald-600 dark:text-emerald-300"
            dangerouslySetInnerHTML={{ __html: catSparkline }}
          />
          <p className="mt-2 text-xs text-gray-500 dark:text-gray-400">
            {first?.cumulative_categories ?? 0} →{' '}
            {last?.cumulative_categories ?? 0}
          </p>
        </div>
      </section>

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-3 text-lg font-semibold text-gray-900 dark:text-gray-100">
          Ritmo mensal — novas declarações
        </h2>
        <div
          className="text-orange-600 dark:text-orange-300"
          dangerouslySetInnerHTML={{ __html: newPerMonthSvg }}
        />
        <p className="mt-2 text-xs text-gray-500 dark:text-gray-400">
          Cada barra cobre todas as declarações cuja <code>statement_date</code>{' '}
          cai no mês — inclui material já verificado e pendente, exceto
          removidos.
        </p>
      </section>

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Os valores cumulativos somam todos os registros históricos, incluindo
          aqueles com <em>statement_date</em> anterior à janela selecionada.
          Ajustes retroativos (edição, remoção ou reclassificação) alteram o
          passado — por isso o número de hoje pode diferir de um snapshot
          anterior.
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
