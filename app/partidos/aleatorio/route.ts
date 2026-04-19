import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /partidos/aleatorio — 302s to a random party that has at least
 * one active politician. Completes the "Me surpreenda" quartet
 * alongside /aleatoria, /politicos/aleatorio, /categorias/aleatoria.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('politicians') as any)
    .select('party')
    .eq('is_active', true)
    .not('party', 'is', null)
    .limit(400)
  const parties = new Set(
    ((data ?? []) as Array<{ party: string | null }>)
      .map((r) => r.party)
      .filter((p): p is string => !!p && p.length > 0),
  )
  const list = [...parties]
  if (list.length === 0) {
    return NextResponse.redirect(new URL('/partidos', SITE_URL), 302)
  }
  const pick = list[Math.floor(Math.random() * list.length)]
  return NextResponse.redirect(new URL(`/partidos/${encodeURIComponent(pick)}`, SITE_URL), 302)
}
