-- Batch 74: Governors on public security, police operations, megaoperações
-- Period: Jan 2023 - Apr 2026
-- Theme: Security rhetoric, lethal operations, militarization, tough-on-crime
DO $$
DECLARE
  v_castro      UUID;
  v_tarcisio    UUID;
  v_caiado      UUID;
  v_wlima       UUID;
  v_ibaneis     UUID;
  v_elmano      UUID;
  v_jeronimo    UUID;
  v_helder      UUID;
  v_raquel      UUID;
  v_zema        UUID;
  v_ratinho     UUID;
  v_azevedo     UUID;
  v_leite       UUID;
  v_casagrande  UUID;
  v_dantas      UUID;
  v_mitidieri   UUID;
  v_mauro       UUID;
  v_riedel      UUID;
  v_fatima      UUID;
  v_brandao     UUID;
  v_gladson     UUID;
  v_denarium    UUID;
  v_clecio      UUID;
  v_wbarbosa    UUID;
  v_jorginho    UUID;
  v_fonteles    UUID;
  v_lewan       UUID;
  v_mucio       UUID;
  v_lula        UUID;
  v_motta       UUID;
  v_alcolumbre  UUID;
  v_rmarinho    UUID;
  v_nikolas     UUID;
  v_moraes      UUID;
  v_dino        UUID;
  v_guajajara   UUID;

  c_antidem    UUID;
  c_violencia  UUID;
  c_odio       UUID;
  c_abuso      UUID;
  c_autorit    UUID;
  c_irresp     UUID;
  c_intim      UUID;
  c_racismo    UUID;
  c_confint    UUID;
  c_ameaca     UUID;
  c_desinform  UUID;
