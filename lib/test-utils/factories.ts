import type { Politician, Statement, Category, VerificationStatus, SourceType } from '@/types/database'

let idCounter = 0
function nextId(): string {
  idCounter++
  return `test-${idCounter.toString().padStart(6, '0')}`
}

/** Reset the ID counter (call in beforeEach if needed) */
export function resetFactoryIds(): void {
  idCounter = 0
}

/** Create a mock Politician with sensible defaults. Override any field via `overrides`. */
export function createMockPolitician(overrides: Partial<Politician> = {}): Politician {
  const id = overrides.id ?? nextId()
  return {
    id,
    slug: `politico-${id}`,
    full_name: 'Maria da Silva Santos',
    common_name: 'Maria Silva',
    party: 'PT',
    party_history: [{ party: 'PT', from: '2010-01-01' }],
    state: 'SP',
    role: 'Deputada Federal',
    role_history: [{ role: 'Deputada Federal', from: '2019-02-01' }],
    photo_url: null,
    tse_id: null,
    camara_id: null,
    senado_id: null,
    wikipedia_url: null,
    is_active: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
    ...overrides,
  }
}

/** Create a mock Statement with sensible defaults. Override any field via `overrides`. */
export function createMockStatement(overrides: Partial<Statement> = {}): Statement {
  const id = overrides.id ?? nextId()
  return {
    id,
    politician_id: overrides.politician_id ?? nextId(),
    summary: 'Declaracao de teste sobre politica publica',
    full_quote: 'Precisamos investir mais em educacao e saude para o povo brasileiro.',
    context: 'Discurso na Camara dos Deputados durante sessao ordinaria.',
    verification_status: 'verified' as VerificationStatus,
    is_featured: false,
    statement_date: '2024-06-15',
    statement_date_approx: false,
    primary_source_url: 'https://www.camara.leg.br/evento/12345',
    primary_source_type: 'camara_tv' as SourceType,
    youtube_video_id: null,
    youtube_timestamp_sec: null,
    youtube_channel_id: null,
    transcript_excerpt: null,
    secondary_sources: [],
    venue: 'Plenario da Camara dos Deputados',
    event_name: 'Sessao Ordinaria',
    editor_notes: null,
    submitted_by: null,
    reviewed_by: null,
    reviewed_at: null,
    slug: `declaracao-${id}`,
    created_at: '2024-06-15T12:00:00Z',
    updated_at: '2024-06-15T12:00:00Z',
    ...overrides,
  }
}

/** Create a mock Category with sensible defaults. Override any field via `overrides`. */
export function createMockCategory(overrides: Partial<Category> = {}): Category {
  const id = overrides.id ?? nextId()
  return {
    id,
    slug: `categoria-${id}`,
    label_pt: 'Economia',
    label_en: 'Economy',
    description: 'Declaracoes relacionadas a politica economica e financas publicas.',
    color_hex: '#3B82F6',
    icon: 'trending-up',
    severity: 2 as const,
    parent_id: null,
    sort_order: 1,
    created_at: '2024-01-01T00:00:00Z',
    ...overrides,
  }
}

/** Create a list of N mock politicians */
export function createMockPoliticians(count: number, overrides: Partial<Politician> = {}): Politician[] {
  return Array.from({ length: count }, (_, i) =>
    createMockPolitician({ common_name: `Politico ${i + 1}`, ...overrides })
  )
}

/** Create a list of N mock statements */
export function createMockStatements(count: number, overrides: Partial<Statement> = {}): Statement[] {
  return Array.from({ length: count }, (_, i) =>
    createMockStatement({ summary: `Declaracao de teste ${i + 1}`, ...overrides })
  )
}
