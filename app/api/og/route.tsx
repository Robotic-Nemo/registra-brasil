import { ImageResponse } from 'next/og'
import { NextRequest } from 'next/server'

export const runtime = 'edge'

const MAX_TITLE_LEN = 200
const MAX_SUBTITLE_LEN = 200

export async function GET(request: NextRequest) {
  const { searchParams } = request.nextUrl
  const rawTitle = (searchParams.get('title') ?? 'Registra Brasil').slice(0, MAX_TITLE_LEN)
  const rawSubtitle = (searchParams.get('subtitle') ?? '').slice(0, MAX_SUBTITLE_LEN)
  const title = rawTitle.replace(/[\u0000-\u001F\u007F]/g, '').trim() || 'Registra Brasil'
  const subtitle = rawSubtitle.replace(/[\u0000-\u001F\u007F]/g, '').trim()

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
        <div style={{ fontSize: 24, opacity: 0.7, marginBottom: 16 }}>Registra Brasil</div>
        <div
          style={{
            fontSize: title.length > 60 ? 36 : 48,
            fontWeight: 'bold',
            textAlign: 'center',
            lineHeight: 1.2,
            maxWidth: '900px',
          }}
        >
          {title}
        </div>
        {subtitle && (
          <div style={{ fontSize: 24, opacity: 0.8, marginTop: 20, textAlign: 'center' }}>
            {subtitle}
          </div>
        )}
      </div>
    ),
    {
      width: 1200,
      height: 630,
      headers: {
        'Cache-Control': 'public, max-age=86400, s-maxage=604800, immutable',
      },
    }
  )
}
