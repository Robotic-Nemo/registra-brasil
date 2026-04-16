import type { Metadata } from 'next'
import Link from 'next/link'
import { ArrowLeft, Settings, Globe, FileText, Bell } from 'lucide-react'

export const metadata: Metadata = {
  title: 'Configuracoes — Admin',
}

const SETTINGS_SECTIONS = [
  {
    id: 'geral',
    icon: Globe,
    title: 'Geral',
    description: 'Nome do site, descricao e URL base.',
    fields: [
      { label: 'Nome do site', value: 'Registra Brasil', type: 'text' as const },
      { label: 'Descricao', value: 'Arquivo publico de declaracoes de politicos brasileiros com ligacao obrigatoria a fontes primarias.', type: 'textarea' as const },
      { label: 'URL base', value: 'https://registrabrasil.com.br', type: 'text' as const },
    ],
  },
  {
    id: 'conteudo',
    icon: FileText,
    title: 'Conteudo',
    description: 'Configuracoes de exibicao e moderacao.',
    fields: [
      { label: 'Declaracoes por pagina', value: '20', type: 'text' as const },
      { label: 'Exigir revisao antes de publicar', value: 'true', type: 'text' as const },
    ],
  },
  {
    id: 'notificacoes',
    icon: Bell,
    title: 'Notificacoes',
    description: 'Alertas e notificacoes do sistema.',
    fields: [
      { label: 'Email para alertas', value: '', type: 'text' as const },
      { label: 'Notificar novas sugestoes', value: 'true', type: 'text' as const },
    ],
  },
]

export default function AdminSettingsPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <div className="flex items-center gap-3 mb-8">
        <Link
          href="/admin"
          className="text-gray-400 hover:text-gray-600 transition-colors"
          aria-label="Voltar ao painel"
        >
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <div>
          <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2">
            <Settings className="w-6 h-6" />
            Configuracoes
          </h1>
          <p className="text-sm text-gray-500 mt-0.5">Gerencie as configuracoes do site.</p>
        </div>
      </div>

      <div className="space-y-8">
        {SETTINGS_SECTIONS.map((section) => {
          const Icon = section.icon
          return (
            <section
              key={section.id}
              className="bg-white border border-gray-200 rounded-xl p-6"
            >
              <div className="flex items-center gap-2 mb-1">
                <Icon className="w-5 h-5 text-gray-400" />
                <h2 className="text-lg font-semibold text-gray-900">{section.title}</h2>
              </div>
              <p className="text-sm text-gray-500 mb-5">{section.description}</p>

              <div className="space-y-4">
                {section.fields.map((field) => (
                  <div key={field.label}>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      {field.label}
                    </label>
                    {field.type === 'textarea' ? (
                      <textarea
                        className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                        rows={3}
                        defaultValue={field.value}
                        readOnly
                      />
                    ) : (
                      <input
                        type="text"
                        className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                        defaultValue={field.value}
                        readOnly
                      />
                    )}
                  </div>
                ))}
              </div>
            </section>
          )
        })}
      </div>

      <div className="mt-8 p-4 bg-amber-50 border border-amber-200 rounded-lg">
        <p className="text-sm text-amber-800">
          As configuracoes sao gerenciadas via variaveis de ambiente. Esta pagina serve como referencia.
        </p>
      </div>
    </main>
  )
}
