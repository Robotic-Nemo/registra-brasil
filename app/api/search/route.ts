import { NextRequest, NextResponse } from 'next/server'
import { unifiedSearch } from '@/lib/search/unified'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'
import type { SearchParams } from '@/types/search'

const RATE_LIMIT_PER_WINDOW = 30
const RATE_LIMIT_WINDOW_MS = 60_000
const MAX_Q_LENGTH = 200
const MAX_LIMIT = 50
const MIN_LIMIT = 1
const DEFAULT_LIMIT = 20
const MAX_PAGE = 1000
const ISO_DATE = /^\d{4}-\d{2}-\d{2}$/

const VALID_STATUSES = ['verified', 'unverified', 'disputed', 'removed'] as const
const VALID_SOURCES = ['curado', 'ao-vivo', 'todos'] as const

const CACHE_CONTROL = 'public, s-maxage=60, stale-while-revalidate=300'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const log = createLogger('api/search')

function parseStatus(v: string | null): SearchParams['status'] | undefined {
  return v && (VALID_STATUSES as readonly string[]).includes(v)
    ? (v as SearchParams['status'])
    : undefined
}

function parseSource(v: string | null): SearchParams['fonte'] {
  return v && (VALID_SOURCES as readonly string[]).includes(v)
    ? (v as SearchParams['fonte'])
    : 'todos'
}

function parseIntSafe(v: string | null, fallback: number): number {
  const n = parseInt(v ?? String(fallback), 10)
  return Number.isFinite(n) ? n : fallback
}

function validDate(v: string | undefined): string | undefined {
  if (!v || !ISO_DATE.test(v)) return undefined
  const d = new Date(v)
  if (Number.isNaN(d.getTime())) return undefined
  return v
}

export async function GET(req: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(req, 'search'), {
    limit: RATE_LIMIT_PER_WINDOW,
    windowMs: RATE_LIMIT_WINDOW_MS,
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

  const sp = req.nextUrl.searchParams

  // Trim + cap q length.
  const qRaw = sp.get('q')?.trim()
  const q = qRaw && qRaw.length > 0 && qRaw.length <= MAX_Q_LENGTH ? qRaw : undefined

  // Dedup categoria values.
  const categoria = Array.from(new Set(sp.getAll('categoria').filter(Boolean)))

  // Swap inverted date range.
  let de = validDate(sp.get('de') ?? undefined)
  let ate = validDate(sp.get('ate') ?? undefined)
  if (de && ate && de > ate) {
    ;[de, ate] = [ate, de]
  }

  const params: SearchParams = {
    q,
    categoria,
    partido: sp.get('partido') ?? undefined,
    estado: sp.get('estado') ?? undefined,
    politico: sp.get('politico') ?? undefined,
    de,
    ate,
    status: parseStatus(sp.get('status')),
    fonte: parseSource(sp.get('fonte')),
    page: Math.min(Math.max(1, parseIntSafe(sp.get('page'), 1)), MAX_PAGE),
    limit: Math.min(Math.max(MIN_LIMIT, parseIntSafe(sp.get('limit'), DEFAULT_LIMIT)), MAX_LIMIT),
  }

  try {
    const result = await unifiedSearch(params)
    return NextResponse.json(result, {
      headers: {
        'Cache-Control': CACHE_CONTROL,
        Vary: 'Accept-Encoding',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  } catch (err) {
    log.error('search failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }
}
