import { ImageResponse } from 'next/og'

export const runtime = 'edge'
export const revalidate = 604800 // 7 days — static image, rarely changes
export const alt = 'Registra Brasil'
export const size = { width: 1200, height: 630 }
export const contentType = 'image/png'

export default function Image() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          background: 'linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 50%, #3b82f6 100%)',
        }}
      >
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            gap: '16px',
          }}
        >
          <div
            style={{
              fontSize: 80,
              fontWeight: 800,
              color: '#ffffff',
              letterSpacing: '-2px',
              lineHeight: 1,
            }}
          >
            Registra Brasil
          </div>
          <div
            style={{
              fontSize: 28,
              color: '#bfdbfe',
              fontWeight: 400,
              letterSpacing: '0.5px',
            }}
          >
            Declarações de políticos, verificadas e organizadas
          </div>
        </div>
      </div>
    ),
    { ...size }
  )
}
