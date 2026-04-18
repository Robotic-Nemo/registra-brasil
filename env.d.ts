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

    // Alerts self-service access tokens (falls back to NEWSLETTER_SECRET then REVALIDATE_SECRET)
    readonly ALERTS_ACCESS_SECRET?: string
    readonly NEWSLETTER_SECRET?: string

    // Email provider (Resend) & generic SMTP relay
    readonly RESEND_API_KEY?: string
    readonly SMTP_RELAY_URL?: string
    readonly EMAIL_FROM?: string

    // Vercel Cron bearer
    readonly CRON_SECRET?: string

    // Site
    readonly NEXT_PUBLIC_SITE_URL?: string

    // Node / Next.js built-ins
    readonly NODE_ENV: 'development' | 'production' | 'test'
  }
}
