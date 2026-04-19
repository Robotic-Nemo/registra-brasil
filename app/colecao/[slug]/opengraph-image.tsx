import { ImageResponse } from 'next/og'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600
export const alt = 'Registra Brasil — Coleção editorial'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default async function CollectionOg({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const { data: col } = await (supabase.from('collections') as any)
    .select('id, title, subtitle')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  const title = col?.title ?? 'Coleção editorial'
  const subtitle = col?.subtitle ?? ''

  let itemCount = 0
  if (col?.id) {
    const { count } = await (supabase.from('collection_statements') as any)
      .select('statement_id', { count: 'exact', head: true })
      .eq('collection_id', col.id)
    itemCount = count ?? 0
  }

  return new ImageResponse(
    (
      <div style={{
        display: 'flex', flexDirection: 'column', width: '100%', height: '100%',
        background: 'linear-gradient(135deg, #e0e7ff 0%, #c7d2fe 100%)',
        padding: 72, color: '#1e1b4b', fontFamily: 'sans-serif',
      }}>
        <div style={{ fontSize: 20, letterSpacing: 3, opacity: 0.65, color: '#4338ca', marginBottom: 24 }}>
          REGISTRA BRASIL · COLEÇÃO
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', flex: 1, justifyContent: 'center' }}>
          <div style={{ fontSize: title.length > 60 ? 52 : 68, lineHeight: 1.1, fontWeight: 700, marginBottom: 18 }}>
            {title.length > 110 ? title.slice(0, 107) + '…' : title}
          </div>
          {subtitle && (
            <div style={{ fontSize: 26, lineHeight: 1.35, color: '#4338ca' }}>
              {subtitle.length > 180 ? subtitle.slice(0, 177) + '…' : subtitle}
            </div>
          )}
        </div>
        <div style={{ fontSize: 18, opacity: 0.7 }}>
          {itemCount} declaração{itemCount === 1 ? '' : 'ões'}
          {'  ·  '}registrabrasil.com.br/colecao/{slug}
        </div>
      </div>
    ),
    size,
  )
}
