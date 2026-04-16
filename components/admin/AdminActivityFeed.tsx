import { Clock, CheckCircle, Edit3, Plus, AlertTriangle } from 'lucide-react'

export interface ActivityItem {
  id: string
  type: 'created' | 'verified' | 'edited' | 'disputed'
  description: string
  timestamp: string
  user?: string
}

interface AdminActivityFeedProps {
  activities: ActivityItem[]
}

const TYPE_CONFIG = {
  created: { icon: Plus, color: 'text-blue-500', bg: 'bg-blue-50' },
  verified: { icon: CheckCircle, color: 'text-green-500', bg: 'bg-green-50' },
  edited: { icon: Edit3, color: 'text-amber-500', bg: 'bg-amber-50' },
  disputed: { icon: AlertTriangle, color: 'text-red-500', bg: 'bg-red-50' },
}

function formatTimeAgo(dateStr: string): string {
  const now = Date.now()
  const date = new Date(dateStr).getTime()
  const diff = now - date
  const minutes = Math.floor(diff / 60_000)
  if (minutes < 1) return 'agora mesmo'
  if (minutes < 60) return `${minutes}min atras`
  const hours = Math.floor(minutes / 60)
  if (hours < 24) return `${hours}h atras`
  const days = Math.floor(hours / 24)
  return `${days}d atras`
}

export function AdminActivityFeed({ activities }: AdminActivityFeedProps) {
  if (activities.length === 0) {
    return (
      <div className="text-center py-8 text-gray-400">
        <Clock className="w-8 h-8 mx-auto mb-2" />
        <p className="text-sm">Nenhuma atividade recente.</p>
      </div>
    )
  }

  return (
    <div className="space-y-0">
      {activities.map((activity, index) => {
        const config = TYPE_CONFIG[activity.type]
        const Icon = config.icon
        const isLast = index === activities.length - 1

        return (
          <div key={activity.id} className="flex gap-3">
            {/* Timeline line + dot */}
            <div className="flex flex-col items-center">
              <div className={`w-8 h-8 rounded-full ${config.bg} flex items-center justify-center flex-shrink-0`}>
                <Icon className={`w-4 h-4 ${config.color}`} />
              </div>
              {!isLast && (
                <div className="w-px flex-1 bg-gray-200 my-1" />
              )}
            </div>

            {/* Content */}
            <div className={`pb-4 ${isLast ? '' : ''}`}>
              <p className="text-sm text-gray-700">{activity.description}</p>
              <div className="flex items-center gap-2 mt-0.5">
                <span className="text-xs text-gray-400">
                  {formatTimeAgo(activity.timestamp)}
                </span>
                {activity.user && (
                  <span className="text-xs text-gray-400">
                    por {activity.user}
                  </span>
                )}
              </div>
            </div>
          </div>
        )
      })}
    </div>
  )
}
