import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { ListOrdered } from 'lucide-react'

export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Políticos A-Z — Registra Brasil',
  description: 'Índice alfabético de todos os políticos monitorados pelo Registra Brasil, agrupados por letra inicial.',
  alternates: { canonical: '/politicos/a-z' },
  openGraph: {
    title: 'Políticos A-Z — Registra Brasil',
    url: `${SITE_URL}/politicos/a-z`,
  },
}

interface PolRow {
  id: string
  slug: string
  common_name: string
  party: string
  state: string | null
  photo_url: string | null
}

function firstLetter(name: string): string {
  const stripped = name.trim()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // strip accents
    .toUpperCase()
  const ch = stripped[0] ?? '#'
  return /[A-Z]/.test(ch) ? ch : '#'
}

export default async function PoliticosAZPage() {
  const supabase = await getSupabaseServerClient()

  const [{ data: politicians }, { data: counts }] = await Promise.all([
    (supabase.from('politicians') as any)
      .select('id, slug, common_name, party, state, photo_url')
      .eq('is_active', true)
      .order('common_name'),
    (supabase.from('statements') as any)
      .select('politician_id')
      .neq('verification_status', 'removed'),
  ])

  const countMap = new Map<string, number>()
  for (const row of ((counts ?? []) as { politician_id: string }[])) {
    countMap.set(row.politician_id, (countMap.get(row.politician_id) ?? 0) + 1)
  }

  const rows = (politicians ?? []) as PolRow[]

  const buckets = new Map<string, PolRow[]>()
  for (const p of rows) {
    const letter = firstLetter(p.common_name)
    if (!buckets.has(letter)) buckets.set(letter, [])
    buckets.get(letter)!.push(p)
  }

  const letters = [...buckets.keys()].sort((a, b) => {
    if (a === '#') return 1
    if (b === '#') return -1
    return a.localeCompare(b)
  })

  const ALL_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')

  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Políticos', href: '/politicos' },
        { label: 'A-Z' },
      ]} />

      <header className="mb-6">
        <div className="flex items-center gap-3 mb-2">
          <ListOrdered className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Políticos A-Z</h1>
        </div>
        <p className="text-sm text-gray-600">
          {rows.length} políticos ativos agrupados por inicial (ignorando acentos).
        </p>
      </header>

      <nav aria-label="Saltar por letra" className="mb-8 bg-white border border-gray-200 rounded-xl p-3 sticky top-0 z-10">
        <ul className="flex flex-wrap gap-1 text-xs font-mono">
          {ALL_ALPHABET.map((letter) => {
            const has = buckets.has(letter)
            return (
              <li key={letter}>
                {has ? (
                  <a
                    href={`#letter-${letter}`}
                    className="inline-flex items-center justify-center w-8 h-8 rounded bg-blue-50 hover:bg-blue-100 text-blue-800 font-semibold"
                  >
                    {letter}
                  </a>
                ) : (
                  <span className="inline-flex items-center justify-center w-8 h-8 rounded text-gray-300" aria-hidden="true">
                    {letter}
                  </span>
                )}
              </li>
            )
          })}
          {buckets.has('#') && (
            <li>
              <a
                href="#letter-%23"
                className="inline-flex items-center justify-center w-8 h-8 rounded bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold"
              >
                #
              </a>
            </li>
          )}
        </ul>
      </nav>

      <div className="flex flex-col gap-8">
        {letters.map((letter) => {
          const pols = buckets.get(letter) ?? []
          return (
            <section key={letter} id={`letter-${encodeURIComponent(letter)}`} className="scroll-mt-20">
              <h2 className="text-xl font-bold text-gray-900 mb-3 flex items-baseline gap-2 border-b border-gray-200 pb-1">
                {letter}
                <span className="text-xs font-normal text-gray-500">{pols.length}</span>
              </h2>
              <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
                {pols.map((p) => {
                  const count = countMap.get(p.id) ?? 0
                  return (
                    <li key={p.id}>
                      <Link
                        href={`/politico/${p.slug}`}
                        className="flex items-center gap-2 p-2 rounded hover:bg-gray-50 transition-colors"
                      >
                        {p.photo_url ? (
                          <Image src={p.photo_url} alt="" width={32} height={32} unoptimized className="w-8 h-8 rounded-full object-cover border border-gray-200 flex-shrink-0" />
                        ) : (
                          <div className="w-8 h-8 rounded-full bg-gray-100 flex-shrink-0 flex items-center justify-center text-xs font-bold text-gray-400">{p.common_name[0]}</div>
                        )}
                        <div className="flex-1 min-w-0">
                          <p className="text-sm font-medium text-gray-900 truncate">{p.common_name}</p>
                          <p className="text-[11px] text-gray-500">{p.party}{p.state ? `-${p.state}` : ''}</p>
                        </div>
                        {count > 0 && (
                          <span className="text-xs tabular-nums text-blue-700">{count}</span>
                        )}
                      </Link>
                    </li>
                  )
                })}
              </ul>
            </section>
          )
        })}
      </div>
    </main>
  )
}
