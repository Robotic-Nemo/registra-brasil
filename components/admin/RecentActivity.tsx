import Link from 'next/link'
import { formatDatePtBR } from '@/lib/utils/date'

interface ActivityItem {
  id: string
  type: 'statement_added' | 'statement_verified' | 'statement_disputed' | 'politician_added'
  summary: string
  date: string
  link?: string
}

interface RecentActivityProps {
  items: ActivityItem[]
}

const TYPE_LABELS: Record<ActivityItem['type'], { label: string; color: string }> = {
  statement_added: { label: 'Nova declaração', color: 'bg-blue-100 text-blue-700' },
  statement_verified: { label: 'Verificada', color: 'bg-green-100 text-green-700' },
  statement_disputed: { label: 'Disputada', color: 'bg-amber-100 text-amber-700' },
  politician_added: { label: 'Novo político', color: 'bg-violet-100 text-violet-700' },
}

export function RecentActivity({ items }: RecentActivityProps) {
  if (items.length === 0) {
    return <p className="text-sm text-zinc-500 py-4">Nenhuma atividade recente.</p>
  }

  return (
    <div className="space-y-2">
      {items.map((item) => {
        const typeInfo = TYPE_LABELS[item.type]
        return (
          <div key={item.id} className="flex items-start gap-3 p-2 rounded hover:bg-zinc-50">
            <span className={`px-1.5 py-0.5 rounded text-[10px] font-semibold flex-shrink-0 ${typeInfo.color}`}>
              {typeInfo.label}
            </span>
            <div className="flex-1 min-w-0">
              {item.link ? (
                <Link href={item.link} className="text-sm text-zinc-800 hover:text-blue-600 line-clamp-1">
                  {item.summary}
                </Link>
              ) : (
                <p className="text-sm text-zinc-800 line-clamp-1">{item.summary}</p>
              )}
              <time className="text-xs text-zinc-400" dateTime={item.date}>
                {formatDatePtBR(item.date)}
              </time>
            </div>
          </div>
        )
      })}
    </div>
  )
}
