import type { NextConfig } from 'next'

const isDev = process.env.NODE_ENV !== 'production'

const nextConfig: NextConfig = {
  output: 'standalone',
  compress: true,
  poweredByHeader: false,

  images: {
    remotePatterns: [
      // YouTube thumbnails
      { protocol: 'https', hostname: 'img.youtube.com' },
      { protocol: 'https', hostname: 'i.ytimg.com' },
      // Supabase storage (politician photos)
      { protocol: 'https', hostname: '*.supabase.co' },
      // Câmara dos Deputados & Senado photos
      { protocol: 'https', hostname: 'www.camara.leg.br' },
      { protocol: 'https', hostname: 'www25.senado.leg.br' },
      { protocol: 'https', hostname: 'upload.wikimedia.org' },
      // TSE photos
      { protocol: 'https', hostname: 'divulgacandcontas.tse.jus.br' },
      // Gravatar / user avatars
      { protocol: 'https', hostname: 'www.gravatar.com' },
    ],
    formats: ['image/avif', 'image/webp'],
    minimumCacheTTL: 86400,
  },

  experimental: {
    optimizePackageImports: ['lucide-react'],
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
          { key: 'Permissions-Policy', value: 'camera=(), microphone=(), geolocation=()' },
          { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
          {
            key: 'Content-Security-Policy',
            value: [
              "default-src 'self'",
              // 'unsafe-eval' is only needed in development (Next.js HMR); strip it in production
              isDev
                ? "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://www.youtube.com"
                : "script-src 'self' 'unsafe-inline' https://www.youtube.com",
              "frame-src https://www.youtube.com",
              "img-src 'self' data: https://img.youtube.com https://i.ytimg.com https://*.supabase.co https://www.camara.leg.br https://www25.senado.leg.br https://upload.wikimedia.org https://divulgacandcontas.tse.jus.br https://www.gravatar.com",
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
      // Prevent indexing of API routes
      {
        source: '/api/(.*)',
        headers: [
          { key: 'X-Robots-Tag', value: 'noindex' },
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
