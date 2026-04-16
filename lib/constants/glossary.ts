export interface GlossaryTerm {
  term: string
  slug: string
  definition: string
  category: 'processo' | 'instituicao' | 'cargo' | 'conceito' | 'legislacao'
}

export const GLOSSARY_TERMS: GlossaryTerm[] = [
  {
    term: 'Assembleia Legislativa',
    slug: 'assembleia-legislativa',
    definition: 'Orgao do Poder Legislativo estadual, composto por deputados estaduais eleitos pelo povo. Cada estado brasileiro possui uma Assembleia Legislativa responsavel por elaborar leis estaduais.',
    category: 'instituicao',
  },
  {
    term: 'Camara dos Deputados',
    slug: 'camara-dos-deputados',
    definition: 'Casa legislativa federal que, junto com o Senado Federal, compoe o Congresso Nacional. Formada por 513 deputados federais eleitos pelo sistema proporcional.',
    category: 'instituicao',
  },
  {
    term: 'CPI (Comissao Parlamentar de Inquerito)',
    slug: 'cpi',
    definition: 'Comissao temporaria criada pelo Legislativo para investigar fato determinado de relevante interesse publico. Possui poderes de investigacao proprios das autoridades judiciais.',
    category: 'processo',
  },
  {
    term: 'Deputado Federal',
    slug: 'deputado-federal',
    definition: 'Representante eleito pelo povo para a Camara dos Deputados. O Brasil possui 513 deputados federais, distribuidos proporcionalmente entre os estados.',
    category: 'cargo',
  },
  {
    term: 'Diario Oficial',
    slug: 'diario-oficial',
    definition: 'Publicacao oficial do governo para divulgacao de atos normativos, leis, decretos e demais informacoes de interesse publico. Existe em nivel federal, estadual e municipal.',
    category: 'instituicao',
  },
  {
    term: 'Emenda Constitucional',
    slug: 'emenda-constitucional',
    definition: 'Alteracao formal ao texto da Constituicao Federal. Requer aprovacao em dois turnos por tres quintos dos votos em ambas as casas do Congresso Nacional.',
    category: 'legislacao',
  },
  {
    term: 'Impeachment',
    slug: 'impeachment',
    definition: 'Processo politico-juridico para afastar do cargo o Presidente da Republica, governadores ou prefeitos por crime de responsabilidade. E conduzido pelo Poder Legislativo.',
    category: 'processo',
  },
  {
    term: 'Lei Complementar',
    slug: 'lei-complementar',
    definition: 'Tipo de norma juridica que exige maioria absoluta para aprovacao. E usada para regulamentar materias expressamente previstas na Constituicao.',
    category: 'legislacao',
  },
  {
    term: 'Lei Ordinaria',
    slug: 'lei-ordinaria',
    definition: 'Tipo mais comum de lei, aprovada por maioria simples. Regula materias que nao exigem lei complementar ou emenda constitucional.',
    category: 'legislacao',
  },
  {
    term: 'Medida Provisoria (MP)',
    slug: 'medida-provisoria',
    definition: 'Instrumento com forca de lei adotado pelo Presidente da Republica em casos de relevancia e urgencia. Tem validade de 60 dias, prorrogaveis por mais 60, e deve ser aprovada pelo Congresso.',
    category: 'legislacao',
  },
  {
    term: 'Plenario',
    slug: 'plenario',
    definition: 'Espaco fisico e instancia maxima de deliberacao de uma casa legislativa, onde todos os parlamentares podem votar. Decisoes importantes sao tomadas em sessoes plenarias.',
    category: 'conceito',
  },
  {
    term: 'Projeto de Lei (PL)',
    slug: 'projeto-de-lei',
    definition: 'Proposta de nova lei apresentada por parlamentares, pelo Executivo ou por iniciativa popular. Passa por comissoes e votacao em plenario antes de ser sancionada.',
    category: 'processo',
  },
  {
    term: 'Quorum',
    slug: 'quorum',
    definition: 'Numero minimo de parlamentares que devem estar presentes para que uma sessao ou votacao seja valida. Varia conforme o tipo de materia em votacao.',
    category: 'conceito',
  },
  {
    term: 'Requerimento',
    slug: 'requerimento',
    definition: 'Instrumento pelo qual um parlamentar solicita alguma providencia ao presidente da casa ou a uma comissao. Pode ser de informacao, convocacao, entre outros.',
    category: 'processo',
  },
  {
    term: 'Senado Federal',
    slug: 'senado-federal',
    definition: 'Casa legislativa que representa os estados e o Distrito Federal no Congresso Nacional. Composto por 81 senadores, tres por unidade da federacao, eleitos para mandatos de 8 anos.',
    category: 'instituicao',
  },
  {
    term: 'Senador',
    slug: 'senador',
    definition: 'Representante eleito para o Senado Federal. Cada estado e o DF elegem tres senadores para mandatos de oito anos.',
    category: 'cargo',
  },
  {
    term: 'STF (Supremo Tribunal Federal)',
    slug: 'stf',
    definition: 'Corte constitucional do Brasil e orgao maximo do Poder Judiciario. Composto por 11 ministros nomeados pelo Presidente e aprovados pelo Senado.',
    category: 'instituicao',
  },
  {
    term: 'TCU (Tribunal de Contas da Uniao)',
    slug: 'tcu',
    definition: 'Orgao de controle externo que auxilia o Congresso Nacional na fiscalizacao contabil, financeira e orcamentaria da Uniao.',
    category: 'instituicao',
  },
  {
    term: 'TSE (Tribunal Superior Eleitoral)',
    slug: 'tse',
    definition: 'Orgao maximo da Justica Eleitoral brasileira. Responsavel por organizar eleicoes, julgar processos eleitorais e registrar partidos politicos.',
    category: 'instituicao',
  },
  {
    term: 'Vereador',
    slug: 'vereador',
    definition: 'Representante eleito pelo povo para a Camara Municipal. Responsavel por elaborar leis municipais e fiscalizar o Poder Executivo local.',
    category: 'cargo',
  },
  {
    term: 'Veto',
    slug: 'veto',
    definition: 'Ato do chefe do Poder Executivo que rejeita total ou parcialmente um projeto de lei aprovado pelo Legislativo. Pode ser derrubado por votacao do Congresso.',
    category: 'processo',
  },
  {
    term: 'Votacao Nominal',
    slug: 'votacao-nominal',
    definition: 'Tipo de votacao em que o voto de cada parlamentar e registrado individualmente e publicamente. E o metodo mais transparente de deliberacao.',
    category: 'conceito',
  },
  {
    term: 'Whip (Lider de Bancada)',
    slug: 'lider-de-bancada',
    definition: 'Parlamentar escolhido por seu partido para coordenar a atuacao da bancada, negociar com o governo e orientar os colegas nas votacoes.',
    category: 'cargo',
  },
  {
    term: 'Coligacao',
    slug: 'coligacao',
    definition: 'Alianca entre dois ou mais partidos politicos para disputar eleicoes majoritarias. Desde 2020, coligacoes sao proibidas em eleicoes proporcionais.',
    category: 'conceito',
  },
  {
    term: 'Federacao Partidaria',
    slug: 'federacao-partidaria',
    definition: 'Uniao de dois ou mais partidos que atuam como se fossem um unico partido por pelo menos quatro anos. Criada pela reforma eleitoral de 2021.',
    category: 'conceito',
  },
  {
    term: 'Fundo Eleitoral',
    slug: 'fundo-eleitoral',
    definition: 'Fundo Especial de Financiamento de Campanha (FEFC), recurso publico destinado ao financiamento das campanhas eleitorais dos candidatos.',
    category: 'conceito',
  },
  {
    term: 'Fundo Partidario',
    slug: 'fundo-partidario',
    definition: 'Recurso publico destinado aos partidos politicos para manutencao de suas atividades. Distribuido com base na representacao de cada partido no Congresso.',
    category: 'conceito',
  },
  {
    term: 'Governador',
    slug: 'governador',
    definition: 'Chefe do Poder Executivo estadual, eleito pelo voto direto para mandato de quatro anos com possibilidade de uma reeleicao.',
    category: 'cargo',
  },
  {
    term: 'Prefeito',
    slug: 'prefeito',
    definition: 'Chefe do Poder Executivo municipal, eleito pelo voto direto para mandato de quatro anos com possibilidade de uma reeleicao.',
    category: 'cargo',
  },
  {
    term: 'Presidente da Republica',
    slug: 'presidente-da-republica',
    definition: 'Chefe de Estado e de governo do Brasil, eleito pelo voto direto em dois turnos para mandato de quatro anos com possibilidade de uma reeleicao.',
    category: 'cargo',
  },
]

export const GLOSSARY_CATEGORIES: Record<string, string> = {
  processo: 'Processos Legislativos',
  instituicao: 'Instituicoes',
  cargo: 'Cargos Politicos',
  conceito: 'Conceitos',
  legislacao: 'Legislacao',
}
