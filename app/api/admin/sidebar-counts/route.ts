import { NextResponse } from 'next/server'
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
 * GET /api/admin/sidebar-counts
 *
 * Returns the 3 queue sizes the admin sidebar wants as badges:
 * pending submissions, pending/in-review retractions, unverified
 * statements. No-cache; admin-only.
 */
export async function GET() {
  if (!(await isAdmin())) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const supabase = getSupabaseServiceClient()
  const [subs, retr, review] = await Promise.all([
    (supabase.from('statement_submissions') as any).select('id', { count: 'exact', head: true }).eq('status', 'pending'),
    (supabase.from('retraction_requests') as any).select('id', { count: 'exact', head: true }).in('status', ['pending', 'in_review']),
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).eq('verification_status', 'unverified'),
  ])

  return NextResponse.json(
    {
      pending_submissions: subs.count ?? 0,
      pending_retractions: retr.count ?? 0,
      pending_review: review.count ?? 0,
    },
    { headers: { 'Cache-Control': 'no-store' } },
  )
}
