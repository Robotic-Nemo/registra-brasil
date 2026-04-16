import type { ReactNode } from 'react'
import { Download } from 'lucide-react'

interface ChartContainerProps {
  title: string
  subtitle?: string
  children: ReactNode
  onExport?: () => void
}

export function ChartContainer({ title, subtitle, children, onExport }: ChartContainerProps) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-start justify-between mb-4">
        <div>
          <h3 className="text-sm font-semibold text-gray-700">{title}</h3>
          {subtitle && <p className="text-xs text-gray-500 mt-0.5">{subtitle}</p>}
        </div>
        {onExport && (
          <button
            onClick={onExport}
            className="inline-flex items-center gap-1.5 px-2.5 py-1 text-xs font-medium text-gray-600 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors"
          >
            <Download className="w-3 h-3" />
            Exportar
          </button>
        )}
      </div>
      {children}
    </div>
  )
}
