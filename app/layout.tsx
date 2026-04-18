import type { Metadata } from 'next'
import { Geist, Geist_Mono } from 'next/font/google'
import './globals.css'
import { Header } from '@/components/layout/Header'
import { Footer } from '@/components/layout/Footer'
import { MaintenanceBanner } from '@/components/layout/MaintenanceBanner'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { ClientExtras } from '@/components/layout/ClientExtras'

const geistSans = Geist({
  variable: '--font-geist-sans',
  subsets: ['latin'],
  display: 'swap',
})

const geistMono = Geist_Mono({
  variable: '--font-geist-mono',
  subsets: ['latin'],
  display: 'swap',
})

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: {
    default: 'Registra Brasil — Arquivo de declarações políticas',
    template: '%s',
  },
  description:
    'Arquivo público de declarações de políticos brasileiros com ligação obrigatória a fontes primárias.',
  metadataBase: new URL(siteUrl),
  openGraph: {
    type: 'website',
    locale: 'pt_BR',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary',
  },
  other: {
    'theme-color': '#1d4ed8',
  },
  alternates: {
    canonical: '/',
    languages: {
      'pt-BR': '/',
      'x-default': '/',
    },
    types: {
      'application/rss+xml': '/feed.xml',
    },
  },
}

// ASCII art banner for developers who inspect the console
// Uncomment to enable:
// if (typeof window === 'undefined') {
//   console.log(`
//     ____            _     _              ____                _ _
//    |  _ \\ ___  __ _(_)___| |_ _ __ __ _ | __ ) _ __ __ _ ___(_) |
//    | |_) / _ \\/ _\` | / __| __| '__/ _\` ||  _ \\| '__/ _\` / __| | |
//    |  _ <  __/ (_| | \\__ \\ |_| | | (_| || |_) | | | (_| \\__ \\ | |
//    |  _\\ \\___|\\__, |_|___/\\__|_|  \\__,_||____/|_|  \\__,_|___/_|_|
//    |_|        |___/
//    Arquivo publico de declaracoes politicas
//    https://registrabrasil.com.br
//   `)
// }

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="pt-BR" className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="default" />
        <link rel="dns-prefetch" href="https://ctibmuxsdekslcjjsmli.supabase.co" />
        <link rel="preconnect" href="https://ctibmuxsdekslcjjsmli.supabase.co" crossOrigin="anonymous" />
        <link rel="dns-prefetch" href="https://www.youtube.com" />
        <link rel="dns-prefetch" href="https://i.ytimg.com" />
        <link rel="preconnect" href="https://i.ytimg.com" crossOrigin="anonymous" />
        <link rel="search" type="application/opensearchdescription+xml" title="Registra Brasil" href="/opensearch.xml" />
        <script
          dangerouslySetInnerHTML={{
            __html: `(function(){try{var c=document.cookie.split(/;\\s*/).find(function(x){return x.indexOf('rb:theme=')===0});var v=c?c.slice(9):'auto';var sys=window.matchMedia('(prefers-color-scheme: dark)').matches;var dark=v==='dark'||(v==='auto'&&sys);if(dark)document.documentElement.classList.add('dark');}catch(e){}})();`,
          }}
        />
      </head>
      <body className="min-h-full flex flex-col bg-gray-50 text-gray-900">
        <noscript>
          <div style={{ background: '#fef3c7', color: '#92400e', padding: '12px 16px', textAlign: 'center', fontSize: '14px' }}>
            Este site funciona melhor com JavaScript ativado. Algumas funcionalidades podem não estar disponíveis.
          </div>
        </noscript>
        <a href="#main-content" className="sr-only focus:not-sr-only focus:absolute focus:z-50 focus:top-2 focus:left-2 focus:bg-blue-600 focus:text-white focus:px-4 focus:py-2 focus:rounded-lg focus:text-sm">
          Pular para o conteúdo
        </a>
        <ProgressBar />
        <Header />
        <MaintenanceBanner />
        <div id="main-content" className="flex-1" tabIndex={-1}>{children}</div>
        <Footer />
        <ClientExtras />
      </body>
    </html>
  )
}
