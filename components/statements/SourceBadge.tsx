import type { SourceType } from '@/types/database'
import { getSourceLabel, isOfficialSourceType, isVideoSourceType } from '@/lib/utils/source-labels'
import { Video, FileText, Globe, Shield } from 'lucide-react'

interface SourceBadgeProps {
  type: SourceType
  className?: string
}

const iconMap: Record<string, React.ComponentType<{ className?: string }>> = {
  video: Video,
  official: Shield,
  document: FileText,
  default: Globe,
}

function getIcon(type: string) {
  if (isVideoSourceType(type)) return iconMap.video
  if (isOfficialSourceType(type)) return iconMap.official
  if (type === 'transcript_pdf' || type === 'diario_oficial') return iconMap.document
  return iconMap.default
}

export function SourceBadge({ type, className = '' }: SourceBadgeProps) {
  const Icon = getIcon(type)
  const label = getSourceLabel(type)
  const isOfficial = isOfficialSourceType(type)

  return (
    <span
      className={`inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-full ${
        isOfficial
          ? 'bg-green-50 text-green-700 border border-green-200'
          : 'bg-gray-100 text-gray-600 border border-gray-200'
      } ${className}`}
      title={label}
    >
      <Icon className="w-3 h-3 flex-shrink-0" />
      <span className="truncate max-w-[120px]">{label}</span>
    </span>
  )
}
