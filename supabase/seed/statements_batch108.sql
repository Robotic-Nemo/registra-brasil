-- Batch 108: Política indígena, Yanomami e Marco Temporal 2023-2026
DO $$
DECLARE
  v_son UUID; v_mar UUID; v_lul UUID; v_pad UUID; v_nis UUID;
  v_rui UUID; v_muc UUID; v_lew UUID; v_fav UUID; v_ter UUID;
  v_bol UUID; v_ebol UUID; v_nik UUID; v_fel UUID; v_dam UUID;
  v_sal UUID; v_van UUID; v_tab UUID; v_eri UUID; v_sam UUID;
  v_tal UUID; v_cal UUID; v_fegh UUID; v_orl UUID; v_lir UUID;
  v_mot UUID; v_amor UUID; v_gil UUID; v_carm UUID; v_fac UUID;
  v_zan UUID; v_din UUID; v_cas UUID; v_den UUID; v_wil UUID;
  v_hel UUID; v_mau UUID; v_cai UUID; v_eri2 UUID; v_cle UUID;
  v_gla UUID; v_tar UUID; v_zem UUID; v_jan UUID; v_mrc UUID;
  v_hatt UUID; v_rat UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_rel UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_ebol FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_fegh FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_amor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_carm FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_den FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_eri2 FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_gla FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_mrc FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_hatt FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rel FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro defende Marco Temporal como "civilização" contra povos indígenas.', 'Indígena demais já é o que o Brasil tem.', 'Entrevista em Brasília.', 'verified', true, '2023-08-30', 'https://www.poder360.com.br/politica/bolsonaro-indigenas-marco/', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-marco-temporal-b108-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium nega crise humanitária Yanomami e ataca governo federal.', 'Yanomami é narrativa do PT, não é crise real.', 'Entrevista em Boa Vista.', 'verified', true, '2023-02-10', 'https://g1.globo.com/rr/roraima/noticia/2023/02/10/denarium-yanomami-narrativa.ghtml', 'news_article', 5, 'Boa Vista', 'Entrevista', 'denarium-yanomami-narrativa-b108-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles defende garimpo em terras indígenas como "atividade legítima".', 'Garimpo é trabalho, não é crime.', 'Entrevista à imprensa.', 'verified', true, '2023-05-20', 'https://www.folha.uol.com.br/ambiente/2023/05/salles-garimpo-indigena.shtml', 'news_article', 5, 'Brasília', 'Entrevista', 'salles-garimpo-indigena-b108-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves minimiza denúncias de violência sexual contra indígenas Yanomami.', 'Essas denúncias são exageradas, estão politizando.', 'Entrevista no Senado.', 'verified', true, '2023-03-22', 'https://www.cnnbrasil.com.br/politica/damares-yanomami-denuncias/', 'news_article', 5, 'Brasília', 'Senado', 'damares-yanomami-denuncias-b108-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano ataca Sonia Guajajara em plenário com tom xenofóbico.', 'Essa ministra representa uma minoria, não o Brasil.', 'Câmara dos Deputados.', 'verified', true, '2023-04-25', 'https://www.camara.leg.br/noticias/feliciano-guajajara', 'news_article', 4, 'Brasília', 'Plenário', 'feliciano-guajajara-b108-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira articula aprovação do Marco Temporal na Câmara apesar de decisão do STF.', 'O Congresso é soberano para legislar sobre isso.', 'Entrevista como presidente da Câmara.', 'verified', true, '2023-09-27', 'https://www.folha.uol.com.br/poder/2023/09/lira-marco-temporal-stf.shtml', 'news_article', 5, 'Brasília', 'Presidência Câmara', 'lira-marco-temporal-b108-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende Marco Temporal e ataca indígenas em discurso.', 'Índio não pode parar o progresso do Brasil.', 'Plenário da Câmara.', 'verified', true, '2023-09-14', 'https://www.camara.leg.br/noticias/nikolas-marco-temporal', 'news_article', 5, 'Brasília', 'Plenário', 'nikolas-marco-temporal-b108-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro defende garimpo Yanomami como alternativa de renda.', 'Se não for garimpo, como esses índios vão sobreviver?', 'Entrevista em Brasília.', 'verified', true, '2023-02-05', 'https://www.poder360.com.br/politica/eduardo-bolsonaro-garimpo/', 'news_article', 5, 'Brasília', 'Entrevista', 'eduardo-bolsonaro-garimpo-b108-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium se recusa a apoiar operação contra garimpo ilegal em Roraima.', 'O Estado não tem dinheiro para isso, que o governo federal faça.', 'Coletiva em Boa Vista.', 'verified', true, '2023-02-25', 'https://www.folhabv.com.br/politica/denarium-garimpo-operacao', 'news_article', 4, 'Boa Vista', 'Coletiva', 'denarium-garimpo-operacao-b108-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro zomba de ministra Sonia Guajajara em evento.', 'Essa ministra de cocar não representa ninguém.', 'Evento PL.', 'verified', true, '2023-06-10', 'https://www.folha.uol.com.br/poder/2023/06/bolsonaro-guajajara.shtml', 'news_article', 5, 'São Paulo', 'Evento PL', 'bolsonaro-guajajara-b108-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende Marco Temporal como "proteção ao produtor rural".', 'O produtor também precisa ter seus direitos respeitados.', 'Discurso no Senado.', 'verified', true, '2023-09-28', 'https://www.senado.leg.br/noticias/tereza-cristina-marco-temporal', 'news_article', 3, 'Brasília', 'Plenário Senado', 'tereza-marco-temporal-b108-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes ataca demarcações em MT e defende produtores em terras indígenas.', 'Não vai ter uma demarcação a mais em Mato Grosso.', 'Discurso em Cuiabá.', 'verified', true, '2024-01-30', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/01/30/mauro-mendes-demarcacao.ghtml', 'news_article', 4, 'Cuiabá', 'Discurso', 'mauro-mendes-demarcacao-b108-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende redução de terras indígenas em Goiás.', 'Índio tem terra demais, produtor tem terra de menos.', 'Entrevista em Goiânia.', 'verified', true, '2023-11-15', 'https://www.opopular.com.br/politica/caiado-indigenas-goias.html', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-indigenas-goias-b108-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri2, 'Riedel apoia fazendeiros em conflito com Guarani-Kaiowá em MS.', 'Não vou permitir invasão de propriedade privada em MS.', 'Coletiva em Campo Grande.', 'verified', true, '2023-08-08', 'https://www.campograndenews.com.br/politica/riedel-guarani', 'news_article', 4, 'Campo Grande', 'Coletiva', 'riedel-guarani-ms-b108-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima minimiza denúncias de garimpo em terras Yanomami no AM.', 'O garimpo aqui não é do tipo que se fala em Roraima.', 'Entrevista em Manaus.', 'verified', false, '2023-03-15', 'https://g1.globo.com/am/amazonas/noticia/2023/03/15/wilson-lima-garimpo.ghtml', 'news_article', 4, 'Manaus', 'Entrevista', 'wilson-lima-garimpo-b108-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem ataca políticas indigenistas na Câmara.', 'Ministério dos Povos Indígenas é uma aberração.', 'Plenário da Câmara.', 'verified', false, '2023-07-18', 'https://www.camara.leg.br/noticias/hattem-indigena', 'news_article', 3, 'Brasília', 'Plenário', 'hattem-ministerio-indigena-b108-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro declara que "reservas indígenas são problema para o agro" em ato.', 'O agro alimenta o Brasil, não pode ficar parado por causa de demarcação.', 'Ato em Cuiabá.', 'verified', true, '2024-05-15', 'https://www.folha.uol.com.br/poder/2024/05/bolsonaro-agro-indigena.shtml', 'news_article', 5, 'Cuiabá', 'Ato', 'bolsonaro-agro-indigena-b108-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles divulga vídeo considerado racista contra indígenas.', 'Esses povos precisam evoluir, não ficar parados no tempo.', 'Evento político.', 'verified', true, '2023-11-20', 'https://www.cartacapital.com.br/politica/salles-indigenas-video', 'news_article', 5, 'São Paulo', 'Evento', 'salles-indigenas-racismo-b108-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira zomba de protesto indígena em Brasília.', 'Tão pintados pra tirar foto, depois voltam pra cidade.', 'Redes sociais.', 'verified', true, '2023-04-28', 'https://www.otempo.com.br/politica/nikolas-indigenas-protesto', 'news_article', 5, 'Brasília', 'Redes sociais', 'nikolas-indigenas-protesto-b108-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves minimiza desnutrição Yanomami e culpa gestão Lula.', 'A desnutrição é culpa do governo atual, não do anterior.', 'Senado.', 'verified', true, '2023-02-15', 'https://www.cnnbrasil.com.br/politica/damares-yanomami-lula/', 'news_article', 5, 'Brasília', 'Senado', 'damares-yanomami-lula-b108-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro defende ruralistas em conflito com Pataxó na Bahia/RJ.', 'A produção rural não pode ser criminalizada.', 'Entrevista.', 'verified', false, '2023-10-05', 'https://www.atarde.com.br/politica/castro-pataxo', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'castro-pataxo-b108-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema minimiza impactos ambientais de mineração em terras indígenas em MG.', 'Mineração é o que sustenta MG, não dá para parar.', 'Evento empresarial.', 'verified', false, '2024-03-20', 'https://www.otempo.com.br/politica/zema-mineracao-indigena', 'news_article', 3, 'Belo Horizonte', 'Evento', 'zema-mineracao-indigena-b108-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira articula derrubada do veto presidencial ao Marco Temporal.', 'Congresso vai derrubar o veto e acabou.', 'Entrevista na Câmara.', 'verified', true, '2023-12-14', 'https://www.folha.uol.com.br/poder/2023/12/lira-veto-marco-temporal.shtml', 'news_article', 5, 'Brasília', 'Câmara', 'lira-veto-marco-temporal-b108-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano faz comentário considerado de intolerância religiosa sobre pajés.', 'Pajé não é religião, é coisa do diabo.', 'Culto em SP.', 'verified', true, '2023-05-10', 'https://www.folha.uol.com.br/cotidiano/2023/05/feliciano-pajes.shtml', 'news_article', 5, 'São Paulo', 'Culto', 'feliciano-pajes-b108-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro ataca demarcação em terras tradicionais no MS.', 'Fazendeiros de MS estão sendo expulsos de suas propriedades.', 'Discurso na Câmara.', 'verified', true, '2023-06-22', 'https://www.camara.leg.br/noticias/eduardo-bolsonaro-ms', 'news_article', 4, 'Brasília', 'Plenário', 'eduardo-bolsonaro-ms-b108-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro nega emergência Yanomami e afirma que "é tudo exagero".', 'Yanomami é só uma narrativa para atacar meu governo.', 'Live semanal.', 'verified', true, '2023-01-28', 'https://www.poder360.com.br/governo/bolsonaro-yanomami-narrativa/', 'news_article', 5, 'Miami', 'Live', 'bolsonaro-yanomami-narrativa-b108-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles acusa Marina Silva de "destruir" o agronegócio com proteção indígena.', 'Marina Silva é inimiga da produção brasileira.', 'Entrevista.', 'verified', true, '2024-02-12', 'https://www.estadao.com.br/politica/salles-marina-agro/', 'news_article', 3, 'São Paulo', 'Entrevista', 'salles-marina-agro-b108-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares tenta barrar CPI Yanomami no Senado.', 'CPI vai atrapalhar o trabalho do governo.', 'Coletiva no Senado.', 'verified', false, '2023-04-18', 'https://www.senado.leg.br/noticias/damares-cpi-yanomami', 'news_article', 3, 'Brasília', 'Senado', 'damares-cpi-yanomami-b108-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes pressiona Funai para suspender demarcação em MT.', 'Funai tem que respeitar quem produz riqueza.', 'Entrevista em Cuiabá.', 'verified', true, '2023-10-25', 'https://g1.globo.com/mt/mato-grosso/noticia/2023/10/25/mauro-mendes-funai.ghtml', 'news_article', 4, 'Cuiabá', 'Entrevista', 'mauro-mendes-funai-b108-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina vota pela derrubada do veto ao Marco Temporal no Senado.', 'Precisamos de paz no campo.', 'Plenário do Senado.', 'verified', true, '2023-12-14', 'https://www.senado.leg.br/noticias/tereza-veto-marco', 'news_article', 3, 'Brasília', 'Plenário Senado', 'tereza-veto-marco-b108-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ridiculariza ministra Guajajara em post nas redes.', 'Ministra de cocar dando aula de civilidade, que brincadeira.', 'Twitter.', 'verified', true, '2023-06-05', 'https://www.cartacapital.com.br/politica/nikolas-guajajara-cocar', 'news_article', 5, 'Belo Horizonte', 'Redes sociais', 'nikolas-guajajara-cocar-b108-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mrc, 'Pablo Marçal ataca política indigenista em discurso de campanha.', 'Esse governo quer dar o Brasil para os índios, não vou permitir.', 'Comício SP.', 'verified', true, '2024-08-30', 'https://www.folha.uol.com.br/eleicoes/2024/08/marcal-indigenas.shtml', 'news_article', 4, 'São Paulo', 'Comício', 'marcal-indigenas-b108-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio sinaliza apoio ao Marco Temporal e crítica a demarcações em SP.', 'Demarcação não pode atrapalhar produção.', 'Entrevista em SP.', 'verified', false, '2024-04-10', 'https://www.estadao.com.br/politica/tarcisio-marco-temporal/', 'news_article', 3, 'São Paulo', 'Entrevista', 'tarcisio-marco-temporal-b108-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado acusa indígenas de "venderem" terras para garimpeiros.', 'Muitos índios vendem suas terras, é um fato.', 'Entrevista em Goiânia.', 'verified', true, '2024-02-08', 'https://www.opopular.com.br/politica/caiado-indigenas-terras.html', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-indigenas-terras-b108-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem ataca Funai e pede corte de orçamento.', 'Funai é um cabide de emprego para esquerdistas.', 'Discurso na Câmara.', 'verified', false, '2023-08-22', 'https://www.camara.leg.br/noticias/hattem-funai', 'news_article', 3, 'Brasília', 'Plenário', 'hattem-funai-corte-b108-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium é acusado de ter ligações com garimpeiros em Roraima.', 'Garimpeiros são trabalhadores honestos.', 'Coletiva em Boa Vista.', 'verified', true, '2024-06-08', 'https://g1.globo.com/rr/roraima/noticia/2024/06/08/denarium-garimpeiros.ghtml', 'news_article', 5, 'Boa Vista', 'Coletiva', 'denarium-garimpeiros-b108-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima critica ICMBio e fiscalização ambiental no AM.', 'ICMBio atrapalha o desenvolvimento do estado.', 'Entrevista em Manaus.', 'verified', false, '2023-09-18', 'https://g1.globo.com/am/amazonas/noticia/2023/09/18/wilson-lima-icmbio.ghtml', 'news_article', 3, 'Manaus', 'Entrevista', 'wilson-lima-icmbio-b108-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho minimiza conflitos com indígenas em áreas de obras no PA.', 'Todas as obras respeitam as comunidades.', 'Entrevista.', 'verified', false, '2024-07-20', 'https://www.oliberal.com/belem/helder-obras-indigenas', 'news_article', 2, 'Belém', 'Entrevista', 'helder-obras-indigenas-b108-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gla, 'Gladson Cameli defende madeireiros em conflito com indígenas no Acre.', 'Produção madeireira legal é essencial para o Acre.', 'Entrevista em Rio Branco.', 'verified', false, '2023-11-08', 'https://www.acrenews.com.br/gladson-madeireiros', 'news_article', 3, 'Rio Branco', 'Entrevista', 'gladson-madeireiros-b108-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís minimiza impactos de porto em região indígena no AP.', 'Desenvolvimento é para todos, inclusive indígenas.', 'Coletiva em Macapá.', 'verified', false, '2024-03-08', 'https://www.portal.ap.gov.br/clecio-porto-indigena', 'news_article', 2, 'Macapá', 'Coletiva', 'clecio-porto-indigena-b108-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro defende armamento de garimpeiros em áreas "de fronteira".', 'Garimpeiro tem direito de se defender.', 'Live semanal.', 'verified', true, '2023-03-02', 'https://www.poder360.com.br/governo/bolsonaro-garimpeiros-armas/', 'news_article', 5, 'Miami', 'Live', 'bolsonaro-garimpeiros-armas-b108-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles acusa Sonia Guajajara de "politizar" emergência Yanomami.', 'A ministra quer palco, não soluções.', 'Entrevista.', 'verified', true, '2023-02-28', 'https://www.estadao.com.br/politica/salles-guajajara/', 'news_article', 4, 'São Paulo', 'Entrevista', 'salles-guajajara-yanomami-b108-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano publica vídeo considerado de intolerância religiosa contra xamãs.', 'Xamanismo é coisa demoníaca, não podemos tolerar.', 'YouTube.', 'verified', true, '2023-07-15', 'https://www.folha.uol.com.br/poder/2023/07/feliciano-xamas.shtml', 'news_article', 5, 'São Paulo', 'YouTube', 'feliciano-xamas-b108-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares vota pela derrubada do veto ao Marco Temporal.', 'Precisamos defender os produtores.', 'Plenário do Senado.', 'verified', true, '2023-12-14', 'https://www.senado.leg.br/noticias/damares-marco-temporal', 'news_article', 4, 'Brasília', 'Plenário Senado', 'damares-marco-temporal-b108-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro publica ataque racista contra representante Yanomami.', 'Esses caciques vivem em Brasília, não na floresta.', 'Redes sociais.', 'verified', true, '2023-03-10', 'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-cacique', 'news_article', 5, 'Brasília', 'Redes sociais', 'eduardo-bolsonaro-cacique-b108-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira aprova PL 490 (Marco Temporal) a despeito de protestos indígenas.', 'Congresso não se curva a pressão de ONG.', 'Plenário Câmara.', 'verified', true, '2023-05-30', 'https://www.camara.leg.br/noticias/lira-pl490', 'news_article', 5, 'Brasília', 'Plenário', 'lira-pl490-b108-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta sinaliza apoio à bancada ruralista contra demarcações.', 'Precisamos conciliar, mas o agro é prioridade.', 'Entrevista como novo presidente da Câmara.', 'verified', true, '2025-02-05', 'https://www.folha.uol.com.br/poder/2025/02/motta-ruralistas.shtml', 'news_article', 3, 'Brasília', 'Câmara', 'motta-ruralistas-b108-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz piada contra ritual indígena em plenário da Câmara.', 'Cadê o pajé pra abençoar essa sessão?', 'Câmara.', 'verified', true, '2023-10-12', 'https://www.camara.leg.br/noticias/nikolas-paje', 'news_article', 4, 'Brasília', 'Plenário', 'nikolas-paje-b108-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes faz aliança com ruralistas para barrar demarcação Xingu.', 'Não vai ter demarcação em MT sem negociação com o agro.', 'Evento rural.', 'verified', true, '2023-07-04', 'https://g1.globo.com/mt/mato-grosso/noticia/2023/07/04/mauro-mendes-xingu.ghtml', 'news_article', 4, 'Cuiabá', 'Evento', 'mauro-mendes-xingu-b108-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado usa dinheiro público para ação judicial contra demarcação.', 'O estado vai pra Justiça contra essa demarcação absurda.', 'Coletiva em Goiânia.', 'verified', false, '2023-12-02', 'https://www.opopular.com.br/politica/caiado-justica-demarcacao.html', 'news_article', 3, 'Goiânia', 'Coletiva', 'caiado-justica-demarcacao-b108-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri2, 'Riedel defende invasores em conflito com Guarani-Kaiowá em MS.', 'São produtores, não invasores.', 'Entrevista.', 'verified', true, '2024-02-18', 'https://www.campograndenews.com.br/politica/riedel-guarani-kaiowa', 'news_article', 4, 'Campo Grande', 'Entrevista', 'riedel-guarani-kaiowa-b108-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro retira fala de emergência humanitária Yanomami durante gestão.', 'Yanomami sempre viveu assim, não é emergência.', 'Entrevista em 2022.', 'verified', false, '2023-01-25', 'https://www.folha.uol.com.br/poder/2023/01/bolsonaro-yanomami-passado.shtml', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-yanomami-passado-b108-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles defende Marco Temporal em audiência pública na Câmara.', 'Produtor de boa-fé precisa de segurança.', 'Audiência Câmara.', 'verified', false, '2023-06-15', 'https://www.camara.leg.br/noticias/salles-marco-temporal', 'news_article', 3, 'Brasília', 'Audiência pública', 'salles-marco-temporal-audiencia-b108-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende que povos indígenas devem "produzir como brasileiros".', 'Tem que parar de viver só da caça.', 'Evento agro.', 'verified', true, '2023-09-05', 'https://www.estadao.com.br/politica/tereza-indigenas-producao/', 'news_article', 4, 'Campo Grande', 'Evento', 'tereza-indigenas-producao-b108-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares questiona legalidade da Terra Indígena Yanomami em audiência.', 'Essa reserva foi demarcada de forma irregular.', 'Senado.', 'verified', true, '2023-05-18', 'https://www.cnnbrasil.com.br/politica/damares-yanomami-legalidade/', 'news_article', 5, 'Brasília', 'Senado', 'damares-yanomami-legalidade-b108-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano ataca "ideologia indigenista" em sermão político.', 'Ideologia indigenista é marxismo disfarçado.', 'Culto em Brasília.', 'verified', false, '2023-10-22', 'https://www.metropoles.com/distrito-federal/feliciano-indigenista', 'news_article', 4, 'Brasília', 'Culto', 'feliciano-indigenista-b108-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium articula contra operação do Ibama em Roraima.', 'Ibama atrapalha trabalhador.', 'Coletiva.', 'verified', true, '2023-04-12', 'https://www.folhabv.com.br/politica/denarium-ibama', 'news_article', 4, 'Boa Vista', 'Coletiva', 'denarium-ibama-b108-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima é criticado por demora em apoio aos Yanomami no AM.', 'Isso é responsabilidade federal, não estadual.', 'Entrevista.', 'verified', false, '2023-02-20', 'https://g1.globo.com/am/amazonas/noticia/2023/02/20/wilson-lima-yanomami-federal.ghtml', 'news_article', 3, 'Manaus', 'Entrevista', 'wilson-lima-yanomami-federal-b108-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem ataca Lula por visita a terras Yanomami.', 'Lula vai lá só para fazer marketing, não ajuda.', 'Discurso na Câmara.', 'verified', false, '2023-01-30', 'https://www.camara.leg.br/noticias/hattem-lula-yanomami', 'news_article', 3, 'Brasília', 'Plenário', 'hattem-lula-yanomami-b108-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro retoma fala que "índio não serve para nada" em 2024.', 'Índio quer terra porque é vagabundo, não quer trabalhar.', 'Evento PL.', 'verified', true, '2024-11-05', 'https://www.folha.uol.com.br/poder/2024/11/bolsonaro-indio-vagabundo.shtml', 'news_article', 5, 'Rio de Janeiro', 'Evento PL', 'bolsonaro-indio-vagabundo-b108-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles acusa STF de usurpar competência ao derrubar Marco Temporal.', 'STF virou legislador, isso é golpe.', 'Entrevista.', 'verified', true, '2023-09-22', 'https://www.estadao.com.br/politica/salles-stf-marco/', 'news_article', 4, 'São Paulo', 'Entrevista', 'salles-stf-marco-b108-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca Ministra Guajajara em discurso no Senado.', 'Essa ministra não tem capacidade para o cargo.', 'Plenário do Senado.', 'verified', false, '2023-06-28', 'https://www.senado.leg.br/noticias/damares-guajajara', 'news_article', 3, 'Brasília', 'Plenário Senado', 'damares-guajajara-b108-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro critica Lewandowski por atuação no Marco Temporal.', 'Lewandowski é militante, não juiz.', 'Câmara.', 'verified', false, '2023-09-20', 'https://www.camara.leg.br/noticias/eduardo-bolsonaro-lewandowski', 'news_article', 3, 'Brasília', 'Plenário', 'eduardo-bolsonaro-lewandowski-b108-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema assina lei estadual em MG que restringe criação de novas terras indígenas.', 'MG vai proteger seus produtores.', 'Cerimônia de sanção.', 'verified', true, '2024-07-12', 'https://www.otempo.com.br/politica/zema-lei-indigena-mg', 'news_article', 4, 'Belo Horizonte', 'Sanção', 'zema-lei-indigena-mg-b108-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior minimiza conflito entre Kaingang e produtores no Paraná.', 'São conflitos pontuais, não tem nada de estrutural.', 'Entrevista em Curitiba.', 'verified', false, '2023-08-10', 'https://www.gazetadopovo.com.br/politica/ratinho-kaingang/', 'news_article', 3, 'Curitiba', 'Entrevista', 'ratinho-kaingang-b108-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira acelera votação da Lei do Licenciamento contra proteções indígenas.', 'O licenciamento trava o país.', 'Plenário Câmara.', 'verified', true, '2024-05-28', 'https://www.jota.info/legislativo/lira-licenciamento-indigena', 'news_article', 4, 'Brasília', 'Plenário', 'lira-licenciamento-indigena-b108-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas promove desinformação sobre gastos do Ministério dos Povos Indígenas.', 'Ministério gasta milhões em cocar e pintura.', 'Redes sociais.', 'verified', true, '2024-01-15', 'https://www.aosfatos.org/noticias/nikolas-ministerio-indigena-gastos/', 'fact_check', 4, 'Brasília', 'Redes sociais', 'nikolas-ministerio-gastos-b108-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles defende abertura de garimpo em terras Munduruku no PA.', 'Munduruku quer o garimpo, é essa a verdade.', 'Entrevista.', 'verified', true, '2023-07-28', 'https://www.folha.uol.com.br/ambiente/2023/07/salles-munduruku.shtml', 'news_article', 5, 'São Paulo', 'Entrevista', 'salles-munduruku-b108-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano diz que missionários "salvam" povos indígenas de "trevas".', 'Missionário leva luz, indigenista leva trevas.', 'Culto em Brasília.', 'verified', true, '2024-04-20', 'https://www.cartacapital.com.br/politica/feliciano-missionarios', 'news_article', 5, 'Brasília', 'Culto', 'feliciano-missionarios-b108-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mrc, 'Marçal divulga desinformação sobre orçamento indígena em campanha.', 'Dão mais para indígena do que para escola pública.', 'Vídeo de campanha.', 'verified', true, '2024-09-18', 'https://www.aosfatos.org/noticias/marcal-orcamento-indigena/', 'fact_check', 4, 'São Paulo', 'Campanha', 'marcal-orcamento-indigena-b108-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro nega responsabilidade pelo abandono Yanomami durante seu governo.', 'Eu fiz muito pelos índios, quem não fez foi o Lula.', 'Entrevista em Orlando.', 'verified', true, '2023-03-01', 'https://www.cnnbrasil.com.br/politica/bolsonaro-yanomami-orlando/', 'news_article', 5, 'Orlando', 'Entrevista', 'bolsonaro-yanomami-orlando-b108-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium celebra aprovação do Marco Temporal.', 'Finalmente Roraima tem paz no campo.', 'Entrevista.', 'verified', false, '2023-09-28', 'https://g1.globo.com/rr/roraima/noticia/2023/09/28/denarium-marco-temporal.ghtml', 'news_article', 3, 'Boa Vista', 'Entrevista', 'denarium-marco-celebra-b108-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes ataca decisão do STF sobre Marco Temporal.', 'STF não pode legislar.', 'Entrevista em Cuiabá.', 'verified', true, '2023-09-22', 'https://g1.globo.com/mt/mato-grosso/noticia/2023/09/22/mauro-mendes-stf-marco.ghtml', 'news_article', 4, 'Cuiabá', 'Entrevista', 'mauro-mendes-stf-marco-b108-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende "reforma agrária reversa" para tomar terras indígenas.', 'Tem muito índio com pouca gente.', 'Entrevista.', 'verified', true, '2024-05-05', 'https://www.opopular.com.br/politica/caiado-reforma-reversa.html', 'news_article', 5, 'Goiânia', 'Entrevista', 'caiado-reforma-reversa-b108-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri2, 'Riedel apoia fazendeiros em ações violentas no MS.', 'Fazendeiro tem direito de defender sua terra.', 'Entrevista em Campo Grande.', 'verified', true, '2024-09-12', 'https://www.campograndenews.com.br/politica/riedel-fazendeiros-violencia', 'news_article', 5, 'Campo Grande', 'Entrevista', 'riedel-fazendeiros-violencia-b108-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gla, 'Gladson Cameli minimiza conflitos com indígenas no Acre.', 'Não tem conflito, tem só divergência.', 'Coletiva em Rio Branco.', 'verified', false, '2024-07-15', 'https://www.acrenews.com.br/gladson-indigena-divergencia', 'news_article', 2, 'Rio Branco', 'Coletiva', 'gladson-indigena-divergencia-b108-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio nomeia secretário com passagem por empresas acusadas de invadir terras indígenas.', 'Técnico competente, sua história não é problema.', 'Coletiva.', 'verified', false, '2024-08-15', 'https://www.folha.uol.com.br/cotidiano/2024/08/tarcisio-secretario-indigena.shtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'tarcisio-secretario-indigena-b108-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz em podcast que Yanomami "só tem desnutrição por preguiça".', 'Eles não trabalham, então não tem comida.', 'Podcast bolsonarista.', 'verified', true, '2024-04-02', 'https://www.cartacapital.com.br/politica/bolsonaro-yanomami-preguica', 'news_article', 5, 'Orlando', 'Podcast', 'bolsonaro-yanomami-preguica-b108-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hatt, 'Van Hattem ataca política para povos isolados da Funai.', 'Povos isolados é lenda indigenista.', 'Discurso na Câmara.', 'verified', false, '2024-03-05', 'https://www.camara.leg.br/noticias/hattem-isolados', 'news_article', 4, 'Brasília', 'Plenário', 'hattem-isolados-b108-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles defende produtores acusados de invasão Pataxó na Bahia.', 'Eles são produtores de boa-fé.', 'Entrevista.', 'verified', false, '2023-12-10', 'https://www.atarde.com.br/politica/salles-pataxo', 'news_article', 4, 'Salvador', 'Entrevista', 'salles-pataxo-b108-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves minimiza mortes de crianças Yanomami em CPI.', 'Esses números estão inflados.', 'CPI Yanomami.', 'verified', true, '2023-05-05', 'https://www.cnnbrasil.com.br/politica/damares-yanomami-mortes-cpi/', 'news_article', 5, 'Brasília', 'CPI', 'damares-yanomami-mortes-cpi-b108-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano defende catequização forçada de povos indígenas.', 'Missionário é obrigação cristã.', 'Culto.', 'verified', false, '2023-11-28', 'https://www.folha.uol.com.br/poder/2023/11/feliciano-catequizacao.shtml', 'news_article', 4, 'Brasília', 'Culto', 'feliciano-catequizacao-b108-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro divulga fake news sobre "ONGs internacionais" em terras indígenas.', 'ONG americana controla Amazônia.', 'Twitter.', 'verified', true, '2024-02-14', 'https://www.aosfatos.org/noticias/eduardo-bolsonaro-ong-amazonia/', 'fact_check', 4, 'Brasília', 'Redes sociais', 'eduardo-bolsonaro-ong-amazonia-b108-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira promete recriar Marco Temporal por emenda constitucional.', 'Se o STF derrubar, a gente aprova PEC.', 'Entrevista.', 'verified', true, '2023-09-29', 'https://www.folha.uol.com.br/poder/2023/09/lira-pec-marco.shtml', 'news_article', 5, 'Brasília', 'Entrevista', 'lira-pec-marco-b108-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta aceita urgência para PL que fragiliza proteção indígena.', 'É pauta do agro, que é prioridade.', 'Plenário Câmara.', 'verified', true, '2025-03-12', 'https://www.jota.info/legislativo/motta-pl-indigena-urgencia', 'news_article', 4, 'Brasília', 'Plenário', 'motta-pl-urgencia-b108-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca CPI Yanomami como "politicagem da esquerda".', 'CPI só serve para atacar o Bolsonaro.', 'Câmara.', 'verified', false, '2023-03-18', 'https://www.camara.leg.br/noticias/nikolas-cpi-yanomami', 'news_article', 3, 'Brasília', 'Plenário', 'nikolas-cpi-yanomami-b108-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado determina operação policial em terra indígena em Goiás.', 'Vamos retomar a paz, custe o que custar.', 'Coletiva.', 'verified', true, '2024-11-02', 'https://g1.globo.com/go/goias/noticia/2024/11/02/caiado-operacao-indigena.ghtml', 'news_article', 5, 'Goiânia', 'Coletiva', 'caiado-operacao-indigena-b108-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Mendes critica proteção ambiental de terras Xavante.', 'Xavante tem terra demais, produtor quer um pedaço só.', 'Evento em Cuiabá.', 'verified', true, '2024-10-05', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/10/05/mauro-mendes-xavante.ghtml', 'news_article', 4, 'Cuiabá', 'Evento', 'mauro-mendes-xavante-b108-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina ataca Marina Silva por ações contra mineração em terras indígenas.', 'Marina só atrapalha o Brasil.', 'Entrevista.', 'verified', false, '2024-03-15', 'https://www.estadao.com.br/politica/tereza-marina-mineracao/', 'news_article', 3, 'Brasília', 'Entrevista', 'tereza-marina-mineracao-b108-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles nega emergência Yanomami como parlamentar em 2024.', 'A emergência Yanomami é inventada pela esquerda.', 'Câmara.', 'verified', true, '2024-05-18', 'https://www.camara.leg.br/noticias/salles-yanomami-esquerda', 'news_article', 5, 'Brasília', 'Plenário', 'salles-yanomami-esquerda-b108-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro discursa na ONU em 2024 defendendo Marco Temporal.', 'Brasil não é Disneyworld de indígenas.', 'Encontro na ONU.', 'verified', true, '2024-09-22', 'https://www.poder360.com.br/mundo/bolsonaro-onu-marco/', 'news_article', 5, 'Nova York', 'Encontro ONU', 'bolsonaro-onu-marco-b108-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende projeto de lei que limita reconhecimento indígena.', 'Tem que ter critério, senão qualquer um vira índio.', 'Senado.', 'verified', true, '2024-06-12', 'https://www.senado.leg.br/noticias/damares-reconhecimento-indigena', 'news_article', 4, 'Brasília', 'Senado', 'damares-reconhecimento-b108-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ebol, 'Eduardo Bolsonaro apoia garimpeiros expulsos da terra Yanomami.', 'Esses trabalhadores estão sendo perseguidos.', 'Câmara.', 'verified', true, '2023-06-02', 'https://www.camara.leg.br/noticias/eduardo-bolsonaro-garimpeiros', 'news_article', 4, 'Brasília', 'Plenário', 'eduardo-bolsonaro-garimpeiros-b108-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas zomba do Dia dos Povos Indígenas.', 'Esse dia é bobagem, temos é que celebrar o Brasil.', 'Redes sociais.', 'verified', true, '2024-04-19', 'https://www.otempo.com.br/politica/nikolas-dia-povos-indigenas', 'news_article', 5, 'Belo Horizonte', 'Redes sociais', 'nikolas-dia-povos-b108-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano ataca ministra Guajajara usando termos religiosos pejorativos.', 'Essa ministra serve a entidades das trevas.', 'Culto.', 'verified', true, '2024-10-28', 'https://www.cartacapital.com.br/politica/feliciano-guajajara-trevas', 'news_article', 5, 'Brasília', 'Culto', 'feliciano-guajajara-trevas-b108-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rel, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_den, 'Denarium é denunciado por ligações com criminosos de garimpo.', 'A Justiça vai provar minha inocência.', 'Coletiva em Boa Vista.', 'verified', true, '2025-03-20', 'https://www.poder360.com.br/politica/denarium-denuncia-garimpo/', 'news_article', 5, 'Boa Vista', 'Coletiva', 'denarium-denuncia-garimpo-b108-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro pede "anistia" para garimpeiros envolvidos na crise Yanomami.', 'Esses trabalhadores não podem ser tratados como criminosos.', 'Ato em Brasília.', 'verified', true, '2025-02-10', 'https://www.folha.uol.com.br/poder/2025/02/bolsonaro-anistia-garimpeiros.shtml', 'news_article', 5, 'Brasília', 'Ato', 'bolsonaro-anistia-garimpeiros-b108-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira aprova projeto que fragiliza demarcação Munduruku.', 'Vamos destravar obras do Pará.', 'Plenário.', 'verified', false, '2024-06-25', 'https://www.camara.leg.br/noticias/lira-munduruku-pl', 'news_article', 4, 'Brasília', 'Plenário', 'lira-munduruku-pl-b108-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles celebra sanção de PL que limita Funai.', 'Funai precisava ser controlada mesmo.', 'Entrevista.', 'verified', false, '2024-08-22', 'https://www.estadao.com.br/politica/salles-funai-limite/', 'news_article', 3, 'Brasília', 'Entrevista', 'salles-funai-limite-b108-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que "indígenas são manipulados pela esquerda" em entrevista.', 'Esses índios são usados pelo PT.', 'Entrevista em 2025.', 'verified', true, '2025-04-10', 'https://www.cnnbrasil.com.br/politica/damares-indigenas-manipulados/', 'news_article', 5, 'Brasília', 'Entrevista', 'damares-indigenas-manipulados-b108-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

END $$;
