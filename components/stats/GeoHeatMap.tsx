import Link from 'next/link'
import { BRAZILIAN_STATES } from '@/lib/constants/states'

export interface StateHeatData {
  state: string
  count: number
  percentage: number
}

interface Props {
  data: StateHeatData[]
}

function getHeatColor(percentage: number, max: number): string {
  if (max === 0) return '#f3f4f6'
  const ratio = percentage / max
  if (ratio === 0) return '#f3f4f6'
  if (ratio < 0.2) return '#dbeafe'
  if (ratio < 0.4) return '#93c5fd'
  if (ratio < 0.6) return '#3b82f6'
  if (ratio < 0.8) return '#1d4ed8'
  return '#1e3a8a'
}

function getTextColor(percentage: number, max: number): string {
  if (max === 0) return '#6b7280'
  const ratio = percentage / max
  return ratio >= 0.5 ? '#ffffff' : '#1f2937'
}

export function GeoHeatMap({ data }: Props) {
  const dataMap = new Map(data.map((d) => [d.state, d]))
  const maxPct = Math.max(...data.map((d) => d.percentage), 1)

  // Group by region
  const regions = new Map<string, typeof BRAZILIAN_STATES>()
  for (const state of BRAZILIAN_STATES) {
    const existing = regions.get(state.region) ?? []
    existing.push(state)
    regions.set(state.region, existing)
  }

  const regionOrder = ['Sudeste', 'Nordeste', 'Sul', 'Norte', 'Centro-Oeste']

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Declaracoes por estado</h3>

      {/* Legend */}
      <div className="flex items-center gap-1 mb-4">
        <span className="text-[10px] text-gray-400">Menos</span>
        {[0, 0.2, 0.4, 0.6, 0.8, 1].map((r) => (
          <div
            key={r}
            className="w-5 h-3 rounded-sm"
            style={{ backgroundColor: getHeatColor(r * maxPct, maxPct) }}
          />
        ))}
        <span className="text-[10px] text-gray-400">Mais</span>
      </div>

      <div className="space-y-4">
        {regionOrder.map((region) => {
          const states = regions.get(region)
          if (!states) return null
          return (
            <div key={region}>
              <h4 className="text-xs font-medium text-gray-500 mb-1.5">{region}</h4>
              <div className="flex flex-wrap gap-1">
                {states.map((s) => {
                  const d = dataMap.get(s.uf)
                  const count = d?.count ?? 0
                  const pct = d?.percentage ?? 0
                  return (
                    <Link
                      key={s.uf}
                      href={`/estados/${s.uf.toLowerCase()}`}
                      className="rounded px-2 py-1 text-center transition-transform hover:scale-105"
                      style={{
                        backgroundColor: getHeatColor(pct, maxPct),
                        color: getTextColor(pct, maxPct),
                      }}
                      title={`${s.name}: ${count} declaracoes`}
                    >
                      <div className="text-xs font-bold">{s.uf}</div>
                      <div className="text-[10px] tabular-nums">{count}</div>
                    </Link>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
