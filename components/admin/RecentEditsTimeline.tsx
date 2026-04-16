import Link from 'next/link'
import { CheckCircle, AlertTriangle, XCircle } from 'lucide-react'
import type { RecentEditItem } from '@/lib/supabase/queries/dashboard'

interface RecentEditsTimelineProps {
  items: RecentEditItem[]
}

const STATUS_CONFIG: Record<string, { icon: typeof CheckCircle; color: string; label: string }> = {
  verified: { icon: CheckCircle, color: 'text-green-500', label: 'Verificada' },
  disputed: { icon: AlertTriangle, color: 'text-orange-500', label: 'Disputada' },
  removed: { icon: XCircle, color: 'text-red-500', label: 'Removida' },
  unverified: { icon: AlertTriangle, color: 'text-yellow-500', label: 'Nao verificada' },
}

export function RecentEditsTimeline({ items }: RecentEditsTimelineProps) {
  if (items.length === 0) {
    return (
      <div className="bg-white border border-gray-200 rounded-xl p-6 text-center">
        <p className="text-sm text-gray-500">Nenhuma edicao recente.</p>
      </div>
    )
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Atividade editorial recente</h3>
      <div className="relative">
        {/* Timeline line */}
        <div className="absolute left-[11px] top-2 bottom-2 w-px bg-gray-200" />

        <ul className="space-y-4">
          {items.map((item) => {
            const config = STATUS_CONFIG[item.verification_status] ?? STATUS_CONFIG.unverified
            const Icon = config.icon
            return (
              <li key={item.id} className="relative pl-8">
                <div className={`absolute left-0 top-0.5 ${config.color}`}>
                  <Icon className="w-[22px] h-[22px] bg-white rounded-full" />
                </div>
                <div>
                  <Link
                    href={`/admin/editar/${item.id}`}
                    className="text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors line-clamp-1"
                  >
                    {item.summary}
                  </Link>
                  <p className="text-xs text-gray-500 mt-0.5">
                    {item.politician_name} &middot;{' '}
                    <span className={config.color}>{config.label}</span> &middot;{' '}
                    {new Date(item.reviewed_at).toLocaleString('pt-BR')}
                  </p>
                </div>
              </li>
            )
          })}
        </ul>
      </div>
    </div>
  )
}
