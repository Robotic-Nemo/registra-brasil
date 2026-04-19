import type { Metadata } from 'next'
import { Rss } from 'lucide-react'
import { CHANGELOG } from '@/lib/changelog/entries'

export const dynamic = 'force-static'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Changelog — Registra Brasil',
  description: 'Histórico de atualizações e melhorias do Registra Brasil.',
  alternates: {
    canonical: '/changelog',
    types: { 'application/rss+xml': '/changelog/feed.xml' },
  },
  openGraph: {
    title: 'Changelog — Registra Brasil',
    url: `${SITE_URL}/changelog`,
  },
}

export default function ChangelogPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <div className="flex items-center justify-between mb-2">
        <h1 className="text-3xl font-bold text-gray-900">Changelog</h1>
        <a
          href="/changelog/feed.xml"
          rel="alternate"
          type="application/rss+xml"
          className="inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
        >
          <Rss className="w-3.5 h-3.5" aria-hidden="true" />
          RSS
        </a>
      </div>
      <p className="text-gray-500 mb-10">
        Histórico editorial de atualizações do Registra Brasil, das mudanças mais recentes para
        as mais antigas. Assine o RSS para ser avisado quando publicarmos novas releases.
      </p>

      <div className="space-y-0">
        {CHANGELOG.map((entry, index) => (
          <article
            key={entry.version}
            className="relative pl-8 pb-10 border-l-2 border-gray-200 last:border-l-0"
          >
            <div className={`absolute -left-[9px] top-0 w-4 h-4 rounded-full border-2 border-white ${
              index === 0 ? 'bg-blue-600' : 'bg-gray-300'
            }`} />

            <div className="flex flex-wrap items-baseline gap-3 mb-2">
              <span className="text-xs font-mono font-medium text-blue-600 bg-blue-50 px-2 py-0.5 rounded">
                v{entry.version}
              </span>
              <time
                dateTime={entry.date}
                className="text-sm text-gray-400"
              >
                {new Date(entry.date + 'T00:00:00Z').toLocaleDateString('pt-BR', {
                  year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC',
                })}
              </time>
            </div>

            <h2 className="text-lg font-semibold text-gray-900 mb-2">
              {entry.title}
            </h2>

            <ul className="space-y-1">
              {entry.changes.map((change) => (
                <li key={change} className="text-sm text-gray-600 flex items-start gap-2">
                  <span className="text-gray-300 mt-1.5 flex-shrink-0">&#8226;</span>
                  <span>{change}</span>
                </li>
              ))}
            </ul>
          </article>
        ))}
      </div>
    </main>
  )
}
