-- Batch 75: Governors on public security, police operations, megaoperações
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
      v_castro, 'Castro justifica operação em Vila Cruzeiro com 23 mortes como ''sucesso''.', '23 criminosos a menos nas ruas do Rio. Operação foi um sucesso absoluto.', 'Após operação conjunta em Vila Cruzeiro.',
      'verified', true, '2025-01-15',
      'https://oglobo.globo.com/rio/noticia/2025/01/castro-vila-cruzeiro-sucesso.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Operação Vila Cruzeiro', 'governor-security-b75-1'
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
      v_castro, 'Castro defende BOPE após execução filmada em Jacarezinho II.', 'BOPE é elite. Vídeo fora de contexto não vai mudar minha posição.', 'Após vídeo de execução viralizar.',
      'verified', true, '2025-02-05',
      'https://extra.globo.com/casos-de-policia/castro-bope-jacarezinho-2.html', 'news_article',
      5,
      'Rio de Janeiro', 'Operação Jacarezinho II', 'governor-security-b75-2'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_2;

  WITH ins_3 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende Operação Verão 2025 com 40 mortes no litoral.', 'Verão seguro. Quem veio ao litoral viu a diferença. A polícia entregou.', 'Balanço da Operação Verão 2025.',
      'verified', true, '2025-03-10',
      'https://www1.folha.uol.com.br/cotidiano/2025/03/tarcisio-verao-2025.shtml', 'news_article',
      5,
      'São Paulo', 'Operação Verão 2025', 'governor-security-b75-3'
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
      v_tarcisio, 'Tarcísio critica ministro Lewandowski por questionar operação.', 'Lewandowski não entende de segurança pública. Que cuide do Ministério dele.', 'Após crítica do ministro da Justiça.',
      'verified', false, '2025-03-15',
      'https://www1.folha.uol.com.br/cotidiano/2025/03/tarcisio-lewandowski-critica.shtml', 'news_article',
      4,
      'São Paulo', 'Coletiva', 'governor-security-b75-4'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_4;

  WITH ins_5 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado lança pré-candidatura com agenda ''bandido bom é bandido morto''.', 'Meu governo para o Brasil será assim: bandido bom é bandido morto.', 'Lançamento de pré-candidatura à Presidência.',
      'verified', true, '2025-04-20',
      'https://www.correiobraziliense.com.br/politica/2025/04/caiado-precandidatura-bandido-morto.html', 'news_article',
      5,
      'Brasília', 'Lançamento de pré-candidatura', 'governor-security-b75-5'
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
      v_caiado, 'Caiado defende pena de morte em sabatina.', 'Sou a favor da pena de morte para crimes hediondos. Ponto.', 'Sabatina na Jovem Pan.',
      'verified', true, '2025-05-12',
      'https://www.correiobraziliense.com.br/politica/2025/05/caiado-pena-morte.html', 'news_article',
      4,
      'São Paulo', 'Sabatina Jovem Pan', 'governor-security-b75-6'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_6;

  WITH ins_7 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima anuncia operação conjunta com ''carta branca'' à PM.', 'A PM tem carta branca. Se morrer bandido, paciência.', 'Lançamento de operação no interior do AM.',
      'verified', true, '2025-02-18',
      'https://amazonasatual.com.br/wilson-lima-carta-branca/', 'news_article',
      5,
      'Manaus', 'Lançamento de operação', 'governor-security-b75-7'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_7;

  WITH ins_8 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende PM do DF após morte de jovem em Ceilândia.', 'Confronto existe. Polícia não tem que pedir licença para agir.', 'Após morte de jovem em Ceilândia.',
      'verified', false, '2025-03-22',
      'https://www.correiobraziliense.com.br/cidades-df/2025/03/ibaneis-ceilandia.html', 'news_article',
      4,
      'Brasília', 'Coletiva', 'governor-security-b75-8'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_8;

  WITH ins_9 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano reforça retórica dura após ataques no Ceará.', 'A resposta vai ser na medida. Criminoso vai pagar.', 'Após ataques simultâneos em Fortaleza.',
      'verified', false, '2025-01-28',
      'https://www.opovo.com.br/noticias/ceara/2025/01/elmano-ataques-ceara.html', 'news_article',
      2,
      'Fortaleza', 'Coletiva', 'governor-security-b75-9'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_9;

  WITH ins_10 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo defende PM baiana após chacina em Salvador.', 'Chacina não é nossa palavra. Foi operação legítima com resultado.', 'Após operação com 11 mortes em Periperi.',
      'verified', true, '2025-04-02',
      'https://www.correio24horas.com.br/salvador/jeronimo-periperi-11/', 'news_article',
      5,
      'Salvador', 'Coletiva', 'governor-security-b75-10'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_10;

  WITH ins_11 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo rebate relatório da ONU sobre PM da Bahia.', 'ONU não conhece a Bahia. Não aceitamos lição de quem não entende.', 'Após relatório de relator da ONU.',
      'verified', false, '2025-05-08',
      'https://atarde.com.br/politica/jeronimo-onu-pm-bahia', 'news_article',
      4,
      'Salvador', 'Coletiva', 'governor-security-b75-11'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_11;

  WITH ins_12 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder Barbalho apoia PEC da Segurança Pública do governo federal.', 'Vamos apoiar. Precisamos de integração para vencer o crime.', 'Reunião do Consórcio Amazônia Legal.',
      'verified', false, '2025-04-10',
      'https://oliberal.com/para/helder-pec-seguranca-apoio/', 'news_article',
      1,
      'Belém', 'Consórcio Amazônia Legal', 'governor-security-b75-12'
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
      v_raquel, 'Raquel Lyra celebra Operação Muralha com 18 mortos.', 'Operação Muralha mostra que Pernambuco virou o jogo.', 'Balanço da Operação Muralha.',
      'verified', true, '2025-02-22',
      'https://jc.ne10.uol.com.br/pernambuco/2025/02/raquel-lyra-muralha-18.html', 'news_article',
      5,
      'Recife', 'Operação Muralha', 'governor-security-b75-13'
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
      v_zema, 'Zema ataca STF em ato bolsonarista na Paulista.', 'STF é o maior obstáculo do Brasil. Precisamos de coragem contra eles.', 'Ato em defesa de Bolsonaro na Paulista.',
      'verified', false, '2025-04-06',
      'https://www.em.com.br/app/noticia/politica/2025/04/zema-ato-paulista.shtml', 'news_article',
      5,
      'São Paulo', 'Ato Paulista', 'governor-security-b75-14'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_14;

  WITH ins_15 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema defende intervenção da PM contra movimentos sociais.', 'Movimento social que invade é caso de polícia. Não negocio.', 'Entrevista após bloqueio de rodovia.',
      'verified', false, '2025-03-28',
      'https://www.em.com.br/app/noticia/politica/2025/03/zema-intervencao-movimento.shtml', 'news_article',
      4,
      'Belo Horizonte', 'Entrevista', 'governor-security-b75-15'
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
      v_ratinho, 'Ratinho defende reforço de patrulhamento com excludente de ilicitude.', 'PM do Paraná precisa de excludente. Estou com isso.', 'Evento em Curitiba.',
      'verified', false, '2025-02-14',
      'https://www.gazetadopovo.com.br/parana/ratinho-excludente-ilicitude/', 'news_article',
      3,
      'Curitiba', 'Evento PM-PR', 'governor-security-b75-16'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_16;

  WITH ins_17 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jorginho, 'Jorginho Mello defende PM-SC após operação com mortos.', 'Polícia fez o que tinha que fazer. Mortes são consequência do crime.', 'Após operação em Blumenau.',
      'verified', false, '2025-03-18',
      'https://ndmais.com.br/politica/jorginho-pm-sc-blumenau/', 'news_article',
      4,
      'Florianópolis', 'Coletiva', 'governor-security-b75-17'
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
      v_leite, 'Eduardo Leite defende Choque após operação em Porto Alegre.', 'Choque é referência. Crítica não tira a eficiência.', 'Após operação na Lomba do Pinheiro.',
      'verified', false, '2025-02-25',
      'https://gauchazh.clicrbs.com.br/seguranca/noticia/2025/02/leite-choque-lomba.html', 'news_article',
      3,
      'Porto Alegre', 'Coletiva', 'governor-security-b75-18'
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
      v_casagrande, 'Casagrande celebra resultado de operação em Vila Velha.', 'Cinco criminosos a menos. Operação bem-sucedida.', 'Balanço de operação em Vila Velha.',
      'verified', false, '2025-03-06',
      'https://www.folhavitoria.com.br/politica/casagrande-vila-velha/', 'news_article',
      3,
      'Vitória', 'Coletiva', 'governor-security-b75-19'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_19;

  WITH ins_20 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_dantas, 'Paulo Dantas defende PM de Alagoas após denúncias.', 'PM de Alagoas tem minha confiança. Não tenho medo de crítica.', 'Após denúncias de tortura em delegacia.',
      'verified', false, '2025-04-15',
      'https://www.tnh1.com.br/noticia/nid/paulo-dantas-pm-al-0425/', 'news_article',
      4,
      'Maceió', 'Coletiva', 'governor-security-b75-20'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_20;

  WITH ins_21 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mitidieri, 'Mitidieri defende Operação Aracaju Segura.', 'Operação firme e necessária. Aracaju viu a diferença.', 'Balanço semestral.',
      'verified', false, '2025-06-02',
      'https://www.f5news.com.br/politica/mitidieri-aracaju-segura/', 'news_article',
      2,
      'Aracaju', 'Balanço', 'governor-security-b75-21'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_21;

  WITH ins_22 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mauro, 'Mauro Mendes defende uso da PM em conflitos rurais em MT.', 'PM vai estar junto do produtor. Invasor é bandido, e bandido responde.', 'Evento com ruralistas.',
      'verified', false, '2025-05-18',
      'https://www.rdnews.com.br/politica/mauro-ruralistas-2025/', 'news_article',
      4,
      'Cuiabá', 'Evento ruralista', 'governor-security-b75-22'
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
      v_riedel, 'Riedel defende PM após morte de Guarani-Kaiowá.', 'Vamos apurar com rigor, mas sem dar ganho a quem grita em vão.', 'Após morte de indígena em conflito agrário.',
      'verified', false, '2025-03-25',
      'https://www.campograndenews.com.br/politica/riedel-guarani-kaiowa-2025', 'news_article',
      5,
      'Campo Grande', 'Coletiva', 'governor-security-b75-23'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_23;

  WITH ins_24 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fatima, 'Fátima Bezerra defende investigação de morte pela PM-RN.', 'Abuso não pode ficar impune. Exijo apuração completa.', 'Após morte de adolescente em Natal.',
      'verified', false, '2025-01-20',
      'https://www.tribunadonorte.com.br/fatima-bezerra-adolescente/', 'news_article',
      1,
      'Natal', 'Coletiva', 'governor-security-b75-24'
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
      v_brandao, 'Carlos Brandão celebra operação em Bacabal com 4 mortos.', 'Operação necessária. Maranhão não vai ceder ao crime.', 'Após operação no interior do MA.',
      'verified', false, '2025-05-10',
      'https://imirante.com/oestadoma/brandao-bacabal/', 'news_article',
      3,
      'São Luís', 'Coletiva', 'governor-security-b75-25'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_25;

  WITH ins_26 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_gladson, 'Gladson Camelí defende PM do Acre após denúncia de racismo.', 'Racismo é alegação fácil. Minha PM é profissional.', 'Após denúncia da Defensoria contra PM-AC.',
      'verified', false, '2025-04-18',
      'https://www.acritica.net/politica/gladson-pm-racismo/', 'news_article',
      5,
      'Rio Branco', 'Coletiva', 'governor-security-b75-26'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_26;

  WITH ins_27 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_denarium, 'Denarium critica ação federal em TI Yanomami novamente.', 'Governo federal persegue Roraima. Operação federal só atrapalha.', 'Durante ação contra garimpo em TI Yanomami.',
      'verified', false, '2025-02-12',
      'https://folhabv.com.br/noticia/POLITICA/Denarium-yanomami-2025/', 'news_article',
      4,
      'Boa Vista', 'Coletiva', 'governor-security-b75-27'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_27;

  WITH ins_28 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_clecio, 'Clécio Luís defende reforço policial no Amapá.', 'Vamos ampliar efetivo e dar resposta firme ao crime.', 'Anúncio de concurso PM-AP.',
      'verified', false, '2025-03-08',
      'https://selesnafes.com/2025/03/clecio-reforco-pm-ap/', 'news_article',
      1,
      'Macapá', 'Anúncio', 'governor-security-b75-28'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_28;

  WITH ins_29 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wbarbosa, 'Wanderlei Barbosa defende PM do Tocantins.', 'PM-TO é exemplar. Casos isolados não pintam o quadro geral.', 'Após relatório da OAB-TO.',
      'verified', false, '2025-04-22',
      'https://www.conexaoto.com.br/politica/wanderlei-pm-to-2025/', 'news_article',
      3,
      'Palmas', 'Coletiva', 'governor-security-b75-29'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_29;

  WITH ins_30 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fonteles, 'Fonteles celebra queda de homicídios no Piauí.', 'Nossa política dura contra o crime funciona. Resultados falam.', 'Balanço de segurança.',
      'verified', false, '2025-05-25',
      'https://cidadeverde.com/noticias/fonteles-homicidios-queda-2025', 'news_article',
      2,
      'Teresina', 'Balanço', 'governor-security-b75-30'
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
      v_castro, 'Castro comemora ADPF das Favelas sendo revista pelo STF.', 'STF finalmente ouve o Rio. Vamos retomar o controle.', 'Após STF revisar ADPF das Favelas.',
      'verified', false, '2025-05-15',
      'https://oglobo.globo.com/rio/noticia/2025/05/castro-adpf-revista.ghtml', 'news_article',
      4,
      'Rio de Janeiro', 'Coletiva', 'governor-security-b75-31'
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
      v_tarcisio, 'Tarcísio defende Rota em formatura com retórica militarizada.', 'A Rota é temor do bandido. Glória à nossa tropa.', 'Formatura de oficiais da Rota.',
      'verified', false, '2025-06-12',
      'https://www1.folha.uol.com.br/cotidiano/2025/06/tarcisio-rota-formatura.shtml', 'news_article',
      3,
      'São Paulo', 'Formatura PM-SP', 'governor-security-b75-32'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_32;

  WITH ins_33 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado defende Polícia Militar contra investigação do MP.', 'MP quer prender PM por cumprir dever. Não aceito.', 'Após denúncia do MP-GO contra PMs.',
      'verified', false, '2025-06-20',
      'https://www.correiobraziliense.com.br/politica/2025/06/caiado-mp-pm.html', 'news_article',
      4,
      'Goiânia', 'Coletiva', 'governor-security-b75-33'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_33;

  WITH ins_34 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima apoia ''facção-terrorismo'' em discurso na AM.', 'Facção é terrorismo. Ponto. Vamos tratar como tal.', 'Entrevista após PL contra facções avançar no Congresso.',
      'verified', false, '2025-07-02',
      'https://amazonasatual.com.br/wilson-lima-faccao-terrorismo/', 'news_article',
      4,
      'Manaus', 'Entrevista', 'governor-security-b75-34'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_34;

  WITH ins_35 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende PM do DF após operação em Estrutural.', 'Operação na Estrutural era necessária. Pronto.', 'Após operação com 3 mortos na Estrutural.',
      'verified', false, '2025-07-10',
      'https://www.correiobraziliense.com.br/cidades-df/2025/07/ibaneis-estrutural.html', 'news_article',
      4,
      'Brasília', 'Coletiva', 'governor-security-b75-35'
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
      v_elmano, 'Elmano reconhece falha após chacina no Ceará.', 'Falhamos. Vamos apurar e punir. Não escondo o problema.', 'Após chacina em Fortaleza com 6 mortos.',
      'verified', false, '2025-07-15',
      'https://www.opovo.com.br/noticias/ceara/2025/07/elmano-chacina-fortaleza.html', 'news_article',
      1,
      'Fortaleza', 'Coletiva', 'governor-security-b75-36'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_36;

  WITH ins_37 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo defende megaoperação em Feira de Santana.', 'Operação com resultado. Sem choro e sem desculpas.', 'Após operação com 8 mortos em Feira.',
      'verified', false, '2025-08-02',
      'https://www.correio24horas.com.br/salvador/jeronimo-feira-8/', 'news_article',
      4,
      'Salvador', 'Coletiva', 'governor-security-b75-37'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_37;

  WITH ins_38 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder defende ação contra invasores em TI no Pará.', 'Ninguém pode invadir TI. A PM vai retirar.', 'Após ação contra garimpo em Kayapó.',
      'verified', false, '2025-06-25',
      'https://oliberal.com/para/helder-kayapo-2025/', 'news_article',
      2,
      'Belém', 'Coletiva', 'governor-security-b75-38'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_38;

  WITH ins_39 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra defende aumento de letalidade policial em Pernambuco.', 'Letalidade é consequência de enfrentamento. Não nos intimidaremos.', 'Após aumento de 40% na letalidade em PE.',
      'verified', false, '2025-08-10',
      'https://jc.ne10.uol.com.br/pernambuco/2025/08/raquel-letalidade-40.html', 'news_article',
      5,
      'Recife', 'Coletiva', 'governor-security-b75-39'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_39;

  WITH ins_40 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema ataca Dino após decisão sobre redes sociais.', 'Dino virou censor. Não aceito sua ditadura.', 'Após decisão do STF sobre redes.',
      'verified', false, '2025-07-28',
      'https://www.em.com.br/app/noticia/politica/2025/07/zema-dino-ditadura.shtml', 'news_article',
      5,
      'Belo Horizonte', 'Coletiva', 'governor-security-b75-40'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_40;

  WITH ins_41 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho defende operação no litoral do Paraná.', 'Operação no litoral foi exemplar. Sem cerimônia.', 'Após operação em Paranaguá.',
      'verified', false, '2025-07-22',
      'https://www.gazetadopovo.com.br/parana/ratinho-paranagua/', 'news_article',
      3,
      'Curitiba', 'Coletiva', 'governor-security-b75-41'
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
      v_jorginho, 'Jorginho defende PM-SC contra relatório crítico.', 'Relatório politizado. Minha PM é modelo.', 'Após relatório da OAB-SC.',
      'verified', false, '2025-08-05',
      'https://ndmais.com.br/politica/jorginho-pm-sc-relatorio/', 'news_article',
      3,
      'Florianópolis', 'Coletiva', 'governor-security-b75-42'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_42;

  WITH ins_43 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_leite, 'Eduardo Leite defende ''RS seguro'' em meio à crise pós-enchentes.', 'Mesmo com tragédia, não vamos baixar a guarda. Crime não espera.', 'Após enchentes de 2024 e crise de segurança em 2025.',
      'verified', false, '2025-05-28',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2025/05/leite-rs-seguro.html', 'news_article',
      2,
      'Porto Alegre', 'Coletiva', 'governor-security-b75-43'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_43;

  WITH ins_44 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande celebra operação antifacção no ES.', 'Quebramos a espinha do crime organizado no ES.', 'Balanço da operação.',
      'verified', false, '2025-07-12',
      'https://www.folhavitoria.com.br/politica/casagrande-antifaccao-balanco/', 'news_article',
      2,
      'Vitória', 'Balanço', 'governor-security-b75-44'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_44;

  WITH ins_45 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_dantas, 'Paulo Dantas anuncia pacote de rigor contra facções.', 'Pacote duro. Não vamos tolerar facção em Alagoas.', 'Lançamento de pacote estadual.',
      'verified', false, '2025-08-18',
      'https://www.tnh1.com.br/noticia/nid/paulo-dantas-pacote-0825/', 'news_article',
      2,
      'Maceió', 'Lançamento', 'governor-security-b75-45'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_45;

  WITH ins_46 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mitidieri, 'Mitidieri defende rigor contra ataques em Sergipe.', 'Quem atacar vai responder em dobro. Aracaju não é terra sem lei.', 'Após ataques a ônibus em Aracaju.',
      'verified', false, '2025-09-02',
      'https://www.f5news.com.br/politica/mitidieri-ataques-onibus/', 'news_article',
      3,
      'Aracaju', 'Coletiva', 'governor-security-b75-46'
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
      v_mauro, 'Mauro Mendes ataca Lula por política indigenista em MT.', 'Lula quer transformar MT em reserva. Não vou permitir.', 'Reunião com ruralistas em Cuiabá.',
      'verified', false, '2025-06-10',
      'https://www.rdnews.com.br/politica/mauro-lula-indigenas/', 'news_article',
      4,
      'Cuiabá', 'Evento', 'governor-security-b75-47'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_47;

  WITH ins_48 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Riedel defende reintegração de posse violenta em MS.', 'Reintegração cumprida. A lei é para todos.', 'Após reintegração com 2 indígenas mortos.',
      'verified', false, '2025-05-22',
      'https://www.campograndenews.com.br/politica/riedel-reintegracao-2025', 'news_article',
      5,
      'Campo Grande', 'Coletiva', 'governor-security-b75-48'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_48;

  WITH ins_49 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fatima, 'Fátima critica operação letal no interior do RN.', 'Precisamos de polícia técnica, não letal. Vou apurar.', 'Após operação em Mossoró.',
      'verified', false, '2025-06-05',
      'https://www.tribunadonorte.com.br/fatima-mossoro-letal/', 'news_article',
      1,
      'Natal', 'Coletiva', 'governor-security-b75-49'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_49;

  WITH ins_50 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_brandao, 'Carlos Brandão anuncia excludente de ilicitude no MA.', 'Polícia que cumpre o dever não pode ser perseguida. Excludente já.', 'Durante mensagem à Assembleia Legislativa.',
      'verified', false, '2025-09-10',
      'https://imirante.com/oestadoma/brandao-excludente/', 'news_article',
      4,
      'São Luís', 'Assembleia Legislativa', 'governor-security-b75-50'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins_50;

  WITH ins_51 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_gladson, 'Gladson defende GEFRON em conflito com ONGs.', 'GEFRON é tropa séria. ONG que reclama quer conseguir holofote.', 'Após denúncia de ONG contra GEFRON.',
      'verified', false, '2025-08-15',
      'https://www.acritica.net/politica/gladson-gefron/', 'news_article',
      4,
      'Rio Branco', 'Entrevista', 'governor-security-b75-51'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_51;

  WITH ins_52 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_denarium, 'Denarium ataca Sonia Guajajara por visita a Roraima.', 'Ministra dos Povos Indígenas veio para atrapalhar Roraima.', 'Após visita da ministra à TI Yanomami.',
      'verified', false, '2025-07-03',
      'https://folhabv.com.br/noticia/POLITICA/Denarium-sonia-guajajara/', 'news_article',
      5,
      'Boa Vista', 'Coletiva', 'governor-security-b75-52'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins_52;

  WITH ins_53 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_clecio, 'Clécio defende PM do Amapá após operação em Macapá.', 'Nossa polícia agiu dentro da lei. Sem drama.', 'Após operação com 2 mortes.',
      'verified', false, '2025-09-18',
      'https://selesnafes.com/2025/09/clecio-pm-macapa/', 'news_article',
      3,
      'Macapá', 'Coletiva', 'governor-security-b75-53'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_53;

  WITH ins_54 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wbarbosa, 'Wanderlei defende militarização de escolas em Tocantins.', 'Colégio militar é solução. Disciplina antes de tudo.', 'Lançamento de colégios militares em TO.',
      'verified', false, '2025-08-08',
      'https://www.conexaoto.com.br/politica/wanderlei-colegio-militar/', 'news_article',
      3,
      'Palmas', 'Lançamento de programa', 'governor-security-b75-54'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_54;

  WITH ins_55 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fonteles, 'Fonteles defende Operação Piauí Seguro II.', 'Resultados falam. Piauí mais seguro com mais rigor.', 'Balanço da operação.',
      'verified', false, '2025-09-25',
      'https://cidadeverde.com/noticias/fonteles-piaui-seguro-2', 'news_article',
      2,
      'Teresina', 'Balanço', 'governor-security-b75-55'
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
      v_castro, 'Castro celebra megaoperação Contenção com 121 mortos em Jacarezinho.', 'Foi a maior operação da história. 121 terroristas neutralizados no Rio.', 'Após operação no Complexo da Penha e Alemão.',
      'verified', false, '2025-10-28',
      'https://oglobo.globo.com/rio/noticia/2025/10/castro-operacao-contencao-121.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Megaoperação Contenção', 'governor-security-b75-56'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_56;

  WITH ins_57 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro chama de ''terroristas'' os mortos em megaoperação.', 'Não é chacina. É resposta a terroristas que controlavam a comunidade.', 'Após megaoperação com mais de 100 mortos.',
      'verified', false, '2025-10-29',
      'https://extra.globo.com/casos-de-policia/castro-terroristas-megaoperacao.html', 'news_article',
      5,
      'Rio de Janeiro', 'Coletiva pós-operação', 'governor-security-b75-57'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_57;

  WITH ins_58 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro ataca MP-RJ por investigação após megaoperação.', 'MP quer manchar a operação. Não vou permitir politização.', 'Após MP pedir investigação da operação de outubro.',
      'verified', false, '2025-11-05',
      'https://oglobo.globo.com/rio/noticia/2025/11/castro-mp-rj-operacao.ghtml', 'news_article',
      4,
      'Rio de Janeiro', 'Coletiva', 'governor-security-b75-58'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_58;

  WITH ins_59 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio apoia operação do Rio e defende replicar em SP.', 'Operação do Rio é modelo. Vamos replicar em São Paulo onde precisar.', 'Após megaoperação no RJ em outubro.',
      'verified', false, '2025-10-30',
      'https://www1.folha.uol.com.br/cotidiano/2025/10/tarcisio-apoia-operacao-rio.shtml', 'news_article',
      5,
      'São Paulo', 'Coletiva', 'governor-security-b75-59'
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
      v_caiado, 'Caiado usa megaoperação do Rio para agenda presidencial.', 'O Brasil precisa de mais Rio e menos Lula. Operação assim salva vidas.', 'Em palanque de pré-campanha.',
      'verified', false, '2025-11-02',
      'https://www.correiobraziliense.com.br/politica/2025/11/caiado-rio-presidencial.html', 'news_article',
      5,
      'Brasília', 'Evento de pré-campanha', 'governor-security-b75-60'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_60;

  WITH ins_61 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima defende megaoperação do Rio como ''necessária''.', 'Foi necessária. Amazonas é solidário ao Rio.', 'Entrevista após operação de outubro.',
      'verified', false, '2025-10-31',
      'https://amazonasatual.com.br/wilson-lima-apoio-rio/', 'news_article',
      4,
      'Manaus', 'Entrevista', 'governor-security-b75-61'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_61;

  WITH ins_62 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ibaneis, 'Ibaneis defende megaoperação do Rio e critica Dino.', 'Dino critica tudo. Castro fez o certo.', 'Após críticas do ministro.',
      'verified', false, '2025-11-03',
      'https://www.correiobraziliense.com.br/politica/2025/11/ibaneis-rio-dino.html', 'news_article',
      3,
      'Brasília', 'Coletiva', 'governor-security-b75-62'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_62;

  WITH ins_63 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano critica megaoperação do Rio pela alta letalidade.', 'Operação com 121 mortos não é solução. É tragédia.', 'Em reunião do Consórcio Nordeste.',
      'verified', false, '2025-11-04',
      'https://www.opovo.com.br/noticias/ceara/2025/11/elmano-operacao-rj.html', 'news_article',
      1,
      'Fortaleza', 'Consórcio Nordeste', 'governor-security-b75-63'
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
      v_jeronimo, 'Jerônimo defende polícia baiana após Rio.', 'Bahia faz suas operações. Cada um tem seu contexto.', 'Após megaoperação no RJ.',
      'verified', false, '2025-11-01',
      'https://www.correio24horas.com.br/salvador/jeronimo-rio-bahia-2025/', 'news_article',
      3,
      'Salvador', 'Coletiva', 'governor-security-b75-64'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_64;

  WITH ins_65 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_helder, 'Helder critica letalidade do Rio de modo diplomático.', 'Precisamos de políticas integradas. A letalidade precisa ser reduzida.', 'Em entrevista sobre PEC da Segurança.',
      'verified', false, '2025-11-06',
      'https://oliberal.com/para/helder-letalidade-rio/', 'news_article',
      1,
      'Belém', 'Entrevista', 'governor-security-b75-65'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_65;

  WITH ins_66 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra apoia megaoperação do Rio em nota oficial.', 'Pernambuco apoia Castro. Operações duras salvam vidas.', 'Nota oficial após megaoperação.',
      'verified', false, '2025-10-30',
      'https://jc.ne10.uol.com.br/pernambuco/2025/10/raquel-apoio-castro.html', 'news_article',
      4,
      'Recife', 'Nota oficial', 'governor-security-b75-66'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_66;

  WITH ins_67 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_zema, 'Zema defende megaoperação e ataca Lula por crítica.', 'Lula só critica polícia. Castro é o herói do Rio.', 'Após crítica de Lula à operação.',
      'verified', false, '2025-10-31',
      'https://www.em.com.br/app/noticia/politica/2025/10/zema-castro-heroi.shtml', 'news_article',
      5,
      'Belo Horizonte', 'Entrevista', 'governor-security-b75-67'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_67;

  WITH ins_68 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho apoia Castro após megaoperação com 121 mortes.', 'Paraná solidário ao Rio. Operação é salvar vidas.', 'Em nota após megaoperação.',
      'verified', false, '2025-10-31',
      'https://www.gazetadopovo.com.br/parana/ratinho-apoio-castro/', 'news_article',
      4,
      'Curitiba', 'Nota oficial', 'governor-security-b75-68'
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
      v_jorginho, 'Jorginho Mello exalta megaoperação do Rio.', 'Parabéns ao Castro. Isso é que é coragem de governar.', 'Após megaoperação.',
      'verified', false, '2025-10-30',
      'https://ndmais.com.br/politica/jorginho-castro-coragem/', 'news_article',
      5,
      'Florianópolis', 'Coletiva', 'governor-security-b75-69'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_69;

  WITH ins_70 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_leite, 'Eduardo Leite critica letalidade da megaoperação do Rio.', 'Operação com 100 mortes gera muito questionamento. Precisamos rever.', 'Em entrevista após a operação.',
      'verified', false, '2025-11-02',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2025/11/leite-operacao-rio.html', 'news_article',
      1,
      'Porto Alegre', 'Entrevista', 'governor-security-b75-70'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_70;

  WITH ins_71 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande questiona modelo de operação letal.', 'Não dá para comemorar 100 mortos. Precisamos de inteligência, não de fuzil.', 'Em entrevista na Globonews.',
      'verified', false, '2025-11-03',
      'https://www.folhavitoria.com.br/politica/casagrande-operacao-rio/', 'news_article',
      1,
      'Vitória', 'Entrevista', 'governor-security-b75-71'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_71;

  WITH ins_72 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_dantas, 'Paulo Dantas apoia Castro após megaoperação.', 'Castro tem o apoio de Alagoas. Operações duras salvam inocentes.', 'Após megaoperação no RJ.',
      'verified', false, '2025-10-31',
      'https://www.tnh1.com.br/noticia/nid/paulo-dantas-castro-1025/', 'news_article',
      4,
      'Maceió', 'Nota oficial', 'governor-security-b75-72'
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
      v_mitidieri, 'Mitidieri apoia operação do Rio em nota.', 'Sergipe apoia o Rio. Crime organizado tem que cair por terra.', 'Nota oficial.',
      'verified', false, '2025-11-01',
      'https://www.f5news.com.br/politica/mitidieri-apoio-rio/', 'news_article',
      3,
      'Aracaju', 'Nota oficial', 'governor-security-b75-73'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_73;

  WITH ins_74 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_mauro, 'Mauro Mendes defende operação do Rio como ''modelo''.', 'Castro mostrou caminho. Brasil precisa de operações assim.', 'Entrevista em Cuiabá.',
      'verified', false, '2025-11-02',
      'https://www.rdnews.com.br/politica/mauro-castro-modelo/', 'news_article',
      5,
      'Cuiabá', 'Entrevista', 'governor-security-b75-74'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_74;

  WITH ins_75 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Riedel apoia megaoperação e critica STF.', 'STF virou obstáculo. Precisa parar de atrapalhar operações.', 'Após declarações sobre ADPF das Favelas.',
      'verified', false, '2025-11-05',
      'https://www.campograndenews.com.br/politica/riedel-stf-megaoperacao', 'news_article',
      5,
      'Campo Grande', 'Coletiva', 'governor-security-b75-75'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_75;

  WITH ins_76 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_fatima, 'Fátima Bezerra critica megaoperação do Rio.', 'Uma operação com 121 mortos é uma chacina. Brasil precisa de outro modelo.', 'Em entrevista após megaoperação.',
      'verified', false, '2025-11-03',
      'https://www.tribunadonorte.com.br/fatima-megaoperacao-critica/', 'news_article',
      1,
      'Natal', 'Entrevista', 'governor-security-b75-76'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_76;

  WITH ins_77 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_brandao, 'Carlos Brandão apoia operação do Rio em reunião.', 'Maranhão apoia Castro. Precisamos de respostas duras.', 'Reunião de governadores.',
      'verified', false, '2025-11-04',
      'https://imirante.com/oestadoma/brandao-apoio-rio-2025/', 'news_article',
      3,
      'São Luís', 'Reunião de governadores', 'governor-security-b75-77'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_77;

  WITH ins_78 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_gladson, 'Gladson defende operação do Rio em rede social.', 'Parabéns Castro. É disso que o Brasil precisa.', 'Post em rede social após megaoperação.',
      'verified', false, '2025-10-30',
      'https://www.acritica.net/politica/gladson-post-rio/', 'news_article',
      4,
      'Rio Branco', 'Post em rede social', 'governor-security-b75-78'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_78;

  WITH ins_79 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_denarium, 'Denarium elogia Castro e ataca direitos humanos.', 'Castro mostrou como fazer. Direitos humanos de bandido não existe.', 'Após megaoperação no Rio.',
      'verified', false, '2025-10-31',
      'https://folhabv.com.br/noticia/POLITICA/Denarium-castro-direitos/', 'news_article',
      5,
      'Boa Vista', 'Entrevista', 'governor-security-b75-79'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_79;

  WITH ins_80 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_clecio, 'Clécio Luís se posiciona cauteloso sobre megaoperação do Rio.', 'Respeitamos a autonomia do RJ, mas precisamos de mais diálogo.', 'Em entrevista após megaoperação.',
      'verified', false, '2025-11-02',
      'https://selesnafes.com/2025/11/clecio-megaoperacao/', 'news_article',
      1,
      'Macapá', 'Entrevista', 'governor-security-b75-80'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_80;

  WITH ins_81 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wbarbosa, 'Wanderlei apoia Castro na megaoperação.', 'TO apoia Castro. Operações firmes são bem-vindas.', 'Nota oficial.',
      'verified', false, '2025-11-01',
      'https://www.conexaoto.com.br/politica/wanderlei-castro-apoio/', 'news_article',
      3,
      'Palmas', 'Nota oficial', 'governor-security-b75-81'
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
      v_jorginho, 'Jorginho Mello defende replicar operação do Rio em SC.', 'Vamos replicar o modelo do Rio. Santa Catarina não fica para trás.', 'Após megaoperação no RJ.',
      'verified', false, '2025-11-03',
      'https://ndmais.com.br/politica/jorginho-replicar-rio/', 'news_article',
      5,
      'Florianópolis', 'Entrevista', 'governor-security-b75-82'
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
      v_fonteles, 'Fonteles se posiciona contra letalidade da operação do Rio.', 'Não é o modelo do Piauí. Vamos continuar com inteligência, não com chacina.', 'Em entrevista.',
      'verified', false, '2025-11-04',
      'https://cidadeverde.com/noticias/fonteles-rio-chacina', 'news_article',
      1,
      'Teresina', 'Entrevista', 'governor-security-b75-83'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_83;

  WITH ins_84 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro sustenta que operação é ''legítima defesa do Estado''.', 'Não existe chacina. Existe legítima defesa do Estado.', 'Em entrevista à Globonews após operação.',
      'verified', false, '2025-11-08',
      'https://oglobo.globo.com/rio/noticia/2025/11/castro-legitima-defesa.ghtml', 'news_article',
      5,
      'Rio de Janeiro', 'Entrevista Globonews', 'governor-security-b75-84'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins_84;

  WITH ins_85 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro usa megaoperação como plataforma eleitoral.', 'Quem acha que operação foi errada é candidato do crime em 2026.', 'Em evento partidário no Rio.',
      'verified', false, '2025-11-15',
      'https://extra.globo.com/casos-de-policia/castro-plataforma-eleitoral.html', 'news_article',
      5,
      'Rio de Janeiro', 'Evento partidário', 'governor-security-b75-85'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins_85;

  WITH ins_86 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio, 'Tarcísio defende operações de SP com retórica dura em 2026.', 'São Paulo vai ficar mais dura em 2026. Bandido vai sentir.', 'Em entrevista de início de ano.',
      'verified', false, '2026-01-10',
      'https://www1.folha.uol.com.br/cotidiano/2026/01/tarcisio-sp-dura.shtml', 'news_article',
      4,
      'São Paulo', 'Entrevista de fim de ano', 'governor-security-b75-86'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_86;

  WITH ins_87 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_caiado, 'Caiado lança plataforma presidencial focada em segurança.', 'Meu governo terá tolerância zero com o crime. Segurança é prioridade absoluta.', 'Lançamento oficial da candidatura à Presidência.',
      'verified', false, '2026-02-15',
      'https://www.correiobraziliense.com.br/politica/2026/02/caiado-plataforma-presidencial.html', 'news_article',
      4,
      'Brasília', 'Lançamento de candidatura', 'governor-security-b75-87'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_87;

  WITH ins_88 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_wlima, 'Wilson Lima endurece discurso na pré-campanha.', 'Não vou ter dó de bandido. Em 2026 o Amazonas vai apertar.', 'Entrevista sobre agenda de segurança.',
      'verified', false, '2026-01-20',
      'https://amazonasatual.com.br/wilson-lima-endurece-2026/', 'news_article',
      4,
      'Manaus', 'Entrevista', 'governor-security-b75-88'
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
      v_ibaneis, 'Ibaneis defende operação contra pichadores em monumentos.', 'Pichador não é artista. É vândalo. Vai preso.', 'Após pichação de monumentos no DF.',
      'verified', false, '2026-02-05',
      'https://www.correiobraziliense.com.br/cidades-df/2026/02/ibaneis-pichadores.html', 'news_article',
      3,
      'Brasília', 'Coletiva', 'governor-security-b75-89'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_89;

  WITH ins_90 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_elmano, 'Elmano anuncia plano contra facções no Ceará em 2026.', 'Plano de 2026 vai ser decisivo. Vamos virar o jogo.', 'Lançamento de plano estadual.',
      'verified', false, '2026-01-28',
      'https://www.opovo.com.br/noticias/ceara/2026/01/elmano-plano-2026.html', 'news_article',
      1,
      'Fortaleza', 'Lançamento', 'governor-security-b75-90'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_90;

  WITH ins_91 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jeronimo, 'Jerônimo defende Bahia com mais operações em 2026.', 'Bahia vai ficar ainda mais dura. A sociedade pediu.', 'Início de ano legislativo.',
      'verified', false, '2026-02-10',
      'https://atarde.com.br/politica/jeronimo-bahia-dura-2026', 'news_article',
      4,
      'Salvador', 'Assembleia Legislativa', 'governor-security-b75-91'
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
      v_helder, 'Helder defende equilíbrio entre segurança e direitos humanos.', 'Precisamos operar com firmeza e respeito. Não há escolha binária.', 'Reunião do Consórcio Amazônia Legal.',
      'verified', false, '2026-02-18',
      'https://oliberal.com/para/helder-equilibrio-seguranca/', 'news_article',
      1,
      'Belém', 'Reunião', 'governor-security-b75-92'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_92;

  WITH ins_93 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_raquel, 'Raquel Lyra anuncia novo pacote de rigor em 2026.', '2026 é ano de resposta definitiva. Vamos virar o jogo.', 'Mensagem à Assembleia de Pernambuco.',
      'verified', false, '2026-02-01',
      'https://jc.ne10.uol.com.br/pernambuco/2026/02/raquel-pacote-2026.html', 'news_article',
      3,
      'Recife', 'Assembleia Legislativa', 'governor-security-b75-93'
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
      v_zema, 'Zema dobra aposta contra STF em 2026.', 'STF precisa ser limitado. Em 2026 vamos levar a agenda até o fim.', 'Entrevista sobre agenda legislativa.',
      'verified', false, '2026-03-05',
      'https://www.em.com.br/app/noticia/politica/2026/03/zema-stf-agenda.shtml', 'news_article',
      5,
      'Belo Horizonte', 'Entrevista', 'governor-security-b75-94'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_94;

  WITH ins_95 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_ratinho, 'Ratinho defende operações em Londrina com 5 mortes.', 'Operação bem-sucedida. Londrina mais segura.', 'Após operação em Londrina.',
      'verified', false, '2026-03-12',
      'https://www.gazetadopovo.com.br/parana/ratinho-londrina-5/', 'news_article',
      4,
      'Curitiba', 'Coletiva', 'governor-security-b75-95'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins_95;

  WITH ins_96 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_jorginho, 'Jorginho anuncia operações estilo Rio em SC para 2026.', 'Santa Catarina vai ter operações estilo Rio. Sem meio-termo.', 'Entrevista no início do ano.',
      'verified', false, '2026-01-25',
      'https://ndmais.com.br/politica/jorginho-estilo-rio-2026/', 'news_article',
      5,
      'Florianópolis', 'Entrevista', 'governor-security-b75-96'
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
      v_leite, 'Leite anuncia Brigada com tecnologia em 2026.', 'Vamos modernizar a Brigada com tecnologia de ponta.', 'Mensagem à Assembleia do RS.',
      'verified', false, '2026-02-05',
      'https://gauchazh.clicrbs.com.br/politica/noticia/2026/02/leite-brigada-tecnologia.html', 'news_article',
      1,
      'Porto Alegre', 'Assembleia Legislativa', 'governor-security-b75-97'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_97;

  WITH ins_98 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_casagrande, 'Casagrande defende Programa Estado Presente no ES.', 'Estado Presente é modelo. Vamos ampliar em 2026.', 'Mensagem anual à Assembleia.',
      'verified', false, '2026-02-15',
      'https://www.folhavitoria.com.br/politica/casagrande-estado-presente-2026/', 'news_article',
      1,
      'Vitória', 'Assembleia Legislativa', 'governor-security-b75-98'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irresp, true FROM ins_98;

  WITH ins_99 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_riedel, 'Riedel defende polícia de MS em conflito com MST.', 'Movimento que invade terra vai ser retirado com polícia.', 'Após conflito agrário.',
      'verified', false, '2026-03-01',
      'https://www.campograndenews.com.br/politica/riedel-mst-ms-2026', 'news_article',
      4,
      'Campo Grande', 'Coletiva', 'governor-security-b75-99'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_autorit, true FROM ins_99;

  WITH ins_100 AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      severity_score,
      venue, event_name, slug
    ) VALUES (
      v_castro, 'Castro critica PEC da Segurança Pública na Câmara.', 'PEC federaliza. Vamos derrotar no plenário.', 'Durante tramitação da PEC.',
      'verified', false, '2026-04-02',
      'https://oglobo.globo.com/politica/noticia/2026/04/castro-pec-camara.ghtml', 'news_article',
      3,
      'Rio de Janeiro', 'Pronunciamento', 'governor-security-b75-100'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ameaca, true FROM ins_100;

END $$;
