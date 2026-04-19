import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/atualizacoes.json — public correction log as JSON. Mirrors
 * the /atualizacoes HTML page and /atualizacoes/feed.xml RSS.
 * ?limite=N (1..200, default 50).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'atualizacoes-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(200,
    Number(request.nextUrl.searchParams.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, actor, created_at, statement_id, statements(slug, summary, politicians(slug, common_name, party, state))')
    .order('created_at', { ascending: false })
    .limit(limit)

  type Row = {
    id: string; revision_number: number; changed_fields: Record<string, unknown>
    reason: string | null; actor: string | null; created_at: string; statement_id: string
    statements: { slug: string | null; summary: string; politicians: { slug: string; common_name: string; party: string | null; state: string | null } | null } | null
  }
  const rows = ((data ?? []) as Row[]).filter((r) => r.statements)

  return NextResponse.json({
    count: rows.length,
    limit,
    revisions: rows.map((r) => ({
      id: r.id,
      revision_number: r.revision_number,
      changed_fields: Object.keys(r.changed_fields ?? {}),
      reason: r.reason,
      actor: r.actor ?? 'admin',
      created_at: r.created_at,
      statement_id: r.statement_id,
      statement_slug: r.statements!.slug,
      statement_summary: r.statements!.summary,
      politician: r.statements!.politicians,
      history_permalink: `${SITE_URL}/declaracao/${r.statements!.slug ?? r.statement_id}/historico`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=3600',
    },
  })
}
