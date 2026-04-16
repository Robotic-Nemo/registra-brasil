import type { MetadataRoute } from 'next'

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Registra Brasil',
    short_name: 'Registra',
    description: 'Arquivo público de declarações de políticos brasileiros',
    start_url: '/',
    display: 'standalone',
    background_color: '#f9fafb',
    theme_color: '#1d4ed8',
    lang: 'pt-BR',
    categories: ['news', 'politics'],
    orientation: 'any',
    icons: [
      {
        src: '/favicon.ico',
        sizes: '48x48',
        type: 'image/x-icon',
      },
      // TODO: create /public/icon-192.png and /public/icon-512.png for production PWA installs
      {
        src: '/icon-192.png',
        sizes: '192x192',
        type: 'image/png',
      },
      {
        src: '/icon-512.png',
        sizes: '512x512',
        type: 'image/png',
      },
      {
        src: '/icon-512.png',
        sizes: '512x512',
        type: 'image/png',
        purpose: 'maskable',
      },
    ],
    shortcuts: [
      {
        name: 'Buscar declarações',
        url: '/buscar',
        description: 'Pesquisar declarações de políticos',
      },
      {
        name: 'Políticos',
        url: '/politicos',
        description: 'Ver lista de políticos',
      },
      {
        name: 'Estatísticas',
        url: '/estatisticas',
        description: 'Ver estatísticas do acervo',
      },
    ],
  }
}
