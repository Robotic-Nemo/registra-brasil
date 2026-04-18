import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getRecentPicks } from '@/lib/supabase/queries/daily-pick'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Sparkles, Rss } from 'lucide-react'

export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Declaração do dia — arquivo — Registra Brasil',
  description: 'Histórico das declarações destacadas diariamente pela equipe editorial.',
  alternates: {
    canonical: '/declaracao-do-dia',
    types: { 'application/rss+xml': '/declaracao-do-dia/feed.xml' },
  },
  openGraph: {
    title: 'Declaração do dia — Registra Brasil',
    url: `${SITE_URL}/declaracao-do-dia`,
  },
}

export default async function DailyPickArchive() {
  const supabase = await getSupabaseServerClient()
  const picks = await getRecentPicks(supabase, 90)

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Declaração do dia' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Sparkles className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Declaração do dia</h1>
          <a
            href="/declaracao-do-dia/feed.xml"
            rel="alternate"
            type="application/rss+xml"
            className="ml-auto inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
          >
            <Rss className="w-3.5 h-3.5" aria-hidden="true" />
            RSS
          </a>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Arquivo dos últimos 90 picks editoriais. Quando a equipe não agenda um pick manual,
          o destaque do dia é a declaração verificada de maior severidade nos últimos 30 dias.
        </p>
      </header>

      {picks.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Nenhum pick histórico registrado ainda.
        </p>
      ) : (
        <ol className="flex flex-col gap-4">
          {picks.map((p) => {
            const s = p.statement
            const pol = s.politicians
            return (
              <li key={p.pickDate}>
                <Link
                  href={`/declaracao/${s.slug ?? s.id}`}
                  className="block bg-white border border-gray-200 rounded-xl p-4 hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
                >
                  <div className="flex items-start gap-3">
                    {pol?.photo_url && (
                      <Image src={pol.photo_url} alt="" width={48} height={48} unoptimized className="w-12 h-12 rounded-full object-cover border border-gray-200 flex-shrink-0" />
                    )}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 text-xs text-gray-500 mb-1">
                        <time dateTime={p.pickDate} className="font-mono">{p.pickDate}</time>
                        {pol && <span>· {pol.common_name} ({pol.party}{pol.state ? '-' + pol.state : ''})</span>}
                      </div>
                      {p.curatorNote && <p className="text-xs italic text-blue-900 mb-1">&ldquo;{p.curatorNote}&rdquo;</p>}
                      <p className="text-gray-900">{s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}</p>
                    </div>
                  </div>
                </Link>
              </li>
            )
          })}
        </ol>
      )}
    </main>
  )
}
