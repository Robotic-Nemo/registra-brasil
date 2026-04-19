import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
// Accept the first 6–12 chars of a UUID as a compact share slug.
const SHORT_RE = /^[0-9a-f]{6,12}$/i

/**
 * GET /s/:id — compact share redirect. Accepts the full UUID, the slug,
 * or a 6–12 char UUID prefix (e.g. the first block). Resolves to the
 * canonical /declaracao/<slug-or-id> and 302s. Any unmatched key falls
 * back to /buscar?q=<key>.
 */
export async function GET(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const raw = id.trim()
  if (!raw) {
    return NextResponse.redirect(new URL('/', SITE_URL), 302)
  }

  const supabase = getSupabaseServiceClient()

  if (UUID_RE.test(raw)) {
    return NextResponse.redirect(new URL(`/declaracao/${raw}`, SITE_URL), 301)
  }

  // Try an exact slug match first — slugs are human-facing share keys.
  const { data: bySlug } = await (supabase.from('statements') as any)
    .select('id, slug')
    .eq('slug', raw)
    .maybeSingle()
  if (bySlug) {
    return NextResponse.redirect(new URL(`/declaracao/${bySlug.slug ?? bySlug.id}`, SITE_URL), 301)
  }

  // Prefix lookup — UUIDs are random so 6+ chars rarely collide.
  if (SHORT_RE.test(raw)) {
    const { data: byPrefix } = await (supabase.from('statements') as any)
      .select('id, slug')
      .ilike('id', `${raw}%`)
      .limit(1)
    const row = ((byPrefix ?? []) as Array<{ id: string; slug: string | null }>)[0]
    if (row) {
      return NextResponse.redirect(new URL(`/declaracao/${row.slug ?? row.id}`, SITE_URL), 302)
    }
  }

  // Last resort — search by the raw term.
  return NextResponse.redirect(
    new URL(`/buscar?q=${encodeURIComponent(raw)}`, SITE_URL),
    302,
  )
}
