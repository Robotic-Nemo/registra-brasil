import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'

interface Props {
  a: PoliticianCompareData
  b: PoliticianCompareData
}

export function CompareStats({ a, b }: Props) {
  const stats = [
    { label: 'Total de declaracoes', valueA: a.totalStatements, valueB: b.totalStatements },
    { label: 'Categorias abordadas', valueA: a.categories.length, valueB: b.categories.length },
  ]

  return (
    <div className="grid grid-cols-3 gap-4">
      {stats.map((stat) => (
        <div key={stat.label} className="contents">
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 text-center">
            <div className="text-xl font-bold text-blue-900 tabular-nums">
              {stat.valueA.toLocaleString('pt-BR')}
            </div>
            <div className="text-xs text-blue-600 truncate">{a.name}</div>
          </div>
          <div className="flex items-center justify-center">
            <div className="text-center">
              <div className="text-xs font-medium text-gray-500">{stat.label}</div>
            </div>
          </div>
          <div className="bg-red-50 border border-red-200 rounded-lg p-3 text-center">
            <div className="text-xl font-bold text-red-900 tabular-nums">
              {stat.valueB.toLocaleString('pt-BR')}
            </div>
            <div className="text-xs text-red-600 truncate">{b.name}</div>
          </div>
        </div>
      ))}
    </div>
  )
}
