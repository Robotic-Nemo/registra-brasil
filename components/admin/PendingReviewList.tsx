import Link from 'next/link'
import { Clock, ChevronRight } from 'lucide-react'
import type { PendingReviewItem } from '@/lib/supabase/queries/dashboard'

interface PendingReviewListProps {
  items: PendingReviewItem[]
}

export function PendingReviewList({ items }: PendingReviewListProps) {
  if (items.length === 0) {
    return (
      <div className="bg-white border border-gray-200 rounded-xl p-6 text-center">
        <p className="text-sm text-gray-500">Nenhuma declaracao pendente de revisao.</p>
      </div>
    )
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
      <div className="px-4 py-3 border-b border-gray-100 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Clock className="w-4 h-4 text-yellow-600" />
          <h3 className="text-sm font-semibold text-gray-700">Pendentes de revisao</h3>
        </div>
        <span className="text-xs bg-yellow-100 text-yellow-800 px-2 py-0.5 rounded-full font-medium">
          {items.length}
        </span>
      </div>
      <ul className="divide-y divide-gray-50">
        {items.map((item) => (
          <li key={item.id}>
            <Link
              href={`/admin/editar/${item.id}`}
              className="flex items-center gap-3 px-4 py-3 hover:bg-gray-50 transition-colors group"
            >
              <div className="min-w-0 flex-1">
                <p className="text-sm font-medium text-gray-900 truncate group-hover:text-blue-700">
                  {item.summary}
                </p>
                <p className="text-xs text-gray-500 mt-0.5">
                  {item.politician_name} &middot;{' '}
                  {new Date(item.statement_date).toLocaleDateString('pt-BR')}
                </p>
              </div>
              <span className="text-xs text-gray-400">
                {timeAgo(item.created_at)}
              </span>
              <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-gray-500 shrink-0" />
            </Link>
          </li>
        ))}
      </ul>
    </div>
  )
}

function timeAgo(dateStr: string): string {
  const now = Date.now()
  const then = new Date(dateStr).getTime()
  const diffMs = now - then
  const diffMin = Math.floor(diffMs / 60000)
  if (diffMin < 60) return `${diffMin}min`
  const diffH = Math.floor(diffMin / 60)
  if (diffH < 24) return `${diffH}h`
  const diffD = Math.floor(diffH / 24)
  return `${diffD}d`
}
