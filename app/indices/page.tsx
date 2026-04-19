import Link from 'next/link'
import type { Metadata } from 'next'
import {
  Compass, Clock, Trophy, ShieldCheck, BookOpen, Wrench, Database, Info,
} from 'lucide-react'

export const revalidate = 86400

export const metadata: Metadata = {
  title: 'Índice geral — Registra Brasil',
  description:
    'Mapa único de todas as páginas, relatórios e ferramentas oferecidas pelo Registra Brasil — navegação, cronológicos, análises, transparência, curadoria, dados e ferramentas.',
  alternates: { canonical: '/indices' },
  openGraph: {
    title: 'Índice geral — Registra Brasil',
    description: 'Mapa único de todas as seções do site.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

interface Item {
  href: string
  label: string
  desc: string
}

interface Group {
  title: string
  icon: React.ComponentType<{ className?: string; 'aria-hidden'?: boolean }>
  accent: string
  items: Item[]
}

const GROUPS: Group[] = [
  {
    title: 'Navegação',
    icon: Compass,
    accent: 'text-indigo-600',
    items: [
      { href: '/buscar', label: 'Buscar', desc: 'Busca full-text com filtros, sugestões e feed RSS por busca.' },
      { href: '/explorar', label: 'Explorar', desc: 'Navegue o arquivo com filtros facetados.' },
      { href: '/politicos', label: 'Políticos', desc: 'Diretório alfabético com filtros.' },
      { href: '/categorias', label: 'Categorias', desc: 'Temas editoriais com cores e descrições.' },
      { href: '/partidos', label: 'Partidos', desc: 'Siglas com feed RSS e análise dedicada.' },
      { href: '/estados', label: 'Estados', desc: 'Navegação por UF, cartograma em grade.' },
      { href: '/mapa', label: 'Mapa', desc: 'Tile map do Brasil colorido pelo volume de declarações.' },
      { href: '/fontes', label: 'Fontes', desc: 'Diretório de domínios citados e scorecard por veículo.' },
    ],
  },
  {
    title: 'Cronológico',
    icon: Clock,
    accent: 'text-sky-600',
    items: [
      { href: '/ao-vivo', label: 'Em tempo real', desc: '5 streams de atividade recente no mesmo painel.' },
      { href: '/declaracoes-recentes', label: 'Declarações recentes', desc: 'Últimas 30 adições cronológicas.' },
      { href: '/esta-semana', label: 'Esta semana', desc: 'Recap semanal com permalinks ISO por semana.' },
      { href: '/destaques', label: 'Destaques do mês', desc: 'Top 20 por gravidade, por mês do calendário.' },
      { href: '/retrospectiva/2024', label: 'Retrospectiva', desc: 'Balanço detalhado de um ano.' },
      { href: '/hoje-na-historia', label: 'Hoje na história', desc: 'Tudo que foi dito hoje nos anos anteriores.' },
      { href: '/linha-do-tempo', label: 'Linha do tempo', desc: 'Timeline global agrupada por mês.' },
      { href: '/agenda', label: 'Agenda política', desc: 'Eventos futuros selecionados pela equipe.' },
    ],
  },
  {
    title: 'Análises & rankings',
    icon: Trophy,
    accent: 'text-amber-600',
    items: [
      { href: '/top', label: 'Top de todos os tempos', desc: '3 leaderboards consolidados do acervo inteiro.' },
      { href: '/ranking', label: 'Ranking ponderado', desc: 'Score severidade × recência com modos.' },
      { href: '/severidade', label: 'Explorar por gravidade', desc: 'Índice pelos 5 níveis de severidade editorial.' },
      { href: '/tendencias', label: 'Tendências', desc: 'Sparkline por categoria com janela configurável.' },
      { href: '/crescimento', label: 'Crescimento do arquivo', desc: 'Curvas cumulativas ao longo dos anos.' },
      { href: '/analise/partidos-x-categorias', label: 'Partidos × categorias', desc: 'Heatmap de temas por sigla.' },
      { href: '/analise/estados-x-categorias', label: 'Estados × categorias', desc: 'Heatmap de temas por UF.' },
      { href: '/nuvem-de-palavras', label: 'Nuvem de palavras', desc: 'Termos mais frequentes do acervo.' },
      { href: '/estatisticas', label: 'Estatísticas', desc: 'Contagens e métricas globais.' },
    ],
  },
  {
    title: 'Transparência',
    icon: ShieldCheck,
    accent: 'text-emerald-600',
    items: [
      { href: '/transparencia', label: 'Métricas editoriais', desc: 'Indicadores públicos do processo.' },
      { href: '/registro-editorial', label: 'Registro editorial', desc: 'Feed de todas as revisões com motivo.' },
      { href: '/contradicoes', label: 'Contradições', desc: 'Pares onde um político contradiz a si mesmo.' },
      { href: '/fact-checks', label: 'Fact-checks', desc: 'Checagens externas indexadas.' },
      { href: '/retratacoes', label: 'Retratações', desc: 'Pedidos formais de correção.' },
      { href: '/atualizacoes', label: 'Atualizações', desc: 'Mudanças no produto.' },
      { href: '/changelog', label: 'Changelog', desc: 'Histórico técnico.' },
      { href: '/status', label: 'Status', desc: 'Disponibilidade de serviços.' },
    ],
  },
  {
    title: 'Curadoria editorial',
    icon: BookOpen,
    accent: 'text-rose-600',
    items: [
      { href: '/colecoes', label: 'Coleções', desc: 'Listas curadas com exportação CSV/JSON/BibTeX.' },
      { href: '/historias', label: 'Histórias', desc: 'Reportagens editoriais com statements embutidos.' },
      { href: '/narrativas', label: 'Narrativas', desc: 'Eixos narrativos que atravessam vários registros.' },
      { href: '/declaracao-do-dia', label: 'Declaração do dia', desc: 'Seleção diária da equipe.' },
      { href: '/boletim', label: 'Boletim semanal', desc: 'Resumos passados arquivados.' },
      { href: '/glossario', label: 'Glossário', desc: 'Termos políticos com definições.' },
    ],
  },
  {
    title: 'Ferramentas',
    icon: Wrench,
    accent: 'text-purple-600',
    items: [
      { href: '/comparar', label: 'Comparar políticos', desc: 'Duas páginas lado a lado.' },
      { href: '/comparar-declaracoes', label: 'Comparar declarações', desc: 'Duas falas com diff lexical.' },
      { href: '/quiz', label: 'Quiz', desc: 'De quem é a declaração? Jogo de memória política.' },
      { href: '/aleatoria', label: 'Me surpreenda', desc: 'Redireciona para um registro aleatório.' },
      { href: '/meus-alertas', label: 'Meus alertas', desc: 'Assinatura por email com filtros.' },
      { href: '/favoritos', label: 'Favoritos', desc: 'Marcações locais (sem conta).' },
      { href: '/perfil', label: 'Perfil', desc: 'Suas preferências e histórico de uso.' },
    ],
  },
  {
    title: 'Dados & APIs',
    icon: Database,
    accent: 'text-cyan-600',
    items: [
      { href: '/dados', label: 'Dados abertos', desc: 'Dumps completos em JSON e CSV.' },
      { href: '/api-docs', label: 'Documentação da API', desc: 'REST endpoints com exemplos.' },
      { href: '/desenvolvedores', label: 'Para devs', desc: 'Guia de integração.' },
      { href: '/assinar', label: 'Assinar (todos os feeds)', desc: 'RSS, Atom, email, JSON, por política ou categoria.' },
      { href: '/opensearch.xml', label: 'OpenSearch', desc: 'Integração com barra de busca do browser.' },
      { href: '/api/openapi.json', label: 'OpenAPI 3.1', desc: 'Spec para gerar clientes automáticos.' },
      { href: '/api/transparencia.json', label: 'transparencia.json', desc: 'Métricas editoriais via JSON.' },
    ],
  },
  {
    title: 'Sobre & legal',
    icon: Info,
    accent: 'text-gray-600',
    items: [
      { href: '/sobre', label: 'Sobre / Metodologia', desc: 'Como o arquivo é montado.' },
      { href: '/equipe', label: 'Equipe', desc: 'Pessoas por trás do projeto.' },
      { href: '/parceiros', label: 'Parceiros', desc: 'Aliados editoriais e técnicos.' },
      { href: '/financiamento', label: 'Financiamento', desc: 'De onde vêm os recursos.' },
      { href: '/contato', label: 'Contato', desc: 'Fale com a equipe.' },
      { href: '/imprensa', label: 'Imprensa', desc: 'Kit para jornalistas.' },
      { href: '/privacidade', label: 'Privacidade', desc: 'Política de dados.' },
      { href: '/termos', label: 'Termos', desc: 'Termos de uso.' },
      { href: '/acessibilidade', label: 'Acessibilidade', desc: 'Compromissos WCAG.' },
    ],
  },
]

export default function IndicesPage() {
  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <header className="mb-10">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Índice geral
        </p>
        <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          Tudo o que o Registra Brasil oferece
        </h1>
        <p className="mt-2 max-w-3xl text-gray-600 dark:text-gray-300">
          Um mapa único de todas as páginas de navegação, relatórios
          cronológicos, análises, dashboards de transparência, seções
          editoriais, ferramentas de leitor e dados abertos. Use como ponto
          de partida quando quiser lembrar o que está disponível.
        </p>
      </header>

      <div className="grid grid-cols-1 gap-8 md:grid-cols-2">
        {GROUPS.map((g) => {
          const Icon = g.icon
          return (
            <section key={g.title} className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
              <h2 className={`mb-4 flex items-center gap-2 text-lg font-semibold text-gray-900 dark:text-gray-100`}>
                <Icon className={`h-5 w-5 ${g.accent}`} aria-hidden />
                {g.title}
              </h2>
              <ul className="flex flex-col gap-3">
                {g.items.map((i) => (
                  <li key={i.href}>
                    <Link href={i.href} className="group block rounded px-1 py-0.5 -mx-1 hover:bg-gray-50 dark:hover:bg-gray-800">
                      <div className="flex items-baseline gap-2">
                        <span className="font-medium text-indigo-700 group-hover:underline dark:text-indigo-300">
                          {i.label}
                        </span>
                        <code className="text-[10px] text-gray-500 dark:text-gray-500">{i.href}</code>
                      </div>
                      <p className="text-xs text-gray-600 dark:text-gray-400">{i.desc}</p>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>
          )
        })}
      </div>

      <footer className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Além destas páginas canônicas, cada <em>político</em>,{' '}
          <em>categoria</em>, <em>partido</em>, <em>estado</em>, <em>coleção</em>{' '}
          e <em>ano</em> tem seus próprios sub-recursos: dossiê imprimível,
          vocabulário lexical, scorecard, trajetória, feed RSS dedicado e
          download CSV/JSON/BibTeX do acervo correspondente. Explore a partir
          dos índices acima.
        </p>
      </footer>
    </main>
  )
}
