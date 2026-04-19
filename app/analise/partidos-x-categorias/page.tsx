import Link from 'next/link'
import type { Metadata } from 'next'
import { Grid3x3 } from 'lucide-react'
import { getPartyCategoryMatrix } from '@/lib/analysis/party-category'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Partidos × categorias — Registra Brasil',
  description:
    'Matriz de calor cruzando partidos e categorias editoriais: quantas declarações cada partido acumulou em cada tema.',
  alternates: { canonical: '/analise/partidos-x-categorias' },
  openGraph: {
    title: 'Partidos × categorias — Registra Brasil',
    description: 'Matriz de calor: partidos × categorias.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

type PageProps = {
  searchParams: Promise<{ normalizar?: string }>
}

function intensity(count: number, max: number): number {
  if (max === 0 || count === 0) return 0
  return Math.min(1, 0.08 + 0.92 * (count / max))
}

function cellColor(count: number, max: number, color: string | null): string {
  if (count === 0) return 'transparent'
  const base = color ?? '#4f46e5'
  const m = base.match(/^#([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i)
  if (!m) return base
  const alpha = Math.round(intensity(count, max) * 255)
    .toString(16).padStart(2, '0')
  return `${base}${alpha}`
}

export default async function MatrixPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const normalize = sp.normalizar === '1'

  const matrix = await getPartyCategoryMatrix(15, 12)

  // Re-compute per-party normalization if requested: share of that category
  // within that party's own total.
  const displayValue = (party: string, catId: string): number => {
    const raw = matrix.cells.get(`${party}::${catId}`) ?? 0
    if (!normalize) return raw
    const total = matrix.parties.find((p) => p.party === party)?.total ?? 0
    if (total === 0) return 0
    return Math.round((raw / total) * 1000) / 10 // percent, one decimal
  }
  const displayMax = normalize
    ? 100
    : matrix.max

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-6 flex items-start gap-3">
        <Grid3x3 className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Análise
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Partidos × categorias
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Matriz cruzando os 15 partidos com mais declarações registradas
            e as 12 categorias editoriais mais usadas. Quanto mais saturada a
            cor, mais registros daquele partido naquela categoria.
          </p>
        </div>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2">
        <Link
          href="/analise/partidos-x-categorias"
          className={`rounded-full border px-3 py-1 text-xs font-medium ${!normalize ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200' : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'}`}
        >
          Contagem absoluta
        </Link>
        <Link
          href="/analise/partidos-x-categorias?normalizar=1"
          className={`rounded-full border px-3 py-1 text-xs font-medium ${normalize ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200' : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'}`}
        >
          % do total do partido
        </Link>
      </nav>

      <div className="overflow-x-auto rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
        <table className="min-w-full text-xs">
          <thead>
            <tr>
              <th className="sticky left-0 z-10 bg-white px-3 py-2 text-left font-semibold text-gray-700 dark:bg-gray-900 dark:text-gray-200">
                Partido
              </th>
              {matrix.categories.map((c) => (
                <th
                  key={c.id}
                  className="whitespace-nowrap px-2 py-2 text-center font-medium text-gray-600 dark:text-gray-400"
                  title={`${c.label}: ${c.total.toLocaleString('pt-BR')} declarações totais`}
                >
                  <Link href={`/categorias/${c.slug}`} className="hover:underline">
                    <span
                      className="mr-1 inline-block h-2 w-2 rounded-full align-middle"
                      style={{ backgroundColor: c.color ?? '#9ca3af' }}
                      aria-hidden
                    />
                    {c.label.length > 20 ? c.label.slice(0, 17) + '…' : c.label}
                  </Link>
                </th>
              ))}
              <th className="px-3 py-2 text-right font-semibold text-gray-700 dark:text-gray-200">
                Total
              </th>
            </tr>
          </thead>
          <tbody>
            {matrix.parties.map((p) => (
              <tr key={p.party} className="border-t border-gray-100 dark:border-gray-800">
                <th
                  scope="row"
                  className="sticky left-0 z-10 whitespace-nowrap bg-white px-3 py-1.5 text-left font-semibold text-gray-900 dark:bg-gray-900 dark:text-gray-100"
                >
                  <Link href={`/partidos/${p.party}`} className="hover:underline">
                    {p.party}
                  </Link>
                </th>
                {matrix.categories.map((c) => {
                  const v = displayValue(p.party, c.id)
                  const raw = matrix.cells.get(`${p.party}::${c.id}`) ?? 0
                  const bg = cellColor(normalize ? raw : raw, matrix.max, c.color)
                  return (
                    <td
                      key={c.id}
                      className="px-2 py-1.5 text-center font-mono tabular-nums"
                      style={{ backgroundColor: bg }}
                      title={`${p.party} × ${c.label}: ${raw.toLocaleString('pt-BR')}`}
                    >
                      {normalize
                        ? (v === 0 ? '' : `${v}%`)
                        : (raw === 0 ? '' : raw.toLocaleString('pt-BR'))}
                    </td>
                  )
                })}
                <td className="px-3 py-1.5 text-right font-semibold tabular-nums text-gray-900 dark:text-gray-100">
                  {p.total.toLocaleString('pt-BR')}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <footer className="mt-6 rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Uma declaração pode ser contada em mais de uma célula porque uma
          mesma fala costuma ser classificada em múltiplas categorias. Por isso
          a soma das células de um partido excede o total exibido à direita.
          Escolha <strong>% do total do partido</strong> para comparar perfis
          entre siglas de tamanhos diferentes.
        </p>
      </footer>
    </main>
  )
}
