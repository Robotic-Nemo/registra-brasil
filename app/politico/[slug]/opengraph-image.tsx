import { ImageResponse } from 'next/og'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 86400 // 24 hours — statement count changes, but not frequently
export const alt = 'Registra Brasil — Político'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default async function OGImage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const { data: politician } = await supabase
    .from('politicians')
    .select('id, common_name, full_name, party, state')
    .eq('slug', slug)
    .single()

  const { count } = await supabase
    .from('statements')
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', politician?.id ?? '')
    .eq('verification_status', 'verified')

  const name = politician?.common_name ?? slug
  const party = politician?.party ?? ''
  const state = politician?.state ?? ''
  const total = count ?? 0

  return new ImageResponse(
    (
      <div
        style={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          width: '100%',
          height: '100%',
          background: 'linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 50%, #3b82f6 100%)',
          color: 'white',
          fontFamily: 'sans-serif',
          padding: '60px',
        }}
      >
        <div style={{ fontSize: 28, opacity: 0.8, marginBottom: 16 }}>Registra Brasil</div>
        <div style={{ fontSize: 56, fontWeight: 'bold', textAlign: 'center', lineHeight: 1.2, marginBottom: 20 }}>
          {name}
        </div>
        <div style={{ fontSize: 28, opacity: 0.9, display: 'flex', gap: '16px' }}>
          {party && <span>{party}</span>}
          {state && <span>• {state}</span>}
        </div>
        <div style={{ fontSize: 24, marginTop: 32, opacity: 0.7 }}>
          {total} {total === 1 ? 'declaração verificada' : 'declarações verificadas'}
        </div>
      </div>
    ),
    { ...size }
  )
}
