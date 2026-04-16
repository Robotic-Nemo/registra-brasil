export interface SiteSettings {
  siteName: string
  siteDescription: string
  siteUrl: string
  statementsPerPage: number
  requireReview: boolean
  alertEmail: string
  notifyNewSuggestions: boolean
  maintenanceMode: boolean
  enableApi: boolean
  cacheEnabled: boolean
  cacheTtlSeconds: number
}

export interface SettingsSection {
  id: string
  title: string
  description: string
  icon: string
  collapsed?: boolean
}

export interface WebhookEndpoint {
  id: string
  url: string
  events: string[]
  isActive: boolean
  secret: string
  lastDelivery: string | null
  failureCount: number
  createdAt: string
}

export interface APIKey {
  id: string
  label: string
  prefix: string
  permissions: string[]
  isActive: boolean
  lastUsedAt: string | null
  createdAt: string
  expiresAt: string | null
}

export interface CacheStats {
  enabled: boolean
  hitRate: number
  totalEntries: number
  memoryUsageMb: number
  lastCleared: string | null
}

export const DEFAULT_SETTINGS: SiteSettings = {
  siteName: 'Registra Brasil',
  siteDescription: 'Arquivo publico de declaracoes de politicos brasileiros com ligacao obrigatoria a fontes primarias.',
  siteUrl: 'https://registrabrasil.com.br',
  statementsPerPage: 20,
  requireReview: true,
  alertEmail: '',
  notifyNewSuggestions: true,
  maintenanceMode: false,
  enableApi: true,
  cacheEnabled: true,
  cacheTtlSeconds: 300,
}
