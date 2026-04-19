import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { MapPin } from 'lucide-react'
import { BrazilTileMap } from '@/components/maps/BrazilTileMap'

export const revalidate = 1800

export const metadata: Metadata = {
  title: 'Mapa de declarações por estado — Registra Brasil',
  description:
    'Distribuição geográfica das declarações registradas por estado brasileiro, com contagens por UF e por região.',
  alternates: { canonical: '/mapa' },
}

const BRAZILIAN_STATES = [
  { uf: 'AC', name: 'Acre', region: 'Norte' },
  { uf: 'AL', name: 'Alagoas', region: 'Nordeste' },
  { uf: 'AM', name: 'Amazonas', region: 'Norte' },
  { uf: 'AP', name: 'Amapá', region: 'Norte' },
  { uf: 'BA', name: 'Bahia', region: 'Nordeste' },
  { uf: 'CE', name: 'Ceará', region: 'Nordeste' },
  { uf: 'DF', name: 'Distrito Federal', region: 'Centro-Oeste' },
  { uf: 'ES', name: 'Espírito Santo', region: 'Sudeste' },
  { uf: 'GO', name: 'Goiás', region: 'Centro-Oeste' },
  { uf: 'MA', name: 'Maranhão', region: 'Nordeste' },
  { uf: 'MG', name: 'Minas Gerais', region: 'Sudeste' },
  { uf: 'MS', name: 'Mato Grosso do Sul', region: 'Centro-Oeste' },
  { uf: 'MT', name: 'Mato Grosso', region: 'Centro-Oeste' },
  { uf: 'PA', name: 'Pará', region: 'Norte' },
  { uf: 'PB', name: 'Paraíba', region: 'Nordeste' },
  { uf: 'PE', name: 'Pernambuco', region: 'Nordeste' },
  { uf: 'PI', name: 'Piauí', region: 'Nordeste' },
  { uf: 'PR', name: 'Paraná', region: 'Sul' },
  { uf: 'RJ', name: 'Rio de Janeiro', region: 'Sudeste' },
  { uf: 'RN', name: 'Rio Grande do Norte', region: 'Nordeste' },
  { uf: 'RO', name: 'Rondônia', region: 'Norte' },
  { uf: 'RR', name: 'Roraima', region: 'Norte' },
  { uf: 'RS', name: 'Rio Grande do Sul', region: 'Sul' },
  { uf: 'SC', name: 'Santa Catarina', region: 'Sul' },
  { uf: 'SE', name: 'Sergipe', region: 'Nordeste' },
  { uf: 'SP', name: 'São Paulo', region: 'Sudeste' },
  { uf: 'TO', name: 'Tocantins', region: 'Norte' },
]

const REGION_ORDER = ['Sudeste', 'Nordeste', 'Sul', 'Centro-Oeste', 'Norte'] as const

function densityClass(count: number, max: number): string {
  if (max === 0 || count === 0) return 'bg-gray-50 text-gray-400 border-gray-200'
  const ratio = count / max
  if (ratio > 0.7) return 'bg-blue-700 text-white border-blue-800'
  if (ratio > 0.4) return 'bg-blue-500 text-white border-blue-600'
  if (ratio > 0.15) return 'bg-blue-200 text-blue-900 border-blue-300'
  return 'bg-blue-50 text-blue-800 border-blue-200'
}

