import type { ChangelogEntry } from '@/lib/utils/changelog'

export const CHANGELOG_ENTRIES: ChangelogEntry[] = [
  {
    date: '2026-04-15',
    version: '1.5.0',
    title: 'API publica v1 e melhorias no admin',
    type: 'feature',
    changes: [
      'Lancamento da API publica v1 com endpoints para declaracoes, politicos e categorias.',
      'Novo painel de configuracoes no admin.',
      'Pagina de FAQ com dados estruturados.',
      'Mapa do Brasil com densidade de declaracoes por estado.',
      'Nuvem de palavras das declaracoes mais recentes.',
    ],
  },
  {
    date: '2026-04-10',
    version: '1.4.0',
    title: 'Melhorias de acessibilidade e performance',
    type: 'improvement',
    changes: [
      'Toolbar de acessibilidade com controle de tamanho de texto e contraste.',
      'Indicador de progresso de leitura.',
      'Suporte a navegacao por teclado aprimorado.',
      'Otimizacao de imagens com placeholders.',
      'Banner de conexao lenta.',
    ],
  },
  {
    date: '2026-04-01',
    version: '1.3.0',
    title: 'Sistema de favoritos e visualizacoes recentes',
    type: 'feature',
    changes: [
      'Salvar declaracoes e politicos como favoritos.',
      'Historico de itens visualizados recentemente.',
      'Pagina de favoritos.',
      'Botao de compartilhamento com opcoes de WhatsApp e email.',
      'Botao de impressao.',
    ],
  },
  {
    date: '2026-03-20',
    version: '1.2.0',
    title: 'Estatisticas e comparacoes',
    type: 'feature',
    changes: [
      'Pagina de estatisticas com graficos interativos.',
      'Comparacao lado a lado de politicos.',
      'Linha do tempo de declaracoes.',
      'Filtros avancados na busca.',
    ],
  },
  {
    date: '2026-03-01',
    version: '1.1.0',
    title: 'Correcoes e melhorias gerais',
    type: 'fix',
    changes: [
      'Correcao de problemas de layout em dispositivos moveis.',
      'Melhoria na velocidade de carregamento.',
      'Correcao de links quebrados.',
      'Atualizacao de dependencias de seguranca.',
    ],
  },
  {
    date: '2026-02-15',
    version: '1.0.0',
    title: 'Lancamento inicial',
    type: 'feature',
    changes: [
      'Catalogo de declaracoes de politicos brasileiros.',
      'Perfis de politicos com informacoes detalhadas.',
      'Busca por texto completo.',
      'Categorias de declaracoes.',
      'Design responsivo e modo escuro.',
    ],
  },
]
