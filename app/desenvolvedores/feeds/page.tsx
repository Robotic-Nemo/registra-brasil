import type { Metadata } from 'next'
import Link from 'next/link'
import { Rss, FileJson, FileCode } from 'lucide-react'

export const revalidate = 86400

export const metadata: Metadata = {
  title: 'Catálogo de feeds — Registra Brasil',
  description:
    'Todos os feeds públicos do Registra Brasil (RSS 2.0, Atom 1.0, JSON Feed 1.1) agrupados por escopo e formato.',
  alternates: { canonical: '/desenvolvedores/feeds' },
  openGraph: {
    title: 'Catálogo de feeds — Registra Brasil',
    description: 'RSS 2.0, Atom 1.0 e JSON Feed 1.1 para todos os escopos.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

interface FeedRow {
  label: string
  rss?: string
  jsonFeed?: string
  atom?: string
  desc: string
}

interface Group {
  title: string
  rows: FeedRow[]
}

const GROUPS: Group[] = [
  {
    title: 'Global',
    rows: [
      {
        label: 'Feed principal',
        desc: '30 declarações verificadas mais recentes.',
        rss: '/feed.xml',
        jsonFeed: '/feed.json',
      },
      {
        label: 'Contradições',
        desc: 'Declarações que contradizem outras do mesmo político.',
        rss: '/contradicoes/feed.xml',
      },
      {
        label: 'Destaques do mês',
        desc: 'Declarações mais relevantes do mês corrente.',
        rss: '/destaques/feed.xml',
      },
      {
        label: 'Hoje na história',
        desc: 'Declarações no mesmo dia (MM-DD) de anos anteriores.',
        rss: '/hoje-na-historia/feed.xml',
      },
      {
        label: 'Atualizações / correções',
        desc: 'Log público de revisões editoriais.',
        rss: '/atualizacoes/feed.xml',
      },
    ],
  },
  {
    title: 'Por político / categoria / partido / UF / coleção',
    rows: [
      {
        label: '/politico/:slug/feed',
        desc: 'Todas as declarações de um político.',
        rss: '/politico/:slug/feed.xml',
        jsonFeed: '/politico/:slug/feed.json',
      },
      {
        label: '/categorias/:slug/feed',
        desc: 'Declarações taggeadas por categoria editorial.',
        rss: '/categorias/:slug/feed.xml',
        jsonFeed: '/categorias/:slug/feed.json',
      },
      {
        label: '/partidos/:slug/feed',
        desc: 'Declarações de políticos ativos do partido.',
        rss: '/partidos/:slug/feed.xml',
        jsonFeed: '/partidos/:slug/feed.json',
      },
      {
        label: '/estados/:uf/feed',
        desc: 'Declarações de políticos de uma UF.',
        rss: '/estados/:uf/feed.xml',
        jsonFeed: '/estados/:uf/feed.json',
      },
      {
        label: '/colecao/:slug/feed',
        desc: 'Coleção editorial curada (ordem da curadoria).',
        rss: '/colecao/:slug/feed.xml',
        jsonFeed: '/colecao/:slug/feed.json',
      },
    ],
  },
]

export default function FeedsCatalogPage() {
  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <Rss className="mt-1 h-7 w-7 shrink-0 text-amber-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Para devs
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Catálogo de feeds
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Todos os feeds públicos do Registra Brasil em três formatos:{' '}
            <strong>RSS 2.0</strong> (máxima compatibilidade),{' '}
            <strong>Atom 1.0</strong> (onde aplicável) e{' '}
            <strong>JSON Feed 1.1</strong> (moderno, inclui a extensão
            <code> _registra_brasil</code> com severidade, status de verificação
            e tipo de fonte). Todos respeitam cache de 10–60 min no CDN.
          </p>
        </div>
      </header>

      {GROUPS.map((g) => (
        <section
          key={g.title}
          className="mb-8 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900"
        >
          <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-gray-100">
            {g.title}
          </h2>
          <ul className="flex flex-col gap-4">
            {g.rows.map((row) => (
              <li key={row.label} className="rounded-lg border border-gray-100 p-3 dark:border-gray-800">
                <p className="font-mono text-sm text-gray-900 dark:text-gray-100">
                  {row.label}
                </p>
                <p className="mt-1 text-sm text-gray-600 dark:text-gray-400">
                  {row.desc}
                </p>
                <div className="mt-2 flex flex-wrap gap-2">
                  {row.rss && (
                    <Link
                      href={row.rss.replace(':slug', 'lula').replace(':uf', 'sp')}
                      className="inline-flex items-center gap-1 rounded-full border border-amber-300 bg-amber-50 px-2 py-0.5 text-xs font-medium text-amber-900 hover:bg-amber-100 dark:border-amber-700 dark:bg-amber-950/40 dark:text-amber-200"
                    >
                      <Rss className="h-3 w-3" aria-hidden /> RSS
                    </Link>
                  )}
                  {row.atom && (
                    <Link
                      href={row.atom.replace(':slug', 'lula').replace(':uf', 'sp')}
                      className="inline-flex items-center gap-1 rounded-full border border-sky-300 bg-sky-50 px-2 py-0.5 text-xs font-medium text-sky-900 hover:bg-sky-100 dark:border-sky-700 dark:bg-sky-950/40 dark:text-sky-200"
                    >
                      <FileCode className="h-3 w-3" aria-hidden /> Atom
                    </Link>
                  )}
                  {row.jsonFeed && (
                    <Link
                      href={row.jsonFeed.replace(':slug', 'lula').replace(':uf', 'sp')}
                      className="inline-flex items-center gap-1 rounded-full border border-indigo-300 bg-indigo-50 px-2 py-0.5 text-xs font-medium text-indigo-900 hover:bg-indigo-100 dark:border-indigo-700 dark:bg-indigo-950/40 dark:text-indigo-200"
                    >
                      <FileJson className="h-3 w-3" aria-hidden /> JSON Feed
                    </Link>
                  )}
                </div>
              </li>
            ))}
          </ul>
        </section>
      ))}

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Cada página de escopo (político, categoria, partido, UF, coleção)
          publica tags <code>&lt;link rel=&quot;alternate&quot;&gt;</code> com
          os feeds correspondentes, então qualquer aggregator moderno consegue
          descobri-los automaticamente ao abrir a página. Veja também o{' '}
          <Link href="/desenvolvedores/api" className="underline">
            Explorador da API
          </Link>{' '}
          para os endpoints JSON sem feed.
        </p>
      </footer>
    </main>
  )
}
