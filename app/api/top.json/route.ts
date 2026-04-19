import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/top.json — machine-readable mirror of the /top leaderboard.
 * Three leaderboards in one payload: top statements by severity, top
 * politicians by verified-statement count, top categories by use.
 * Cached 1h edge-side.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()

  const [stmtRes, polRes, catRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, statement_date, severity_score, politicians!inner(slug, common_name, party, state)')
      .neq('verification_status', 'removed')
      .order('severity_score', { ascending: false, nullsFirst: false })
      .order('statement_date', { ascending: false })
      .limit(20),
    (supabase.rpc as any)('top_politicians_all_time', { result_limit: 20 }),
    (supabase.rpc as any)('top_categories_all_time', { result_limit: 20 }),
  ])

  type StmtRow = {
    id: string; slug: string | null; summary: string; statement_date: string; severity_score: number | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const statements = ((stmtRes.data ?? []) as StmtRow[]).map((s) => ({
    id: s.id,
    slug: s.slug,
    summary: s.summary,
    statement_date: s.statement_date,
    severity_score: s.severity_score,
    politician_slug: s.politicians.slug,
    politician_name: s.politicians.common_name,
    politician_party: s.politicians.party,
    politician_state: s.politicians.state,
    permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
  }))

  const politicians = ((polRes.data ?? []) as Array<{ slug: string; common_name: string; party: string | null; state: string | null; total: number | string }>)
    .map((p) => ({
      slug: p.slug,
      common_name: p.common_name,
      party: p.party,
      state: p.state,
      statement_count: Number(p.total),
      url: `${SITE_URL}/politico/${p.slug}`,
    }))

  const categories = ((catRes.data ?? []) as Array<{ slug: string; label_pt: string; color_hex: string | null; total: number | string }>)
    .map((c) => ({
      slug: c.slug,
      label: c.label_pt,
      color: c.color_hex,
      statement_count: Number(c.total),
      url: `${SITE_URL}/categorias/${c.slug}`,
    }))

  return NextResponse.json({
    generated_at: new Date().toISOString(),
    top_statements_by_severity: statements,
    top_politicians_by_count: politicians,
    top_categories_by_count: categories,
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
