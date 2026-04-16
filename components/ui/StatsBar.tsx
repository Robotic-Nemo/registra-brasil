import { FileText, Users, Tag } from 'lucide-react'
import { formatNumber } from '@/lib/utils/format'

interface StatsBarProps {
  totalVerified: number
  totalPoliticians: number
  totalCategories: number
}

export function StatsBar({ totalVerified, totalPoliticians, totalCategories }: StatsBarProps) {
  const stats = [
    { icon: FileText, label: 'Declarações verificadas', value: totalVerified },
    { icon: Users, label: 'Políticos monitorados', value: totalPoliticians },
    { icon: Tag, label: 'Categorias', value: totalCategories },
  ]

  return (
    <div className="flex items-center justify-center gap-8 md:gap-12 py-4">
      {stats.map((stat) => (
        <div key={stat.label} className="flex items-center gap-2 text-blue-200">
          <stat.icon className="w-4 h-4 text-blue-400" />
          <div className="text-center">
            <span className="text-white font-bold text-lg tabular-nums">{formatNumber(stat.value)}</span>
            <p className="text-blue-300 text-xs">{stat.label}</p>
          </div>
        </div>
      ))}
    </div>
  )
}
