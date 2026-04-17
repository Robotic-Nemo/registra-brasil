-- Batch 163: Corrida eleitoral 2026 - pré-campanha e primeiros meses (Out 2025 - Abr 2026)
DO $$
DECLARE
  v_fla UUID; v_edu UUID; v_jair UUID; v_mic UUID; v_car UUID;
  v_tar UUID; v_mar UUID; v_nik UUID; v_cai UUID; v_zem UUID;
  v_rat UUID; v_cir UUID; v_mor UUID; v_gle UUID; v_had UUID;
  v_lul UUID; v_teb UUID; v_bou UUID; v_bop UUID; v_jan UUID;
  v_hel UUID; v_pae UUID; v_jer UUID; v_pad UUID; v_rui UUID;
  v_jme UUID; v_lew UUID; v_amo UUID; v_gil UUID; v_car2 UUID;
  v_zan UUID; v_dino UUID; v_bar UUID; v_fac UUID; v_nun UUID;
  v_men UUID; v_hmo UUID; v_dav UUID; v_pac UUID; v_zam UUID;
  v_ram UUID; v_dsi UUID; v_kic UUID; v_fel UUID; v_dam UUID;
  v_mag UUID; v_hou UUID; v_van UUID; v_adr UUID; v_kim UUID;
  v_rog UUID;
  c_ant UUID; c_des UUID; c_obs UUID; c_ame UUID; c_abu UUID;
  c_aut UUID; c_con UUID; c_int UUID; c_odi UUID; c_neg UUID;
  c_vio UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
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
  SELECT id INTO v_bop  FROM politicians WHERE slug = 'boulos-prefeito';
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio afirma que vai disputar 2026 "se Bolsonaro pedir".', 'Eu só disputo a Presidência se o presidente Bolsonaro pedir. Sou leal a ele.', 'Entrevista em evento do PL em São Paulo no início da pré-campanha.', 'verified', true, '2025-10-05', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/10/05/tarcisio-disputa-bolsonaro-pedir.ghtml', 'news_article', 3, 'São Paulo', 'Evento do PL', 'tarcisio-se-bolsonaro-pedir-b163-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Pablo Marçal anuncia pré-candidatura à Presidência com ataques ao STF.', 'Vou ser presidente em 2026 e vou passar o trator na ditadura da toga.', 'Transmissão ao vivo no Instagram anunciando intenção de concorrer.', 'verified', true, '2025-10-12', 'https://www1.folha.uol.com.br/poder/2025/10/marcal-pre-candidato-2026-trator-toga.shtml', 'social_media_post', 5, 'Instagram', 'Live de pré-campanha', 'marcal-pre-candidato-trator-toga-b163-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que disputará governo de Minas em 2026.', 'Vou ser o próximo governador de Minas Gerais. Minas vai virar uma fortaleza conservadora.', 'Discurso em evento em Belo Horizonte.', 'verified', true, '2025-10-15', 'https://g1.globo.com/mg/minas-gerais/eleicoes/2026/noticia/2025/10/15/nikolas-governador-minas.ghtml', 'speech', 2, 'Belo Horizonte', 'Evento do PL', 'nikolas-governador-minas-b163-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes lança pré-candidatura de 2026 com ataque a Lula e Bolsonaro.', 'Os dois extremos destruíram o Brasil. O PDT é a única alternativa decente.', 'Convenção nacional do PDT em Brasília.', 'verified', true, '2025-10-18', 'https://www1.folha.uol.com.br/poder/2025/10/ciro-pre-candidato-2026-extremos.shtml', 'speech', 2, 'Brasília', 'Convenção do PDT', 'ciro-pre-candidato-extremos-b163-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro diz que disputará reeleição ao Senado e descarta Presidência.', 'Meu foco é o Paraná. Não vou disputar a Presidência em 2026.', 'Entrevista em Curitiba sobre planos eleitorais.', 'verified', false, '2025-10-20', 'https://g1.globo.com/pr/parana/eleicoes/2026/noticia/2025/10/20/moro-reeleicao-senado-parana.ghtml', 'news_article', 1, 'Curitiba', 'Entrevista coletiva', 'moro-reeleicao-senado-parana-b163-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro diz que pai está "elegível pelo povo" mesmo preso.', 'Bolsonaro está preso, mas é elegível pelo povo. Em 2026 ele volta.', 'Entrevista após visita ao pai em prisão domiciliar.', 'verified', true, '2025-10-22', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/10/22/flavio-bolsonaro-elegivel-povo.ghtml', 'news_article', 5, 'Brasília', 'Entrevista coletiva', 'flavio-bolsonaro-elegivel-povo-b163-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro diz que será "candidata do povo" em 2026.', 'Se Deus quiser e o povo pedir, eu serei candidata. Vou ser a voz do meu marido.', 'Culto em igreja em Brasília com apoiadores.', 'verified', true, '2025-10-25', 'https://www1.folha.uol.com.br/poder/2025/10/michelle-bolsonaro-candidata-povo-2026.shtml', 'speech', 3, 'Brasília', 'Culto evangélico', 'michelle-candidata-povo-2026-b163-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro dos EUA diz que 2026 será "a última chance" da direita.', 'Se não vencermos em 2026, não haverá 2030. A ditadura se consolida.', 'Entrevista a canal bolsonarista dos EUA, onde mora em autoexílio.', 'verified', true, '2025-10-28', 'https://g1.globo.com/politica/noticia/2025/10/28/eduardo-bolsonaro-ultima-chance-2026.ghtml', 'social_media_post', 5, 'Flórida, EUA', 'Entrevista em podcast', 'eduardo-ultima-chance-2026-b163-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema admite pré-candidatura à Presidência pelo Novo.', 'Sim, sou pré-candidato. Minas Gerais mostra o Brasil que queremos.', 'Entrevista coletiva em Belo Horizonte.', 'verified', false, '2025-10-30', 'https://valor.globo.com/politica/noticia/2025/10/30/zema-pre-candidato-novo-presidencia.ghtml', 'news_article', 2, 'Belo Horizonte', 'Entrevista coletiva', 'zema-pre-candidato-novo-b163-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior diz que disputa presidencial depende do PSD.', 'Vou seguir o que Kassab decidir. Estou pronto para a missão.', 'Entrevista em Curitiba sobre cenário presidencial.', 'verified', false, '2025-11-02', 'https://g1.globo.com/pr/parana/eleicoes/2026/noticia/2025/11/02/ratinho-junior-psd-kassab-presidencia.ghtml', 'news_article', 1, 'Curitiba', 'Entrevista coletiva', 'ratinho-junior-psd-kassab-b163-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado diz que é "o único" capaz de unir a direita em 2026.', 'Sem vaidade: sou o único que pode unir a direita sem radicalismo.', 'Entrevista ao Jornal Nacional da TV Globo.', 'verified', false, '2025-11-05', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/11/05/caiado-unico-unir-direita.ghtml', 'news_article', 2, 'Goiânia', 'Entrevista ao JN', 'caiado-unico-unir-direita-b163-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confirma que disputará reeleição em 2026.', 'Sim, vou disputar. Ainda tenho muito a fazer pelo Brasil e pelo povo pobre.', 'Entrevista coletiva após reunião ministerial em Brasília.', 'verified', true, '2025-11-08', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/11/08/lula-confirma-reeleicao-2026.ghtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'lula-confirma-reeleicao-2026-b163-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal publica vídeo comparando STF a "tribunal comunista".', 'O STF virou tribunal comunista. Ministros com toga e foice.', 'Vídeo em TikTok viralizando ataques ao Supremo.', 'verified', true, '2025-11-10', 'https://www1.folha.uol.com.br/poder/2025/11/marcal-stf-tribunal-comunista.shtml', 'social_media_post', 5, 'TikTok', 'Vídeo viral', 'marcal-stf-tribunal-comunista-b163-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita criticar Bolsonaro preso mas defende anistia.', 'O presidente Bolsonaro não merece esse calvário. Defendo anistia ampla.', 'Entrevista à Rádio Bandeirantes.', 'verified', true, '2025-11-12', 'https://g1.globo.com/politica/noticia/2025/11/12/tarcisio-anistia-bolsonaro-preso.ghtml', 'news_article', 4, 'São Paulo', 'Entrevista de rádio', 'tarcisio-anistia-bolsonaro-preso-b163-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama Zanin de "ministro do gabinete" em sessão.', 'Zanin é ministro do gabinete do Lula. Essa é a verdade.', 'Discurso em plenário da Câmara atacando o STF.', 'verified', true, '2025-11-15', 'https://www1.folha.uol.com.br/poder/2025/11/nikolas-zanin-ministro-gabinete.shtml', 'speech', 4, 'Câmara dos Deputados', 'Discurso em plenário', 'nikolas-zanin-gabinete-b163-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho se lança como alternativa do centro para 2026.', 'O Brasil precisa de alguém do Norte, alguém do centro. Estou pronto.', 'Evento do MDB no Pará.', 'verified', false, '2025-11-18', 'https://g1.globo.com/pa/para/eleicoes/2026/noticia/2025/11/18/helder-barbalho-alternativa-centro.ghtml', 'speech', 1, 'Belém', 'Evento do MDB', 'helder-alternativa-centro-b163-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pae, 'Eduardo Paes descarta disputa pela Presidência e mira governo do RJ.', 'Não vou disputar Presidência. Meu projeto é governar o Rio de Janeiro.', 'Entrevista no Palácio da Cidade, no Rio.', 'verified', false, '2025-11-20', 'https://www1.folha.uol.com.br/poder/2025/11/eduardo-paes-governo-rio-2026.shtml', 'news_article', 1, 'Rio de Janeiro', 'Entrevista coletiva', 'paes-governo-rio-2026-b163-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal diz que urnas "podem" ser fraudadas e prega "voto impresso".', 'Urna pode ser fraudada. Por isso defendo o voto impresso em 2026.', 'Live no YouTube com mais de 300 mil espectadores.', 'verified', true, '2025-11-22', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/11/22/marcal-urna-fraudada-voto-impresso.ghtml', 'social_media_post', 5, 'YouTube', 'Live pré-campanha', 'marcal-urna-fraudada-b163-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que "ninguém é dono da direita" em crítica a Tarcísio.', 'Ninguém é dono da direita. Só o Bolsonaro representa.', 'Entrevista após reunião no PL.', 'verified', false, '2025-11-25', 'https://www1.folha.uol.com.br/poder/2025/11/flavio-ninguem-dono-direita.shtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'flavio-dono-direita-b163-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro xinga Lula de "mentiroso contumaz" em programa de TV.', 'Lula é um mentiroso contumaz. Não tem vergonha na cara.', 'Entrevista ao Roda Viva.', 'verified', true, '2025-11-27', 'https://g1.globo.com/politica/noticia/2025/11/27/ciro-lula-mentiroso-contumaz-roda-viva.ghtml', 'news_article', 2, 'São Paulo', 'Roda Viva', 'ciro-lula-mentiroso-roda-viva-b163-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones ataca Marçal chamando-o de "estelionatário eleitoral".', 'Marçal é estelionatário. Vende curso para trouxa virar milionário.', 'Vídeo nas redes sociais em tom de campanha antecipada.', 'verified', false, '2025-11-29', 'https://www1.folha.uol.com.br/poder/2025/11/janones-marcal-estelionatario.shtml', 'social_media_post', 2, 'Twitter', 'Postagem', 'janones-marcal-estelionatario-b163-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio reúne governadores de direita para "frente ampla".', 'Precisamos de uma frente ampla de governadores. O Brasil não aguenta mais o PT.', 'Encontro com Caiado, Zema e Ratinho Junior em Brasília.', 'verified', true, '2025-12-02', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/12/02/tarcisio-governadores-frente-ampla.ghtml', 'news_article', 2, 'Brasília', 'Encontro de governadores', 'tarcisio-governadores-frente-ampla-b163-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro afirma que Lava Jato "devolveu bilhões" e ataca Lula.', 'A Lava Jato devolveu bilhões. Lula preso não foi injustiça, foi justiça.', 'Entrevista em evento no Paraná.', 'verified', false, '2025-12-04', 'https://g1.globo.com/pr/parana/noticia/2025/12/04/moro-lava-jato-devolveu-bilhoes.ghtml', 'speech', 3, 'Curitiba', 'Evento partidário', 'moro-lava-jato-bilhoes-b163-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas posta vídeo com "dossiê" contra Alexandre de Moraes.', 'Tenho um dossiê contra Moraes. Esse homem precisa ser impedido.', 'Vídeo no Instagram com acusações sem provas.', 'verified', true, '2025-12-06', 'https://www1.folha.uol.com.br/poder/2025/12/nikolas-dossie-moraes.shtml', 'social_media_post', 5, 'Instagram', 'Vídeo', 'nikolas-dossie-moraes-b163-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que economia "dá palco" para Lula em 2026.', 'A economia está entregando. Lula vai chegar em 2026 com bons números.', 'Entrevista sobre resultados econômicos.', 'verified', false, '2025-12-08', 'https://valor.globo.com/politica/noticia/2025/12/08/haddad-economia-palco-lula-2026.ghtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'haddad-economia-palco-lula-b163-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio pede que apoiadores "não deixem Bolsonaro sozinho" em ato.', 'Se Bolsonaro está preso, a gente precisa estar nas ruas. Não o deixem sozinho.', 'Convocação para ato na Paulista em dezembro.', 'verified', true, '2025-12-10', 'https://g1.globo.com/politica/noticia/2025/12/10/flavio-ato-paulista-bolsonaro-sozinho.ghtml', 'social_media_post', 4, 'Twitter', 'Convocação de ato', 'flavio-ato-paulista-bolsonaro-b163-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal promete "caça" a servidores públicos "petistas" se eleito.', 'Vou fazer uma caça aos servidores petistas. Ninguém vai escapar.', 'Entrevista em podcast bolsonarista.', 'verified', true, '2025-12-12', 'https://www1.folha.uol.com.br/poder/2025/12/marcal-caca-servidores-petistas.shtml', 'social_media_post', 5, 'Podcast', 'Entrevista', 'marcal-caca-servidores-b163-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet descarta candidatura presidencial e apoia Lula.', 'Não serei candidata. Apoio o presidente Lula em 2026.', 'Entrevista após reunião no Ministério do Planejamento.', 'verified', false, '2025-12-14', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2025/12/14/tebet-descarta-candidatura-apoia-lula.ghtml', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'tebet-apoia-lula-2026-b163-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que "Deus escolherá" o candidato da direita.', 'Não sou eu quem vai decidir. É Deus que vai escolher em 2026.', 'Culto em Goiânia com milhares de fiéis.', 'verified', false, '2025-12-16', 'https://www1.folha.uol.com.br/poder/2025/12/michelle-deus-escolhera-candidato.shtml', 'speech', 2, 'Goiânia', 'Culto evangélico', 'michelle-deus-escolhera-b163-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas sugere "auditoria nas urnas" e é advertido pelo TSE.', 'Exijo auditoria nas urnas em 2026. O povo merece.', 'Vídeo em rede social recebeu advertência do TSE.', 'verified', true, '2025-12-18', 'https://g1.globo.com/politica/noticia/2025/12/18/nikolas-auditoria-urnas-tse-advertencia.ghtml', 'social_media_post', 5, 'Instagram', 'Vídeo', 'nikolas-auditoria-urnas-tse-b163-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio endossa "anistia" para 8 de janeiro em conversa com ruralistas.', 'Defendo anistia. Eles já pagaram demais. Foram excessos.', 'Reunião com bancada ruralista no Palácio dos Bandeirantes.', 'verified', true, '2025-12-20', 'https://www1.folha.uol.com.br/poder/2025/12/tarcisio-anistia-8-janeiro-ruralistas.shtml', 'news_article', 4, 'São Paulo', 'Reunião com ruralistas', 'tarcisio-anistia-8-janeiro-b163-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende "revisão" de decisões do STF via Congresso.', 'O Congresso tem que revisar decisões do Supremo. É equilíbrio de poderes.', 'Entrevista em Goiânia.', 'verified', false, '2025-12-22', 'https://g1.globo.com/go/goias/noticia/2025/12/22/caiado-revisao-stf-congresso.ghtml', 'news_article', 3, 'Goiânia', 'Entrevista coletiva', 'caiado-revisao-stf-congresso-b163-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema ataca Lula por "aparelhar" PF e Receita.', 'Lula aparelhou a PF, a Receita, tudo. É perseguição política.', 'Entrevista à Jovem Pan.', 'verified', false, '2025-12-28', 'https://www1.folha.uol.com.br/poder/2025/12/zema-lula-aparelhou-pf-receita.shtml', 'news_article', 3, 'Belo Horizonte', 'Entrevista Jovem Pan', 'zema-aparelhou-pf-receita-b163-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "golpistas não voltarão" em discurso de fim de ano.', 'Os golpistas foram derrotados. Não deixaremos que voltem.', 'Pronunciamento de fim de ano em cadeia nacional.', 'verified', true, '2025-12-31', 'https://g1.globo.com/politica/noticia/2025/12/31/lula-pronunciamento-fim-ano-golpistas.ghtml', 'speech', 1, 'Brasília', 'Pronunciamento oficial', 'lula-pronunciamento-fim-ano-b163-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal chama 8 de janeiro de "passeio de idosos".', 'Oito de janeiro foi passeio de idosos. Golpe não teve.', 'Live no YouTube comentando aniversário da invasão.', 'verified', true, '2026-01-08', 'https://g1.globo.com/politica/noticia/2026/01/08/marcal-8-janeiro-passeio-idosos.ghtml', 'social_media_post', 5, 'YouTube', 'Live', 'marcal-8-janeiro-passeio-idosos-b163-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo defende "sanções dos EUA" a Moraes em entrevista a Fox News.', 'O governo Trump deve sancionar Moraes. Ele é um tirano.', 'Entrevista à Fox News nos EUA.', 'verified', true, '2026-01-12', 'https://www1.folha.uol.com.br/poder/2026/01/eduardo-sancoes-eua-moraes-fox-news.shtml', 'news_article', 5, 'Miami, EUA', 'Fox News', 'eduardo-sancoes-moraes-fox-b163-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio filia-se ao PL para disputar Presidência.', 'Entro no PL para honrar a história do partido e disputar 2026.', 'Cerimônia de filiação em Brasília, com Valdemar Costa Neto.', 'verified', true, '2026-01-15', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/01/15/tarcisio-filiacao-pl-presidencia.ghtml', 'news_article', 3, 'Brasília', 'Cerimônia de filiação', 'tarcisio-filiacao-pl-b163-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que Tarcísio "não é o escolhido" de Bolsonaro.', 'Tarcísio é bom, mas não é o escolhido do Bolsonaro. Ainda.', 'Entrevista após filiação de Tarcísio ao PL.', 'verified', true, '2026-01-16', 'https://www1.folha.uol.com.br/poder/2026/01/flavio-tarcisio-nao-escolhido.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'flavio-tarcisio-nao-escolhido-b163-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal promete "fuzilar" corrupção se eleito.', 'Vou fuzilar a corrupção. Bandido vai ter medo.', 'Comício em Curitiba, em pré-campanha.', 'verified', true, '2026-01-18', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/01/18/marcal-fuzilar-corrupcao.ghtml', 'speech', 5, 'Curitiba', 'Comício', 'marcal-fuzilar-corrupcao-b163-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas anuncia pré-candidatura ao governo de Minas no Sabatina.', 'Oficialmente: vou disputar o governo de Minas em 2026.', 'Sabatina do UOL em Belo Horizonte.', 'verified', true, '2026-01-20', 'https://www1.folha.uol.com.br/poder/2026/01/nikolas-oficializa-governo-minas.shtml', 'news_article', 2, 'Belo Horizonte', 'Sabatina UOL', 'nikolas-oficializa-governo-minas-b163-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro diz que Lula "caiu de joelhos" diante do Centrão.', 'Lula caiu de joelhos para o Centrão. Virou refém.', 'Entrevista à rádio CBN.', 'verified', false, '2026-01-22', 'https://g1.globo.com/politica/noticia/2026/01/22/ciro-lula-joelhos-centrao.ghtml', 'news_article', 2, 'Fortaleza', 'Entrevista CBN', 'ciro-lula-joelhos-centrao-b163-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hou, 'Hugo Motta pauta projeto de anistia na Câmara.', 'Vamos pautar o projeto de anistia. O Brasil precisa virar a página.', 'Coletiva após reunião de líderes na Câmara.', 'verified', true, '2026-01-25', 'https://g1.globo.com/politica/noticia/2026/01/25/motta-pauta-projeto-anistia-camara.ghtml', 'news_article', 4, 'Brasília', 'Coletiva na Câmara', 'motta-pauta-anistia-b163-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Alcolumbre diz que Senado "não vai atropelar" pauta do STF.', 'O Senado não vai atropelar o STF. Mas também não somos submissos.', 'Entrevista após retomada dos trabalhos.', 'verified', false, '2026-01-27', 'https://www1.folha.uol.com.br/poder/2026/01/alcolumbre-senado-stf-nao-submisso.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'alcolumbre-senado-stf-b163-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira, em liberdade, pede "2026 sem Moraes".', 'Quero 2026 sem Moraes. Ele é o grande inimigo da democracia.', 'Postagem em rede social após retomar liberdade vigiada.', 'verified', true, '2026-01-30', 'https://g1.globo.com/politica/noticia/2026/01/30/daniel-silveira-2026-sem-moraes.ghtml', 'social_media_post', 5, 'Twitter', 'Postagem', 'daniel-silveira-2026-sem-moraes-b163-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli, dos EUA, chama Lula de "ditador" em vídeo.', 'Lula é ditador. Ele prendeu Bolsonaro, prendeu jornalistas, persegue.', 'Vídeo gravado em Miami com megapedidos de sanções.', 'verified', true, '2026-02-02', 'https://www1.folha.uol.com.br/poder/2026/02/zambelli-lula-ditador-miami.shtml', 'social_media_post', 5, 'Miami, EUA', 'Vídeo', 'zambelli-lula-ditador-miami-b163-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende "CPI das urnas" na Câmara.', 'Precisamos de uma CPI das urnas. O povo quer auditoria.', 'Discurso em plenário da Câmara.', 'verified', false, '2026-02-04', 'https://g1.globo.com/politica/noticia/2026/02/04/bia-kicis-cpi-urnas.ghtml', 'speech', 4, 'Brasília', 'Câmara', 'kicis-cpi-urnas-b163-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro afirma que Lula "não deveria" ser elegível.', 'Um homem condenado, depois liberado por tecnicalidade, não deveria ser elegível.', 'Discurso no Senado.', 'verified', true, '2026-02-06', 'https://www1.folha.uol.com.br/poder/2026/02/moro-lula-nao-deveria-ser-elegivel.shtml', 'speech', 4, 'Senado Federal', 'Discurso', 'moro-lula-nao-elegivel-b163-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal faz live com Jair Renan e promete "vingança" se eleito.', 'Vai ter vingança. Não vai ter perdão pra quem prendeu o capitão.', 'Live no Instagram com o filho caçula de Bolsonaro.', 'verified', true, '2026-02-10', 'https://g1.globo.com/politica/noticia/2026/02/10/marcal-jair-renan-vinganca-live.ghtml', 'social_media_post', 5, 'Instagram', 'Live', 'marcal-jair-renan-vinganca-b163-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio lidera primeira pesquisa Datafolha do 2º turno.', 'Fico feliz, mas pesquisa não elege. O povo é que decide.', 'Declaração ao comentar pesquisa Datafolha.', 'verified', false, '2026-02-12', 'https://www1.folha.uol.com.br/poder/2026/02/tarcisio-lidera-datafolha-2-turno.shtml', 'news_article', 1, 'São Paulo', 'Pesquisa eleitoral', 'tarcisio-lidera-datafolha-b163-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano pede "oração" por candidato único da direita.', 'Oremos para que Deus nos dê um nome único. A direita não pode se dividir.', 'Culto em São Paulo.', 'verified', false, '2026-02-14', 'https://g1.globo.com/sp/sao-paulo/noticia/2026/02/14/feliciano-oracao-candidato-unico-direita.ghtml', 'speech', 2, 'São Paulo', 'Culto', 'feliciano-oracao-candidato-unico-b163-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle insinua que será "candidata a vice" de Tarcísio.', 'Se Deus quiser, estarei na chapa. Vice ou titular.', 'Entrevista em evento do PL Mulher em Brasília.', 'verified', true, '2026-02-18', 'https://www1.folha.uol.com.br/poder/2026/02/michelle-vice-tarcisio-pl-mulher.shtml', 'news_article', 3, 'Brasília', 'PL Mulher', 'michelle-vice-tarcisio-b163-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho ataca Alexandre de Moraes em discurso no Senado.', 'Moraes é a maior ameaça à democracia brasileira hoje.', 'Discurso no Senado pedindo impeachment.', 'verified', true, '2026-02-20', 'https://g1.globo.com/politica/noticia/2026/02/20/rogerio-marinho-moraes-impeachment.ghtml', 'speech', 5, 'Senado Federal', 'Discurso', 'rogerio-marinho-moraes-impeachment-b163-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado diz que vai "limpar o Brasil" como limpou Goiás.', 'Vou limpar o Brasil da bandidagem como limpei Goiás.', 'Evento em Brasília lançando pré-candidatura.', 'verified', true, '2026-02-22', 'https://www1.folha.uol.com.br/poder/2026/02/caiado-limpar-brasil-bandidagem.shtml', 'speech', 3, 'Brasília', 'Lançamento', 'caiado-limpar-brasil-b163-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Marçal de "marginal" e "picareta".', 'Esse Marçal é um marginal. Um picareta. Não representa nada.', 'Discurso em ato em São Paulo.', 'verified', true, '2026-02-25', 'https://g1.globo.com/politica/noticia/2026/02/25/lula-marcal-marginal-picareta.ghtml', 'speech', 2, 'São Paulo', 'Ato político', 'lula-marcal-marginal-picareta-b163-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal responde Lula chamando-o de "nove dedos do crime".', 'Nove dedos do crime. O ladrão está com medo do Brasil honesto.', 'Vídeo no TikTok em resposta a Lula.', 'verified', true, '2026-02-26', 'https://www1.folha.uol.com.br/poder/2026/02/marcal-nove-dedos-crime-lula.shtml', 'social_media_post', 4, 'TikTok', 'Vídeo', 'marcal-nove-dedos-crime-b163-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas participa de "live das urnas" com Eduardo.', 'Urnas sem auditoria pública. Vamos mudar isso em 2026.', 'Live conjunta com Eduardo Bolsonaro, via satélite dos EUA.', 'verified', true, '2026-03-01', 'https://g1.globo.com/politica/noticia/2026/03/01/nikolas-eduardo-live-urnas.ghtml', 'social_media_post', 4, 'Transmissão online', 'Live', 'nikolas-eduardo-live-urnas-b163-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior lança pré-candidatura pelo PSD.', 'Aceito o desafio. Sou pré-candidato à Presidência.', 'Convenção do PSD em Brasília.', 'verified', true, '2026-03-03', 'https://www1.folha.uol.com.br/poder/2026/03/ratinho-junior-pre-candidato-psd.shtml', 'news_article', 1, 'Brasília', 'Convenção PSD', 'ratinho-junior-pre-candidato-b163-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio convoca ato "pela liberdade" de Bolsonaro em 8 de março.', 'Dia 8 de março vamos às ruas pela liberdade do capitão.', 'Convocação nas redes sociais.', 'verified', true, '2026-03-05', 'https://g1.globo.com/politica/noticia/2026/03/05/flavio-ato-8-marco-bolsonaro-liberdade.ghtml', 'social_media_post', 3, 'Twitter', 'Convocação', 'flavio-ato-8-marco-b163-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que Bolsonaro é "mártir" da democracia.', 'Bolsonaro é mártir. Está preso por defender a liberdade.', 'Discurso em ato em Vitória.', 'verified', false, '2026-03-08', 'https://www1.folha.uol.com.br/poder/2026/03/magno-malta-bolsonaro-martir.shtml', 'speech', 3, 'Vitória', 'Ato bolsonarista', 'magno-malta-bolsonaro-martir-b163-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos confirma pré-candidatura ao governo de SP.', 'Vou disputar o governo de São Paulo. É hora da esquerda liderar.', 'Convenção do PSOL em São Paulo.', 'verified', false, '2026-03-10', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2026/noticia/2026/03/10/boulos-governo-sp-psol.ghtml', 'news_article', 1, 'São Paulo', 'Convenção PSOL', 'boulos-governo-sp-b163-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal chama Boulos de "invasor profissional" em ato.', 'Boulos é invasor profissional. Vive de invadir o que não é dele.', 'Comício em São Paulo.', 'verified', true, '2026-03-12', 'https://www1.folha.uol.com.br/poder/2026/03/marcal-boulos-invasor-profissional.shtml', 'speech', 3, 'São Paulo', 'Comício', 'marcal-boulos-invasor-b163-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio promete Bolsa Família "melhor" que o de Lula.', 'Vou fazer um Bolsa Família melhor. Com mais cidadania, menos dependência.', 'Entrevista em evento do PL em Recife.', 'verified', false, '2026-03-15', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/03/15/tarcisio-bolsa-familia-melhor.ghtml', 'speech', 1, 'Recife', 'Evento PL', 'tarcisio-bolsa-familia-melhor-b163-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad ataca Marçal chamando-o de "fenômeno de curta duração".', 'Marçal é fenômeno de curta duração. Como tantos outros.', 'Entrevista em São Paulo.', 'verified', false, '2026-03-16', 'https://www1.folha.uol.com.br/poder/2026/03/haddad-marcal-fenomeno-curta-duracao.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'haddad-marcal-fenomeno-b163-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede sanções da Magnitsky contra ministros do STF.', 'Os EUA têm que aplicar Magnitsky contra os ministros do STF.', 'Encontro com congressistas republicanos em Washington.', 'verified', true, '2026-03-18', 'https://g1.globo.com/politica/noticia/2026/03/18/eduardo-magnitsky-stf-washington.ghtml', 'news_article', 5, 'Washington, EUA', 'Encontro com republicanos', 'eduardo-magnitsky-stf-b163-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro admite crise no PDT e acusa "traidores" internos.', 'Tem traidores no PDT. Querem vender o partido para o Lula.', 'Entrevista após racha no PDT.', 'verified', false, '2026-03-20', 'https://www1.folha.uol.com.br/poder/2026/03/ciro-traidores-pdt-racha.shtml', 'news_article', 2, 'Fortaleza', 'Entrevista', 'ciro-traidores-pdt-b163-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende "pena de morte" em debate sobre segurança.', 'Defendo pena de morte para estuprador e chefe do tráfico.', 'Debate em Belo Horizonte sobre segurança.', 'verified', true, '2026-03-22', 'https://g1.globo.com/mg/minas-gerais/noticia/2026/03/22/zema-pena-de-morte-debate.ghtml', 'speech', 4, 'Belo Horizonte', 'Debate', 'zema-pena-morte-debate-b163-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas insinua que TSE "vai censurar" campanha da direita.', 'O TSE vai tentar censurar a gente em 2026. Já estão afiando a tesoura.', 'Vídeo em rede social antecipando a campanha.', 'verified', true, '2026-03-24', 'https://www1.folha.uol.com.br/poder/2026/03/nikolas-tse-censurar-campanha.shtml', 'social_media_post', 4, 'Instagram', 'Vídeo', 'nikolas-tse-censurar-campanha-b163-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro lança livro e diz que "Lava Jato voltará".', 'A Lava Jato voltará. O povo quer. Os juízes honestos querem.', 'Lançamento de livro em Curitiba.', 'verified', false, '2026-03-26', 'https://g1.globo.com/pr/parana/noticia/2026/03/26/moro-lanca-livro-lava-jato-voltara.ghtml', 'news_article', 2, 'Curitiba', 'Lançamento de livro', 'moro-livro-lava-jato-voltara-b163-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que será candidata a vice de Michelle.', 'Se Michelle for candidata, sou a vice. Estamos juntas.', 'Entrevista em Brasília.', 'verified', false, '2026-03-28', 'https://www1.folha.uol.com.br/poder/2026/03/damares-vice-michelle-bolsonaro.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'damares-vice-michelle-b163-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca Tarcísio em tuíte de madrugada.', 'Tarcísio traiu. Quer usar o Bolsonaro, depois jogar fora.', 'Postagem em rede social às 3h da manhã.', 'verified', true, '2026-03-30', 'https://g1.globo.com/politica/noticia/2026/03/30/carlos-bolsonaro-tarcisio-traiu-tuite.ghtml', 'social_media_post', 3, 'Twitter', 'Postagem', 'carlos-tarcisio-traiu-tuite-b163-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi diz que PT "não tolera" Marçal na eleição.', 'Marçal é um risco para a democracia. Não podemos tolerar.', 'Entrevista como líder do governo.', 'verified', false, '2026-04-01', 'https://www1.folha.uol.com.br/poder/2026/04/gleisi-pt-nao-tolera-marcal.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'gleisi-nao-tolera-marcal-b163-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes alerta em sessão que "eleição de 2026 não será refém de fake news".', 'A eleição de 2026 não será refém de desinformação. O TSE está preparado.', 'Sessão plenária do TSE sobre preparação para 2026.', 'verified', true, '2026-04-02', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/04/02/moraes-eleicao-2026-nao-refem-fake-news.ghtml', 'speech', 1, 'TSE', 'Sessão plenária', 'moraes-eleicao-2026-fake-news-b163-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal publica "sorteio de R$ 1 milhão" para seguidores.', 'Sorteio de 1 milhão para meus seguidores. Vamos mudar vidas.', 'Postagem em redes sociais questionada pelo TSE por compra de engajamento.', 'verified', true, '2026-04-03', 'https://www1.folha.uol.com.br/poder/2026/04/marcal-sorteio-1-milhao-seguidores-tse.shtml', 'social_media_post', 4, 'Instagram', 'Postagem', 'marcal-sorteio-milhao-b163-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio visita Bolsonaro em prisão domiciliar e diz "continuamos juntos".', 'Conversa boa. Continuamos juntos no mesmo projeto.', 'Declaração à imprensa após visita a Jair Bolsonaro.', 'verified', true, '2026-04-05', 'https://g1.globo.com/politica/noticia/2026/04/05/tarcisio-visita-bolsonaro-prisao-juntos.ghtml', 'news_article', 3, 'Brasília', 'Coletiva pós-visita', 'tarcisio-visita-bolsonaro-juntos-b163-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em prisão domiciliar, grava áudio pedindo voto em Tarcísio.', 'Eu peço voto em quem Deus escolher. Tarcísio é meu.', 'Áudio vazado de dentro da prisão domiciliar.', 'verified', true, '2026-04-06', 'https://www1.folha.uol.com.br/poder/2026/04/bolsonaro-audio-vazado-voto-tarcisio.shtml', 'audio', 4, 'Brasília, prisão domiciliar', 'Áudio vazado', 'bolsonaro-audio-voto-tarcisio-b163-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado desiste da Presidência e anuncia apoio a Tarcísio.', 'Pelo bem da direita, retiro minha pré-candidatura e apoio Tarcísio.', 'Coletiva em Goiânia anunciando desistência.', 'verified', true, '2026-04-08', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/04/08/caiado-desiste-apoia-tarcisio.ghtml', 'news_article', 2, 'Goiânia', 'Coletiva', 'caiado-desiste-apoia-tarcisio-b163-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema mantém pré-candidatura e diz que "Novo não se vende".', 'O Novo não se vende. Continuo candidato.', 'Entrevista após desistência de Caiado.', 'verified', false, '2026-04-09', 'https://www1.folha.uol.com.br/poder/2026/04/zema-novo-nao-se-vende-candidatura.shtml', 'news_article', 1, 'Belo Horizonte', 'Entrevista', 'zema-novo-nao-vende-b163-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal ataca Tarcísio: "engenheiro do sistema".', 'Tarcísio é engenheiro do sistema. Não muda nada.', 'Live com ataques a Tarcísio após união da direita.', 'verified', true, '2026-04-10', 'https://g1.globo.com/politica/noticia/2026/04/10/marcal-tarcisio-engenheiro-sistema.ghtml', 'social_media_post', 3, 'YouTube', 'Live', 'marcal-tarcisio-engenheiro-b163-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio pede "união" da direita contra "o inimigo Lula".', 'Vamos unir contra o inimigo principal: Lula. Depois resolvemos entre nós.', 'Entrevista em Brasília.', 'verified', false, '2026-04-11', 'https://www1.folha.uol.com.br/poder/2026/04/flavio-uniao-direita-inimigo-lula.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'flavio-uniao-inimigo-lula-b163-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende reeleição de Lula em entrevista.', 'Lula é o único capaz de continuar o projeto. Vai ganhar.', 'Entrevista ao comentar cenário eleitoral.', 'verified', false, '2026-04-12', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/04/12/padilha-reeleicao-lula-defesa.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'padilha-reeleicao-lula-b163-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica montagem ofensiva com rosto de Janja.', 'Nossa primeira-dama é um vexame. Olha essa foto.', 'Postagem em rede social com imagem editada.', 'verified', true, '2026-04-13', 'https://www1.folha.uol.com.br/poder/2026/04/nikolas-montagem-janja-ofensiva.shtml', 'social_media_post', 3, 'Twitter', 'Postagem', 'nikolas-montagem-janja-b163-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hamilton Mourão critica "radicalização" e mira candidatura própria.', 'A direita está radicalizada demais. Tem espaço para alguém equilibrado.', 'Discurso no Senado.', 'verified', false, '2026-04-13', 'https://g1.globo.com/politica/noticia/2026/04/13/mourao-radicalizacao-candidatura-propria.ghtml', 'speech', 1, 'Senado Federal', 'Discurso', 'mourao-radicalizacao-candidatura-b163-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem pede "impeachment coletivo" do STF.', 'Impeachment coletivo no STF. Já passou da hora.', 'Discurso em plenário da Câmara.', 'verified', true, '2026-04-14', 'https://www1.folha.uol.com.br/poder/2026/04/van-hattem-impeachment-coletivo-stf.shtml', 'speech', 5, 'Câmara dos Deputados', 'Discurso', 'van-hattem-impeachment-coletivo-stf-b163-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura defende rever "papel" do STF via PEC.', 'Precisamos de uma PEC para delimitar o papel do STF.', 'Entrevista na Câmara.', 'verified', false, '2026-04-14', 'https://g1.globo.com/politica/noticia/2026/04/14/adriana-ventura-pec-stf-papel.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'adriana-ventura-pec-stf-b163-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri ataca Marçal e defende "terceira via".', 'Marçal é populismo puro. O Brasil precisa de uma terceira via.', 'Entrevista em São Paulo.', 'verified', false, '2026-04-15', 'https://www1.folha.uol.com.br/poder/2026/04/kim-ataca-marcal-terceira-via.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'kim-ataca-marcal-terceira-via-b163-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal compara ministros do STF a "bandidos de toga".', 'Os ministros do STF são bandidos de toga. É preciso prendê-los.', 'Live bombástica com milhares de espectadores.', 'verified', true, '2026-04-15', 'https://g1.globo.com/politica/noticia/2026/04/15/marcal-ministros-stf-bandidos-toga.ghtml', 'social_media_post', 5, 'YouTube', 'Live', 'marcal-ministros-stf-bandidos-b163-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin nega bloqueio de canais e rebate Marçal em sessão.', 'Não bloqueamos canais. Aplicamos a lei. Quem descumpre arca.', 'Declaração em sessão do STF.', 'verified', false, '2026-04-15', 'https://www1.folha.uol.com.br/poder/2026/04/zanin-rebate-marcal-bloqueio-canais.shtml', 'speech', 1, 'STF', 'Sessão plenária', 'zanin-rebate-marcal-canais-b163-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin, presidente do TSE, alerta sobre "ameaças" à eleição.', 'Não vamos tolerar ameaças ao processo eleitoral. A Justiça Eleitoral está em guarda.', 'Discurso no TSE sobre preparação para 2026.', 'verified', true, '2026-04-16', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/04/16/fachin-tse-ameacas-eleicao.ghtml', 'speech', 1, 'TSE', 'Sessão plenária', 'fachin-tse-ameacas-eleicao-b163-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama Fachin de "censor-mor" em rede social.', 'Fachin é o censor-mor. Nosso inimigo na eleição.', 'Postagem após discurso de Fachin.', 'verified', true, '2026-04-16', 'https://www1.folha.uol.com.br/poder/2026/04/nikolas-fachin-censor-mor.shtml', 'social_media_post', 4, 'Twitter', 'Postagem', 'nikolas-fachin-censor-mor-b163-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro afirma que votará em Lula "apertando o nariz" no 2º turno.', 'No segundo turno, aperto o nariz e voto no Lula contra a extrema direita.', 'Entrevista à Globonews.', 'verified', true, '2026-04-16', 'https://g1.globo.com/politica/eleicoes/2026/noticia/2026/04/16/ciro-votara-lula-nariz-2-turno.ghtml', 'news_article', 1, 'Fortaleza', 'Entrevista Globonews', 'ciro-votara-lula-nariz-b163-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio critica decisão do STF sobre anistia.', 'O STF decide tudo. O Congresso vira paisagem. Vamos mudar isso.', 'Entrevista após STF arquivar projeto.', 'verified', true, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/tarcisio-stf-decide-tudo-congresso-paisagem.shtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'tarcisio-stf-decide-tudo-b163-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal ameaça "mobilizar o povo" contra o STF.', 'Se o STF continuar assim, vou mobilizar o povo. A rua é nossa.', 'Comício em Curitiba.', 'verified', true, '2026-04-17', 'https://g1.globo.com/politica/noticia/2026/04/17/marcal-mobilizar-povo-stf.ghtml', 'speech', 5, 'Curitiba', 'Comício', 'marcal-mobilizar-povo-stf-b163-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco defende "moderação" e se afasta da disputa presidencial.', 'Não serei candidato. Defendo moderação em tempos de radicalização.', 'Declaração em evento em Belo Horizonte.', 'verified', false, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/pacheco-moderacao-nao-candidato.shtml', 'news_article', 1, 'Belo Horizonte', 'Evento', 'pacheco-moderacao-nao-candidato-b163-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues confirma apoio a Lula e disputa reeleição.', 'Apoio Lula e vou disputar reeleição na Bahia. Estamos juntos.', 'Entrevista em Salvador.', 'verified', false, '2026-04-17', 'https://g1.globo.com/ba/bahia/eleicoes/2026/noticia/2026/04/17/jeronimo-apoia-lula-reeleicao.ghtml', 'news_article', 1, 'Salvador', 'Entrevista', 'jeronimo-apoia-lula-reeleicao-b163-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica anistia e diz que "impunidade gera mais golpes".', 'Anistia agora seria prêmio para golpista. Impunidade gera mais golpes.', 'Discurso no Senado contra PL de anistia.', 'verified', true, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/moro-anistia-impunidade-gera-golpes.shtml', 'speech', 2, 'Senado Federal', 'Discurso', 'moro-anistia-impunidade-b163-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que "Trump vai ajudar" a direita em 2026.', 'Trump já disse: vai ajudar a direita brasileira. Está conosco.', 'Entrevista em canal dos EUA.', 'verified', true, '2026-04-17', 'https://g1.globo.com/politica/noticia/2026/04/17/eduardo-trump-vai-ajudar-direita-2026.ghtml', 'news_article', 4, 'Flórida, EUA', 'Entrevista', 'eduardo-trump-ajudar-direita-b163-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro diz em culto que "Deus ungirá presidente cristão".', 'Deus vai ungir um presidente cristão em 2026. Amém?', 'Culto em igreja evangélica no DF.', 'verified', false, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/michelle-deus-ungira-presidente-cristao.shtml', 'speech', 2, 'Brasília', 'Culto', 'michelle-deus-ungira-presidente-b163-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem, em fuga, envia mensagem a bolsonaristas sobre 2026.', 'Não desistam. 2026 é nosso. Estou com vocês de onde estiver.', 'Mensagem atribuída ao ex-deputado foragido.', 'verified', true, '2026-04-17', 'https://g1.globo.com/politica/noticia/2026/04/17/ramagem-fuga-mensagem-bolsonaristas-2026.ghtml', 'social_media_post', 5, 'Local incerto', 'Mensagem atribuída', 'ramagem-mensagem-bolsonaristas-b163-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "vai derrotar o fascismo" em 2026.', 'Vamos derrotar o fascismo de novo. O Brasil não quer golpe.', 'Ato em Brasília marcando aniversário de 3 anos do governo.', 'verified', true, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/lula-derrotar-fascismo-2026.shtml', 'speech', 1, 'Brasília', 'Ato de 3 anos', 'lula-derrotar-fascismo-2026-b163-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marçal encerra abril prometendo "virar o jogo" e "acabar com o sistema".', 'Vou virar o jogo. Vou acabar com esse sistema podre. 2026 é revolução.', 'Live encerrando série "100 dias de pré-campanha".', 'verified', true, '2026-04-17', 'https://g1.globo.com/politica/noticia/2026/04/17/marcal-virar-jogo-acabar-sistema-100-dias.ghtml', 'social_media_post', 5, 'YouTube', 'Live', 'marcal-virar-jogo-sistema-b163-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

END $$;
