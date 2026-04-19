import Link from 'next/link'
import type { Metadata } from 'next'
import { getArchiveMonthlyTotals, getCategoryTrends, type CategoryTrend } from '@/lib/trends/queries'
import { sparklineSvg, areaChartSvg } from '@/lib/trends/sparkline'

export const revalidate = 3600

interface PageProps {
  searchParams: Promise<Record<string, string | string[]>>
}

export const metadata: Metadata = {
  title: 'Tendências — Registra Brasil',
  description:
    'Como o volume de declarações do Registra Brasil mudou ao longo do tempo, por categoria editorial. Sparklines e totais mensais ao longo dos últimos 24 meses.',
  alternates: { canonical: '/tendencias' },
  openGraph: {
    title: 'Tendências — Registra Brasil',
    description: 'Volume mensal de declarações por categoria editorial.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Tendências — Registra Brasil',
    description: 'Volume mensal de declarações por categoria editorial.',
  },
}

const ALLOWED_WINDOWS = [12, 24, 36] as const
type Window = (typeof ALLOWED_WINDOWS)[number]

function parseWindow(raw: string | string[] | undefined): Window {
  const n = Number(Array.isArray(raw) ? raw[0] : raw)
  return (ALLOWED_WINDOWS as readonly number[]).includes(n) ? (n as Window) : 24
}

function deltaPct(recent: number, prior: number): number | null {
  if (prior === 0 && recent === 0) return null
  if (prior === 0) return 100
  return Math.round(((recent - prior) / prior) * 100)
}

function deltaClass(d: number | null): string {
  if (d === null) return 'text-gray-500 dark:text-gray-500'
  if (d > 10) return 'text-rose-700 dark:text-rose-300'
  if (d < -10) return 'text-emerald-700 dark:text-emerald-300'
  return 'text-gray-500 dark:text-gray-400'
}

export default async function TrendsPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const months = parseWindow(sp.janela)

  const [totals, categories] = await Promise.all([
    getArchiveMonthlyTotals(months),
    getCategoryTrends(months),
  ])

  const areaSvg = areaChartSvg(
    totals.map((t) => t.count),
    totals.map((t) => t.month),
    { color: '#4f46e5' },
  )
  const totalAll = totals.reduce((a, t) => a + t.count, 0)
  const topLabel = totals.reduce(
    (best, t) => (t.count > best.count ? t : best),
    totals[0] ?? { month: '', count: 0 },
  )

  // Categories with at least one statement in the window
  const active = categories.filter((c) => c.total > 0)

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-8">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Análise do arquivo
        </p>
        <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          Tendências editoriais
        </h1>
        <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
          Volume mensal de declarações registradas, por categoria. Ajuda a ver
          quais temas estão subindo ou cedendo sem ter de folhear o arquivo
          manualmente.
        </p>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Janela de tempo">
        {ALLOWED_WINDOWS.map((w) => {
          const active = w === months
          return (
            <Link
              key={w}
              href={`/tendencias?janela=${w}`}
              className={`rounded-full border px-3 py-1 text-xs font-medium ${
                active
                  ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200'
                  : 'border-gray-300 text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:text-gray-300 dark:hover:bg-gray-800'
              }`}
            >
              Últimos {w} meses
            </Link>
          )
        })}
      </nav>

      <section
        aria-labelledby="total-title"
        className="mb-10 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900"
      >
        <div className="flex flex-wrap items-end justify-between gap-3">
          <div>
            <h2 id="total-title" className="text-lg font-semibold text-gray-900 dark:text-gray-100">
              Volume total
            </h2>
            <p className="text-sm text-gray-500 dark:text-gray-400">
              {totalAll.toLocaleString('pt-BR')} declarações registradas na janela.
              Pico em {topLabel.month.slice(0, 7)} ({topLabel.count.toLocaleString('pt-BR')}).
            </p>
          </div>
        </div>
        <div className="mt-4 text-indigo-700 dark:text-indigo-300" dangerouslySetInnerHTML={{ __html: areaSvg }} />
      </section>

      <section>
        <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-gray-100">
          Por categoria
        </h2>
        {active.length === 0 ? (
          <p className="text-gray-500">Nenhum dado para a janela escolhida.</p>
        ) : (
          <ul className="grid grid-cols-1 gap-3 md:grid-cols-2">
            {active.map((c: CategoryTrend) => {
              const d = deltaPct(c.recent, c.prior)
              const svg = sparklineSvg(c.points.map((p) => p.count), {
                color: c.color || '#4f46e5',
                ariaLabel: `Tendência ${c.label}`,
              })
              return (
                <li key={c.id}>
                  <Link
                    href={`/categorias/${c.slug}`}
                    className="group flex items-center gap-4 rounded-xl border border-gray-200 bg-white p-4 hover:border-indigo-400 hover:shadow-sm dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-600"
                  >
                    <span
                      aria-hidden
                      className="h-3 w-3 shrink-0 rounded-full"
                      style={{ backgroundColor: c.color ?? '#6b7280' }}
                    />
                    <div className="min-w-0 flex-1">
                      <div className="flex items-center justify-between">
                        <div className="truncate font-medium text-gray-900 group-hover:text-indigo-700 dark:text-gray-100 dark:group-hover:text-indigo-300">
                          {c.label}
                        </div>
                        <div className="text-sm tabular-nums text-gray-900 dark:text-gray-100">
                          {c.total.toLocaleString('pt-BR')}
                        </div>
                      </div>
                      <div className="mt-0.5 flex items-center justify-between text-xs">
                        <div className={deltaClass(d)}>
                          {d === null ? '—' : d > 0 ? `↑ +${d}%` : d < 0 ? `↓ ${d}%` : '→ 0%'}
                          <span className="ml-1 text-gray-500 dark:text-gray-500">
                            (1º terço vs. último terço)
                          </span>
                        </div>
                        <div className="text-gray-500 dark:text-gray-500">
                          {c.recent}/{c.prior} recentes/anteriores
                        </div>
                      </div>
                    </div>
                    <div
                      className="shrink-0"
                      dangerouslySetInnerHTML={{ __html: svg }}
                    />
                  </Link>
                </li>
              )
            })}
          </ul>
        )}
      </section>

      <footer className="mt-12 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          A comparação "1º terço vs. último terço" divide a janela em três
          períodos iguais e compara o total do período mais recente com o
          mais antigo, ignorando o meio. Isso suaviza ruído mês-a-mês sem
          depender de ajustes sazonais.
        </p>
      </footer>
    </main>
  )
}
