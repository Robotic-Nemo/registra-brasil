import { ImageResponse } from 'next/og'
import { OG_SIZE, ogStyles } from '@/lib/utils/og-helpers'

export const runtime = 'edge'
export const revalidate = 604800 // 7 days — category labels rarely change
export const alt = 'Categoria — Registra Brasil'
export const size = OG_SIZE
export const contentType = 'image/png'

export default async function Image({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const label = slug
    .replace(/-/g, ' ')
    .replace(/\b\w/g, (c) => c.toUpperCase())

  return new ImageResponse(
    (
      <div style={ogStyles.container}>
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            gap: '20px',
          }}
        >
          <div style={ogStyles.badge}>Categoria</div>
          <div style={ogStyles.smallTitle}>{label}</div>
          <div style={ogStyles.subtitle}>Registra Brasil</div>
        </div>
      </div>
    ),
    { ...size },
  )
}
