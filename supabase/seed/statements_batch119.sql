-- Batch 119: Defense + military + Jan 8 aftermath + police (continuation, Jan 2023 - Apr 2026)
DO $$
DECLARE
  v_muc UUID; v_lew UUID; v_rui UUID; v_lul UUID; v_jair UUID;
  v_mou UUID; v_mor UUID; v_din UUID; v_mes UUID; v_edu UUID;
  v_fla UUID; v_car UUID; v_ram UUID; v_zam UUID; v_sil UUID;
  v_cas UUID; v_tar UUID; v_cai UUID; v_wil UUID; v_mvh UUID;
  v_nik UUID; v_bia UUID; v_gir UUID; v_jul UUID; v_san UUID;
  v_fib UUID; v_cgi UUID; v_gui UUID; v_chi UUID; v_jan UUID;
  v_frx UUID; v_ors UUID; v_ran UUID; v_jaq UUID; v_lin UUID;
  v_sim UUID; v_had UUID; v_pgu UUID; v_sal UUID;
  c_ant UUID; c_vio UUID; c_aut UUID; c_abu UUID; c_odi UUID;
  c_obs UUID; c_ame UUID; c_con UUID; c_int UUID; c_irr UUID;
  c_cor UUID;
BEGIN
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gui FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_frx FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_jaq FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_sim FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_pgu FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende reforma do Estatuto Militar para restringir atuação política.', 'Militar da ativa não pode fazer política. Vamos propor mudanças no estatuto para deixar isso claro.', 'Declaração após reunião com comandantes sobre disciplina nas Forças Armadas.', 'verified', true, '2024-05-14', 'https://www1.folha.uol.com.br/poder/2024/05/mucio-estatuto-militar-politica.shtml', 'news_article', 1, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-estatuto-militar-b119-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é indiciado pela PF por tentativa de golpe de Estado.', 'Estão inventando crimes para me tirar da disputa eleitoral. É perseguição política pura.', 'Reação após indiciamento formal pela Polícia Federal no inquérito da trama golpista.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/bolsonaro-indiciado-pf-golpe.ghtml', 'news_article', 5, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-indiciado-golpe-b119-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes vota pela aceitação de denúncia contra Bolsonaro e núcleo golpista.', 'Os indícios são robustos e demonstram organização criminosa voltada a romper a ordem democrática.', 'Voto do relator na Primeira Turma sobre recebimento da denúncia da PGR.', 'verified', true, '2025-03-26', 'https://www1.folha.uol.com.br/poder/2025/03/moraes-denuncia-bolsonaro-golpe.shtml', 'news_article', 1, 'STF', 'Sessão Primeira Turma', 'moraes-denuncia-golpe-b119-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende anistia ampla para envolvidos no 8 de janeiro.', 'Vamos lutar por anistia para todos os patriotas presos injustamente pela ditadura do STF.', 'Discurso durante ato na Avenida Paulista em defesa do pai.', 'verified', true, '2024-02-25', 'https://www.cnnbrasil.com.br/politica/eduardo-anistia-8-janeiro-paulista/', 'news_article', 4, 'Avenida Paulista', 'Ato bolsonarista', 'eduardo-anistia-paulista-b119-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula PL da anistia ampla geral no Senado.', 'Vamos trabalhar para aprovar anistia ampla, geral e irrestrita para os presos políticos.', 'Declaração após reunião de líderes bolsonaristas no Senado.', 'verified', true, '2024-03-12', 'https://oglobo.globo.com/politica/flavio-bolsonaro-pl-anistia-senado/', 'news_article', 4, 'Senado Federal', 'Reunião de líderes', 'flavio-pl-anistia-b119-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino anuncia Força Nacional para reforço em Brasília após 8 de janeiro.', 'A Força Nacional ficará em Brasília o tempo necessário para garantir a ordem democrática.', 'Anúncio após pedido de intervenção federal no Distrito Federal.', 'verified', false, '2023-01-10', 'https://g1.globo.com/politica/noticia/2023/01/10/dino-forca-nacional-brasilia.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de imprensa', 'dino-forca-nacional-b119-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro defende ações policiais letais em comunidades do Rio.', 'Polícia que não mata bandido não é polícia. Tem que dar tiro certeiro nos criminosos.', 'Entrevista após operação com 28 mortos no Complexo do Salgueiro.', 'verified', true, '2023-10-05', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2023/10/05/castro-defende-operacao-salgueiro.ghtml', 'news_article', 4, 'Palácio Guanabara', 'Entrevista coletiva', 'castro-tiro-certeiro-b119-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende blindagem de policiais militares processados em SP.', 'Nenhum policial que cumpre seu dever será deixado para trás. Vamos blindar nossa tropa.', 'Fala durante formatura de turma da Polícia Militar em meio a operação com 56 mortos.', 'verified', true, '2024-08-30', 'https://www1.folha.uol.com.br/cotidiano/2024/08/tarcisio-blindar-policia-sp.shtml', 'news_article', 4, 'Academia do Barro Branco', 'Formatura PM', 'tarcisio-blindar-pm-b119-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende "licença para matar" de policiais em Goiás.', 'Policial nosso tem autorização para atirar. Bandido não tem direitos humanos.', 'Declaração durante inauguração de batalhão em Goiânia.', 'verified', true, '2023-07-18', 'https://www.metropoles.com/brasil/politica-br/caiado-licenca-matar-goias', 'news_article', 4, 'Goiânia', 'Inauguração de batalhão', 'caiado-licenca-matar-b119-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia reforma da Polícia Federal para atuação em crimes digitais.', 'Vamos estruturar a PF para enfrentar novos desafios como crimes cibernéticos e desinformação.', 'Anúncio durante posse de novo diretor-geral da PF.', 'verified', false, '2024-03-15', 'https://g1.globo.com/politica/noticia/2024/03/15/lewandowski-reforma-pf.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Posse na PF', 'lewandowski-reforma-pf-b119-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem nega uso político da Abin em depoimento à PF.', 'A Abin nunca foi usada politicamente. São fantasias da esquerda para criminalizar a direita.', 'Depoimento sobre supostos monitoramentos ilegais feitos durante governo Bolsonaro.', 'verified', true, '2024-02-07', 'https://oglobo.globo.com/politica/ramagem-nega-abin-politica/', 'news_article', 4, 'Brasília', 'Depoimento à PF', 'ramagem-nega-abin-b119-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada por perseguição armada em véspera de eleição.', 'Nunca apontei arma para ninguém. Foi legítima defesa contra um militante que me agrediu.', 'Reação após condenação pelo STF por episódio em bar de São Paulo em outubro de 2022.', 'verified', true, '2024-05-15', 'https://www1.folha.uol.com.br/poder/2024/05/zambelli-condenada-perseguicao-armada.shtml', 'news_article', 5, 'STF', 'Decisão de plenário', 'zambelli-condenada-arma-b119-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira volta à Câmara após indulto e promete vingança.', 'Vou voltar e fazer cada um desses ministros pagar pelo que fizeram comigo.', 'Declaração após receber indulto de Bolsonaro e voltar a circular em Brasília.', 'verified', true, '2023-01-03', 'https://www.poder360.com.br/congresso/silveira-vinganca-ministros/', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'silveira-vinganca-b119-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'Girão chama ministros do STF de "canalhas togados" em plenário.', 'Esses canalhas togados querem destruir a família brasileira e acabar com a liberdade.', 'Discurso na Câmara sobre decisões recentes da Corte sobre 8 de janeiro.', 'verified', true, '2024-04-10', 'https://www.metropoles.com/brasil/politica-br/girao-canalhas-togados-stf', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'girao-canalhas-togados-b119-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta usa cela cenográfica na Câmara para protestar contra prisões.', 'Aqui estão os presos políticos do Brasil. Lula é nosso ditador tropical.', 'Instalou cela cenográfica no plenário em protesto contra condenações.', 'verified', true, '2023-09-14', 'https://www.poder360.com.br/congresso/julia-zanatta-cela-camara/', 'news_article', 4, 'Câmara dos Deputados', 'Protesto em plenário', 'julia-zanatta-cela-b119-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende militares golpistas como "patriotas" em audiência.', 'Esses generais são patriotas que queriam salvar o Brasil. A história vai absolvê-los.', 'Pronunciamento em defesa de Braga Netto durante sessão da CPMI.', 'verified', false, '2023-09-28', 'https://www.cnnbrasil.com.br/politica/sanderson-defesa-militares-golpe/', 'news_article', 4, 'CPMI 8 de Janeiro', 'Pronunciamento', 'sanderson-patriotas-b119-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros faz obstrução em CPMI para proteger Bolsonaro.', 'Não vamos permitir que essa CPMI se transforme em tribunal de exceção contra o presidente.', 'Tática de obstrução para impedir avanço da CPMI do 8 de janeiro.', 'verified', false, '2023-06-21', 'https://oglobo.globo.com/politica/filipe-barros-obstrucao-cpmi/', 'news_article', 3, 'CPMI 8 de Janeiro', 'Obstrução', 'filipe-barros-obstrucao-b119-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto defende interpretação golpista do artigo 142.', 'As Forças Armadas têm o dever de garantir a ordem. Artigo 142 não é decoração.', 'Post em X defendendo interpretação golpista do art. 142 da Constituição.', 'verified', true, '2023-02-18', 'https://www.metropoles.com/brasil/politica-br/cabo-gilberto-142-intervencao', 'news_article', 5, 'X (Twitter)', 'Post em rede social', 'cabo-gilberto-142-b119-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gui, 'Guiga Peixoto defende anistia como "pacificação nacional".', 'O Brasil precisa de pacificação. Anistia é a única saída para unir o país.', 'Declaração durante sessão para tramitação do PL da anistia.', 'verified', false, '2024-04-08', 'https://www.poder360.com.br/congresso/guiga-anistia-pacificacao/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'guiga-anistia-pacificacao-b119-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar denuncia "cavalo de Troia" do PL da anistia.', 'Esse projeto é um cavalo de Troia para liberar Bolsonaro e golpistas. Não passará.', 'Pronunciamento contra tramitação do PL da anistia na Câmara.', 'verified', false, '2024-04-09', 'https://www1.folha.uol.com.br/poder/2024/04/chico-alencar-cavalo-troia-anistia.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-cavalo-troia-b119-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali cobra punição exemplar para militares golpistas.', 'Cada general que participou da trama golpista deve ir para a cadeia. Sem privilégios.', 'Discurso em plenário após indiciamento de militares pela PF.', 'verified', false, '2024-11-22', 'https://g1.globo.com/politica/noticia/2024/11/22/jandira-punicao-generais-golpe.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-punicao-generais-b119-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo cobra desmilitarização da segurança pública.', 'Precisamos desmilitarizar a polícia. O modelo atual produz violência e mortes evitáveis.', 'Entrevista sobre reforma da segurança pública no governo Lula.', 'verified', false, '2023-08-17', 'https://www.cnnbrasil.com.br/politica/freixo-desmilitarizar-policia/', 'news_article', 1, 'Brasília', 'Entrevista', 'freixo-desmilitarizar-b119-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem passaporte apreendido por ordem de Moraes.', 'Isso é perseguição escancarada. Querem me prender para me impedir de concorrer.', 'Reação após apreensão de passaporte na operação Tempus Veritatis.', 'verified', true, '2024-02-08', 'https://www1.folha.uol.com.br/poder/2024/02/bolsonaro-passaporte-apreendido.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-passaporte-apreendido-b119-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes detalha minuta do golpe em decisão da operação Tempus Veritatis.', 'A minuta do golpe previa prisão de autoridades e anulação das eleições, configurando crime grave.', 'Detalhamento na decisão que deflagrou a operação contra núcleo golpista.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/2024/02/08/moraes-minuta-golpe-tempus-veritatis.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-tempus-veritatis-b119-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende "resistência" a decisões do STF.', 'Não vamos obedecer decisões autoritárias. O povo tem o direito de resistir à tirania.', 'Discurso em plenário sobre decisões recentes de Moraes.', 'verified', true, '2024-03-05', 'https://www.metropoles.com/brasil/politica-br/nikolas-resistencia-stf', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-resistencia-stf-b119-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama 8 de janeiro de "manifestação pacífica".', 'Aquelas pessoas só queriam ser ouvidas. Foi uma manifestação pacífica que terminou em confusão.', 'Pronunciamento minimizando ataques do 8 de janeiro.', 'verified', true, '2023-01-16', 'https://oglobo.globo.com/politica/bia-kicis-8-janeiro-pacifica/', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'bia-kicis-pacifica-b119-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica indiciamento de Bolsonaro por tentativa de golpe.', 'Não vi nada que caracterize golpe. Isso é narrativa política da esquerda.', 'Pronunciamento no Senado após indiciamento de Bolsonaro pela PF.', 'verified', false, '2024-11-25', 'https://www.poder360.com.br/congresso/mourao-critica-indiciamento/', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'mourao-critica-indiciamento-b119-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende Bolsonaro e critica "criminalização" em ato.', 'Estamos com o presidente Bolsonaro. Essa criminalização tem que acabar.', 'Discurso em ato na Avenida Paulista em defesa de Bolsonaro.', 'verified', true, '2024-04-21', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/04/21/tarcisio-defende-bolsonaro-paulista.ghtml', 'news_article', 3, 'Avenida Paulista', 'Ato bolsonarista', 'tarcisio-paulista-b119-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro anuncia operação "Escudo 2" com 35 mortes na Baixada.', 'Vamos continuar dando resposta. Bandido bom é bandido enfrentado com força.', 'Declaração após nova operação policial com dezenas de mortos na Baixada Fluminense.', 'verified', true, '2024-10-17', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/10/17/castro-operacao-escudo-2.ghtml', 'news_article', 4, 'Palácio Guanabara', 'Coletiva de imprensa', 'castro-escudo-2-b119-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima defende Exército na segurança pública do Amazonas.', 'Precisamos das Forças Armadas nas fronteiras combatendo o crime organizado.', 'Pedido de GLO durante crise de segurança em Manaus.', 'verified', false, '2023-10-02', 'https://www1.folha.uol.com.br/cotidiano/2023/10/wilson-lima-glo-amazonas.shtml', 'news_article', 2, 'Manaus', 'Entrevista à imprensa', 'wilson-glo-amazonas-b119-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio diz que não vai "caçar bruxas" após 8 de janeiro.', 'Não vamos fazer caça às bruxas dentro das Forças Armadas. Vamos agir com prudência.', 'Entrevista sobre punições a militares envolvidos em 8 de janeiro.', 'verified', true, '2023-01-26', 'https://oglobo.globo.com/politica/mucio-caca-bruxas-forcas-armadas/', 'news_article', 3, 'Ministério da Defesa', 'Entrevista', 'mucio-caca-bruxas-b119-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende punição exemplar aos financiadores do 8 de janeiro.', 'Os financiadores dos atos golpistas devem ser punidos com rigor. Sem dinheiro não há golpe.', 'Declaração após reunião sobre investigações financeiras.', 'verified', false, '2023-02-03', 'https://g1.globo.com/politica/noticia/2023/02/03/rui-costa-financiadores-golpe.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista', 'rui-costa-financiadores-b119-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra punição de militares envolvidos em trama golpista.', 'Todo mundo que participou da trama golpista tem que ser punido, general ou cabo.', 'Entrevista em cadeia de rádios após revelações da PF.', 'verified', true, '2024-02-22', 'https://www.cnnbrasil.com.br/politica/lula-punicao-militares-radio/', 'news_article', 2, 'Rádio Nacional', 'Entrevista', 'lula-punicao-militares-b119-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende condenação rápida dos golpistas no STF.', 'O Brasil precisa de resposta firme e rápida do STF aos golpistas. Sem condescendência.', 'Declaração durante sessão do Senado sobre julgamentos do 8 de janeiro.', 'verified', false, '2023-09-15', 'https://www.poder360.com.br/congresso/jaques-wagner-stf-golpistas/', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'jaques-wagner-stf-golpistas-b119-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias cobra prisão preventiva de Bolsonaro após Tempus Veritatis.', 'Bolsonaro tem que ser preso preventivamente. Há risco real de fuga e novo golpe.', 'Declaração após operação Tempus Veritatis da PF.', 'verified', false, '2024-02-09', 'https://oglobo.globo.com/politica/lindbergh-prisao-preventiva-bolsonaro/', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'lindbergh-prisao-bolsonaro-b119-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende linha dura contra financiadores do golpe em agenda internacional.', 'O Brasil não vai tolerar mais tentativas golpistas. Vamos punir severamente os responsáveis.', 'Declaração durante reunião do FMI em Washington.', 'verified', false, '2023-04-14', 'https://g1.globo.com/politica/noticia/2023/04/14/haddad-fmi-financiadores-golpe.ghtml', 'news_article', 1, 'FMI Washington', 'Reunião FMI', 'haddad-financiadores-golpe-b119-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende CPMI para investigar 8 de janeiro.', 'Precisamos de uma CPMI que investigue a fundo quem financiou e organizou o 8 de janeiro.', 'Declaração após instalação da CPMI mista do 8 de janeiro.', 'verified', false, '2023-05-25', 'https://www1.folha.uol.com.br/poder/2023/05/randolfe-cpmi-8-janeiro.shtml', 'news_article', 1, 'Senado Federal', 'Pronunciamento', 'randolfe-cpmi-b119-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem defende Bolsonaro e ataca Moraes em plenário.', 'Moraes é o ditador togado do STF. Está destruindo a democracia que finge defender.', 'Discurso em plenário sobre decisões de Moraes.', 'verified', true, '2024-02-13', 'https://www.metropoles.com/brasil/politica-br/mvh-moraes-ditador-togado', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'mvh-moraes-ditador-b119-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca PF em rede social após operação contra o pai.', 'A PF virou instrumento político do PT. Isso é uma vergonha para o Brasil.', 'Post em X após operação Tempus Veritatis contra Jair Bolsonaro.', 'verified', true, '2024-02-08', 'https://oglobo.globo.com/politica/carlos-bolsonaro-pf-twitter/', 'news_article', 4, 'X (Twitter)', 'Post em rede social', 'carlos-pf-twitter-b119-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles defende Bolsonaro e critica "lawfare" judicial.', 'Isso é lawfare puro. Estão usando a justiça para destruir o maior líder de direita.', 'Entrevista em podcast de direita sobre processos contra Bolsonaro.', 'verified', false, '2024-03-22', 'https://www.poder360.com.br/politica/salles-lawfare-bolsonaro/', 'news_article', 3, 'Podcast', 'Entrevista', 'salles-lawfare-b119-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino celebra condenação de primeiros réus do 8 de janeiro pelo STF.', 'A Justiça funcionou. Quem atentou contra a democracia será responsabilizado.', 'Declaração após STF condenar primeiros réus por ataques aos Três Poderes.', 'verified', false, '2023-09-15', 'https://g1.globo.com/politica/noticia/2023/09/15/dino-condenacao-reus-8-janeiro.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva', 'dino-condenacao-reus-b119-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão sugere que 8 de janeiro foi "armação" para prejudicar Bolsonaro.', 'Tem muita coisa estranha no 8 de janeiro. Parece que foi armado para pegar a direita.', 'Entrevista em podcast questionando versão oficial dos atos golpistas.', 'verified', true, '2023-11-08', 'https://www.metropoles.com/brasil/politica-br/mourao-armacao-8-janeiro', 'news_article', 4, 'Podcast', 'Entrevista', 'mourao-armacao-b119-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é apontado como líder de organização criminosa em relatório da PF.', 'Não sou chefe de nada. Sempre respeitei a Constituição e a democracia.', 'Reação ao relatório final da PF que o apontou como líder de trama golpista.', 'verified', true, '2024-11-21', 'https://www1.folha.uol.com.br/poder/2024/11/bolsonaro-chefe-organizacao-criminosa.shtml', 'news_article', 5, 'Brasília', 'Coletiva de imprensa', 'bolsonaro-chefe-org-criminosa-b119-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula sanções internacionais contra Moraes.', 'Vamos trabalhar em Washington para sancionar Moraes pela Lei Magnitsky.', 'Declaração após reunião com políticos republicanos nos EUA.', 'verified', true, '2025-02-10', 'https://www.cnnbrasil.com.br/politica/eduardo-magnitsky-moraes/', 'news_article', 5, 'Washington DC', 'Reunião nos EUA', 'eduardo-magnitsky-b119-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio chama Moraes de "parte interessada" no julgamento de Bolsonaro.', 'Não dá para aceitar que o próprio investigado seja juiz. É impossível essa situação.', 'Entrevista à Jovem Pan sobre Moraes conduzir casos do 8 de janeiro.', 'verified', true, '2024-04-02', 'https://www.poder360.com.br/justica/tarcisio-moraes-parte-interessada/', 'news_article', 4, 'Rádio Jovem Pan', 'Entrevista', 'tarcisio-moraes-parte-b119-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado pede redução de maioridade penal e endurecimento do Código Penal.', 'Bandido a partir de 14 anos tem que ir para cadeia adulta. Menoridade virou paraíso criminal.', 'Declaração durante encontro de governadores sobre segurança pública.', 'verified', false, '2024-06-12', 'https://g1.globo.com/go/goias/noticia/2024/06/12/caiado-maioridade-penal-14-anos.ghtml', 'news_article', 3, 'Goiânia', 'Encontro de governadores', 'caiado-maioridade-14-b119-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro minimiza chacina do Salgueiro e culpa "narcoterroristas".', 'Não foi chacina. Foi confronto com narcoterroristas que atiraram primeiro contra a polícia.', 'Entrevista após operação com 28 mortos no Complexo do Salgueiro.', 'verified', true, '2023-10-06', 'https://oglobo.globo.com/rio/castro-salgueiro-narcoterroristas/', 'news_article', 4, 'Rio de Janeiro', 'Coletiva', 'castro-narcoterroristas-b119-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio admite "risco de golpe" ter existido no fim de 2022.', 'Sim, houve risco de golpe. Hoje podemos afirmar isso com base nas investigações.', 'Entrevista à GloboNews sobre operação Tempus Veritatis.', 'verified', true, '2024-02-20', 'https://g1.globo.com/politica/noticia/2024/02/20/mucio-risco-golpe-2022.ghtml', 'news_article', 2, 'GloboNews', 'Entrevista', 'mucio-risco-golpe-b119-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Bolsonaro "tentou golpe" em discurso na ONU.', 'O Brasil sofreu tentativa de golpe comandada pelo ex-presidente. A democracia venceu.', 'Discurso na Assembleia Geral da ONU em Nova York.', 'verified', true, '2023-09-19', 'https://www1.folha.uol.com.br/mundo/2023/09/lula-onu-golpe-bolsonaro.shtml', 'news_article', 1, 'ONU', 'Assembleia Geral ONU', 'lula-onu-golpe-b119-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sim, 'Simone Tebet defende responsabilização em entrevista em Davos.', 'Quem tentou golpe tem que pagar. O Brasil não pode virar as costas para o que aconteceu.', 'Entrevista durante Fórum Econômico Mundial em Davos.', 'verified', false, '2024-01-18', 'https://www.cnnbrasil.com.br/politica/tebet-davos-golpe-responsabilizacao/', 'news_article', 1, 'Davos', 'Fórum Econômico Mundial', 'tebet-davos-golpe-b119-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas defende tese de "preso político" para golpistas do 8 de janeiro.', 'Temos presos políticos no Brasil. Velhinhos e mães de família detidos por orar em frente ao quartel.', 'Discurso em sessão sobre tramitação do PL da anistia.', 'verified', true, '2024-04-08', 'https://www.metropoles.com/brasil/politica-br/nikolas-presos-politicos-8-janeiro', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-presos-politicos-b119-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'Girão ameaça "dia da ira" em frente ao STF.', 'Vai chegar o dia da ira. O povo vai cercar o STF e tirar esses togados do poder.', 'Discurso em ato na Esplanada dos Ministérios.', 'verified', true, '2024-06-15', 'https://oglobo.globo.com/politica/girao-dia-ira-stf/', 'news_article', 5, 'Esplanada dos Ministérios', 'Ato contra STF', 'girao-dia-ira-b119-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foge para Itália após condenação no STF.', 'Fui forçada ao exílio por perseguição política. Voltarei quando o Brasil tiver liberdade.', 'Post em redes sociais após fuga para a Itália em meio a processos.', 'verified', true, '2025-06-04', 'https://g1.globo.com/politica/noticia/2025/06/04/zambelli-foge-italia.ghtml', 'news_article', 5, 'Roma', 'Post em rede social', 'zambelli-foge-italia-b119-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende destituição de Moraes via impeachment no Senado.', 'Moraes tem que ser impichado. Está extrapolando todas as competências constitucionais.', 'Entrevista no Senado sobre pedidos de impeachment do ministro.', 'verified', true, '2024-04-16', 'https://www.poder360.com.br/congresso/flavio-impeachment-moraes-senado/', 'news_article', 4, 'Senado Federal', 'Entrevista', 'flavio-impeachment-moraes-b119-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino defende operação contra milícias digitais em aliança com PF.', 'Vamos combater as milícias digitais bolsonaristas com o rigor da lei.', 'Anúncio de cooperação entre MJ e PF para operações contra desinformação.', 'verified', false, '2023-05-03', 'https://www1.folha.uol.com.br/poder/2023/05/dino-milicia-digital-pf.shtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva', 'dino-milicia-digital-b119-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes manda prender deputado por afrontas ao STF em rede social.', 'A imunidade parlamentar não protege ameaças diretas a ministros da Suprema Corte.', 'Decisão sobre prisão preventiva em inquérito das fake news.', 'verified', true, '2024-05-20', 'https://g1.globo.com/politica/noticia/2024/05/20/moraes-mandado-prisao-deputado.ghtml', 'news_article', 2, 'STF', 'Decisão judicial', 'moraes-prisao-deputado-b119-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis acusa Moraes de abuso de autoridade em discurso inflamado.', 'Moraes é um tirano que abusa de autoridade. O STF virou o poder supremo acima da Constituição.', 'Pronunciamento na Câmara sobre decisões recentes do ministro.', 'verified', true, '2024-03-20', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-moraes-tirano', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bia-kicis-moraes-tirano-b119-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende atuação da AGU contra atos golpistas.', 'A AGU continuará atuando para punir os responsáveis pelos atos de 8 de janeiro.', 'Entrevista após ações de ressarcimento movidas pela AGU.', 'verified', false, '2023-04-12', 'https://g1.globo.com/politica/noticia/2023/04/12/messias-agu-atos-golpistas.ghtml', 'news_article', 1, 'AGU', 'Entrevista', 'messias-agu-golpistas-b119-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem defende destituição de Moraes em manifesto.', 'Moraes precisa ser destituído. É o maior inimigo da liberdade no Brasil hoje.', 'Manifesto assinado por parlamentares de oposição pedindo impeachment.', 'verified', true, '2024-04-17', 'https://oglobo.globo.com/politica/mvh-destituicao-moraes-manifesto/', 'news_article', 4, 'Câmara dos Deputados', 'Manifesto parlamentar', 'mvh-destituicao-moraes-b119-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra retirada de honrarias militares de envolvidos no golpe.', 'General condenado tem que perder patente e todas as honrarias. Isso é inegociável.', 'Declaração em cerimônia militar sobre revisão de condecorações.', 'verified', false, '2024-12-15', 'https://www1.folha.uol.com.br/poder/2024/12/lula-honrarias-militares-golpe.shtml', 'news_article', 2, 'Brasília', 'Cerimônia militar', 'lula-honrarias-b119-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro recebe apoio de Trump após indiciamento pela PF.', 'Trump está ao meu lado. Os EUA vão pressionar o Brasil para parar essa perseguição.', 'Declaração após ligação do presidente eleito Donald Trump.', 'verified', true, '2024-11-30', 'https://www.cnnbrasil.com.br/politica/bolsonaro-trump-apoio-indiciamento/', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-trump-apoio-b119-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem é denunciado por trama golpista junto com Bolsonaro.', 'Sou inocente. Nunca participei de nenhuma trama golpista. Tudo é invenção da PF.', 'Reação após denúncia da PGR que o incluiu no núcleo golpista.', 'verified', true, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/ramagem-denunciado-trama-golpista.ghtml', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista', 'ramagem-denunciado-golpe-b119-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia programa nacional de combate ao crime organizado.', 'Vamos integrar polícias e criar força-tarefa nacional contra o crime organizado.', 'Lançamento do Programa Nacional de Segurança.', 'verified', false, '2024-04-10', 'https://www1.folha.uol.com.br/cotidiano/2024/04/lewandowski-programa-crime-organizado.shtml', 'news_article', 1, 'Ministério da Justiça', 'Lançamento de programa', 'lewandowski-crime-organizado-b119-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende armamento da população como "legítima defesa".', 'Povo armado não vira escravo. Precisamos armar brasileiros contra tirania esquerdista.', 'Discurso na Câmara contra decreto de Lula que restringiu armas.', 'verified', true, '2023-07-13', 'https://www.metropoles.com/brasil/politica-br/sanderson-armar-povo-legitima', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-armar-povo-b119-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner critica Câmara por proteger Ramagem de ação penal.', 'A Câmara está errada ao blindar Ramagem. A democracia não permite imunidade absoluta.', 'Declaração após votação que suspendeu ação contra Ramagem.', 'verified', false, '2025-05-14', 'https://oglobo.globo.com/politica/jaques-wagner-camara-ramagem-blindagem/', 'news_article', 1, 'Senado Federal', 'Entrevista', 'jaques-wagner-ramagem-blindagem-b119-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad denuncia ameaças bolsonaristas a servidores do Fisco.', 'Auditores da Receita estão sendo ameaçados por bolsonaristas. Isso tem que acabar.', 'Entrevista sobre ameaças a servidores após investigações fiscais.', 'verified', false, '2023-12-07', 'https://g1.globo.com/politica/noticia/2023/12/07/haddad-ameacas-bolsonaristas-receita.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Entrevista', 'haddad-ameacas-receita-b119-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro compartilha ataques a delegados da PF em redes sociais.', 'Esses delegados são militantes petistas disfarçados de policiais. Vergonha nacional.', 'Série de posts atacando delegados que investigavam Bolsonaro.', 'verified', true, '2024-03-02', 'https://www.poder360.com.br/governo/carlos-bolsonaro-ataques-delegados-pf/', 'news_article', 4, 'X (Twitter)', 'Post em rede social', 'carlos-ataques-delegados-b119-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino critica projeto de anistia e diz que "democracia não negocia com golpistas".', 'Anistia para golpistas é inaceitável. Democracia não negocia com quem atentou contra ela.', 'Entrevista sobre PL da anistia que tramitava na Câmara.', 'verified', true, '2024-04-10', 'https://www1.folha.uol.com.br/poder/2024/04/dino-anistia-golpistas.shtml', 'news_article', 1, 'Ministério da Justiça', 'Entrevista', 'dino-anistia-negocia-b119-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende que comandantes não sabiam de minuta golpista.', 'Os comandantes agiram certo. Não há prova de que tenham compactuado com minuta alguma.', 'Pronunciamento defendendo ex-comandantes envolvidos no escândalo.', 'verified', false, '2024-03-22', 'https://www.poder360.com.br/congresso/mourao-comandantes-minuta/', 'news_article', 3, 'Senado Federal', 'Pronunciamento', 'mourao-comandantes-inocentes-b119-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sim, 'Simone Tebet defende rigor com militares condenados no 8 de janeiro.', 'Militar que participou de golpe perde o direito de vestir farda. Isso é inegociável.', 'Entrevista sobre processo de cassação de patentes.', 'verified', false, '2024-12-18', 'https://g1.globo.com/politica/noticia/2024/12/18/tebet-rigor-militares-golpe.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-militares-farda-b119-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes acusa STF de "desastre econômico" por processar Bolsonaro.', 'Essa perseguição jurídica a Bolsonaro custa caro ao Brasil. Investidores fogem.', 'Entrevista em evento de mercado financeiro em São Paulo.', 'verified', false, '2024-03-15', 'https://www.cnnbrasil.com.br/economia/guedes-stf-desastre-bolsonaro/', 'news_article', 3, 'São Paulo', 'Evento econômico', 'guedes-stf-desastre-b119-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles chama Moraes de "Torquemada de Brasília" em entrevista.', 'Moraes é o Torquemada de Brasília. Persegue quem pensa diferente com inquisição judicial.', 'Entrevista em podcast conservador sobre STF.', 'verified', true, '2024-04-05', 'https://oglobo.globo.com/politica/salles-torquemada-moraes/', 'news_article', 4, 'Podcast', 'Entrevista', 'salles-torquemada-b119-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa celebra julgamento histórico do 8 de janeiro no STF.', 'O Brasil deu um exemplo ao mundo julgando rapidamente tentativa de golpe.', 'Declaração após primeiras condenações de réus pelo STF.', 'verified', false, '2023-09-16', 'https://www1.folha.uol.com.br/poder/2023/09/rui-costa-julgamento-historico.shtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista', 'rui-costa-julgamento-historico-b119-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro celebra sanção dos EUA a Moraes por Trump.', 'Viva a liberdade! Trump sancionou Moraes. Fim do ditador togado no Brasil.', 'Post após sanções da Lei Magnitsky aplicadas pelos EUA ao ministro do STF.', 'verified', true, '2025-07-30', 'https://g1.globo.com/politica/noticia/2025/07/30/eduardo-celebra-sancoes-moraes.ghtml', 'news_article', 5, 'X (Twitter)', 'Post em rede social', 'eduardo-sancoes-moraes-b119-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio promete "não devolver Moraes aos EUA" em disputa diplomática.', 'Vamos defender o Brasil de intromissões estrangeiras. Moraes é problema nosso, não dos EUA.', 'Entrevista ambígua após sanções americanas contra Moraes.', 'verified', true, '2025-08-02', 'https://www.metropoles.com/brasil/politica-br/tarcisio-moraes-eua-sancao', 'news_article', 3, 'São Paulo', 'Entrevista', 'tarcisio-moraes-eua-b119-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro envia PMs para atacar ativistas durante protestos no Rio.', 'Vou acabar com essa bagunça. Manifestante violento vai conhecer a força da PM.', 'Declaração após uso de cavalaria e bombas contra manifestantes no centro do Rio.', 'verified', true, '2024-11-22', 'https://www1.folha.uol.com.br/cotidiano/2024/11/castro-pm-manifestantes-rio.shtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva de imprensa', 'castro-pm-manifestantes-b119-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado envia PM com uso excessivo de força em protesto estudantil.', 'Não toleramos baderna. Quem tumultua ordem pública conhece força da nossa polícia.', 'Entrevista após repressão violenta a estudantes em Goiânia.', 'verified', false, '2024-09-10', 'https://g1.globo.com/go/goias/noticia/2024/09/10/caiado-pm-estudantes.ghtml', 'news_article', 3, 'Goiânia', 'Entrevista', 'caiado-pm-estudantes-b119-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima defende ampliação de armas letais para PM do Amazonas.', 'Nossa PM precisa de armamento pesado. Enfrentamos crime organizado internacional.', 'Anúncio de compra de fuzis e blindados para PM do Amazonas.', 'verified', false, '2024-07-22', 'https://www.cnnbrasil.com.br/regional/wilson-lima-armas-pm-amazonas/', 'news_article', 3, 'Manaus', 'Coletiva', 'wilson-armas-pm-b119-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende PL de regulação de armas após 8 de janeiro.', 'Precisamos endurecer o controle de armas. O 8 de janeiro mostrou o risco real do descontrole.', 'Discurso na Câmara em defesa do decreto de armas do governo Lula.', 'verified', false, '2023-07-14', 'https://www.poder360.com.br/congresso/orlando-silva-armas-8-janeiro/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-armas-8-janeiro-b119-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica Câmara por tramitar PL da anistia.', 'Essa Câmara faz vergonha ao Brasil tentando anistiar golpistas. É uma traição à democracia.', 'Pronunciamento durante tramitação do PL da anistia em 2024.', 'verified', false, '2024-05-15', 'https://www1.folha.uol.com.br/poder/2024/05/jandira-camara-anistia-vergonha.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-camara-vergonha-b119-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende redução do orçamento das Forças Armadas no pós-golpe.', 'É hora de redefinir prioridades nas Forças Armadas. Menos burocracia militar, mais segurança.', 'Entrevista sobre reforma no orçamento de defesa em 2024.', 'verified', false, '2024-08-14', 'https://g1.globo.com/politica/noticia/2024/08/14/mucio-orcamento-forcas-armadas.ghtml', 'news_article', 1, 'Ministério da Defesa', 'Entrevista', 'mucio-orcamento-fa-b119-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que 8 de janeiro teve "conivência de gente da Abin e PF".', 'Tem gente da Abin e PF que foi conivente. Vamos investigar todos sem exceção.', 'Entrevista sobre participação de agentes estatais no 8 de janeiro.', 'verified', true, '2023-02-05', 'https://www1.folha.uol.com.br/poder/2023/02/lula-conivencia-abin-pf.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-conivencia-abin-b119-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina prisão preventiva de Braga Netto por obstrução.', 'O general tentou intimidar testemunhas em ação flagrante de obstrução de justiça.', 'Decisão que levou Braga Netto à prisão preventiva em dezembro de 2024.', 'verified', true, '2024-12-14', 'https://g1.globo.com/politica/noticia/2024/12/14/moraes-prisao-preventiva-braga-netto.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-prisao-braga-netto-b119-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro acusa Moraes de "golpe judicial" após prisão de Braga Netto.', 'Isso é golpe judicial do Moraes. Ele prende um general patriota sem provas reais.', 'Entrevista após prisão de Walter Braga Netto.', 'verified', true, '2024-12-15', 'https://www.cnnbrasil.com.br/politica/bolsonaro-braga-netto-golpe-judicial/', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-golpe-judicial-b119-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira convoca ato "Liberdade para Bolsonaro" em São Paulo.', 'Vamos encher a Paulista por Bolsonaro. O Brasil precisa acordar contra a tirania do STF.', 'Convocação de ato em defesa de Bolsonaro após denúncia da PGR.', 'verified', true, '2025-03-03', 'https://www.poder360.com.br/direita/nikolas-ato-paulista-bolsonaro/', 'news_article', 3, 'Redes sociais', 'Convocação de ato', 'nikolas-ato-paulista-b119-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros defende PL que limita decisões monocráticas do STF.', 'Ministro não pode sozinho cassar mandato nem prender. Vamos limitar o poder monocrático.', 'Defesa de PEC para restringir poderes de ministros do STF.', 'verified', false, '2023-10-24', 'https://oglobo.globo.com/politica/filipe-barros-pl-monocraticas-stf/', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'filipe-barros-monocraticas-b119-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Freixo defende criação de ouvidoria nacional de polícia.', 'Precisamos de ouvidorias independentes para controlar abusos policiais. Não pode mais ser assim.', 'Declaração em seminário sobre segurança pública em Brasília.', 'verified', false, '2024-05-30', 'https://www1.folha.uol.com.br/cotidiano/2024/05/freixo-ouvidoria-policia.shtml', 'news_article', 1, 'Brasília', 'Seminário', 'freixo-ouvidoria-b119-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli propõe em plenário que bolsonaristas "ajam" contra STF.', 'O povo não pode ficar parado. Temos que agir para tirar Moraes do STF de qualquer forma.', 'Pronunciamento antes de sua fuga do país em 2025.', 'verified', true, '2025-05-22', 'https://g1.globo.com/politica/noticia/2025/05/22/zambelli-bolsonaristas-agir-stf.ghtml', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'zambelli-bolsonaristas-agir-b119-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias denuncia Câmara por tentar blindar Ramagem.', 'A Câmara quer blindar Ramagem para proteger o núcleo golpista. Não vamos permitir.', 'Discurso contra suspensão da ação contra deputado acusado de golpe.', 'verified', false, '2025-05-14', 'https://www.cnnbrasil.com.br/politica/lindbergh-camara-ramagem/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'lindbergh-camara-ramagem-b119-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues celebra condenação de Bolsonaro pelo STF.', 'A condenação de Bolsonaro é vitória da democracia. Golpismo não fica impune no Brasil.', 'Declaração após STF condenar Bolsonaro em 2025 por trama golpista.', 'verified', true, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/randolfe-condenacao-bolsonaro.shtml', 'news_article', 1, 'Senado Federal', 'Entrevista', 'randolfe-condenacao-bolsonaro-b119-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes vota pela condenação de Bolsonaro em crime de trama golpista.', 'O réu comandou organização criminosa voltada a abolir o Estado Democrático de Direito.', 'Voto do relator no julgamento que condenou Bolsonaro em setembro de 2025.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/moraes-voto-condenacao-bolsonaro.ghtml', 'news_article', 1, 'STF', 'Sessão Primeira Turma', 'moraes-voto-condenacao-b119-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é condenado a 27 anos de prisão por trama golpista.', 'Essa condenação é uma vergonha internacional. Vou lutar até o fim, nem que seja do exílio.', 'Declaração após condenação histórica por cinco crimes relacionados à trama golpista.', 'verified', true, '2025-09-11', 'https://www.cnnbrasil.com.br/politica/bolsonaro-condenado-27-anos-stf/', 'news_article', 5, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-condenado-27-anos-b119-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio prega "revolução" contra decisão que condenou Bolsonaro.', 'O Brasil precisa de uma revolução institucional. Não podemos mais aceitar essa ditadura togada.', 'Discurso em ato bolsonarista em São Paulo após condenação.', 'verified', true, '2025-09-14', 'https://www.metropoles.com/brasil/politica-br/tarcisio-revolucao-condenacao-bolsonaro', 'news_article', 5, 'Avenida Paulista', 'Ato em SP', 'tarcisio-revolucao-b119-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto chama Exército para "cumprir dever" após condenação.', 'Nossas Forças Armadas têm o dever de intervir. A Pátria está em perigo real.', 'Vídeo em redes sociais convocando militares após sentença de Bolsonaro.', 'verified', true, '2025-09-12', 'https://oglobo.globo.com/politica/cabo-gilberto-convoca-exercito-condenacao/', 'news_article', 5, 'X (Twitter)', 'Vídeo em rede social', 'cabo-gilberto-convoca-exercito-b119-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia reforço de segurança em Brasília pós-condenação.', 'Vamos reforçar a segurança institucional. Não permitiremos novo 8 de janeiro.', 'Coletiva após condenação de Bolsonaro para evitar atos violentos.', 'verified', false, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/lewandowski-reforco-brasilia.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva', 'lewandowski-reforco-brasilia-b119-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias comemora derrota do PL da anistia na Câmara.', 'Democracia venceu. Não haverá anistia para quem atentou contra o Estado de Direito.', 'Declaração após derrota do PL da anistia em votação simbólica.', 'verified', false, '2025-10-08', 'https://www1.folha.uol.com.br/poder/2025/10/messias-derrota-anistia.shtml', 'news_article', 1, 'AGU', 'Entrevista', 'messias-derrota-anistia-b119-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula fuga do pai para Argentina em 2026.', 'Meu pai precisa se proteger. A Argentina de Milei é refúgio legítimo contra perseguição.', 'Declaração após notícias sobre possível fuga de Bolsonaro antes de execução da pena.', 'verified', true, '2026-01-20', 'https://www.poder360.com.br/politica/flavio-fuga-pai-argentina/', 'news_article', 5, 'Senado Federal', 'Entrevista', 'flavio-fuga-pai-b119-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro se entrega à PF após decisão de execução de pena em 2026.', 'Cumpro decisão mas não aceito. Sou preso político. A história me absolverá como Fidel.', 'Apresentação à PF em Brasília após ordem de início de cumprimento de pena.', 'verified', true, '2026-03-18', 'https://g1.globo.com/politica/noticia/2026/03/18/bolsonaro-entrega-pf-pena.ghtml', 'news_article', 5, 'Superintendência da PF Brasília', 'Entrega à PF', 'bolsonaro-entrega-pf-2026-b119-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio comemora fim dos "resquícios golpistas" nas Forças Armadas.', 'Hoje as Forças Armadas estão plenamente subordinadas ao poder civil. Esse foi nosso maior trabalho.', 'Entrevista de balanço do Ministério da Defesa antes da eleição de 2026.', 'verified', false, '2026-02-10', 'https://www1.folha.uol.com.br/poder/2026/02/mucio-balanco-forcas-armadas.shtml', 'news_article', 1, 'Ministério da Defesa', 'Entrevista balanço', 'mucio-balanco-fa-b119-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula declara que "democracia venceu o golpismo" em discurso de aniversário do 8 de janeiro.', 'A democracia brasileira venceu o golpismo. Três anos depois, os culpados pagam pelos crimes.', 'Pronunciamento em cerimônia no Palácio do Planalto no aniversário de três anos do 8 de janeiro.', 'verified', true, '2026-01-08', 'https://g1.globo.com/politica/noticia/2026/01/08/lula-democracia-venceu-golpismo.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Cerimônia oficial', 'lula-democracia-venceu-b119-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  RAISE NOTICE 'Batch 119 applied: 100 statements';
END $$;
