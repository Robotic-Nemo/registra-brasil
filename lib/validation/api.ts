/**
 * API v1 query param validation schemas
 */
import { string, number, object } from './validate'
import { verificationStatusSchema } from './schemas'

export const statementsQuerySchema = object({
  page: number().min(1).int().optional(),
  limit: number().min(1).max(50).int().optional(),
  politician: string().max(200).optional(),
  category: string().max(200).optional(),
  status: verificationStatusSchema.optional(),
  sort: string().oneOf(['statement_date', 'created_at', 'summary']).optional(),
  order: string().oneOf(['asc', 'desc']).optional(),
})

export const politiciansQuerySchema = object({
  page: number().min(1).int().optional(),
  limit: number().min(1).max(100).int().optional(),
  party: string().max(20).optional(),
  state: string().max(2).optional(),
  q: string().max(200).optional(),
})

/**
 * Helper: extract validated query params from URLSearchParams
 */
export function extractQueryParams(
  searchParams: URLSearchParams,
  keys: string[]
): Record<string, string | undefined> {
  const result: Record<string, string | undefined> = {}
  for (const key of keys) {
    const value = searchParams.get(key)
    result[key] = value ?? undefined
  }
  return result
}
