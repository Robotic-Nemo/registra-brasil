import { NextRequest, NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

export const dynamic = 'force-dynamic'

export async function GET(request: NextRequest) {
  // Auth check — verify HMAC token, not just cookie existence
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  const cookieStore = await cookies()
  const token = cookieStore.get(SESSION_COOKIE)?.value
  if (!token) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  const expectedToken = await deriveSessionToken(adminSecret)
  if (!timingSafeEqual(token, expectedToken)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const status = request.nextUrl.searchParams.get('status') ?? 'verified'
  const validStatuses = ['verified', 'unverified', 'disputed', 'removed']
  if (!validStatuses.includes(status)) {
    return NextResponse.json({ error: 'Invalid status' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data, error } = await supabase
    .from('statements')
    .select(`
      id,
      slug,
      summary,
      full_quote,
      statement_date,
      venue,
      event_name,
      verification_status,
      primary_source_url,
      primary_source_type,
      editor_notes,
      created_at,
      politicians (common_name, party, state)
    `)
    .eq('verification_status', status)
    .order('statement_date', { ascending: false })
    .limit(5000)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  // Build CSV
  const headers = [
    'id', 'slug', 'politician', 'party', 'state', 'summary', 'full_quote',
    'statement_date', 'venue', 'event_name', 'status', 'source_url', 'source_type',
    'editor_notes', 'created_at',
  ]

  // CSV injection defense: prefix cells Excel/Sheets/Numbers would evaluate
  // as formulas with a single quote so they render as plain text.
  const FORMULA_PREFIX = /^[=+\-@\t\r]/
  function csvEscape(val: string | null | undefined): string {
    if (val == null) return ''
    let str = String(val)
    if (FORMULA_PREFIX.test(str)) {
      str = `'${str}`
    }
    if (str.includes(',') || str.includes('"') || str.includes('\n') || str.includes('\r')) {
      return `"${str.replace(/"/g, '""')}"`
    }
    return str
  }

  const rows = ((data ?? []) as any[]).map((s) => {
    const pol = s.politicians as { common_name: string; party: string; state: string } | null
    return [
      s.id,
      s.slug,
      pol?.common_name,
      pol?.party,
      pol?.state,
      s.summary,
      s.full_quote,
      s.statement_date,
      s.venue,
      s.event_name,
      s.verification_status,
      s.primary_source_url,
      s.primary_source_type,
      s.editor_notes,
      s.created_at,
    ].map(csvEscape).join(',')
  })

  const csv = [headers.join(','), ...rows].join('\n')
  const filename = `registra-brasil-${status}-${new Date().toISOString().slice(0, 10)}.csv`

  return new Response(csv, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="${filename}"`,
      'Cache-Control': 'private, no-store',
      'X-Robots-Tag': 'noindex, nofollow',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}
