import type { Metadata } from 'next'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const metadata: Metadata = {
  title: 'Mapa de Declaracoes — Registra Brasil',
  description: 'Visualizacao geografica das declaracoes por estado brasileiro.',
  alternates: { canonical: '/mapa' },
}

const BRAZILIAN_STATES = [
  { uf: 'AC', name: 'Acre', region: 'Norte' },
  { uf: 'AL', name: 'Alagoas', region: 'Nordeste' },
  { uf: 'AM', name: 'Amazonas', region: 'Norte' },
  { uf: 'AP', name: 'Amapa', region: 'Norte' },
  { uf: 'BA', name: 'Bahia', region: 'Nordeste' },
  { uf: 'CE', name: 'Ceara', region: 'Nordeste' },
  { uf: 'DF', name: 'Distrito Federal', region: 'Centro-Oeste' },
  { uf: 'ES', name: 'Espirito Santo', region: 'Sudeste' },
  { uf: 'GO', name: 'Goias', region: 'Centro-Oeste' },
  { uf: 'MA', name: 'Maranhao', region: 'Nordeste' },
  { uf: 'MG', name: 'Minas Gerais', region: 'Sudeste' },
  { uf: 'MS', name: 'Mato Grosso do Sul', region: 'Centro-Oeste' },
  { uf: 'MT', name: 'Mato Grosso', region: 'Centro-Oeste' },
  { uf: 'PA', name: 'Para', region: 'Norte' },
  { uf: 'PB', name: 'Paraiba', region: 'Nordeste' },
  { uf: 'PE', name: 'Pernambuco', region: 'Nordeste' },
  { uf: 'PI', name: 'Piaui', region: 'Nordeste' },
  { uf: 'PR', name: 'Parana', region: 'Sul' },
  { uf: 'RJ', name: 'Rio de Janeiro', region: 'Sudeste' },
  { uf: 'RN', name: 'Rio Grande do Norte', region: 'Nordeste' },
  { uf: 'RO', name: 'Rondonia', region: 'Norte' },
  { uf: 'RR', name: 'Roraima', region: 'Norte' },
  { uf: 'RS', name: 'Rio Grande do Sul', region: 'Sul' },
  { uf: 'SC', name: 'Santa Catarina', region: 'Sul' },
  { uf: 'SE', name: 'Sergipe', region: 'Nordeste' },
  { uf: 'SP', name: 'Sao Paulo', region: 'Sudeste' },
  { uf: 'TO', name: 'Tocantins', region: 'Norte' },
]

function getDensityColor(count: number, max: number): string {
  if (max === 0) return 'bg-gray-100'
  const ratio = count / max
  if (ratio > 0.7) return 'bg-blue-600 text-white'
  if (ratio > 0.4) return 'bg-blue-400 text-white'
  if (ratio > 0.15) return 'bg-blue-200 text-blue-900'
  if (ratio > 0) return 'bg-blue-100 text-blue-800'
  return 'bg-gray-100 text-gray-400'
}

export default async function MapaPage() {
  const supabase = getSupabaseServiceClient()

  // Get politician counts by state
  const { data: politicians } = await supabase
    .from('politicians')
    .select('state')
    .eq('is_active', true)

  const stateCountMap = new Map<string, number>()
  if (politicians) {
    for (const p of politicians) {
      const st = (p as unknown as { state: string | null }).state
      if (st) {
        stateCountMap.set(st, (stateCountMap.get(st) ?? 0) + 1)
      }
    }
  }

  const maxCount = Math.max(...stateCountMap.values(), 1)
  const totalPoliticians = politicians?.length ?? 0

  // Group by region
  const regions = new Map<string, typeof BRAZILIAN_STATES>()
  for (const state of BRAZILIAN_STATES) {
    const existing = regions.get(state.region) ?? []
    existing.push(state)
    regions.set(state.region, existing)
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">
        Mapa de Declaracoes
      </h1>
      <p className="text-gray-500 mb-8">
        Distribuicao de politicos registrados por estado. {totalPoliticians} politicos
        ativos em {stateCountMap.size} estados.
      </p>

      {/* Legend */}
      <div className="flex flex-wrap items-center gap-3 mb-8 text-sm">
        <span className="text-gray-500">Densidade:</span>
        <span className="inline-flex items-center gap-1">
          <span className="w-4 h-4 rounded bg-gray-100 border border-gray-200" /> Nenhum
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="w-4 h-4 rounded bg-blue-100" /> Baixa
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="w-4 h-4 rounded bg-blue-200" /> Media
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="w-4 h-4 rounded bg-blue-400" /> Alta
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="w-4 h-4 rounded bg-blue-600" /> Muito alta
        </span>
      </div>

      {/* Grid by region */}
      <div className="space-y-8">
        {Array.from(regions.entries()).map(([region, states]) => {
          const regionTotal = states.reduce((acc, s) => acc + (stateCountMap.get(s.uf) ?? 0), 0)

          return (
            <section key={region}>
              <h2 className="text-lg font-semibold text-gray-900 mb-3 flex items-baseline gap-2">
                {region}
                <span className="text-sm font-normal text-gray-400">
                  ({regionTotal} {regionTotal === 1 ? 'politico' : 'politicos'})
                </span>
              </h2>
              <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-7 gap-2">
                {states.map((state) => {
                  const count = stateCountMap.get(state.uf) ?? 0
                  return (
                    <div
                      key={state.uf}
                      className={`rounded-lg p-3 text-center transition-shadow hover:shadow-md ${getDensityColor(count, maxCount)}`}
                      title={`${state.name}: ${count} politico(s)`}
                    >
                      <span className="text-lg font-bold">{state.uf}</span>
                      <p className="text-xs mt-0.5 opacity-75">{count}</p>
                    </div>
                  )
                })}
              </div>
            </section>
          )
        })}
      </div>
    </main>
  )
}
