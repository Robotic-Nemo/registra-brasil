import type { DashboardMetrics as Metrics } from '@/lib/supabase/queries/dashboard'
import { FileText, CheckCircle, Clock, AlertTriangle, Users, Tag, TrendingUp, TrendingDown } from 'lucide-react'

interface DashboardMetricsProps {
  metrics: Metrics
}

function TrendArrow({ current, previous, label }: { current: number; previous: number; label: string }) {
  if (previous === 0 && current === 0) return <span className="text-xs text-gray-400">{label}</span>
  const pctChange = previous === 0 ? 100 : Math.round(((current - previous) / previous) * 100)
  const isUp = pctChange >= 0

  return (
    <span className={`inline-flex items-center gap-0.5 text-xs ${isUp ? 'text-green-600' : 'text-red-500'}`}>
      {isUp ? <TrendingUp className="w-3 h-3" /> : <TrendingDown className="w-3 h-3" />}
      {isUp ? '+' : ''}{pctChange}% {label}
    </span>
  )
}

export function DashboardMetrics({ metrics }: DashboardMetricsProps) {
  const cards = [
    {
      label: 'Total de declaracoes',
      value: metrics.totalStatements,
      icon: <FileText className="w-4 h-4" />,
      color: 'text-blue-600 bg-blue-50',
    },
    {
      label: 'Verificadas',
      value: metrics.totalVerified,
      icon: <CheckCircle className="w-4 h-4" />,
      color: 'text-green-600 bg-green-50',
      trend: <TrendArrow current={metrics.verificationsThisWeek} previous={metrics.verificationsLastWeek} label="vs semana passada" />,
    },
    {
      label: 'Pendentes',
      value: metrics.totalUnverified,
      icon: <Clock className="w-4 h-4" />,
      color: 'text-yellow-600 bg-yellow-50',
    },
    {
      label: 'Disputadas',
      value: metrics.totalDisputed,
      icon: <AlertTriangle className="w-4 h-4" />,
      color: 'text-orange-600 bg-orange-50',
    },
    {
      label: 'Politicos ativos',
      value: metrics.totalPoliticians,
      icon: <Users className="w-4 h-4" />,
      color: 'text-indigo-600 bg-indigo-50',
    },
    {
      label: 'Esta semana',
      value: metrics.statementsThisWeek,
      icon: <Tag className="w-4 h-4" />,
      color: 'text-purple-600 bg-purple-50',
      trend: <TrendArrow current={metrics.statementsThisWeek} previous={metrics.statementsLastWeek} label="vs semana passada" />,
    },
  ]

  return (
    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
      {cards.map((card) => {
        const [textColor, bgColor] = card.color.split(' ')
        return (
          <div key={card.label} className="bg-white border border-gray-200 rounded-xl p-4">
            <div className="flex items-start justify-between mb-2">
              <p className="text-xs text-gray-500 font-medium">{card.label}</p>
              <div className={`p-1.5 rounded-lg ${bgColor}`}>
                <span className={textColor}>{card.icon}</span>
              </div>
            </div>
            <p className={`text-2xl font-bold tabular-nums ${textColor}`}>
              {card.value.toLocaleString('pt-BR')}
            </p>
            {card.trend && <div className="mt-1">{card.trend}</div>}
          </div>
        )
      })}
    </div>
  )
}
