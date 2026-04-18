import { ImageResponse } from 'next/og'

export const runtime = 'edge'
export const size = { width: 512, height: 512 }
export const contentType = 'image/png'

/**
 * Auto-generated icon shown as favicon and PWA icon.
 * Next.js serves this at /icon (responds to <link rel="icon">).
 * Using a glyph + gradient so we ship a real brand mark without
 * tracking a static PNG in the repo.
 */
export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          background: 'linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 50%, #3b82f6 100%)',
          color: 'white',
          fontSize: 320,
          fontWeight: 900,
          letterSpacing: '-0.05em',
          lineHeight: 1,
          textAlign: 'center',
          fontFamily: 'sans-serif',
        }}
      >
        RB
      </div>
    ),
    size,
  )
}
