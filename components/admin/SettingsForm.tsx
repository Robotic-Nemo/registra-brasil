import type { SiteSettings } from '@/types/settings'
import { getEnvVarName } from '@/lib/utils/settings'
import { Globe, FileText, Bell, Shield, Zap } from 'lucide-react'
import { SettingsSection } from './SettingsSection'

interface SettingsFormProps {
  settings: SiteSettings
}

export function SettingsForm({ settings }: SettingsFormProps) {
  return (
    <div className="space-y-4">
      <SettingsSection
        title="Geral"
        description="Configuracoes basicas do site"
        icon={<Globe className="w-5 h-5" />}
      >
        <div className="space-y-4">
          <SettingField label="Nome do site" envVar={getEnvVarName('siteName')} value={settings.siteName} />
          <SettingField label="Descricao" envVar={getEnvVarName('siteDescription')} value={settings.siteDescription} textarea />
          <SettingField label="URL base" envVar={getEnvVarName('siteUrl')} value={settings.siteUrl} />
        </div>
      </SettingsSection>

      <SettingsSection
        title="Conteudo"
        description="Exibicao e moderacao"
        icon={<FileText className="w-5 h-5" />}
      >
        <div className="space-y-4">
          <SettingField label="Declaracoes por pagina" envVar={getEnvVarName('statementsPerPage')} value={String(settings.statementsPerPage)} />
          <SettingToggle label="Exigir revisao antes de publicar" envVar={getEnvVarName('requireReview')} value={settings.requireReview} />
          <SettingToggle label="Modo de manutencao" envVar={getEnvVarName('maintenanceMode')} value={settings.maintenanceMode} />
        </div>
      </SettingsSection>

      <SettingsSection
        title="Notificacoes"
        description="Alertas e comunicacao"
        icon={<Bell className="w-5 h-5" />}
      >
        <div className="space-y-4">
          <SettingField label="Email para alertas" envVar={getEnvVarName('alertEmail')} value={settings.alertEmail} placeholder="admin@example.com" />
          <SettingToggle label="Notificar novas sugestoes" envVar={getEnvVarName('notifyNewSuggestions')} value={settings.notifyNewSuggestions} />
        </div>
      </SettingsSection>

      <SettingsSection
        title="API"
        description="Acesso programatico"
        icon={<Shield className="w-5 h-5" />}
      >
        <div className="space-y-4">
          <SettingToggle label="Habilitar API" envVar={getEnvVarName('enableApi')} value={settings.enableApi} />
        </div>
      </SettingsSection>

      <SettingsSection
        title="Cache"
        description="Performance e armazenamento"
        icon={<Zap className="w-5 h-5" />}
        defaultOpen={false}
      >
        <div className="space-y-4">
          <SettingToggle label="Cache habilitado" envVar={getEnvVarName('cacheEnabled')} value={settings.cacheEnabled} />
          <SettingField label="TTL do cache (segundos)" envVar={getEnvVarName('cacheTtlSeconds')} value={String(settings.cacheTtlSeconds)} />
        </div>
      </SettingsSection>
    </div>
  )
}

function SettingField({
  label,
  envVar,
  value,
  placeholder,
  textarea,
}: {
  label: string
  envVar: string
  value: string
  placeholder?: string
  textarea?: boolean
}) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
      {textarea ? (
        <textarea
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 bg-gray-50"
          rows={3}
          defaultValue={value}
          placeholder={placeholder}
          readOnly
        />
      ) : (
        <input
          type="text"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 bg-gray-50"
          defaultValue={value}
          placeholder={placeholder}
          readOnly
        />
      )}
      <p className="text-[10px] text-gray-400 mt-1">
        Variavel de ambiente: <code className="font-mono bg-gray-100 px-1 rounded">{envVar}</code>
      </p>
    </div>
  )
}

function SettingToggle({
  label,
  envVar,
  value,
}: {
  label: string
  envVar: string
  value: boolean
}) {
  return (
    <div className="flex items-center justify-between">
      <div>
        <p className="text-sm font-medium text-gray-700">{label}</p>
        <p className="text-[10px] text-gray-400">
          Variavel: <code className="font-mono bg-gray-100 px-1 rounded">{envVar}</code>
        </p>
      </div>
      <div className={`w-10 h-5 rounded-full relative ${value ? 'bg-blue-500' : 'bg-gray-300'}`}>
        <div className={`w-4 h-4 rounded-full bg-white absolute top-0.5 transition-all ${value ? 'left-5' : 'left-0.5'}`} />
      </div>
    </div>
  )
}
