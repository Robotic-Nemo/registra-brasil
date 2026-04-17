import { NextRequest, NextResponse } from 'next/server'
import { revalidatePath, revalidateTag } from 'next/cache'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

// Restrict slugs to prevent injection via revalidatePath.
const SLUG_PATTERN = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
// Tags follow the same safe-ascii pattern.
const TAG_PATTERN = /^[a-z0-9][a-z0-9_:-]{0,62}$/i

function timingSafeEqual(a: string, b: string): boolean {
  const len = Math.max(a.length, b.length)
  let result = a.length === b.length ? 0 : 1
  for (let i = 0; i < len; i++) {
    result |= (a.charCodeAt(i) || 0) ^ (b.charCodeAt(i) || 0)
  }
  return result === 0
}

export async function POST(req: NextRequest) {
  // Rate limit to prevent secret brute-force.
  const rl = checkRateLimit(getRateLimitKey(req, 'revalidate'), {
    limit: 30,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: 'Rate limited' },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const authHeader = req.headers.get('authorization') ?? ''
  const headerSecret = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null
  // Header-only — query secrets leak via logs.
  const secret = headerSecret ?? ''
  const expected = process.env.REVALIDATE_SECRET

  if (!expected || !secret || !timingSafeEqual(secret, expected)) {
    return NextResponse.json({ error: 'Invalid secret' }, { status: 401 })
  }

  let body: {
    politician_slug?: string
    statement_slug?: string
    tags?: string[]
  } = {}
  try {
    const text = await req.text()
    if (text) body = JSON.parse(text)
  } catch {
    // Body is optional — proceed without it
  }

  const revalidated: string[] = []
  const errors: string[] = []

  const tryRevalidate = (path: string) => {
    try {
      revalidatePath(path)
      revalidated.push(path)
    } catch (err) {
      errors.push(`${path}: ${err instanceof Error ? err.message : 'unknown error'}`)
    }
  }

  const isValidSlug = (s: unknown): s is string =>
    typeof s === 'string' && SLUG_PATTERN.test(s)

  if (isValidSlug(body.politician_slug)) tryRevalidate(`/politico/${body.politician_slug}`)
  if (isValidSlug(body.statement_slug)) tryRevalidate(`/declaracao/${body.statement_slug}`)
  tryRevalidate('/buscar')
  tryRevalidate('/')
  tryRevalidate('/politicos')
  tryRevalidate('/categorias')

  const revalidatedTags: string[] = []
  if (Array.isArray(body.tags)) {
    for (const tag of body.tags) {
      if (typeof tag === 'string' && TAG_PATTERN.test(tag)) {
        try {
          // Next 16 requires a cache-life profile; 'default' is the generic bucket.
          revalidateTag(tag, 'default')
          revalidatedTags.push(tag)
        } catch (err) {
          errors.push(`tag:${tag}: ${err instanceof Error ? err.message : 'unknown error'}`)
        }
      }
    }
  }

  const status =
    errors.length > 0 && revalidated.length === 0 && revalidatedTags.length === 0 ? 500 : 200
  return NextResponse.json(
    {
      revalidated: revalidated.length > 0 || revalidatedTags.length > 0,
      paths: revalidated,
      tags: revalidatedTags,
      errors,
    },
    { status, headers: { 'X-Content-Type-Options': 'nosniff' } },
  )
}
