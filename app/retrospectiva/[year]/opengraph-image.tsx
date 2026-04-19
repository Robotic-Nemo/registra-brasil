import { ImageResponse } from 'next/og'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 86400
export const alt = 'Registra Brasil — Retrospectiva anual'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default async function RetrospectivaOg({ params }: { params: Promise<{ year: string }> }) {
  const { year: yearStr } = await params
  const year = parseInt(yearStr, 10)
  const yearValid = Number.isFinite(year) && year >= 1980 && year <= 2100

  let count = 0
  let politicianCount = 0
  if (yearValid) {
    const supabase = await getSupabaseServerClient()
    const { data } = await (supabase.from('statements') as any)
      .select('politician_id')
      .gte('statement_date', `${year}-01-01`)
      .lte('statement_date', `${year}-12-31`)
      .neq('verification_status', 'removed')
      .limit(10000)
    const rows = (data ?? []) as Array<{ politician_id: string }>
    count = rows.length
    politicianCount = new Set(rows.map((r) => r.politician_id)).size
  }

  return new ImageResponse(
    (
      <div style={{
        display: 'flex', flexDirection: 'column', width: '100%', height: '100%',
        background: 'linear-gradient(135deg, #0f172a 0%, #1e3a5f 50%, #3b82f6 100%)',
        padding: 72, color: 'white', fontFamily: 'sans-serif',
      }}>
        <div style={{ fontSize: 20, letterSpacing: 3, opacity: 0.75, marginBottom: 40 }}>
          REGISTRA BRASIL · RETROSPECTIVA
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', flex: 1, justifyContent: 'center' }}>
          <div style={{ fontSize: 220, lineHeight: 1, fontWeight: 800, letterSpacing: -4 }}>
            {yearValid ? year : '—'}
          </div>
          {yearValid && (
            <div style={{ fontSize: 32, marginTop: 16, color: '#bfdbfe', display: 'flex', gap: 32 }}>
              <span>{count.toLocaleString('pt-BR')} declarações</span>
              <span>·</span>
              <span>{politicianCount} políticos</span>
            </div>
          )}
        </div>
        <div style={{ fontSize: 18, opacity: 0.7 }}>
          registrabrasil.com.br/retrospectiva/{year}
        </div>
      </div>
    ),
    size,
  )
}
