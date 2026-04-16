interface Props {
  totalResults: number
  activeFilters: number
}

export function QuickStats({ totalResults, activeFilters }: Props) {
  return (
    <div className="flex items-center justify-between bg-gray-50 border border-gray-200 rounded-lg px-4 py-2">
      <div className="text-sm text-gray-700">
        <span className="font-semibold text-gray-900 tabular-nums">
          {totalResults.toLocaleString('pt-BR')}
        </span>{' '}
        {totalResults === 1 ? 'declaracao encontrada' : 'declaracoes encontradas'}
      </div>
      {activeFilters > 0 && (
        <div className="text-xs text-gray-500">
          {activeFilters} {activeFilters === 1 ? 'filtro ativo' : 'filtros ativos'}
        </div>
      )}
    </div>
  )
}
