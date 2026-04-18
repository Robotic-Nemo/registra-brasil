declare namespace NodeJS {
  interface ProcessEnv {
    // Supabase
    readonly NEXT_PUBLIC_SUPABASE_URL: string
    readonly NEXT_PUBLIC_SUPABASE_ANON_KEY: string
    readonly SUPABASE_SERVICE_ROLE_KEY: string

    // YouTube Data API v3
    readonly YOUTUBE_API_KEY: string
    readonly YOUTUBE_DAILY_QUOTA_LIMIT?: string

    // Google Custom Search
    readonly GOOGLE_CSE_API_KEY?: string
    readonly GOOGLE_CSE_ID?: string

    // ISR revalidation
    readonly REVALIDATE_SECRET?: string

    // Admin panel
    readonly ADMIN_SECRET?: string
    readonly ADMIN_API_KEY?: string

    // Site
    readonly NEXT_PUBLIC_SITE_URL?: string

    // Node / Next.js built-ins
    readonly NODE_ENV: 'development' | 'production' | 'test'
  }
}