BEGIN
  SELECT id INTO v_castro     FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_caiado     FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_wlima      FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_ibaneis    FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_elmano     FROM politicians WHERE slug = 'elmano-de-freitas';
  SELECT id INTO v_jeronimo   FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_helder     FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_raquel     FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_zema       FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_ratinho    FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_azevedo    FROM politicians WHERE slug = 'joao-azevedo';
  SELECT id INTO v_leite      FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_casagrande FROM politicians WHERE slug = 'renato-casagrande';
  SELECT id INTO v_dantas     FROM politicians WHERE slug = 'paulo-dantas';
  SELECT id INTO v_mitidieri  FROM politicians WHERE slug = 'fabio-mitidieri';
  SELECT id INTO v_mauro      FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_riedel     FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_fatima     FROM politicians WHERE slug = 'fatima-bezerra';
  SELECT id INTO v_brandao    FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_gladson    FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_denarium   FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_clecio     FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wbarbosa   FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_jorginho   FROM politicians WHERE slug = 'jorginho-mello';
  SELECT id INTO v_fonteles   FROM politicians WHERE slug = 'rafael-fonteles';
  SELECT id INTO v_lewan      FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_mucio      FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_motta      FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alcolumbre FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_rmarinho   FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_moraes     FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_dino       FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_guajajara  FROM politicians WHERE slug = 'sonia-guajajara';

  SELECT id INTO c_antidem   FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_violencia FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odio      FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abuso     FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_autorit   FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irresp    FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_intim     FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_racismo   FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_confint   FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_ameaca    FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_desinform FROM categories WHERE slug = 'desinformacao';

  WITH ins_1 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro defende megaoperação no Complexo do Alemão que deixou 8 mortos.', 'Não vamos recuar. Bandido bom é bandido preso ou morto em confronto.', 'Declaração após operação no Alemão com 8 mortos, incluindo um adolescente.',
      'verified', true, '2023-02-10',
      'https://oglobo.globo.com/rio/noticia/2023/02/castro-defende-operacao-alemao.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Operação Complexo do Alemão', 'governor-security-b74-1'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_1;

  WITH ins_2 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro minimiza mortes em operação e chama críticos de ''defensores de bandidos''.', 'Quem critica a polícia do Rio defende traficante. É simples assim.', 'Entrevista coletiva após operação policial em Belford Roxo.',
      'verified', false, '2023-03-15',
      'https://extra.globo.com/casos-de-policia/castro-rebate-criticos-operacao.html', 'news_article',
      4,
      'Palácio Guanabara', 'Coletiva de imprensa', 'governor-security-b74-2'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_2;

  WITH ins_3 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende Operação Escudo mesmo com 28 mortos na Baixada Santista.', 'A polícia de São Paulo não vai se intimidar. Continuaremos com a Operação Escudo.', 'Defesa da operação após denúncias de execuções em Guarujá.',
      'verified', true, '2023-08-10',
      'https://www1.folha.uol.com.br/cotidiano/2023/08/tarcisio-defende-operacao-escudo-baixada-santista.shtml', 'news_article',
      5,
      'São Paulo', 'Operação Escudo Baixada Santista', 'governor-security-b74-3'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_3;

  WITH ins_4 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio afirma que não vai investigar denúncias de execução na Baixada.', 'Não vou abrir CPI contra minha polícia. Eles estão fazendo o trabalho deles.', 'Resposta a pedidos de investigação da OAB e do MP sobre mortes em Guarujá.',
      'verified', false, '2023-08-22',
      'https://www1.folha.uol.com.br/cotidiano/2023/08/tarcisio-recusa-cpi-operacao-escudo.shtml', 'news_article',
      4,
      'Palácio dos Bandeirantes', 'Entrevista', 'governor-security-b74-4'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_4;

  WITH ins_5 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado afirma que ''bandido tem que morrer'' em entrevista à imprensa.', 'Em Goiás bandido morre. Isso é política pública e o povo aprova.', 'Entrevista sobre segurança pública em ano eleitoral.',
      'verified', true, '2023-04-05',
      'https://www.correiobraziliense.com.br/politica/2023/04/caiado-bandido-tem-que-morrer.html', 'news_article',
      5,
      'Goiânia', 'Entrevista coletiva', 'governor-security-b74-5'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_5;

  WITH ins_6 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado chama defensores de direitos humanos de ''advogados de bandido''.', 'Esses defensores de direitos humanos são advogados de bandido. Não me representam.', 'Discurso em evento da PM de Goiás.',
      'verified', false, '2023-05-20',
      'https://www.gazetadopovo.com.br/republica/caiado-direitos-humanos-advogados-bandido/', 'news_article',
      4,
      'Goiânia', 'Evento PM-GO', 'governor-security-b74-6'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_6;

  WITH ins_7 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima defende operação no Amazonas mesmo com denúncias de tortura.', 'A polícia do Amazonas está no limite da legalidade e vai continuar assim.', 'Fala após operação em comunidade ribeirinha com três mortes.',
      'verified', false, '2023-06-12',
      'https://amazonasatual.com.br/wilson-lima-defende-operacao-policia/', 'news_article',
      4,
      'Manaus', 'Operação Manaus', 'governor-security-b74-7'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_7;

  WITH ins_8 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima minimiza crise Yanomami e culpa governo federal.', 'A crise Yanomami é problema do governo federal, não do estado. Não tenho responsabilidade.', 'Entrevista sobre a emergência humanitária em terras Yanomami.',
      'verified', false, '2023-01-25',
      'https://amazonasatual.com.br/wilson-lima-crise-yanomami-federal/', 'news_article',
      3,
      'Manaus', 'Coletiva', 'governor-security-b74-8'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_8;

  WITH ins_9 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende uso da força em protestos no DF.', 'Quem vier quebrar o DF vai encontrar a polícia. Sem diálogo com vândalo.', 'Após protestos no Eixo Monumental.',
      'verified', false, '2023-03-08',
      'https://www.correiobraziliense.com.br/politica/2023/03/ibaneis-defende-forca-protestos.html', 'news_article',
      3,
      'Brasília', 'Coletiva GDF', 'governor-security-b74-9'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_9;

  WITH ins_10 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano defende intervenção federal em crise de segurança no Ceará.', 'Precisamos da Força Nacional. A situação exige apoio federal sem vergonha.', 'Pedido formal de intervenção após onda de ataques do PCC no Ceará.',
      'verified', false, '2023-04-18',
      'https://www.opovo.com.br/noticias/ceara/2023/04/elmano-pede-forca-nacional.html', 'news_article',
      2,
      'Fortaleza', 'Coletiva Palácio da Abolição', 'governor-security-b74-10'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_10;

  WITH ins_11 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo Rodrigues defende polícia da Bahia após chacina em Salvador.', 'Nossa polícia faz seu trabalho. Chacina é resultado de enfrentamento necessário.', 'Declaração após chacina com 9 mortos no bairro de Itapuã.',
      'verified', true, '2023-07-14',
      'https://www.correio24horas.com.br/salvador/jeronimo-defende-pm-chacina-itapua-0723', 'news_article',
      4,
      'Salvador', 'Coletiva Palácio de Ondina', 'governor-security-b74-11'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_11;

  WITH ins_12 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo minimiza letalidade recorde da PM baiana.', 'A Bahia é grande. Os números precisam ser vistos em contexto, não em manchete.', 'Resposta a relatório do Fórum Brasileiro de Segurança Pública.',
      'verified', false, '2023-07-20',
      'https://www.correio24horas.com.br/salvador/jeronimo-letalidade-pm-ba-0723', 'news_article',
      3,
      'Salvador', 'Entrevista', 'governor-security-b74-12'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_12;

  WITH ins_13 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder Barbalho defende forças de segurança no Pará após operação.', 'Nossos homens cumpriram a lei. Não há o que questionar.', 'Após operação em Marabá com 4 mortos.',
      'verified', false, '2023-05-30',
      'https://oglobo.globo.com/brasil/noticia/2023/05/helder-defende-pm-para.ghtml', 'news_article',
      3,
      'Belém', 'Coletiva', 'governor-security-b74-13'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_13;

  WITH ins_14 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra defende megaoperação em Pernambuco com 12 mortos.', 'Pernambuco não vai se curvar ao crime. A operação foi um sucesso.', 'Após operação em Jaboatão dos Guararapes.',
      'verified', true, '2023-09-05',
      'https://jc.ne10.uol.com.br/pernambuco/2023/09/raquel-lyra-defende-operacao.html', 'news_article',
      4,
      'Recife', 'Coletiva Palácio do Campo das Princesas', 'governor-security-b74-14'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_14;

  WITH ins_15 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema defende porte de armas e critica desarmamento.', 'Cidadão de bem tem que estar armado. O bandido não respeita decreto.', 'Evento em Belo Horizonte com apoiadores.',
      'verified', false, '2023-02-20',
      'https://www.em.com.br/app/noticia/politica/2023/02/zema-porte-armas-cidadao-bem.shtml', 'news_article',
      3,
      'Belo Horizonte', 'Evento partidário', 'governor-security-b74-15'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_15;

  WITH ins_16 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema chama MST de ''organização criminosa'' após ocupação.', 'MST é organização criminosa. Não vou tolerar invasão de propriedade em Minas.', 'Após ocupação de fazenda em Minas Gerais.',
      'verified', true, '2023-04-02',
      'https://www.em.com.br/app/noticia/politica/2023/04/zema-mst-organizacao-criminosa.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Coletiva', 'governor-security-b74-16'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_16;

  WITH ins_17 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho Junior defende Operação Hórus na fronteira do Paraná.', 'Vamos blindar a fronteira. Quem passar vai encontrar a polícia.', 'Anúncio de reforço policial na fronteira com Paraguai.',
      'verified', false, '2023-03-12',
      'https://www.gazetadopovo.com.br/parana/ratinho-operacao-horus-fronteira/', 'news_article',
      2,
      'Foz do Iguaçu', 'Lançamento da operação', 'governor-security-b74-17'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_17;

  WITH ins_18 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jorginho, 'Jorginho Mello defende letalidade policial em Santa Catarina.', 'Nossa PM é eficiente. Se mata é porque bandido reagiu.', 'Entrevista após dados sobre letalidade policial em SC.',
      'verified', false, '2023-06-08',
      'https://ndmais.com.br/politica/jorginho-mello-defende-letalidade-pm-sc/', 'news_article',
      4,
      'Florianópolis', 'Coletiva', 'governor-security-b74-18'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_18;

  WITH ins_19 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro defende Bolsonaro e critica STF em evento público.', 'O STF persegue patriotas. Precisamos voltar a respeitar o povo.', 'Em ato pró-Bolsonaro em Copacabana.',
      'verified', true, '2023-02-26',
      'https://oglobo.globo.com/politica/noticia/2023/02/castro-defende-bolsonaro-ato.ghtml', 'news_article',
      4,
      'Rio de Janeiro', 'Ato em Copacabana', 'governor-security-b74-19'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_19;

  WITH ins_20 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio nega crise em câmeras corporais desligadas em operação.', 'As câmeras funcionaram conforme o protocolo. Não há o que esconder.', 'Resposta a denúncias de que câmeras foram desligadas na Operação Escudo.',
      'verified', false, '2023-09-01',
      'https://www1.folha.uol.com.br/cotidiano/2023/09/tarcisio-cameras-corporais-escudo.shtml', 'news_article',
      4,
      'São Paulo', 'Coletiva', 'governor-security-b74-20'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins_20;

  WITH ins_21 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado ataca CPMI do 8 de Janeiro e protege bolsonaristas.', 'CPMI do 8 de Janeiro é perseguição política. Goiás não vai colaborar.', 'Entrevista sobre colaboração com a CPMI.',
      'verified', true, '2023-06-15',
      'https://www.correiobraziliense.com.br/politica/2023/06/caiado-cpmi-perseguicao.html', 'news_article',
      4,
      'Goiânia', 'Entrevista', 'governor-security-b74-21'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_21;

  WITH ins_22 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima defende aumento de efetivo sem controle.', 'A PM do Amazonas vai crescer 30%. E sem essa de controle externo.', 'Anúncio de edital de concurso para PM-AM.',
      'verified', false, '2023-07-02',
      'https://amazonasatual.com.br/wilson-lima-efetivo-pm/', 'news_article',
      2,
      'Manaus', 'Lançamento de concurso', 'governor-security-b74-22'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_22;

  WITH ins_23 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis afasta secretário de segurança após 8 de Janeiro.', 'Fui surpreendido. Não compactuo com invasão de prédios públicos.', 'Declaração após afastamento determinado por Moraes.',
      'verified', false, '2023-01-09',
      'https://www.correiobraziliense.com.br/politica/2023/01/ibaneis-afastado-8-janeiro.html', 'news_article',
      3,
      'Brasília', 'Nota oficial', 'governor-security-b74-23'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_23;

  WITH ins_24 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano defende apoio do Exército contra facções no Ceará.', 'Precisamos de tropas federais. Não temos vergonha de pedir ajuda.', 'Após decreto de Lula autorizando Força Nacional.',
      'verified', false, '2023-05-10',
      'https://www.opovo.com.br/noticias/ceara/2023/05/elmano-exercito-faccoes.html', 'news_article',
      2,
      'Fortaleza', 'Coletiva', 'governor-security-b74-24'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_24;

  WITH ins_25 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra anuncia Juntos pela Segurança após chacinas.', 'O programa Juntos pela Segurança vai dar resposta definitiva ao crime.', 'Lançamento do programa estadual.',
      'verified', false, '2023-03-20',
      'https://jc.ne10.uol.com.br/pernambuco/2023/03/raquel-juntos-seguranca.html', 'news_article',
      1,
      'Recife', 'Lançamento do programa', 'governor-security-b74-25'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_25;

  WITH ins_26 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema sugere tropas federais para ''proteger propriedades'' de invasões.', 'Preciso que o Exército venha para Minas proteger propriedade privada.', 'Após declarações sobre invasões rurais.',
      'verified', false, '2023-04-15',
      'https://www.em.com.br/app/noticia/politica/2023/04/zema-exercito-propriedades.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Entrevista', 'governor-security-b74-26'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_26;

  WITH ins_27 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho Junior defende militarização de escolas públicas.', 'Colégio cívico-militar funciona. Vamos expandir em todo o Paraná.', 'Anúncio de expansão de escolas cívico-militares no PR.',
      'verified', false, '2023-02-14',
      'https://www.gazetadopovo.com.br/parana/ratinho-colegios-civico-militares/', 'news_article',
      3,
      'Curitiba', 'Anúncio de programa', 'governor-security-b74-27'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_27;

  WITH ins_28 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_leite, 'Eduardo Leite defende Brigada Militar após denúncias de abusos.', 'Nossa Brigada é referência nacional. Denúncias pontuais não mudam isso.', 'Após relatório da Defensoria Pública do RS.',
      'verified', false, '2023-05-25',
      'https://gauchazh.clicrbs.com.br/seguranca/noticia/2023/05/leite-defende-brigada.html', 'news_article',
      3,
      'Porto Alegre', 'Coletiva', 'governor-security-b74-28'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_28;

  WITH ins_29 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande defende operação no Espírito Santo com 5 mortes.', 'Operação legal, legítima e necessária. Sem recuo.', 'Após operação em Serra-ES.',
      'verified', false, '2023-06-01',
      'https://www.folhavitoria.com.br/politica/casagrande-operacao-serra/', 'news_article',
      3,
      'Vitória', 'Coletiva Palácio Anchieta', 'governor-security-b74-29'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_29;

  WITH ins_30 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_dantas, 'Paulo Dantas anuncia reforço policial em Maceió após chacina.', 'Vamos responder com toda a força do Estado.', 'Após chacina em bairro de Maceió.',
      'verified', false, '2023-08-12',
      'https://www.tnh1.com.br/noticia/nid/paulo-dantas-reforco-maceio-0823/', 'news_article',
      2,
      'Maceió', 'Coletiva', 'governor-security-b74-30'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_30;

  WITH ins_31 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mitidieri, 'Mitidieri defende PM de Sergipe após dados de letalidade.', 'Nossa polícia é técnica e profissional. Não aceito generalização.', 'Resposta a reportagem sobre letalidade em Aracaju.',
      'verified', false, '2023-07-05',
      'https://www.f5news.com.br/politica/mitidieri-pm-sergipe/', 'news_article',
      3,
      'Aracaju', 'Coletiva', 'governor-security-b74-31'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_31;

  WITH ins_32 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mauro, 'Mauro Mendes defende operações de repressão em MT.', 'Mato Grosso não é terra de bandido. Vamos reprimir com rigor.', 'Evento de entrega de viaturas em Cuiabá.',
      'verified', false, '2023-03-29',
      'https://www.rdnews.com.br/politica/mauro-mendes-repressao-mt/', 'news_article',
      3,
      'Cuiabá', 'Entrega de viaturas', 'governor-security-b74-32'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_32;

  WITH ins_33 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Eduardo Riedel defende polícia de MS após denúncias em aldeias.', 'A PM faz o papel dela. Indígena que infringe lei também responde.', 'Após conflito em terra indígena Guarani-Kaiowá.',
      'verified', false, '2023-04-10',
      'https://www.campograndenews.com.br/politica/riedel-pm-aldeia', 'news_article',
      5,
      'Campo Grande', 'Coletiva', 'governor-security-b74-33'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_33;

  WITH ins_34 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fatima, 'Fátima Bezerra defende intervenção federal no RN após ataques.', 'Pedimos apoio federal com responsabilidade. O RN precisa de ajuda.', 'Após onda de ataques em Natal.',
      'verified', false, '2023-03-15',
      'https://www.tribunadonorte.com.br/fatima-bezerra-ataques-natal/', 'news_article',
      1,
      'Natal', 'Coletiva', 'governor-security-b74-34'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_34;

  WITH ins_35 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_brandao, 'Carlos Brandão defende PM do Maranhão após operação letal.', 'Nossa polícia responde com firmeza. Quem discorda que critique.', 'Após operação em São Luís com 3 mortos.',
      'verified', false, '2023-05-18',
      'https://imirante.com/oestadoma/brandao-pm-maranhao/', 'news_article',
      3,
      'São Luís', 'Coletiva', 'governor-security-b74-35'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_35;

  WITH ins_36 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_gladson, 'Gladson Camelí defende PM do Acre após denúncia de tortura.', 'Casos isolados não representam a PM do Acre. Nossa polícia é boa.', 'Resposta a relatório da Defensoria.',
      'verified', false, '2023-06-28',
      'https://www.acritica.net/politica/gladson-cameli-pm-acre/', 'news_article',
      3,
      'Rio Branco', 'Coletiva', 'governor-security-b74-36'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_36;

  WITH ins_37 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_denarium, 'Denarium critica ação federal em terra Yanomami.', 'O governo federal invade Roraima. Nossa segurança sabe o que faz.', 'Durante crise humanitária Yanomami.',
      'verified', false, '2023-02-08',
      'https://folhabv.com.br/noticia/POLITICA/Denarium-yanomami-federal/', 'news_article',
      4,
      'Boa Vista', 'Coletiva', 'governor-security-b74-37'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_37;

  WITH ins_38 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_clecio, 'Clécio Luís defende reforço policial no Amapá.', 'Vamos garantir que o Amapá não vire rota de facção.', 'Lançamento de programa de segurança.',
      'verified', false, '2023-04-20',
      'https://selesnafes.com/2023/04/clecio-seguranca-amapa/', 'news_article',
      1,
      'Macapá', 'Lançamento', 'governor-security-b74-38'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_38;

  WITH ins_39 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wbarbosa, 'Wanderlei Barbosa defende PM do Tocantins após denúncias.', 'Minha polícia não tortura. Ponto final.', 'Após vídeo de abuso policial em Palmas.',
      'verified', false, '2023-07-25',
      'https://www.conexaoto.com.br/politica/wanderlei-pm-tocantins/', 'news_article',
      4,
      'Palmas', 'Coletiva', 'governor-security-b74-39'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_39;

  WITH ins_40 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fonteles, 'Rafael Fonteles defende polícia do Piauí em megaoperação.', 'Operação bem-sucedida. A polícia do Piauí está de parabéns.', 'Após operação com 4 mortos em Teresina.',
      'verified', false, '2023-08-30',
      'https://cidadeverde.com/noticias/fonteles-operacao-piaui-0823', 'news_article',
      3,
      'Teresina', 'Coletiva', 'governor-security-b74-40'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_40;

  WITH ins_41 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro promete ''não recuar um milímetro'' após mortes no Complexo da Maré.', 'Não recuo um milímetro. A polícia do Rio vai continuar entrando.', 'Após operação na Maré com 4 mortos.',
      'verified', false, '2023-11-20',
      'https://oglobo.globo.com/rio/noticia/2023/11/castro-nao-recuo-mare.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Coletiva', 'governor-security-b74-41'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_41;

  WITH ins_42 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende Rota após morte de 9 pessoas em operação.', 'A Rota é patrimônio da polícia paulista. Orgulho da nossa instituição.', 'Após operação da Rota em Osasco.',
      'verified', false, '2023-10-15',
      'https://www1.folha.uol.com.br/cotidiano/2023/10/tarcisio-defende-rota.shtml', 'news_article',
      4,
      'São Paulo', 'Evento PM-SP', 'governor-security-b74-42'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_42;

  WITH ins_43 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado defende armamento de GCM e ataca desarmamento de Lula.', 'Lula quer desarmar o cidadão e a polícia. Não vou permitir em Goiás.', 'Entrevista sobre política de armas.',
      'verified', false, '2023-05-03',
      'https://www.correiobraziliense.com.br/politica/2023/05/caiado-armamento-gcm.html', 'news_article',
      3,
      'Goiânia', 'Entrevista', 'governor-security-b74-43'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_43;

  WITH ins_44 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima minimiza denúncias de abuso contra ribeirinhos.', 'Ribeirinho reclama de tudo. A polícia está lá fazendo o trabalho.', 'Após denúncia de abuso em comunidade ribeirinha.',
      'verified', false, '2023-09-12',
      'https://amazonasatual.com.br/wilson-lima-ribeirinhos-pm/', 'news_article',
      4,
      'Manaus', 'Entrevista', 'governor-security-b74-44'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_44;

  WITH ins_45 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema critica indiciamento de Bolsonaro pela PF.', 'A PF virou polícia política. Estão perseguindo Bolsonaro.', 'Após indiciamento por joias sauditas.',
      'verified', false, '2023-07-10',
      'https://www.em.com.br/app/noticia/politica/2023/07/zema-pf-perseguicao.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Coletiva', 'governor-security-b74-45'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_45;

  WITH ins_46 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro celebra aprovação de pacote armamentista no Rio.', 'Aprovamos o pacote. A polícia do Rio vai ter fuzis, blindados e mais.', 'Após ALERJ aprovar pacote de segurança.',
      'verified', false, '2024-02-05',
      'https://oglobo.globo.com/rio/noticia/2024/02/castro-pacote-armamento-alerj.ghtml', 'news_article',
      3,
      'Rio de Janeiro', 'ALERJ', 'governor-security-b74-46'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_46;

  WITH ins_47 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende PM mesmo após vídeo de execução em Paraisópolis.', 'Vídeo fora de contexto. Minha PM tem protocolo, vamos aguardar apuração.', 'Após vídeo viralizar nas redes.',
      'verified', false, '2024-01-20',
      'https://www1.folha.uol.com.br/cotidiano/2024/01/tarcisio-video-paraisopolis.shtml', 'news_article',
      4,
      'São Paulo', 'Coletiva', 'governor-security-b74-47'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_47;

  WITH ins_48 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado ataca ministro da Justiça por política de direitos humanos.', 'Ministro da Justiça virou advogado de bandido. Isso é vergonhoso.', 'Ataque a Flávio Dino.',
      'verified', false, '2023-11-15',
      'https://www.correiobraziliense.com.br/politica/2023/11/caiado-dino-direitos-humanos.html', 'news_article',
      4,
      'Goiânia', 'Entrevista', 'governor-security-b74-48'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_48;

  WITH ins_49 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo defende PM baiana após terceiro ano como mais letal do país.', 'Nossos números refletem nosso contexto. Não aceito ranking como verdade.', 'Após FBSP publicar dados de letalidade.',
      'verified', false, '2024-03-25',
      'https://www.correio24horas.com.br/salvador/jeronimo-letalidade-2024/', 'news_article',
      4,
      'Salvador', 'Coletiva', 'governor-security-b74-49'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_49;

  WITH ins_50 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra defende operação em Pernambuco com 15 mortes.', 'A operação foi necessária. Não vamos nos intimidar.', 'Após operação em Recife.',
      'verified', false, '2024-02-28',
      'https://jc.ne10.uol.com.br/pernambuco/2024/02/raquel-lyra-operacao-15-mortes.html', 'news_article',
      5,
      'Recife', 'Coletiva', 'governor-security-b74-50'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_50;

  WITH ins_51 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema aciona PM contra ocupação de prédio em BH.', 'Invasão não é protesto. É crime. Mandei desocupar com PM.', 'Após ocupação de prédio público por movimento de moradia.',
      'verified', false, '2024-03-10',
      'https://www.em.com.br/app/noticia/politica/2024/03/zema-ocupacao-bh.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Coletiva', 'governor-security-b74-51'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_51;

  WITH ins_52 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro diz que ''o caveirão vai continuar rodando''.', 'O caveirão vai continuar rodando nas comunidades. Quem não quer confronto, não enfrente.', 'Entrevista sobre operações no Rio.',
      'verified', false, '2024-04-18',
      'https://extra.globo.com/casos-de-policia/castro-caveirao-continua.html', 'news_article',
      5,
      'Rio de Janeiro', 'Entrevista', 'governor-security-b74-52'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_52;

  WITH ins_53 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio mantém coronel investigado em cargo após denúncias.', 'Não vou afastar ninguém por pressão. Confio nos meus comandantes.', 'Apesar de denúncias contra comando da PM-SP.',
      'verified', false, '2024-02-12',
      'https://www1.folha.uol.com.br/cotidiano/2024/02/tarcisio-mantem-coronel.shtml', 'news_article',
      3,
      'São Paulo', 'Coletiva', 'governor-security-b74-53'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_confint, true FROM ins_53;

  WITH ins_54 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado critica PEC da Segurança Pública de Lula.', 'PEC de Lula centraliza. Vai acabar com a autonomia dos estados.', 'Durante debate sobre PEC da Segurança Pública.',
      'verified', false, '2024-04-10',
      'https://www.correiobraziliense.com.br/politica/2024/04/caiado-pec-seguranca-publica.html', 'news_article',
      2,
      'Brasília', 'Reunião de governadores', 'governor-security-b74-54'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_54;

  WITH ins_55 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima defende uso de drones armados em operações.', 'Vamos usar a tecnologia a nosso favor. Drone com arma se for preciso.', 'Anúncio de aquisição de drones para PM-AM.',
      'verified', false, '2024-03-15',
      'https://amazonasatual.com.br/wilson-lima-drones-armados/', 'news_article',
      4,
      'Manaus', 'Apresentação de tecnologia', 'governor-security-b74-55'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_55;

  WITH ins_56 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende operação contra ambulantes no DF.', 'Ambulante clandestino tem que sair. A cidade precisa de ordem.', 'Após ação truculenta da PM contra ambulantes.',
      'verified', false, '2024-01-30',
      'https://www.correiobraziliense.com.br/cidades-df/2024/01/ibaneis-ambulantes.html', 'news_article',
      3,
      'Brasília', 'Coletiva', 'governor-security-b74-56'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_56;

  WITH ins_57 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano reconhece crise de segurança no Ceará.', 'A situação é grave e vamos reconhecer. Mas vamos virar o jogo.', 'Balanço semestral de segurança.',
      'verified', false, '2024-02-15',
      'https://www.opovo.com.br/noticias/ceara/2024/02/elmano-crise-seguranca.html', 'news_article',
      1,
      'Fortaleza', 'Balanço de governo', 'governor-security-b74-57'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_57;

  WITH ins_58 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo promete operações mais duras após chacina.', 'Resposta será ainda mais dura. Quem matar policial vai pagar.', 'Após morte de dois PMs em Salvador.',
      'verified', false, '2024-01-18',
      'https://www.correio24horas.com.br/salvador/jeronimo-resposta-mais-dura/', 'news_article',
      4,
      'Salvador', 'Coletiva', 'governor-security-b74-58'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_58;

  WITH ins_59 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder Barbalho defende ação contra garimpo ilegal.', 'Garimpo ilegal é crime. Vamos combater com todas as forças.', 'Após operação contra garimpo no sul do Pará.',
      'verified', false, '2024-03-05',
      'https://oglobo.globo.com/brasil/noticia/2024/03/helder-garimpo-ilegal.ghtml', 'news_article',
      1,
      'Belém', 'Coletiva', 'governor-security-b74-59'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_59;

  WITH ins_60 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra critica PEC da Segurança proposta por Lula.', 'A PEC tira autonomia do estado. Não vamos aceitar.', 'Reunião do Consórcio Nordeste.',
      'verified', false, '2024-04-22',
      'https://jc.ne10.uol.com.br/pernambuco/2024/04/raquel-pec-seguranca-autonomia.html', 'news_article',
      2,
      'Recife', 'Consórcio Nordeste', 'governor-security-b74-60'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_60;

  WITH ins_61 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema defende prisão preventiva de manifestantes pró-MST.', 'Invasor de propriedade tem que ser preso. Chega de tolerância.', 'Após prisões em fazenda ocupada.',
      'verified', false, '2024-02-20',
      'https://www.em.com.br/app/noticia/politica/2024/02/zema-prisao-mst.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Coletiva', 'governor-security-b74-61'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_61;

  WITH ins_62 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho critica PEC da Segurança Pública como ''intervenção''.', 'PEC de Lula é intervenção disfarçada. Paraná tem autonomia garantida.', 'Reunião de governadores do Sul.',
      'verified', false, '2024-04-15',
      'https://www.gazetadopovo.com.br/parana/ratinho-pec-seguranca-intervencao/', 'news_article',
      3,
      'Curitiba', 'Reunião sul-brasileira', 'governor-security-b74-62'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_62;

  WITH ins_63 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jorginho, 'Jorginho Mello defende Bope de Santa Catarina após morte de jovem.', 'Bope faz seu trabalho. Quem enfrenta morre, é assim.', 'Após morte de jovem em operação em Florianópolis.',
      'verified', false, '2024-03-28',
      'https://ndmais.com.br/politica/jorginho-mello-bope-morte-jovem/', 'news_article',
      5,
      'Florianópolis', 'Coletiva', 'governor-security-b74-63'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_63;

  WITH ins_64 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_leite, 'Eduardo Leite defende Brigada Militar após fiscalização em Porto Alegre.', 'A Brigada cumpre a lei. Fiscalização de bar é parte do trabalho.', 'Após polêmica em ação no centro de Porto Alegre.',
      'verified', false, '2024-02-08',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2024/02/leite-brigada-porto-alegre.html', 'news_article',
      2,
      'Porto Alegre', 'Coletiva', 'governor-security-b74-64'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_64;

  WITH ins_65 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande anuncia endurecimento contra facções no ES.', 'Vamos apertar. Quem for do PCC vai sentir em primeira mão.', 'Lançamento de programa antifacção.',
      'verified', false, '2024-03-18',
      'https://www.folhavitoria.com.br/politica/casagrande-antifaccao/', 'news_article',
      2,
      'Vitória', 'Lançamento de programa', 'governor-security-b74-65'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_65;

  WITH ins_66 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mauro, 'Mauro Mendes endurece fala contra invasão de terras em MT.', 'Quem invadir vai ser preso. MT não é terra de ninguém.', 'Discurso após conflito de terras.',
      'verified', false, '2024-01-25',
      'https://www.rdnews.com.br/politica/mauro-invasao-terras/', 'news_article',
      3,
      'Cuiabá', 'Coletiva', 'governor-security-b74-66'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_66;

  WITH ins_67 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Riedel defende PM contra denúncia em reserva indígena.', 'Vamos apurar mas sem dar razão a quem não tem.', 'Após denúncia de abuso em TI em MS.',
      'verified', false, '2024-04-03',
      'https://www.campograndenews.com.br/politica/riedel-pm-indigena-2024', 'news_article',
      4,
      'Campo Grande', 'Coletiva', 'governor-security-b74-67'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_67;

  WITH ins_68 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fatima, 'Fátima Bezerra critica morte de jovem por PM do RN.', 'Vou apurar. Abuso não pode ficar impune.', 'Após morte de jovem em operação em Natal.',
      'verified', false, '2024-02-25',
      'https://www.tribunadonorte.com.br/fatima-bezerra-morte-jovem/', 'news_article',
      1,
      'Natal', 'Coletiva', 'governor-security-b74-68'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_68;

  WITH ins_69 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mitidieri, 'Mitidieri elogia PM-SE após redução de homicídios.', 'Nossa polícia é eficiente. Resultados vêm aí.', 'Apresentação de dados de segurança.',
      'verified', false, '2024-01-15',
      'https://www.f5news.com.br/politica/mitidieri-pm-se-homicidios/', 'news_article',
      1,
      'Aracaju', 'Balanço', 'governor-security-b74-69'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_69;

  WITH ins_70 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro critica Lula por PEC da Segurança.', 'Lula quer tirar a autonomia dos estados. Rio não aceita.', 'Reunião de governadores.',
      'verified', false, '2024-04-25',
      'https://oglobo.globo.com/politica/noticia/2024/04/castro-pec-autonomia.ghtml', 'news_article',
      3,
      'Brasília', 'Reunião de governadores', 'governor-security-b74-70'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_70;

  WITH ins_71 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio critica Câmara do Rio por denúncia sobre PM.', 'Câmara Municipal não investiga polícia estadual. Isso é intromissão.', 'Após pedido de investigação da Câmara SP sobre PM.',
      'verified', false, '2024-03-22',
      'https://www1.folha.uol.com.br/cotidiano/2024/03/tarcisio-camara-investiga-pm.shtml', 'news_article',
      3,
      'São Paulo', 'Coletiva', 'governor-security-b74-71'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_71;

  WITH ins_72 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado defende ''polícia que atira primeiro''.', 'Em Goiás, a polícia atira primeiro. Se errou, a gente conversa depois.', 'Discurso em formatura de PM.',
      'verified', false, '2024-03-30',
      'https://www.correiobraziliense.com.br/politica/2024/03/caiado-policia-atira-primeiro.html', 'news_article',
      5,
      'Goiânia', 'Formatura PM-GO', 'governor-security-b74-72'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_72;

  WITH ins_73 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima critica ministro do Meio Ambiente por ação em Roraima.', 'Marina Silva quer transformar Amazonas em santuário. Não vai.', 'Após operação de desintrusão em TI Yanomami.',
      'verified', false, '2024-02-18',
      'https://amazonasatual.com.br/wilson-lima-marina-yanomami/', 'news_article',
      3,
      'Manaus', 'Entrevista', 'governor-security-b74-73'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_73;

  WITH ins_74 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema critica Moraes por decisão sobre redes sociais.', 'Moraes virou ditador do Brasil. Decisão dele é inconstitucional.', 'Após decisão sobre X/Twitter.',
      'verified', false, '2024-09-02',
      'https://www.em.com.br/app/noticia/politica/2024/09/zema-moraes-x.shtml', 'news_article',
      5,
      'Belo Horizonte', 'Coletiva', 'governor-security-b74-74'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_74;

  WITH ins_75 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro comemora chacina no Complexo da Penha como ''vitória''.', 'Foi uma vitória da polícia. 10 bandidos a menos.', 'Após operação na Penha com 10 mortos.',
      'verified', false, '2024-05-14',
      'https://oglobo.globo.com/rio/noticia/2024/05/castro-chacina-penha-vitoria.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Coletiva', 'governor-security-b74-75'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_75;

  WITH ins_76 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio nega execuções na Operação Verão.', 'Não há execução. Cada caso é confronto legítimo.', 'Após denúncias de execução durante Operação Verão.',
      'verified', false, '2024-06-10',
      'https://www1.folha.uol.com.br/cotidiano/2024/06/tarcisio-operacao-verao-execucoes.shtml', 'news_article',
      5,
      'São Paulo', 'Coletiva', 'governor-security-b74-76'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins_76;

  WITH ins_77 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado propõe ''excludente de ilicitude'' para PM.', 'Policial não pode ser preso por cumprir o dever. Excludente já.', 'Lançamento de campanha por alteração legal.',
      'verified', false, '2024-05-20',
      'https://www.correiobraziliense.com.br/politica/2024/05/caiado-excludente-ilicitude.html', 'news_article',
      4,
      'Goiânia', 'Evento PM-GO', 'governor-security-b74-77'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_77;

  WITH ins_78 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima defende Operação Catrimani contra garimpo.', 'Vamos tirar garimpeiro, mas sem ser vilão. Família também sofre.', 'Durante operação em TI Yanomami.',
      'verified', false, '2024-01-10',
      'https://amazonasatual.com.br/wilson-lima-catrimani-yanomami/', 'news_article',
      3,
      'Manaus', 'Coletiva', 'governor-security-b74-78'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_78;

  WITH ins_79 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende ação policial em ocupação no Sol Nascente.', 'Ocupação irregular vai ser desocupada. Sem dó.', 'Após conflito em remoção de ocupação no DF.',
      'verified', false, '2024-03-11',
      'https://www.correiobraziliense.com.br/cidades-df/2024/03/ibaneis-ocupacao-sol-nascente.html', 'news_article',
      3,
      'Brasília', 'Coletiva', 'governor-security-b74-79'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_79;

  WITH ins_80 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo critica dados do Anuário de Segurança que apontam Bahia.', 'Anuário não reflete realidade. Fazemos muito mais que aparece em ranking.', 'Após publicação do Anuário de Segurança Pública 2024.',
      'verified', false, '2024-07-18',
      'https://www.correio24horas.com.br/salvador/jeronimo-anuario-seguranca/', 'news_article',
      3,
      'Salvador', 'Coletiva', 'governor-security-b74-80'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins_80;

  WITH ins_81 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder defende PM do Pará após operação letal em Belém.', 'A PM fez o que tinha que fazer. Não vamos questionar.', 'Após operação com 5 mortos em Belém.',
      'verified', false, '2024-05-25',
      'https://oliberal.com/para/helder-operacao-belem-letal/', 'news_article',
      4,
      'Belém', 'Coletiva', 'governor-security-b74-81'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_81;

  WITH ins_82 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra anuncia rigor após ataque a delegacia.', 'Quem atacar delegacia vai pagar em dobro. Não temos piedade.', 'Após ataque a delegacia em Garanhuns.',
      'verified', false, '2024-06-08',
      'https://jc.ne10.uol.com.br/pernambuco/2024/06/raquel-lyra-delegacia-garanhuns.html', 'news_article',
      3,
      'Garanhuns', 'Coletiva', 'governor-security-b74-82'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_82;

  WITH ins_83 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema acusa governo federal de ''proteger bandidos'' em Minas.', 'Lula protege bandido. Está na cara. Minas está abandonada.', 'Entrevista sobre segurança pública.',
      'verified', false, '2024-07-20',
      'https://www.em.com.br/app/noticia/politica/2024/07/zema-lula-protege-bandido.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Entrevista', 'governor-security-b74-83'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins_83;

  WITH ins_84 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro defende vida de policiais em ato na Alerj.', 'Policial tem família. Quem defende bandido não defende a vida.', 'Durante homenagem a PMs mortos em serviço.',
      'verified', false, '2024-08-02',
      'https://oglobo.globo.com/rio/noticia/2024/08/castro-ato-alerj-pm.ghtml', 'news_article',
      3,
      'Rio de Janeiro', 'Alerj', 'governor-security-b74-84'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_84;

  WITH ins_85 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende PM após morte de adolescente em operação.', 'Confronto é confronto. Se não fosse em confronto, adolescente não morreria.', 'Após morte de adolescente em Osasco.',
      'verified', false, '2024-08-15',
      'https://www1.folha.uol.com.br/cotidiano/2024/08/tarcisio-adolescente-osasco.shtml', 'news_article',
      5,
      'São Paulo', 'Coletiva', 'governor-security-b74-85'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_85;

  WITH ins_86 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado propõe redução da maioridade penal em Goiás.', 'Quer matar gente tem idade para pagar. Reduzir a maioridade é solução.', 'Durante debate presidencial antecipado.',
      'verified', false, '2024-09-15',
      'https://www.correiobraziliense.com.br/politica/2024/09/caiado-maioridade-penal.html', 'news_article',
      4,
      'Brasília', 'Debate', 'governor-security-b74-86'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_86;

  WITH ins_87 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima apresenta balanço de operações com 85 mortos no AM.', 'Balanço positivo. 85 confrontos bem-sucedidos em 2024.', 'Balanço anual de segurança.',
      'verified', false, '2024-12-20',
      'https://amazonasatual.com.br/wilson-lima-balanco-85-mortos/', 'news_article',
      5,
      'Manaus', 'Balanço anual', 'governor-security-b74-87'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_87;

  WITH ins_88 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano responde ataque a ônibus com reforço militar.', 'Força Nacional e Exército. Vamos pacificar Fortaleza.', 'Após onda de ataques a ônibus em Fortaleza.',
      'verified', false, '2024-09-05',
      'https://www.opovo.com.br/noticias/ceara/2024/09/elmano-ataques-onibus.html', 'news_article',
      2,
      'Fortaleza', 'Coletiva', 'governor-security-b74-88'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_88;

  WITH ins_89 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo celebra megaoperação com 12 mortes em Salvador.', 'Operação exitosa. Bahia não dá trégua ao crime.', 'Após operação no Subúrbio Ferroviário.',
      'verified', false, '2024-10-01',
      'https://www.correio24horas.com.br/salvador/jeronimo-operacao-suburbio-12/', 'news_article',
      5,
      'Salvador', 'Coletiva', 'governor-security-b74-89'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_89;

  WITH ins_90 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder defende operação em quilombo após denúncia.', 'Vamos apurar denúncia mas não é possível ter juízo antecipado.', 'Após denúncia de abuso contra quilombolas.',
      'verified', false, '2024-06-18',
      'https://oliberal.com/para/helder-quilombo-denuncia/', 'news_article',
      4,
      'Belém', 'Coletiva', 'governor-security-b74-90'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_90;

  WITH ins_91 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra defende uso de Caveirão em Pernambuco.', 'Caveirão é necessário. Não vou me curvar a crítica politizada.', 'Após compra de blindados para PM-PE.',
      'verified', false, '2024-10-12',
      'https://jc.ne10.uol.com.br/pernambuco/2024/10/raquel-lyra-caveirao-pe.html', 'news_article',
      4,
      'Recife', 'Coletiva', 'governor-security-b74-91'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_91;

  WITH ins_92 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema anuncia ''tolerância zero'' a invasores em Minas.', 'Tolerância zero. Invadiu, é polícia. Não tem conversa.', 'Lançamento de plano de segurança rural.',
      'verified', false, '2024-09-18',
      'https://www.em.com.br/app/noticia/politica/2024/09/zema-tolerancia-zero.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Lançamento de programa', 'governor-security-b74-92'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_92;

  WITH ins_93 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho celebra queda de homicídios com retórica dura.', 'Bandido no Paraná não tem sossego. É assim que segurança funciona.', 'Balanço de segurança do Paraná.',
      'verified', false, '2024-12-15',
      'https://www.gazetadopovo.com.br/parana/ratinho-balanco-seguranca/', 'news_article',
      2,
      'Curitiba', 'Balanço', 'governor-security-b74-93'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_93;

  WITH ins_94 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jorginho, 'Jorginho Mello critica ONGs de direitos humanos.', 'ONG que defende bandido não tem espaço em Santa Catarina.', 'Entrevista sobre política de segurança.',
      'verified', false, '2024-08-20',
      'https://ndmais.com.br/politica/jorginho-ongs-direitos-humanos/', 'news_article',
      4,
      'Florianópolis', 'Entrevista', 'governor-security-b74-94'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_94;

  WITH ins_95 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_leite, 'Eduardo Leite critica PEC da Segurança Pública.', 'PEC federaliza, e isso é ruim. Precisamos de cooperação, não de absorção.', 'Reunião de governadores do Sul.',
      'verified', false, '2024-10-22',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2024/10/leite-pec-seguranca.html', 'news_article',
      2,
      'Porto Alegre', 'Reunião', 'governor-security-b74-95'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_95;

  WITH ins_96 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande anuncia operação contra facções no ES.', 'Operação dura, sem meio-termo. Vamos esmagar as facções.', 'Lançamento de operação no ES.',
      'verified', false, '2024-11-08',
      'https://www.folhavitoria.com.br/politica/casagrande-operacao-facciones/', 'news_article',
      2,
      'Vitória', 'Lançamento', 'governor-security-b74-96'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_96;

  WITH ins_97 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mauro, 'Mauro Mendes endurece contra invasões em MT com apoio da PM.', 'A PM vai estar junto do produtor rural. Quem invadir responderá.', 'Evento com produtores rurais.',
      'verified', false, '2024-07-25',
      'https://www.rdnews.com.br/politica/mauro-invasao-pm/', 'news_article',
      3,
      'Cuiabá', 'Evento ruralista', 'governor-security-b74-97'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_97;

  WITH ins_98 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Riedel defende PM após abuso contra indígenas em Dourados.', 'Polícia fez o trabalho. Denúncia é politização.', 'Após denúncia de abuso em Dourados.',
      'verified', false, '2024-09-22',
      'https://www.campograndenews.com.br/politica/riedel-pm-dourados', 'news_article',
      5,
      'Campo Grande', 'Coletiva', 'governor-security-b74-98'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_98;

  WITH ins_99 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fonteles, 'Fonteles defende megaoperação no Piauí com 6 mortes.', 'Operação necessária. Sem ela, mais gente morreria.', 'Após operação em Parnaíba.',
      'verified', false, '2024-11-20',
      'https://cidadeverde.com/noticias/fonteles-operacao-parnaiba', 'news_article',
      4,
      'Teresina', 'Coletiva', 'governor-security-b74-99'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_99;

  WITH ins_100 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro critica STF após decisão contra operações no Rio.', 'STF atrapalha o Rio. Decisão absurda.', 'Após decisão da ADPF das Favelas.',
      'verified', false, '2024-08-10',
      'https://oglobo.globo.com/rio/noticia/2024/08/castro-stf-adpf-favelas.ghtml', 'news_article',
      4,
      'Rio de Janeiro', 'Coletiva', 'governor-security-b74-100'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_100;

END $$;
