import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /categorias/aleatoria — 302s to a random category that has at
 * least one statement classified under it. The `!inner` join filters
 * out categories with zero usage so the redirect never lands on a
 * blank page. Pool capped at 200 rows (bugfix: previously picked from
 * all 300+ categories including unused ones).
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('categories') as any)
    .select('slug, statement_categories!inner(statement_id)')
    .limit(200)
  const rows = Array.from(new Set(
    ((data ?? []) as Array<{ slug: string }>)
      .map((r) => r.slug)
      .filter((s): s is string => typeof s === 'string'),
  ))
  if (rows.length === 0) {
    return NextResponse.redirect(new URL('/categorias', SITE_URL), 302)
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]
  return NextResponse.redirect(new URL(`/categorias/${pick}`, SITE_URL), 302)
}
