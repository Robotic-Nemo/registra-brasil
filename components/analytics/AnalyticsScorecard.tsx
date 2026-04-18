import Link from 'next/link'
import Image from 'next/image'
import { BarChart3, TrendingUp, Users } from 'lucide-react'
import type { AggregatedAnalytics } from '@/lib/analytics/aggregate-statements'

interface Props {
  data: AggregatedAnalytics
}

/**
 * Renders the common visualization set used by per-scope analytics
 * pages (category, party, state). Page-specific headers / sources are
 * rendered by the caller — this component is data-only.
 */
export function AnalyticsScorecard({ data }: Props) {
  return (
    <>
      <section className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
        <StatCard label="Total" value={data.total} />
        <StatCard label="Verificadas" value={data.byStatus.verified ?? 0} tone="green" />
        <StatCard label="Contestadas" value={data.byStatus.disputed ?? 0} tone="amber" />
        <StatCard label="Políticos citados" value={data.politicianCount} />
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <TrendingUp className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Últimos 24 meses
        </h2>
        <div className="flex items-end gap-0.5 h-24" role="img" aria-label={`Gráfico de ${data.total} declarações ao longo de 24 meses`}>
          {data.months.map((m) => {
            const h = Math.max(2, (m.count / data.maxMonthly) * 96)
            return (
              <div
                key={m.month}
                className="flex-1 bg-blue-100 hover:bg-blue-300 relative group rounded-t"
                style={{ height: `${h}px` }}
                title={`${m.month}: ${m.count}`}
              >
                <span className="absolute bottom-full left-1/2 -translate-x-1/2 mb-1 text-[10px] bg-gray-900 text-white px-1 py-0.5 rounded opacity-0 group-hover:opacity-100 whitespace-nowrap transition-opacity">
                  {m.month}: {m.count}
                </span>
              </div>
            )
          })}
        </div>
        <div className="flex justify-between text-[10px] text-gray-500 mt-1 font-mono">
          <span>{data.months[0]?.month}</span>
          <span>{data.months[data.months.length - 1]?.month}</span>
        </div>
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Distribuição de severidade</h2>
        <div className="flex gap-2 items-end h-20">
          {[1, 2, 3, 4, 5].map((lvl) => {
            const n = data.bySeverity[lvl] ?? 0
            const maxSev = Math.max(1, ...Object.values(data.bySeverity))
            const h = Math.max(4, (n / maxSev) * 80)
            const cls = lvl >= 4 ? 'bg-red-500' : lvl === 3 ? 'bg-amber-400' : 'bg-blue-400'
            return (
              <div key={lvl} className="flex-1 flex flex-col items-center justify-end" title={`Severidade ${lvl}: ${n}`}>
                <span className={`w-full rounded-t ${cls}`} style={{ height: `${h}px` }} aria-hidden="true" />
                <span className="text-[10px] text-gray-500 mt-0.5">{lvl}</span>
                <span className="text-[10px] text-gray-400 tabular-nums">{n}</span>
              </div>
            )
          })}
        </div>
      </section>

      {data.topPoliticians.length > 0 && (
        <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
            <Users className="w-4 h-4 text-blue-700" aria-hidden="true" />
            Top 10 políticos
          </h2>
          <ol className="space-y-2">
            {data.topPoliticians.map((p, i) => {
              const barPct = (p.count / data.topPoliticians[0].count) * 100
              return (
                <li key={p.pol.id} className="flex items-center gap-3">
                  <span className="w-5 text-right text-xs tabular-nums text-gray-500">{i + 1}.</span>
                  {p.pol.photo_url ? (
                    <Image src={p.pol.photo_url} alt="" width={32} height={32} unoptimized className="w-8 h-8 rounded-full border border-gray-200" />
                  ) : (
                    <div className="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center text-xs font-bold text-gray-400">{p.pol.common_name[0]}</div>
                  )}
                  <div className="flex-1 min-w-0">
                    <Link href={`/politico/${p.pol.slug}`} className="text-sm font-medium text-gray-900 hover:text-blue-700 hover:underline truncate block">
                      {p.pol.common_name}
                    </Link>
                    <div className="text-xs text-gray-500">{p.pol.party}{p.pol.state ? `-${p.pol.state}` : ''}</div>
                    <div className="h-1.5 bg-gray-100 rounded-full mt-0.5 overflow-hidden">
                      <div className="h-full bg-blue-500" style={{ width: `${barPct}%` }} aria-hidden="true" />
                    </div>
                  </div>
                  <span className="tabular-nums text-xs font-mono text-blue-700">{p.count}</span>
                </li>
              )
            })}
          </ol>
        </section>
      )}

      {data.topCategories.length > 0 && (
        <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
            <BarChart3 className="w-4 h-4 text-blue-700" aria-hidden="true" />
            Categorias mais frequentes
          </h2>
          <ul className="flex flex-wrap gap-2">
            {data.topCategories.map((c) => (
              <li key={c.slug}>
                <Link
                  href={`/categorias/${c.slug}`}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs rounded-full bg-gray-50 hover:bg-gray-100 border border-gray-200 text-gray-800"
                >
                  <span className="w-2 h-2 rounded-full" style={{ backgroundColor: c.color_hex }} aria-hidden="true" />
                  {c.label_pt}
                  <span className="text-gray-500 tabular-nums">{c.count}</span>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section>
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Mais recentes</h2>
        <ul className="space-y-2">
          {data.recent.map((s) => (
            <li key={s.id} className="bg-white border border-gray-200 rounded-lg p-3 text-sm">
              <div className="flex items-center justify-between gap-3 mb-1 text-xs text-gray-500">
                <span>{s.politicians?.common_name ?? '—'} ({s.politicians?.party ?? '—'})</span>
                <span>{s.statement_date}</span>
              </div>
              <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-gray-900 hover:text-blue-700 hover:underline">
                {s.summary.slice(0, 160)}{s.summary.length > 160 ? '…' : ''}
              </Link>
            </li>
          ))}
        </ul>
      </section>
    </>
  )
}

function StatCard({ label, value, tone }: { label: string; value: number; tone?: 'green' | 'amber' }) {
  const cls = tone === 'green' ? 'text-green-700' : tone === 'amber' ? 'text-amber-700' : 'text-gray-900'
  return (
    <div className="bg-white border border-gray-200 rounded-lg p-4 text-center">
      <p className={`text-2xl font-bold tabular-nums ${cls}`}>{value.toLocaleString('pt-BR')}</p>
      <p className="text-xs text-gray-500 mt-1">{label}</p>
    </div>
  )
}
