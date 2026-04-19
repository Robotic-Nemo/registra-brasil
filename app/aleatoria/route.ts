import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * GET /aleatoria — 302 redirect to a randomly chosen verified statement.
 * Useful for "Me surpreenda" links on the homepage / footer.
 *
 * Picks a random id via two cheap tricks: fetch a moderate pool (300)
 * sorted by recency and pick one uniformly. Good enough for
 * exploration without the cost of TABLESAMPLE.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug')
    .eq('verification_status', 'verified')
    .order('created_at', { ascending: false })
    .limit(300)
  const rows = (data ?? []) as Array<{ id: string; slug: string | null }>
  if (rows.length === 0) {
    return NextResponse.redirect(new URL('/buscar', process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'))
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]
  const target = `/declaracao/${pick.slug ?? pick.id}`
  return NextResponse.redirect(new URL(target, process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'), 302)
}
