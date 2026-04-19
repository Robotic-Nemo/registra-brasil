import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug } from '@/lib/supabase/queries/politicians'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { computeScorecard } from '@/lib/politicians/scorecard'
import { sparklineSvg } from '@/lib/trends/sparkline'
import { displaySourceName } from '@/lib/sources/domain'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) return { title: 'Scorecard não encontrado' }
  return {
    title: `Scorecard: ${p.common_name} — Registra Brasil`,
    description: `Painel de métricas de ${p.common_name}: declarações verificadas, gravidade, fontes mais citadas e ranking entre pares.`,
    alternates: { canonical: `/politico/${slug}/scorecard` },
    openGraph: {
      title: `Scorecard: ${p.common_name} — Registra Brasil`,
      description: `Painel de métricas arquivísticas de ${p.common_name}.`,
      type: 'profile',
      siteName: 'Registra Brasil',
      ...(p.photo_url ? { images: [{ url: p.photo_url }] } : {}),
    },
  }
}

const SEV_COLORS: Record<number, string> = {
  1: '#e5e7eb',
  2: '#fde68a',
  3: '#fb923c',
  4: '#ef4444',
  5: '#7f1d1d',
}

const SEV_LABELS: Record<number, string> = {
  1: 'Leve',
  2: 'Média',
  3: 'Elevada',
  4: 'Crítica',
  5: 'Extrema',
}

function pct(n: number, total: number): string {
  if (total === 0) return '0%'
  return `${Math.round((n / total) * 100)}%`
}

function ordinal(n: number): string {
  return `${n}º`
}

