/**
 * Mock Supabase client for testing
 */
import { vi } from 'vitest'

export interface MockQueryBuilder {
  select: ReturnType<typeof vi.fn>
  insert: ReturnType<typeof vi.fn>
  update: ReturnType<typeof vi.fn>
  delete: ReturnType<typeof vi.fn>
  eq: ReturnType<typeof vi.fn>
  neq: ReturnType<typeof vi.fn>
  gt: ReturnType<typeof vi.fn>
  gte: ReturnType<typeof vi.fn>
  lt: ReturnType<typeof vi.fn>
  lte: ReturnType<typeof vi.fn>
  like: ReturnType<typeof vi.fn>
  ilike: ReturnType<typeof vi.fn>
  in: ReturnType<typeof vi.fn>
  is: ReturnType<typeof vi.fn>
  or: ReturnType<typeof vi.fn>
  order: ReturnType<typeof vi.fn>
  limit: ReturnType<typeof vi.fn>
  range: ReturnType<typeof vi.fn>
  single: ReturnType<typeof vi.fn>
  maybeSingle: ReturnType<typeof vi.fn>
}

export interface MockSupabaseClient {
  from: ReturnType<typeof vi.fn>
  auth: {
    getUser: ReturnType<typeof vi.fn>
    getSession: ReturnType<typeof vi.fn>
  }
  _queryBuilder: MockQueryBuilder
}

/**
 * Create a mock Supabase client that returns chainable query builders.
 * Use `mockClient._queryBuilder` to configure mock return values.
 *
 * @example
 * ```ts
 * const { client, queryBuilder } = createMockSupabaseClient()
 * queryBuilder.select.mockReturnValue(queryBuilder)
 * queryBuilder.eq.mockReturnValue(queryBuilder)
 * queryBuilder.single.mockResolvedValue({ data: { id: '1' }, error: null })
 *
 * // Pass client to your function under test
 * ```
 */
export function createMockSupabaseClient(): {
  client: MockSupabaseClient
  queryBuilder: MockQueryBuilder
} {
  const queryBuilder: MockQueryBuilder = {
    select: vi.fn(),
    insert: vi.fn(),
    update: vi.fn(),
    delete: vi.fn(),
    eq: vi.fn(),
    neq: vi.fn(),
    gt: vi.fn(),
    gte: vi.fn(),
    lt: vi.fn(),
    lte: vi.fn(),
    like: vi.fn(),
    ilike: vi.fn(),
    in: vi.fn(),
    is: vi.fn(),
    or: vi.fn(),
    order: vi.fn(),
    limit: vi.fn(),
    range: vi.fn(),
    single: vi.fn(),
    maybeSingle: vi.fn(),
  }

  // Make every method chainable by default
  for (const key of Object.keys(queryBuilder) as (keyof MockQueryBuilder)[]) {
    queryBuilder[key].mockReturnValue(queryBuilder)
  }

  const client: MockSupabaseClient = {
    from: vi.fn().mockReturnValue(queryBuilder),
    auth: {
      getUser: vi.fn().mockResolvedValue({ data: { user: null }, error: null }),
      getSession: vi.fn().mockResolvedValue({ data: { session: null }, error: null }),
    },
    _queryBuilder: queryBuilder,
  }

  return { client, queryBuilder }
}

/**
 * Helper to configure a query builder to return specific data on terminal methods.
 */
export function mockQueryResult(
  queryBuilder: MockQueryBuilder,
  data: unknown,
  error: unknown = null,
  count: number | null = null
) {
  const result = { data, error, count }
  queryBuilder.select.mockReturnValue({ ...queryBuilder, ...result })
  queryBuilder.single.mockResolvedValue(result)
  queryBuilder.maybeSingle.mockResolvedValue(result)
  // For the final return when chain is resolved as a promise
  return result
}
