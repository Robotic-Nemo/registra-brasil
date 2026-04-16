/** Standard API response wrapper */
export interface ApiResponse<T> {
  data: T
  meta?: Record<string, unknown>
}

/** Paginated API response */
export interface PaginatedResponse<T> {
  data: T[]
  pagination: {
    page: number
    perPage: number
    total: number
    totalPages: number
    hasNext: boolean
    hasPrev: boolean
  }
}

/** API error response */
export interface ApiErrorResponse {
  error: string
  code?: string
  details?: Record<string, string[]>
}

/** Sort direction */
export type SortDirection = 'asc' | 'desc'

/** Common query params */
export interface QueryParams {
  page?: number
  limit?: number
  sort?: string
  order?: SortDirection
  q?: string
}

/** Filter operator */
export type FilterOperator = 'eq' | 'neq' | 'gt' | 'gte' | 'lt' | 'lte' | 'in' | 'like'

/** Generic filter */
export interface Filter {
  field: string
  operator: FilterOperator
  value: string | number | string[]
}

/** Union type for API results with discriminated success field */
export type ApiResult<T> =
  | (ApiResponse<T> & { success: true })
  | (ApiErrorResponse & { success: false })

/** Helper to create a success result */
export function apiSuccess<T>(data: T, meta?: Record<string, unknown>): ApiResponse<T> & { success: true } {
  return { success: true, data, ...(meta ? { meta } : {}) }
}

/** Helper to create a paginated result */
export function apiPaginated<T>(
  data: T[],
  page: number,
  perPage: number,
  total: number
): PaginatedResponse<T> {
  const totalPages = Math.ceil(total / perPage)
  return {
    data,
    pagination: { page, perPage, total, totalPages, hasNext: page < totalPages, hasPrev: page > 1 },
  }
}

/** Helper to create an error result */
export function apiError(error: string, code?: string): ApiErrorResponse & { success: false } {
  return { success: false, error, ...(code ? { code } : {}) }
}

/** Type guard for success responses */
export function isApiSuccess<T>(result: ApiResult<T>): result is ApiResponse<T> & { success: true } {
  return result.success === true
}