function fmtDate(iso: string | null): string {
  if (!iso) return '—'
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

export default async function ScorecardPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) notFound()

  const s = await computeScorecard(p.id, p.party, p.state)

  const sevMax = Math.max(1, ...Object.values(s.severityHistogram))
  const sparkline = sparklineSvg(s.monthly.map((m) => m.count), {
    width: 320,
    height: 60,
    color: '#4f46e5',
    ariaLabel: 'Declarações por mês nos últimos 24 meses',
  })

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <Breadcrumbs items={[
        { label: 'Políticos', href: '/politicos' },
        { label: p.common_name, href: `/politico/${p.slug}` },
        { label: 'Scorecard' },
      ]} />

      <header className="mb-8 mt-4 flex items-start gap-4">
        {p.photo_url && (
          <Image
            src={p.photo_url}
            alt=""
            width={72}
            height={72}
            unoptimized
            className="h-[72px] w-[72px] rounded-full object-cover"
          />
        )}
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Painel de métricas
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Scorecard de {p.common_name}
          </h1>
          <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">
            {p.party}{p.state ? `-${p.state}` : ''} · Calculado sobre {s.total.toLocaleString('pt-BR')} declarações registradas.
          </p>
        </div>
      </header>

      <section className="mb-8 grid grid-cols-2 gap-3 md:grid-cols-4">
        <Card label="Total" value={s.total.toLocaleString('pt-BR')} />
        <Card label="Verificadas" value={pct(s.verifiedCount, s.total)} sub={`${s.verifiedCount.toLocaleString('pt-BR')} de ${s.total.toLocaleString('pt-BR')}`} />
        <Card label="Em destaque" value={s.featuredCount.toLocaleString('pt-BR')} sub="is_featured" />
        <Card label="Com vídeo" value={s.withVideoCount.toLocaleString('pt-BR')} sub="YouTube ID registrado" />
      </section>

      <section className="mb-8 grid grid-cols-1 gap-4 md:grid-cols-3">
        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Atividade mensal — 24 meses
          </h2>
          <div
            className="text-indigo-600 dark:text-indigo-300"
            dangerouslySetInnerHTML={{ __html: sparkline }}
          />
          <p className="mt-2 text-xs text-gray-500">
            Primeiro registro: {fmtDate(s.firstDate)}. Último: {fmtDate(s.lastDate)}.
          </p>
        </div>

        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Distribuição de gravidade
          </h2>
          <ul className="flex flex-col gap-2">
            {[5, 4, 3, 2, 1].map((sev) => {
              const v = s.severityHistogram[sev as 1 | 2 | 3 | 4 | 5]
              const width = sevMax === 0 ? 0 : Math.round((v / sevMax) * 100)
              return (
                <li key={sev} className="flex items-center gap-2 text-xs">
                  <span className="w-16 shrink-0 text-gray-600 dark:text-gray-400">
                    {SEV_LABELS[sev]}
                  </span>
                  <div className="relative h-3 flex-1 rounded bg-gray-100 dark:bg-gray-800">
                    <div
                      className="absolute inset-y-0 left-0 rounded"
                      style={{ width: `${width}%`, backgroundColor: SEV_COLORS[sev] }}
                    />
                  </div>
                  <span className="w-12 shrink-0 text-right tabular-nums text-gray-700 dark:text-gray-300">
                    {v}
                  </span>
                </li>
              )
            })}
          </ul>
        </div>

        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Ranking entre pares
          </h2>
          <dl className="flex flex-col gap-3 text-sm">
            <div className="flex items-baseline justify-between">
              <dt className="text-gray-600 dark:text-gray-400">
                No {p.party}
              </dt>
              <dd className="text-2xl font-bold tabular-nums text-gray-900 dark:text-gray-100">
                {s.partyRank.rank ? ordinal(s.partyRank.rank) : '—'}
                <span className="ml-1 text-xs font-normal text-gray-500">
                  / {s.partyRank.total}
                </span>
              </dd>
            </div>
            {p.state && (
              <div className="flex items-baseline justify-between">
                <dt className="text-gray-600 dark:text-gray-400">Em {p.state}</dt>
                <dd className="text-2xl font-bold tabular-nums text-gray-900 dark:text-gray-100">
                  {s.stateRank.rank ? ordinal(s.stateRank.rank) : '—'}
                  <span className="ml-1 text-xs font-normal text-gray-500">
                    / {s.stateRank.total}
                  </span>
                </dd>
              </div>
            )}
            <p className="text-[11px] text-gray-500 dark:text-gray-500">
              Ranking por total de declarações registradas. Apenas políticos
              ativos contam.
            </p>
          </dl>
        </div>
      </section>

      <section className="mb-8 grid grid-cols-1 gap-4 md:grid-cols-2">
        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Fontes mais citadas
          </h2>
          {s.topDomains.length === 0 ? (
            <p className="text-xs text-gray-500">Sem domínios registrados.</p>
          ) : (
            <ol className="flex flex-col gap-1 text-sm">
              {s.topDomains.map((d) => (
                <li key={d.domain} className="flex items-center justify-between">
                  <Link
                    href={`/fontes/${encodeURIComponent(d.domain)}`}
                    className="truncate text-indigo-700 hover:underline dark:text-indigo-300"
                  >
                    {displaySourceName(d.domain)}
                  </Link>
                  <span className="ml-2 text-xs tabular-nums text-gray-500 dark:text-gray-400">
                    {d.count}
                  </span>
                </li>
              ))}
            </ol>
          )}
        </div>

        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
            Cruzamentos editoriais
          </h2>
          <dl className="flex flex-col gap-2 text-sm">
            <div className="flex items-baseline justify-between">
              <dt className="text-gray-600 dark:text-gray-400">Contradições publicadas</dt>
              <dd className="text-xl font-bold tabular-nums">
                <Link href={`/contradicoes`} className="hover:underline">
                  {s.contradictionCount}
                </Link>
              </dd>
            </div>
            <div className="flex items-baseline justify-between">
              <dt className="text-gray-600 dark:text-gray-400">Checagens vinculadas</dt>
              <dd className="text-xl font-bold tabular-nums">
                <Link href={`/fact-checks`} className="hover:underline">
                  {s.factCheckCount}
                </Link>
              </dd>
            </div>
          </dl>
          <p className="mt-3 text-[11px] text-gray-500 dark:text-gray-500">
            Contradições e checagens externas são catalogadas por editores. A
            ausência não significa aprovação — só que nenhum par foi registrado.
          </p>
        </div>
      </section>

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Este painel é calculado sob demanda a partir do arquivo público.
          O cache de página é de 1h, então métricas sobem logo após uma
          nova declaração ser verificada.
        </p>
      </footer>
    </main>
  )
}

function Card({ label, value, sub }: { label: string; value: string; sub?: string }) {
  return (
    <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
      <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
        {label}
      </dt>
      <dd className="mt-1 text-2xl font-bold tabular-nums text-gray-900 dark:text-gray-100">
        {value}
      </dd>
      {sub && <div className="text-xs text-gray-500 dark:text-gray-400">{sub}</div>}
    </div>
  )
}
