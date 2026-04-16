import { ImageResponse } from 'next/og'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'

export const runtime = 'edge'
export const revalidate = 86400 // 24 hours — content can be updated but changes are infrequent
export const alt = 'Registra Brasil — Declaração'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default async function OgImage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)

  if (!statement) {
    return new ImageResponse(
      (
        <div style={{ display: 'flex', width: '100%', height: '100%', background: '#1e3a5f', alignItems: 'center', justifyContent: 'center', color: 'white', fontSize: 48 }}>
          Registra Brasil
        </div>
      ),
      size
    )
  }

  const { politicians: pol } = statement
  const summary = statement.summary.length > 160 ? statement.summary.slice(0, 157) + '...' : statement.summary

  return new ImageResponse(
    (
      <div
        style={{
          display: 'flex',
          flexDirection: 'column',
          width: '100%',
          height: '100%',
          background: 'linear-gradient(135deg, #1e3a5f 0%, #0f172a 100%)',
          padding: '60px',
          color: 'white',
          fontFamily: 'sans-serif',
        }}
      >
        <div style={{ display: 'flex', alignItems: 'center', gap: '16px', marginBottom: '40px' }}>
          <div style={{ fontSize: 24, opacity: 0.8 }}>REGISTRA BRASIL</div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', flex: 1, justifyContent: 'center' }}>
          <div style={{ fontSize: 20, color: '#93c5fd', marginBottom: '12px' }}>
            {pol.common_name} · {pol.party}{pol.state ? `/${pol.state}` : ''}
          </div>
          <div style={{ fontSize: 36, lineHeight: 1.3, fontWeight: 600 }}>
            &ldquo;{summary}&rdquo;
          </div>
        </div>

        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', fontSize: 16, opacity: 0.6 }}>
          <span>{statement.statement_date}</span>
          <span>registrabrasil.com.br</span>
        </div>
      </div>
    ),
    size
  )
}
