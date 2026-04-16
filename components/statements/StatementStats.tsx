interface StatementStatsProps {
  totalStatements: number
  verifiedCount: number
  disputedCount: number
  categoriesCount: number
  sourceTypesCount: number
}

export function StatementStats({
  totalStatements,
  verifiedCount,
  disputedCount,
  categoriesCount,
  sourceTypesCount,
}: StatementStatsProps) {
  const verifiedPercent = totalStatements > 0 ? Math.round((verifiedCount / totalStatements) * 100) : 0

  const stats = [
    { label: 'Total', value: totalStatements, color: 'text-zinc-900' },
    { label: 'Verificadas', value: verifiedCount, color: 'text-green-600' },
    { label: 'Disputadas', value: disputedCount, color: 'text-amber-600' },
    { label: 'Categorias', value: categoriesCount, color: 'text-blue-600' },
    { label: 'Tipos de fonte', value: sourceTypesCount, color: 'text-violet-600' },
  ]

  return (
    <div className="grid grid-cols-2 sm:grid-cols-5 gap-4">
      {stats.map((stat) => (
        <div key={stat.label} className="text-center">
          <p className={`text-2xl font-bold tabular-nums ${stat.color}`}>
            {stat.value.toLocaleString('pt-BR')}
          </p>
          <p className="text-xs text-zinc-500 mt-0.5">{stat.label}</p>
        </div>
      ))}
      {totalStatements > 0 && (
        <div className="col-span-2 sm:col-span-5 mt-2">
          <div className="flex items-center gap-2 text-xs text-zinc-500">
            <div className="flex-1 h-2 bg-zinc-100 rounded-full overflow-hidden">
              <div
                className="h-full bg-green-500 rounded-full transition-all duration-500"
                style={{ width: `${verifiedPercent}%` }}
              />
            </div>
            <span className="font-medium">{verifiedPercent}% verificadas</span>
          </div>
        </div>
      )}
    </div>
  )
}
