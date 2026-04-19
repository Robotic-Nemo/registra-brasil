import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { CalendarDays, ArrowLeft, ArrowRight } from 'lucide-react'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DATE_RE = /^\d{4}-\d{2}-\d{2}$/

interface PageProps { params: Promise<{ date: string }> }

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { date } = await params
  if (!DATE_RE.test(date)) return { title: 'Data inválida — Registra Brasil' }
  return {
    title: `Declarações de ${date} — Registra Brasil`,
    description: `Todas as declarações registradas em ${date}, agrupadas por político.`,
    alternates: { canonical: `/contexto/${date}` },
    openGraph: {
      title: `Declarações de ${date} — Registra Brasil`,
      url: `${SITE_URL}/contexto/${date}`,
    },
  }
}

interface Row {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  statement_date: string
  verification_status: string
  severity_score: number | null
  primary_source_url: string
  politician_id: string
  politicians: { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null } | null
}

function addDays(iso: string, days: number): string {
  const d = new Date(iso + 'T00:00:00Z')
  d.setUTCDate(d.getUTCDate() + days)
  return d.toISOString().slice(0, 10)
}

export default async function ContextoDatePage({ params }: PageProps) {
  const { date } = await params
  if (!DATE_RE.test(date)) notFound()
  const d = new Date(date + 'T00:00:00Z')
  if (Number.isNaN(d.getTime())) notFound()

  const supabase = await getSupabaseServerClient()

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, verification_status, severity_score, primary_source_url, politician_id, politicians(id, slug, common_name, party, state, photo_url)')
    .eq('statement_date', date)
    .neq('verification_status', 'removed')
    .order('severity_score', { ascending: false, nullsFirst: false })
    .limit(500)

  const statements = (rows ?? []) as Row[]

  const byPolitician = new Map<string, { pol: Row['politicians']; items: Row[] }>()
  for (const s of statements) {
    const key = s.politician_id
    const ex = byPolitician.get(key) ?? { pol: s.politicians, items: [] }
    ex.items.push(s)
    byPolitician.set(key, ex)
  }

  const groups = [...byPolitician.values()].sort((a, b) => b.items.length - a.items.length)

  const fmt = d.toLocaleDateString('pt-BR', {
    day: 'numeric', month: 'long', year: 'numeric', weekday: 'long', timeZone: 'UTC',
  })

  const prev = addDays(date, -1)
  const next = addDays(date, 1)
  const today = new Date().toISOString().slice(0, 10)

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Contexto' }, { label: date }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <CalendarDays className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Declarações de {date}</h1>
        </div>
        <p className="text-sm text-gray-600">
          {fmt.charAt(0).toUpperCase() + fmt.slice(1)} — {statements.length} declaraç{statements.length === 1 ? 'ão' : 'ões'} registrada{statements.length === 1 ? '' : 's'} de {byPolitician.size} político{byPolitician.size === 1 ? '' : 's'}.
        </p>
      </header>

      <nav className="flex items-center justify-between text-sm mb-8" aria-label="Navegação por dia">
        <Link href={`/contexto/${prev}`} className="inline-flex items-center gap-1 text-blue-700 hover:underline">
          <ArrowLeft className="w-4 h-4" aria-hidden="true" />
          {prev}
        </Link>
        <Link href="/linha-do-tempo" className="text-gray-600 hover:underline text-xs">Linha do tempo completa</Link>
        {next <= today && (
          <Link href={`/contexto/${next}`} className="inline-flex items-center gap-1 text-blue-700 hover:underline">
            {next}
            <ArrowRight className="w-4 h-4" aria-hidden="true" />
          </Link>
        )}
      </nav>

      {statements.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Nenhuma declaração registrada neste dia. Veja{' '}
          <Link href="/linha-do-tempo" className="underline text-blue-700">a linha do tempo completa</Link>{' '}
          para navegar pelas datas com cobertura.
        </p>
      ) : (
        <ol className="flex flex-col gap-5">
          {groups.map(({ pol, items }) => {
            if (!pol) return null
            return (
              <li key={pol.id} className="bg-white border border-gray-200 rounded-xl p-4">
                <div className="flex items-center gap-3 mb-3">
                  {pol.photo_url ? (
                    <Image src={pol.photo_url} alt="" width={36} height={36} unoptimized className="w-9 h-9 rounded-full object-cover border border-gray-200 flex-shrink-0" />
                  ) : (
                    <div className="w-9 h-9 rounded-full bg-gray-100 flex items-center justify-center text-sm font-bold text-gray-400 flex-shrink-0">{pol.common_name[0]}</div>
                  )}
                  <div className="flex-1 min-w-0">
                    <Link href={`/politico/${pol.slug}`} className="font-semibold text-gray-900 hover:text-blue-700 hover:underline">
                      {pol.common_name}
                    </Link>
                    <p className="text-xs text-gray-500">
                      {pol.party}{pol.state ? '-' + pol.state : ''} · {items.length} declaraç{items.length === 1 ? 'ão' : 'ões'}
                    </p>
                  </div>
                </div>
                <ul className="flex flex-col gap-2 text-sm">
                  {items.map((s) => (
                    <li key={s.id} className="border-l-2 border-gray-200 pl-3">
                      <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-gray-900 hover:text-blue-700 hover:underline block">
                        {s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}
                      </Link>
                      <p className="text-[11px] text-gray-500 mt-0.5">
                        {s.verification_status}
                        {s.severity_score ? ` · severidade ${s.severity_score}` : ''}
                      </p>
                    </li>
                  ))}
                </ul>
              </li>
            )
          })}
        </ol>
      )}
    </main>
  )
}
