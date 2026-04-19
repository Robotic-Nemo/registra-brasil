import Link from 'next/link'
import type { Metadata } from 'next'
import { Grid3x3 } from 'lucide-react'
import { getStateCategoryMatrix } from '@/lib/analysis/state-category'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estados × categorias — Registra Brasil',
  description:
    'Matriz de calor cruzando UFs brasileiras com as categorias editoriais mais usadas.',
  alternates: { canonical: '/analise/estados-x-categorias' },
  openGraph: {
    title: 'Estados × categorias — Registra Brasil',
    description: 'Matriz de calor: UF × categorias editoriais.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

type PageProps = { searchParams: Promise<{ normalizar?: string }> }

function cellColor(count: number, max: number, color: string | null): string {
  if (count === 0 || max === 0) return 'transparent'
  const base = color ?? '#4f46e5'
  const m = base.match(/^#([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i)
  if (!m) return base
  const t = Math.min(1, 0.08 + 0.92 * (count / max))
  const alpha = Math.round(t * 255).toString(16).padStart(2, '0')
  return `${base}${alpha}`
}

export default async function MatrixPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const normalize = sp.normalizar === '1'
  const matrix = await getStateCategoryMatrix()

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-6 flex items-start gap-3">
        <Grid3x3 className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Análise
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Estados × categorias
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Cruza cada UF com as 12 categorias editoriais mais usadas. Útil
            para ver quais temas concentram-se onde. Normalize por UF para
            comparar perfis entre estados de tamanhos diferentes.
          </p>
        </div>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2">
        <Link
          href="/analise/estados-x-categorias"
          className={`rounded-full border px-3 py-1 text-xs font-medium ${!normalize ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200' : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'}`}
        >
          Contagem absoluta
        </Link>
        <Link
          href="/analise/estados-x-categorias?normalizar=1"
          className={`rounded-full border px-3 py-1 text-xs font-medium ${normalize ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200' : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'}`}
        >
          % do total da UF
        </Link>
      </nav>

      <div className="overflow-x-auto rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
        <table className="min-w-full text-xs">
          <thead>
            <tr>
              <th className="sticky left-0 z-10 bg-white px-3 py-2 text-left font-semibold text-gray-700 dark:bg-gray-900 dark:text-gray-200">
                UF
              </th>
              {matrix.categories.map((c) => (
                <th key={c.id} className="whitespace-nowrap px-2 py-2 text-center font-medium text-gray-600 dark:text-gray-400">
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
            {matrix.states.map((st) => (
              <tr key={st.state} className="border-t border-gray-100 dark:border-gray-800">
                <th scope="row" className="sticky left-0 z-10 whitespace-nowrap bg-white px-3 py-1.5 text-left font-semibold text-gray-900 dark:bg-gray-900 dark:text-gray-100">
                  <Link href={`/estados/${st.state.toLowerCase()}`} className="hover:underline">
                    {st.state}
                  </Link>
                </th>
                {matrix.categories.map((c) => {
                  const raw = matrix.cells.get(`${st.state}::${c.id}`) ?? 0
                  const pct = st.total === 0 ? 0 : Math.round((raw / st.total) * 1000) / 10
                  const bg = cellColor(raw, matrix.max, c.color)
                  return (
                    <td
                      key={c.id}
                      className="px-2 py-1.5 text-center font-mono tabular-nums"
                      style={{ backgroundColor: bg }}
                      title={`${st.state} × ${c.label}: ${raw.toLocaleString('pt-BR')}`}
                    >
                      {normalize ? (pct === 0 ? '' : `${pct}%`) : (raw === 0 ? '' : raw.toLocaleString('pt-BR'))}
                    </td>
                  )
                })}
                <td className="px-3 py-1.5 text-right font-semibold tabular-nums text-gray-900 dark:text-gray-100">
                  {st.total.toLocaleString('pt-BR')}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <footer className="mt-6 rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          O estado vem do perfil do político, não do local onde a fala
          aconteceu. Uma declaração pode entrar em mais de uma célula porque
          costuma ser classificada em várias categorias — por isso as somas
          horizontais superam o total da direita.
        </p>
      </footer>
    </main>
  )
}
