import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Changelog — Registra Brasil',
  description: 'Historico de atualizacoes e melhorias do Registra Brasil.',
  alternates: { canonical: '/changelog' },
}

interface ChangelogEntry {
  date: string
  version: string
  title: string
  changes: string[]
}

const CHANGELOG: ChangelogEntry[] = [
  {
    date: '2026-04-15',
    version: '1.5.0',
    title: 'API publica v1 e melhorias no admin',
    changes: [
      'Lancamento da API publica v1 com endpoints para declaracoes, politicos e categorias.',
      'Novo painel de configuracoes no admin.',
      'Pagina de FAQ com dados estruturados.',
      'Mapa do Brasil com densidade de declaracoes por estado.',
      'Nuvem de palavras das declaracoes mais recentes.',
    ],
  },
  {
    date: '2026-03-01',
    version: '1.4.0',
    title: 'Busca avancada e filtros',
    changes: [
      'Busca unificada com filtros por categoria, partido e estado.',
      'Comparador de politicos.',
      'Linha do tempo interativa.',
      'Feed RSS e Atom.',
    ],
  },
  {
    date: '2026-02-01',
    version: '1.3.0',
    title: 'Estatisticas e acessibilidade',
    changes: [
      'Pagina de estatisticas com graficos.',
      'Melhorias de acessibilidade (skip links, ARIA, alto contraste).',
      'Suporte a temas claro e escuro.',
    ],
  },
  {
    date: '2026-01-15',
    version: '1.2.0',
    title: 'Embeds e compartilhamento',
    changes: [
      'Widget de embed para sites externos.',
      'Compartilhamento social aprimorado.',
      'Imagens Open Graph dinamicas.',
    ],
  },
  {
    date: '2025-12-01',
    version: '1.1.0',
    title: 'Sistema de sugestoes',
    changes: [
      'Formulario de sugestao de declaracoes.',
      'Fila de revisao no painel admin.',
      'Notificacoes por email para editores.',
    ],
  },
  {
    date: '2025-11-01',
    version: '1.0.0',
    title: 'Lancamento inicial',
    changes: [
      'Arquivo de declaracoes de politicos brasileiros.',
      'Verificacao de fontes primarias.',
      'Perfil de politicos com historico.',
    ],
  },
]

export default function ChangelogPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Changelog</h1>
      <p className="text-gray-500 mb-10">
        Historico de atualizacoes e melhorias do Registra Brasil.
      </p>

      <div className="space-y-0">
        {CHANGELOG.map((entry, index) => (
          <article
            key={entry.version}
            className="relative pl-8 pb-10 border-l-2 border-gray-200 last:border-l-0"
          >
            {/* Timeline dot */}
            <div className={`absolute -left-[9px] top-0 w-4 h-4 rounded-full border-2 border-white ${
              index === 0 ? 'bg-blue-600' : 'bg-gray-300'
            }`} />

            <div className="flex flex-wrap items-baseline gap-3 mb-2">
              <span className="text-xs font-mono font-medium text-blue-600 bg-blue-50 px-2 py-0.5 rounded">
                v{entry.version}
              </span>
              <time
                dateTime={entry.date}
                className="text-sm text-gray-400"
              >
                {new Date(entry.date).toLocaleDateString('pt-BR', {
                  year: 'numeric', month: 'long', day: 'numeric',
                })}
              </time>
            </div>

            <h2 className="text-lg font-semibold text-gray-900 mb-2">
              {entry.title}
            </h2>

            <ul className="space-y-1">
              {entry.changes.map((change) => (
                <li key={change} className="text-sm text-gray-600 flex items-start gap-2">
                  <span className="text-gray-300 mt-1.5 flex-shrink-0">&#8226;</span>
                  {change}
                </li>
              ))}
            </ul>
          </article>
        ))}
      </div>
    </main>
  )
}
