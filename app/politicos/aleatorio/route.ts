import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /politicos/aleatorio — 302s to a random active politician.
 * Samples from a pool of 400 active politicians with at least one
 * verified statement, so you never land on an empty profile.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('politicians') as any)
    .select('slug, statements!inner(id)')
    .eq('is_active', true)
    .eq('statements.verification_status', 'verified')
    .limit(400)
  const rows = ((data ?? []) as Array<{ slug: string }>)
  if (rows.length === 0) {
    return NextResponse.redirect(new URL('/politicos', SITE_URL), 302)
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]
  return NextResponse.redirect(new URL(`/politico/${pick.slug}`, SITE_URL), 302)
}
