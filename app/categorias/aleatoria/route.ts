import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /categorias/aleatoria — 302s to a random category that has
 * at least one statement. Useful for "Me surpreenda" exploration.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('categories') as any)
    .select('slug')
    .limit(300)
  const rows = ((data ?? []) as Array<{ slug: string }>)
  if (rows.length === 0) {
    return NextResponse.redirect(new URL('/categorias', SITE_URL), 302)
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]
  return NextResponse.redirect(new URL(`/categorias/${pick.slug}`, SITE_URL), 302)
}
