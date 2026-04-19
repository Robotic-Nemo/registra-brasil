import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSourceDomainDetail, listSourceDomains } from '@/lib/sources/queries'
import {
  displaySourceName,
  classifySource,
  CATEGORY_LABEL,
  CATEGORY_COLOR,
} from '@/lib/sources/domain'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ domain: string }>
}

function normalize(raw: string): string {
  return decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { domain: rawDomain } = await params
  const domain = normalize(rawDomain)
  const name = displaySourceName(domain)
  return {
    title: `${name} — Fontes — Registra Brasil`,
    description: `Declarações citadas a partir de ${name} (${domain}) no arquivo do Registra Brasil.`,
    alternates: { canonical: `/fontes/${encodeURIComponent(domain)}` },
    openGraph: {
      title: `${name} — Fontes — Registra Brasil`,
      description: `Declarações citadas a partir de ${name} (${domain}).`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
    twitter: {
      card: 'summary',
      title: `${name} — Fontes — Registra Brasil`,
      description: `Declarações citadas a partir de ${name} (${domain}).`,
    },
  }
}

function fmtDate(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit',
  })
}

export default async function FonteDomainPage({ params }: PageProps) {
  const { domain: rawDomain } = await params
  const domain = normalize(rawDomain)

  const [rows, domainsAll] = await Promise.all([
    getSourceDomainDetail(domain, 30),
    listSourceDomains(500, 0),
  ])

  const meta = domainsAll.find((d) => d.domain === domain)
  if (!meta) notFound()

  const cat = classifySource(domain)
  const name = displaySourceName(domain)
  const politicianSet = new Set(rows.map((r) => r.politician_slug))

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <nav className="mb-4 text-sm text-gray-500 dark:text-gray-400">
        <Link href="/fontes" className="hover:underline">Fontes</Link>
        {' › '}
        <span className="text-gray-700 dark:text-gray-300">{name}</span>
      </nav>

      <header className="mb-8">
        <div className="flex flex-wrap items-center gap-3">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            {name}
          </h1>
          <span
            className={`inline-block rounded-full px-3 py-1 text-xs font-semibold ${CATEGORY_COLOR[cat]}`}
          >
            {CATEGORY_LABEL[cat]}
          </span>
        </div>
        <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
          <a
            href={`https://${domain}`}
            target="_blank"
            rel="noopener noreferrer"
            className="hover:underline"
          >
            {domain}
          </a>
        </p>

        <dl className="mt-6 grid grid-cols-2 md:grid-cols-4 gap-4">
          <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
            <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
              Citações
            </dt>
            <dd className="mt-1 text-2xl font-bold tabular-nums">
              {Number(meta.citation_count).toLocaleString('pt-BR')}
            </dd>
          </div>
          <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
            <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
              Políticos
            </dt>
            <dd className="mt-1 text-2xl font-bold tabular-nums">
              {Number(meta.politician_count).toLocaleString('pt-BR')}
            </dd>
          </div>
          <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
            <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
              Primeira
            </dt>
            <dd className="mt-1 text-sm">
              {meta.first_seen ? fmtDate(meta.first_seen) : '—'}
            </dd>
          </div>
          <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
            <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
              Última
            </dt>
            <dd className="mt-1 text-sm">
              {meta.last_seen ? fmtDate(meta.last_seen) : '—'}
            </dd>
          </div>
        </dl>
      </header>

      <section>
        <h2 className="mb-3 text-xl font-semibold text-gray-900 dark:text-gray-100">
          Declarações recentes citando esta fonte
        </h2>
        {rows.length === 0 ? (
          <p className="text-gray-500">Nenhuma declaração encontrada.</p>
        ) : (
          <ul className="divide-y divide-gray-100 dark:divide-gray-800 rounded-xl border border-gray-200 dark:border-gray-800">
            {rows.map((r) => (
              <li key={r.statement_id} className="p-4 hover:bg-gray-50 dark:hover:bg-gray-900/40">
                <div className="flex items-start justify-between gap-4">
                  <div className="min-w-0">
                    <Link
                      href={`/declaracao/${r.slug ?? r.statement_id}`}
                      className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {r.summary}
                    </Link>
                    <div className="mt-1 text-sm text-gray-500 dark:text-gray-400">
                      <Link href={`/politico/${r.politician_slug}`} className="hover:underline">
                        {r.politician_name}
                      </Link>
                      {' · '}
                      {fmtDate(r.statement_date)}
                    </div>
                  </div>
                  <a
                    href={r.primary_source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="shrink-0 rounded border border-gray-300 px-2 py-1 text-xs text-gray-600 hover:bg-gray-100 dark:border-gray-700 dark:text-gray-300 dark:hover:bg-gray-800"
                    aria-label="Abrir fonte original"
                  >
                    Abrir ↗
                  </a>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          O rótulo <strong>{CATEGORY_LABEL[cat]}</strong> é atribuído automaticamente pelo
          padrão do domínio (TLD <code>.gov.br</code>/<code>.leg.br</code> para oficiais,
          lista editorial para veículos de imprensa, etc.). Esta fonte foi citada por{' '}
          {politicianSet.size} político{politicianSet.size === 1 ? '' : 's'} nas últimas{' '}
          {rows.length} declarações exibidas aqui.
        </p>
      </section>
    </main>
  )
}
