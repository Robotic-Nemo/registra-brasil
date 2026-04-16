'use client'

import { Webhook, Key, Database } from 'lucide-react'
import { SettingsSection } from '@/components/admin/SettingsSection'
import { WebhookManager } from '@/components/admin/WebhookManager'
import { APIKeyManager } from '@/components/admin/APIKeyManager'
import { CacheManager } from '@/components/admin/CacheManager'
import type { WebhookEndpoint, APIKey, CacheStats } from '@/types/settings'

// Demo data for client-side managed sections
const DEMO_WEBHOOKS: WebhookEndpoint[] = []
const DEMO_API_KEYS: APIKey[] = []
const DEMO_CACHE_STATS: CacheStats = {
  enabled: true,
  hitRate: 78,
  totalEntries: 142,
  memoryUsageMb: 3.2,
  lastCleared: null,
}

export function ConfiguracoesClient() {
  return (
    <div className="space-y-4">
      <SettingsSection
        title="Webhooks"
        description="Endpoints para notificacoes em tempo real"
        icon={<Webhook className="w-5 h-5" />}
        defaultOpen={false}
      >
        <WebhookManager webhooks={DEMO_WEBHOOKS} />
      </SettingsSection>

      <SettingsSection
        title="Chaves de API"
        description="Gerenciamento de acesso programatico"
        icon={<Key className="w-5 h-5" />}
        defaultOpen={false}
      >
        <APIKeyManager apiKeys={DEMO_API_KEYS} />
      </SettingsSection>

      <SettingsSection
        title="Cache"
        description="Performance e armazenamento temporario"
        icon={<Database className="w-5 h-5" />}
        defaultOpen={false}
      >
        <CacheManager stats={DEMO_CACHE_STATS} />
      </SettingsSection>
    </div>
  )
}
