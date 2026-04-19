import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { Activity, Clock, GitCompare, Calendar, FolderKanban, BookOpen } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { listPublishedContradictions } from '@/lib/contradictions/queries'
import { listEvents } from '@/lib/agenda/queries'

export const revalidate = 120

export const metadata: Metadata = {
  title: 'Em tempo real — Registra Brasil',
  description:
    'Painel único com os movimentos mais recentes do arquivo: novas declarações, contradições publicadas, eventos futuros da agenda, coleções e histórias editoriais.',
  alternates: {
    canonical: '/ao-vivo',
    types: { 'application/rss+xml': '/feed.xml' },
  },
  openGraph: {
    title: 'Em tempo real — Registra Brasil',
    description: 'Painel "o que mudou agora" do arquivo.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

function fmtDate(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short' })
}

function fmtTime(iso: string): string {
  return new Date(iso).toLocaleString('pt-BR', {
    day: '2-digit', month: 'short', hour: '2-digit', minute: '2-digit',
  })
}

function relative(iso: string): string {
  const diffMin = Math.max(1, Math.round((Date.now() - new Date(iso).getTime()) / 60_000))
  if (diffMin < 60) return `há ${diffMin} min`
  const hours = Math.round(diffMin / 60)
  if (hours < 48) return `há ${hours} h`
  const days = Math.round(hours / 24)
  return `há ${days} dias`
}

export default async function AoVivoPage() {
  const supabase = getSupabaseServiceClient()

  const [stmtRes, colRes, storyRes, contradictions, events] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, statement_date, verification_status, created_at, politicians(slug, common_name, party, state, photo_url)')
      .neq('verification_status', 'removed')
      .order('created_at', { ascending: false })
      .limit(10),
    (supabase.from('collections') as any)
      .select('slug, title, subtitle, published_at')
      .eq('is_published', true)
      .order('published_at', { ascending: false, nullsFirst: false })
      .limit(3),
    (supabase.from('stories') as any)
      .select('slug, title, subtitle, author, reading_time_min, published_at')
      .eq('is_published', true)
      .order('published_at', { ascending: false, nullsFirst: false })
      .limit(3),
    listPublishedContradictions(5).catch(() => []),
    listEvents('upcoming', 5).catch(() => []),
  ])

  type StmtRow = {
    id: string; slug: string | null; summary: string; statement_date: string
    verification_status: string; created_at: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null } | null
  }
  const statements = ((stmtRes.data ?? []) as StmtRow[])
  const collections = ((colRes.data ?? []) as Array<{ slug: string; title: string; subtitle: string | null; published_at: string | null }>)
  const stories = ((storyRes.data ?? []) as Array<{ slug: string; title: string; subtitle: string | null; author: string | null; reading_time_min: number | null; published_at: string | null }>)

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <Activity className="mt-1 h-7 w-7 shrink-0 animate-pulse text-rose-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Em tempo real
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            O que mudou agora
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Painel único com os movimentos mais recentes do acervo: novas
            declarações, contradições recém-publicadas, a agenda política das
            próximas horas e os últimos textos editoriais. Atualiza a cada
            2 minutos.
          </p>
        </div>
      </header>

      <div className="grid grid-cols-1 gap-8 md:grid-cols-3">
        <section className="md:col-span-2">
          <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
            <Clock className="h-4 w-4 text-indigo-600" aria-hidden />
            Últimas declarações
            <span className="text-xs font-normal text-gray-500">({statements.length})</span>
          </h2>
          {statements.length === 0 ? (
            <p className="text-sm text-gray-500">Sem novidades.</p>
          ) : (
            <ul className="flex flex-col gap-3">
              {statements.map((s) => {
                const p = s.politicians
                return (
                  <li key={s.id} className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
                    <div className="flex items-start gap-3">
                      {p?.photo_url ? (
                        <Image src={p.photo_url} alt="" width={40} height={40} unoptimized className="h-10 w-10 shrink-0 rounded-full object-cover" />
                      ) : <span className="h-10 w-10 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />}
                      <div className="min-w-0 flex-1">
                        <Link
                          href={`/declaracao/${s.slug ?? s.id}`}
                          className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                        >
                          {s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}
                        </Link>
                        <div className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                          {p && (
                            <Link href={`/politico/${p.slug}`} className="hover:underline">
                              {p.common_name}
                            </Link>
                          )}
                          {p?.party && <> · {p.party}{p.state ? `-${p.state}` : ''}</>}
                          {' · '}{fmtDate(s.statement_date)}
                          {' · registrado '}{relative(s.created_at)}
                          <span
                            className={`ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
                              s.verification_status === 'verified'
                                ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-200'
                                : s.verification_status === 'disputed'
                                ? 'bg-rose-100 text-rose-900 dark:bg-rose-950/40 dark:text-rose-200'
                                : 'bg-amber-100 text-amber-900 dark:bg-amber-950/40 dark:text-amber-200'
                            }`}
                          >
                            {s.verification_status}
                          </span>
                        </div>
                      </div>
                    </div>
                  </li>
                )
              })}
            </ul>
          )}
        </section>

        <aside className="flex flex-col gap-6">
          <section>
            <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
              <Calendar className="h-4 w-4 text-emerald-600" aria-hidden />
              Próximos eventos
            </h2>
            {events.length === 0 ? (
              <p className="text-xs text-gray-500">Nada agendado.</p>
            ) : (
              <ul className="flex flex-col gap-2 text-sm">
                {events.map((e) => (
                  <li key={e.id}>
                    <div className="text-xs text-gray-500 dark:text-gray-400">{fmtTime(e.event_date)}</div>
                    <Link href={`/agenda#${e.id}`} className="font-medium text-indigo-700 hover:underline dark:text-indigo-300">
                      {e.title}
                    </Link>
                  </li>
                ))}
              </ul>
            )}
            <Link href="/agenda" className="mt-2 inline-block text-xs text-gray-500 hover:underline dark:text-gray-400">
              Ver agenda completa →
            </Link>
          </section>

          <section>
            <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
              <GitCompare className="h-4 w-4 text-rose-600" aria-hidden />
              Contradições recentes
            </h2>
            {contradictions.length === 0 ? (
              <p className="text-xs text-gray-500">Nenhuma publicada ainda.</p>
            ) : (
              <ul className="flex flex-col gap-2 text-sm">
                {contradictions.map((c) => (
                  <li key={c.id}>
                    <Link href={`/contradicoes/${c.id}`} className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300">
                      {c.headline}
                    </Link>
                    <span className="text-xs text-gray-500 dark:text-gray-400">
                      {c.politician.common_name} · {relative(c.created_at)}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </section>

          {collections.length > 0 && (
            <section>
              <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
                <FolderKanban className="h-4 w-4 text-sky-600" aria-hidden />
                Coleções novas
              </h2>
              <ul className="flex flex-col gap-2 text-sm">
                {collections.map((c) => (
                  <li key={c.slug}>
                    <Link href={`/colecao/${c.slug}`} className="font-medium text-indigo-700 hover:underline dark:text-indigo-300">
                      {c.title}
                    </Link>
                    {c.subtitle && (
                      <p className="text-xs text-gray-600 dark:text-gray-400">{c.subtitle}</p>
                    )}
                  </li>
                ))}
              </ul>
            </section>
          )}

          {stories.length > 0 && (
            <section>
              <h2 className="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
                <BookOpen className="h-4 w-4 text-amber-600" aria-hidden />
                Histórias recentes
              </h2>
              <ul className="flex flex-col gap-2 text-sm">
                {stories.map((s) => (
                  <li key={s.slug}>
                    <Link href={`/historia/${s.slug}`} className="font-medium text-indigo-700 hover:underline dark:text-indigo-300">
                      {s.title}
                    </Link>
                    <span className="block text-xs text-gray-500 dark:text-gray-400">
                      por {s.author ?? 'Registra Brasil'}
                      {s.reading_time_min ? ` · ${s.reading_time_min} min` : ''}
                    </span>
                  </li>
                ))}
              </ul>
            </section>
          )}
        </aside>
      </div>
    </main>
  )
}
