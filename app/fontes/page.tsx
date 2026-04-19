import Link from 'next/link'
import type { Metadata } from 'next'
import { listSourceDomains } from '@/lib/sources/queries'
import {
  displaySourceName,
  classifySource,
  CATEGORY_LABEL,
  CATEGORY_COLOR,
  type SourceCategory,
} from '@/lib/sources/domain'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Fontes — Registra Brasil',
  description:
    'Diretório de veículos e fontes citados no Registra Brasil: quantas declarações cada domínio documenta, de quantos políticos e em que período.',
  openGraph: {
    title: 'Fontes — Registra Brasil',
    description:
      'Diretório de veículos e fontes citados no Registra Brasil.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Fontes — Registra Brasil',
    description: 'Diretório de veículos e fontes citados no arquivo.',
  },
  alternates: { canonical: '/fontes' },
}

function fmtDate(iso: string | null): string {
  if (!iso) return '—'
  const d = new Date(iso)
  return d.toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

const CATEGORIES: SourceCategory[] = ['imprensa', 'oficial', 'video', 'social', 'outro']

export default async function FontesPage() {
  const rows = await listSourceDomains(200, 0)

  const grouped = new Map<SourceCategory, typeof rows>()
  for (const c of CATEGORIES) grouped.set(c, [])
  for (const r of rows) grouped.get(classifySource(r.domain))!.push(r)

  const totalCitations = rows.reduce((a, r) => a + Number(r.citation_count), 0)

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-8">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Transparência editorial
        </p>
        <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          Fontes citadas
        </h1>
        <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
          Diretório dos {rows.length.toLocaleString('pt-BR')} domínios usados como fonte
          primária das declarações deste arquivo — {totalCitations.toLocaleString('pt-BR')}{' '}
          citações no total. Veículos oficiais, imprensa e redes sociais recebem rótulos
          diferentes para ajudar o leitor a aferir o peso de cada fonte.
        </p>
      </header>

      {CATEGORIES.map((cat) => {
        const list = (grouped.get(cat) ?? []).sort(
          (a, b) => Number(b.citation_count) - Number(a.citation_count),
        )
        if (list.length === 0) return null
        return (
          <section key={cat} className="mb-12">
            <div className="mb-4 flex items-center gap-3">
              <span
                className={`inline-block rounded-full px-3 py-1 text-xs font-semibold ${CATEGORY_COLOR[cat]}`}
              >
                {CATEGORY_LABEL[cat]}
              </span>
              <span className="text-sm text-gray-500 dark:text-gray-400">
                {list.length} {list.length === 1 ? 'fonte' : 'fontes'}
              </span>
            </div>
            <div className="overflow-hidden rounded-xl border border-gray-200 dark:border-gray-800">
              <table className="w-full text-sm">
                <thead className="bg-gray-50 text-xs uppercase tracking-wider text-gray-500 dark:bg-gray-900/60 dark:text-gray-400">
                  <tr>
                    <th className="px-4 py-2 text-left">Domínio</th>
                    <th className="px-4 py-2 text-right">Citações</th>
                    <th className="px-4 py-2 text-right">Políticos</th>
                    <th className="px-4 py-2 text-right hidden md:table-cell">Primeira</th>
                    <th className="px-4 py-2 text-right hidden md:table-cell">Última</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-gray-800">
                  {list.map((r) => (
                    <tr key={r.domain} className="hover:bg-gray-50 dark:hover:bg-gray-900/40">
                      <td className="px-4 py-2">
                        <Link
                          href={`/fontes/${encodeURIComponent(r.domain)}`}
                          className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                        >
                          {displaySourceName(r.domain)}
                        </Link>
                        <div className="text-xs text-gray-500 dark:text-gray-400">
                          {r.domain}
                        </div>
                      </td>
                      <td className="px-4 py-2 text-right tabular-nums">
                        {Number(r.citation_count).toLocaleString('pt-BR')}
                      </td>
                      <td className="px-4 py-2 text-right tabular-nums">
                        {Number(r.politician_count).toLocaleString('pt-BR')}
                      </td>
                      <td className="px-4 py-2 text-right text-gray-500 dark:text-gray-400 hidden md:table-cell">
                        {fmtDate(r.first_seen)}
                      </td>
                      <td className="px-4 py-2 text-right text-gray-500 dark:text-gray-400 hidden md:table-cell">
                        {fmtDate(r.last_seen)}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        )
      })}

      <footer className="mt-12 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          A agregação considera apenas a <em>fonte primária</em> de cada declaração. Fontes
          secundárias podem aparecer no cartão individual de cada registro. Declarações
          marcadas como removidas não entram na contagem.
        </p>
      </footer>
    </main>
  )
}
