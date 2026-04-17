-- Batch 128: STF constitutional debates 2024-2025 (Part 1)
DO $$
DECLARE
  v_mor UUID; v_gil UUID; v_bar UUID; v_tof UUID; v_car UUID;
  v_fux UUID; v_fac UUID; v_nun UUID; v_mend UUID; v_zan UUID;
  v_din UUID; v_jai UUID; v_lul UUID; v_nik UUID; v_edu UUID;
  v_fla UUID; v_bia UUID; v_mfe UUID; v_rog UUID; v_hug UUID;
  v_dav UUID; v_pac UUID; v_mvh UUID; v_ran UUID; v_lin UUID;
  v_bou UUID; v_jaw UUID; v_hum UUID; v_jom UUID; v_lew UUID;
  v_orl UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_had UUID;
  c_ant UUID; c_obs UUID; c_ame UUID; c_abu UUID; c_aut UUID;
  c_des UUID; c_con UUID; c_int UUID;
BEGIN
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fux FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_mend FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_rog FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende tese de descriminalização do porte de maconha para uso pessoal.', 'Criminalizar o usuário não reduziu o consumo e só encheu as prisões de jovens pobres e negros.', 'Voto em plenário do STF no julgamento do RE 635659 sobre porte de maconha.', 'verified', true, '2024-06-25', 'https://www.jota.info/stf/do-supremo/stf-descriminaliza-porte-de-maconha-uso-pessoal-25062024', 'news_article', 1, 'STF', 'Julgamento RE 635659', 'barroso-descrim-maconha-b128-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas convoca pressão para derrubar decisão do STF sobre maconha via PEC.', 'O STF não legisla. Vamos aprovar a PEC das Drogas e derrubar essa vergonha.', 'Discurso na tribuna da Câmara após conclusão do julgamento sobre porte de maconha.', 'verified', true, '2024-06-26', 'https://www.camara.leg.br/noticias/nikolas-ferreira-pec-drogas-stf-maconha', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-pec-drogas-b128-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes alerta para tentativas de intimidação do Judiciário em palestra na FGV.', 'A democracia exige que o Judiciário seja respeitado, não ameaçado por quem perdeu na urna.', 'Palestra na FGV-SP sobre limites entre Poderes após PECs contra o STF.', 'verified', true, '2024-07-10', 'https://www.conjur.com.br/2024-jul-10/moraes-fgv-ameacas-judiciario/', 'news_article', 2, 'FGV-SP', 'Palestra sobre Judiciário', 'moraes-fgv-ameacas-b128-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro apresenta pedido de impeachment contra Moraes no Senado.', 'Protocolei o impeachment de Alexandre de Moraes por abuso de autoridade reiterado.', 'Entrega do pedido ao presidente do Senado com lista de supostas irregularidades.', 'verified', true, '2024-08-12', 'https://www12.senado.leg.br/noticias/materias/2024/08/12/flavio-bolsonaro-impeachment-moraes', 'news_article', 5, 'Senado Federal', 'Protocolo de impeachment', 'flavio-impeachment-moraes-b128-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco engaveta pedido de impeachment contra Moraes alegando ausência de crime.', 'Não cabe ao Senado julgar conteúdo de decisão judicial. O pedido carece de tipicidade.', 'Comunicado oficial da Presidência do Senado rejeitando o protocolo.', 'verified', true, '2024-08-15', 'https://www12.senado.leg.br/noticias/materias/2024/08/15/pacheco-arquiva-impeachment-moraes', 'news_article', 2, 'Senado Federal', 'Decisão da presidência', 'pacheco-arquiva-impeachment-b128-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar critica PEC de autocontrole do Judiciário proposta por parlamentares.', 'PEC que limita decisões do STF é inconstitucional desde a origem. É cláusula pétrea.', 'Entrevista ao Valor Econômico sobre propostas da Câmara que restringem controle de constitucionalidade.', 'verified', false, '2024-09-05', 'https://valor.globo.com/politica/noticia/2024/09/05/gilmar-mendes-pec-autocontrole-judiciario.ghtml', 'news_article', 2, 'IDP', 'Entrevista ao Valor', 'gilmar-pec-autocontrole-b128-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho defende PEC para limitar decisões monocráticas no STF.', 'Decisão monocrática não pode pautar a vida de 215 milhões de brasileiros.', 'Discurso no plenário do Senado apresentando relatório da PEC das Decisões Monocráticas.', 'verified', false, '2024-09-10', 'https://www12.senado.leg.br/noticias/materias/2024/09/10/rogerio-marinho-pec-monocraticas', 'news_article', 3, 'Senado Federal', 'Apresentação de relatório PEC', 'rogerio-pec-monocraticas-b128-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino adverte em voto que ativismo legislativo não pode reescrever Constituição.', 'Poder Constituinte derivado tem limites. Não se pode usar PEC para destruir a Constituição.', 'Voto em ADI sobre emendas Pix e controle do STF.', 'verified', true, '2024-10-02', 'https://www.conjur.com.br/2024-out-02/dino-voto-emendas-pix-constituicao/', 'news_article', 1, 'STF', 'Julgamento ADI emendas', 'dino-limites-constituinte-b128-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso suspende pagamentos de emendas Pix por falta de rastreabilidade.', 'Dinheiro público exige rastreabilidade. Não há democracia sem transparência orçamentária.', 'Decisão monocrática que suspendeu o pagamento das emendas Pix em ação da AGU.', 'verified', true, '2024-08-05', 'https://www.jota.info/stf/do-supremo/barroso-suspende-emendas-pix-rastreabilidade-05082024', 'news_article', 2, 'STF', 'Decisão monocrática', 'barroso-suspende-emendas-pix-b128-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta acusa STF de intervenção indevida no orçamento do Congresso.', 'O Supremo não pode tutelar o orçamento. Vamos reagir institucionalmente.', 'Coletiva após reunião do colégio de líderes sobre decisão de Barroso.', 'verified', true, '2024-08-07', 'https://g1.globo.com/politica/noticia/2024/08/07/hugo-motta-stf-emendas-pix.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de líderes', 'hugo-motta-reacao-pix-b128-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Alcolumbre se reúne com Barroso para destravar acordo sobre emendas Pix.', 'O diálogo institucional é o caminho. Estamos construindo uma solução conjunta.', 'Reunião no STF entre presidente do Senado e presidente do tribunal.', 'verified', false, '2024-08-20', 'https://www.poder360.com.br/congresso/alcolumbre-barroso-acordo-emendas-pix/', 'news_article', 1, 'STF', 'Reunião institucional', 'alcolumbre-barroso-pix-b128-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que diálogo entre Executivo e STF fortalece democracia.', 'Converso com o presidente do Supremo, com o presidente da Câmara e do Senado. É assim que a democracia funciona.', 'Entrevista à imprensa no Palácio do Planalto após almoço com Barroso e Pacheco.', 'verified', true, '2024-09-18', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/09/lula-dialogo-stf-congresso', 'other', 1, 'Palácio do Planalto', 'Entrevista à imprensa', 'lula-dialogo-stf-b128-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem propõe PEC para limitar mandato de ministros do STF.', 'Mandato vitalício é aberração. Vamos aprovar mandato fixo para ministros.', 'Apresentação de PEC na Câmara com apoio da oposição.', 'verified', false, '2024-10-08', 'https://www.camara.leg.br/noticias/van-hattem-pec-mandato-stf-ministros', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PEC', 'van-hattem-mandato-stf-b128-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia afirma que STF não cederá a pressões externas para mudar jurisprudência.', 'O Supremo não julga para agradar maioria passageira. Julga a Constituição.', 'Discurso na abertura do ano judiciário eleitoral no TSE.', 'verified', true, '2024-02-15', 'https://www.tse.jus.br/comunicacao/noticias/2024/Fevereiro/carmen-lucia-abertura-judiciario-eleitoral', 'other', 1, 'TSE', 'Abertura ano judiciário', 'carmen-nao-cedera-pressao-b128-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama decisão da maconha de golpe da toga contra o povo brasileiro.', 'O STF não é legislador. Essa decisão é um golpe da toga. Temos que reagir.', 'Vídeo publicado nas redes após a conclusão do julgamento do porte de maconha.', 'verified', false, '2024-06-26', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-golpe-toga-maconha', 'social_media_post', 4, 'Brasília', 'Postagens em rede social', 'bia-golpe-toga-maconha-b128-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Toffoli defende revisão do marco temporal das terras indígenas em plenário.', 'A tese do marco temporal não se sustenta. Povos originários têm direito originário à terra.', 'Voto no julgamento de ação que discutiu a Lei 14.701/2023 sobre marco temporal.', 'verified', true, '2024-09-23', 'https://www.jota.info/stf/do-supremo/toffoli-voto-marco-temporal-23092024', 'news_article', 1, 'STF', 'Julgamento marco temporal', 'toffoli-marco-temporal-b128-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca STF por revisão do marco temporal de terras indígenas.', 'O STF está roubando terras produtivas. Vamos derrubar no Congresso.', 'Discurso na tribuna contra decisão do plenário do STF.', 'verified', false, '2024-09-24', 'https://www.camara.leg.br/noticias/marco-feliciano-stf-marco-temporal', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'feliciano-marco-temporal-b128-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin reafirma inconstitucionalidade do marco temporal em fala no Palácio do Planalto.', 'Não há como constitucionalizar o que a Constituição repele: a usurpação de terras originárias.', 'Seminário sobre direitos indígenas com ministros e lideranças originárias.', 'verified', false, '2024-10-12', 'https://www.migalhas.com.br/quentes/stf/fachin-marco-temporal-inconstitucional', 'news_article', 1, 'Palácio do Planalto', 'Seminário direitos indígenas', 'fachin-marco-temporal-b128-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina restabelecimento do X no Brasil após Musk cumprir ordens.', 'Cumpridas todas as exigências, determina-se o imediato restabelecimento do serviço.', 'Decisão que autorizou volta do X ao Brasil após Musk pagar multas e indicar representante legal.', 'verified', true, '2024-10-08', 'https://www.conjur.com.br/2024-out-08/moraes-determina-restabelecimento-x-brasil/', 'news_article', 1, 'STF', 'Decisão sobre X/Twitter', 'moraes-restabelece-x-b128-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro comemora acordo da rede X como vitória da liberdade.', 'Mesmo com Moraes fazendo ginástica jurídica, o X venceu. É o primeiro passo contra a censura.', 'Publicação em redes sociais após a volta do X ao Brasil.', 'verified', false, '2024-10-09', 'https://www.poder360.com.br/midia/eduardo-bolsonaro-x-volta-brasil/', 'social_media_post', 3, 'Washington, EUA', 'Postagens em rede social', 'eduardo-x-volta-b128-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin valida suspensão do X no Brasil como decorrência do descumprimento reiterado.', 'O cumprimento da lei brasileira é requisito para operar no Brasil. Não há censura aqui.', 'Voto no agravo regimental que discutiu a suspensão do X.', 'verified', false, '2024-09-02', 'https://www.jota.info/stf/do-supremo/zanin-voto-suspensao-x-02092024', 'news_article', 1, 'STF', 'Julgamento agravo X', 'zanin-suspensao-x-b128-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro convoca pressão popular contra Moraes em ato na Paulista.', 'Moraes, estamos cansados. O povo na rua vai te derrubar. Sai, Moraes.', 'Discurso em ato convocado na Avenida Paulista contra ministro do STF.', 'verified', true, '2024-02-25', 'https://www1.folha.uol.com.br/poder/2024/02/bolsonaro-ato-paulista-stf-moraes.shtml', 'news_article', 5, 'Avenida Paulista', 'Ato político', 'bolsonaro-ato-paulista-moraes-b128-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos denuncia atos bolsonaristas como pressão indevida ao STF.', 'Quem ameaça o STF ameaça a democracia. Não vamos recuar.', 'Entrevista após o ato da Paulista condenando ameaças a Moraes.', 'verified', false, '2024-02-26', 'https://www.cnnbrasil.com.br/politica/boulos-ato-paulista-ameaca-stf/', 'news_article', 1, 'São Paulo', 'Entrevista coletiva', 'boulos-stf-democracia-b128-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux pondera que Judiciário deve se autoconter para preservar diálogo entre Poderes.', 'A autocontenção é virtude, não fraqueza. O Judiciário deve respeitar os limites do possível.', 'Palestra no Congresso de Direito Constitucional em Lisboa.', 'verified', false, '2024-05-14', 'https://www.migalhas.com.br/quentes/stf/fux-autocontencao-judiciario', 'news_article', 1, 'Lisboa', 'Congresso de Direito', 'fux-autocontencao-b128-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mend, 'André Mendonça divergiu em julgamento sobre aborto defendendo vida desde a concepção.', 'A vida deve ser protegida desde a concepção. O STF não é o lugar para decidir essa matéria.', 'Voto divergente em ADPF sobre aborto até 12 semanas em casos específicos.', 'verified', false, '2024-09-20', 'https://www.conjur.com.br/2024-set-20/mendonca-voto-aborto-vida-concepcao/', 'news_article', 2, 'STF', 'Julgamento ADPF aborto', 'mendonca-aborto-concepcao-b128-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende direitos reprodutivos no debate sobre aborto no STF.', 'Direito à vida inclui vida digna para mulheres. Aborto é saúde pública.', 'Discurso na Câmara durante o julgamento da ADPF do aborto.', 'verified', false, '2024-09-25', 'https://www.camara.leg.br/noticias/erika-hilton-aborto-stf', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'erika-aborto-stf-b128-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Motta anuncia regime de urgência para PEC antiaborto em reação ao STF.', 'Se o STF quer invadir competência do Congresso, vamos responder à altura.', 'Coletiva após reunião com líderes para pautar PEC antiaborto.', 'verified', true, '2024-09-26', 'https://g1.globo.com/politica/noticia/2024/09/26/motta-pec-aborto-stf.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de líderes', 'motta-pec-antiaborto-b128-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes Marques vota contra descriminalização do porte de maconha.', 'A criminalização é uma escolha constitucional do legislador que deve ser respeitada.', 'Voto no RE 635659 sobre porte de maconha no STF.', 'verified', false, '2024-06-24', 'https://www.jota.info/stf/do-supremo/nunes-marques-voto-maconha-24062024', 'news_article', 1, 'STF', 'Julgamento RE 635659', 'nunes-marques-contra-maconha-b128-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim comemora descriminalização da maconha como avanço civilizatório.', 'Descriminalizar o usuário é combater o racismo estrutural do sistema penal.', 'Discurso na Câmara após a conclusão do julgamento do STF.', 'verified', false, '2024-06-27', 'https://www.camara.leg.br/noticias/samia-bomfim-maconha-stf-avanco', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'samia-maconha-avanco-b128-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes abre trajetória do julgamento dos atos de 8 de janeiro com voto pela condenação de núcleo golpista.', 'Não há democracia sem responsabilização de quem atentou contra as instituições.', 'Abertura do julgamento do núcleo 1 da trama golpista na 1ª Turma do STF.', 'verified', true, '2025-03-25', 'https://www.conjur.com.br/2025-mar-25/moraes-voto-8-janeiro-nucleo-1/', 'news_article', 1, 'STF', 'Julgamento 8 de janeiro', 'moraes-voto-golpe-b128-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama julgamento de golpe de farsa jurídica orquestrada por Moraes.', 'Não houve tentativa de golpe. Essa é a maior farsa jurídica da história.', 'Entrevista à Jovem Pan em meio ao início do julgamento dos réus do 8 de janeiro.', 'verified', true, '2025-03-26', 'https://jovempan.com.br/noticias/politica/bolsonaro-julgamento-golpe-farsa.html', 'news_article', 4, 'Brasília', 'Entrevista à rádio', 'bolsonaro-farsa-juridica-b128-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin acompanha Moraes no julgamento da trama golpista.', 'Há prova robusta e contundente da conjuração contra a ordem democrática.', 'Voto na 1ª Turma durante julgamento do núcleo 1 dos atos golpistas.', 'verified', false, '2025-03-26', 'https://www.jota.info/stf/do-supremo/zanin-voto-golpe-26032025', 'news_article', 1, 'STF', 'Julgamento 8 de janeiro', 'zanin-voto-golpe-b128-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota com o relator no julgamento da trama golpista.', 'A prova documental e testemunhal é esmagadora. A conduta é típica e dolosa.', 'Voto na 1ª Turma do STF no julgamento dos envolvidos no 8 de janeiro.', 'verified', false, '2025-03-27', 'https://www.conjur.com.br/2025-mar-27/dino-voto-trama-golpista/', 'news_article', 1, 'STF', 'Julgamento 8 de janeiro', 'dino-voto-trama-b128-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira pede impeachment em lote de Moraes, Zanin e Dino.', 'Vou apresentar impeachment de todos os ministros que participaram dessa farsa.', 'Vídeo nas redes após o voto de Moraes no julgamento do 8 de janeiro.', 'verified', true, '2025-03-27', 'https://www.metropoles.com/brasil/politica-br/nikolas-impeachment-stf-3-ministros', 'social_media_post', 5, 'Brasília', 'Postagens em rede social', 'nikolas-impeachment-trio-b128-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes afirma que ameaças de impeachment não intimidam o STF.', 'Impeachment não é instrumento de vingança política. O STF seguirá cumprindo seu dever.', 'Entrevista à CNN Brasil após ondas de pedidos de impeachment.', 'verified', false, '2025-04-02', 'https://www.cnnbrasil.com.br/politica/gilmar-mendes-impeachment-stf-cnn/', 'news_article', 1, 'IDP', 'Entrevista à CNN', 'gilmar-impeachment-nao-intimida-b128-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Jorge Messias defende o STF no Senado contra PEC de limitação de poderes.', 'Atacar o STF é atacar o Estado de Direito. A AGU se opõe à PEC.', 'Pronunciamento durante audiência na CCJ do Senado.', 'verified', false, '2024-11-08', 'https://www12.senado.leg.br/noticias/materias/2024/11/08/messias-stf-pec-limitacao', 'news_article', 1, 'Senado Federal', 'Audiência pública CCJ', 'messias-defende-stf-b128-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski critica PECs que reduzem competência do STF.', 'Essas PECs fragilizam o controle de constitucionalidade. É um retrocesso democrático.', 'Entrevista coletiva após reunião interministerial sobre segurança jurídica.', 'verified', false, '2024-11-12', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/lewandowski-pec-stf-retrocesso', 'other', 1, 'Ministério da Justiça', 'Entrevista coletiva', 'lewandowski-pec-retrocesso-b128-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues denuncia tentativas de desestabilizar o STF.', 'Há uma operação orquestrada para sufocar o Supremo. Isso é antidemocrático.', 'Discurso no plenário do Senado contra pautas anti-STF.', 'verified', false, '2024-11-20', 'https://www12.senado.leg.br/noticias/materias/2024/11/20/randolfe-denuncia-ataques-stf', 'news_article', 1, 'Senado Federal', 'Sessão plenária', 'randolfe-ataques-stf-b128-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias defende o STF em acordo sobre emendas parlamentares.', 'Vamos construir com o STF transparência que todo brasileiro quer ver.', 'Entrevista após reunião com Barroso sobre emendas Pix.', 'verified', false, '2024-08-22', 'https://www.poder360.com.br/congresso/lindbergh-stf-emendas-transparencia/', 'news_article', 1, 'Brasília', 'Entrevista coletiva', 'lindbergh-stf-transparencia-b128-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva critica PEC do autocontrole do Judiciário como golpe branco.', 'Essa PEC é golpe branco contra a Constituição. Vamos barrar no plenário.', 'Entrevista à imprensa após reunião da liderança do PCdoB.', 'verified', false, '2024-11-15', 'https://www.camara.leg.br/noticias/orlando-silva-pec-autocontrole-golpe', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'orlando-pec-golpe-branco-b128-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende STF contra pressão da extrema-direita.', 'Não há democracia sem STF forte. Vamos reagir aos ataques de extrema-direita.', 'Pronunciamento no Senado sobre bloco governista.', 'verified', false, '2024-11-28', 'https://www12.senado.leg.br/noticias/materias/2024/11/28/humberto-costa-stf-democracia', 'news_article', 1, 'Senado Federal', 'Sessão plenária', 'humberto-stf-forte-b128-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner articula diálogo entre governo e STF sobre emendas.', 'Meu papel é construir pontes. Vamos pacificar essa agenda com o STF.', 'Coletiva após reuniões com Barroso e líderes partidários.', 'verified', false, '2024-09-03', 'https://www12.senado.leg.br/noticias/materias/2024/09/03/jaques-wagner-stf-emendas-pontes', 'news_article', 1, 'Senado Federal', 'Coletiva de imprensa', 'jaques-pontes-stf-b128-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende decisão do STF sobre emendas Pix como garantia de responsabilidade fiscal.', 'Transparência em emendas é pressuposto de responsabilidade fiscal.', 'Coletiva no Ministério da Fazenda após decisão do STF.', 'verified', false, '2024-08-08', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2024/agosto/haddad-stf-emendas-pix', 'other', 1, 'Ministério da Fazenda', 'Coletiva de imprensa', 'haddad-pix-fiscal-b128-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Toffoli anula decisões contra Lula e Odebrecht com base em provas da Lava Jato.', 'Provas obtidas em violação de direitos fundamentais são imprestáveis.', 'Decisão monocrática que anulou provas da Lava Jato relativas à Odebrecht.', 'verified', true, '2024-02-20', 'https://www.migalhas.com.br/quentes/stf/toffoli-anula-provas-lava-jato-odebrecht', 'news_article', 2, 'STF', 'Decisão monocrática', 'toffoli-anula-provas-b128-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem acusa Toffoli de parcialidade em decisão sobre Lava Jato.', 'Toffoli se transformou em advogado de defesa dos condenados da Lava Jato.', 'Discurso na Câmara contra decisão monocrática do ministro.', 'verified', false, '2024-02-21', 'https://www.camara.leg.br/noticias/van-hattem-toffoli-parcialidade-lava-jato', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-toffoli-parcial-b128-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes rejeita pedido de suspeição e diz que ameaças não o calarão.', 'Não é o clamor bolsonarista que define minhas decisões. É a Constituição.', 'Despacho em incidente de suspeição apresentado pela defesa de Bolsonaro.', 'verified', true, '2025-01-28', 'https://www.conjur.com.br/2025-jan-28/moraes-rejeita-suspeicao-bolsonaro/', 'news_article', 2, 'STF', 'Decisão em incidente', 'moraes-rejeita-suspeicao-b128-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux defende revisão do foro privilegiado em plenário do STF.', 'O foro deve ser restrito a atos praticados no exercício da função.', 'Voto em questão de ordem sobre interpretação do foro por prerrogativa de função.', 'verified', false, '2024-04-15', 'https://www.jota.info/stf/do-supremo/fux-foro-privilegiado-15042024', 'news_article', 1, 'STF', 'Questão de ordem foro', 'fux-foro-privilegiado-b128-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso rebate ataques da oposição afirmando que STF não é balcão de vetos políticos.', 'Não somos balcão de vetos partidários. Decidimos sobre a Constituição.', 'Discurso em evento da OAB com entidades jurídicas.', 'verified', false, '2024-07-30', 'https://www.oab.org.br/noticia/barroso-stf-vetos-politicos-oab', 'other', 1, 'OAB Nacional', 'Evento jurídico', 'barroso-stf-balcao-b128-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco se reúne com Lula e Barroso para definir agenda pós-eleições.', 'Os três Poderes precisam conversar. Estabilidade institucional é inegociável.', 'Encontro no Jaburu entre presidentes dos três Poderes.', 'verified', false, '2024-11-05', 'https://www.poder360.com.br/governo/lula-pacheco-barroso-jaburu-agenda/', 'news_article', 1, 'Palácio do Jaburu', 'Reunião institucional', 'pacheco-lula-barroso-b128-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Alcolumbre assume presidência do Senado prometendo diálogo com STF.', 'Vou presidir o Senado com diálogo. O Supremo é parceiro, não inimigo.', 'Discurso de posse como presidente do Senado Federal.', 'verified', true, '2025-02-01', 'https://www12.senado.leg.br/noticias/materias/2025/02/01/alcolumbre-presidencia-dialogo-stf', 'other', 1, 'Senado Federal', 'Posse na presidência', 'alcolumbre-posse-dialogo-b128-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Motta assume Câmara com promessa de pauta anti-STF.', 'Vamos pautar limites institucionais ao STF. É missão desta Casa.', 'Discurso de posse na presidência da Câmara dos Deputados.', 'verified', true, '2025-02-01', 'https://www.camara.leg.br/noticias/motta-posse-presidencia-pauta-stf', 'other', 3, 'Câmara dos Deputados', 'Posse na presidência', 'motta-posse-pauta-stf-b128-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes defende diálogo institucional em visita a Motta.', 'O diálogo com o Congresso é sempre bem-vindo. Divergir é normal, atacar não.', 'Reunião no Congresso após posse de Motta.', 'verified', false, '2025-02-10', 'https://www.migalhas.com.br/quentes/stf/gilmar-motta-dialogo-institucional', 'news_article', 1, 'Câmara dos Deputados', 'Reunião institucional', 'gilmar-motta-dialogo-b128-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro compara Moraes a ditadores em entrevista à Gazeta do Povo.', 'Moraes é o Pinochet do Brasil. Persegue quem discorda dele.', 'Entrevista em Balneário Camboriú sobre perseguição política.', 'verified', true, '2024-12-15', 'https://www.gazetadopovo.com.br/republica/bolsonaro-moraes-pinochet-brasil/', 'news_article', 4, 'Balneário Camboriú', 'Entrevista à Gazeta do Povo', 'bolsonaro-moraes-pinochet-b128-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia rebate ataques dizendo que juíza não se amedronta com pressão.', 'Juíza de verdade não se amedronta. Julgo pela Constituição.', 'Discurso em sessão do TSE sobre direitos políticos.', 'verified', false, '2024-11-08', 'https://www.tse.jus.br/comunicacao/noticias/2024/Novembro/carmen-lucia-ataques-pressao', 'other', 1, 'TSE', 'Sessão do TSE', 'carmen-juiza-nao-amedronta-b128-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz em audiência do Congresso americano que STF precisa de sanções.', 'O STF brasileiro precisa ser sancionado pelos Estados Unidos via Lei Magnitsky.', 'Audiência no Congresso dos EUA com parlamentares conservadores.', 'verified', true, '2025-03-12', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-stf-magnitsky-congresso-eua/', 'news_article', 5, 'Washington, EUA', 'Audiência no Congresso EUA', 'eduardo-stf-magnitsky-b128-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin exalta diálogo entre Poderes em palestra no IDP.', 'A harmonia entre Poderes pressupõe respeito mútuo e autocrítica de todos.', 'Palestra no IDP sobre separação de Poderes.', 'verified', false, '2025-04-05', 'https://www.jota.info/stf/do-supremo/zanin-dialogo-poderes-idp-05042025', 'news_article', 1, 'IDP', 'Palestra sobre Poderes', 'zanin-dialogo-idp-b128-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis convoca aliados a votar todas as PECs anti-STF de uma vez.', 'Vamos pautar todas as PECs contra o STF em bloco. É agora ou nunca.', 'Reunião da bancada da oposição na Câmara.', 'verified', false, '2025-03-06', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-pecs-anti-stf-bloco', 'news_article', 4, 'Câmara dos Deputados', 'Reunião de bancada', 'bia-pecs-bloco-anti-stf-b128-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin defende proteção institucional ao Judiciário em posse do novo CNJ.', 'Ataques sistemáticos a juízes minam a República. Defenderemos a toga com serenidade.', 'Discurso de abertura da nova composição do CNJ.', 'verified', false, '2025-05-20', 'https://www.cnj.jus.br/fachin-abertura-cnj-ataques-magistratura', 'other', 1, 'CNJ', 'Posse da nova composição', 'fachin-cnj-ataques-b128-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio de redes sociais de figuras públicas por ataques golpistas.', 'Não se pode tolerar ataques coordenados contra a democracia.', 'Decisão que determinou o bloqueio de perfis investigados no inquérito das milícias digitais.', 'verified', true, '2024-05-14', 'https://www.conjur.com.br/2024-mai-14/moraes-bloqueio-redes-milicias-digitais/', 'news_article', 2, 'STF', 'Inquérito milícias digitais', 'moraes-bloqueio-perfis-b128-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas propõe CPI para investigar inquérito das milícias digitais do STF.', 'Vamos investigar esse tal inquérito. O STF virou polícia política.', 'Coletiva após protocolar requerimento de CPI na Câmara.', 'verified', false, '2024-05-20', 'https://www.camara.leg.br/noticias/nikolas-cpi-inquerito-milicias-stf', 'news_article', 4, 'Câmara dos Deputados', 'Protocolo de CPI', 'nikolas-cpi-inquerito-stf-b128-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino pede no STF atuação contra discurso de ódio em plataformas.', 'Discurso de ódio não é liberdade de expressão. Plataformas devem responder.', 'Voto em julgamento sobre responsabilidade das big techs.', 'verified', false, '2024-12-18', 'https://www.jota.info/stf/do-supremo/dino-voto-big-techs-18122024', 'news_article', 1, 'STF', 'Julgamento big techs', 'dino-voto-big-techs-b128-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem diz que voto de Dino sobre big techs é censura institucionalizada.', 'Dino quer policiar o que brasileiros podem ou não podem falar. Isso é censura.', 'Postagem no X após o voto do ministro sobre big techs.', 'verified', false, '2024-12-19', 'https://www.metropoles.com/brasil/politica-br/van-hattem-dino-big-techs-censura', 'social_media_post', 3, 'Brasília', 'Postagens em rede social', 'van-hattem-dino-censura-b128-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em entrevista que respeita decisões do STF mesmo quando discorda.', 'Eu posso discordar, mas decisão do STF se cumpre. Ponto.', 'Entrevista à Globonews sobre relação do governo com o Supremo.', 'verified', true, '2024-07-12', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/07/lula-decisao-stf-cumpre-globonews', 'other', 1, 'Palácio do Planalto', 'Entrevista à Globonews', 'lula-respeita-stf-b128-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano chama Moraes de ditador togado em vídeo de campanha.', 'Moraes é ditador togado. O Brasil vive sob censura judicial.', 'Vídeo pré-campanha publicado no YouTube do deputado.', 'verified', false, '2024-08-02', 'https://www.poder360.com.br/midia/marco-feliciano-moraes-ditador-togado-video/', 'social_media_post', 4, 'Brasília', 'Vídeo em redes sociais', 'feliciano-ditador-togado-b128-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso diz em posse que democracia brasileira venceu o golpismo.', 'A democracia brasileira enfrentou e derrotou o golpismo. Precisamos seguir vigilantes.', 'Discurso na abertura do ano judiciário de 2024.', 'verified', true, '2024-02-02', 'https://www.stf.jus.br/noticias/barroso-abertura-ano-judiciario-2024-democracia', 'other', 1, 'STF', 'Abertura ano judiciário', 'barroso-democracia-venceu-b128-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho acusa Barroso de politização do STF em discurso no Senado.', 'Barroso transformou o STF em palanque político. Vamos responder.', 'Pronunciamento no Senado criticando fala do presidente do STF.', 'verified', false, '2024-02-05', 'https://www12.senado.leg.br/noticias/materias/2024/02/05/rogerio-marinho-barroso-politizacao-stf', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'rogerio-barroso-palanque-b128-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone defende STF contra tentativas de impeachment de ministros.', 'Impeachment por conteúdo de decisão é golpe. Vamos barrar.', 'Discurso na Câmara em defesa dos ministros do STF.', 'verified', false, '2024-08-14', 'https://www.camara.leg.br/noticias/taliria-stf-impeachment-ministros', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'taliria-defende-stf-b128-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco arquiva segundo pedido de impeachment de Moraes em 2024.', 'Reitero: pedidos por teor de decisão judicial não prosperam nesta Casa.', 'Decisão de arquivamento de novo pedido protocolado pela oposição.', 'verified', false, '2024-10-22', 'https://www12.senado.leg.br/noticias/materias/2024/10/22/pacheco-arquiva-novo-pedido-impeachment-moraes', 'news_article', 2, 'Senado Federal', 'Decisão da presidência', 'pacheco-arquiva-novo-b128-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula PEC para limitar poderes do relator no STF.', 'Relator não pode ser juiz, jurado e carrasco. Vamos mudar isso na Constituição.', 'Coletiva no Senado após reunião com senadores da oposição.', 'verified', false, '2024-09-18', 'https://www12.senado.leg.br/noticias/materias/2024/09/18/flavio-bolsonaro-pec-relator-stf', 'news_article', 3, 'Senado Federal', 'Coletiva de imprensa', 'flavio-pec-relator-b128-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que autocontrole do STF virá de dentro, não por PEC.', 'Autocontenção se constrói internamente, não por PEC com cheiro de retaliação.', 'Entrevista ao Conjur sobre debate em torno do STF.', 'verified', false, '2024-10-15', 'https://www.conjur.com.br/2024-out-15/gilmar-autocontencao-dentro-pec/', 'news_article', 1, 'IDP', 'Entrevista ao Conjur', 'gilmar-autocontencao-dentro-b128-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton critica PEC que limita decisões monocráticas.', 'Essa PEC quer engessar o STF em nome da extrema-direita. Vamos barrar.', 'Discurso na Câmara sobre debates institucionais.', 'verified', false, '2024-10-09', 'https://www.camara.leg.br/noticias/erika-pec-monocraticas-extrema-direita', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'erika-pec-monocraticas-b128-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro pede em ato em Copacabana o impeachment de Moraes.', 'Senadores, cumpram seu dever. Impeachment já para Alexandre de Moraes.', 'Discurso em ato político em Copacabana.', 'verified', true, '2024-04-21', 'https://www1.folha.uol.com.br/poder/2024/04/bolsonaro-ato-copacabana-impeachment-moraes.shtml', 'news_article', 5, 'Copacabana', 'Ato político', 'bolsonaro-copacabana-impeachment-b128-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia assume a presidência do TSE em meio a tensões sobre redes sociais.', 'A integridade do processo eleitoral depende do enfrentamento à desinformação digital.', 'Discurso de posse na presidência do TSE.', 'verified', true, '2024-06-03', 'https://www.tse.jus.br/comunicacao/noticias/2024/Junho/carmen-lucia-posse-tse-redes-sociais', 'other', 1, 'TSE', 'Posse TSE', 'carmen-posse-tse-b128-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski conduz articulação do governo com STF sobre segurança pública.', 'A PEC da Segurança respeita as competências federativas e vai dialogar com o STF.', 'Entrevista sobre a PEC da Segurança Pública.', 'verified', false, '2024-11-28', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/lewandowski-pec-seguranca-stf', 'other', 1, 'Ministério da Justiça', 'Entrevista coletiva', 'lewandowski-pec-seguranca-b128-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin assume presidência do STF e destaca defesa das instituições.', 'Assumo a presidência do STF comprometido com a Constituição e a democracia.', 'Discurso de posse na presidência do Supremo Tribunal Federal.', 'verified', true, '2025-09-29', 'https://www.stf.jus.br/noticias/fachin-posse-presidencia-stf-setembro-2025', 'other', 1, 'STF', 'Posse presidência STF', 'fachin-posse-stf-b128-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso despede-se da presidência do STF defendendo diálogo e serenidade.', 'Encerro a presidência convicto de que o STF cumpriu seu papel histórico.', 'Discurso de despedida da presidência do Supremo.', 'verified', true, '2025-09-28', 'https://www.stf.jus.br/noticias/barroso-despedida-presidencia-2025', 'other', 1, 'STF', 'Despedida da presidência', 'barroso-despedida-stf-b128-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas sugere boicote a julgamento de Bolsonaro com discurso nas redes.', 'Se condenarem Bolsonaro, será julgamento sem legitimidade. O povo saberá responder.', 'Vídeo em redes após pauta da ação penal contra Bolsonaro.', 'verified', true, '2025-03-02', 'https://www.metropoles.com/brasil/politica-br/nikolas-julgamento-bolsonaro-sem-legitimidade', 'social_media_post', 5, 'Brasília', 'Vídeo em redes sociais', 'nikolas-boicote-julgamento-b128-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina início do julgamento de Bolsonaro por crimes golpistas.', 'A ação penal está madura para julgamento. Incluo em pauta.', 'Despacho de pauta da AP 2668 na 1ª Turma do STF.', 'verified', true, '2025-03-10', 'https://www.conjur.com.br/2025-mar-10/moraes-pauta-ap-2668-bolsonaro/', 'news_article', 1, 'STF', 'Despacho de pauta', 'moraes-pauta-ap-bolsonaro-b128-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro declara que STF virou tribunal de exceção contra Bolsonaro.', 'O STF criou um tribunal de exceção personalizado para destruir meu pai.', 'Entrevista à Jovem Pan sobre ação penal contra Bolsonaro.', 'verified', false, '2025-03-14', 'https://jovempan.com.br/noticias/politica/flavio-bolsonaro-stf-tribunal-excecao.html', 'news_article', 4, 'Senado Federal', 'Entrevista à Jovem Pan', 'flavio-tribunal-excecao-b128-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos defende o STF como baluarte contra o golpismo.', 'Se o STF não tivesse cumprido seu papel, teríamos ditadura hoje.', 'Entrevista em ato em memória do 8 de janeiro.', 'verified', false, '2025-01-08', 'https://www.cnnbrasil.com.br/politica/boulos-stf-baluarte-contra-golpismo/', 'news_article', 1, 'Brasília', 'Ato 8 de janeiro', 'boulos-stf-baluarte-b128-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes vota pela condenação dos réus do 8 de janeiro por tentativa de golpe.', 'Há prova contundente da intenção golpista. A Constituição não tolera conspiração.', 'Voto em plenário da 1ª Turma no julgamento do núcleo 1.', 'verified', false, '2025-03-28', 'https://www.conjur.com.br/2025-mar-28/gilmar-voto-condenacao-golpe/', 'news_article', 1, 'STF', 'Julgamento 8 de janeiro', 'gilmar-voto-condenacao-b128-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Toffoli reafirma voto contra anulação de Bolsonaro em questão preliminar.', 'A competência do STF está firmada pela jurisprudência. Rejeito preliminar.', 'Voto em questão preliminar no julgamento da trama golpista.', 'verified', false, '2025-03-29', 'https://www.migalhas.com.br/quentes/stf/toffoli-voto-preliminar-competencia', 'news_article', 1, 'STF', 'Julgamento 8 de janeiro', 'toffoli-preliminar-competencia-b128-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes Marques diverge e defende nulidades no processo dos golpistas.', 'Há questões processuais que precisam ser sanadas antes do mérito.', 'Voto divergente na 1ª Turma durante julgamento do núcleo 1.', 'verified', false, '2025-03-30', 'https://www.jota.info/stf/do-supremo/nunes-marques-voto-divergente-golpe-30032025', 'news_article', 2, 'STF', 'Julgamento 8 de janeiro', 'nunes-divergencia-golpe-b128-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro afirma que não acatará condenação do STF.', 'Nunca aceitarei essa farsa. Sou inocente. Estão tentando me exilar.', 'Entrevista a Oeste após pauta do julgamento.', 'verified', true, '2025-03-16', 'https://revistaoeste.com/politica/bolsonaro-nao-acatarei-condenacao-stf/', 'news_article', 5, 'Brasília', 'Entrevista à Revista Oeste', 'bolsonaro-nao-acatarei-b128-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia vota pela procedência integral da ação contra Bolsonaro.', 'A prova é robusta. A conduta típica. A autoria demonstrada. Condeno integralmente.', 'Voto na 1ª Turma no julgamento de Bolsonaro.', 'verified', true, '2025-09-10', 'https://www.conjur.com.br/2025-set-10/carmen-lucia-voto-condenacao-bolsonaro/', 'news_article', 1, 'STF', 'Julgamento Bolsonaro', 'carmen-voto-bolsonaro-b128-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula almoça com Alcolumbre e Motta após posses no Congresso.', 'Respeito a independência dos Poderes. Vamos trabalhar juntos pelo Brasil.', 'Almoço no Palácio do Jaburu entre Lula, Alcolumbre e Motta.', 'verified', false, '2025-02-05', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/02/lula-almoco-alcolumbre-motta', 'other', 1, 'Palácio do Jaburu', 'Almoço institucional', 'lula-almoco-congresso-b128-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino determina regras para emendas parlamentares com rastreabilidade.', 'Transparência é regra, sigilo é exceção na execução de emendas.', 'Decisão que fixou parâmetros para execução de emendas em 2025.', 'verified', true, '2025-02-17', 'https://www.jota.info/stf/do-supremo/dino-regras-emendas-rastreabilidade-17022025', 'news_article', 1, 'STF', 'Decisão sobre emendas', 'dino-regras-emendas-b128-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Motta critica decisão de Dino e ameaça com retaliação via PEC.', 'Vamos responder. Não aceitamos intervenção no Legislativo.', 'Entrevista coletiva após decisão do ministro Flávio Dino.', 'verified', false, '2025-02-18', 'https://www.camara.leg.br/noticias/motta-critica-dino-emendas-retaliacao', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de imprensa', 'motta-critica-dino-b128-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes alerta para risco de erosão democrática por ataques coordenados.', 'Não subestimem o que está acontecendo. Há erosão democrática em curso.', 'Palestra na USP sobre democracia e Judiciário.', 'verified', false, '2025-05-02', 'https://www.jota.info/stf/do-supremo/moraes-usp-erosao-democratica-02052025', 'news_article', 2, 'USP', 'Palestra sobre democracia', 'moraes-erosao-democratica-b128-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que ataques ao STF aumentam risco fiscal e prejudicam mercado.', 'Instabilidade institucional aumenta o risco-Brasil. É ruim para o mercado.', 'Coletiva após reunião com bancos internacionais.', 'verified', false, '2025-03-11', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/marco/haddad-ataques-stf-risco-fiscal', 'other', 1, 'Ministério da Fazenda', 'Coletiva de imprensa', 'haddad-risco-fiscal-stf-b128-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux diverge em voto parcial no julgamento do núcleo golpista.', 'Reconheço parte dos crimes, mas divirjo quanto à tipificação integral.', 'Voto na 1ª Turma em julgamento do núcleo 1 dos atos golpistas.', 'verified', false, '2025-03-31', 'https://www.conjur.com.br/2025-mar-31/fux-voto-divergente-golpe/', 'news_article', 2, 'STF', 'Julgamento 8 de janeiro', 'fux-voto-divergente-b128-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mend, 'André Mendonça pede vista em ação que discute foro privilegiado.', 'Peço vista para análise aprofundada da matéria.', 'Pedido de vista em julgamento de questão sobre foro privilegiado.', 'verified', false, '2024-05-22', 'https://www.migalhas.com.br/quentes/stf/mendonca-pede-vista-foro-privilegiado', 'news_article', 1, 'STF', 'Questão sobre foro', 'mendonca-vista-foro-b128-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende pacto entre Lula e presidentes de Senado e STF.', 'Estamos construindo um pacto republicano. Convido quem queira somar.', 'Coletiva após reunião com Barroso, Pacheco e Lula.', 'verified', false, '2024-05-08', 'https://www12.senado.leg.br/noticias/materias/2024/05/08/randolfe-pacto-republicano-stf-senado', 'news_article', 1, 'Senado Federal', 'Coletiva institucional', 'randolfe-pacto-republicano-b128-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis publica lista de ministros do STF que sofrerão impeachment.', 'Tenho a lista: Moraes, Dino, Zanin. Impeachment em lote.', 'Postagem no X com ataques a ministros do STF.', 'verified', false, '2025-04-08', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-lista-impeachment-stf', 'social_media_post', 5, 'Brasília', 'Postagens em rede social', 'bia-lista-impeachment-b128-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Jorge Messias pede ao STF ação contra PEC que restringe poderes judiciais.', 'A PEC do autocontrole viola cláusula pétrea. Entraremos no STF se aprovada.', 'Coletiva de imprensa na AGU sobre PECs anti-STF.', 'verified', false, '2025-04-10', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2025/messias-pec-autocontrole-clausula-petrea', 'other', 1, 'AGU', 'Coletiva de imprensa', 'messias-pec-clausula-petrea-b128-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso rebate PEC da Câmara afirmando que STF não se curva a retaliações.', 'O STF não se curvará a retaliações políticas. Ponto.', 'Entrevista à GloboNews sobre avanço de PEC anti-STF.', 'verified', true, '2025-04-11', 'https://g1.globo.com/politica/noticia/2025/04/11/barroso-pec-nao-se-curva-stf.ghtml', 'news_article', 2, 'STF', 'Entrevista à GloboNews', 'barroso-nao-curva-b128-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh defende STF em discurso sobre ataques da extrema-direita.', 'O alvo da extrema-direita sempre foi o STF. Não aceitaremos.', 'Discurso no plenário da Câmara sobre crise institucional.', 'verified', false, '2025-04-12', 'https://www.camara.leg.br/noticias/lindbergh-stf-extrema-direita-alvo', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'lindbergh-stf-alvo-b128-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes restringe uso de redes sociais por réus do 8 de janeiro.', 'Réus não podem usar redes para incitar desacato a decisões judiciais.', 'Despacho no inquérito que estendeu medidas cautelares contra réus golpistas.', 'verified', false, '2025-05-15', 'https://www.conjur.com.br/2025-mai-15/moraes-restringe-redes-reus-8-janeiro/', 'news_article', 2, 'STF', 'Despacho cautelar', 'moraes-restringe-redes-b128-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro grava vídeo chamando Moraes de ditador em missão nos EUA.', 'Moraes é ditador. Não vou voltar enquanto ele mandar no Brasil.', 'Vídeo gravado em Washington após decisão de Moraes contra ele.', 'verified', true, '2025-05-20', 'https://www.poder360.com.br/politica/eduardo-bolsonaro-moraes-ditador-eua-video/', 'social_media_post', 5, 'Washington, EUA', 'Vídeo em redes sociais', 'eduardo-moraes-ditador-eua-b128-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar fecha ano de 2024 alertando que STF resistirá a pressões de 2025.', 'O STF brasileiro seguirá firme em 2025, como sempre esteve.', 'Entrevista retrospectiva de fim de ano ao Valor Econômico.', 'verified', false, '2024-12-28', 'https://valor.globo.com/politica/noticia/2024/12/28/gilmar-mendes-retrospectiva-stf-2025.ghtml', 'news_article', 1, 'IDP', 'Entrevista retrospectiva', 'gilmar-retrospectiva-2024-b128-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;
END $$;
