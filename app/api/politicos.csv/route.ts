import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/politicos.csv — bulk CSV directory of politicians.
 * Paired with /api/politicos.json for researchers who need a
 * flat spreadsheet. Defaults to active only; `?ativo=false`
 * includes inactive/archived.
 *   ?ativo=false inclui inativos
 *   ?partido=SIGLA filtra por partido
 *   ?estado=UF filtra por UF
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'politicos-csv'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const sp = request.nextUrl.searchParams
  const includeInactive = sp.get('ativo') === 'false'
  const partido = sp.get('partido')?.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 12)
  const estado = sp.get('estado')?.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 2)

  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('politicians') as any)
    .select('slug, common_name, full_name, party, state, role, is_active, tse_id, camara_id, senado_id, wikipedia_url, created_at')
    .order('common_name', { ascending: true })
    .limit(5000)

  if (!includeInactive) q = q.eq('is_active', true)
  if (partido) q = q.eq('party', partido)
  if (estado) q = q.eq('state', estado)

  const { data, error } = await q
  if (error) return new Response(`error: ${error.message}`, { status: 500 })
  const rows = (data ?? []) as Array<Record<string, any>>

  const header = [
    'slug', 'common_name', 'full_name', 'party', 'state', 'role',
    'is_active', 'tse_id', 'camara_id', 'senado_id',
    'wikipedia_url', 'created_at', 'permalink',
  ]
  const lines = [header.join(',')]
  for (const r of rows) {
    lines.push([
      csvEscape(r.slug),
      csvEscape(r.common_name),
      csvEscape(r.full_name ?? ''),
      csvEscape(r.party ?? ''),
      csvEscape(r.state ?? ''),
      csvEscape(r.role ?? ''),
      csvEscape(r.is_active ? 'true' : 'false'),
      csvEscape(r.tse_id ?? ''),
      csvEscape(r.camara_id ?? ''),
      csvEscape(r.senado_id ?? ''),
      csvEscape(r.wikipedia_url ?? ''),
      csvEscape(r.created_at),
      csvEscape(`${SITE_URL}/politico/${r.slug}`),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="politicos.csv"',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
