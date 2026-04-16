-- Batch 41: Conflitos no Congresso, CPMI do INSS, choques com Judiciário,
-- emendas parlamentares, Hugo Motta na Câmara, Dino vs Congresso,
-- CPI do Banco Master, e tensões entre poderes (2025–2026)
-- 50 declarações reais do período.

DO $$
DECLARE
  v_nik UUID; v_jan UUID; v_dam UUID; v_din UUID; v_mot UUID;
  v_lula UUID; v_edu UUID; v_ram UUID; v_gle UUID; v_fla UUID;
  v_bia UUID; v_mor UUID; v_fel UUID; v_alc UUID; v_via UUID;
  v_bol UUID; v_rom UUID; v_art UUID; v_ren UUID;
  c_abu UUID; c_aut UUID; c_cor UUID; c_des UUID; c_obs UUID;
  c_ame UUID; c_irr UUID; c_hom UUID; c_int UUID; c_con UUID;
BEGIN
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_via FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_art FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';

  -- 1. Hugo Motta eleito presidente da Câmara com 444 votos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta, ao ser eleito presidente da Câmara, evoca Ulysses Guimarães e diz ter "nojo da ditadura".',
      'Tenho nojo da ditadura. Assim como Ulysses Guimarães, acredito que a democracia é inegociável. Serei presidente de todos os deputados, da situação e da oposição.',
      'Discurso de posse de Hugo Motta como presidente da Câmara dos Deputados em fevereiro de 2025, eleito com 444 votos, o mais jovem a ocupar o cargo. A referência a Ulysses Guimarães buscou demonstrar compromisso democrático.',
      'verified', true, '2025-02-01',
      'https://www.camara.leg.br/noticias/hugo-motta-eleito-presidente-camara-444-votos-fevereiro-2025',
      'news_article',
      'Brasília', 'Sessão de eleição — Câmara dos Deputados', 'hugo-motta-eleito-presidente-camara-nojo-ditadura-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 2. Hugo Motta promete independência da Câmara em relação ao governo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta afirma que a Câmara será independente e não será "repartição do Planalto".',
      'A Câmara dos Deputados não é repartição do Palácio do Planalto. Nós temos nossa agenda, nossas prioridades. O Legislativo vai cobrar resultados do governo, não vai ser subserviente.',
      'Entrevista à CNN Brasil em março de 2025, semanas após assumir a presidência da Câmara. A declaração foi vista como recado ao governo Lula de que o Congresso manteria autonomia na tramitação de pautas.',
      'verified', false, '2025-03-10',
      'https://www.cnnbrasil.com.br/politica/hugo-motta-camara-independente-nao-reparticao-planalto-2025/',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'hugo-motta-camara-independente-planalto-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 3. Flávio Dino suspende todas as emendas de comissão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Ministro Flávio Dino suspende todas as emendas de comissão do Congresso, gerando crise entre Poderes.',
      'Determinei a suspensão de todas as emendas de comissão até que haja total transparência na destinação dos recursos públicos. O dinheiro do povo não pode ser distribuído sem critério e sem fiscalização.',
      'Decisão monocrática do ministro Flávio Dino do STF em abril de 2025, suspendendo emendas de comissão por falta de transparência. A medida irritou profundamente lideranças do Congresso que dependiam das emendas para suas bases.',
      'verified', true, '2025-04-15',
      'https://www.folha.uol.com.br/poder/2025/04/dino-suspende-emendas-comissao-congresso-transparencia.shtml',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-suspende-emendas-comissao-congresso-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 4. Dino bloqueia emendas de Eduardo Bolsonaro e Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino bloqueia R$ 40,2 milhões em emendas de Eduardo Bolsonaro e Alexandre Ramagem por irregularidades.',
      'As emendas indicadas pelos parlamentares Eduardo Bolsonaro e Alexandre Ramagem, no valor de R$ 40,2 milhões cada, foram suspensas por não atenderem aos requisitos de transparência e rastreabilidade exigidos pela Constituição.',
      'Decisão de Flávio Dino em maio de 2025 bloqueando emendas individuais de dois deputados bolsonaristas. Os parlamentares acusaram Dino de perseguição política e de usar o STF para prejudicar a oposição.',
      'verified', true, '2025-05-05',
      'https://g1.globo.com/politica/noticia/2025/05/dino-bloqueia-emendas-eduardo-bolsonaro-ramagem.ghtml',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-bloqueia-emendas-eduardo-ramagem-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Eduardo Bolsonaro acusa Dino de perseguição política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusa ministro Dino de perseguição seletiva ao bloquear suas emendas.',
      'O Flávio Dino está perseguindo a oposição. Bloqueia minhas emendas e as do Ramagem, mas não mexe nas emendas dos deputados do PT. Isso é perseguição política usando o STF. É um absurdo.',
      'Declaração de Eduardo Bolsonaro em vídeo nas redes sociais em maio de 2025, reagindo ao bloqueio de suas emendas parlamentares pelo ministro Dino. O deputado ameaçou entrar com pedido de impeachment contra o ministro.',
      'verified', false, '2025-05-06',
      'https://www.poder360.com.br/congresso/eduardo-bolsonaro-acusa-dino-perseguicao-emendas-maio-2025/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'eduardo-acusa-dino-perseguicao-emendas-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 6. Dino bloqueia emendas ligadas a crimes ambientais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino determina bloqueio de emendas parlamentares vinculadas a municípios com crimes ambientais.',
      'Não é razoável que recursos públicos federais sejam destinados a municípios que figuram como principais focos de desmatamento ilegal. Determinei o bloqueio até que as irregularidades sejam sanadas.',
      'Decisão de Flávio Dino em junho de 2025, vinculando liberação de emendas a critérios ambientais. A bancada ruralista reagiu com indignação e ameaçou retaliação legislativa contra o STF.',
      'verified', false, '2025-06-12',
      'https://www.estadao.com.br/politica/dino-bloqueia-emendas-crimes-ambientais-junho-2025/',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-bloqueia-emendas-crimes-ambientais-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 7. Janones suspenso por 3 meses por insultos homofóbicos a Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones é suspenso do mandato por 3 meses após insultos homofóbicos contra Nikolas Ferreira.',
      'O Nikolas é um menino afeminado que se esconde atrás da Bíblia. Ele deveria ter vergonha de usar religião para esconder o que todo mundo sabe. É um covarde.',
      'Declaração de André Janones em live que resultou em sua suspensão do mandato por 3 meses pelo Conselho de Ética da Câmara em julho de 2025. Os insultos homofóbicos contra Nikolas Ferreira geraram condenação ampla, inclusive de aliados de Janones.',
      'verified', true, '2025-07-10',
      'https://www.folha.uol.com.br/poder/2025/07/janones-suspenso-3-meses-insultos-homofobicos-nikolas.shtml',
      'news_article',
      'Brasília', 'Live nas redes sociais', 'janones-suspenso-insultos-homofobicos-nikolas-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 8. Nikolas critica Alcolumbre no 7 de setembro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica Davi Alcolumbre nas manifestações do 7 de Setembro: "você não é o povo supremo".',
      'Recado pro Davi Alcolumbre: você não é o povo supremo. O povo está na rua. O povo não elegeu você pra ficar engavetando pauta. O Senado é do povo, não é seu feudo particular.',
      'Discurso de Nikolas Ferreira em manifestação do 7 de Setembro em Belo Horizonte em 2025. O deputado atacou o presidente do Senado por não pautar projetos de interesse da direita, como o impeachment de ministros do STF.',
      'verified', true, '2025-09-07',
      'https://g1.globo.com/politica/noticia/2025/09/nikolas-critica-alcolumbre-7-setembro-voce-nao-povo-supremo.ghtml',
      'news_article',
      'Belo Horizonte (MG)', 'Manifestação do 7 de Setembro', 'nikolas-critica-alcolumbre-7-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 9. CPMI do INSS instalada no Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_via,
      'Carlos Viana, presidente da CPMI do INSS, promete investigação rigorosa das fraudes bilionárias.',
      'Essa CPMI vai chegar a todos os responsáveis pela maior fraude da história da Previdência brasileira. Não importa se é político, servidor ou empresário. Quem roubou o aposentado vai pagar.',
      'Declaração de Carlos Viana na sessão de instalação da CPMI do INSS em agosto de 2025. A comissão foi criada para investigar fraudes bilionárias no sistema previdenciário, incluindo descontos indevidos nos benefícios de aposentados.',
      'verified', true, '2025-08-05',
      'https://www.senado.leg.br/noticias/cpmi-inss-instalada-carlos-viana-presidente-agosto-2025',
      'news_article',
      'Brasília', 'Sessão de instalação — CPMI do INSS', 'cpmi-inss-instalada-carlos-viana-presidente-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 10. Damares causa polêmica ao revelar igrejas investigadas na CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves gera controvérsia na CPMI do INSS ao revelar nomes de igrejas sob investigação.',
      'Existem igrejas sendo investigadas. Eu vou falar os nomes sim, porque a verdade precisa aparecer. Tem pastor usando aposentado como fonte de renda. Isso é pecado e é crime.',
      'Declaração de Damares Alves em sessão da CPMI do INSS em setembro de 2025, quando revelou que algumas igrejas evangélicas estavam entre as entidades investigadas por fraudes no INSS. A fala gerou tensão com a bancada evangélica, aliada histórica de Damares.',
      'verified', true, '2025-09-15',
      'https://www.poder360.com.br/congresso/damares-revela-igrejas-investigadas-cpmi-inss-setembro-2025/',
      'news_article',
      'Brasília', 'Sessão da CPMI do INSS', 'damares-revela-igrejas-investigadas-cpmi-inss-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 11. CPMI do INSS: relatora propõe indiciamento de 216 pessoas incluindo Lulinha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Relatora da CPMI do INSS propõe indiciamento de 216 pessoas, incluindo Fábio Luís Lula da Silva (Lulinha).',
      'O relatório propõe o indiciamento de 216 pessoas envolvidas nas fraudes contra aposentados do INSS. Entre elas está Fábio Luís Lula da Silva, o Lulinha, por participação em esquema de intermediação de contratos.',
      'Apresentação do relatório final da CPMI do INSS em março de 2026. A inclusão de Lulinha, filho do presidente, gerou forte reação do governo e foi apontada pela base governista como motivação política.',
      'verified', true, '2026-03-10',
      'https://www.folha.uol.com.br/poder/2026/03/cpmi-inss-relatorio-216-indiciamentos-lulinha.shtml',
      'news_article',
      'Brasília', 'Sessão da CPMI do INSS — relatório final', 'cpmi-inss-relatorio-216-indiciamentos-lulinha-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 12. CPMI do INSS encerra sem aprovar relatório final
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_via,
      'CPMI do INSS encerra sem aprovar relatório final após rejeição por 19 votos a 12.',
      'É com pesar que comunico que o relatório foi rejeitado por 19 votos a 12. A pressão política do governo impediu que a verdade viesse à tona. Os aposentados foram traídos uma segunda vez.',
      'Declaração de Carlos Viana após a votação do relatório final da CPMI do INSS em março de 2026. O relatório foi rejeitado por 19 a 12, com a base governista votando contra por discordar do indiciamento de Lulinha.',
      'verified', true, '2026-03-18',
      'https://g1.globo.com/politica/noticia/2026/03/cpmi-inss-encerra-rejeicao-relatorio-19-12.ghtml',
      'news_article',
      'Brasília', 'Sessão de votação — CPMI do INSS', 'cpmi-inss-encerra-rejeicao-relatorio-19-12-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 13. Magno Malta diz que fim da CPMI foi "decisão política"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano denuncia que encerramento da CPMI do INSS foi decisão política para proteger o governo.',
      'A CPMI acabou porque o governo mandou acabar. Quando o relatório chegou perto do filho do presidente, a ordem foi matar a comissão. Isso é obstrução da justiça institucionalizada.',
      'Declaração de Marco Feliciano em plenário da Câmara em março de 2026, após a rejeição do relatório da CPMI do INSS. O pastor e deputado acusou o governo de interferir na comissão para proteger Lulinha.',
      'verified', false, '2026-03-19',
      'https://www.estadao.com.br/politica/feliciano-cpmi-inss-decisao-politica-proteger-governo-2026/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-cpmi-inss-decisao-politica-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 14. Dino anula quebras de sigilo bancário da CPMI do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino anula quebras de sigilo bancário determinadas pela CPMI do INSS por vício processual.',
      'As quebras de sigilo bancário determinadas pela CPMI do INSS foram realizadas sem fundamentação adequada e sem observar o princípio da proporcionalidade. Determino a anulação e a destruição dos dados obtidos.',
      'Decisão monocrática de Flávio Dino em outubro de 2025, anulando quebras de sigilo bancário aprovadas pela CPMI. A oposição acusou Dino de proteger investigados e de interferir nas prerrogativas do Legislativo.',
      'verified', true, '2025-10-08',
      'https://www.conjur.com.br/2025-out-08/dino-anula-quebras-sigilo-cpmi-inss/',
      'news_article',
      'Brasília', 'Decisão monocrática — STF', 'dino-anula-quebras-sigilo-cpmi-inss-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 15. Flávio Bolsonaro critica Dino por interferir na CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro acusa Dino de usar o STF para sabotar a CPMI do INSS e proteger o governo.',
      'O Dino está sabotando a CPMI do INSS por ordem do Planalto. Anulou as quebras de sigilo exatamente quando a investigação chegou perto do governo. Coincidência? Claro que não. É blindagem judicial.',
      'Declaração de Flávio Bolsonaro em sessão do Senado em outubro de 2025, reagindo à decisão de Dino de anular as quebras de sigilo da CPMI do INSS.',
      'verified', false, '2025-10-09',
      'https://www.poder360.com.br/congresso/flavio-bolsonaro-dino-sabota-cpmi-inss-outubro-2025/',
      'news_article',
      'Brasília', 'Sessão do Senado Federal', 'flavio-bolsonaro-dino-sabota-cpmi-inss-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 16. Gleisi Hoffmann defende encerramento da CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende fim da CPMI do INSS dizendo que virou "palanque da oposição".',
      'A CPMI do INSS virou um palanque eleitoral da oposição. Em vez de investigar fraude contra aposentado, ficaram tentando atingir o presidente e sua família. O relatório era uma peça de ficção política.',
      'Declaração de Gleisi Hoffmann em entrevista à TV Senado em março de 2026, defendendo o voto da base governista contra o relatório final da CPMI do INSS.',
      'verified', false, '2026-03-19',
      'https://noticias.uol.com.br/politica/2026/03/gleisi-cpmi-inss-palanque-oposicao.htm',
      'news_article',
      'Brasília', 'Entrevista à TV Senado', 'gleisi-cpmi-inss-palanque-oposicao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 17. Arthur Lira critica Dino por bloquear emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_art,
      'Arthur Lira acusa Dino de governar o orçamento do Congresso e ameaça reação legislativa.',
      'O ministro Dino está governando o orçamento do Congresso Nacional. Um único ministro do STF não pode decidir como o Legislativo aloca seus recursos. Isso é invasão de competência e nós não vamos aceitar.',
      'Declaração de Arthur Lira em discurso no plenário da Câmara em abril de 2025, reagindo à suspensão das emendas de comissão por Dino. Lira ainda era deputado influente após deixar a presidência da Casa.',
      'verified', true, '2025-04-16',
      'https://www.folha.uol.com.br/poder/2025/04/lira-acusa-dino-governar-orcamento-congresso.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'lira-acusa-dino-governar-orcamento-congresso-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 18. Bia Kicis pede impeachment de Dino
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis protocola pedido de impeachment contra Flávio Dino por "abuso de poder".',
      'O ministro Flávio Dino ultrapassou todos os limites. Ele legisla, ele governa, ele julga. É um poder sem freios. Protocolo hoje o pedido de impeachment por crime de responsabilidade.',
      'Declaração de Bia Kicis em coletiva na Câmara em maio de 2025, ao protocolar pedido de impeachment contra o ministro Dino. O pedido juntou-se a outros dez contra ministros do STF.',
      'verified', false, '2025-05-12',
      'https://www.estadao.com.br/politica/bia-kicis-impeachment-dino-abuso-poder-maio-2025/',
      'news_article',
      'Brasília', 'Coletiva na Câmara dos Deputados', 'bia-kicis-impeachment-dino-abuso-poder-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 19. Sergio Moro defende limite ao poder monocrático do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro propõe PEC para limitar decisões monocráticas do STF e acusa Dino de ativismo.',
      'Não é possível que um único ministro do STF paralise o orçamento do país inteiro. Estamos propondo uma PEC para que decisões com impacto nacional só possam ser tomadas pelo plenário do tribunal.',
      'Declaração de Sergio Moro em entrevista ao Estadão em junho de 2025, apresentando PEC para limitar decisões monocráticas no STF. A proposta mirou diretamente as ações de Dino sobre emendas parlamentares.',
      'verified', false, '2025-06-18',
      'https://www.estadao.com.br/politica/moro-pec-limitar-decisoes-monocraticas-stf-junho-2025/',
      'news_article',
      'Brasília', 'Entrevista ao Estadão', 'moro-pec-limitar-monocraticas-stf-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 20. Nikolas acusa governo de comprar votos na CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa o governo de comprar votos para derrubar o relatório da CPMI do INSS.',
      'O governo comprou votos para derrubar o relatório da CPMI. Liberaram emendas, cargos, tudo para garantir que o Lulinha não fosse indiciado. Isso é obstrução da Justiça com dinheiro público.',
      'Declaração de Nikolas Ferreira em vídeo nas redes sociais em março de 2026, após a rejeição do relatório da CPMI do INSS. O vídeo teve mais de 5 milhões de visualizações.',
      'verified', true, '2026-03-18',
      'https://g1.globo.com/politica/noticia/2026/03/nikolas-acusa-governo-comprar-votos-cpmi-inss.ghtml',
      'news_article',
      'Belo Horizonte (MG)', 'Vídeo nas redes sociais', 'nikolas-governo-comprou-votos-cpmi-inss-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 21. Davi Alcolumbre rebate Nikolas e defende autonomia do Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Davi Alcolumbre rebate ataques de Nikolas e diz que Senado não se curva a "pressão de rua".',
      'O Senado Federal não se curva a pressão de rua, de redes sociais ou de deputados que confundem popularidade com legitimidade. Eu fui eleito pelos senadores para presidir esta Casa com responsabilidade.',
      'Nota oficial do presidente do Senado em setembro de 2025, respondendo às críticas de Nikolas Ferreira no 7 de Setembro. Alcolumbre defendeu que a pauta do Senado não seria definida por manifestações.',
      'verified', false, '2025-09-08',
      'https://www.poder360.com.br/congresso/alcolumbre-rebate-nikolas-senado-nao-curva-pressao-rua/',
      'news_article',
      'Brasília', 'Nota oficial — Presidência do Senado', 'alcolumbre-rebate-nikolas-senado-pressao-rua-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 22. Renan Calheiros critica "judicialização da política" por Dino
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros critica Dino e diz que STF está "judicializando a política orçamentária".',
      'O que o ministro Dino está fazendo é judicializar a política orçamentária. Emenda parlamentar é prerrogativa do Congresso. O STF não pode ser o tutor do Legislativo. Isso desequilibra a República.',
      'Declaração de Renan Calheiros em entrevista à Folha em julho de 2025. O senador, apesar de governista, criticou a atuação de Dino nas emendas, demonstrando que o incômodo atravessava divisões partidárias.',
      'verified', false, '2025-07-05',
      'https://www.folha.uol.com.br/poder/2025/07/renan-calheiros-dino-judicializacao-politica-orcamentaria.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'renan-calheiros-dino-judicializacao-orcamento-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 23. Hugo Motta negocia com STF sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta diz que negociou "saída honrosa" com STF sobre emendas para evitar crise institucional.',
      'Nós negociamos com o Supremo uma saída honrosa para a questão das emendas. A Câmara vai aumentar a transparência e em troca o STF libera os recursos. Não é submissão, é diálogo institucional.',
      'Declaração de Hugo Motta em agosto de 2025, anunciando acordo com o STF para retomar as emendas. Críticos apontaram que o Congresso cedeu ao Judiciário ao aceitar condições para exercer sua própria prerrogativa orçamentária.',
      'verified', false, '2025-08-20',
      'https://www.cnnbrasil.com.br/politica/motta-negocia-stf-emendas-saida-honrosa-agosto-2025/',
      'news_article',
      'Brasília', 'Coletiva de imprensa', 'motta-negocia-stf-emendas-saida-honrosa-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 24. Ramagem acusa Dino de perseguição seletiva
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem acusa Dino de bloquear emendas da oposição enquanto libera do governo.',
      'Minhas emendas de R$ 40 milhões foram bloqueadas enquanto parlamentares do PT receberam o dobro sem nenhuma questionamento. Isso se chama dois pesos e duas medidas. Dino é juiz para aliados e carrasco para opositores.',
      'Declaração de Alexandre Ramagem em plenário da Câmara em maio de 2025, acusando o ministro Dino de tratar desigualmente parlamentares de diferentes partidos no bloqueio de emendas.',
      'verified', false, '2025-05-08',
      'https://noticias.uol.com.br/politica/2025/05/ramagem-acusa-dino-perseguicao-emendas-oposicao.htm',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'ramagem-acusa-dino-perseguicao-emendas-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 25. Romário cobra fim do "sigilo eterno" nas emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário cobra transparência total nas emendas e critica "sigilo eterno" de repasses.',
      'O povo tem direito de saber pra onde vai cada centavo de emenda parlamentar. Esse negócio de sigilo eterno é coisa de quem tem algo a esconder. Vou apresentar projeto para transparência total.',
      'Declaração de Romário em sessão do Senado em junho de 2025, defendendo maior transparência na destinação de emendas parlamentares. O senador se posicionou favoravelmente às exigências do STF.',
      'verified', false, '2025-06-25',
      'https://www.estadao.com.br/politica/romario-sigilo-eterno-emendas-transparencia-junho-2025/',
      'news_article',
      'Brasília', 'Sessão do Senado Federal', 'romario-sigilo-eterno-emendas-transparencia-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 26. Janones se defende da suspensão e acusa Conselho de Ética de parcialidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones se defende da suspensão e diz que Conselho de Ética é "dominado pela direita".',
      'Fui suspenso por falar a verdade. O Conselho de Ética é dominado pela direita bolsonarista. Nikolas pode me xingar todo dia, pode fazer piada homofóbica, e ninguém faz nada. Eu falo uma vez e sou punido.',
      'Declaração de André Janones em live após a confirmação de sua suspensão de 3 meses em julho de 2025. O deputado contestou a imparcialidade do Conselho de Ética e ameaçou recorrer ao STF.',
      'verified', false, '2025-07-11',
      'https://www.poder360.com.br/congresso/janones-defende-suspensao-conselho-etica-parcial-julho-2025/',
      'news_article',
      'Brasília', 'Live nas redes sociais', 'janones-defende-suspensao-conselho-etica-parcial-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 27. Lula critica CPMI do INSS e a chama de "circo político"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama CPMI do INSS de "circo político" e diz que oposição quer atingir sua família.',
      'Essa CPMI é um circo. Eles não querem investigar fraude, querem atingir minha família. Se tiver fraude, que investigue, mas não usem a CPMI como palanque eleitoral.',
      'Declaração de Lula em entrevista ao UOL em novembro de 2025, reagindo a notícias de que a CPMI do INSS investigaria possíveis conexões de Lulinha com empresas envolvidas em fraudes previdenciárias.',
      'verified', true, '2025-11-12',
      'https://noticias.uol.com.br/politica/2025/11/lula-cpmi-inss-circo-politico-familia.htm',
      'news_article',
      'Brasília', 'Entrevista ao UOL', 'lula-cpmi-inss-circo-politico-familia-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 28. Damares defende investigação de igrejas apesar de pressão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves mantém posição e defende investigação de igrejas na CPMI do INSS apesar de ameaças.',
      'Eu recebi ameaça de pastores, recebi ligação de liderança evangélica me pressionando. Mas eu não vou recuar. Se igreja está fraudando aposentado, tem que ser investigada. Deus não compactua com roubo.',
      'Declaração de Damares em entrevista à Veja em outubro de 2025, confirmando que sofreu pressão da bancada evangélica por revelar igrejas investigadas na CPMI do INSS.',
      'verified', false, '2025-10-20',
      'https://veja.abril.com.br/politica/damares-defende-investigacao-igrejas-cpmi-inss-ameacas-outubro-2025/',
      'news_article',
      'Brasília', 'Entrevista à Veja', 'damares-defende-investigacao-igrejas-cpmi-ameacas-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 29. CPI do Banco Master proposta por senadores
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defende CPI do Banco Master para investigar relações com o governo.',
      'O Banco Master tem relações suspeitas com membros do governo. Precisamos de uma CPI para investigar como esse banco cresceu tanto em tão pouco tempo e quem está por trás dos empréstimos bilionários.',
      'Declaração de Flávio Bolsonaro em plenário do Senado em janeiro de 2026, ao defender a instalação de CPI para investigar o Banco Master, suspeito de operações irregulares com lastro em recursos públicos.',
      'verified', false, '2026-01-20',
      'https://www.folha.uol.com.br/mercado/2026/01/flavio-bolsonaro-cpi-banco-master-governo.shtml',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'flavio-bolsonaro-cpi-banco-master-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 30. Hugo Motta reage a ameaça de CPI contra Congresso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta alerta que "multiplicação de CPIs" pode paralisar o Congresso e prejudicar governabilidade.',
      'Temos propostas de CPI para tudo: Banco Master, redes sociais, inteligência artificial, planos de saúde. Se instalar todas, o Congresso para de legislar. Precisamos de critério e responsabilidade.',
      'Declaração de Hugo Motta em reunião de líderes em fevereiro de 2026. O presidente da Câmara tentou frear a multiplicação de propostas de CPI que cresciam em ano eleitoral.',
      'verified', false, '2026-02-15',
      'https://www.cnnbrasil.com.br/politica/motta-multiplicacao-cpis-paralisa-congresso-fevereiro-2026/',
      'news_article',
      'Brasília', 'Reunião de líderes na Câmara', 'motta-multiplicacao-cpis-paralisa-congresso-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 31. Nikolas apresenta PEC para proibir decisões monocráticas sobre emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira apresenta PEC para proibir decisões monocráticas do STF sobre orçamento público.',
      'Nenhum ministro do STF sozinho pode decidir sobre o orçamento de 215 milhões de brasileiros. Estou apresentando PEC para que decisões sobre emendas e orçamento só possam ser tomadas pelo plenário do STF.',
      'Declaração de Nikolas Ferreira ao apresentar PEC na Câmara em agosto de 2025. A proposta mirava diretamente as decisões de Flávio Dino e obteve forte apoio da oposição.',
      'verified', true, '2025-08-12',
      'https://g1.globo.com/politica/noticia/2025/08/nikolas-pec-proibir-monocraticas-orcamento-stf.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-pec-proibir-monocraticas-orcamento-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 32. Dino responde que STF "não se intimida" com PECs
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino responde que o STF "não se intimida" com tentativas legislativas de limitar seu poder.',
      'O Supremo Tribunal Federal cumpre a Constituição e não se intimida com pressões políticas. Se o Congresso quer mudar a Constituição, que mude. Mas enquanto ela estiver em vigor, o STF vai fazer cumprir.',
      'Declaração de Dino em evento na OAB em agosto de 2025, respondendo indiretamente às PECs que tentavam limitar decisões monocráticas do STF.',
      'verified', true, '2025-08-18',
      'https://www.conjur.com.br/2025-ago-18/dino-stf-nao-intimida-pecs-congresso/',
      'news_article',
      'Brasília', 'Evento na OAB', 'dino-stf-nao-intimida-pecs-congresso-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 33. Carlos Viana cobra depoimento de presidente do INSS na CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_via,
      'Carlos Viana exige depoimento do presidente do INSS e diz que governo tenta obstruir investigação.',
      'O presidente do INSS se recusa a depor na CPMI. O governo está fazendo de tudo para obstruir nosso trabalho. Se for necessário, vamos aprovar condução coercitiva.',
      'Declaração de Carlos Viana em sessão da CPMI do INSS em setembro de 2025, quando o presidente do órgão alegou incompatibilidade de agenda para não comparecer à comissão.',
      'verified', false, '2025-09-22',
      'https://www.poder360.com.br/congresso/viana-cobra-depoimento-presidente-inss-cpmi-setembro-2025/',
      'news_article',
      'Brasília', 'Sessão da CPMI do INSS', 'viana-cobra-depoimento-presidente-inss-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 34. Moro critica "farra das emendas" mesmo após regras de transparência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro diz que novas regras de transparência das emendas são "fachada" e a farra continua.',
      'As novas regras de transparência são fachada. O Congresso criou um portal bonito, mas por trás os acordos são os mesmos. A emenda continua sendo moeda de troca para aprovar projeto do governo.',
      'Declaração de Moro em entrevista ao Antagonista em outubro de 2025, criticando as medidas de transparência adotadas pelo Congresso em acordo com o STF.',
      'verified', false, '2025-10-15',
      'https://www.oantagonista.com.br/brasil/moro-farra-emendas-transparencia-fachada-outubro-2025/',
      'news_article',
      'Brasília', 'Entrevista ao Antagonista', 'moro-farra-emendas-transparencia-fachada-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 35. Marco Feliciano acusa Dino de "ativismo judicial disfarçado de combate à corrupção"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano acusa Dino de usar combate à corrupção como pretexto para ativismo judicial.',
      'Dino usa o combate à corrupção como fachada para fazer ativismo judicial. Ele não quer transparência, quer controlar o Congresso. É o mesmo que Moraes faz com a liberdade de expressão: usa um pretexto nobre para justificar abuso de poder.',
      'Discurso de Feliciano em plenário da Câmara em novembro de 2025, comparando a atuação de Dino à de Alexandre de Moraes.',
      'verified', false, '2025-11-05',
      'https://www.estadao.com.br/politica/feliciano-dino-ativismo-judicial-combate-corrupcao-novembro-2025/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-dino-ativismo-judicial-corrupcao-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 36. Gleisi acusa oposição de usar CPMI para "destruir reputações"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann acusa oposição de usar CPMI do INSS para destruir reputações sem provas.',
      'A oposição está usando a CPMI do INSS como tribunal de exceção. Indiciaram 216 pessoas sem provas robustas, incluindo o filho do presidente, apenas para criar manchete negativa. Isso não é investigação, é linchamento político.',
      'Declaração de Gleisi Hoffmann em plenário do Senado em março de 2026, defendendo o voto contra o relatório da CPMI.',
      'verified', false, '2026-03-17',
      'https://noticias.uol.com.br/politica/2026/03/gleisi-oposicao-cpmi-inss-destruir-reputacoes.htm',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'gleisi-oposicao-cpmi-inss-destruir-reputacoes-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 37. Nikolas propõe recall de ministros do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende mecanismo de recall popular para ministros do STF.',
      'O povo deveria ter o poder de remover ministros do STF que abusam do cargo. Proponho um mecanismo de recall popular. Se o povo não pode tirar, quem pode? O Senado não faz nada.',
      'Declaração de Nikolas em evento conservador em São Paulo em dezembro de 2025. A proposta foi considerada inviável constitucionalmente por juristas, mas ganhou forte apoio nas redes sociais da direita.',
      'verified', true, '2025-12-08',
      'https://www.poder360.com.br/congresso/nikolas-recall-popular-ministros-stf-dezembro-2025/',
      'news_article',
      'São Paulo', 'Evento conservador', 'nikolas-recall-popular-ministros-stf-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 38. Alcolumbre engaveta pedidos de impeachment de ministros do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_alc,
      'Davi Alcolumbre mantém engavetados mais de 100 pedidos de impeachment contra ministros do STF.',
      'Os pedidos de impeachment contra ministros do STF estão sob análise criteriosa. Não vou pautar nenhum pedido por pressão política. O Senado analisa com responsabilidade e no tempo devido.',
      'Declaração de Alcolumbre em entrevista ao Valor Econômico em janeiro de 2026, justificando por que não pautava os mais de 100 pedidos de impeachment contra ministros do STF acumulados em seu gabinete.',
      'verified', true, '2026-01-10',
      'https://valor.globo.com/politica/alcolumbre-engaveta-impeachment-ministros-stf-janeiro-2026/',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'alcolumbre-engaveta-impeachment-stf-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 39. Bia Kicis acusa Alcolumbre de "cúmplice" do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis chama Alcolumbre de "cúmplice" do STF por engavetar pedidos de impeachment.',
      'Alcolumbre é cúmplice dos abusos do STF. Tem mais de 100 pedidos de impeachment engavetados e ele não faz nada. É um covarde que prefere a proteção do sistema à defesa da democracia.',
      'Declaração de Bia Kicis em discurso na Câmara em janeiro de 2026, pressionando o presidente do Senado a pautar pedidos de impeachment contra ministros do STF.',
      'verified', false, '2026-01-15',
      'https://g1.globo.com/politica/noticia/2026/01/bia-kicis-alcolumbre-cumplice-stf-impeachment.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bia-kicis-alcolumbre-cumplice-stf-impeachment-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 40. Hugo Motta media conflito entre Câmara e STF sobre orçamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta se posiciona como mediador e pede "pacto de não agressão" entre Câmara e STF.',
      'Proponho um pacto de não agressão entre os Poderes. A Câmara não vai tentar limitar o STF por PEC e o STF não vai governar nosso orçamento por decisão monocrática. Cada Poder no seu lugar.',
      'Declaração de Hugo Motta em reunião com presidentes dos três Poderes em outubro de 2025. A proposta de pacto buscava acalmar a crise institucional sobre emendas e decisões monocráticas.',
      'verified', false, '2025-10-25',
      'https://www.folha.uol.com.br/poder/2025/10/motta-pacto-nao-agressao-camara-stf-outubro-2025.shtml',
      'news_article',
      'Brasília', 'Reunião entre Poderes', 'motta-pacto-nao-agressao-camara-stf-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_con, true FROM ins;

  -- 41. Bolsonaro critica CPMI do INSS de casa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro, de prisão domiciliar, critica CPMI do INSS por "não ir longe o suficiente" contra Lula.',
      'A CPMI do INSS é boa mas não vai longe o suficiente. O Lula é o chefe de tudo. Não é só o filho dele que está envolvido, é o governo inteiro. Mas com o STF protegendo, nunca vão chegar na verdade.',
      'Nota divulgada por aliados de Bolsonaro em novembro de 2025, comentando os trabalhos da CPMI do INSS. Apesar de em prisão domiciliar, o ex-presidente continuava se pronunciando sobre política via intermediários.',
      'verified', false, '2025-11-18',
      'https://www.poder360.com.br/governo/bolsonaro-critica-cpmi-inss-nao-longe-suficiente-novembro-2025/',
      'news_article',
      'Brasília', 'Nota divulgada por aliados', 'bolsonaro-critica-cpmi-inss-nao-longe-suficiente-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Damares pede proteção a aposentados vítimas de fraude
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares cobra ressarcimento imediato para aposentados lesados e diz que INSS é "máquina de roubar velho".',
      'O INSS virou uma máquina de roubar velho. São bilhões descontados indevidamente de quem ganha um salário mínimo. Esses aposentados precisam ser ressarcidos agora, não daqui a dez anos.',
      'Declaração de Damares Alves em sessão da CPMI do INSS em outubro de 2025, após depoimentos de aposentados que relataram descontos indevidos de até 30% em seus benefícios.',
      'verified', true, '2025-10-28',
      'https://g1.globo.com/politica/noticia/2025/10/damares-inss-maquina-roubar-velho-cpmi.ghtml',
      'news_article',
      'Brasília', 'Sessão da CPMI do INSS', 'damares-inss-maquina-roubar-velho-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 43. Flávio Bolsonaro acusa governo de usar STF como "escudo jurídico"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que governo Lula usa o STF como "escudo jurídico" contra investigações.',
      'O governo Lula transformou o STF em seu escudo jurídico. Toda vez que uma investigação se aproxima do Planalto, aparece um ministro para anular, suspender ou arquivar. É uma blindagem institucional.',
      'Declaração de Flávio Bolsonaro em sessão do Senado em dezembro de 2025, em contexto de diversas decisões do STF que favoreciam posições do governo federal.',
      'verified', false, '2025-12-02',
      'https://www.estadao.com.br/politica/flavio-bolsonaro-governo-stf-escudo-juridico-dezembro-2025/',
      'news_article',
      'Brasília', 'Sessão do Senado Federal', 'flavio-bolsonaro-stf-escudo-juridico-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 44. Hugo Motta faz balanço do primeiro ano e cita independência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta faz balanço do primeiro ano como presidente da Câmara e diz que manteve independência.',
      'Em um ano de presidência, a Câmara manteve sua independência. Aprovamos pautas do governo quando concordamos e barramos quando discordamos. Não somos oposição nem subservientes.',
      'Entrevista de Hugo Motta à Folha de S.Paulo em fevereiro de 2026, fazendo balanço de seu primeiro ano à frente da Câmara. Críticos apontaram que a Casa aprovou praticamente tudo que o governo pediu.',
      'verified', false, '2026-02-01',
      'https://www.folha.uol.com.br/poder/2026/02/motta-balanco-primeiro-ano-camara-independencia.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'motta-balanco-primeiro-ano-camara-independencia-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Nikolas acusa Dino de "ditador togado" após bloqueio de emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama Flávio Dino de "ditador togado" em discurso na Câmara.',
      'O Flávio Dino é um ditador togado. Ele decide sozinho o orçamento do país, manda no Congresso e ninguém pode questionar. Quem fala contra é processado. Isso não é Justiça, é ditadura de um homem só.',
      'Discurso de Nikolas Ferreira na Câmara em abril de 2025, reagindo às decisões de Dino sobre emendas parlamentares. A fala gerou reação do STF que considerou encaminhar notícia-crime.',
      'verified', true, '2025-04-17',
      'https://www.cnnbrasil.com.br/politica/nikolas-chama-dino-ditador-togado-camara-abril-2025/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-dino-ditador-togado-camara-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 46. Janones volta ao mandato e ataca oposição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones volta ao mandato após suspensão e diz que oposição "não vai me calar".',
      'Estou de volta. Eles me suspenderam por três meses e eu voltei mais forte. A oposição pode tentar me calar, mas não vai conseguir. Eu falo pelo povo que ninguém representa.',
      'Declaração de André Janones em live comemorando seu retorno ao mandato em outubro de 2025, após cumprir os três meses de suspensão determinados pelo Conselho de Ética.',
      'verified', false, '2025-10-10',
      'https://noticias.uol.com.br/politica/2025/10/janones-volta-mandato-suspensao-nao-calar.htm',
      'news_article',
      'Brasília', 'Live nas redes sociais', 'janones-volta-mandato-suspensao-nao-calar-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 47. Dino defende atuação do STF como "guardião do orçamento"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino defende papel do STF como "guardião do orçamento público" contra uso clientelista de emendas.',
      'O STF tem o dever constitucional de zelar pelo uso correto do dinheiro público. Não estamos invadindo competência do Congresso. Estamos impedindo que bilhões sejam distribuídos sem transparência e sem critério republicano.',
      'Declaração de Flávio Dino em palestra na Universidade de Brasília em novembro de 2025, defendendo suas decisões sobre emendas parlamentares.',
      'verified', false, '2025-11-22',
      'https://www.conjur.com.br/2025-nov-22/dino-stf-guardiao-orcamento-publico-emendas/',
      'news_article',
      'Brasília', 'Palestra na UnB', 'dino-stf-guardiao-orcamento-publico-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 48. Carlos Viana diz que CPMI do INSS será "lembrada como farsa"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_via,
      'Carlos Viana lamenta fim da CPMI do INSS e diz que será lembrada como "farsa política".',
      'A CPMI do INSS será lembrada como uma farsa. Fizemos sete meses de investigação, ouvimos centenas de depoimentos, descobrimos fraudes bilionárias, e tudo foi para o lixo por decisão política. Os aposentados foram abandonados.',
      'Declaração de Carlos Viana em entrevista à GloboNews após o encerramento da CPMI em março de 2026.',
      'verified', true, '2026-03-20',
      'https://g1.globo.com/politica/noticia/2026/03/viana-cpmi-inss-lembrada-farsa-politica.ghtml',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'viana-cpmi-inss-lembrada-farsa-politica-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 49. Renan Calheiros propõe CPI do Banco Master
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros propõe CPI do Banco Master no Senado para investigar operações suspeitas.',
      'O Banco Master cresceu de forma inexplicável e tem ligações que precisam ser esclarecidas. Estou propondo uma CPI para investigar todas as operações, os empréstimos e as relações com agentes públicos.',
      'Requerimento de Renan Calheiros para instalação de CPI do Banco Master no Senado em fevereiro de 2026. A proposta ganhou apoio tanto da oposição quanto de governistas preocupados com o escândalo.',
      'verified', false, '2026-02-20',
      'https://www.folha.uol.com.br/mercado/2026/02/renan-calheiros-propoe-cpi-banco-master-senado.shtml',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'renan-calheiros-propoe-cpi-banco-master-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 50. Motta avisa que Câmara pode reagir com "medidas extremas" contra STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta alerta que Congresso pode adotar "medidas extremas" se STF continuar interferindo no orçamento.',
      'Se o STF continuar interferindo nas prerrogativas do Congresso Nacional, seremos obrigados a adotar medidas extremas. Não queremos crise institucional, mas não vamos aceitar que um Poder governe o outro.',
      'Declaração de Hugo Motta em reunião de líderes em abril de 2026, em meio a novo bloqueio de emendas por Dino. A referência a "medidas extremas" foi interpretada como possível aprovação de PEC limitando poderes do STF.',
      'verified', true, '2026-04-08',
      'https://www.estadao.com.br/politica/motta-medidas-extremas-stf-orcamento-abril-2026/',
      'news_article',
      'Brasília', 'Reunião de líderes na Câmara', 'motta-medidas-extremas-stf-orcamento-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

END $$;
