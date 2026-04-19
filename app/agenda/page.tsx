import Link from 'next/link'
import type { Metadata } from 'next'
import { Calendar, Rss } from 'lucide-react'
import { listEvents, kindLabel, type PoliticalEvent } from '@/lib/agenda/queries'
import { renderWithGlossary } from '@/lib/glossary/render'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Agenda política — Registra Brasil',
  description:
    'Próximas votações, CPIs, audiências, debates e decretos selecionados pela equipe editorial do Registra Brasil.',
  alternates: {
    canonical: '/agenda',
    types: { 'application/rss+xml': '/agenda/feed.xml' },
  },
  openGraph: {
    title: 'Agenda política — Registra Brasil',
    description: 'Próximos eventos políticos selecionados.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Agenda política — Registra Brasil',
    description: 'Próximos eventos políticos selecionados.',
  },
}

interface PageProps {
  searchParams: Promise<{ filtro?: string }>
}

function fmtDateLong(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', {
    weekday: 'long', year: 'numeric', month: 'long', day: '2-digit',
  })
}

function fmtTime(iso: string): string {
  return new Date(iso).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' })
}

function groupByDay(events: PoliticalEvent[]): Array<{ day: string; items: PoliticalEvent[] }> {
  const groups = new Map<string, PoliticalEvent[]>()
  for (const e of events) {
    const dayKey = e.event_date.slice(0, 10)
    if (!groups.has(dayKey)) groups.set(dayKey, [])
    groups.get(dayKey)!.push(e)
  }
  return [...groups.entries()].map(([day, items]) => ({ day, items }))
}

export default async function AgendaPage({ searchParams }: PageProps) {
  const { filtro = 'upcoming' } = await searchParams
  const scope: 'upcoming' | 'past' | 'all' =
    filtro === 'past' || filtro === 'all' ? filtro : 'upcoming'

  const events = await listEvents(scope, 120)
  const groups = groupByDay(events)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-8 flex flex-wrap items-start justify-between gap-3">
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Curadoria editorial
          </p>
          <h1 className="mt-1 flex items-center gap-2 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            <Calendar className="h-7 w-7 text-indigo-600" aria-hidden />
            Agenda política
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            Votações, CPIs, audiências e outros eventos selecionados pela equipe
            para acompanhamento. Curadoria, não robô — só entra aqui o que vale
            a atenção do leitor.
          </p>
        </div>
        <a
          href="/agenda/feed.xml"
          className="inline-flex items-center gap-1.5 rounded-full border border-orange-300 bg-orange-50 px-3 py-1 text-sm text-orange-800 hover:bg-orange-100 dark:border-orange-800 dark:bg-orange-950/40 dark:text-orange-200"
        >
          <Rss className="h-3.5 w-3.5" />
          RSS
        </a>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2" aria-label="Filtrar">
        {([
          ['upcoming', 'Próximos'],
          ['past', 'Passados'],
          ['all', 'Todos'],
        ] as const).map(([id, label]) => {
          const active = scope === id
          return (
            <Link
              key={id}
              href={`/agenda?filtro=${id}`}
              className={`rounded-full border px-3 py-1 text-xs font-medium ${
                active
                  ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200'
                  : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'
              }`}
            >
              {label}
            </Link>
          )
        })}
      </nav>

      {groups.length === 0 ? (
        <p className="text-gray-500">Nenhum evento registrado neste filtro.</p>
      ) : (
        <div className="flex flex-col gap-8">
          {groups.map(({ day, items }) => (
            <section key={day}>
              <h2 className="mb-3 border-b border-gray-200 pb-2 text-sm font-semibold uppercase tracking-wider text-gray-600 dark:border-gray-800 dark:text-gray-400">
                {fmtDateLong(day + 'T12:00:00Z')}
              </h2>
              <ul className="flex flex-col gap-3">
                {items.map((e) => (
                  <li key={e.id}>
                    <article className="rounded-xl border border-gray-200 bg-white p-4 transition hover:border-indigo-400 dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-600">
                      <header className="mb-2 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                        <time dateTime={e.event_date} className="tabular-nums">
                          {fmtTime(e.event_date)}
                          {e.event_end_date && ` – ${fmtTime(e.event_end_date)}`}
                        </time>
                        <span
                          className="rounded-full bg-indigo-100 px-2 py-0.5 font-medium text-indigo-900 dark:bg-indigo-950/40 dark:text-indigo-200"
                        >
                          {kindLabel(e.kind)}
                        </span>
                        {e.location && <span>{e.location}</span>}
                      </header>
                      <h3 className="text-base font-semibold text-gray-900 dark:text-gray-100">
                        {e.title}
                      </h3>
                      <p className="mt-1 text-sm text-gray-700 dark:text-gray-300">
                        {renderWithGlossary(e.summary)}
                      </p>
                      {(e.source_url || e.politician) && (
                        <footer className="mt-2 flex flex-wrap items-center gap-3 text-xs">
                          {e.politician && (
                            <Link
                              href={`/politico/${e.politician.slug}`}
                              className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                            >
                              {e.politician.common_name}
                            </Link>
                          )}
                          {e.source_url && (
                            <a
                              href={e.source_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-gray-500 underline-offset-2 hover:underline dark:text-gray-400"
                            >
                              Fonte ↗
                            </a>
                          )}
                        </footer>
                      )}
                    </article>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </div>
      )}
    </main>
  )
}
