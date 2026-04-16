/**
 * OpenAPI-style type definitions for the Registra Brasil public API (v1).
 * These types document the shape of API responses for consumers.
 */

// --- Common ---

export interface ApiPagination {
  page: number
  perPage: number
  total: number
  totalPages: number
  hasNext: boolean
  hasPrev: boolean
}

export interface ApiError {
  error: string
  code?: string
  details?: string
}

// --- Politicians ---

export interface ApiPoliticianSummary {
  slug: string
  common_name: string
  full_name: string
  party: string
  state: string | null
  role: string | null
  photo_url: string | null
  is_active: boolean
}

export interface ApiPoliticianDetail extends ApiPoliticianSummary {
  id: string
  party_history: { party: string; from: string; to?: string }[]
  role_history: { role: string; from: string; to?: string }[]
  tse_id: string | null
  camara_id: number | null
  senado_id: number | null
  wikipedia_url: string | null
  statement_count: number
  created_at: string
  updated_at: string
}

export interface ApiPoliticiansResponse {
  data: ApiPoliticianSummary[]
  pagination: ApiPagination
}

export interface ApiPoliticianResponse {
  data: ApiPoliticianDetail
}

// --- Statements ---

export interface ApiStatementSummary {
  id: string
  slug: string
  summary: string
  full_quote: string | null
  context: string | null
  verification_status: string
  statement_date: string
  primary_source_url: string
  primary_source_type: string
  venue: string | null
  event_name: string | null
  created_at: string
  politicians: {
    slug: string
    common_name: string
    party: string
    state: string | null
  } | null
  statement_categories: {
    is_primary: boolean
    categories: {
      slug: string
      label_pt: string
      color_hex: string
    } | null
  }[]
}

export interface ApiStatementDetail extends ApiStatementSummary {
  statement_date_approx: boolean
  is_featured: boolean
  youtube_video_id: string | null
  updated_at: string
}

export interface ApiStatementsResponse {
  data: ApiStatementSummary[]
  pagination: ApiPagination
}

export interface ApiStatementResponse {
  data: ApiStatementDetail
}

// --- Categories ---

export interface ApiCategory {
  id: string
  slug: string
  label_pt: string
  label_en: string | null
  description: string | null
  color_hex: string
  icon: string | null
  severity: number
  sort_order: number
  statement_count: number
}

export interface ApiCategoriesResponse {
  data: ApiCategory[]
  total: number
}

// --- Search ---

export interface ApiSearchResult {
  query: string
  type: 'all' | 'statements' | 'politicians'
  data: {
    statements?: ApiStatementSummary[]
    politicians?: ApiPoliticianSummary[]
  }
}

// --- Health / Ping ---

export interface ApiPingResponse {
  status: 'ok'
  timestamp: string
}

// --- Rate Limit Headers ---

export interface ApiRateLimitHeaders {
  'X-RateLimit-Remaining': string
  'X-API-Version': string
  'Cache-Control'?: string
  'Retry-After'?: string
}