export default async function MapaPage() {
  const supabase = getSupabaseServiceClient()

  // Statement counts join via politicians.state — single round-trip.
  const [politiciansRes, statementsRes] = await Promise.all([
    (supabase.from('politicians') as any)
      .select('state')
      .eq('is_active', true),
    (supabase.from('statements') as any)
      .select('politicians(state)')
      .neq('verification_status', 'removed')
      .limit(20_000),
  ])

  const politicianCount = new Map<string, number>()
  for (const row of (politiciansRes.data ?? []) as Array<{ state: string | null }>) {
    if (row.state) politicianCount.set(row.state, (politicianCount.get(row.state) ?? 0) + 1)
  }

  const statementCount = new Map<string, number>()
  for (const row of (statementsRes.data ?? []) as Array<{ politicians: { state: string | null } | null }>) {
    const st = row.politicians?.state
    if (st) statementCount.set(st, (statementCount.get(st) ?? 0) + 1)
  }

  const maxStatements = Math.max(...statementCount.values(), 1)
  const totalStatements = Array.from(statementCount.values()).reduce((a, b) => a + b, 0)
  const totalPoliticians = Array.from(politicianCount.values()).reduce((a, b) => a + b, 0)

  const byRegion = new Map<string, Array<typeof BRAZILIAN_STATES[number] & { stmts: number; pols: number }>>()
  for (const state of BRAZILIAN_STATES) {
    const enriched = {
      ...state,
      stmts: statementCount.get(state.uf) ?? 0,
      pols: politicianCount.get(state.uf) ?? 0,
    }
    if (!byRegion.has(state.region)) byRegion.set(state.region, [])
    byRegion.get(state.region)!.push(enriched)
  }

  const topStates = [...BRAZILIAN_STATES]
    .map((s) => ({ ...s, count: statementCount.get(s.uf) ?? 0 }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 10)

  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Mapa' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <MapPin className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Mapa de declarações por estado</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Distribuição geográfica do acervo. {totalStatements.toLocaleString('pt-BR')} declarações
          de {totalPoliticians} políticos cobrindo {statementCount.size} estados.
        </p>
      </header>

      <section className="mb-10 rounded-xl border border-gray-200 bg-white p-4 sm:p-6">
        <h2 className="mb-3 text-sm font-semibold text-gray-900">Cartograma em grade</h2>
        <p className="mb-4 text-xs text-gray-600">
          Cada estado ocupa o mesmo espaço visual. A intensidade da cor mostra
          o volume de declarações arquivadas. Clique para abrir o estado.
        </p>
        <BrazilTileMap
          counts={Object.fromEntries(statementCount)}
          labelFor={(_, c) => (c === 0 ? '—' : c.toLocaleString('pt-BR'))}
          rampColor="#1d4ed8"
          hrefTemplate="/estados/{uf}"
          title="Declarações por UF — cartograma em grade"
        />
      </section>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-10">
        <div className="lg:col-span-2 space-y-6">
          {REGION_ORDER.map((region) => {
            const states = byRegion.get(region) ?? []
            const regionStmts = states.reduce((a, b) => a + b.stmts, 0)
            return (
              <section key={region}>
                <h2 className="text-sm font-semibold text-gray-900 mb-2 flex items-baseline gap-2">
                  {region}
                  <span className="text-xs text-gray-500 font-normal">
                    {regionStmts.toLocaleString('pt-BR')} declarações · {states.length} estados
                  </span>
                </h2>
                <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-7 gap-2">
                  {states.map((s) => {
                    const cls = densityClass(s.stmts, maxStatements)
                    return (
                      <Link
                        key={s.uf}
                        href={`/estados/${s.uf}`}
                        prefetch={false}
                        className={`block rounded-lg border px-2 py-3 text-center transition-shadow hover:shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 ${cls}`}
                        title={`${s.name}: ${s.stmts} declarações, ${s.pols} políticos`}
                        aria-label={`${s.name}: ${s.stmts} declarações`}
                      >
                        <span className="block text-base font-bold">{s.uf}</span>
                        <span className="block text-xs opacity-80 tabular-nums">
                          {s.stmts.toLocaleString('pt-BR')}
                        </span>
                      </Link>
                    )
                  })}
                </div>
              </section>
            )
          })}
        </div>

        <aside className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3">Top 10 estados</h2>
          <ol className="flex flex-col gap-1.5 text-sm">
            {topStates.map((s, i) => (
              <li key={s.uf} className="flex items-center gap-2">
                <span className="text-xs text-gray-400 w-5 text-right">{i + 1}.</span>
                <Link href={`/estados/${s.uf}`} className="font-mono font-semibold text-blue-700 hover:underline w-8">
                  {s.uf}
                </Link>
                <span className="flex-1 text-gray-700 text-xs truncate">{s.name}</span>
                <span className="tabular-nums text-xs text-gray-500">{s.count.toLocaleString('pt-BR')}</span>
              </li>
            ))}
          </ol>

          <hr className="my-4 border-gray-100" />

          <h3 className="text-xs font-semibold text-gray-700 mb-2">Densidade</h3>
          <div className="flex flex-col gap-1 text-xs text-gray-600">
            <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-gray-100 border border-gray-200" /> Nenhum registro</div>
            <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-blue-50 border border-blue-200" /> Baixa (&lt;15% do máximo)</div>
            <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-blue-200 border border-blue-300" /> Média</div>
            <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-blue-500 border border-blue-600" /> Alta</div>
            <div className="flex items-center gap-2"><span className="w-3 h-3 rounded bg-blue-700 border border-blue-800" /> Muito alta (&gt;70%)</div>
          </div>
        </aside>
      </div>

      <p className="text-xs text-gray-500">
        Contagens incluem apenas declarações com status diferente de &ldquo;removida&rdquo; e
        políticos ativos. Clique em um estado para ver a lista completa de parlamentares e
        declarações da UF.
      </p>
    </main>
  )
}
