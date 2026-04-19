import { ImageResponse } from 'next/og'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 86400
export const alt = 'Registra Brasil — História editorial'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default async function StoryOg({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('stories') as any)
    .select('title, subtitle, author, reading_time_min')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  const title = data?.title ?? 'História editorial'
  const subtitle = data?.subtitle ?? ''
  const author = data?.author ?? 'Registra Brasil'
  const reading = data?.reading_time_min ? `${data.reading_time_min} min de leitura` : ''

  return new ImageResponse(
    (
      <div style={{
        display: 'flex', flexDirection: 'column', width: '100%', height: '100%',
        background: 'linear-gradient(135deg, #1e3a5f 0%, #0f172a 100%)',
        padding: 72, color: 'white', fontFamily: 'sans-serif',
      }}>
        <div style={{ fontSize: 20, letterSpacing: 3, opacity: 0.7, marginBottom: 24 }}>
          REGISTRA BRASIL · HISTÓRIA
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', flex: 1, justifyContent: 'center' }}>
          <div style={{ fontSize: title.length > 60 ? 48 : 60, lineHeight: 1.15, fontWeight: 700, marginBottom: 18 }}>
            {title.length > 110 ? title.slice(0, 107) + '…' : title}
          </div>
          {subtitle && (
            <div style={{ fontSize: 24, lineHeight: 1.35, color: '#93c5fd', fontWeight: 400 }}>
              {subtitle.length > 180 ? subtitle.slice(0, 177) + '…' : subtitle}
            </div>
          )}
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 18, opacity: 0.75 }}>
          <span>por {author}</span>
          <span>{reading}</span>
        </div>
      </div>
    ),
    size,
  )
}
