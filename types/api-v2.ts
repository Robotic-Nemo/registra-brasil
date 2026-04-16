/**
 * API v2 types — cursor-based pagination, multi-value filters, field selection
 */

// --- Cursor Pagination ---

export interface CursorPaginationParams {
  cursor?: string
  limit?: number
}

export interface CursorPaginatedResponse<T> {
  data: T[]
  pagination: {
    nextCursor: string | null
    prevCursor: string | null
    limit: number
    hasMore: boolean
  }
  meta?: Record<string, unknown>
}

// --- Multi-value Filters ---

export interface V2StatementsParams extends CursorPaginationParams {
  q?: string
  from?: string
  to?: string
  party?: string[]
  state?: string[]
  category?: string[]
  status?: string
  sort?: 'date' | 'created' | 'relevance'
  order?: 'asc' | 'desc'
  fields?: string[]
  include?: V2StatementInclude[]
}

export type V2StatementInclude = 'politician' | 'categories'

export interface V2PoliticiansParams extends CursorPaginationParams {
  q?: string
  party?: string[]
  state?: string[]
  role?: string
  active?: boolean
  sort?: 'name' | 'created' | 'statements'
  order?: 'asc' | 'desc'
  fields?: string[]
  include?: V2PoliticianInclude[]
}

export type V2PoliticianInclude = 'statement_count' | 'categories'

export interface V2CategoriesParams {
  q?: string
  severity?: number[]
  parent_id?: string
  include?: V2CategoryInclude[]
}

export type V2CategoryInclude = 'statement_count' | 'children'

// --- Statistics ---

export interface V2StatisticsResponse {
  counts: {
    statements: number
    verified: number
    disputed: number
    politicians: number
    categories: number
  }
  trends: {
    statementsLast30d: number
    statementsLast7d: number
    verificationsLast30d: number
  }
  topParties: { party: string; count: number }[]
  topStates: { state: string; count: number }[]
}

// --- Field Selection ---

export interface FieldSelectionConfig {
  allowed: string[]
  defaults: string[]
}

// --- API v2 Error ---

export interface V2ApiError {
  error: {
    code: string
    message: string
    details?: Record<string, string[]>
  }
}

// --- Generic v2 response wrapper ---

export interface V2Response<T> {
  data: T
  meta?: Record<string, unknown>
}
