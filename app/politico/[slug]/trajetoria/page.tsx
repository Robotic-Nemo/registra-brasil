import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug } from '@/lib/supabase/queries/politicians'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import {
  getYearlyActivity, computeRange, partyColor,
  type TimeSegment,
} from '@/lib/politicians/trajectory'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) return { title: 'Trajetória não encontrada' }
  return {
    title: `Trajetória de ${p.common_name} — Registra Brasil`,
    description: `Histórico partidário, cargos e volume anual de declarações de ${p.common_name}.`,
    alternates: { canonical: `/politico/${slug}/trajetoria` },
    openGraph: {
      title: `Trajetória de ${p.common_name} — Registra Brasil`,
      description: `Linha do tempo política de ${p.common_name}.`,
      type: 'profile',
      siteName: 'Registra Brasil',
    },
  }
}

function yearNow(): number { return new Date().getFullYear() }

function segmentsToYears(history: unknown, currentLabel: string): TimeSegment[] {
  const list = Array.isArray(history) ? (history as Array<{ party?: string; role?: string; from?: string; to?: string }>) : []
  const out: TimeSegment[] = list
    .filter((s) => s.from)
    .map((s) => ({ label: s.party ?? s.role ?? '—', from: s.from!, to: s.to ?? null }))
  if (out.length === 0 && currentLabel) {
    // Fallback: show a single open segment representing "current".
    out.push({ label: currentLabel, from: `${yearNow() - 4}-01-01`, to: null })
  }
  return out
}

export default async function TrajetoriaPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) notFound()

  const parties = segmentsToYears((p as any).party_history, p.party)
  const roles = segmentsToYears((p as any).role_history, p.role ?? '')
  const activity = await getYearlyActivity(p.id)

  const { minYear, maxYear } = computeRange(parties, roles, activity)
  const span = Math.max(1, maxYear - minYear)

  // Map a date ISO to percent-left within the chart
  const yearOf = (iso: string) => Number(iso.slice(0, 4)) + (Number(iso.slice(5, 7)) - 1) / 12
  const pct = (iso: string | null) => {
    const y = iso ? yearOf(iso) : maxYear + 1
    return Math.max(0, Math.min(100, ((y - minYear) / span) * 100))
  }

  const partyColors = new Map<string, string>()
  parties.forEach((s, i) => {
    if (!partyColors.has(s.label)) partyColors.set(s.label, partyColor(s.label, i))
  })
  const uniqueParties = [...partyColors.entries()]

  const maxCount = Math.max(1, ...activity.map((a) => a.count))
  const years: number[] = []
  for (let y = minYear; y <= maxYear; y++) years.push(y)
  const activityMap = new Map(activity.map((a) => [a.year, a.count]))

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <Breadcrumbs items={[
        { label: 'Políticos', href: '/politicos' },
        { label: p.common_name, href: `/politico/${p.slug}` },
        { label: 'Trajetória' },
      ]} />

      <header className="mb-8 mt-4 flex items-start gap-4">
        {p.photo_url && (
          <Image src={p.photo_url} alt="" width={64} height={64} unoptimized className="h-16 w-16 rounded-full object-cover" />
        )}
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Linha do tempo
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Trajetória de {p.common_name}
          </h1>
          <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">
            {p.party}{p.state ? `-${p.state}` : ''} · {minYear}–{maxYear}
          </p>
        </div>
      </header>

      {uniqueParties.length > 0 && (
        <nav aria-label="Legenda de partidos" className="mb-4 flex flex-wrap gap-2 text-xs">
          {uniqueParties.map(([party, color]) => (
            <span key={party} className="inline-flex items-center gap-1 rounded-full border border-gray-200 bg-white px-2 py-0.5 dark:border-gray-800 dark:bg-gray-900">
              <span className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: color }} aria-hidden />
              <span className="text-gray-800 dark:text-gray-200">{party}</span>
            </span>
          ))}
        </nav>
      )}

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Partidos
        </h2>
        {parties.length === 0 ? (
          <p className="text-xs text-gray-500">Sem histórico partidário.</p>
        ) : (
          <div className="relative h-12">
            {parties.map((s, i) => {
              const left = pct(s.from)
              const right = pct(s.to)
              const width = Math.max(1.5, right - left)
              return (
                <div
                  key={`${s.label}-${i}`}
                  className="absolute top-1 flex h-10 items-center justify-center rounded border border-black/10 text-[11px] font-semibold text-white shadow-sm"
                  style={{
                    left: `${left}%`,
                    width: `${width}%`,
                    backgroundColor: partyColors.get(s.label) ?? '#6b7280',
                  }}
                  title={`${s.label} (${s.from.slice(0, 7)}${s.to ? ` → ${s.to.slice(0, 7)}` : ' → hoje'})`}
                >
                  {width > 6 ? s.label : ''}
                </div>
              )
            })}
          </div>
        )}
      </section>

      {roles.length > 0 && (
        <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Cargos
          </h2>
          <div className="relative h-10">
            {roles.map((s, i) => {
              const left = pct(s.from)
              const right = pct(s.to)
              const width = Math.max(1.5, right - left)
              return (
                <div
                  key={`${s.label}-${i}`}
                  className="absolute top-1 flex h-8 items-center justify-center rounded border border-indigo-300 bg-indigo-100 text-[11px] font-medium text-indigo-900 dark:border-indigo-800 dark:bg-indigo-950/40 dark:text-indigo-100"
                  style={{ left: `${left}%`, width: `${width}%` }}
                  title={`${s.label} (${s.from.slice(0, 7)}${s.to ? ` → ${s.to.slice(0, 7)}` : ' → hoje'})`}
                >
                  {width > 6 ? s.label : ''}
                </div>
              )
            })}
          </div>
        </section>
      )}

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Volume anual de declarações
        </h2>
        {activity.length === 0 ? (
          <p className="text-xs text-gray-500">Nenhuma declaração registrada ainda.</p>
        ) : (
          <div className="flex h-28 items-end gap-px">
            {years.map((y) => {
              const v = activityMap.get(y) ?? 0
              const h = v === 0 ? 2 : 4 + Math.round((v / maxCount) * 100)
              return (
                <div key={y} className="group relative flex h-full flex-1 items-end" title={`${y}: ${v} declarações`}>
                  <div
                    className={`w-full rounded-t ${v > 0 ? 'bg-indigo-500 hover:bg-indigo-600' : 'bg-gray-200 dark:bg-gray-800'}`}
                    style={{ height: `${h}px` }}
                  />
                </div>
              )
            })}
          </div>
        )}
        <div className="mt-1 flex justify-between text-[10px] tabular-nums text-gray-500 dark:text-gray-500">
          <span>{minYear}</span>
          <span>{Math.round((minYear + maxYear) / 2)}</span>
          <span>{maxYear}</span>
        </div>
      </section>

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Barras de partido e cargo vêm dos campos <code>party_history</code>{' '}
          e <code>role_history</code> mantidos pela equipe editorial. Datas
          aproximadas são marcadas no banco com uma precisão de mês. O volume
          anual conta todas as declarações não removidas cuja{' '}
          <code>statement_date</code> cai no respectivo ano.
        </p>
      </footer>
    </main>
  )
}
