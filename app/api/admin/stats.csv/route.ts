import { NextRequest } from 'next/server'
import { cookies } from 'next/headers'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

export const runtime = 'nodejs'
export const maxDuration = 30

async function isAdmin(): Promise<boolean> {
  const secret = process.env.ADMIN_SECRET
  if (!secret) return false
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) return false
  return timingSafeEqual(t, await deriveSessionToken(secret))
}

// ISO week-year (YYYY-Www). Uses Monday-based weeks.
function isoWeek(d: Date): string {
  const target = new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate()))
  const dayNum = target.getUTCDay() || 7
  target.setUTCDate(target.getUTCDate() + 4 - dayNum)
  const firstThursday = new Date(Date.UTC(target.getUTCFullYear(), 0, 4))
  const week = 1 + Math.round(((target.getTime() - firstThursday.getTime()) / 86_400_000 - 3 + ((firstThursday.getUTCDay() || 7) - 1)) / 7)
  return `${target.getUTCFullYear()}-W${String(week).padStart(2, '0')}`
}

const FORMULA_PREFIX = /^[=+\-@\t\r]/
function csvEscape(v: unknown): string {
  if (v === null || v === undefined) return ''
  let s = String(v)
  if (FORMULA_PREFIX.test(s)) s = `'${s}`
  if (s.includes(',') || s.includes('"') || s.includes('\n') || s.includes('\r')) {
    return `"${s.replace(/"/g, '""')}"`
  }
  return s
}

/**
 * GET /api/admin/stats.csv
 *
 * Admin-cookie-guarded CSV export with weekly editorial metrics over
 * the last 12 months: new statements, revisions, submissions received/
 * approved/rejected, retractions opened/replied, import batches,
 * broken-link detections. Useful for board reports, funder
 * transparency, and period-over-period analysis.
 */
export async function GET(_request: NextRequest) {
  if (!(await isAdmin())) {
    return new Response('Unauthorized', { status: 401 })
  }

  const since = new Date()
  since.setUTCMonth(since.getUTCMonth() - 12)
  const sinceIso = since.toISOString()

  const supabase = getSupabaseServiceClient()

  const [
    stmtsRes, revRes, subRes, retrRes, importsRes, brokenRes,
  ] = await Promise.all([
    (supabase.from('statements') as any).select('created_at').gt('created_at', sinceIso),
    (supabase.from('statement_revisions') as any).select('created_at').gt('created_at', sinceIso),
    (supabase.from('statement_submissions') as any).select('created_at, status, reviewed_at').gt('created_at', sinceIso),
    (supabase.from('retraction_requests') as any).select('created_at, public_reply_published_at').gt('created_at', sinceIso),
    (supabase.from('import_batches') as any).select('created_at').gt('created_at', sinceIso),
    (supabase.from('statements') as any)
      .select('source_last_checked_at')
      .gte('source_http_status', 400)
      .gt('source_last_checked_at', sinceIso),
  ])

  const buckets = new Map<string, {
    week: string
    new_statements: number
    revisions: number
    submissions_received: number
    submissions_approved: number
    submissions_rejected: number
    retractions_opened: number
    retractions_replied: number
    import_batches: number
    links_broken_detected: number
  }>()

  function get(week: string) {
    let b = buckets.get(week)
    if (!b) {
      b = {
        week,
        new_statements: 0, revisions: 0,
        submissions_received: 0, submissions_approved: 0, submissions_rejected: 0,
        retractions_opened: 0, retractions_replied: 0,
        import_batches: 0, links_broken_detected: 0,
      }
      buckets.set(week, b)
    }
    return b
  }

  for (const r of (stmtsRes.data ?? []) as Array<{ created_at: string }>) get(isoWeek(new Date(r.created_at))).new_statements++
  for (const r of (revRes.data ?? []) as Array<{ created_at: string }>) get(isoWeek(new Date(r.created_at))).revisions++
  for (const r of (subRes.data ?? []) as Array<{ created_at: string; status: string; reviewed_at: string | null }>) {
    get(isoWeek(new Date(r.created_at))).submissions_received++
    if (r.reviewed_at) {
      if (r.status === 'approved') get(isoWeek(new Date(r.reviewed_at))).submissions_approved++
      if (r.status === 'rejected') get(isoWeek(new Date(r.reviewed_at))).submissions_rejected++
    }
  }
  for (const r of (retrRes.data ?? []) as Array<{ created_at: string; public_reply_published_at: string | null }>) {
    get(isoWeek(new Date(r.created_at))).retractions_opened++
    if (r.public_reply_published_at) get(isoWeek(new Date(r.public_reply_published_at))).retractions_replied++
  }
  for (const r of (importsRes.data ?? []) as Array<{ created_at: string }>) get(isoWeek(new Date(r.created_at))).import_batches++
  for (const r of (brokenRes.data ?? []) as Array<{ source_last_checked_at: string | null }>) {
    if (r.source_last_checked_at) get(isoWeek(new Date(r.source_last_checked_at))).links_broken_detected++
  }

  const sorted = [...buckets.values()].sort((a, b) => a.week.localeCompare(b.week))

  const headers = [
    'semana', 'novas_declaracoes', 'revisoes',
    'submissoes_recebidas', 'submissoes_aprovadas', 'submissoes_rejeitadas',
    'retratacoes_abertas', 'retratacoes_respondidas',
    'lotes_importados', 'links_quebrados_detectados',
  ]

  const rows = sorted.map((b) => [
    b.week, b.new_statements, b.revisions,
    b.submissions_received, b.submissions_approved, b.submissions_rejected,
    b.retractions_opened, b.retractions_replied,
    b.import_batches, b.links_broken_detected,
  ].map(csvEscape).join(','))

  const csv = '\uFEFF' + [headers.join(','), ...rows].join('\r\n')
  const today = new Date().toISOString().slice(0, 10)

  return new Response(csv, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="registra-brasil-editorial-stats-${today}.csv"`,
      'Cache-Control': 'private, no-store',
      'X-Robots-Tag': 'noindex, nofollow',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}
