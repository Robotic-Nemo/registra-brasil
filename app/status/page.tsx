import type { Metadata } from 'next'
import { StatusIndicator } from '@/components/status/StatusIndicator'
import { UptimeChart } from '@/components/status/UptimeChart'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Status do Sistema — Registra Brasil',
  description: 'Pagina de status dos servicos do Registra Brasil.',
  alternates: { canonical: '/status' },
}

const services = [
  { name: 'Website', status: 'operational' as const },
  { name: 'API Publica', status: 'operational' as const },
  { name: 'Banco de Dados', status: 'operational' as const },
  { name: 'Busca', status: 'operational' as const },
  { name: 'Autenticacao', status: 'operational' as const },
]

export default function StatusPage() {
  return (
    <main id="main-content" className="container mx-auto max-w-3xl px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">Status do Sistema</h1>
      <p className="text-gray-500 dark:text-gray-400 mb-8">
        Status atual dos servicos do Registra Brasil.
      </p>

      <div className="bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 rounded-xl p-4 mb-8">
        <div className="flex items-center gap-3">
          <StatusIndicator status="operational" />
          <span className="font-medium text-green-800 dark:text-green-400">
            Todos os sistemas operacionais
          </span>
        </div>
      </div>

      <section className="space-y-3 mb-8">
        <h2 className="text-lg font-semibold text-gray-900 dark:text-white">Servicos</h2>
        <div className="divide-y divide-gray-100 dark:divide-gray-800 border border-gray-200 dark:border-gray-700 rounded-xl overflow-hidden">
          {services.map((service) => (
            <div key={service.name} className="flex items-center justify-between px-4 py-3 bg-white dark:bg-gray-800">
              <span className="text-sm font-medium text-gray-700 dark:text-gray-300">{service.name}</span>
              <StatusIndicator status={service.status} showLabel />
            </div>
          ))}
        </div>
      </section>

      <section>
        <h2 className="text-lg font-semibold text-gray-900 dark:text-white mb-4">Disponibilidade (30 dias)</h2>
        <UptimeChart />
      </section>
    </main>
  )
}
