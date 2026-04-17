-- Batch 46: Sergio Moro, Ciro Gomes, trocas partidárias, política estadual (2025–2026)
-- 50 statements sobre filiações, disputas regionais e eleições 2026

DO $$
DECLARE
  v_mor UUID; v_cir UUID; v_tar UUID; v_rom UUID; v_lir UUID;
  v_bou UUID; v_bol UUID; v_fla UUID; v_ren UUID; v_cai UUID;
  v_rat UUID; v_teb UUID; v_gle UUID; v_nik UUID; v_mou UUID;
  v_zem UUID; v_mic UUID; v_mot UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_cor UUID; c_irr UUID;
  c_aut UUID; c_con UUID; c_ame UUID; c_obs UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';

  -- 1. Moro filia-se ao PL para disputar governo do Paraná em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro anuncia filiação ao PL para disputar o governo do Paraná em 2026, reconciliando-se com o bolsonarismo.',
      'Estou me filiando ao PL porque é o partido que melhor representa o sentimento do povo paranaense e brasileiro por mudança. Quero ser governador do Paraná para levar ao estado o mesmo combate à corrupção que marquei na minha carreira.',
      'Moro anunciou filiação ao PL em evento em Curitiba em fevereiro de 2026, após meses de negociação com a cúpula do partido. A movimentação foi vista como reconciliação com o bolsonarismo após sua saída conturbada do governo Bolsonaro em 2020.',
      'verified', true, '2026-02-10',
      'https://www.gazetadopovo.com.br/politica/moro-filia-pl-governo-parana-2026/',
      'news_article',
      'Curitiba', 'Evento de filiação ao PL', 'moro-filia-pl-governo-parana-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 2. Moro defende a Ficha Limpa no Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro celebra manutenção da Ficha Limpa pelo Senado e diz que lei é pilar da democracia brasileira.',
      'A Ficha Limpa é um patrimônio da sociedade brasileira. Quem quer flexibilizar essa lei está a serviço dos corruptos, não do povo. O Senado preservou a essência da lei e o Brasil agradece.',
      'Pronunciamento de Moro no Senado Federal em setembro de 2025, após o plenário rejeitar emendas que enfraqueceriam a Lei da Ficha Limpa. A votação foi vista como derrota de articulações que buscavam beneficiar políticos condenados.',
      'verified', false, '2025-09-18',
      'https://www12.senado.leg.br/noticias/materias/2025/09/moro-ficha-limpa-patrimonio-democracia',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'moro-ficha-limpa-senado-setembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 3. Moro rebate PP que recusou apoiá-lo no Paraná
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro critica PP por não homologar apoio à sua candidatura e diz que União Brasil reforçou aliança.',
      'O PP pode ficar onde quiser, não preciso de quem não tem coragem de apoiar o combate à corrupção. O União Brasil já confirmou que está conosco e o eleitor do Paraná sabe quem é sério.',
      'Declaração de Moro em entrevista à RPC em março de 2026, após o PP do Paraná recusar homologar apoio à sua pré-candidatura ao governo. O União Brasil oficializou apoio na mesma semana.',
      'verified', false, '2026-03-08',
      'https://g1.globo.com/pr/parana/noticia/2026/03/moro-rebate-pp-uniao-brasil-parana.ghtml',
      'news_article',
      'Curitiba', 'Entrevista à RPC', 'moro-rebate-pp-uniao-brasil-parana-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 4. Moro "reata com bolsonarismo" ao filiar-se ao PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro nega que filiação ao PL signifique submissão a Bolsonaro e diz que "o partido é maior que qualquer pessoa".',
      'Não estou me submetendo a ninguém. O PL é maior do que qualquer pessoa, inclusive eu mesmo. Minha filiação é um projeto para o Paraná e para o Brasil, baseado em combate à corrupção e gestão eficiente.',
      'Moro respondeu a críticas sobre sua reconciliação com o bolsonarismo em coletiva de imprensa após a filiação ao PL em fevereiro de 2026. Analistas políticos apontaram contradição com suas críticas anteriores a Bolsonaro.',
      'verified', true, '2026-02-10',
      'https://www.poder360.com.br/poder/moro-filiacao-pl-nao-submissao-bolsonaro-2026/',
      'news_article',
      'Curitiba', 'Coletiva de imprensa pós-filiação', 'moro-nega-submissao-bolsonaro-pl-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 5. Moro rebate saída de prefeitos, diz que PL dobrou bancada no PR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro minimiza saída de prefeitos da sua base e afirma que PL dobrou bancada de vereadores no Paraná.',
      'Saem dois, entram dez. O PL dobrou sua bancada de vereadores no Paraná nas últimas eleições. Quem quer ficar do lado certo da história sabe onde estamos.',
      'Declaração de Moro em evento do PL em Londrina em janeiro de 2026, após prefeitos de cidades do interior do Paraná anunciarem apoio a outros pré-candidatos ao governo estadual.',
      'verified', false, '2026-01-20',
      'https://www.folhadelondrina.com.br/politica/moro-pl-dobrou-bancada-parana-2026.html',
      'news_article',
      'Londrina', 'Evento do PL no Paraná', 'moro-pl-dobrou-bancada-parana-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Moro ataca Ratinho Jr. e diz que Paraná precisa de renovação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro critica gestão Ratinho Jr. e diz que o Paraná precisa de um governador com coragem para enfrentar a corrupção.',
      'O Paraná tem potencial enorme, mas precisa de um governador que não tenha medo de enfrentar os esquemas de corrupção que existem no estado. Eu tenho essa experiência e essa coragem.',
      'Discurso de Moro em evento de pré-campanha em Maringá em março de 2026. A fala foi interpretada como crítica indireta ao governador Ratinho Jr., que deixará o cargo ao fim do mandato.',
      'verified', false, '2026-03-15',
      'https://www.gazetadopovo.com.br/politica/moro-pre-campanha-maringa-renovacao-parana-2026/',
      'news_article',
      'Maringá', 'Evento de pré-campanha', 'moro-renovacao-parana-maringa-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Moro defende segurança pública como prioridade no Paraná
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro promete transformar o Paraná em referência nacional de segurança pública com tolerância zero ao crime organizado.',
      'Minha prioridade será segurança pública. O Paraná vai ser referência nacional em combate ao crime organizado. Tolerância zero com o tráfico, com as facções, com a lavagem de dinheiro. Eu sei fazer isso.',
      'Declaração em entrevista à Band Curitiba em abril de 2026, onde Moro apresentou propostas para segurança pública caso eleito governador. Críticos apontaram que suas promessas eram genéricas e semelhantes ao discurso da Lava Jato.',
      'verified', false, '2026-04-02',
      'https://bandnewsfm.band.uol.com.br/curitiba/moro-seguranca-parana-tolerancia-zero-2026',
      'news_article',
      'Curitiba', 'Entrevista à Band Curitiba', 'moro-seguranca-parana-tolerancia-zero-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 8. Ciro Gomes deixa PDT e chama partido de "puxadinho do PT"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes anuncia saída do PDT chamando o partido de "puxadinho do PT" após décadas de filiação.',
      'O PDT virou um puxadinho do PT. Brizola deve estar se revirando no túmulo. Eu não abandonei o partido, o partido é que abandonou os seus princípios. Não dá para ficar em um partido que se submeteu ao lulismo.',
      'Ciro Gomes anunciou sua desfiliação do PDT em outubro de 2025, após meses de divergências com a direção nacional do partido. Ciro acusou o PDT de ter se submetido ao governo Lula em troca de cargos.',
      'verified', true, '2025-10-05',
      'https://www.folha.uol.com.br/poder/2025/10/ciro-gomes-deixa-pdt-puxadinho-pt.shtml',
      'news_article',
      'Fortaleza', 'Coletiva de imprensa', 'ciro-gomes-deixa-pdt-puxadinho-pt-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 9. Ciro filia-se ao PSDB e defende reconstrução do centro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes filia-se ao PSDB e defende construção de uma alternativa de centro e centro-esquerda no Brasil.',
      'O PSDB tem tradição democrática, tem história, tem quadros. Eu vim aqui para ajudar a reconstruir um centro, centro-esquerda forte no Brasil. Nem bolsonarismo nem lulismo. O Brasil precisa de uma terceira via real.',
      'Ciro formalizou filiação ao PSDB em evento em São Paulo em outubro de 2025, poucos dias após deixar o PDT. A ida ao PSDB surpreendeu parte da militância, já que o tucano era historicamente rival de Ciro no Ceará.',
      'verified', true, '2025-10-12',
      'https://www.estadao.com.br/politica/ciro-gomes-filia-psdb-centro-esquerda-2025/',
      'news_article',
      'São Paulo', 'Evento de filiação ao PSDB', 'ciro-gomes-filia-psdb-centro-esquerda-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Ciro quer disputar governo do Ceará em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes confirma intenção de disputar o governo do Ceará pelo PSDB em 2026.',
      'Meu projeto é o Ceará. Fui governador, conheço o estado, sei o que precisa ser feito. O Ceará precisa se libertar da oligarquia do PT que domina o estado há 20 anos. Estou pronto para essa disputa.',
      'Declaração de Ciro em entrevista ao O Povo em novembro de 2025, confirmando que pretende disputar o governo do Ceará em 2026 pelo PSDB. O estado é governado há décadas por aliados do PT/PDT.',
      'verified', false, '2025-11-08',
      'https://www.opovo.com.br/noticias/politica/2025/11/ciro-governo-ceara-psdb-2026.html',
      'news_article',
      'Fortaleza', 'Entrevista ao O Povo', 'ciro-gomes-governo-ceara-psdb-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 11. Ciro admite candidatura presidencial "em situação extrema"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes não descarta candidatura presidencial em 2026 caso surja "situação extrema" para o país.',
      'Meu foco é o Ceará, mas se o país precisar de mim em uma situação extrema, eu não vou me omitir. Já fui candidato três vezes, conheço o caminho. Mas não vou ser candidato a presidente por vaidade.',
      'Ciro fez a declaração em entrevista à CNN Brasil em dezembro de 2025. A fala abriu espaço para especulações de que poderia trocar a disputa pelo Ceará por uma nova candidatura presidencial.',
      'verified', false, '2025-12-15',
      'https://www.cnnbrasil.com.br/politica/ciro-gomes-candidatura-presidente-situacao-extrema-2025/',
      'news_article',
      'São Paulo', 'Entrevista à CNN Brasil', 'ciro-gomes-candidatura-presidente-situacao-extrema-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 12. Ciro critica Lula e Bolsonaro como "dois lados da mesma moeda"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes chama Lula e Bolsonaro de "dois lados da mesma moeda" e diz que o Brasil está refém da polarização.',
      'Lula e Bolsonaro são dois lados da mesma moeda. Um promete paraíso e entrega corrupção, outro promete ordem e entrega caos. O Brasil está refém dessa polarização doentia que só serve aos dois.',
      'Declaração de Ciro em sabatina do UOL em janeiro de 2026. Ciro tem usado a retórica de terceira via desde 2018 e intensificou a estratégia após filiar-se ao PSDB.',
      'verified', false, '2026-01-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2026/01/22/ciro-lula-bolsonaro-mesma-moeda.htm',
      'news_article',
      'São Paulo', 'Sabatina UOL', 'ciro-lula-bolsonaro-mesma-moeda-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Tarcísio admite possibilidade de disputar presidência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas admite pela primeira vez que considera disputar a presidência em 2026.',
      'Se o momento exigir, se o partido pedir, eu não vou fugir da responsabilidade. Mas meu compromisso é com São Paulo. A gente tem muito a entregar ainda.',
      'Tarcísio fez a declaração em entrevista à Folha de S.Paulo em agosto de 2025, abrindo pela primeira vez a possibilidade de ser candidato a presidente. A fala gerou grande repercussão na direita brasileira.',
      'verified', true, '2025-08-14',
      'https://www.folha.uol.com.br/poder/2025/08/tarcisio-admite-presidencia-2026.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de S.Paulo', 'tarcisio-admite-presidencia-agosto-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 14. Tarcísio volta atrás e confirma reeleição em SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas recua e confirma que vai disputar reeleição ao governo de São Paulo em 2026.',
      'Meu compromisso é com São Paulo. Eu fui eleito governador e vou completar essa missão. A reeleição é o caminho natural. Não vou abandonar 46 milhões de paulistas.',
      'Tarcísio recuou da possibilidade de disputar a presidência em entrevista à GloboNews em setembro de 2025, confirmando que buscará a reeleição. A decisão foi atribuída a pressões internas do governo paulista.',
      'verified', true, '2025-09-20',
      'https://g1.globo.com/sp/sao-paulo/noticia/2025/09/tarcisio-confirma-reeleicao-sp-2026.ghtml',
      'news_article',
      'São Paulo', 'Entrevista à GloboNews', 'tarcisio-confirma-reeleicao-sp-setembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 15. Tarcísio apoia Flávio Bolsonaro: "o Flávio é o meu candidato"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio declara apoio a Flávio Bolsonaro para a presidência e diz "o Flávio é o meu candidato".',
      'O Flávio é o meu candidato. Ele tem preparo, tem experiência no Senado, tem visão para o Brasil. A direita precisa de unidade e o Flávio é um nome que une.',
      'Tarcísio fez a declaração em evento do PL no Rio de Janeiro em janeiro de 2026, oficializando apoio a Flávio Bolsonaro como candidato à presidência. A fala consolidou a aliança Tarcísio-Flávio no campo da direita.',
      'verified', true, '2026-01-18',
      'https://www.poder360.com.br/poder/tarcisio-apoia-flavio-bolsonaro-presidente-2026/',
      'news_article',
      'Rio de Janeiro', 'Evento do PL', 'tarcisio-apoia-flavio-bolsonaro-presidente-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 16. Tarcísio diz que "direita terá mais nomes em 2026"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio afirma que a direita terá vários nomes competitivos em 2026 e não precisa depender de um único líder.',
      'A direita brasileira cresceu, amadureceu. Não dependemos mais de um único nome. Teremos vários nomes fortes em 2026 — governadores, senadores, prefeitos. Isso é bom para a democracia.',
      'Declaração de Tarcísio em palestra no Lide em São Paulo em outubro de 2025. A fala foi interpretada como distanciamento estratégico de Bolsonaro e abertura para candidaturas alternativas na direita.',
      'verified', false, '2025-10-28',
      'https://www.infomoney.com.br/politica/tarcisio-direita-varios-nomes-2026-lide/',
      'news_article',
      'São Paulo', 'Palestra no Lide', 'tarcisio-direita-varios-nomes-2026-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 17. Romário perde 58 de 120 votações no Senado em 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário justifica ausências no Senado dizendo que "faz mais fora do plenário" e minimiza faltas em votações.',
      'Meu trabalho vai muito além do plenário. Eu faço reuniões, articulo projetos, visito estados. Quem só conta presença em votação não entende como funciona o Senado.',
      'Romário justificou seu alto índice de ausências — perdeu 58 de 120 votações em 2025 — em entrevista ao jornal Extra em dezembro de 2025. O senador tirou licença médica durante parte do ano.',
      'verified', true, '2025-12-10',
      'https://extra.globo.com/noticias/politica/romario-ausencias-senado-58-votacoes-2025.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista ao Extra', 'romario-ausencias-senado-58-votacoes-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 18. Romário é vítima de deepfake de apoio a Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário denuncia vídeo deepfake gerado por IA que falsamente mostra seu apoio a Lula.',
      'Esse vídeo é falso, gerado por inteligência artificial. Eu nunca apoiei Lula e nunca vou apoiar. Estão usando minha imagem para enganar o povo. Já acionei a Justiça.',
      'Romário divulgou nota e vídeo desmentindo um deepfake que circulou amplamente em redes sociais em agosto de 2025, mostrando o senador declarando apoio ao governo Lula. O caso foi um dos primeiros de grande repercussão envolvendo deepfakes políticos no Brasil.',
      'verified', true, '2025-08-22',
      'https://www.uol.com.br/tilt/noticias/2025/08/22/romario-deepfake-apoio-lula-ia.htm',
      'news_article',
      'Rio de Janeiro', 'Nota oficial e vídeo nas redes sociais', 'romario-deepfake-apoio-lula-ia-agosto-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 19. Romário nega rompimento com Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário nega rompimento com Bolsonaro e diz que "divergências pontuais não significam separação".',
      'Eu e o presidente Bolsonaro temos divergências pontuais como qualquer aliado tem. Mas não rompi com ele e não vou romper. A gente está junto no PL e vai continuar junto.',
      'Romário negou rompimento com Bolsonaro em entrevista à Jovem Pan em novembro de 2025, após rumores de que o senador estaria se afastando do bolsonarismo por divergências sobre candidaturas no Rio de Janeiro.',
      'verified', false, '2025-11-14',
      'https://jovempan.uol.com.br/noticias/politica/romario-nega-rompimento-bolsonaro-novembro-2025.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista à Jovem Pan', 'romario-nega-rompimento-bolsonaro-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Arthur Lira disputa com Renan Calheiros pelo Senado em AL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira ataca Renan Calheiros e diz que Alagoas precisa "virar a página" dos Calheiros no Senado.',
      'Alagoas precisa virar a página. Renan Calheiros representa o velho, o atraso, o toma lá dá cá que o povo não suporta mais. Eu vou para o Senado para representar o futuro de Alagoas.',
      'Lira declarou em evento do PP em Maceió em janeiro de 2026, oficializando sua pré-candidatura ao Senado por Alagoas. A disputa com Renan Calheiros deve ser uma das mais acirradas do país em 2026.',
      'verified', true, '2026-01-25',
      'https://www.gazetadealagoas.com.br/politica/lira-senado-renan-calheiros-alagoas-2026.html',
      'news_article',
      'Maceió', 'Evento do PP em Alagoas', 'lira-senado-renan-calheiros-alagoas-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 21. Renan Calheiros responde a Lira e diz que "não sai fácil"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros rebate Lira e diz que disputa pelo Senado em Alagoas será "guerra" aberta.',
      'Lira está enganado se acha que vai chegar no Senado fácil. Eu tenho 30 anos de trabalho por Alagoas. Ele tem 4 anos de presidência da Câmara fazendo acordos em Brasília. O povo sabe a diferença.',
      'Renan respondeu a Lira em entrevista à TV Gazeta de Alagoas em fevereiro de 2026. A rivalidade entre os dois é antiga e deve marcar a disputa política em Alagoas em 2026.',
      'verified', false, '2026-02-05',
      'https://www.tnh1.com.br/noticia/renan-calheiros-responde-lira-senado-alagoas-2026/',
      'news_article',
      'Maceió', 'Entrevista à TV Gazeta de Alagoas', 'renan-calheiros-responde-lira-senado-alagoas-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 22. Boulos nomeado para Secretaria-Geral da Presidência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos aceita cargo de secretário-geral da Presidência e diz que vai "levar a voz da periferia" ao governo Lula.',
      'Aceito essa missão com responsabilidade. Vou levar a voz da periferia, dos trabalhadores, dos movimentos sociais para dentro do governo. A Secretaria-Geral é a ponte entre o povo e o presidente.',
      'Boulos tomou posse como secretário-geral da Presidência em outubro de 2025, após perder a eleição para prefeito de São Paulo. A nomeação foi vista como forma de mantê-lo relevante para 2026.',
      'verified', true, '2025-10-15',
      'https://www.gov.br/secretariageral/pt-br/noticias/2025/10/boulos-posse-secretario-geral',
      'news_article',
      'Brasília', 'Cerimônia de posse — Secretaria-Geral', 'boulos-secretario-geral-presidencia-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 23. Boulos confirma permanência no PSOL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos confirma permanência no PSOL e nega rumores de ida ao PT.',
      'Eu sou PSOL e vou continuar no PSOL. Não tem conversa de mudança de partido. O PSOL é minha casa política desde o início e vai continuar sendo.',
      'Boulos desmentiu rumores de que estaria negociando filiação ao PT em entrevista ao portal UOL em março de 2026. Os boatos surgiram após sua nomeação para a Secretaria-Geral da Presidência.',
      'verified', false, '2026-03-12',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2026/03/12/boulos-permanece-psol-nega-pt.htm',
      'news_article',
      'São Paulo', 'Entrevista ao UOL', 'boulos-permanece-psol-nega-pt-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 24. Boulos não descarta candidatura em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos diz que não descarta ser candidato em 2026 mas que "agora o foco é o governo".',
      'Não descarto ser candidato em 2026, mas agora meu foco é o governo. Tenho uma missão aqui na Secretaria-Geral e preciso entregar resultados. A hora da eleição vai chegar.',
      'Boulos fez a declaração em evento do PSOL em São Paulo em fevereiro de 2026. Especulava-se sobre possível candidatura ao governo de São Paulo ou retorno à disputa pela prefeitura paulistana.',
      'verified', false, '2026-02-20',
      'https://www.cartacapital.com.br/politica/boulos-nao-descarta-candidatura-2026/',
      'news_article',
      'São Paulo', 'Encontro estadual do PSOL', 'boulos-nao-descarta-candidatura-2026-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Ronaldo Caiado posiciona-se como presidenciável pela direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Ronaldo Caiado diz que é candidato natural da direita e que não precisa da benção de Bolsonaro.',
      'Eu sou governador reeleito, tenho resultados para mostrar. Goiás é referência em segurança, em gestão fiscal, em agronegócio. Não preciso da benção de ninguém para ser candidato a presidente. Meu currículo fala por mim.',
      'Caiado declarou sua disposição para disputar a presidência em entrevista à CNN Brasil em novembro de 2025. O governador de Goiás tem se distanciado de Bolsonaro e se apresentado como alternativa na direita.',
      'verified', true, '2025-11-22',
      'https://www.cnnbrasil.com.br/politica/caiado-candidato-presidente-direita-2026/',
      'news_article',
      'Goiânia', 'Entrevista à CNN Brasil', 'caiado-candidato-presidente-direita-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 26. Caiado ataca Tarcísio e diz que "São Paulo não é o Brasil"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Caiado critica Tarcísio dizendo que "São Paulo não é o Brasil" e que o interior é esquecido.',
      'São Paulo não é o Brasil. O Brasil é Goiás, é Mato Grosso, é Minas, é o Nordeste. O interior é esquecido pela elite paulistana. Eu represento esse Brasil que produz, que alimenta o mundo.',
      'Caiado fez a declaração em evento do agronegócio em Goiânia em dezembro de 2025, em indireta contra Tarcísio de Freitas. A rivalidade entre os dois pela liderança da direita tem se intensificado.',
      'verified', false, '2025-12-03',
      'https://www.correiobraziliense.com.br/politica/2025/12/caiado-sao-paulo-nao-e-brasil-tarcisio.html',
      'news_article',
      'Goiânia', 'Evento do agronegócio', 'caiado-sao-paulo-nao-e-brasil-tarcisio-dezembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Simone Tebet defende centro e critica polarização
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_teb,
      'Simone Tebet diz que o centro precisa ter candidato próprio em 2026 e que a polarização enfraquece o país.',
      'O Brasil não pode ficar refém de dois polos extremos. O centro tem que ter coragem de apresentar uma alternativa. Eu estou trabalhando para isso dentro do MDB. O povo quer moderação, não radicalismo.',
      'Tebet fez a declaração em palestra no Instituto FHC em São Paulo em outubro de 2025. A ministra do Planejamento tem sinalizado disposição para disputar novamente a presidência em 2026.',
      'verified', false, '2025-10-18',
      'https://www.valor.com.br/politica/tebet-centro-candidato-2026-instituto-fhc/',
      'news_article',
      'São Paulo', 'Palestra no Instituto FHC', 'tebet-centro-candidato-2026-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 28. Zema posiciona-se como opção liberal para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zem,
      'Zema diz que é o único governador que reduziu a máquina pública e que esse modelo serve para o Brasil.',
      'Minas Gerais é a prova de que é possível reduzir o Estado e melhorar os serviços. Eu fiz o que nenhum outro governador fez: cortei secretarias, reduzi cargos, privatizei empresas. Esse modelo funciona e o Brasil precisa dele.',
      'Zema fez a declaração em entrevista à revista Veja em novembro de 2025, sinalizando disposição para disputar a presidência em 2026 com uma plataforma liberal. O governador de Minas é do partido Novo.',
      'verified', false, '2025-11-10',
      'https://veja.abril.com.br/politica/zema-modelo-minas-brasil-presidencia-2026/',
      'news_article',
      'Belo Horizonte', 'Entrevista à Veja', 'zema-modelo-minas-brasil-presidencia-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 29. Gleisi Hoffmann defende Lula como candidato natural do PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que Lula será candidato à reeleição "sem nenhuma dúvida" e descarta plano B.',
      'Lula será candidato à reeleição sem nenhuma dúvida. Quem fica inventando plano B está fazendo o jogo da direita. O PT está unido em torno da reeleição do presidente.',
      'Gleisi declarou em entrevista à Folha de S.Paulo em dezembro de 2025, rebatendo especulações sobre a saúde de Lula e a possibilidade de o PT lançar outro candidato.',
      'verified', false, '2025-12-08',
      'https://www.folha.uol.com.br/poder/2025/12/gleisi-lula-candidato-reeleicao-2026.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'gleisi-lula-candidato-reeleicao-dezembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Michelle Bolsonaro insinua candidatura presidencial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro diz que "se Deus quiser" será candidata e que as mulheres conservadoras merecem representação.',
      'Se Deus quiser, eu serei candidata. As mulheres conservadoras deste país merecem uma voz. Eu não tenho medo da esquerda, não tenho medo do sistema. Minha força vem de Deus e do povo.',
      'Michelle fez a declaração em evento evangélico em Brasília em janeiro de 2026. Com Bolsonaro inelegível, Michelle é vista como possível candidata do bolsonarismo à presidência.',
      'verified', true, '2026-01-15',
      'https://www.metropoles.com/brasil/michelle-bolsonaro-candidata-evento-evangelico-2026',
      'news_article',
      'Brasília', 'Evento evangélico', 'michelle-bolsonaro-candidata-evento-evangelico-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 31. Flávio Bolsonaro lança pré-candidatura presidencial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro lança pré-candidatura à presidência dizendo que "a direita precisa de um nome viável".',
      'A direita precisa de um nome viável, que una o bolsonarismo e os moderados. Eu sou senador, conheço o Congresso, sei articular. Meu pai me preparou para este momento.',
      'Flávio oficializou sua pré-candidatura à presidência em evento do PL em Brasília em fevereiro de 2026. A candidatura conta com apoio de Tarcísio e de parte significativa do PL.',
      'verified', true, '2026-02-15',
      'https://www.poder360.com.br/poder/flavio-bolsonaro-pre-candidatura-presidente-fevereiro-2026/',
      'news_article',
      'Brasília', 'Evento do PL — lançamento de pré-candidatura', 'flavio-bolsonaro-pre-candidatura-presidente-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nep, true FROM ins;

  -- 32. Ratinho Junior defende legado no Paraná e critica Moro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rat,
      'Ratinho Junior critica Moro indiretamente e diz que o Paraná precisa de "continuidade, não aventura".',
      'O Paraná cresceu nos últimos anos porque teve continuidade administrativa. Quem vem de fora, sem experiência de gestão estadual, não conhece a realidade do paranaense. Governar não é dar palestra.',
      'Ratinho Junior fez a declaração em entrevista à Gazeta do Povo em março de 2026, em indireta contra Moro. O governador, que não pode concorrer à reeleição, busca emplacar um sucessor.',
      'verified', false, '2026-03-20',
      'https://www.gazetadopovo.com.br/politica/ratinho-junior-continuidade-parana-critica-moro-2026/',
      'news_article',
      'Curitiba', 'Entrevista à Gazeta do Povo', 'ratinho-junior-continuidade-parana-critica-moro-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 33. Nikolas Ferreira defende pauta conservadora para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que a Câmara vai aprovar pautas conservadoras antes das eleições de 2026.',
      'A Câmara vai entregar as pautas que o povo conservador pediu. Escola sem Partido, proteção à família, combate à doutrinação. Antes de outubro de 2026, o Brasil vai ver o que uma Câmara de direita faz.',
      'Nikolas fez a declaração em discurso no plenário da Câmara em novembro de 2025, prometendo votações de projetos da bancada conservadora antes do período eleitoral de 2026.',
      'verified', false, '2025-11-20',
      'https://www.camara.leg.br/noticias/1150000-nikolas-pautas-conservadoras-2026',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-pautas-conservadoras-2026-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 34. Mourão posiciona-se como opção de centro-direita militar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão diz que "as Forças Armadas não são de esquerda nem de direita" e critica politização dos militares.',
      'As Forças Armadas são instituições de Estado, não são de esquerda nem de direita. Quem politizou os militares fez um desserviço ao Brasil. Eu defendo a volta da normalidade institucional.',
      'Mourão fez a declaração em palestra no Clube Militar no Rio de Janeiro em outubro de 2025. O senador e ex-vice-presidente tem se posicionado como voz moderada entre os militares.',
      'verified', false, '2025-10-05',
      'https://www.correiobraziliense.com.br/politica/2025/10/mourao-forcas-armadas-nao-politizacao.html',
      'news_article',
      'Rio de Janeiro', 'Palestra no Clube Militar', 'mourao-forcas-armadas-nao-politizacao-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 35. Moro critica Gleisi e PT sobre segurança pública
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro acusa o PT de ter "desmontado" a segurança pública no Brasil ao desmantelar a Lava Jato.',
      'O PT desmontou a Lava Jato, anistiou corruptos e agora reclama que o crime cresce. Não tem como combater o crime organizado quando se protege os criminosos de colarinho branco. Gleisi e o PT são cúmplices da impunidade no Brasil.',
      'Moro publicou o ataque ao PT e a Gleisi Hoffmann em suas redes sociais em outubro de 2025, após dados mostrarem aumento da criminalidade em estados do Nordeste governados por aliados do PT.',
      'verified', false, '2025-10-20',
      'https://www.poder360.com.br/poder/moro-critica-pt-gleisi-seguranca-publica-2025/',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'moro-critica-pt-gleisi-seguranca-publica-outubro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 36. Lira acusa Renan de "comprar" prefeituras em Alagoas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Lira acusa Renan Calheiros de usar emendas para "comprar" prefeituras no interior de Alagoas.',
      'Renan usa emendas parlamentares como moeda de troca para comprar prefeitos. Isso é corrupção na veia. Alagoas merece um senador que trabalhe pelo estado, não que compre apoio político.',
      'Declaração de Lira em evento de campanha em Arapiraca em fevereiro de 2026. A troca de acusações entre Lira e Renan sobre uso de emendas tem sido constante na disputa pelo Senado em Alagoas.',
      'verified', false, '2026-02-18',
      'https://www.gazetadealagoas.com.br/politica/lira-acusa-renan-comprar-prefeituras-emendas-2026.html',
      'news_article',
      'Arapiraca', 'Evento de pré-campanha', 'lira-acusa-renan-comprar-prefeituras-emendas-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 37. Ciro ataca Camilo Santana e PT no Ceará
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes acusa Camilo Santana de transformar o Ceará em "curral eleitoral do PT".',
      'Camilo Santana transformou o Ceará em um curral eleitoral do PT. A educação que era referência virou propaganda, a saúde piorou, a segurança despencou. O cearense merece muito mais.',
      'Ciro atacou o ex-governador e ministro da Educação Camilo Santana em evento do PSDB em Fortaleza em dezembro de 2025. A disputa pelo Ceará deve ser um dos principais embates de 2026.',
      'verified', false, '2025-12-20',
      'https://www.opovo.com.br/noticias/politica/2025/12/ciro-ataca-camilo-santana-pt-ceara.html',
      'news_article',
      'Fortaleza', 'Evento do PSDB no Ceará', 'ciro-ataca-camilo-santana-pt-ceara-dezembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 38. Moro defende mandato no Senado e diz que fez mais que antecessores
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro defende seu mandato de senador e diz que aprovou mais projetos em 2 anos do que antecessores em 8.',
      'Em dois anos de mandato, relatei e aprovei mais projetos do que meus antecessores fizeram em oito anos. Quem me critica por disputar o governo não olha meu trabalho no Senado.',
      'Moro respondeu a críticas de que estaria negligenciando o mandato no Senado em entrevista à Rádio CBN em novembro de 2025. Opositores acusam Moro de usar o Senado como trampolim.',
      'verified', false, '2025-11-25',
      'https://cbn.globoradio.globo.com/media/audio/moro-mandato-senado-projetos-novembro-2025.htm',
      'news_article',
      'Curitiba', 'Entrevista à Rádio CBN', 'moro-mandato-senado-projetos-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Tarcísio critica governo federal e diz que SP "carrega o Brasil nas costas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio diz que São Paulo "carrega o Brasil nas costas" e que o governo federal pune o estado produtivo.',
      'São Paulo arrecada um terço do PIB brasileiro e carrega o Brasil nas costas. E o que recebe do governo federal? Punição. Menos repasses, menos investimentos. Isso precisa mudar.',
      'Declaração de Tarcísio em evento da Fiesp em São Paulo em novembro de 2025. O governador tem usado a retórica federalista para marcar oposição ao governo Lula.',
      'verified', false, '2025-11-05',
      'https://www.infomoney.com.br/politica/tarcisio-sp-carrega-brasil-fiesp-novembro-2025/',
      'news_article',
      'São Paulo', 'Evento na Fiesp', 'tarcisio-sp-carrega-brasil-fiesp-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 40. Bolsonaro diz que "fez mais que Lula" mesmo preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que mesmo em prisão domiciliar fez mais pelo Brasil do que Lula em dois anos de governo.',
      'Eu preso fiz mais pelo Brasil do que esse cara solto no Planalto. O povo sabe quem governou de verdade. O Lula só aumenta imposto, gasta dinheiro público e protege corrupto.',
      'Declaração de Bolsonaro em vídeo gravado em sua residência e divulgado por aliados em redes sociais em janeiro de 2026. O ex-presidente continua se comunicando com a base apesar das restrições judiciais.',
      'verified', false, '2026-01-10',
      'https://www.metropoles.com/brasil/bolsonaro-preso-fez-mais-lula-video-janeiro-2026',
      'news_article',
      'Brasília', 'Vídeo divulgado por aliados', 'bolsonaro-preso-fez-mais-lula-video-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Gleisi critica trocas partidárias e diz que "a direita só troca de roupa"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann critica troca de partidos de Moro e Ciro e diz que "a oposição só troca de roupa".',
      'O Moro sai do União vai pro PL, o Ciro sai do PDT vai pro PSDB. A oposição não tem projeto, só troca de roupa. O povo sabe que quem tem compromisso de verdade é o PT e o presidente Lula.',
      'Gleisi atacou Moro e Ciro em discurso no diretório nacional do PT em Brasília em novembro de 2025, após as trocas partidárias de ambos os políticos.',
      'verified', false, '2025-11-15',
      'https://pt.org.br/gleisi-critica-trocas-partidarias-oposicao-novembro-2025/',
      'news_article',
      'Brasília', 'Reunião do Diretório Nacional do PT', 'gleisi-critica-trocas-partidarias-oposicao-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 42. Caiado critica emendas parlamentares como "moeda de troca"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Caiado critica sistema de emendas parlamentares e diz que virou "caixa-preta" do Congresso.',
      'O sistema de emendas parlamentares virou uma caixa-preta. Ninguém sabe para onde vai o dinheiro, quem decide é o presidente da Câmara ou do Senado. Isso é compra de votos institucionalizada.',
      'Caiado fez a declaração em entrevista ao Valor Econômico em setembro de 2025, durante debate sobre a regulamentação das emendas parlamentares pelo STF.',
      'verified', false, '2025-09-12',
      'https://www.valor.com.br/politica/caiado-emendas-caixa-preta-congresso-setembro-2025/',
      'news_article',
      'Goiânia', 'Entrevista ao Valor Econômico', 'caiado-emendas-caixa-preta-congresso-setembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 43. Moro sobre indicação do PL ao governo: "sou o mais competitivo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro diz que é o nome mais competitivo do PL para o governo do Paraná e que as pesquisas comprovam.',
      'As pesquisas mostram que eu sou o nome mais competitivo do PL para o governo do Paraná. O partido sabe disso, o eleitor sabe disso. Não adianta querer impor nomes que não têm voto.',
      'Moro fez a declaração em entrevista à RIC TV em março de 2026, após pesquisas mostrarem que ele liderava as intenções de voto para o governo do Paraná entre os possíveis candidatos do PL.',
      'verified', false, '2026-03-25',
      'https://www.ric.com.br/politica/moro-mais-competitivo-pl-parana-pesquisas-marco-2026/',
      'news_article',
      'Curitiba', 'Entrevista à RIC TV', 'moro-mais-competitivo-pl-parana-pesquisas-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 44. Tarcísio defende privatizações em SP e critica "Estado inchado"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio defende privatização da Sabesp e diz que o "Estado inchado" prejudica o contribuinte.',
      'A privatização da Sabesp mostrou que o setor privado faz melhor. O Estado inchado custa caro para o contribuinte e entrega menos. Minha gestão vai continuar privatizando onde for possível.',
      'Tarcísio defendeu as privatizações de sua gestão em palestra na Febraban em São Paulo em agosto de 2025, usando a Sabesp como exemplo de sucesso.',
      'verified', false, '2025-08-22',
      'https://www.infomoney.com.br/politica/tarcisio-privatizacao-sabesp-estado-inchado-febraban-2025/',
      'news_article',
      'São Paulo', 'Palestra na Febraban', 'tarcisio-privatizacao-sabesp-estado-inchado-agosto-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Romário promete "dedicação total" ao Senado em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário promete dedicação total ao Senado em 2026 após críticas por alto número de ausências.',
      'Eu ouvi as críticas e aceito. Em 2026 vou ter dedicação total ao Senado. Tive problemas de saúde, problemas pessoais, mas agora estou 100%. O Rio de Janeiro pode contar comigo.',
      'Romário fez a declaração em entrevista ao jornal O Globo em janeiro de 2026, tentando reverter a imagem de senador ausente que acumulou ao longo de 2025.',
      'verified', false, '2026-01-08',
      'https://oglobo.globo.com/politica/romario-dedicacao-total-senado-2026.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista ao O Globo', 'romario-dedicacao-total-senado-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Moro defende aliança com agronegócio no Paraná
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro promete priorizar o agronegócio caso eleito governador do Paraná.',
      'O Paraná é uma potência do agronegócio e meu governo vai tratar o setor como prioridade número um. Desburocratização, infraestrutura logística e segurança jurídica. O produtor rural vai ter um governador aliado.',
      'Moro fez a declaração em evento da Sociedade Rural do Paraná em Londrina em abril de 2026. A fala marca a busca de Moro por apoio do agronegócio no interior do estado.',
      'verified', false, '2026-04-05',
      'https://www.gazetadopovo.com.br/agronegocio/moro-agronegocio-parana-sociedade-rural-abril-2026/',
      'news_article',
      'Londrina', 'Evento da Sociedade Rural do Paraná', 'moro-agronegocio-parana-sociedade-rural-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Ciro defende industrialização e critica dependência do agro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes critica dependência do Brasil no agronegócio e defende reindustrialização.',
      'O Brasil não pode ser só fazenda do mundo. Precisamos reindustrializar o país, gerar emprego de qualidade, exportar tecnologia. O agro é importante, mas não pode ser o único motor da economia.',
      'Ciro fez a declaração em palestra na Fiec (Federação das Indústrias do Ceará) em janeiro de 2026, apresentando propostas econômicas para sua eventual gestão no Ceará.',
      'verified', false, '2026-01-30',
      'https://www.opovo.com.br/noticias/economia/2026/01/ciro-reindustrializacao-fiec-ceara.html',
      'news_article',
      'Fortaleza', 'Palestra na Fiec', 'ciro-reindustrializacao-fiec-ceara-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 48. Lira defende legado na presidência da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Lira defende sua gestão na Câmara e diz que aprovou mais reformas que qualquer antecessor.',
      'Na minha gestão, a Câmara aprovou a reforma tributária, a reforma administrativa, o marco das garantias. Nenhum presidente da Câmara entregou tanto quanto eu. Agora vou levar essa capacidade de articulação para o Senado.',
      'Lira fez a declaração em entrevista à revista Veja em dezembro de 2025, defendendo seu legado na presidência da Câmara e justificando sua candidatura ao Senado.',
      'verified', false, '2025-12-18',
      'https://veja.abril.com.br/politica/lira-legado-camara-reformas-dezembro-2025/',
      'news_article',
      'Brasília', 'Entrevista à Veja', 'lira-legado-camara-reformas-dezembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 49. Boulos defende programa de habitação popular no governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos diz que Secretaria-Geral vai priorizar Minha Casa Minha Vida e que "moradia é direito, não mercadoria".',
      'Moradia é direito, não mercadoria. A Secretaria-Geral vai trabalhar para que o Minha Casa Minha Vida chegue a quem mais precisa. O déficit habitacional é uma vergonha para um país do tamanho do Brasil.',
      'Boulos fez a declaração em visita a obras do MCMV na periferia de São Paulo em novembro de 2025, em sua primeira agenda oficial como secretário-geral da Presidência.',
      'verified', false, '2025-11-05',
      'https://www.gov.br/secretariageral/pt-br/noticias/2025/11/boulos-mcmv-moradia-direito',
      'news_article',
      'São Paulo', 'Visita a obras do MCMV', 'boulos-mcmv-moradia-direito-novembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Hugo Motta defende produtividade legislativa e diz que 2026 será "ainda mais produtivo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta promete que 2026 será o ano mais produtivo do Congresso e que pautas econômicas terão prioridade.',
      '2026 será ainda mais produtivo. A Câmara vai votar a regulamentação da reforma tributária, a PEC da Segurança Pública e o novo arcabouço fiscal. O Congresso brasileiro está trabalhando como nunca.',
      'Motta fez a declaração em coletiva de imprensa ao fim do ano legislativo de 2025, projetando a agenda para 2026. O presidente da Câmara busca marcar sua gestão pela produtividade legislativa.',
      'verified', false, '2025-12-22',
      'https://www.camara.leg.br/noticias/1160000-motta-2026-mais-produtivo-congresso',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Câmara', 'motta-2026-mais-produtivo-congresso-dezembro-2025'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

END $$;
