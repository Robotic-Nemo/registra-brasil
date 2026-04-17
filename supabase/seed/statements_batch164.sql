-- Batch 164: Arco do julgamento e condenação de Bolsonaro (Mar 2022 - Dez 2025)
DO $$
DECLARE
  v_jair UUID; v_fla UUID; v_edu UUID; v_mic UUID; v_car UUID;
  v_tar UUID; v_mar UUID; v_nik UUID; v_cai UUID; v_zem UUID;
  v_rat UUID; v_cir UUID; v_mor UUID; v_gle UUID; v_had UUID;
  v_lul UUID; v_teb UUID; v_bou UUID; v_jan UUID; v_hel UUID;
  v_pae UUID; v_jer UUID; v_pad UUID; v_rui UUID; v_jme UUID;
  v_lew UUID; v_amo UUID; v_gil UUID; v_car2 UUID; v_zan UUID;
  v_dino UUID; v_bar UUID; v_fac UUID; v_nun UUID; v_men UUID;
  v_hou UUID; v_dav UUID; v_pac UUID; v_zam UUID; v_ram UUID;
  v_dsi UUID; v_kic UUID; v_fel UUID; v_dam UUID; v_mag UUID;
  v_hmo UUID; v_van UUID; v_adr UUID; v_kim UUID; v_rog UUID;
  c_ant UUID; c_des UUID; c_obs UUID; c_ame UUID; c_abu UUID;
  c_aut UUID; c_con UUID; c_int UUID; c_odi UUID; c_neg UUID;
  c_vio UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mic  FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_cai  FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_zem  FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_rat  FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lul  FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_teb  FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_bou  FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_hel  FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_pae  FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_jer  FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_pad  FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui  FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_jme  FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew  FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_amo  FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil  FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan  FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_dino FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_bar  FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_fac  FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_nun  FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_men  FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_hou  FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_dav  FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac  FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram  FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_kic  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_hmo  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_van  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_adr  FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_kim  FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_rog  FROM politicians WHERE slug = 'rogerio-marinho';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca urnas eletrônicas em reunião com embaixadores.', 'As urnas eletrônicas não são confiáveis. Podem ser fraudadas.', 'Reunião convocada na residência oficial do Palácio da Alvorada.', 'verified', true, '2022-07-18', 'https://g1.globo.com/politica/noticia/2022/07/18/bolsonaro-embaixadores-urnas-fraude.ghtml', 'speech', 5, 'Palácio da Alvorada', 'Reunião com embaixadores', 'bolsonaro-embaixadores-urnas-fraude-b164-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua no 7 de setembro que "só sai morto".', 'Só saio morto do Palácio. Perder eu não perco.', 'Discurso em ato na Esplanada dos Ministérios.', 'verified', true, '2022-09-07', 'https://www1.folha.uol.com.br/poder/2022/09/bolsonaro-so-saio-morto-7-setembro.shtml', 'speech', 5, 'Esplanada dos Ministérios', '7 de Setembro', 'bolsonaro-so-saio-morto-7-setembro-b164-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro se recusa a reconhecer derrota nas urnas em 30 de outubro.', '(Silêncio após derrota; dois dias depois, discurso de 2 minutos sem reconhecer resultado.)', 'Pronunciamento no Palácio da Alvorada após segundo turno.', 'verified', true, '2022-11-01', 'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/11/01/bolsonaro-pronunciamento-derrota-silencio.ghtml', 'speech', 5, 'Palácio da Alvorada', 'Pronunciamento pós-2º turno', 'bolsonaro-silencio-derrota-b164-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'PL apresenta petição pedindo anulação de urnas "que falharam".', 'Queremos anulação das urnas antigas. Detectamos falhas graves.', 'Coletiva do PL com Valdemar em Brasília.', 'verified', true, '2022-11-22', 'https://www1.folha.uol.com.br/poder/2022/11/pl-pede-anulacao-urnas-bolsonaro.shtml', 'news_article', 5, 'Brasília', 'Coletiva do PL', 'pl-pede-anulacao-urnas-b164-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira convoca atos pedindo intervenção militar.', 'Pedimos intervenção das Forças Armadas. O povo está na rua.', 'Vídeo em rede social convocando apoiadores para quartéis.', 'verified', true, '2022-11-12', 'https://g1.globo.com/politica/noticia/2022/11/12/daniel-silveira-intervencao-militar-quarteis.ghtml', 'social_media_post', 5, 'Twitter', 'Convocação', 'daniel-silveira-intervencao-militar-b164-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro viaja para EUA 2 dias antes da posse de Lula.', 'Vou descansar. Deixo o Brasil por um tempo.', 'Viagem não anunciada publicamente para Orlando, Flórida.', 'verified', true, '2022-12-30', 'https://www1.folha.uol.com.br/poder/2022/12/bolsonaro-viagem-eua-antes-posse-lula.shtml', 'news_article', 4, 'Orlando, EUA', 'Viagem aos EUA', 'bolsonaro-viagem-eua-antes-posse-b164-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro publica vídeo dos EUA no dia da invasão de 8 de janeiro.', 'Sempre estive dentro das quatro linhas da Constituição.', 'Vídeo gravado em Orlando horas após invasão dos Três Poderes.', 'verified', true, '2023-01-08', 'https://g1.globo.com/politica/noticia/2023/01/08/bolsonaro-video-eua-8-janeiro-quatro-linhas.ghtml', 'social_media_post', 5, 'Orlando, EUA', 'Pós-invasão', 'bolsonaro-video-eua-8-janeiro-b164-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que golpistas "terão que pagar" pela invasão.', 'Todos que financiaram, participaram e incentivaram terão que pagar.', 'Visita a prédios destruídos dos Três Poderes.', 'verified', true, '2023-01-09', 'https://www1.folha.uol.com.br/poder/2023/01/lula-golpistas-pagar-invasao.shtml', 'speech', 1, 'Brasília', 'Visita pós-invasão', 'lula-golpistas-terao-pagar-b164-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina bloqueio de bens de Bolsonaro após 8 de janeiro.', 'Os responsáveis pelo atentado à democracia serão responsabilizados.', 'Decisão monocrática do ministro Moraes no STF.', 'verified', true, '2023-01-13', 'https://g1.globo.com/politica/noticia/2023/01/13/moraes-bloqueia-bens-bolsonaro-8-janeiro.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-bloqueia-bens-bolsonaro-b164-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em Orlando, diz que "não tem nada a ver" com 8 de janeiro.', 'Não tenho nada a ver com aquilo. Eu estava aqui nos EUA.', 'Entrevista a jornalistas brasileiros em Orlando.', 'verified', true, '2023-01-15', 'https://www1.folha.uol.com.br/poder/2023/01/bolsonaro-orlando-nada-ver-8-janeiro.shtml', 'news_article', 5, 'Orlando, EUA', 'Entrevista', 'bolsonaro-nada-ver-8-janeiro-b164-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro volta ao Brasil e é recebido por apoiadores em Brasília.', 'Voltei para cumprir minha missão. Não fugi de nada.', 'Chegada no Aeroporto de Brasília após 89 dias nos EUA.', 'verified', true, '2023-03-30', 'https://g1.globo.com/politica/noticia/2023/03/30/bolsonaro-volta-brasil-eua-89-dias.ghtml', 'news_article', 3, 'Brasília', 'Retorno ao Brasil', 'bolsonaro-volta-89-dias-b164-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro depõe à PF sobre minuta golpista encontrada com Anderson Torres.', 'Não conheço essa minuta. Nunca vi esse papel.', 'Depoimento à PF no inquérito sobre golpe.', 'verified', true, '2023-04-26', 'https://www1.folha.uol.com.br/poder/2023/04/bolsonaro-depoe-pf-minuta-anderson-torres.shtml', 'news_article', 5, 'PF', 'Depoimento', 'bolsonaro-depoe-pf-minuta-b164-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'TSE inicia julgamento da inelegibilidade de Bolsonaro pelas urnas.', 'A Corte vai decidir sobre os ataques às urnas feitos no Alvorada.', 'Abertura do julgamento no TSE sob presidência de Moraes.', 'verified', true, '2023-06-22', 'https://g1.globo.com/politica/noticia/2023/06/22/tse-julgamento-inelegibilidade-bolsonaro-urnas.ghtml', 'speech', 1, 'TSE', 'Julgamento', 'tse-julgamento-bolsonaro-urnas-b164-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é declarado inelegível pelo TSE até 2030.', 'Não aceito essa decisão. É perseguição política.', 'Declaração após TSE condenar por abuso de poder político.', 'verified', true, '2023-06-30', 'https://www1.folha.uol.com.br/poder/2023/06/bolsonaro-inelegivel-tse-2030.shtml', 'news_article', 5, 'Brasília', 'Pós-julgamento TSE', 'bolsonaro-inelegivel-tse-2030-b164-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio chama decisão do TSE de "atropelamento do voto popular".', 'Isso é atropelamento do voto popular. Vamos recorrer até o fim.', 'Entrevista em coletiva após inelegibilidade.', 'verified', true, '2023-06-30', 'https://g1.globo.com/politica/noticia/2023/06/30/flavio-atropelamento-voto-popular-tse.ghtml', 'news_article', 3, 'Brasília', 'Coletiva', 'flavio-atropelamento-voto-popular-b164-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama TSE de "ditadura da toga".', 'O TSE virou ditadura da toga. 14 milhões condenados pelo voto de 5 ministros.', 'Vídeo no Instagram com 20 milhões de visualizações.', 'verified', true, '2023-07-01', 'https://www1.folha.uol.com.br/poder/2023/07/nikolas-tse-ditadura-toga.shtml', 'social_media_post', 5, 'Instagram', 'Vídeo', 'nikolas-tse-ditadura-toga-b164-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é indiciado pela PF no caso das joias sauditas.', 'É perseguição. Joia nenhuma foi apropriada por mim.', 'Declaração após indiciamento pela PF.', 'verified', true, '2023-07-04', 'https://g1.globo.com/politica/noticia/2023/07/04/bolsonaro-indiciado-pf-joias-sauditas.ghtml', 'news_article', 4, 'Brasília', 'Indiciamento', 'bolsonaro-indiciado-joias-sauditas-b164-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reage à delação de Mauro Cid chamando-a de "mentira".', 'Cid foi forçado a mentir. É delação premiada sob coação.', 'Entrevista após vazamento da delação do ex-ajudante de ordens.', 'verified', true, '2023-09-08', 'https://www1.folha.uol.com.br/poder/2023/09/bolsonaro-delacao-cid-mentira-coacao.shtml', 'news_article', 4, 'Brasília', 'Reação à delação', 'bolsonaro-delacao-cid-mentira-b164-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é indiciado no caso do cartão de vacinas falso.', 'Nunca falsifiquei nada. Isso é armação.', 'Declaração após indiciamento pelo caso de fraude em cartão.', 'verified', false, '2024-03-19', 'https://g1.globo.com/politica/noticia/2024/03/19/bolsonaro-indiciado-cartao-vacinas-falso.ghtml', 'news_article', 4, 'Brasília', 'Indiciamento', 'bolsonaro-indiciado-cartao-vacinas-b164-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dorme em embaixada da Hungria em Brasília.', 'Fui fazer uma visita a meu amigo Orbán, por meio do embaixador.', 'Revelação do New York Times sobre estadia de dois dias.', 'verified', true, '2024-03-25', 'https://www1.folha.uol.com.br/poder/2024/03/bolsonaro-embaixada-hungria-pernoite.shtml', 'news_article', 5, 'Embaixada da Hungria, Brasília', 'Pernoite na embaixada', 'bolsonaro-embaixada-hungria-pernoite-b164-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes dá 48 horas para Bolsonaro explicar pernoite na embaixada.', 'Quero a explicação em 48 horas. E com documentos.', 'Despacho do ministro no inquérito do golpe.', 'verified', true, '2024-03-26', 'https://g1.globo.com/politica/noticia/2024/03/26/moraes-48-horas-bolsonaro-embaixada-hungria.ghtml', 'news_article', 1, 'STF', 'Despacho judicial', 'moraes-48-horas-bolsonaro-embaixada-b164-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro diz que marido é "perseguido" e pede orações.', 'Meu marido é perseguido. Orem por ele. Deus é justo.', 'Culto em igreja evangélica em Brasília.', 'verified', false, '2024-04-05', 'https://www1.folha.uol.com.br/poder/2024/04/michelle-bolsonaro-perseguido-oracoes.shtml', 'speech', 2, 'Brasília', 'Culto', 'michelle-perseguido-oracoes-b164-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz ato na Paulista com 185 mil pessoas pedindo "liberdade".', 'Sou perseguido. Quero anistia para os injustiçados do 8 de janeiro.', 'Ato na Avenida Paulista em fevereiro de 2024.', 'verified', true, '2024-02-25', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/02/25/bolsonaro-ato-paulista-liberdade-anistia.ghtml', 'speech', 4, 'Avenida Paulista', 'Ato', 'bolsonaro-paulista-liberdade-anistia-b164-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'PF indicia Bolsonaro por trama golpista em novembro de 2024.', 'Nunca houve golpe. Isso é ficção da PF.', 'Reação ao indiciamento formal da PF por tentativa de golpe.', 'verified', true, '2024-11-21', 'https://www1.folha.uol.com.br/poder/2024/11/bolsonaro-indiciado-golpe-pf.shtml', 'news_article', 5, 'Brasília', 'Indiciamento por golpe', 'bolsonaro-indiciado-golpe-pf-b164-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio chama indiciamento de "ficção da PF".', 'É ficção da PF. Querem condenar meu pai sem provas.', 'Entrevista após PF indiciar Bolsonaro por golpe.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/flavio-indiciamento-ficcao-pf.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'flavio-indiciamento-ficcao-pf-b164-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reage à denúncia da PGR por 5 crimes, inclusive golpe.', 'Cinco crimes? É ficção jurídica. Nunca houve golpe.', 'Reação à denúncia formal de Paulo Gonet protocolada no STF.', 'verified', true, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/bolsonaro-reage-denuncia-pgr-5-crimes-golpe.ghtml', 'news_article', 4, 'Brasília', 'Reação à denúncia', 'bolsonaro-reage-denuncia-pgr-5-crimes-b164-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reage à denúncia da PGR dizendo que é "fantasia jurídica".', 'Isso é fantasia jurídica. Nunca houve golpe. Vou me defender.', 'Entrevista após receber cópia da denúncia.', 'verified', true, '2025-02-19', 'https://www1.folha.uol.com.br/poder/2025/02/bolsonaro-denuncia-pgr-fantasia-juridica.shtml', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-denuncia-fantasia-juridica-b164-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes é relator e aceita denúncia contra Bolsonaro na Primeira Turma.', 'A denúncia preenche os requisitos. Torna Bolsonaro réu.', 'Voto na sessão da Primeira Turma que tornou Bolsonaro réu.', 'verified', true, '2025-03-26', 'https://g1.globo.com/politica/noticia/2025/03/26/moraes-bolsonaro-reu-primeira-turma.ghtml', 'speech', 1, 'STF', 'Sessão Primeira Turma', 'moraes-bolsonaro-reu-primeira-turma-b164-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama tornar Bolsonaro réu de "linchamento" do STF.', 'Isso é linchamento. 5 ministros derrubando o 3º mais votado da história.', 'Discurso em plenário da Câmara.', 'verified', true, '2025-03-27', 'https://www1.folha.uol.com.br/poder/2025/03/nikolas-linchamento-bolsonaro-reu.shtml', 'speech', 4, 'Câmara dos Deputados', 'Discurso', 'nikolas-linchamento-bolsonaro-reu-b164-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro anuncia ida aos EUA "para pedir sanções".', 'Vou aos EUA pedir sanções contra Moraes e demais ministros.', 'Anúncio feito na Câmara antes de viagem.', 'verified', true, '2025-03-30', 'https://g1.globo.com/politica/noticia/2025/03/30/eduardo-bolsonaro-eua-sancoes-moraes.ghtml', 'news_article', 5, 'Brasília', 'Anúncio de viagem', 'eduardo-eua-sancoes-moraes-b164-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro presta depoimento como réu ao STF em abril.', 'Nunca houve golpe. Tudo isso é perseguição. Não reconheço a Corte.', 'Interrogatório como réu na ação da Primeira Turma.', 'verified', true, '2025-04-30', 'https://www1.folha.uol.com.br/poder/2025/04/bolsonaro-depoimento-reu-stf-golpe.shtml', 'news_article', 5, 'STF', 'Interrogatório', 'bolsonaro-depoimento-reu-stf-b164-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro evita criticar processo e defende "devido processo legal" para Bolsonaro.', 'Ele tem direito a amplo direito de defesa. O devido processo legal vale para todos.', 'Entrevista no Senado.', 'verified', false, '2025-05-02', 'https://g1.globo.com/politica/noticia/2025/05/02/moro-devido-processo-legal-bolsonaro.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'moro-devido-processo-legal-bolsonaro-b164-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca Moraes em série de tuítes raivosos.', 'Moraes é o carrasco. Um dia pagará por tudo.', 'Sequência de 20 tuítes em madrugada.', 'verified', true, '2025-05-05', 'https://www1.folha.uol.com.br/poder/2025/05/carlos-bolsonaro-ataques-moraes-tuites.shtml', 'social_media_post', 5, 'Twitter', 'Sequência de tuítes', 'carlos-ataques-moraes-tuites-b164-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é proibido de usar redes sociais por Moraes.', 'Querem calar minha voz. Mas o povo fala por mim.', 'Decisão cautelar após ataques em lives.', 'verified', true, '2025-07-18', 'https://g1.globo.com/politica/noticia/2025/07/18/bolsonaro-proibido-redes-sociais-moraes.ghtml', 'news_article', 4, 'Brasília', 'Decisão cautelar', 'bolsonaro-proibido-redes-sociais-b164-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro recebe tornozeleira eletrônica em julho.', 'É humilhação. Mas não é prisão ainda.', 'Instalação da tornozeleira após descumprimento de cautelares.', 'verified', true, '2025-07-21', 'https://www1.folha.uol.com.br/poder/2025/07/bolsonaro-tornozeleira-eletronica-cautelares.shtml', 'news_article', 5, 'Brasília', 'Tornozeleira', 'bolsonaro-tornozeleira-eletronica-b164-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro obtém sanção da Lei Magnitsky contra Moraes.', 'Moraes foi sancionado pelos EUA. Vitória da liberdade.', 'Anúncio do governo Trump sobre sanções Magnitsky.', 'verified', true, '2025-07-30', 'https://g1.globo.com/politica/noticia/2025/07/30/eua-sancionam-alexandre-moraes-magnitsky.ghtml', 'news_article', 5, 'Washington, EUA', 'Sanções Magnitsky', 'eua-sancionam-moraes-magnitsky-b164-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes diz que sanções dos EUA "não intimidam" o Brasil.', 'Sanções ilegais não intimidam o Judiciário brasileiro. Vamos em frente.', 'Discurso em sessão plenária do STF.', 'verified', true, '2025-07-31', 'https://www1.folha.uol.com.br/poder/2025/07/moraes-sancoes-nao-intimidam-brasil.shtml', 'speech', 1, 'STF', 'Sessão plenária', 'moraes-sancoes-nao-intimidam-b164-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem prisão domiciliar decretada em 4 de agosto.', 'Estou em casa. Mas minha alma é livre.', 'Imposição de prisão domiciliar por descumprimento reiterado.', 'verified', true, '2025-08-04', 'https://g1.globo.com/politica/noticia/2025/08/04/bolsonaro-prisao-domiciliar-stf.ghtml', 'news_article', 5, 'Brasília', 'Prisão domiciliar', 'bolsonaro-prisao-domiciliar-stf-b164-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio chama prisão domiciliar do pai de "tortura psicológica".', 'É tortura psicológica. Meu pai está sofrendo.', 'Entrevista após imposição da prisão domiciliar.', 'verified', true, '2025-08-04', 'https://www1.folha.uol.com.br/poder/2025/08/flavio-prisao-domiciliar-tortura-psicologica.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'flavio-tortura-psicologica-b164-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hou, 'Hugo Motta afirma que Câmara "não aceitará" sanção sobre ministros.', 'A Câmara rechaça qualquer pressão estrangeira sobre o Judiciário brasileiro.', 'Discurso no plenário defendendo soberania.', 'verified', false, '2025-08-06', 'https://g1.globo.com/politica/noticia/2025/08/06/motta-camara-rechaca-pressao-estrangeira.ghtml', 'speech', 1, 'Câmara dos Deputados', 'Discurso', 'motta-camara-rechaca-pressao-b164-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio visita Bolsonaro em prisão domiciliar e pede "calma".', 'Pedi calma. Ele está bem. Está sendo injustiçado.', 'Declaração após visita em Brasília.', 'verified', true, '2025-08-07', 'https://www1.folha.uol.com.br/poder/2025/08/tarcisio-visita-bolsonaro-prisao-calma.shtml', 'news_article', 3, 'Brasília', 'Visita', 'tarcisio-visita-bolsonaro-calma-b164-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes inicia julgamento final da ação do golpe em setembro.', 'Começa o julgamento da tentativa de golpe de Estado.', 'Sessão da Primeira Turma no STF iniciando julgamento.', 'verified', true, '2025-09-02', 'https://g1.globo.com/politica/noticia/2025/09/02/stf-inicia-julgamento-final-golpe-bolsonaro.ghtml', 'speech', 1, 'STF', 'Sessão Primeira Turma', 'stf-inicia-julgamento-final-golpe-b164-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal transmite julgamento em live atacando ministros.', 'Olha a farsa. Esse julgamento é uma farsa jurídica.', 'Live no YouTube acompanhando sessão do STF.', 'verified', true, '2025-09-02', 'https://www1.folha.uol.com.br/poder/2025/09/marcal-live-julgamento-farsa.shtml', 'social_media_post', 4, 'YouTube', 'Live', 'marcal-live-julgamento-farsa-b164-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela condenação de Bolsonaro em plenário.', 'Restou provada a participação do réu na tentativa de golpe de Estado.', 'Voto na Primeira Turma.', 'verified', true, '2025-09-09', 'https://g1.globo.com/politica/noticia/2025/09/09/zanin-vota-condenacao-bolsonaro-golpe.ghtml', 'speech', 1, 'STF', 'Sessão Primeira Turma', 'zanin-vota-condenacao-bolsonaro-b164-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dino, 'Flávio Dino vota pela condenação e cita "tentativa de ruptura".', 'Houve tentativa clara de ruptura da ordem democrática.', 'Voto na Primeira Turma do STF.', 'verified', false, '2025-09-09', 'https://www1.folha.uol.com.br/poder/2025/09/dino-vota-condenacao-bolsonaro-ruptura.shtml', 'speech', 1, 'STF', 'Sessão Primeira Turma', 'dino-vota-condenacao-bolsonaro-b164-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Cármen Lúcia vota pela condenação de Bolsonaro.', 'Condeno o réu pelos cinco crimes que lhe foram imputados.', 'Voto na Primeira Turma.', 'verified', false, '2025-09-10', 'https://g1.globo.com/politica/noticia/2025/09/10/carmen-lucia-condena-bolsonaro.ghtml', 'speech', 1, 'STF', 'Sessão Primeira Turma', 'carmen-lucia-condena-bolsonaro-b164-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas comemora voto divergente de Fux pela absolvição de Bolsonaro.', 'Fux foi o único ministro honesto. Único que absolveu.', 'Reação imediata ao voto divergente de Fux na Primeira Turma.', 'verified', true, '2025-09-10', 'https://www1.folha.uol.com.br/poder/2025/09/nikolas-comemora-voto-fux-absolvicao.shtml', 'social_media_post', 3, 'Twitter', 'Postagem', 'nikolas-comemora-voto-fux-b164-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes lê voto condenatório final de 500 páginas.', 'O réu liderou organização criminosa para tentativa de golpe de Estado.', 'Voto de 500 páginas lido em 6 horas no STF.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/moraes-voto-500-paginas-bolsonaro-golpe.ghtml', 'speech', 1, 'STF', 'Voto final', 'moraes-voto-500-paginas-b164-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é condenado a 27 anos e 3 meses de prisão em 11 de setembro.', 'Não me curvo. Continuo acreditando no Brasil e na liberdade.', 'Nota divulgada após condenação histórica no STF.', 'verified', true, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/bolsonaro-condenado-27-anos-3-meses-golpe.shtml', 'news_article', 5, 'Brasília', 'Condenação', 'bolsonaro-condenado-27-anos-3-meses-b164-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio chama condenação de "maior injustiça da história do Brasil".', 'É a maior injustiça da história do Brasil. Ele é inocente.', 'Coletiva de imprensa logo após a condenação.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/flavio-condenacao-maior-injustica-historia.ghtml', 'news_article', 4, 'Brasília', 'Coletiva', 'flavio-maior-injustica-historia-b164-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo, dos EUA, pede "pressão internacional" após condenação.', 'Peço pressão internacional sobre o Brasil. Ditadura se instalou.', 'Vídeo gravado em Miami após condenação.', 'verified', true, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/eduardo-pressao-internacional-ditadura-condenacao.shtml', 'social_media_post', 5, 'Miami, EUA', 'Vídeo', 'eduardo-pressao-internacional-ditadura-b164-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle chora em culto e diz que "Deus trará justiça".', 'Deus trará justiça. Meu marido é inocente. Confio em Deus.', 'Culto logo após condenação, com milhares de pessoas.', 'verified', true, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/michelle-chora-culto-deus-justica.ghtml', 'speech', 3, 'Brasília', 'Culto', 'michelle-chora-culto-deus-justica-b164-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que condenação "mostra que democracia funciona".', 'A democracia funcionou. Ninguém está acima da lei no Brasil.', 'Declaração em evento em São Paulo.', 'verified', true, '2025-09-12', 'https://www1.folha.uol.com.br/poder/2025/09/lula-condenacao-democracia-funciona.shtml', 'speech', 1, 'São Paulo', 'Evento', 'lula-condenacao-democracia-funciona-b164-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que condenação é "excessiva" e defende "pacificação".', 'A pena é excessiva. Precisamos de pacificação.', 'Entrevista no Palácio dos Bandeirantes.', 'verified', true, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/tarcisio-condenacao-excessiva-pacificacao.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'tarcisio-condenacao-excessiva-b164-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lidera pedido de impeachment de Moraes na Câmara.', 'Protocolei pedido de impeachment de Moraes. Ele é o responsável.', 'Protocolo de pedido na Câmara pós-condenação.', 'verified', true, '2025-09-15', 'https://www1.folha.uol.com.br/poder/2025/09/nikolas-impeachment-moraes-pos-condenacao.shtml', 'news_article', 5, 'Brasília', 'Protocolo', 'nikolas-impeachment-moraes-condenacao-b164-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal convoca "greve geral" contra o STF após condenação.', 'Convoco greve geral. O Brasil tem que parar.', 'Live com 500 mil espectadores.', 'verified', true, '2025-09-13', 'https://g1.globo.com/politica/noticia/2025/09/13/marcal-greve-geral-stf-condenacao.ghtml', 'social_media_post', 5, 'YouTube', 'Live', 'marcal-greve-geral-stf-b164-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Alcolumbre diz que Senado "estuda" projeto de anistia.', 'Vamos estudar com calma. O Senado não vai ser atropelado.', 'Declaração após pressão da oposição.', 'verified', false, '2025-09-17', 'https://www1.folha.uol.com.br/poder/2025/09/alcolumbre-senado-estuda-anistia.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'alcolumbre-senado-estuda-anistia-b164-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem grita "ditadura" em plenário durante discurso.', 'Isso é ditadura! Estamos vivendo ditadura do STF!', 'Discurso exaltado em plenário da Câmara.', 'verified', true, '2025-09-18', 'https://g1.globo.com/politica/noticia/2025/09/18/van-hattem-grita-ditadura-plenario.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Discurso', 'van-hattem-grita-ditadura-plenario-b164-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis diz que Bolsonaro é "preso político".', 'Bolsonaro é preso político. O maior líder da direita mundial está preso.', 'Entrevista em rede social bolsonarista.', 'verified', true, '2025-09-20', 'https://www1.folha.uol.com.br/poder/2025/09/bia-kicis-bolsonaro-preso-politico.shtml', 'social_media_post', 4, 'YouTube', 'Entrevista', 'kicis-bolsonaro-preso-politico-b164-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi diz que condenação "encerra ciclo de impunidade" no Brasil.', 'Esta condenação encerra um ciclo de impunidade. Democracia vence.', 'Declaração à imprensa.', 'verified', false, '2025-09-15', 'https://g1.globo.com/politica/noticia/2025/09/15/gleisi-condenacao-encerra-impunidade.ghtml', 'news_article', 1, 'Brasília', 'Declaração', 'gleisi-condenacao-encerra-impunidade-b164-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro grava áudio da prisão domiciliar pedindo "paz".', 'Não quero violência. Peço paz. O tempo é de Deus.', 'Áudio compartilhado por aliados após semana de tensão.', 'verified', true, '2025-09-25', 'https://www1.folha.uol.com.br/poder/2025/09/bolsonaro-audio-prisao-domiciliar-paz.shtml', 'audio', 3, 'Brasília', 'Áudio', 'bolsonaro-audio-prisao-paz-b164-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro diz que pena de Bolsonaro é "excessiva" mas condenação é "justa".', 'A pena é alta demais. Mas a condenação pelos crimes é justa.', 'Entrevista ao Jornal Nacional.', 'verified', true, '2025-09-16', 'https://g1.globo.com/politica/noticia/2025/09/16/moro-pena-excessiva-condenacao-justa.ghtml', 'news_article', 2, 'Curitiba', 'Entrevista', 'moro-pena-excessiva-condenacao-justa-b164-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha comemora condenação de Bolsonaro.', 'Vitória da democracia. Golpista não sai ileso.', 'Postagem em rede social.', 'verified', false, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/padilha-comemora-condenacao-bolsonaro.shtml', 'social_media_post', 1, 'Twitter', 'Postagem', 'padilha-comemora-condenacao-b164-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Messias, AGU, chama condenação de "marco civilizatório".', 'Marco civilizatório. O Brasil não é mais o país da impunidade.', 'Entrevista em Brasília.', 'verified', false, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/messias-condenacao-marco-civilizatorio.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'messias-marco-civilizatorio-b164-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho classifica condenação como "farsa".', 'É uma farsa. Bolsonaro foi julgado antes de ser julgado.', 'Discurso no plenário do Senado.', 'verified', true, '2025-09-16', 'https://www1.folha.uol.com.br/poder/2025/09/rogerio-marinho-condenacao-farsa.shtml', 'speech', 4, 'Senado Federal', 'Discurso', 'rogerio-marinho-condenacao-farsa-b164-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Advogados de Bolsonaro entram com embargos para reduzir pena.', 'Vamos recorrer até onde for possível. A pena é desproporcional.', 'Declaração da defesa, por advogado Paulo Cunha Bueno.', 'verified', false, '2025-10-03', 'https://g1.globo.com/politica/noticia/2025/10/03/defesa-bolsonaro-embargos-reduzir-pena.ghtml', 'news_article', 2, 'Brasília', 'Coletiva', 'defesa-bolsonaro-embargos-pena-b164-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hou, 'Motta aceita pautar projeto de anistia sob pressão bolsonarista.', 'Vou pautar. O plenário decide.', 'Declaração após semanas de pressão e obstrução.', 'verified', true, '2025-10-10', 'https://www1.folha.uol.com.br/poder/2025/10/motta-pauta-projeto-anistia-bolsonaristas.shtml', 'news_article', 4, 'Brasília', 'Coletiva', 'motta-pauta-anistia-pressao-b164-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende condenação e rebate críticas à Suprema Corte.', 'A decisão do STF foi técnica e respeitou o devido processo.', 'Entrevista como ministro da Justiça.', 'verified', false, '2025-10-05', 'https://g1.globo.com/politica/noticia/2025/10/05/lewandowski-defende-condenacao-stf-tecnica.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'lewandowski-defende-condenacao-b164-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compara Bolsonaro a "Nelson Mandela".', 'Bolsonaro é nosso Mandela. Preso pela verdade.', 'Discurso em culto em Brasília.', 'verified', true, '2025-10-18', 'https://www1.folha.uol.com.br/poder/2025/10/damares-bolsonaro-mandela-culto.shtml', 'speech', 4, 'Brasília', 'Culto', 'damares-bolsonaro-mandela-b164-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano organiza "jejum nacional" pela liberdade de Bolsonaro.', 'Convoco jejum nacional por três dias. Deus vai ouvir.', 'Convocação em culto e rede social.', 'verified', false, '2025-10-22', 'https://g1.globo.com/politica/noticia/2025/10/22/feliciano-jejum-nacional-bolsonaro.ghtml', 'social_media_post', 2, 'Instagram', 'Convocação', 'feliciano-jejum-nacional-bolsonaro-b164-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "Bolsonaro vai sair em triunfo".', 'Em 2026 Bolsonaro sai em triunfo. O povo o elegerá de novo.', 'Entrevista à rádio bolsonarista.', 'verified', false, '2025-10-28', 'https://www1.folha.uol.com.br/poder/2025/10/magno-malta-bolsonaro-triunfo-2026.shtml', 'news_article', 3, 'Vitória', 'Entrevista de rádio', 'magno-malta-bolsonaro-triunfo-b164-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tenta recurso para responder ao processo "em liberdade".', 'Quero responder em liberdade. Não sou risco para ninguém.', 'Pedido da defesa para revogação de domiciliar.', 'verified', false, '2025-11-05', 'https://g1.globo.com/politica/noticia/2025/11/05/bolsonaro-tenta-responder-liberdade.ghtml', 'news_article', 3, 'Brasília', 'Pedido judicial', 'bolsonaro-tenta-responder-liberdade-b164-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes rejeita embargos da defesa de Bolsonaro.', 'Embargos rejeitados. A condenação é mantida em todos os seus termos.', 'Decisão monocrática negando embargos declaratórios.', 'verified', true, '2025-11-15', 'https://www1.folha.uol.com.br/poder/2025/11/moraes-rejeita-embargos-defesa-bolsonaro.shtml', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-rejeita-embargos-bolsonaro-b164-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem pena formalmente executada em 25 de novembro.', 'Dia triste. Mas não me quebro. O Brasil acima de tudo.', 'Início da execução da pena de 27 anos e 3 meses.', 'verified', true, '2025-11-25', 'https://g1.globo.com/politica/noticia/2025/11/25/bolsonaro-pena-executada-27-anos.ghtml', 'news_article', 5, 'Brasília', 'Início de pena', 'bolsonaro-pena-executada-25-novembro-b164-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio vai a Brasília no dia do início da pena do pai.', 'Meu pai é o maior líder da direita. Vou estar ao lado dele.', 'Declaração à imprensa no dia da execução da pena.', 'verified', true, '2025-11-25', 'https://www1.folha.uol.com.br/poder/2025/11/flavio-brasilia-inicio-pena-pai.shtml', 'news_article', 3, 'Brasília', 'Declaração', 'flavio-brasilia-inicio-pena-b164-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz live no dia da pena, dizendo ser "dia negro".', 'Hoje é dia negro para o Brasil. Mas não vamos desistir.', 'Live no Instagram com centenas de milhares.', 'verified', true, '2025-11-25', 'https://g1.globo.com/politica/noticia/2025/11/25/nikolas-live-dia-negro-pena-bolsonaro.ghtml', 'social_media_post', 3, 'Instagram', 'Live', 'nikolas-live-dia-negro-pena-b164-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal faz "vigília" virtual no dia de início da pena.', 'Estamos na vigília. 24 horas online pela liberdade do capitão.', 'Live de 24 horas no YouTube.', 'verified', true, '2025-11-25', 'https://www1.folha.uol.com.br/poder/2025/11/marcal-vigilia-virtual-24-horas-bolsonaro.shtml', 'social_media_post', 3, 'YouTube', 'Live de 24h', 'marcal-vigilia-virtual-24-horas-b164-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle acompanha Bolsonaro no dia da execução da pena.', 'Estou com ele. Deus é nosso refúgio.', 'Declaração breve à imprensa em Brasília.', 'verified', true, '2025-11-25', 'https://g1.globo.com/politica/noticia/2025/11/25/michelle-acompanha-bolsonaro-execucao-pena.ghtml', 'news_article', 2, 'Brasília', 'Declaração', 'michelle-acompanha-bolsonaro-execucao-b164-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita ato no dia da pena e emite nota mais branda.', 'Respeito as instituições. Mas defendo anistia.', 'Nota em vez de comparecer a ato.', 'verified', true, '2025-11-25', 'https://www1.folha.uol.com.br/poder/2025/11/tarcisio-nota-dia-pena-anistia-instituicoes.shtml', 'news_article', 3, 'São Paulo', 'Nota', 'tarcisio-nota-dia-pena-anistia-b164-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo organiza "ato global" em 40 cidades no exterior.', 'Organizamos atos em 40 cidades no exterior. Mundo vai ver.', 'Tuíte convocando atos em Miami, Lisboa, Orlando, Madrid etc.', 'verified', true, '2025-11-26', 'https://g1.globo.com/politica/noticia/2025/11/26/eduardo-ato-global-40-cidades-exterior.ghtml', 'social_media_post', 3, 'Twitter', 'Convocação', 'eduardo-ato-global-40-cidades-b164-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é transferido para "Papudinha" em 11 de dezembro.', 'Onde eu estiver, estarei com o povo brasileiro.', 'Transferência para complexo penitenciário da Papuda.', 'verified', true, '2025-12-11', 'https://www1.folha.uol.com.br/poder/2025/12/bolsonaro-transferido-papudinha-papuda.shtml', 'news_article', 5, 'Papuda, DF', 'Transferência', 'bolsonaro-transferido-papudinha-b164-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio chama transferência de "vingança de Moraes".', 'É vingança pessoal de Moraes. Querem quebrar meu pai.', 'Entrevista à chegada na Papuda.', 'verified', true, '2025-12-11', 'https://g1.globo.com/politica/noticia/2025/12/11/flavio-transferencia-vinganca-moraes-papudinha.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'flavio-transferencia-vinganca-moraes-b164-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes nega pedido de Bolsonaro para voltar à prisão domiciliar.', 'Pedido negado. Cumprimento normal de pena.', 'Decisão monocrática negando pedido da defesa.', 'verified', true, '2025-12-12', 'https://www1.folha.uol.com.br/poder/2025/12/moraes-nega-volta-domiciliar-bolsonaro.shtml', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-nega-volta-domiciliar-b164-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal ameaça "dar nome e endereço" de ministros em live.', 'Vou dar nome e endereço. Deixar tudo claro.', 'Live retirada do ar por ordem judicial.', 'verified', true, '2025-12-13', 'https://g1.globo.com/politica/noticia/2025/12/13/marcal-ameaca-nome-endereco-ministros-live.ghtml', 'social_media_post', 5, 'YouTube', 'Live', 'marcal-ameaca-nome-endereco-b164-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas pede contatos com Bolsonaro na Papuda.', 'Estou pedindo visita. Quero ver como ele está.', 'Postagem solicitando autorização de visita.', 'verified', false, '2025-12-14', 'https://www1.folha.uol.com.br/poder/2025/12/nikolas-pede-visita-bolsonaro-papuda.shtml', 'social_media_post', 2, 'Twitter', 'Postagem', 'nikolas-pede-visita-papuda-b164-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle visita Bolsonaro na Papuda em 15 de dezembro.', 'Ele está firme. Nosso Deus é fiel.', 'Primeira visita oficial após transferência.', 'verified', true, '2025-12-15', 'https://g1.globo.com/politica/noticia/2025/12/15/michelle-visita-bolsonaro-papuda.ghtml', 'news_article', 3, 'Papuda, DF', 'Visita', 'michelle-visita-bolsonaro-papuda-b164-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro diz que condenação "deveria" ser reduzida.', 'A condenação é correta, mas a pena é exagerada. Deveria ser reduzida.', 'Entrevista à rádio CBN.', 'verified', false, '2025-12-16', 'https://www1.folha.uol.com.br/poder/2025/12/ciro-condenacao-pena-reduzida.shtml', 'news_article', 2, 'Fortaleza', 'Entrevista CBN', 'ciro-condenacao-pena-reduzida-b164-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso, ex-presidente do STF, defende condenação em discurso.', 'A decisão foi acertada. Democracia se protege.', 'Palestra em universidade em São Paulo.', 'verified', false, '2025-12-17', 'https://g1.globo.com/politica/noticia/2025/12/17/barroso-defende-condenacao-stf-democracia.ghtml', 'speech', 1, 'São Paulo', 'Palestra', 'barroso-defende-condenacao-stf-b164-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin assume presidência do STF e promete "firmeza democrática".', 'Atravessaremos 2026 com firmeza democrática. Instituições fortes.', 'Discurso de posse como presidente do STF.', 'verified', true, '2025-09-30', 'https://www1.folha.uol.com.br/poder/2025/09/fachin-posse-presidencia-stf-firmeza.shtml', 'speech', 1, 'STF', 'Posse', 'fachin-posse-presidencia-stf-b164-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones ironiza pedido de habeas de Bolsonaro.', 'Agora quer habeas? Quando era presidente queria prender adversário.', 'Postagem em rede social.', 'verified', false, '2025-12-18', 'https://g1.globo.com/politica/noticia/2025/12/18/janones-ironiza-habeas-bolsonaro.ghtml', 'social_media_post', 2, 'Twitter', 'Postagem', 'janones-ironiza-habeas-bolsonaro-b164-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio visita Bolsonaro na Papuda em 19 de dezembro.', 'Ele está bem. Vamos continuar lutando por ele.', 'Primeira visita de Tarcísio na Papuda.', 'verified', true, '2025-12-19', 'https://www1.folha.uol.com.br/poder/2025/12/tarcisio-visita-bolsonaro-papuda.shtml', 'news_article', 3, 'Papuda, DF', 'Visita', 'tarcisio-visita-bolsonaro-papuda-b164-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo faz discurso em Davos pedindo "resgate" do pai.', 'O Brasil virou ditadura. Precisamos de intervenção internacional.', 'Entrevista a fóruns internacionais do exílio.', 'verified', true, '2025-12-20', 'https://g1.globo.com/politica/noticia/2025/12/20/eduardo-davos-resgate-pai-ditadura.ghtml', 'news_article', 5, 'Fórum internacional', 'Entrevista', 'eduardo-davos-resgate-pai-b164-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira visita Bolsonaro e sai gritando "golpe".', 'Isso é golpe. Bolsonaro é vítima de golpe jurídico.', 'Declaração à imprensa após visita.', 'verified', true, '2025-12-21', 'https://www1.folha.uol.com.br/poder/2025/12/daniel-silveira-visita-bolsonaro-grita-golpe.shtml', 'speech', 5, 'Papuda, DF', 'Visita', 'daniel-silveira-visita-bolsonaro-b164-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis pede "amnistia já" em discurso emocionado.', 'Anistia já! Bolsonaro inocente!', 'Discurso no plenário da Câmara.', 'verified', true, '2025-12-22', 'https://g1.globo.com/politica/noticia/2025/12/22/bia-kicis-amnistia-ja-bolsonaro.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Discurso', 'bia-kicis-amnistia-ja-bolsonaro-b164-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro envia carta de Natal da Papuda a apoiadores.', 'Feliz Natal. Deus abençoe o Brasil. Não desistam.', 'Carta manuscrita divulgada pela família.', 'verified', true, '2025-12-24', 'https://www1.folha.uol.com.br/poder/2025/12/bolsonaro-carta-natal-papuda-apoiadores.shtml', 'other', 3, 'Papuda, DF', 'Carta de Natal', 'bolsonaro-carta-natal-papuda-b164-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro diz em fim de ano que "país supera crise" e STF "acertou".', 'País supera a crise. A institucionalidade venceu.', 'Entrevista ao Jornal Nacional.', 'verified', false, '2025-12-26', 'https://g1.globo.com/politica/noticia/2025/12/26/moro-pais-supera-crise-stf-acertou.ghtml', 'news_article', 1, 'Curitiba', 'Entrevista', 'moro-pais-supera-crise-stf-b164-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "Brasil vira página" após condenação.', 'Viramos a página. O Brasil não vai voltar ao passado golpista.', 'Pronunciamento em cadeia nacional.', 'verified', true, '2025-12-28', 'https://www1.folha.uol.com.br/poder/2025/12/lula-brasil-vira-pagina-condenacao.shtml', 'speech', 1, 'Brasília', 'Pronunciamento', 'lula-brasil-vira-pagina-condenacao-b164-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio anuncia "caminhada pela liberdade" no dia do Natal.', 'Fizemos caminhada pela liberdade do capitão. Natal em luta.', 'Postagem em rede social no dia do Natal.', 'verified', false, '2025-12-25', 'https://g1.globo.com/politica/noticia/2025/12/25/flavio-caminhada-liberdade-natal-bolsonaro.ghtml', 'social_media_post', 3, 'Rio de Janeiro', 'Caminhada', 'flavio-caminhada-liberdade-natal-b164-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes, em fim de ano, diz que "golpistas serão punidos".', 'Todos os golpistas, sem exceção, serão punidos. Estado de Direito venceu.', 'Discurso no TSE em sessão final de 2025.', 'verified', true, '2025-12-29', 'https://www1.folha.uol.com.br/poder/2025/12/moraes-golpistas-serao-punidos-fim-ano.shtml', 'speech', 1, 'TSE', 'Sessão final', 'moraes-golpistas-serao-punidos-b164-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro fecha 2025 preso na Papuda cumprindo pena de 27 anos.', 'Continuarei lutando. Minha história ainda não acabou.', 'Mensagem final de 2025 divulgada pela família.', 'verified', true, '2025-12-31', 'https://g1.globo.com/politica/noticia/2025/12/31/bolsonaro-fim-2025-papuda-27-anos.ghtml', 'social_media_post', 4, 'Papuda, DF', 'Mensagem de fim de ano', 'bolsonaro-fim-2025-papuda-b164-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

END $$;
