import { NextRequest, NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

export const runtime = 'edge'

async function isAdmin(): Promise<boolean> {
  const secret = process.env.ADMIN_SECRET
  if (!secret) return false
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) return false
  return timingSafeEqual(t, await deriveSessionToken(secret))
}

/**
 * POST /api/admin/resolve-slugs { slugs: string[] }
 *
 * Given up to 200 statement slugs, returns a map slug → uuid for the
 * ones that exist. Unknown slugs are simply omitted. Admin-only.
 */
export async function POST(request: NextRequest) {
  if (!(await isAdmin())) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  let body: { slugs?: string[] }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }
  const slugs = Array.isArray(body.slugs) ? body.slugs.filter((s) => typeof s === 'string').slice(0, 200) : []
  if (slugs.length === 0) return NextResponse.json({ resolved: {} })

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug')
    .in('slug', slugs)

  const resolved: Record<string, string> = {}
  for (const row of ((data ?? []) as { id: string; slug: string | null }[])) {
    if (row.slug) resolved[row.slug] = row.id
  }
  return NextResponse.json({ resolved })
}
