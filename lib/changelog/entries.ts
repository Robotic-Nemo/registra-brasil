/**
 * Canonical changelog for the public /changelog page and its RSS
 * feed. Entries are authored manually (not auto-generated from git)
 * so the narrative stays editorial. Newest first.
 */

export interface ChangelogEntry {
  date: string         // YYYY-MM-DD
  version: string
  title: string
  changes: string[]
}

export const CHANGELOG: ChangelogEntry[] = [
  {
    date: '2026-04-18',
    version: '2.5.0',
    title: 'Inbox editorial, fila priorizada e bulk-actions',
    changes: [
      'Admin "Sua fila do dia" com 5 prioridades ponderadas por SLA (retratações, submissões, reações, links quebrados, verificação).',
      'Categorização em lote: adicionar ou remover categoria de até 200 declarações com resolução de slug → UUID.',
      'Bulk-verify na fila de revisão: marca N declarações como verified/disputed/removed em uma ação, com motivo gravado no audit log.',
      'Feature flags controlados pelo admin (/admin/configuracoes-site) para pausar /sugerir, reações ou alertas sem deploy.',
      'Navegação A-Z de políticos e página /contexto/[data] com todas as declarações de um único dia.',
    ],
  },
  {
    date: '2026-04-18',
    version: '2.4.0',
    title: 'Transparência & arquivamento',
    changes: [
      'Detector diário de links quebrados (/admin/links-quebrados) com fallback automático para o Internet Archive.',
      'Botão "Arquivar agora" no admin dispara Save-Page-Now sob demanda.',
      'Extratos de biografia do Wikipédia sincronizados nightly para os 179 políticos.',
      'Gerador de citações acadêmicas (ABNT, APA, Chicago, MLA) inline em cada declaração.',
      'Paleta de comandos ⌘K com rotas estáticas + busca dinâmica via /api/suggest.',
    ],
  },
  {
    date: '2026-04-18',
    version: '2.3.0',
    title: 'Publicações editoriais',
    changes: [
      'Histórias editoriais (/historia/[slug]) — artigos longos com embeds de declarações e comentários.',
      'Coleções temáticas (/colecao/[slug]) com feed RSS próprio.',
      '"Declaração do dia" com agenda editorial e fallback automático.',
      'Retrospectiva anual (/retrospectiva/[year]) gerada a partir do acervo.',
      'Boletim semanal com arquivo público (/boletim) e cron de envio.',
    ],
  },
  {
    date: '2026-04-18',
    version: '2.2.0',
    title: 'Comunidade e direito de resposta',
    changes: [
      'Submissões públicas de declarações com dupla verificação antes de publicação.',
      'Pedido de retificação / direito de resposta (CF art. 5º V, Lei 13.188/2015) com fluxo de decisão e réplica pública.',
      'Reações anônimas em cada declaração (importante / contestada / fora-de-contexto / erro).',
      'Botão "Seguir por e-mail" em político, partido, estado e categoria.',
      '/meus-alertas — portal tokenizado para o usuário ver e cancelar seus alertas.',
    ],
  },
  {
    date: '2026-04-18',
    version: '2.1.0',
    title: 'Dados abertos completos',
    changes: [
      'Dump JSON/CSV do acervo inteiro (/api/dump/statements) com ETag estável.',
      'Especificação OpenAPI 3.1 cobrindo todos os endpoints públicos.',
      'Dashboard de transparência (/transparencia) com API JSON correspondente.',
      'Feeds RSS por político, partido, estado, categoria, coleção e atualização.',
      'Reliability: detecção de duplicatas por pg_trgm + ferramenta admin de merge.',
    ],
  },
  {
    date: '2026-04-17',
    version: '2.0.0',
    title: 'Re-fundação do produto',
    changes: [
      'Auditoria LGPD completa e consent banner conforme art. 8.',
      'Accessibilidade WCAG AA: contraste, focus-visible, labels e ARIA.',
      'Backfill de 178 fotos de políticos do Wikimedia Commons com atribuição.',
      'Revisões editoriais públicas via trigger (/atualizacoes), com log append-only.',
      'Score de atividade ponderado por severidade e decaimento temporal.',
    ],
  },
  {
    date: '2026-04-15',
    version: '1.5.0',
    title: 'API pública v1 e melhorias no admin',
    changes: [
      'API pública v1 com endpoints para declarações, políticos e categorias.',
      'Painel de configurações no admin.',
      'FAQ com dados estruturados.',
      'Mapa do Brasil com densidade de declarações por estado.',
    ],
  },
  {
    date: '2026-03-01',
    version: '1.4.0',
    title: 'Busca avançada e filtros',
    changes: [
      'Busca unificada com filtros por categoria, partido e estado.',
      'Comparador de políticos.',
      'Linha do tempo interativa.',
      'Feed RSS e Atom.',
    ],
  },
  {
    date: '2026-02-01',
    version: '1.3.0',
    title: 'Estatísticas e acessibilidade',
    changes: [
      'Estatísticas com gráficos.',
      'Skip links, ARIA, alto contraste.',
      'Suporte inicial a temas claro e escuro.',
    ],
  },
  {
    date: '2026-01-15',
    version: '1.2.0',
    title: 'Embeds e compartilhamento',
    changes: [
      'Widget de embed para sites externos.',
      'Compartilhamento social aprimorado.',
      'Imagens Open Graph dinâmicas.',
    ],
  },
  {
    date: '2025-12-01',
    version: '1.1.0',
    title: 'Sistema de sugestões',
    changes: [
      'Formulário de sugestão de declarações.',
      'Fila de revisão no painel admin.',
      'Notificações por e-mail para editores.',
    ],
  },
  {
    date: '2025-11-01',
    version: '1.0.0',
    title: 'Lançamento inicial',
    changes: [
      'Arquivo de declarações de políticos brasileiros.',
      'Verificação de fontes primárias.',
      'Perfil de políticos com histórico.',
    ],
  },
]
