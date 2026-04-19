import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/stats.json — global archive stats snapshot for API users.
 * Wraps a handful of head-count queries that are cheap individually
 * but would be verbose to replicate in client code.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()

  const [
    stmtAll, stmtVerified, stmtDisputed, stmtUnverified,
    polActive, polAll, catAll,
    contradicted, factChecked,
  ] = await Promise.all([
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).neq('verification_status', 'removed'),
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).eq('verification_status', 'disputed'),
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).eq('verification_status', 'unverified'),
    (supabase.from('politicians') as any).select('id', { count: 'exact', head: true }).eq('is_active', true),
    (supabase.from('politicians') as any).select('id', { count: 'exact', head: true }),
    (supabase.from('categories') as any).select('id', { count: 'exact', head: true }),
    (supabase.from('contradiction_pairs') as any).select('id', { count: 'exact', head: true }).eq('is_published', true),
    (supabase.from('statement_fact_checks') as any).select('id', { count: 'exact', head: true }),
  ])

  const num = (r: { count: number | null }): number => Number(r.count ?? 0)

  return NextResponse.json({
    site_url: SITE_URL,
    generated_at: new Date().toISOString(),
    statements: {
      total: num(stmtAll),
      verified: num(stmtVerified),
      disputed: num(stmtDisputed),
      unverified: num(stmtUnverified),
    },
    politicians: {
      total: num(polAll),
      active: num(polActive),
    },
    categories: {
      total: num(catAll),
    },
    editorial: {
      contradictions_published: num(contradicted),
      fact_checks_indexed: num(factChecked),
    },
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
