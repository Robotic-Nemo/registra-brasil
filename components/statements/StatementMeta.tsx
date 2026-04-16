import { Building2, Calendar } from 'lucide-react'
import { formatDatePtBR } from '@/lib/utils/date'

interface StatementMetaProps {
  date: string
  dateApprox?: boolean
  venue?: string | null
  eventName?: string | null
  className?: string
}

export function StatementMeta({ date, dateApprox, venue, eventName, className = '' }: StatementMetaProps) {
  return (
    <div className={`text-sm text-gray-500 flex flex-wrap items-center gap-3 ${className}`}>
      <time dateTime={date} className="flex items-center gap-1">
        <Calendar className="w-3.5 h-3.5" />
        {formatDatePtBR(date, dateApprox)}
      </time>
      {venue && (
        <span className="flex items-center gap-1">
          <Building2 className="w-3.5 h-3.5" />
          {venue}
          {eventName && ` — ${eventName}`}
        </span>
      )}
    </div>
  )
}
