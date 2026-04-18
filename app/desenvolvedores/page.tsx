import Link from 'next/link'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Code2, BookOpen, Key, Webhook as WebhookIcon, Rss, Activity } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Para desenvolvedores — Registra Brasil',
  description: 'APIs, feeds, webhooks e guias de integração com o arquivo público Registra Brasil.',
  alternates: { canonical: '/desenvolvedores' },
  openGraph: {
    title: 'Recursos para desenvolvedores — Registra Brasil',
    description: 'APIs, feeds, webhooks e guias de integração.',
    type: 'website',
    url: `${SITE_URL}/desenvolvedores`,
    siteName: 'Registra Brasil',
  },
}

interface Section {
  icon: React.ReactNode
  title: string
  description: string
  items: { label: string; href: string; code?: string }[]
}

const SECTIONS: Section[] = [
  {
    icon: <Code2 className="w-5 h-5 text-blue-600" aria-hidden="true" />,
    title: 'APIs REST',
    description: 'Endpoints públicos para consultar declarações, políticos, categorias e estatísticas.',
    items: [
      { label: 'Documentação v2', href: '/api-docs' },
      { label: 'GET /api/v2/politicians', href: '/api/v2/politicians', code: 'GET /api/v2/politicians?limit=50' },
      { label: 'GET /api/v2/statements', href: '/api/v2/statements', code: 'GET /api/v2/statements?status=verified' },
      { label: 'GET /api/v2/categories', href: '/api/v2/categories' },
      { label: 'GET /api/v2/statistics', href: '/api/v2/statistics' },
      { label: 'GET /api/v2/statistics/by-state', href: '/api/v2/statistics/by-state' },
      { label: 'GET /api/v2/statistics/by-party', href: '/api/v2/statistics/by-party' },
    ],
  },
  {
    icon: <Rss className="w-5 h-5 text-orange-600" aria-hidden="true" />,
    title: 'Feeds',
    description: 'RSS e Atom para consumir novas declarações em leitores ou automações.',
    items: [
      { label: 'RSS 2.0', href: '/feed.xml' },
      { label: 'Atom', href: '/atom.xml' },
      { label: 'Feed por político', href: '/feed/politico/lula' },
      { label: 'Feed por categoria', href: '/feed/categoria/desinformacao' },
      { label: 'Feed por estado', href: '/feed/estado/SP' },
      { label: 'Feed por partido', href: '/feed/partido/PT' },
    ],
  },
  {
    icon: <WebhookIcon className="w-5 h-5 text-purple-600" aria-hidden="true" />,
    title: 'Webhooks',
    description: 'Receba notificações em tempo real quando uma declaração é publicada ou atualizada.',
    items: [
      { label: 'Registrar webhook (admin)', href: '/api/webhooks', code: 'POST /api/webhooks' },
      { label: 'Endpoint de teste', href: '/api/webhooks/test' },
    ],
  },
  {
    icon: <BookOpen className="w-5 h-5 text-green-600" aria-hidden="true" />,
    title: 'Embeds',
    description: 'Widgets prontos para incorporar em sites e posts.',
    items: [
      { label: 'oEmbed endpoint', href: '/api/oembed' },
      { label: 'Embed de declaração', href: '/embed/declaracao/:slug' },
      { label: 'Embed de político', href: '/embed/politico/:slug' },
    ],
  },
  {
    icon: <Activity className="w-5 h-5 text-red-600" aria-hidden="true" />,
    title: 'Status e monitoramento',
    description: 'Saúde da plataforma e histórico de atividade.',
    items: [
      { label: 'Endpoint /api/health', href: '/api/health' },
      { label: 'Página de status', href: '/status' },
      { label: 'Changelog público', href: '/changelog' },
    ],
  },
]

const DEV_JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'TechArticle',
  headline: 'Recursos para desenvolvedores — Registra Brasil',
  description: 'APIs REST, feeds RSS/Atom, webhooks e embeds do Registra Brasil.',
  proficiencyLevel: 'Beginner',
  inLanguage: 'pt-BR',
  url: `${SITE_URL}/desenvolvedores`,
  author: {
    '@type': 'Organization',
    name: 'Registra Brasil',
    url: SITE_URL,
  },
}

export default function DesenvolvedoresPage() {
  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(DEV_JSON_LD) }}
      />

      <Breadcrumbs items={[{ label: 'Desenvolvedores' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Code2 className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Para desenvolvedores</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          O Registra Brasil expõe o arquivo inteiro via APIs públicas, feeds RSS, webhooks e embeds.
          Uso livre para jornalismo, pesquisa, checagem de fatos e produtos derivados, sob a
          licença <a href="https://creativecommons.org/licenses/by/4.0/deed.pt-BR" className="text-blue-700 underline" rel="noopener noreferrer" target="_blank">CC BY 4.0</a>.
        </p>
      </header>

      <div className="mb-10 bg-blue-50 border border-blue-200 rounded-lg p-4 flex gap-3">
        <Key className="w-5 h-5 text-blue-700 shrink-0 mt-0.5" aria-hidden="true" />
        <div className="text-sm text-blue-900">
          <strong>Sem chave de API necessária para leituras públicas.</strong> Rate limits padrão:{' '}
          <span className="font-mono">100 req/min</span> para endpoints v2 públicos,{' '}
          <span className="font-mono">30 req/min</span> para busca.
        </div>
      </div>

      <div className="space-y-8">
        {SECTIONS.map((section) => (
          <section key={section.title} className="bg-white border border-gray-200 rounded-lg p-6">
            <div className="flex items-center gap-2 mb-2">
              {section.icon}
              <h2 className="text-xl font-semibold text-gray-900">{section.title}</h2>
            </div>
            <p className="text-gray-600 mb-4">{section.description}</p>
            <ul className="space-y-1.5">
              {section.items.map((item) => (
                <li key={item.href} className="flex items-baseline gap-2">
                  <span className="text-gray-400" aria-hidden="true">›</span>
                  <Link href={item.href} className="text-blue-700 hover:underline font-medium">
                    {item.label}
                  </Link>
                  {item.code ? (
                    <code className="text-xs text-gray-500 font-mono bg-gray-100 px-1.5 py-0.5 rounded">
                      {item.code}
                    </code>
                  ) : null}
                </li>
              ))}
            </ul>
          </section>
        ))}
      </div>

      <section className="mt-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Exemplo: buscar políticos do PT</h2>
        <pre className="bg-gray-900 text-gray-100 rounded-lg p-4 text-sm overflow-x-auto">
{`curl "${SITE_URL}/api/v2/politicians?party=PT&limit=20" \\
  -H "Accept: application/json"`}
        </pre>
      </section>

      <section className="mt-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Exemplo: paginação por cursor</h2>
        <pre className="bg-gray-900 text-gray-100 rounded-lg p-4 text-sm overflow-x-auto">
{`# Primeira página
curl "${SITE_URL}/api/v2/statements?limit=50"

# Página seguinte (use o cursor retornado em pagination.next_cursor)
curl "${SITE_URL}/api/v2/statements?limit=50&cursor=eyJ2IjoiMjAyNS0xMi0xMSIsImlkIjoiLi4uIn0="`}
        </pre>
      </section>
    </main>
  )
}
