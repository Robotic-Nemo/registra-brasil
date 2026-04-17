// Pure render — server component, ships no JS.
import type { StatementWithRelations } from '@/types/database'
import { formatDatePtBR } from '@/lib/utils/date'

interface StatementComparisonProps {
  statements: StatementWithRelations[]
  highlightDifferences?: boolean
}

export function StatementComparison({ statements, highlightDifferences = true }: StatementComparisonProps) {
  if (statements.length < 2) {
    return (
      <p className="text-sm text-zinc-500">
        Selecione pelo menos duas declarações para comparar.
      </p>
    )
  }

  const fields: { key: keyof StatementWithRelations; label: string }[] = [
    { key: 'summary', label: 'Resumo' },
    { key: 'full_quote', label: 'Citação completa' },
    { key: 'context', label: 'Contexto' },
    { key: 'venue', label: 'Local' },
    { key: 'statement_date', label: 'Data' },
    { key: 'primary_source_type', label: 'Tipo de fonte' },
    { key: 'verification_status', label: 'Status' },
  ]

  return (
    <div className="overflow-x-auto">
      <table className="w-full text-sm border-collapse">
        <thead>
          <tr>
            <th className="text-left p-3 bg-zinc-50 border-b font-medium text-zinc-600 sticky left-0">
              Campo
            </th>
            {statements.map((s) => (
              <th
                key={s.id}
                className="text-left p-3 bg-zinc-50 border-b font-medium text-zinc-800 min-w-[250px]"
              >
                {s.politicians?.common_name ?? 'Desconhecido'}
                <span className="block text-xs font-normal text-zinc-500">
                  {formatDatePtBR(s.statement_date)}
                </span>
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {fields.map(({ key, label }) => {
            const values = statements.map(s => String(s[key] ?? '—'))
            const allSame = values.every(v => v === values[0])

            return (
              <tr key={key} className={highlightDifferences && !allSame ? 'bg-yellow-50' : ''}>
                <td className="p-3 border-b font-medium text-zinc-600 sticky left-0 bg-white">
                  {label}
                </td>
                {statements.map((s, i) => (
                  <td
                    key={s.id}
                    className={`p-3 border-b text-zinc-800 ${
                      highlightDifferences && !allSame && values[i] !== values[0]
                        ? 'font-semibold'
                        : ''
                    }`}
                  >
                    {key === 'statement_date'
                      ? formatDatePtBR(s.statement_date)
                      : String(s[key] ?? '—')}
                  </td>
                ))}
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}
