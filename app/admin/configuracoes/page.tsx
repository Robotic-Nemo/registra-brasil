import Link from 'next/link'
import { ArrowLeft, Settings } from 'lucide-react'
import { loadSettings } from '@/lib/utils/settings'
import { SettingsForm } from '@/components/admin/SettingsForm'
import { ConfiguracoesClient } from './ConfiguracoesClient'

export const dynamic = 'force-dynamic'

export default function ConfiguracoesPage() {
  const settings = loadSettings()

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <Settings className="w-5 h-5 text-gray-600" />
            Configuracoes
          </h1>
          <p className="text-sm text-gray-500">
            Configuracoes gerenciadas via variaveis de ambiente
          </p>
        </div>
      </div>

      {/* Main settings */}
      <section className="mb-8">
        <SettingsForm settings={settings} />
      </section>

      {/* Client-side sections (webhooks, API keys, cache) */}
      <ConfiguracoesClient />

      {/* Notice */}
      <div className="mt-6 p-4 bg-amber-50 border border-amber-200 rounded-lg">
        <p className="text-sm text-amber-800">
          As configuracoes principais sao gerenciadas via variaveis de ambiente.
          Webhooks e chaves de API sao demonstrativos e serao persistidos via banco de dados futuramente.
        </p>
      </div>
    </main>
  )
}
