import { ImageResponse } from 'next/og'
import { NextRequest } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'

export const runtime = 'edge'
export const revalidate = 3600

const SIZES = {
  og: { width: 1200, height: 630 },          // Twitter/Facebook default
  square: { width: 1080, height: 1080 },     // Instagram feed
  portrait: { width: 1080, height: 1350 },   // Instagram / stories-safe
} as const
type SizeKey = keyof typeof SIZES

const THEMES = {
  dark: {
    bg: 'linear-gradient(135deg, #1e3a5f 0%, #0f172a 100%)',
    fg: '#ffffff',
    accent: '#93c5fd',
    subtle: 'rgba(255,255,255,0.6)',
  },
  light: {
    bg: 'linear-gradient(135deg, #f9fafb 0%, #e0e7ff 100%)',
    fg: '#0f172a',
    accent: '#1d4ed8',
    subtle: 'rgba(15,23,42,0.6)',
  },
  minimal: {
    bg: '#ffffff',
    fg: '#111827',
    accent: '#6b7280',
    subtle: '#9ca3af',
  },
} as const
type ThemeKey = keyof typeof THEMES

/**
 * GET /declaracao/[id]/share-card?theme=dark|light|minimal&size=og|square|portrait
 *
 * Parameterized share-card image. Separate from the auto OG (which
 * stays dark 1200×630 for social previews); this endpoint is wired
 * to a UI "baixar imagem" button so editors/readers can pick format.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)

  const themeKey = (request.nextUrl.searchParams.get('theme') ?? 'dark') as ThemeKey
  const sizeKey = (request.nextUrl.searchParams.get('size') ?? 'og') as SizeKey
  const theme = THEMES[themeKey] ?? THEMES.dark
  const size = SIZES[sizeKey] ?? SIZES.og

  if (!statement) {
    return new ImageResponse(
      (
        <div style={{ display: 'flex', width: '100%', height: '100%', background: theme.bg, alignItems: 'center', justifyContent: 'center', color: theme.fg, fontSize: 48 }}>
          Registra Brasil
        </div>
      ),
      size,
    )
  }

  const pol = statement.politicians
  const body = statement.full_quote ?? statement.summary
  const quote = body.length > 280 ? body.slice(0, 277) + '…' : body
  const padding = sizeKey === 'portrait' ? 72 : 60
  const quoteSize = sizeKey === 'portrait' ? 42 : quote.length > 180 ? 30 : 38

  return new ImageResponse(
    (
      <div
        style={{
          display: 'flex',
          flexDirection: 'column',
          width: '100%',
          height: '100%',
          background: theme.bg,
          padding: `${padding}px`,
          color: theme.fg,
          fontFamily: 'sans-serif',
        }}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: 16, marginBottom: 40 }}>
          <div style={{ fontSize: 22, letterSpacing: 2, opacity: 0.75 }}>REGISTRA BRASIL</div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', flex: 1, justifyContent: 'center' }}>
          <div style={{ fontSize: 22, color: theme.accent, marginBottom: 14, fontWeight: 600 }}>
            {pol.common_name} · {pol.party}{pol.state ? `/${pol.state}` : ''}
          </div>
          <div style={{ fontSize: quoteSize, lineHeight: 1.28, fontWeight: 600 }}>
            &ldquo;{quote}&rdquo;
          </div>
        </div>

        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', fontSize: 16, color: theme.subtle }}>
          <span>{statement.statement_date}{statement.venue ? ` · ${statement.venue}` : ''}</span>
          <span>registrabrasil.com.br/declaracao/{statement.slug ?? statement.id}</span>
        </div>
      </div>
    ),
    size,
  )
}
