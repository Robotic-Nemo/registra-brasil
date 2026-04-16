import { ImageResponse } from 'next/og'
import { OG_SIZE, ogStyles } from '@/lib/utils/og-helpers'

export const runtime = 'edge'
export const revalidate = 604800 // 7 days — static image, rarely changes
export const alt = 'Buscar — Registra Brasil'
export const size = OG_SIZE
export const contentType = 'image/png'

export default function Image() {
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
          <div style={ogStyles.badge}>Busca</div>
          <div style={ogStyles.smallTitle}>Pesquisar declaracoes</div>
          <div style={ogStyles.subtitle}>
            Encontre declaracoes de politicos brasileiros com fontes verificaveis
          </div>
        </div>
      </div>
    ),
    { ...size },
  )
}
