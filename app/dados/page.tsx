import Link from 'next/link'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Download, FileJson, FileSpreadsheet, Rss, Code } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Dados abertos — Registra Brasil',
  description: 'Baixe o arquivo completo de declarações políticas em JSON, CSV, RSS ou via API pública.',
  keywords: ['dados abertos', 'JSON', 'CSV', 'API', 'RSS', 'políticos', 'declarações', 'Brasil'],
  alternates: { canonical: '/dados' },
  openGraph: {
    title: 'Dados abertos — Registra Brasil',
    description: 'Arquivo completo de declarações políticas em JSON, CSV, RSS ou via API pública.',
    type: 'website',
    url: `${SITE_URL}/dados`,
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary',
    title: 'Dados abertos — Registra Brasil',
    description: 'Arquivo completo de declarações em JSON, CSV, RSS ou via API pública.',
  },
}

interface Resource {
  title: string
  description: string
  href: string
  icon: React.ReactNode
  external?: boolean
  filename?: string
}

const RESOURCES: Resource[] = [
  {
    title: 'Exportar declarações (JSON)',
    description: 'Todas as declarações verificadas do arquivo em formato JSON. Ideal para análise ou reutilização.',
    href: '/api/export?format=json&status=verified&limit=2000',
    icon: <FileJson className="w-5 h-5 text-blue-600" aria-hidden="true" />,
    filename: 'registra-brasil-verificadas.json',
  },
  {
    title: 'Exportar declarações (CSV)',
    description: 'Mesma base em formato planilha — abre no Excel, LibreOffice, Google Sheets.',
    href: '/api/export?format=csv&status=verified&limit=2000',
    icon: <FileSpreadsheet className="w-5 h-5 text-green-600" aria-hidden="true" />,
    filename: 'registra-brasil-verificadas.csv',
  },
  {
    title: 'Feed RSS (Atom)',
    description: 'Acompanhe novas declarações em seu leitor RSS favorito.',
    href: '/feed.xml',
    icon: <Rss className="w-5 h-5 text-orange-600" aria-hidden="true" />,
  },
  {
    title: 'Feed Atom',
    description: 'Versão Atom do feed para maior compatibilidade.',
    href: '/atom.xml',
    icon: <Rss className="w-5 h-5 text-orange-600" aria-hidden="true" />,
  },
  {
    title: 'API pública v2',
    description: 'REST API com paginação por cursor, seleção de campos, filtros múltiplos e rate limit de 100 req/min.',
    href: '/api-docs',
    icon: <Code className="w-5 h-5 text-purple-600" aria-hidden="true" />,
  },
  {
    title: 'Sitemap',
    description: 'Lista completa de páginas públicas indexáveis.',
    href: '/sitemap.xml',
    icon: <Download className="w-5 h-5 text-gray-600" aria-hidden="true" />,
  },
]

const DATASET_JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'Dataset',
  name: 'Registra Brasil — Arquivo de declarações políticas',
  description:
    'Arquivo público de declarações de políticos brasileiros com ligação obrigatória a fontes primárias.',
  url: `${SITE_URL}/dados`,
  license: 'https://creativecommons.org/licenses/by/4.0/',
  creator: {
    '@type': 'Organization',
    name: 'Registra Brasil',
    url: SITE_URL,
  },
  inLanguage: 'pt-BR',
  keywords: 'Brasil, políticos, declarações, verificação de fatos, fontes primárias, jornalismo',
  distribution: [
    {
      '@type': 'DataDownload',
      encodingFormat: 'application/json',
      contentUrl: `${SITE_URL}/api/export?format=json&status=verified`,
    },
    {
      '@type': 'DataDownload',
      encodingFormat: 'text/csv',
      contentUrl: `${SITE_URL}/api/export?format=csv&status=verified`,
    },
    {
      '@type': 'DataDownload',
      encodingFormat: 'application/atom+xml',
      contentUrl: `${SITE_URL}/atom.xml`,
    },
  ],
}

export default function DadosPage() {
  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(DATASET_JSON_LD) }}
      />

      <Breadcrumbs items={[{ label: 'Dados abertos' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Download className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Dados abertos</h1>
        </div>
        <p className="text-gray-600 max-w-2xl leading-relaxed">
          Todo o conteúdo do Registra Brasil está disponível para download e consulta automatizada.
          Use para pesquisa acadêmica, reportagem, análise de dados ou para construir produtos
          derivados. A licença é{' '}
          <a
            href="https://creativecommons.org/licenses/by/4.0/deed.pt-BR"
            className="text-blue-700 underline"
            rel="noopener noreferrer"
            target="_blank"
          >
            Creative Commons Atribuição 4.0 (CC BY 4.0)
          </a>
          {' '}— basta atribuir autoria ao reutilizar.
        </p>
      </header>

      <section className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {RESOURCES.map((r) => {
          const isExternal = r.external ?? false
          const commonProps = {
            className:
              'group flex gap-4 p-5 bg-white border border-gray-200 rounded-lg hover:border-blue-400 hover:shadow-sm transition-all',
          }
          const content = (
            <>
              <div className="shrink-0 pt-1">{r.icon}</div>
              <div className="flex-1 min-w-0">
                <h2 className="font-semibold text-gray-900 group-hover:text-blue-700">
                  {r.title}
                </h2>
                <p className="text-sm text-gray-600 mt-1">{r.description}</p>
              </div>
            </>
          )
          if (isExternal) {
            return (
              <a
                key={r.href}
                href={r.href}
                rel="noopener noreferrer"
                target="_blank"
                {...commonProps}
              >
                {content}
              </a>
            )
          }
          return (
            <Link
              key={r.href}
              href={r.href}
              {...(r.filename ? { download: r.filename } : {})}
              {...commonProps}
            >
              {content}
            </Link>
          )
        })}
      </section>

      <section className="mt-12">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Como citar</h2>
        <pre className="bg-gray-100 border border-gray-200 rounded-lg p-4 text-sm overflow-x-auto">
{`Registra Brasil (${new Date().getFullYear()}). Arquivo de declarações políticas.
Disponível em: ${SITE_URL}. Licença: CC BY 4.0.`}
        </pre>
      </section>

      <section className="mt-10 text-sm text-gray-600">
        <h2 className="text-base font-semibold text-gray-900 mb-2">Limites e notas</h2>
        <ul className="list-disc list-inside space-y-1">
          <li>Exportações via /api/export são limitadas a 2.000 registros por requisição.</li>
          <li>Rate limit: 10 exportações por minuto por IP.</li>
          <li>Para volumes maiores, entre em <Link href="/contato" className="underline">contato</Link>.</li>
          <li>
            A API v2 suporta paginação por cursor — veja a{' '}
            <Link href="/api-docs" className="underline">documentação da API</Link>.
          </li>
        </ul>
      </section>
    </main>
  )
}
