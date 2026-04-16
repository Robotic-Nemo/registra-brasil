import { Check, Minus } from 'lucide-react'
import type { ReactNode } from 'react'

interface ComparisonColumn {
  id: string
  label: string
  sublabel?: string
}

interface ComparisonRow {
  label: string
  values: Record<string, string | number | boolean | null>
}

interface ComparisonTableProps {
  columns: ComparisonColumn[]
  rows: ComparisonRow[]
  highlightColumn?: string
  valueFormatter?: (value: string | number | boolean | null) => ReactNode
  className?: string
}

function defaultFormatter(value: string | number | boolean | null): ReactNode {
  if (value === null || value === undefined) return <Minus className="w-4 h-4 text-gray-300 mx-auto" />
  if (typeof value === 'boolean') {
    return value ? (
      <Check className="w-4 h-4 text-green-600 mx-auto" />
    ) : (
      <Minus className="w-4 h-4 text-gray-300 mx-auto" />
    )
  }
  return <span>{value}</span>
}

export function ComparisonTable({
  columns,
  rows,
  highlightColumn,
  valueFormatter = defaultFormatter,
  className = '',
}: ComparisonTableProps) {
  return (
    <div className={`overflow-x-auto ${className}`}>
      <table className="w-full text-sm" role="table">
        <thead>
          <tr>
            <th className="text-left font-medium text-gray-500 py-2 px-3 border-b border-gray-200" />
            {columns.map((col) => (
              <th
                key={col.id}
                className={`text-center font-semibold py-2 px-3 border-b border-gray-200 ${
                  highlightColumn === col.id ? 'bg-blue-50 text-blue-900' : 'text-gray-900'
                }`}
              >
                <div>{col.label}</div>
                {col.sublabel && (
                  <div className="text-xs font-normal text-gray-500">{col.sublabel}</div>
                )}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row, ri) => (
            <tr key={ri} className="border-b border-gray-100 last:border-b-0">
              <td className="text-left font-medium text-gray-700 py-2 px-3">{row.label}</td>
              {columns.map((col) => (
                <td
                  key={col.id}
                  className={`text-center py-2 px-3 tabular-nums ${
                    highlightColumn === col.id ? 'bg-blue-50/50' : ''
                  }`}
                >
                  {valueFormatter(row.values[col.id] ?? null)}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
