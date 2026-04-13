import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      // YouTube thumbnails
      { protocol: 'https', hostname: 'img.youtube.com' },
      { protocol: 'https', hostname: 'i.ytimg.com' },
      // Supabase storage (politician photos)
      { protocol: 'https', hostname: '*.supabase.co' },
      // Câmara dos Deputados photos
      { protocol: 'https', hostname: 'www.camara.leg.br' },
      { protocol: 'https', hostname: 'upload.wikimedia.org' },
    ],
  },

  // Security headers
  async headers() {
    return [
      {
        source: '/(.*)',
        headers: [
          { key: 'X-Content-Type-Options', value: 'nosniff' },
          { key: 'X-Frame-Options', value: 'DENY' },
          { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
          {
            key: 'Content-Security-Policy',
            value: [
              "default-src 'self'",
              "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://www.youtube.com",
              "frame-src https://www.youtube.com",
              "img-src 'self' data: https://img.youtube.com https://i.ytimg.com https://*.supabase.co https://www.camara.leg.br https://upload.wikimedia.org",
              "style-src 'self' 'unsafe-inline'",
              "connect-src 'self' https://*.supabase.co https://www.googleapis.com",
            ].join('; '),
          },
        ],
      },
      // No-cache for admin routes
      {
        source: '/admin/(.*)',
        headers: [
          { key: 'Cache-Control', value: 'no-store' },
        ],
      },
    ]
  },

  // Redirect /admin to login if not authed (handled in middleware)
  async redirects() {
    return []
  },
}

export default nextConfig
