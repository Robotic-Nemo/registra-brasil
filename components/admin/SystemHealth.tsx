import { Activity, Database, Server, Zap } from 'lucide-react'

interface SystemHealthProps {
  dbConnected: boolean
  statementCount: number
  cacheEnabled: boolean
  lastUpdated: string | null
}

export function SystemHealth({ dbConnected, statementCount, cacheEnabled, lastUpdated }: SystemHealthProps) {
  const indicators = [
    {
      label: 'Banco de dados',
      status: dbConnected ? 'ok' : 'error',
      detail: dbConnected ? 'Conectado' : 'Desconectado',
      icon: <Database className="w-4 h-4" />,
    },
    {
      label: 'Registros',
      status: statementCount > 0 ? 'ok' : 'warning',
      detail: `${statementCount.toLocaleString('pt-BR')} declaracoes`,
      icon: <Server className="w-4 h-4" />,
    },
    {
      label: 'Cache',
      status: cacheEnabled ? 'ok' : 'warning',
      detail: cacheEnabled ? 'Ativo' : 'Desabilitado',
      icon: <Zap className="w-4 h-4" />,
    },
    {
      label: 'Ultima atualizacao',
      status: lastUpdated ? 'ok' : 'warning',
      detail: lastUpdated ? new Date(lastUpdated).toLocaleString('pt-BR') : 'N/A',
      icon: <Activity className="w-4 h-4" />,
    },
  ]

  const statusColor: Record<string, string> = {
    ok: 'text-green-500',
    warning: 'text-yellow-500',
    error: 'text-red-500',
  }

  const dotColor: Record<string, string> = {
    ok: 'bg-green-500',
    warning: 'bg-yellow-500',
    error: 'bg-red-500',
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Saude do sistema</h3>
      <div className="grid grid-cols-2 gap-3">
        {indicators.map((ind) => (
          <div key={ind.label} className="flex items-start gap-2.5 p-2.5 rounded-lg bg-gray-50">
            <span className={statusColor[ind.status]}>{ind.icon}</span>
            <div className="min-w-0">
              <div className="flex items-center gap-1.5">
                <span className={`w-1.5 h-1.5 rounded-full ${dotColor[ind.status]}`} />
                <p className="text-xs font-medium text-gray-700">{ind.label}</p>
              </div>
              <p className="text-xs text-gray-500 mt-0.5">{ind.detail}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
