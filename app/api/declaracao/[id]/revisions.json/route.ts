import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 900

/**
 * GET /api/declaracao/[id]/revisions.json — editorial revision log for
 * one declaration (most-recent first). Lookup by UUID or slug. Rate
 * limited; emits weak ETag so repeat polling from /atualizacoes
 * fan-outs returns 304 cheaply.
 */
interface Params { params: Promise<{ id: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'revisions-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const supabase = getSupabaseServiceClient()
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(raw)

  // Resolve to canonical statement id.
  const { data: stmtRow } = isUuid
    ? await (supabase.from('statements') as any)
        .select('id, slug')
        .eq('id', raw)
        .maybeSingle()
    : await (supabase.from('statements') as any)
        .select('id, slug')
        .eq('slug', raw)
        .maybeSingle()

  if (!stmtRow) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }
  const statementId = (stmtRow as { id: string }).id
  const statementSlug = (stmtRow as { slug: string | null }).slug

  const { data, error } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, actor, created_at')
    .eq('statement_id', statementId)
    .order('revision_number', { ascending: false })
    .limit(200)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Rev = {
    id: string; revision_number: number
    changed_fields: Record<string, unknown>
    reason: string | null; actor: string | null; created_at: string
  }
  const revs = (data ?? []) as Rev[]
  const latest = revs.length ? revs[0].created_at : '0'
  const etag = `W/"srev-${statementId.slice(0, 8)}-${revs.length}-${latest.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    statement_id: statementId,
    statement_slug: statementSlug,
    total: revs.length,
    revisions: revs.map((r) => ({
      id: r.id,
      revision_number: r.revision_number,
      changed_field_keys: Object.keys(r.changed_fields ?? {}),
      changed_fields: r.changed_fields,
      reason: r.reason,
      actor: r.actor,
      created_at: r.created_at,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
