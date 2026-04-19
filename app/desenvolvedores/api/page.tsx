import Link from 'next/link'
import type { Metadata } from 'next'
import { Code, Copy } from 'lucide-react'

export const revalidate = 86400

export const metadata: Metadata = {
  title: 'Explorador da API — Registra Brasil',
  description:
    'Lista interativa de todos os endpoints JSON públicos do Registra Brasil — stats, busca, diretórios, recaps e scorecards — com exemplos prontos para curl.',
  alternates: { canonical: '/desenvolvedores/api' },
  openGraph: {
    title: 'Explorador da API — Registra Brasil',
    description: 'Lista interativa de todos os endpoints JSON públicos.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

interface Endpoint {
  method: 'GET'
  path: string
  desc: string
  params?: Array<{ name: string; desc: string }>
  example?: string
}

interface Group {
  title: string
  items: Endpoint[]
}

const GROUPS: Group[] = [
  {
    title: 'Stats globais',
    items: [
      { method: 'GET', path: '/api/stats.json', desc: 'Snapshot do acervo inteiro: totais, verificados, disputados, contradições, checagens.' },
      { method: 'GET', path: '/api/top.json', desc: 'Leaderboards all-time: top 20 por gravidade, 20 políticos, 20 categorias.' },
      { method: 'GET', path: '/api/esta-semana.json', desc: 'Recap da semana ISO atual em JSON.' },
      { method: 'GET', path: '/api/transparencia.json', desc: 'Métricas editoriais mensais detalhadas (rota legada).' },
    ],
  },
  {
    title: 'Diretórios',
    items: [
      { method: 'GET', path: '/api/politicos.json', desc: 'Diretório de políticos ativos.', params: [{ name: 'ativo', desc: 'false inclui inativos' }] },
      { method: 'GET', path: '/api/categorias.json', desc: 'Todas as categorias editoriais (slug/label/cor).' },
      { method: 'GET', path: '/api/partidos.json', desc: 'Partidos com contagem de políticos ativos.' },
      { method: 'GET', path: '/api/estados.json', desc: '27 UFs com contagem de políticos e declarações.' },
      { method: 'GET', path: '/api/colecoes.json', desc: 'Coleções publicadas com contagem de declarações.' },
      { method: 'GET', path: '/api/historias.json', desc: 'Histórias editoriais publicadas.' },
      { method: 'GET', path: '/api/contradicoes.json', desc: 'Contradições publicadas.', params: [{ name: 'limite', desc: '1..200 (padrão 50)' }] },
      { method: 'GET', path: '/api/fact-checks.json', desc: 'Checagens externas indexadas.', params: [{ name: 'rating', desc: 'filtrar por veredito' }, { name: 'limite', desc: '1..200' }] },
      { method: 'GET', path: '/api/agenda.json', desc: 'Eventos políticos curados.', params: [{ name: 'escopo', desc: 'upcoming | past | all' }, { name: 'limite', desc: '1..200' }] },
    ],
  },
  {
    title: 'Fluxos / atividade',
    items: [
      { method: 'GET', path: '/api/recent.json', desc: 'Últimas declarações por created_at desc.', params: [{ name: 'limite', desc: '1..100' }, { name: 'page', desc: '1..20' }] },
      { method: 'GET', path: '/api/hoje-na-historia.json', desc: 'Declarações no mesmo MM-DD de qualquer ano.', params: [{ name: 'data', desc: 'MM-DD (padrão hoje)' }] },
      { method: 'GET', path: '/api/search.json', desc: 'Busca JSON com os mesmos filtros de /buscar.', params: [{ name: 'q', desc: 'texto' }, { name: 'categoria', desc: 'slug ou array' }, { name: 'politico', desc: 'slug' }, { name: 'partido/estado/de/ate/status', desc: 'filtros' }, { name: 'limite', desc: '1..100' }, { name: 'page', desc: '≥ 1' }] },
      { method: 'GET', path: '/api/ranking.json', desc: 'Ranking ponderado (severidade × decaimento).' },
      { method: 'GET', path: '/api/severidade.json', desc: 'Contagens por nível de severidade.' },
      { method: 'GET', path: '/api/linha-do-tempo.json', desc: 'Linha do tempo global agrupada por mês.', params: [{ name: 'limite', desc: '1..200' }] },
    ],
  },
  {
    title: 'Análise',
    items: [
      { method: 'GET', path: '/api/destaques.json', desc: 'Recap mensal (top severidade, políticos, categorias).', params: [{ name: 'mes', desc: 'YYYY-MM' }] },
      { method: 'GET', path: '/api/crescimento.json', desc: 'Crescimento acumulado mês a mês.', params: [{ name: 'meses', desc: '12..120' }] },
      { method: 'GET', path: '/api/tendencias.json', desc: 'Série por categoria com delta_pct.', params: [{ name: 'janela', desc: '12..60 meses' }] },
      { method: 'GET', path: '/api/analise/partidos-x-categorias.json', desc: 'Matriz partido × categoria.', params: [{ name: 'partidos', desc: '5..30' }, { name: 'categorias', desc: '5..20' }, { name: 'normalizar', desc: '1 para %' }] },
      { method: 'GET', path: '/api/analise/estados-x-categorias.json', desc: 'Matriz UF × categoria.', params: [{ name: 'estados', desc: '5..27' }, { name: 'categorias', desc: '5..20' }, { name: 'normalizar', desc: '1 para %' }] },
    ],
  },
  {
    title: 'Escopos individuais',
    items: [
      { method: 'GET', path: '/api/politico/:slug/stats.json', desc: 'Scorecard completo de um político em JSON.' },
      { method: 'GET', path: '/api/politico/:slug/timeline.json', desc: 'Timeline cronológica de um político.', params: [{ name: 'limite', desc: '1..200' }] },
      { method: 'GET', path: '/api/politico/:slug/categorias.json', desc: 'Breakdown do político por categoria (primária e total).' },
      { method: 'GET', path: '/api/politico/:slug/similar.json', desc: 'Políticos similares por categoria compartilhada.', params: [{ name: 'limite', desc: '1..20' }] },
      { method: 'GET', path: '/api/politico/:slug/contradictions.json', desc: 'Contradições publicadas do político (ambos os lados inlinados).' },
      { method: 'GET', path: '/api/politico/:slug/fact-checks.json', desc: 'Checagens externas cruzadas para declarações do político.', params: [{ name: 'limite', desc: '1..200' }] },
      { method: 'GET', path: '/api/politico/:slug/sparkline.json', desc: 'Contagem mensal de declarações (12 buckets).', params: [{ name: 'meses', desc: '3..24' }] },
      { method: 'GET', path: '/api/declaracao/:id/related.json', desc: 'Declarações relacionadas (mesmo político + mesma categoria).', params: [{ name: 'limite', desc: '1..30' }] },
      { method: 'GET', path: '/api/declaracao/:id/fact-checks.json', desc: 'Checagens externas indexadas para uma declaração.' },
      { method: 'GET', path: '/api/boletim.json', desc: 'Conteúdo do boletim semanal (mesmo ranking do email).', params: [{ name: 'top', desc: '3..30' }] },
      { method: 'GET', path: '/api/atualizacoes.json', desc: 'Log público de correções editoriais em JSON.', params: [{ name: 'limite', desc: '1..200' }] },
    ],
  },
  {
    title: 'JSON Feed 1.1',
    items: [
      { method: 'GET', path: '/feed.json', desc: 'Feed global em formato JSON Feed 1.1 (alternativa a /feed.xml).' },
      { method: 'GET', path: '/politico/:slug/feed.json', desc: 'Per-político em JSON Feed.' },
      { method: 'GET', path: '/categorias/:slug/feed.json', desc: 'Per-categoria em JSON Feed.' },
      { method: 'GET', path: '/partidos/:slug/feed.json', desc: 'Per-partido em JSON Feed.' },
      { method: 'GET', path: '/estados/:uf/feed.json', desc: 'Per-UF em JSON Feed.' },
      { method: 'GET', path: '/colecao/:slug/feed.json', desc: 'Per-coleção em JSON Feed (ordenada pela curadoria).' },
      { method: 'GET', path: '/api/comparar.json', desc: 'Compara dois políticos (id ou slug).', params: [{ name: 'a', desc: 'id ou slug do primeiro' }, { name: 'b', desc: 'id ou slug do segundo' }] },
      { method: 'GET', path: '/api/timeline.json', desc: 'Timeline global com filtro opcional de escopo.', params: [{ name: 'categoria', desc: 'slug' }, { name: 'partido', desc: 'sigla' }, { name: 'estado', desc: 'UF' }, { name: 'limite', desc: '1..200' }] },
      { method: 'GET', path: '/api/retrospectiva/:year.json', desc: 'Resumo agregado do ano (top políticos, categorias, revisões).' },
      { method: 'GET', path: '/api/aleatoria.json', desc: 'Uma declaração verificada aleatória.', params: [{ name: 'inclui_contestadas', desc: '1 para incluir disputed' }] },
      { method: 'GET', path: '/api/categorias/:slug/stats.json', desc: 'Agregados por categoria.' },
      { method: 'GET', path: '/api/partidos/:slug/stats.json', desc: 'Agregados por partido.' },
      { method: 'GET', path: '/api/estados/:uf/stats.json', desc: 'Agregados por UF (2 letras).' },
    ],
  },
  {
    title: 'Citações e declarações',
    items: [
      { method: 'GET', path: '/api/declaracao/:id/cite.txt', desc: 'Citação ABNT-ish em texto puro.' },
      { method: 'GET', path: '/api/declaracao/:id/cite.md', desc: 'Citação em Markdown (blockquote + metadados).' },
    ],
  },
  {
    title: 'Exports em massa',
    items: [
      { method: 'GET', path: '/api/colecao/:slug/export', desc: 'CSV/JSON/BibTeX de toda uma coleção.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/politico/:slug/export', desc: 'CSV/JSON/BibTeX de um político.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/categorias/:slug/export', desc: 'CSV/JSON/BibTeX de uma categoria.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/partidos/:slug/export', desc: 'CSV/JSON/BibTeX de um partido.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/estados/:uf/export', desc: 'CSV/JSON/BibTeX de uma UF.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/dump/year/:year', desc: 'Dump anual completo.', params: [{ name: 'format', desc: 'csv | json | bibtex' }] },
      { method: 'GET', path: '/api/dump/statements', desc: 'Dump global do acervo.' },
      { method: 'GET', path: '/api/dump/politicians', desc: 'Dump dos políticos.' },
      { method: 'GET', path: '/api/dump/categories', desc: 'Dump das categorias.' },
      { method: 'GET', path: '/api/dump/revisions', desc: 'Dump de statement_revisions (log completo de correções).', params: [{ name: 'format', desc: 'csv | json' }] },
      { method: 'GET', path: '/api/dump/fact-checks', desc: 'Dump das checagens externas indexadas.', params: [{ name: 'format', desc: 'csv | json' }] },
      { method: 'GET', path: '/api/dump/contradictions', desc: 'Dump dos pares de contradição publicados.', params: [{ name: 'format', desc: 'csv | json' }] },
      { method: 'GET', path: '/api/dump/statement-categories', desc: 'Join statement_id × category_id (com is_primary).', params: [{ name: 'format', desc: 'csv | json' }] },
      { method: 'GET', path: '/api/dump/collections', desc: 'Metadados das coleções editoriais publicadas.', params: [{ name: 'format', desc: 'csv | json' }] },
      { method: 'GET', path: '/api/declaracao/:id/revisions.json', desc: 'Log de revisões de uma declaração (por UUID ou slug).' },
    ],
  },
]

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export default function ApiExplorerPage() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <Code className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Para devs
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Explorador da API
          </h1>
          <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
            Todos os endpoints JSON públicos do Registra Brasil organizados por
            tema, com parâmetros e exemplos prontos para <code>curl</code>.
            Nenhum deles precisa de chave ou autenticação — basta respeitar
            os rate limits indicados (cabeçalho <code>Retry-After</code> ao
            exceder). Para RSS/Atom veja{' '}
            <Link href="/assinar" className="underline">/assinar</Link>.
          </p>
        </div>
      </header>

      {GROUPS.map((g) => (
        <section key={g.title} className="mb-8 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-gray-100">
            {g.title}
          </h2>
          <ul className="flex flex-col gap-4">
            {g.items.map((e) => (
              <li key={e.path} className="rounded-lg border border-gray-100 p-3 dark:border-gray-800">
                <div className="flex items-baseline gap-2">
                  <span className="rounded bg-emerald-100 px-1.5 py-0.5 text-[10px] font-semibold text-emerald-900 dark:bg-emerald-950/40 dark:text-emerald-200">
                    {e.method}
                  </span>
                  <code className="text-xs font-mono text-indigo-700 dark:text-indigo-300">{e.path}</code>
                </div>
                <p className="mt-1 text-sm text-gray-700 dark:text-gray-300">{e.desc}</p>
                {e.params && e.params.length > 0 && (
                  <ul className="mt-1 flex flex-wrap gap-2 text-xs text-gray-600 dark:text-gray-400">
                    {e.params.map((p) => (
                      <li key={p.name} className="rounded-full bg-gray-100 px-2 py-0.5 dark:bg-gray-800">
                        <code>{p.name}</code> — {p.desc}
                      </li>
                    ))}
                  </ul>
                )}
                <pre className="mt-2 overflow-x-auto rounded bg-gray-50 p-2 text-[11px] text-gray-700 dark:bg-gray-950 dark:text-gray-300">
                  <code>curl -s &apos;{SITE_URL}{e.path.replace(':slug', 'lula').replace(':uf', 'sp').replace(':id', 'abc123').replace(':year', '2025').replace(':date', '01-01')}&apos; | jq</code>
                </pre>
              </li>
            ))}
          </ul>
        </section>
      ))}

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Todos os endpoints ficam atrás de um CDN com cache de 5 a 60 min,
          retornam <code>Content-Type</code> adequado e seguem o padrão{' '}
          <code>{`{ ..., generated_at }`}</code> para quem precisa de
          cache-invalidation local. Dúvidas ou encontrou um bug?{' '}
          <Link href="/contato" className="underline">Fale com a equipe</Link>.
        </p>
      </footer>
    </main>
  )
}
