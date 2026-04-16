import type { VerificationStatus } from '@/types/database'

interface Props {
  status: VerificationStatus
  reviewedBy: string | null
  reviewedAt: string | null
  editorNotes: string | null
  sourceCount: number
}

const STATUS_CONFIG: Record<VerificationStatus, { label: string; bg: string; text: string; description: string }> = {
  verified: {
    label: 'Verificada',
    bg: 'bg-green-50 border-green-200',
    text: 'text-green-800',
    description: 'Esta declaracao foi verificada. A fonte primaria foi confirmada e revisada por um editor.',
  },
  unverified: {
    label: 'Nao verificada',
    bg: 'bg-yellow-50 border-yellow-200',
    text: 'text-yellow-800',
    description: 'Esta declaracao ainda nao foi verificada por um editor. A fonte primaria esta aguardando confirmacao.',
  },
  disputed: {
    label: 'Disputada',
    bg: 'bg-orange-50 border-orange-200',
    text: 'text-orange-800',
    description: 'Ha controversia sobre a precisao ou contexto desta declaracao. Veja as notas editoriais para mais detalhes.',
  },
  removed: {
    label: 'Removida',
    bg: 'bg-red-50 border-red-200',
    text: 'text-red-800',
    description: 'Esta declaracao foi removida por imprecisao ou violacao de politicas.',
  },
}

export function FactCheckSummary({ status, reviewedBy, reviewedAt, editorNotes, sourceCount }: Props) {
  const config = STATUS_CONFIG[status]

  return (
    <div className={`border rounded-xl p-5 ${config.bg}`}>
      <div className="flex items-center gap-2 mb-3">
        <span className={`text-sm font-bold ${config.text}`}>{config.label}</span>
      </div>

      <p className={`text-sm ${config.text} mb-4`}>{config.description}</p>

      <div className="grid grid-cols-2 gap-3 text-sm">
        <div>
          <span className="text-gray-500 text-xs">Fontes</span>
          <div className="font-medium text-gray-900">{sourceCount}</div>
        </div>
        {reviewedBy && (
          <div>
            <span className="text-gray-500 text-xs">Revisado por</span>
            <div className="font-medium text-gray-900">{reviewedBy}</div>
          </div>
        )}
        {reviewedAt && (
          <div>
            <span className="text-gray-500 text-xs">Data da revisao</span>
            <div className="font-medium text-gray-900 tabular-nums">{reviewedAt.slice(0, 10)}</div>
          </div>
        )}
      </div>

      {editorNotes && (
        <div className="mt-4 pt-3 border-t border-gray-200">
          <span className="text-xs font-medium text-gray-500">Notas editoriais</span>
          <p className="text-sm text-gray-700 mt-1">{editorNotes}</p>
        </div>
      )}
    </div>
  )
}
