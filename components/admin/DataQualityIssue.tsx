import Link from 'next/link'
import { AlertTriangle, AlertCircle, Info } from 'lucide-react'
import type { QualityIssue, QualityIssueSeverity } from '@/lib/utils/data-quality'

interface DataQualityIssueProps {
  issue: QualityIssue
}

const SEVERITY_CONFIG: Record<QualityIssueSeverity, { icon: typeof AlertTriangle; color: string; bg: string }> = {
  high: { icon: AlertTriangle, color: 'text-red-500', bg: 'bg-red-50' },
  medium: { icon: AlertCircle, color: 'text-yellow-500', bg: 'bg-yellow-50' },
  low: { icon: Info, color: 'text-blue-500', bg: 'bg-blue-50' },
}

export function DataQualityIssueRow({ issue }: DataQualityIssueProps) {
  const config = SEVERITY_CONFIG[issue.severity]
  const Icon = config.icon

  return (
    <div className="flex items-start gap-3 px-4 py-3 hover:bg-gray-50 transition-colors">
      <div className={`p-1.5 rounded-lg ${config.bg} shrink-0 mt-0.5`}>
        <Icon className={`w-3.5 h-3.5 ${config.color}`} />
      </div>
      <div className="min-w-0 flex-1">
        <div className="flex items-start justify-between gap-2">
          <div>
            <Link
              href={`/admin/editar/${issue.statementId}`}
              className="text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors line-clamp-1"
            >
              {issue.summary}
            </Link>
            <p className="text-xs text-gray-500 mt-0.5">{issue.politicianName}</p>
          </div>
          <span className={`text-[10px] font-medium px-2 py-0.5 rounded-full shrink-0 ${
            issue.severity === 'high' ? 'bg-red-100 text-red-700' :
            issue.severity === 'medium' ? 'bg-yellow-100 text-yellow-700' :
            'bg-blue-100 text-blue-700'
          }`}>
            {issue.severity === 'high' ? 'Alta' : issue.severity === 'medium' ? 'Media' : 'Baixa'}
          </span>
        </div>
        <p className="text-xs text-gray-500 mt-1">{issue.description}</p>
      </div>
      <Link
        href={`/admin/editar/${issue.statementId}`}
        className="text-xs text-blue-600 hover:text-blue-800 shrink-0 self-center"
      >
        Corrigir
      </Link>
    </div>
  )
}
