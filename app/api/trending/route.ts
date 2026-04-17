import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getTrendingPoliticians, getTrendingCategories } from '@/lib/supabase/queries/trending'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'
export const revalidate = 3600

const log = createLogger('api/trending')
const VALID_TYPES = ['all', 'politicians', 'categories'] as const

export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'trending'), {
    limit: 120,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const { searchParams } = request.nextUrl
  const rawType = searchParams.get('type') ?? 'all'
  const type = (VALID_TYPES as readonly string[]).includes(rawType) ? rawType : 'all'
  const days = Math.min(Math.max(1, Number(searchParams.get('days') ?? 30) || 30), 90)
  const limit = Math.min(Math.max(1, Number(searchParams.get('limit') ?? 10) || 10), 20)

  const supabase = getSupabaseServiceClient()
  const result: Record<string, unknown> = {}

  try {
    if (type === 'all' || type === 'politicians') {
      result.politicians = await getTrendingPoliticians(supabase, days, limit)
    }
    if (type === 'all' || type === 'categories') {
      result.categories = await getTrendingCategories(supabase, days, limit)
    }
  } catch (err) {
    log.error('trending query failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Erro interno' } },
      { status: 500 }
    )
  }

  return NextResponse.json(result, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
      Vary: 'Accept-Encoding',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}
