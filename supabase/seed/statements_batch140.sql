-- Batch 140: Zambelli + Ramagem + Silveira fugitivos bolsonaristas (Out 2022 - Abr 2026) Parte 1
DO $$
DECLARE
  v_zam UUID; v_ram UUID; v_sil UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_mic UUID; v_jai UUID; v_nik UUID; v_bia UUID;
  v_mfe UUID; v_dam UUID; v_mag UUID; v_mou UUID; v_mor UUID;
  v_mvh UUID; v_kim UUID; v_pab UUID; v_tar UUID; v_gir UUID;
  v_jza UUID; v_san UUID; v_fbr UUID; v_cgi UUID; v_gpe UUID;
  v_amo UUID; v_gil UUID; v_cal UUID; v_zan UUID; v_din UUID;
  v_jom UUID; v_lew UUID; v_lul UUID; v_gle UUID; v_jan UUID;
  v_lin UUID; v_jaw UUID; v_ran UUID; v_hum UUID;
  c_ant UUID; c_vio UUID; c_abu UUID; c_obs UUID; c_ame UUID;
  c_int UUID; c_odi UUID; c_des UUID; c_aut UUID; c_cor UUID;
BEGIN
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jza FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fbr FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_amo FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli saca arma e persegue homem nas ruas de São Paulo na véspera do segundo turno.', 'Deita no chão! Deita no chão, porra!', 'Vídeos mostram a deputada com pistola em punho perseguindo Luan Araújo em Jardins, SP, véspera do segundo turno da eleição presidencial.', 'verified', true, '2022-10-29', 'https://g1.globo.com/sp/sao-paulo/noticia/2022/10/29/deputada-carla-zambelli-saca-arma-e-persegue-homem-em-sp.ghtml', 'news_article', 5, 'Jardins, São Paulo', 'Perseguição armada', 'zambelli-arma-jardins-b140-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli nega crime e diz que agiu em legítima defesa após perseguição armada.', 'Fui agredida fisicamente e verbalmente. Apenas me defendi de uma tentativa de agressão.', 'Primeira declaração pública da deputada após o episódio viralizar nas redes sociais.', 'verified', false, '2022-10-30', 'https://www.cnnbrasil.com.br/politica/zambelli-diz-que-agiu-em-legitima-defesa-apos-perseguicao-armada/', 'news_article', 2, 'Redes sociais', 'Pronunciamento', 'zambelli-legitima-defesa-b140-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro minimiza caso de Zambelli dizendo que ela foi provocada.', 'Foi provocada, né? Pelo que a gente viu, ela foi provocada.', 'Comentário em entrevista no Palácio da Alvorada após questionamento de jornalistas.', 'verified', true, '2022-10-30', 'https://www.poder360.com.br/eleicoes/bolsonaro-zambelli-foi-provocada-diz-presidente/', 'news_article', 3, 'Palácio da Alvorada', 'Entrevista coletiva', 'bolsonaro-zambelli-provocada-b140-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira reage à sua própria prisão após condenação pelo STF dizendo ser um mártir.', 'Sou um prisioneiro político. A história vai me absolver.', 'Declaração após condenação do STF por ataques ao Judiciário em vídeo com palavrões contra ministros.', 'verified', true, '2022-11-04', 'https://www.conjur.com.br/2022-nov-04/stf-condena-silveira-pena-87-anos-prisao', 'news_article', 4, 'Petrópolis, RJ', 'Cumprimento de prisão', 'silveira-prisioneiro-politico-b140-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro acusa STF de perseguir Silveira e pede intervenção internacional.', 'O STF criou um preso político no Brasil. O mundo precisa enxergar isso.', 'Postagem em inglês no X voltada a público internacional após prisão de Silveira.', 'verified', false, '2022-11-05', 'https://www.metropoles.com/brasil/eduardo-bolsonaro-silveira-preso-politico', 'news_article', 3, 'Redes sociais', 'Postagem internacional', 'eduardo-silveira-preso-politico-b140-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina prisão preventiva de Zambelli por porte ilegal de arma.', 'A conduta revela desprezo pela legislação e risco concreto à ordem pública.', 'Decisão monocrática após novos vídeos do episódio dos Jardins e ameaças posteriores.', 'verified', true, '2022-11-12', 'https://www.stf.jus.br/arquivo/cms/noticiaNoticiaStf/anexo/decisao-zambelli-moraes.pdf', 'other', 2, 'STF', 'Decisão PET', 'moraes-zambelli-decisao-b140-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem rejeita acusação de usar Abin contra adversários de Bolsonaro.', 'A Abin nunca foi usada para perseguir ninguém. Tudo o que fizemos foi dentro da lei.', 'Entrevista após reportagem do G1 revelar monitoramento paralelo na gestão de Ramagem na Abin.', 'verified', false, '2023-01-20', 'https://g1.globo.com/politica/noticia/2023/01/20/ramagem-nega-uso-politico-da-abin.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'ramagem-nega-abin-b140-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ataca Moraes após ser indiciada pela PF por invasão hacker ao CNJ.', 'Moraes é o verdadeiro criminoso. Ele orquestra tudo para nos destruir.', 'Live no Youtube após PF concluir que a deputada encomendou invasão ao CNJ com o hacker Delgatti.', 'verified', true, '2023-08-17', 'https://www.folha.uol.com.br/poder/2023/08/pf-indicia-zambelli-invasao-cnj-delgatti.shtml', 'news_article', 4, 'Redes sociais', 'Live após indiciamento', 'zambelli-ataca-moraes-cnj-b140-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira descumpre tornozeleira eletrônica e manda recado a Moraes.', 'Não me curvo a nenhum ditador de toga. Podem vir me prender de novo.', 'Live em que retirou pulseira eletrônica para falar aos seguidores, violando medidas cautelares.', 'verified', true, '2023-02-20', 'https://www.uol.com.br/noticias/daniel-silveira-tornozeleira-moraes-prisao', 'news_article', 4, 'Petrópolis, RJ', 'Live', 'silveira-tornozeleira-moraes-b140-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende auto-exílio nos EUA para evitar perseguição política.', 'Vou para onde eu puder falar livremente. No Brasil não há mais liberdade.', 'Declaração após confirmar que passaria temporadas nos EUA em meio a investigações contra a família.', 'verified', true, '2024-03-15', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-diz-que-vai-morar-nos-eua/', 'news_article', 3, 'Miami, EUA', 'Entrevista', 'eduardo-exilio-eua-b140-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'TRE-SP cassa mandato de Carla Zambelli por abuso de poder político e econômico.', 'A conduta da parlamentar feriu de morte a normalidade do pleito.', 'Decisão unânime do TRE-SP cassando mandato e declarando inelegibilidade por 8 anos devido ao episódio dos Jardins.', 'verified', true, '2025-01-23', 'https://www.tre-sp.jus.br/imprensa/noticias/2025/Janeiro/tre-sp-cassa-mandato-de-carla-zambelli', 'other', 1, 'TRE-SP', 'Julgamento AIJE', 'tre-sp-cassa-zambelli-b140-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli diz que cassação foi perseguição política e promete recorrer.', 'Essa cassação é política. Os ministros obedecem ao Moraes, não à Constituição.', 'Declaração nas redes após decisão do TRE-SP.', 'verified', true, '2025-01-23', 'https://www.metropoles.com/politica/zambelli-reage-cassacao-tre-sp', 'news_article', 3, 'Redes sociais', 'Reação à cassação', 'zambelli-cassacao-perseguicao-b140-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama cassação de Zambelli de golpe jurídico.', 'Cassaram o mandato dela para calar uma voz da direita. É um golpe jurídico.', 'Publicação no X após decisão do TRE-SP.', 'verified', false, '2025-01-24', 'https://www.oantagonista.com/politica/nikolas-cassacao-zambelli-golpe-juridico', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'nikolas-cassacao-golpe-b140-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende Zambelli e fala em criminalização da direita.', 'Está em curso um projeto de criminalizar todo parlamentar de direita.', 'Discurso em plenário após cassação de Zambelli.', 'verified', false, '2025-01-28', 'https://www.camara.leg.br/noticias/bia-kicis-defende-zambelli-cassacao', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento plenário', 'bia-defende-zambelli-b140-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann comemora cassação de Zambelli como vitória da democracia.', 'Quem aponta arma para eleitor não pode ocupar cadeira no Parlamento.', 'Publicação nas redes após julgamento do TRE-SP.', 'verified', false, '2025-01-23', 'https://www.pt.org.br/gleisi-comemora-cassacao-zambelli', 'social_media_post', 1, 'Redes sociais', 'Postagem', 'gleisi-comemora-cassacao-b140-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli xinga Moraes após audiência de instrução no caso do CNJ.', 'Esse bandido de toga ainda vai ser julgado por tudo que fez.', 'Declaração ao sair de audiência no STF no processo da invasão do CNJ.', 'verified', true, '2025-03-12', 'https://www.jota.info/justica/zambelli-xinga-moraes-cnj-audiencia', 'news_article', 4, 'STF', 'Audiência judicial', 'zambelli-xinga-moraes-cnj-b140-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes vota pela condenação de Zambelli a 10 anos pela invasão ao CNJ.', 'Houve dolo na contratação do hacker para adulterar decisões do CNJ, um atentado ao Estado de Direito.', 'Voto do relator na 1ª Turma do STF no julgamento da invasão do CNJ.', 'verified', true, '2025-05-14', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=zambelli-cnj-2025', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'moraes-voto-zambelli-cnj-b140-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino acompanha Moraes e vota pela condenação de Zambelli.', 'A prova é robusta e demonstra o conluio para fraudar a Justiça brasileira.', 'Voto na 1ª Turma do STF no caso da invasão ao CNJ.', 'verified', false, '2025-05-14', 'https://www.conjur.com.br/2025-mai-14/flavio-dino-condenacao-zambelli-cnj', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'dino-voto-zambelli-cnj-b140-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Cármen Lúcia reforça gravidade da invasão ao CNJ em seu voto.', 'Usar o hacker para fingir decisões do CNJ é delito gravíssimo contra as instituições.', 'Voto acompanhando relator na 1ª Turma do STF.', 'verified', false, '2025-05-14', 'https://www.poder360.com.br/justica/carmen-lucia-zambelli-cnj-stf', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'carmen-voto-zambelli-cnj-b140-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela condenação e reforça dolo de Zambelli no caso CNJ.', 'A deputada agiu com pleno conhecimento do plano criminoso orquestrado com o hacker.', 'Voto na 1ª Turma do STF.', 'verified', false, '2025-05-14', 'https://g1.globo.com/politica/noticia/2025/05/14/zanin-voto-zambelli-cnj.ghtml', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'zanin-voto-zambelli-cnj-b140-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli anuncia viagem aos EUA após condenação pelo CNJ, mas embarca para Itália.', 'Vou viajar para tratar da minha saúde e defender minha imagem fora do Brasil.', 'Fala em vídeo publicado um dia após condenação por invasão ao CNJ, deixando o país.', 'verified', true, '2025-06-04', 'https://www.folha.uol.com.br/poder/2025/06/zambelli-deixa-pais-condenacao-cnj.shtml', 'news_article', 4, 'Aeroporto de Guarulhos', 'Saída do Brasil', 'zambelli-anuncia-viagem-b140-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli confirma estar em Roma e afirma que não voltará para ser presa.', 'Estou na Itália. Não volto para ser enterrada viva por Alexandre de Moraes.', 'Declaração em live anunciando sua fuga para Itália, usando cidadania italiana para evitar extradição.', 'verified', true, '2025-07-04', 'https://www.bbc.com/portuguese/articles/zambelli-fuga-italia-2025', 'news_article', 4, 'Roma, Itália', 'Live anunciando fuga', 'zambelli-fuga-italia-b140-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes expede mandado de prisão internacional contra Zambelli após fuga.', 'A ré evadiu-se deliberadamente para obstruir a execução da pena. Difunda-se alerta via Interpol.', 'Decisão do relator acionando Interpol após confirmação da fuga para a Itália.', 'verified', true, '2025-07-05', 'https://www.conjur.com.br/2025-jul-05/moraes-expede-prisao-internacional-zambelli/', 'other', 1, 'STF', 'Decisão mandado prisão', 'moraes-prisao-internacional-zambelli-b140-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro parabeniza Zambelli por fugir do Brasil.', 'Ela fez bem. Quem ficar aqui vai ser massacrado por essa ditadura togada.', 'Postagem no X em apoio à deputada após anúncio da fuga.', 'verified', true, '2025-07-05', 'https://www.oantagonista.com/politica/eduardo-parabeniza-zambelli-fuga', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'eduardo-parabeniza-zambelli-b140-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas questiona se STF pretende prender todo parlamentar que recorra.', 'Se Zambelli é fugitiva, Lula também foi. O problema é sempre com a direita.', 'Pronunciamento no plenário da Câmara.', 'verified', false, '2025-07-07', 'https://www.camara.leg.br/noticias/nikolas-fugitivos-stf-zambelli', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'nikolas-stf-fugitivos-b140-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende Zambelli e diz que Brasil vive perseguição política.', 'A Carla foi empurrada para sair do Brasil. Isso é ditadura pura.', 'Entrevista a jornalistas em Brasília após fuga da deputada.', 'verified', true, '2025-07-06', 'https://www.metropoles.com/politica/bolsonaro-zambelli-perseguida', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-defende-zambelli-fuga-b140-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem critica fuga de Zambelli mas questiona rigor de Moraes.', 'Não concordo com fugir. Mas também não concordo com penas desproporcionais.', 'Entrevista após fuga da deputada, em posição mais moderada.', 'verified', false, '2025-07-08', 'https://www.gazetadopovo.com.br/vozes/marcel-van-hattem-zambelli-moraes', 'news_article', 2, 'Brasília', 'Entrevista', 'mvh-critica-fuga-modera-b140-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias pede cassação imediata do mandato de Zambelli por abandono.', 'Quem foge da Justiça não pode continuar com mandato parlamentar. Ponto.', 'Declaração na Câmara após confirmação da fuga.', 'verified', false, '2025-07-07', 'https://www12.senado.leg.br/noticias/lindbergh-cassacao-zambelli-fuga', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'lindbergh-cassacao-zambelli-b140-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes vota por nova condenação de Zambelli, desta vez por posse ilegal de arma.', 'Somada à condenação anterior, a conduta revela menosprezo contínuo pela lei.', 'Voto na 1ª Turma do STF no processo do episódio dos Jardins, em 2022.', 'verified', true, '2025-08-19', 'https://www.stf.jus.br/portal/noticia/zambelli-condenacao-arma-2025', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'moraes-voto-zambelli-arma-b140-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli diz de Roma que sentença é política e fala em asilo.', 'Vou pedir asilo se for preciso. O Brasil não é mais um país democrático.', 'Declaração em entrevista à imprensa italiana após nova condenação.', 'verified', true, '2025-08-20', 'https://www.repubblica.it/esteri/2025/08/20/news/zambelli-brasile-asilo-italia/', 'news_article', 3, 'Roma, Itália', 'Entrevista imprensa italiana', 'zambelli-roma-asilo-b140-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro diz que Zambelli é exemplo de como o STF fabrica criminosos.', 'O STF transformou uma deputada em foragida. Isso não é Justiça.', 'Entrevista na bancada do Senado após a segunda condenação.', 'verified', false, '2025-08-21', 'https://www.cnnbrasil.com.br/politica/flavio-zambelli-stf-criminosos/', 'news_article', 3, 'Senado Federal', 'Entrevista', 'flavio-zambelli-stf-b140-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'AGU Jorge Messias afirma que Itália tem tratado com Brasil para extradição de Zambelli.', 'Vamos buscar todos os instrumentos jurídicos para trazer a deputada ao país.', 'Entrevista coletiva na AGU após anúncio do mandado Interpol.', 'verified', false, '2025-08-22', 'https://www.gov.br/agu/pt-br/noticias/messias-extradicao-zambelli', 'other', 1, 'AGU', 'Coletiva', 'messias-extradicao-zambelli-b140-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira pede progressão para regime aberto após 3 anos em semiaberto.', 'Cumpri o que era preciso. Quero a progressão para construir minha vida de novo.', 'Petição enviada à VEP após cumprimento parcial da pena de 8 anos.', 'verified', false, '2025-07-10', 'https://www.jota.info/justica/daniel-silveira-progressao-regime', 'other', 1, 'VEP-RJ', 'Pedido de progressão', 'silveira-progressao-aberto-b140-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes autoriza progressão de Silveira ao regime aberto sob condições estritas.', 'A progressão é direito subjetivo do condenado desde que respeitadas todas as condicionantes.', 'Decisão monocrática concedendo regime aberto a Silveira com tornozeleira e monitoramento.', 'verified', true, '2025-09-05', 'https://www.conjur.com.br/2025-set-05/moraes-silveira-regime-aberto', 'other', 1, 'STF', 'Decisão progressão', 'moraes-silveira-aberto-b140-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira faz live provocando Moraes horas após obter regime aberto.', 'Obrigado, Xandão. Agora posso falar mais alto e mais longe.', 'Live logo após decisão de progressão, em tom provocativo ao ministro relator.', 'verified', true, '2025-09-05', 'https://www.folha.uol.com.br/poder/2025/09/silveira-live-moraes-regime-aberto.shtml', 'social_media_post', 4, 'Redes sociais', 'Live', 'silveira-live-provoca-moraes-b140-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes revoga regime aberto de Silveira por descumprimento após live.', 'As condições impostas foram imediatamente violadas. Retorna-se o regime fechado.', 'Decisão monocrática revogando a progressão poucos dias após concessão.', 'verified', true, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/moraes-revoga-regime-aberto-silveira.ghtml', 'other', 1, 'STF', 'Revogação', 'moraes-revoga-silveira-aberto-b140-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira, de volta à prisão, acusa Moraes de perseguição pessoal.', 'Esse homem tem obsessão por mim. É pessoal.', 'Entrevista por carta de dentro do presídio de Benfica.', 'verified', false, '2025-09-15', 'https://www.metropoles.com/brasil/silveira-moraes-obsessao-carta', 'news_article', 3, 'Presídio Benfica, RJ', 'Carta da prisão', 'silveira-moraes-obsessao-b140-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem nega envolvimento com PCC em reportagem do Intercept.', 'Nunca tive e nunca terei qualquer ligação com criminosos. Repudio essas acusações.', 'Resposta à reportagem que sugere contatos entre aliados de Ramagem e cúpula do PCC.', 'verified', true, '2024-11-10', 'https://www.intercept.com.br/2024/11/10/ramagem-pcc-ligacoes-abin', 'news_article', 3, 'Redes sociais', 'Resposta reportagem', 'ramagem-nega-pcc-b140-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem classifica investigação da Abin paralela como factoide político.', 'A chamada Abin paralela é ficção criada pela PF para agradar o governo Lula.', 'Declaração em plenário após denúncia da PGR sobre monitoramento ilegal.', 'verified', true, '2024-04-18', 'https://www.camara.leg.br/noticias/ramagem-abin-paralela-factoide', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'ramagem-abin-factoide-b140-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes aceita denúncia contra Ramagem por tentativa de golpe de Estado.', 'Recebo a denúncia. Há indícios suficientes da participação do acusado em trama golpista.', 'Decisão na 1ª Turma do STF acolhendo denúncia da PGR sobre plano golpista de 2022.', 'verified', true, '2025-03-26', 'https://www.stf.jus.br/portal/noticia/ramagem-denuncia-golpe-aceita', 'other', 1, 'STF', 'Acolhimento denúncia', 'moraes-aceita-denuncia-ramagem-b140-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem qualifica denúncia aceita como persecução política do STF.', 'Não cometi crime algum. Isso é perseguição política organizada.', 'Entrevista à imprensa após ter denúncia aceita pelo STF.', 'verified', false, '2025-03-26', 'https://www.poder360.com.br/justica/ramagem-denuncia-persecucao-stf/', 'news_article', 3, 'Brasília', 'Entrevista', 'ramagem-denuncia-perseguicao-b140-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis acusa STF de tratar Ramagem como inimigo pessoal.', 'Transformaram o Ramagem em bode expiatório da vingança do Judiciário.', 'Fala em plenário após aceitação da denúncia.', 'verified', false, '2025-03-27', 'https://www.oantagonista.com/politica/bia-kicis-ramagem-stf', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'bia-kicis-ramagem-b140-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz em Washington que Ramagem é alvo de caça às bruxas.', 'O Brasil está caçando bolsonaristas como se fossem inimigos do Estado.', 'Discurso em think tank em Washington sobre situação dos aliados de Bolsonaro.', 'verified', true, '2025-04-10', 'https://www.washingtonpost.com/world/2025/04/10/eduardo-bolsonaro-ramagem-witchhunt/', 'news_article', 3, 'Washington, EUA', 'Discurso em think tank', 'eduardo-washington-ramagem-b140-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes vota pela condenação de Ramagem a 16 anos no núcleo 1 do golpe.', 'O réu operou estrutura de inteligência contra autoridades e a ordem democrática.', 'Voto no julgamento da trama golpista na 1ª Turma do STF.', 'verified', true, '2025-09-11', 'https://www.stf.jus.br/portal/noticia/ramagem-condenacao-golpe-16-anos', 'other', 1, 'STF', 'Julgamento 1ª Turma', 'moraes-condena-ramagem-16-b140-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem rejeita condenação e anuncia que vai recorrer a tribunais internacionais.', 'Levarei esse caso à ONU e à CIDH. Isso não é justiça, é vingança.', 'Entrevista após condenação a 16 anos na 1ª Turma do STF.', 'verified', true, '2025-09-11', 'https://www.bbc.com/portuguese/articles/ramagem-16-anos-stf', 'news_article', 3, 'Brasília', 'Entrevista', 'ramagem-onu-cidh-b140-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'AGU Messias celebra condenação de Ramagem como vitória do Estado Democrático.', 'Ninguém que tentar golpe contra a democracia ficará impune neste país.', 'Nota da AGU após condenação de Ramagem.', 'verified', false, '2025-09-11', 'https://www.gov.br/agu/pt-br/noticias/messias-ramagem-condenacao-golpe', 'other', 1, 'AGU', 'Nota oficial', 'messias-ramagem-condenacao-b140-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem embarca para Miami dois dias após condenação em voo privado.', 'Estou indo cuidar da minha saúde e dar entrevistas. Voltarei em breve.', 'Declaração gravada antes do embarque no Aeroporto de Jacarepaguá, horas antes de a PF tentar executar mandado.', 'verified', true, '2025-09-13', 'https://www.folha.uol.com.br/poder/2025/09/ramagem-fuga-miami-voo-privado.shtml', 'news_article', 4, 'Jacarepaguá, RJ', 'Embarque para Miami', 'ramagem-voo-miami-b140-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina busca e prisão internacional contra Ramagem após fuga.', 'Caracterizada a fuga, acolho o pedido da PGR de inclusão na difusão vermelha da Interpol.', 'Decisão monocrática emitida horas após Ramagem deixar o país.', 'verified', true, '2025-09-14', 'https://www.conjur.com.br/2025-set-14/moraes-prisao-internacional-ramagem', 'other', 1, 'STF', 'Decisão Interpol', 'moraes-interpol-ramagem-b140-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo comemora chegada de Ramagem aos EUA e promete articulação política.', 'O Alexandre está seguro. Vamos organizar aqui a resistência contra o regime de Moraes.', 'Vídeo gravado ao lado de Ramagem em Miami após a fuga.', 'verified', true, '2025-09-15', 'https://www.reuters.com/world/americas/eduardo-bolsonaro-ramagem-miami/', 'news_article', 4, 'Miami, EUA', 'Vídeo conjunto', 'eduardo-ramagem-miami-b140-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende Ramagem como vítima de perseguição.', 'O Alexandre sempre foi um servidor exemplar. Não merecia isso.', 'Declaração em Brasília após fuga de Ramagem.', 'verified', false, '2025-09-16', 'https://www.cnnbrasil.com.br/politica/bolsonaro-defende-ramagem-fuga/', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-defende-ramagem-b140-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas classifica fuga de Ramagem como exílio imposto pelo STF.', 'Exilaram mais um brasileiro. A lista cresce todo mês.', 'Publicação no X após fuga de Ramagem.', 'verified', false, '2025-09-15', 'https://www.oantagonista.com/politica/nikolas-ramagem-exilio', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'nikolas-ramagem-exilio-b140-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica fuga de Ramagem e diz que brasileiros serão trazidos para cumprir pena.', 'Ninguém pode fugir da Justiça brasileira. Vamos buscar todos os foragidos.', 'Declaração em entrevista coletiva após fuga de Ramagem.', 'verified', true, '2025-09-16', 'https://www.gov.br/planalto/pt-br/noticias/lula-ramagem-fuga-justica', 'other', 1, 'Palácio do Planalto', 'Coletiva', 'lula-ramagem-fuga-b140-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe aciona Câmara para cassar mandato de Ramagem por abandono.', 'Quem foge do país deve ser imediatamente cassado. Não é possível manter deputado foragido.', 'Entrevista após protocolo de representação na Câmara.', 'verified', false, '2025-09-17', 'https://www12.senado.leg.br/noticias/randolfe-cassacao-ramagem', 'news_article', 1, 'Senado Federal', 'Coletiva', 'randolfe-cassacao-ramagem-b140-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano diz que Ramagem fez o certo em buscar asilo nos EUA.', 'Fez bem. Aqui seria preso injustamente. Lá terá condições de se defender.', 'Fala em culto religioso após fuga do deputado aliado.', 'verified', false, '2025-09-18', 'https://www.metropoles.com/politica/marco-feliciano-ramagem-asilo', 'news_article', 3, 'São Paulo', 'Culto religioso', 'feliciano-ramagem-asilo-b140-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves critica Moraes e defende anistia ampla para golpistas.', 'Chega de prender inocentes. Anistia já para todos esses brasileiros de bem.', 'Discurso no Senado após fuga de Ramagem.', 'verified', true, '2025-09-24', 'https://www12.senado.leg.br/noticias/damares-anistia-ampla-golpistas', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'damares-anistia-golpistas-b140-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende Ramagem e acusa PF de fabricar provas.', 'A PF virou braço político. Fabricaram tudo contra o Alexandre.', 'Live em canal bolsonarista após condenação e fuga de Ramagem.', 'verified', false, '2025-09-19', 'https://www.oantagonista.com/politica/magno-malta-ramagem-pf', 'social_media_post', 3, 'Redes sociais', 'Live', 'magno-malta-ramagem-pf-b140-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica atitude de Ramagem e defende enfrentamento interno.', 'Fugir não é opção. Tem que enfrentar a Justiça aqui, não lá fora.', 'Declaração em entrevista na Rádio Guaíba após fuga.', 'verified', true, '2025-09-18', 'https://www.gauchazh.clicrbs.com.br/mourao-ramagem-fugir-nao-e-opcao', 'news_article', 2, 'Porto Alegre', 'Entrevista rádio', 'mourao-ramagem-fugir-b140-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sérgio Moro diz que fuga de Ramagem mancha imagem da oposição.', 'Fuga nunca é a resposta. Cabe sempre enfrentar o devido processo legal.', 'Pronunciamento no Senado após repercussão da fuga.', 'verified', false, '2025-09-17', 'https://www12.senado.leg.br/noticias/moro-fuga-ramagem-imagem', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'moro-fuga-ramagem-b140-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri condena fuga de Ramagem e Zambelli.', 'A direita séria não pode endossar quem foge. Isso nos enfraquece.', 'Fala em painel político em São Paulo.', 'verified', false, '2025-09-20', 'https://www.gazetadopovo.com.br/vozes/kim-kataguiri-fuga-direita', 'news_article', 1, 'São Paulo', 'Painel político', 'kim-condena-fugas-b140-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silveira, em entrevista da prisão, defende armamento popular contra STF.', 'O povo armado é o último antídoto contra a tirania togada.', 'Entrevista feita por áudio vazado pelas redes a partir de presídio no RJ.', 'verified', true, '2025-10-05', 'https://www.uol.com.br/noticias/silveira-armamento-stf-audio-prisao', 'news_article', 5, 'Presídio Benfica, RJ', 'Áudio vazado', 'silveira-armamento-stf-b140-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes abre novo inquérito contra Silveira por áudio de incitação armada.', 'Configura-se nova incitação à violência contra instituições, apta a novo inquérito.', 'Decisão aberta após circulação do áudio em grupos bolsonaristas.', 'verified', true, '2025-10-06', 'https://www.conjur.com.br/2025-out-06/moraes-novo-inquerito-silveira-audio/', 'other', 1, 'STF', 'Novo inquérito', 'moraes-novo-inquerito-silveira-b140-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli, em Roma, grava vídeo pedindo intervenção internacional.', 'Peço ao governo italiano que nos proteja do regime autoritário brasileiro.', 'Vídeo publicado em rede social após condenação por arma.', 'verified', true, '2025-10-12', 'https://www.repubblica.it/esteri/zambelli-video-intervento-internazionale', 'social_media_post', 3, 'Roma, Itália', 'Vídeo em redes', 'zambelli-intervencao-internacional-b140-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita criticar fugitivos e fala em pacificação.', 'Precisamos de pacificação. Brigas não resolvem o problema.', 'Entrevista em SP após repercussão das fugas.', 'verified', false, '2025-10-15', 'https://www.folha.uol.com.br/poder/2025/10/tarcisio-pacificacao-fugitivos.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'tarcisio-pacificacao-fugitivos-b140-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal diz que foragidos são vítimas do sistema.', 'Eles só foram embora porque o sistema está contra a direita.', 'Live do empresário em canal no YouTube.', 'verified', false, '2025-10-17', 'https://www.metropoles.com/brasil/marcal-foragidos-sistema', 'social_media_post', 3, 'Redes sociais', 'Live', 'marcal-foragidos-vitimas-b140-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende Silveira e acusa STF de violar direitos humanos.', 'O que fazem com o Daniel Silveira é crime contra a humanidade.', 'Discurso no plenário da Câmara.', 'verified', false, '2025-10-08', 'https://www.camara.leg.br/noticias/girao-silveira-direitos-humanos', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'girao-silveira-dh-b140-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Julia Zanatta defende Zambelli e fala em ditadura de Moraes.', 'O Brasil vive uma ditadura togada. A Carla é prova disso.', 'Live na Câmara após condenações de Zambelli.', 'verified', false, '2025-10-10', 'https://www.oantagonista.com/politica/julia-zanatta-zambelli-ditadura', 'social_media_post', 3, 'Redes sociais', 'Live', 'julia-zanatta-zambelli-b140-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson afirma que STF persegue militares e policiais aliados.', 'Todo militar ou policial ligado ao Bolsonaro vira alvo. Isso não é coincidência.', 'Discurso em plenário após condenação de Ramagem.', 'verified', false, '2025-09-25', 'https://www.camara.leg.br/noticias/sanderson-stf-militares', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'sanderson-stf-militares-b140-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros propõe suspensão de relações diplomáticas após extradição.', 'Se a Itália entregar a Zambelli, devemos cortar relações.', 'Declaração após avanço de pedido de extradição na Itália.', 'verified', false, '2025-11-22', 'https://www.camara.leg.br/noticias/filipe-barros-diplomacia-italia', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'filipe-barros-italia-diplomacia-b140-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto pede impeachment de Moraes após onda de prisões de bolsonaristas.', 'Moraes precisa sair. Está prendendo políticos e fabricando fugitivos.', 'Discurso em plenário defendendo impeachment de Moraes.', 'verified', false, '2025-10-22', 'https://www.camara.leg.br/noticias/cabo-gilberto-impeachment-moraes', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'cabo-gilberto-impeachment-b140-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto diz que brasileiros estão sendo forçados ao exílio.', 'Brasileiros de bem estão sendo empurrados para o exílio. Isso é inédito.', 'Fala no plenário da Câmara.', 'verified', false, '2025-10-24', 'https://www.camara.leg.br/noticias/guiga-peixoto-exilio-brasileiros', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'guiga-peixoto-exilio-b140-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro visita Zambelli em Roma e publica foto.', 'Em Roma com uma guerreira perseguida. Deus no comando.', 'Publicação no Instagram durante visita à deputada em fuga.', 'verified', true, '2025-11-03', 'https://www.cnnbrasil.com.br/politica/michelle-visita-zambelli-roma/', 'social_media_post', 3, 'Roma, Itália', 'Visita', 'michelle-visita-zambelli-b140-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro chama Moraes de arquiteto da perseguição total.', 'O verdadeiro ditador desse país é o Xandão. A família Bolsonaro sabe.', 'Publicação no X após visita de Michelle a Zambelli.', 'verified', false, '2025-11-04', 'https://www.oantagonista.com/politica/carlos-bolsonaro-moraes-ditador', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'carlos-moraes-ditador-b140-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'André Janones ironiza fuga de Zambelli e Ramagem.', 'Os heróis da pátria fugiram. Que coincidência.', 'Publicação no X após novas prisões de aliados de Bolsonaro.', 'verified', false, '2025-10-12', 'https://www.cnnbrasil.com.br/politica/janones-ironia-fuga-bolsonaristas/', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'janones-ironia-fuga-b140-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa apresenta PL que facilita extradição de parlamentares foragidos.', 'Quem foge não pode receber salário. Está mais do que na hora.', 'Coletiva após apresentação do projeto.', 'verified', false, '2025-10-28', 'https://www12.senado.leg.br/noticias/humberto-costa-extradicao-parlamentares', 'news_article', 1, 'Senado Federal', 'Coletiva', 'humberto-costa-pl-extradicao-b140-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner defende atuação firme do STF contra foragidos.', 'Quem tenta golpe e foge deve ter todo peso da lei contra si.', 'Fala em plenário do Senado.', 'verified', false, '2025-10-30', 'https://www12.senado.leg.br/noticias/jaques-wagner-stf-foragidos', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'jaques-wagner-stf-b140-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem denuncia STF à Anistia Internacional em Washington.', 'Estou aqui para mostrar ao mundo que o Brasil já não é mais uma democracia.', 'Entrevista em evento da Anistia Internacional em Washington.', 'verified', true, '2025-11-10', 'https://www.nytimes.com/2025/11/10/world/americas/ramagem-amnesty-washington.html', 'news_article', 3, 'Washington, EUA', 'Evento Anistia Internacional', 'ramagem-anistia-washington-b140-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli grava mensagem a Trump pedindo sanções ao STF.', 'Presidente Trump, ajude o Brasil. Sancione os ministros togados.', 'Vídeo em rede social direcionado ao presidente americano.', 'verified', true, '2025-11-15', 'https://www.reuters.com/world/americas/zambelli-video-trump-stf-sanctions/', 'social_media_post', 5, 'Roma, Itália', 'Vídeo a Trump', 'zambelli-video-trump-b140-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula com congressistas americanos sanções a Moraes.', 'Já apresentei o caso ao Congresso americano. Moraes precisa pagar lá fora.', 'Entrevista à Fox News sobre articulação com republicanos.', 'verified', true, '2025-11-18', 'https://www.foxnews.com/politics/eduardo-bolsonaro-moraes-sanctions-congress', 'news_article', 5, 'Washington, EUA', 'Entrevista Fox News', 'eduardo-fox-sancoes-moraes-b140-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes cassa mandato de Zambelli por abandono do cargo.', 'Configurado o abandono, perde-se o mandato automaticamente.', 'Decisão monocrática do STF reconhecendo perda do mandato de Zambelli.', 'verified', true, '2025-12-02', 'https://www.stf.jus.br/portal/noticia/moraes-cassa-mandato-zambelli-abandono', 'other', 1, 'STF', 'Decisão cassação', 'moraes-cassa-mandato-zambelli-b140-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli reage à perda de mandato e chama Moraes de ditador.', 'O ditador Alexandre de Moraes acaba de consumar o golpe contra uma eleita pelo povo.', 'Vídeo publicado após decisão do STF.', 'verified', true, '2025-12-02', 'https://www.folha.uol.com.br/poder/2025/12/zambelli-reage-cassacao-ditador.shtml', 'social_media_post', 4, 'Roma, Itália', 'Vídeo reação', 'zambelli-reage-cassacao-b140-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro compara perda de mandato de Zambelli a regimes totalitários.', 'Isso só acontece em ditaduras. Venezuela, Cuba e agora Brasil.', 'Declaração à imprensa após cassação do mandato.', 'verified', true, '2025-12-03', 'https://www.cnnbrasil.com.br/politica/bolsonaro-cassacao-zambelli-venezuela/', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-cassacao-venezuela-b140-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que sucessora de Zambelli seguirá a linha da titular.', 'A voz da Carla não será silenciada. Vamos manter o legado.', 'Entrevista sobre suplente que assumirá a cadeira.', 'verified', false, '2025-12-04', 'https://www.metropoles.com/politica/nikolas-suplente-zambelli-legado', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'nikolas-suplente-zambelli-b140-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia que Ministério da Justiça já trabalha pela extradição.', 'Temos cooperação internacional ativa para trazer foragidos de volta.', 'Entrevista coletiva no MJ após cassação de Zambelli.', 'verified', false, '2025-12-05', 'https://www.gov.br/mj/pt-br/noticias/lewandowski-extradicao-foragidos', 'other', 1, 'Ministério da Justiça', 'Coletiva', 'lewandowski-extradicao-foragidos-b140-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli recorre à corte italiana contra pedido de extradição.', 'Tenho cidadania italiana. A Justiça italiana saberá reconhecer que sou perseguida política.', 'Declaração após recurso apresentado à Corte d''Appello em Roma.', 'verified', true, '2026-01-20', 'https://www.corriere.it/politica/estradizione-zambelli-appello-roma', 'news_article', 3, 'Roma, Itália', 'Entrevista imprensa', 'zambelli-recurso-italiano-b140-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes envia nova documentação à Itália reforçando pedido de extradição.', 'Encaminhadas 1.200 páginas comprovando crimes comuns não abrangidos por asilo político.', 'Despacho em cooperação internacional ao Ministério da Justiça italiano.', 'verified', false, '2026-02-10', 'https://www.conjur.com.br/2026-fev-10/moraes-italia-extradicao-zambelli/', 'other', 1, 'STF', 'Despacho cooperação', 'moraes-italia-documentacao-b140-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é presa em Roma após decisão favorável da Justiça italiana.', 'Fui presa injustamente. Isso é perseguição política transnacional.', 'Vídeo gravado por terceiros na saída de apartamento em Roma durante a prisão.', 'verified', true, '2026-03-14', 'https://www.reuters.com/world/europe/italian-police-detain-brazilian-zambelli-extradition/', 'news_article', 2, 'Roma, Itália', 'Prisão em Roma', 'zambelli-presa-roma-b140-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que prisão de Zambelli na Itália é vergonha internacional.', 'O mundo está vendo: o Brasil é uma ditadura e persegue sua própria gente.', 'Entrevista à Band após notícia da prisão de Zambelli.', 'verified', true, '2026-03-14', 'https://www.band.uol.com.br/noticias/bolsonaro-zambelli-italia-vergonha', 'news_article', 3, 'Brasília', 'Entrevista Band', 'bolsonaro-zambelli-vergonha-b140-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro apresenta representação contra governo italiano.', 'Quero ver se a Itália vai mesmo entregar uma parlamentar brasileira.', 'Entrevista no Senado após prisão de Zambelli em Roma.', 'verified', false, '2026-03-15', 'https://www12.senado.leg.br/noticias/flavio-bolsonaro-italia-zambelli', 'news_article', 3, 'Senado Federal', 'Coletiva', 'flavio-representacao-italia-b140-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula celebra cooperação italiana e pede paciência com extradição.', 'A Justiça italiana está agindo de forma madura. Vamos aguardar o rito.', 'Declaração a jornalistas em viagem ao Chile.', 'verified', true, '2026-03-16', 'https://www.gov.br/planalto/pt-br/noticias/lula-italia-extradicao-zambelli', 'other', 1, 'Santiago, Chile', 'Coletiva em viagem', 'lula-italia-extradicao-b140-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli, em prisão italiana, grava áudio pedindo intervenção dos EUA.', 'Pedem que os EUA intervenham. Estou sendo entregue para a ditadura de Moraes.', 'Áudio vazado por familiares a partir do presídio feminino de Rebibbia.', 'verified', true, '2026-03-25', 'https://www.repubblica.it/cronaca/zambelli-audio-rebibbia-trump', 'news_article', 4, 'Rebibbia, Roma', 'Áudio vazado', 'zambelli-audio-rebibbia-b140-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo afirma que prisão de Zambelli é show internacional de Moraes.', 'O Alexandre de Moraes é um exportador de autoritarismo. Chegou à Itália.', 'Publicação no X após prisão da aliada.', 'verified', true, '2026-03-14', 'https://www.oantagonista.com/politica/eduardo-bolsonaro-zambelli-moraes-show', 'social_media_post', 3, 'Miami, EUA', 'Postagem', 'eduardo-zambelli-show-b140-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem elogia Zambelli em vídeo após prisão em Roma.', 'A Carla é heroína. Não se calou e pagou o preço por nós todos.', 'Vídeo gravado em Orlando e publicado em rede social.', 'verified', true, '2026-03-15', 'https://www.cnnbrasil.com.br/politica/ramagem-zambelli-heroina-video/', 'social_media_post', 3, 'Orlando, EUA', 'Vídeo apoio', 'ramagem-elogio-zambelli-b140-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes destaca que extradição de Zambelli reforça cooperação internacional.', 'A cooperação jurídica entre democracias é a melhor resposta ao golpismo.', 'Discurso em evento do CNJ sobre cooperação penal internacional.', 'verified', false, '2026-03-30', 'https://www.cnj.jus.br/moraes-cooperacao-internacional-zambelli', 'other', 1, 'CNJ', 'Evento cooperação', 'moraes-cooperacao-zambelli-b140-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro promete visitar Zambelli na prisão italiana.', 'Vou a Roma novamente. Ela não pode ficar sozinha nesse calvário.', 'Publicação no Instagram após prisão de Zambelli.', 'verified', false, '2026-03-16', 'https://www.metropoles.com/politica/michelle-visita-zambelli-prisao-roma', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'michelle-visita-zambelli-prisao-b140-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita comentar extradição e fala em rule of law.', 'Vamos respeitar o rule of law. Justiça deve prevalecer sempre.', 'Entrevista em evento do governo paulista.', 'verified', false, '2026-03-20', 'https://www.folha.uol.com.br/poder/2026/03/tarcisio-extradicao-rule-of-law.shtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'tarcisio-rule-of-law-b140-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sérgio Moro defende respeito à Justiça italiana no caso Zambelli.', 'Se a Itália decidir extraditá-la, cabe a todos respeitar.', 'Coletiva no Senado.', 'verified', false, '2026-03-22', 'https://www12.senado.leg.br/noticias/moro-italia-zambelli-respeito', 'news_article', 1, 'Senado Federal', 'Coletiva', 'moro-respeito-italia-zambelli-b140-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli adere à greve de fome em Rebibbia, afirma advogado.', 'Estou em greve de fome contra a perseguição política brasileira.', 'Carta divulgada pelo defensor público italiano da deputada.', 'verified', true, '2026-04-02', 'https://www.corriere.it/cronaca/zambelli-sciopero-fame-rebibbia', 'news_article', 3, 'Rebibbia, Roma', 'Carta advogado', 'zambelli-greve-fome-b140-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis denuncia tratamento de Zambelli na prisão italiana.', 'A Carla está sofrendo maus tratos. Cadê a ONU e a OEA?', 'Discurso em plenário após greve de fome anunciada.', 'verified', false, '2026-04-03', 'https://www.camara.leg.br/noticias/bia-kicis-zambelli-greve-fome', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'bia-kicis-zambelli-greve-b140-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota pela execução provisória da pena de Zambelli.', 'Esgotada a via recursal, a pena deve ser executada sem retardos.', 'Voto no agravo contra execução provisória.', 'verified', false, '2026-04-08', 'https://www.conjur.com.br/2026-abr-08/dino-zambelli-execucao-provisoria/', 'other', 1, 'STF', 'Agravo', 'dino-zambelli-execucao-b140-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'AGU Messias afirma que extradição de Zambelli é ponto de inflexão.', 'Passa uma mensagem clara: não há refúgio para quem atenta contra a democracia.', 'Coletiva após decisão italiana favorável à extradição.', 'verified', true, '2026-04-10', 'https://www.gov.br/agu/pt-br/noticias/messias-extradicao-zambelli-inflexao', 'other', 1, 'AGU', 'Coletiva', 'messias-extradicao-inflexao-b140-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
