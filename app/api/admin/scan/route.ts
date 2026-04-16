/**
 * app/api/admin/scan/route.ts
 * HTTP endpoint to trigger the scandal scanner.
 * Protected by ADMIN_SECRET in Authorization header.
 *
 * POST /api/admin/scan
 * Headers: Authorization: Bearer <ADMIN_SECRET>
 * Body (optional JSON):
 *   {
 *     queries?: string[],
 *     politician_slug?: string,
 *     dry_run?: boolean,
 *     limit?: number
 *   }
 */

import { NextRequest, NextResponse } from 'next/server'
import { scanForScandals } from '@/lib/scanner'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 300  // 5 min timeout (Vercel Pro)

// Simple in-memory rate limiter: max 2 scans per 10 minutes
const rateLimitMap = new Map<string, { count: number; resetAt: number }>()
const RATE_LIMIT = 2
const RATE_WINDOW_MS = 10 * 60 * 1000

function checkRateLimit(key: string): boolean {
  const now = Date.now()

  // Purge expired entries to prevent memory leak
  for (const [k, v] of rateLimitMap) {
    if (now > v.resetAt) rateLimitMap.delete(k)
  }

  const entry = rateLimitMap.get(key)
  if (!entry || now > entry.resetAt) {
    rateLimitMap.set(key, { count: 1, resetAt: now + RATE_WINDOW_MS })
    return true
  }
  if (entry.count >= RATE_LIMIT) return false
  entry.count++
  return true
}

function unauthorized() {
  return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
}

export async function POST(req: NextRequest) {
  // Auth check
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) return unauthorized()

  const authHeader = req.headers.get('authorization') ?? ''
  const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : ''
  if (token !== adminSecret) return unauthorized()

  // Rate limit by token (use last 8 chars to avoid logging full secret)
  const rateLimitKey = token.slice(-8)
  if (!checkRateLimit(rateLimitKey)) {
    return NextResponse.json(
      { error: 'Rate limit exceeded. Max 2 scans per 10 minutes.' },
      { status: 429 },
    )
  }

  // Parse body
  let body: {
    queries?: string[]
    politician_slug?: string
    dry_run?: boolean
    limit?: number
  } = {}

  try {
    const text = await req.text()
    if (text) body = JSON.parse(text)
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 })
  }

  // Validate inputs
  if (body.queries !== undefined) {
    if (!Array.isArray(body.queries) || body.queries.length > 20) {
      return NextResponse.json({ error: 'queries must be an array of max 20 strings' }, { status: 400 })
    }
    for (const q of body.queries) {
      if (typeof q !== 'string' || q.length > 200) {
        return NextResponse.json({ error: 'Each query must be a string under 200 chars' }, { status: 400 })
      }
    }
  }

  if (body.limit !== undefined) {
    body.limit = Math.max(1, Math.min(10, Number(body.limit) || 5))
  }

  const startTime = Date.now()

  try {
    const result = await scanForScandals({
      queries: body.queries,
      politicianSlugFilter: body.politician_slug,
      dryRun: body.dry_run ?? false,
      limit: body.limit ?? 8,
      verbose: false,
    })

    return NextResponse.json({
      ok: true,
      elapsed_ms: Date.now() - startTime,
      ...result,
    })
  } catch (err) {
    console.error('[scan] Error:', err)
    return NextResponse.json(
      {
        ok: false,
        error: err instanceof Error ? err.message : 'Unknown error',
        elapsed_ms: Date.now() - startTime,
      },
      { status: 500 },
    )
  }
}

// GET: simple health check / status
export async function GET(req: NextRequest) {
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) return unauthorized()

  const authHeader = req.headers.get('authorization') ?? ''
  const token = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : ''
  if (token !== adminSecret) return unauthorized()

  return NextResponse.json({
    ok: true,
    endpoint: 'POST /api/admin/scan',
    description: 'Scans news for recent political scandals and inserts them as unverified statements',
    body_params: {
      queries: 'string[] — custom search queries (optional)',
      politician_slug: 'string — filter to one politician (optional)',
      dry_run: 'boolean — preview without inserting (default: false)',
      limit: 'number — max articles per query, 1-10 (default: 8)',
    },
    example: 'curl -X POST /api/admin/scan -H "Authorization: Bearer $ADMIN_SECRET" -d \'{"dry_run":true}\'',
  })
}
