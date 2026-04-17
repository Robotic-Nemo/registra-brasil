-- Batch 118: Defense + military + Jan 8 aftermath + police (Jan 2023 - Apr 2026)
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
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende controle civil das Forças Armadas após 8 de janeiro.', 'As Forças Armadas precisam estar sob controle absoluto do poder civil, não há outro caminho.', 'Declaração após reunião com comandantes militares sobre punições a envolvidos no 8 de janeiro.', 'verified', true, '2023-02-15', 'https://www1.folha.uol.com.br/poder/2023/02/mucio-controle-civil-forcas-armadas.shtml', 'news_article', 1, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-controle-civil-b118-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que 8 de janeiro contou com conivência dentro das Forças Armadas.', 'Houve conivência, sim, houve gente das Forças Armadas envolvida no 8 de janeiro.', 'Entrevista a jornalistas na Base Aérea de Brasília sobre falhas de segurança.', 'verified', true, '2023-01-12', 'https://g1.globo.com/politica/noticia/2023/01/12/lula-conivencia-forcas-armadas-8-janeiro.ghtml', 'news_article', 3, 'Base Aérea de Brasília', 'Entrevista coletiva', 'lula-conivencia-forcas-b118-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega envolvimento com atos de 8 de janeiro em depoimento à PF.', 'Nunca incentivei invasão de prédios públicos. Sempre pedi manifestações pacíficas.', 'Depoimento prestado à Polícia Federal em Brasília sobre os atos golpistas.', 'verified', true, '2023-04-26', 'https://www.cnnbrasil.com.br/politica/bolsonaro-depoimento-pf-8-janeiro/', 'news_article', 4, 'Superintendência da PF', 'Depoimento em inquérito', 'bolsonaro-depoimento-pf-b118-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio minimiza acampamentos golpistas chamando bolsonaristas de "nossa gente".', 'Essa gente que está nos acampamentos é a nossa gente. Não podemos tratar como inimigos.', 'Declaração gerou críticas por aparente complacência com manifestantes que pediam golpe.', 'verified', true, '2023-01-20', 'https://www.metropoles.com/brasil/politica-br/mucio-nossa-gente-acampamentos', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'mucio-nossa-gente-b118-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino anuncia prisão em massa de envolvidos nos atos de 8 de janeiro.', 'Prendemos mais de 1.200 pessoas e vamos responsabilizar todos os envolvidos nos atos criminosos.', 'Coletiva após operações de limpeza dos acampamentos golpistas em Brasília.', 'verified', true, '2023-01-09', 'https://g1.globo.com/politica/noticia/2023/01/09/flavio-dino-prisoes-8-janeiro.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de imprensa', 'dino-prisoes-massa-b118-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica prisões em massa após 8 de janeiro como exagero.', 'Prender senhoras na porta do quartel é exagero. Há gente inocente presa.', 'Pronunciamento no Senado defendendo manifestantes bolsonaristas detidos.', 'verified', false, '2023-02-08', 'https://oglobo.globo.com/politica/mourao-prisoes-8-janeiro-exagero/', 'news_article', 3, 'Senado Federal', 'Pronunciamento em plenário', 'mourao-exagero-prisoes-b118-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio de bens de militares envolvidos na tentativa de golpe.', 'Os militares que participaram da trama golpista devem responder com seus bens por seus crimes.', 'Decisão monocrática do ministro no inquérito da minuta do golpe.', 'verified', true, '2024-02-08', 'https://www1.folha.uol.com.br/poder/2024/02/moraes-bloqueio-bens-militares-golpe.shtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-bloqueio-bens-b118-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende intervenção militar em pronunciamento na Câmara.', 'As Forças Armadas têm o dever constitucional de intervir quando a Pátria está ameaçada.', 'Discurso em defesa dos manifestantes presos por 8 de janeiro.', 'verified', true, '2023-03-15', 'https://www.poder360.com.br/congresso/girao-intervencao-militar-camara/', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'girao-intervencao-militar-b118-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende responsabilização de militares envolvidos em trama golpista.', 'Nenhum militar está acima da lei. Todos serão responsabilizados por seus atos.', 'Entrevista após reunião sobre ações da AGU no caso 8 de janeiro.', 'verified', false, '2023-05-10', 'https://g1.globo.com/politica/noticia/2023/05/10/messias-responsabilizacao-militares.ghtml', 'news_article', 1, 'AGU', 'Entrevista coletiva', 'messias-responsabilizacao-b118-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia cooperação da Casa Civil com PF em investigação do golpe.', 'A Casa Civil dará todo apoio para que a PF conduza as investigações do 8 de janeiro.', 'Declaração após reunião com diretor-geral da PF, Andrei Passos.', 'verified', false, '2023-03-22', 'https://www.cnnbrasil.com.br/politica/rui-costa-pf-investigacao-golpe/', 'news_article', 1, 'Palácio do Planalto', 'Reunião com PF', 'rui-costa-pf-cooperacao-b118-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem defende envolvimento de militares no gabinete paralelo da Abin.', 'Nunca houve gabinete paralelo. Tudo foi feito dentro da legalidade com cooperação militar.', 'Depoimento à CPMI do 8 de janeiro sobre uso da Abin.', 'verified', true, '2023-08-30', 'https://oglobo.globo.com/politica/ramagem-abin-gabinete-paralelo/', 'news_article', 4, 'CPMI 8 de Janeiro', 'Depoimento em comissão', 'ramagem-abin-gabinete-b118-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio admite que houve militares envolvidos na minuta do golpe.', 'Sim, é doloroso reconhecer, mas houve militares envolvidos no que se chamou de minuta do golpe.', 'Declaração após revelações da PF sobre plano "Punhal Verde e Amarelo".', 'verified', true, '2024-03-25', 'https://www1.folha.uol.com.br/poder/2024/03/mucio-militares-minuta-golpe.shtml', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-minuta-golpe-b118-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli defende militares investigados como "heróis da pátria".', 'Os generais patriotas estão sendo perseguidos por tentar salvar o Brasil do comunismo.', 'Pronunciamento em plenário em defesa de Braga Netto e Heleno.', 'verified', false, '2024-02-20', 'https://www.metropoles.com/brasil/politica-br/zambelli-herois-patria-militares', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'zambelli-herois-patria-b118-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira chama generais do STM de traidores por condenar colegas.', 'O STM virou balcão de traição. Condenam patriotas por mando de Moraes.', 'Postagens em redes sociais após condenação de militares pelo STM.', 'verified', false, '2024-05-18', 'https://veja.abril.com.br/politica/daniel-silveira-stm-traidores/', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'silveira-stm-traidores-b118-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia reforma na Polícia Federal para reforçar combate ao crime organizado.', 'Vamos reforçar a PF com mais recursos e novos delegados para enfrentar o crime organizado.', 'Anúncio após posse como ministro da Justiça em substituição a Dino.', 'verified', false, '2024-02-05', 'https://g1.globo.com/politica/noticia/2024/02/05/lewandowski-reforma-pf.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Posse do ministro', 'lewandowski-reforma-pf-b118-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro admite ter recebido minuta do golpe mas nega ter assinado.', 'Realmente recebi uma minuta, estudei, mas não assinei nenhum documento golpista.', 'Entrevista à Record TV sobre revelações da PF no caso da trama golpista.', 'verified', true, '2024-02-22', 'https://www.cnnbrasil.com.br/politica/bolsonaro-admite-minuta-golpe/', 'news_article', 5, 'Gravadora Record', 'Entrevista à imprensa', 'bolsonaro-admite-minuta-b118-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que discutiu estado de sítio com Bolsonaro em reunião.', 'Foi apresentada uma minuta, discutimos juridicamente, mas descartei o estado de sítio.', 'Depoimento à PF no inquérito da minuta do golpe.', 'verified', true, '2024-03-12', 'https://www1.folha.uol.com.br/poder/2024/03/mourao-estado-sitio-bolsonaro.shtml', 'news_article', 4, 'Superintendência da PF', 'Depoimento em inquérito', 'mourao-estado-sitio-b118-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Deputado Sanderson defende PMs bolsonaristas investigados por 8 de janeiro.', 'Os policiais que estavam lá cumpriam ordens. Estão sendo perseguidos injustamente.', 'Pronunciamento na Câmara sobre investigações da PF contra PMs do DF.', 'verified', false, '2023-06-14', 'https://www.poder360.com.br/congresso/sanderson-pms-8-janeiro/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-pms-defesa-b118-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama PF de "Gestapo" após operação contra bolsonaristas.', 'A PF virou a Gestapo de Lula. Operação contra patriotas é perseguição política.', 'Postagem após operação da PF que cumpriu mandados contra aliados de Bolsonaro.', 'verified', true, '2024-02-08', 'https://www.metropoles.com/brasil/politica-br/nikolas-pf-gestapo', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-pf-gestapo-b118-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende Exército após revelações sobre "kids pretos" envolvidos em trama.', 'Não se pode generalizar. Os kids pretos que desviaram são exceção, não regra.', 'Entrevista sobre militares das Forças Especiais implicados na minuta do golpe.', 'verified', false, '2024-03-30', 'https://g1.globo.com/politica/noticia/2024/03/30/mucio-kids-pretos-excecao.ghtml', 'news_article', 2, 'Ministério da Defesa', 'Entrevista à imprensa', 'mucio-kids-pretos-b118-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama Moraes de tirano após prisão de Filipe Martins.', 'Moraes está prendendo patriotas como Filipe Martins sem provas. É tirania togada.', 'Postagens após prisão de Filipe Martins no inquérito do golpe.', 'verified', false, '2024-02-08', 'https://veja.abril.com.br/politica/bia-kicis-moraes-tirano-filipe-martins/', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'bia-kicis-moraes-tirano-b118-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa rechaça pressão militar durante negociação sobre 8 de janeiro.', 'O governo Lula não admite pressão de fardas. Democracia é civil e civil é quem decide.', 'Declaração após reunião com generais sobre investigações dos atos golpistas.', 'verified', true, '2023-04-10', 'https://www1.folha.uol.com.br/poder/2023/04/rui-costa-pressao-militar.shtml', 'news_article', 2, 'Palácio do Planalto', 'Coletiva de imprensa', 'rui-costa-pressao-militar-b118-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem faz discurso contra Moraes chamando STF de ditadura togada.', 'O STF virou ditadura togada. Moraes é um autocrata que persegue opositores.', 'Discurso inflamado na tribuna da Câmara que viralizou nas redes.', 'verified', true, '2024-04-03', 'https://www.metropoles.com/brasil/politica-br/van-hattem-stf-ditadura-togada', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-ditadura-togada-b118-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede sanções a ministros em audiência no Congresso dos EUA.', 'Peço ao Congresso americano sanções contra ministros que perseguem a democracia no Brasil.', 'Participação em audiência pública em comissão da Câmara dos Representantes.', 'verified', true, '2024-03-20', 'https://www.cnnbrasil.com.br/politica/eduardo-congresso-eua-sancoes/', 'news_article', 5, 'Washington, EUA', 'Audiência no Congresso EUA', 'eduardo-sancoes-congresso-eua-b118-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro critica operações da PF no Rio como invasão da União.', 'A PF não pode pisar no Rio sem autorização. Estado tem autonomia sobre segurança.', 'Declaração após operação da PF em comunidades do Rio de Janeiro.', 'verified', false, '2023-08-15', 'https://oglobo.globo.com/rio/claudio-castro-pf-invasao/', 'news_article', 3, 'Palácio Guanabara', 'Coletiva de imprensa', 'castro-pf-invasao-b118-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio defende militares presos e minimiza gravidade da minuta do golpe.', 'Minuta é um rascunho. Não se pode criminalizar quem apenas discutiu hipóteses.', 'Entrevista em São Paulo sobre prisão de aliados militares de Bolsonaro.', 'verified', true, '2024-02-12', 'https://www1.folha.uol.com.br/poder/2024/02/tarcisio-minuta-rascunho.shtml', 'news_article', 4, 'São Paulo', 'Entrevista à imprensa', 'tarcisio-minuta-rascunho-b118-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino acusa Anderson Torres de omissão deliberada em 8 de janeiro.', 'Anderson Torres sumiu estrategicamente para que os atos ocorressem sem repressão.', 'Depoimento à CPMI do 8 de janeiro sobre comportamento do ex-ministro.', 'verified', true, '2023-05-09', 'https://g1.globo.com/politica/noticia/2023/05/09/dino-anderson-torres-omissao.ghtml', 'news_article', 1, 'CPMI 8 de Janeiro', 'Depoimento em comissão', 'dino-anderson-torres-omissao-b118-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Júlia Zanatta pede anistia ampla e irrestrita para presos de 8 de janeiro.', 'Temos que aprovar anistia total aos patriotas presos injustamente.', 'Pronunciamento em plenário da Câmara defendendo PL da Anistia.', 'verified', false, '2024-04-15', 'https://www.poder360.com.br/congresso/julia-zanatta-anistia-8-janeiro/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'julia-zanatta-anistia-b118-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende condenação rigorosa dos militares envolvidos no golpe.', 'Os militares que conspiraram contra a democracia precisam ser punidos exemplarmente.', 'Discurso em plenário da Câmara após delações de Mauro Cid.', 'verified', false, '2024-03-06', 'https://g1.globo.com/politica/noticia/2024/03/06/chico-alencar-militares-golpe.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'chico-alencar-militares-golpe-b118-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia FAB por operação falha e pede investigação.', 'A FAB precisa se explicar. Essas ações sem controle civil são inaceitáveis.', 'Discurso após escândalo envolvendo jatos e gastos da FAB.', 'verified', false, '2024-07-22', 'https://www.metropoles.com/brasil/politica-br/jandira-fab-operacao-falha', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'jandira-fab-investigacao-b118-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende GLO no Rio de Janeiro contra crime organizado.', 'Estamos avaliando decreto de GLO no Rio para apoiar forças de segurança no combate ao crime.', 'Declaração durante crise de segurança no Rio com ataques do Comando Vermelho.', 'verified', true, '2023-10-24', 'https://oglobo.globo.com/politica/mucio-glo-rio-crime/', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-glo-rio-b118-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo critica militarização da segurança pública.', 'Militarizar segurança pública no Rio é covardia com os PMs e ineficaz contra o crime.', 'Entrevista à Piauí sobre proposta de GLO no Rio de Janeiro.', 'verified', false, '2023-11-02', 'https://piaui.folha.uol.com.br/freixo-militarizacao-seguranca/', 'news_article', 1, 'Rio de Janeiro', 'Entrevista à revista', 'freixo-militarizacao-b118-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio anuncia redução de benefícios a militares para ajustar contas públicas.', 'Militares precisam contribuir com o ajuste fiscal. Benefícios serão revistos.', 'Anúncio sobre reforma administrativa afetando pensões militares.', 'verified', false, '2024-11-15', 'https://www1.folha.uol.com.br/mercado/2024/11/mucio-reducao-beneficios-militares.shtml', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-reducao-beneficios-b118-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros ataca Moraes em defesa de militares bolsonaristas.', 'Moraes está usando o STF para perseguir generais que serviram à Pátria.', 'Discurso em plenário da Câmara após operação da PF.', 'verified', false, '2024-02-09', 'https://www.poder360.com.br/congresso/filipe-barros-moraes-militares/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'filipe-barros-moraes-b118-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina prisão preventiva de Braga Netto por tentar obstruir investigação.', 'A tentativa de interferir no depoimento de Mauro Cid justifica a prisão preventiva.', 'Decisão do STF determinou prisão do general Braga Netto.', 'verified', true, '2024-12-14', 'https://www1.folha.uol.com.br/poder/2024/12/moraes-prisao-braga-netto.shtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-prisao-braga-netto-b118-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto pede levante popular após prisão de Braga Netto.', 'O povo brasileiro precisa ir às ruas. Não podemos aceitar a prisão de um general patriota.', 'Postagens em redes sociais após prisão do general Braga Netto.', 'verified', true, '2024-12-15', 'https://www.metropoles.com/brasil/politica-br/cabo-gilberto-levante-braga-netto', 'social_media_post', 5, 'João Pessoa', 'Postagem em rede social', 'cabo-gilberto-levante-b118-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gui, 'Guiga Peixoto defende anistia aos militares envolvidos no 8 de janeiro.', 'Os militares estão sendo criminalizados por amar o Brasil. Anistia já!', 'Pronunciamento em plenário defendendo PL da Anistia.', 'verified', false, '2024-04-20', 'https://www.cnnbrasil.com.br/politica/guiga-peixoto-anistia-militares/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'guiga-anistia-militares-b118-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende controle civil e punição exemplar aos militares golpistas.', 'A democracia exige controle civil. Militares que conspiraram serão punidos sem exceção.', 'Discurso em evento do PCdoB sobre defesa e democracia.', 'verified', false, '2023-07-05', 'https://g1.globo.com/politica/noticia/2023/07/05/orlando-silva-controle-civil-militares.ghtml', 'news_article', 1, 'São Paulo', 'Evento partidário', 'orlando-silva-controle-b118-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama militares golpistas de traidores em evento com tropas.', 'Quem conspirou contra a democracia não são soldados da pátria, são traidores da pátria.', 'Discurso em formatura de oficiais da AMAN em Resende.', 'verified', true, '2024-03-15', 'https://www1.folha.uol.com.br/poder/2024/03/lula-militares-traidores-aman.shtml', 'news_article', 2, 'AMAN Resende', 'Formatura de oficiais', 'lula-militares-traidores-b118-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues denuncia complacência militar com acampamentos golpistas.', 'Os quartéis abrigaram golpistas por dois meses. Isso não pode ficar impune.', 'Pronunciamento no Senado sobre omissão do Exército antes de 8 de janeiro.', 'verified', false, '2023-02-23', 'https://oglobo.globo.com/politica/randolfe-quarteis-golpistas/', 'news_article', 1, 'Senado Federal', 'Pronunciamento em plenário', 'randolfe-quarteis-golpistas-b118-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro ataca PF após operação contra minuta do golpe.', 'A PF virou braço armado da perseguição política do STF.', 'Postagem após operação da PF em 8 de fevereiro de 2024.', 'verified', true, '2024-02-08', 'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-pf-braco-armado/', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'flavio-pf-braco-armado-b118-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro publica teoria conspiratória sobre Mauro Cid.', 'Cid foi torturado para delatar. Toda delação foi forjada pelo STF.', 'Postagem em X após delação de Mauro Cid à PF.', 'verified', false, '2024-03-10', 'https://veja.abril.com.br/politica/carlos-bolsonaro-cid-tortura/', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-cid-tortura-b118-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende cooperação entre PF e PRF contra crime organizado.', 'A cooperação entre PF, PRF e Força Nacional é essencial para enfrentar o crime organizado.', 'Anúncio de operação conjunta no nordeste brasileiro.', 'verified', false, '2024-06-10', 'https://g1.globo.com/politica/noticia/2024/06/10/lewandowski-pf-prf-cooperacao.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de imprensa', 'lewandowski-pf-prf-b118-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado critica operação da PF em Goiás como interferência federal.', 'A PF está sendo usada politicamente contra governos de oposição. Inaceitável.', 'Declaração após operação da PF em Goiás envolvendo aliados.', 'verified', false, '2024-05-08', 'https://www.metropoles.com/brasil/politica-br/caiado-pf-interferencia', 'news_article', 3, 'Goiânia', 'Coletiva de imprensa', 'caiado-pf-interferencia-b118-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima defende atuação militar na Amazônia contra garimpo.', 'As Forças Armadas precisam estar presentes na Amazônia contra o garimpo ilegal.', 'Entrevista em Manaus sobre operações na região Yanomami.', 'verified', false, '2023-03-05', 'https://g1.globo.com/am/amazonas/noticia/2023/03/05/wilson-lima-fab-amazonia.ghtml', 'news_article', 1, 'Manaus', 'Entrevista à imprensa', 'wilson-lima-amazonia-militar-b118-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende modernização das Forças Armadas pela democracia.', 'Modernizar as Forças Armadas é compromisso do governo. Mas sempre dentro da Constituição.', 'Discurso em evento da Defesa sobre novos investimentos.', 'verified', false, '2023-06-20', 'https://www.defesanet.com.br/geopolitica/jaques-wagner-forcas-armadas-modernizacao/', 'news_article', 1, 'Senado Federal', 'Audiência pública', 'jaques-wagner-modernizacao-b118-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias denuncia omissão militar em 8 de janeiro como crime.', 'Os comandantes militares que se omitiram no 8 de janeiro cometeram crime. Têm que responder.', 'Pronunciamento na Câmara em defesa de investigações mais rigorosas.', 'verified', false, '2023-04-12', 'https://g1.globo.com/politica/noticia/2023/04/12/lindbergh-omissao-militar-crime.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'lindbergh-omissao-militar-b118-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sim, 'Simone Tebet defende punição exemplar de militares envolvidos no golpe.', 'Não podemos ter complacência com militares que conspiraram contra a democracia.', 'Entrevista após revelações da PF sobre plano de matar Lula e Alckmin.', 'verified', false, '2024-11-20', 'https://www1.folha.uol.com.br/poder/2024/11/tebet-militares-punicao.shtml', 'news_article', 1, 'Brasília', 'Entrevista à imprensa', 'tebet-punicao-militares-b118-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende ajuste fiscal incluindo revisão de privilégios militares.', 'Os privilégios militares precisam ser reavaliados dentro do ajuste fiscal necessário.', 'Declaração em comissão do Senado sobre reforma administrativa.', 'verified', false, '2024-11-18', 'https://g1.globo.com/economia/noticia/2024/11/18/haddad-ajuste-militares.ghtml', 'news_article', 2, 'Senado Federal', 'Audiência pública', 'haddad-privilegios-militares-b118-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio celebra Dia do Soldado afirmando compromisso com a Constituição.', 'O soldado brasileiro é, antes de tudo, um guardião da Constituição.', 'Discurso no Dia do Soldado em cerimônia em Brasília.', 'verified', false, '2023-08-25', 'https://www.defesanet.com.br/geopolitica/mucio-dia-do-soldado-constituicao/', 'news_article', 1, 'Brasília', 'Dia do Soldado', 'mucio-dia-soldado-b118-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia militares que "tentaram salvar o Brasil" em delação Cid.', 'Os militares que pensaram em alternativas institucionais são patriotas, não criminosos.', 'Entrevista na Jovem Pan sobre delação de Mauro Cid.', 'verified', true, '2024-03-12', 'https://veja.abril.com.br/politica/bolsonaro-militares-patriotas-cid/', 'news_article', 5, 'São Paulo', 'Entrevista à Jovem Pan', 'bolsonaro-militares-patriotas-b118-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que ideia de intervenção militar circulava no Planalto em 2022.', 'A ideia circulou, diversos civis e militares discutiram, mas eu não concordei.', 'Depoimento à CPMI do 8 de janeiro sobre o ambiente antes do 30 de outubro.', 'verified', true, '2023-06-14', 'https://www1.folha.uol.com.br/poder/2023/06/mourao-intervencao-militar-planalto.shtml', 'news_article', 4, 'CPMI 8 de Janeiro', 'Depoimento em comissão', 'mourao-intervencao-circulava-b118-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina expansão do inquérito a generais de quatro estrelas.', 'Os indícios apresentados pela PF justificam ampliação da investigação aos comandantes.', 'Decisão que incluiu general Paulo Sérgio no inquérito do golpe.', 'verified', true, '2024-02-22', 'https://g1.globo.com/politica/noticia/2024/02/22/moraes-generais-quatro-estrelas.ghtml', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-generais-quatro-estrelas-b118-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio critica pedido de intervenção militar como absurdo sem base constitucional.', 'Intervenção militar não existe no artigo 142. Isso é distorção grosseira da Constituição.', 'Entrevista ao Roda Viva sobre interpretação do artigo 142.', 'verified', true, '2023-05-15', 'https://tvcultura.com.br/roda-viva/mucio-artigo-142/', 'news_article', 1, 'TV Cultura', 'Entrevista ao Roda Viva', 'mucio-artigo-142-b118-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem ataca Moraes após denúncia da PGR contra Bolsonaro.', 'Moraes transformou o STF em tribunal de exceção contra patriotas.', 'Pronunciamento em plenário após denúncia de Paulo Gonet.', 'verified', false, '2025-02-18', 'https://www.metropoles.com/brasil/politica-br/ramagem-moraes-tribunal-excecao', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'ramagem-tribunal-excecao-b118-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli divulga vídeo em Miami atacando STF como refugiada política.', 'Fui obrigada a fugir do Brasil. Sou refugiada política da ditadura togada de Moraes.', 'Vídeo gravado em Miami após fuga de Zambelli.', 'verified', true, '2024-07-02', 'https://www1.folha.uol.com.br/poder/2024/07/zambelli-miami-refugiada.shtml', 'social_media_post', 4, 'Miami, EUA', 'Postagem em rede social', 'zambelli-miami-refugiada-b118-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino denuncia tentativa de assassinato contra Lula pela minuta do golpe.', 'O plano Punhal Verde Amarelo previa assassinar o presidente eleito. É de uma gravidade histórica.', 'Entrevista após revelações da PF sobre o plano "Punhal Verde e Amarelo".', 'verified', true, '2024-11-19', 'https://g1.globo.com/politica/noticia/2024/11/19/dino-punhal-verde-amarelo.ghtml', 'news_article', 1, 'STF', 'Entrevista à imprensa', 'dino-punhal-verde-amarelo-b118-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio confirma afastamento de militares envolvidos em plano de assassinato.', 'Os militares envolvidos nesse plano foram afastados e respondem perante a Justiça.', 'Declaração após revelações sobre plano de matar Lula, Alckmin e Moraes.', 'verified', true, '2024-11-20', 'https://www1.folha.uol.com.br/poder/2024/11/mucio-afastamento-militares-punhal.shtml', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-afastamento-punhal-b118-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias afirma que AGU atuará para responsabilizar militares golpistas.', 'A AGU entrará com ações de ressarcimento contra todos os envolvidos no 8 de janeiro.', 'Anúncio de ações judiciais de reparação financeira aos cofres públicos.', 'verified', false, '2024-04-08', 'https://g1.globo.com/politica/noticia/2024/04/08/messias-ressarcimento-8-janeiro.ghtml', 'news_article', 1, 'AGU', 'Coletiva de imprensa', 'messias-ressarcimento-b118-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em entrevista que Braga Netto é "preso político".', 'O Braga Netto é preso político. Nunca houve golpe. Isso é farsa do Moraes.', 'Entrevista à CNN Brasil após prisão de Braga Netto.', 'verified', true, '2024-12-15', 'https://www.cnnbrasil.com.br/politica/bolsonaro-braga-netto-preso-politico/', 'news_article', 5, 'Brasília', 'Entrevista à CNN', 'bolsonaro-braga-preso-politico-b118-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede intervenção dos EUA após denúncia contra o pai.', 'Os Estados Unidos precisam agir. Um ex-presidente não pode ser perseguido assim.', 'Pronunciamento em evento conservador em Washington após denúncia do PGR.', 'verified', true, '2025-02-20', 'https://oglobo.globo.com/politica/eduardo-intervencao-eua-denuncia/', 'news_article', 5, 'Washington, EUA', 'Evento CPAC', 'eduardo-intervencao-eua-b118-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz ataque ao STF em live após denúncia contra Bolsonaro.', 'O STF se transformou no inimigo número um da liberdade. Temos que resistir.', 'Live no YouTube após denúncia da PGR contra Bolsonaro.', 'verified', false, '2025-02-19', 'https://veja.abril.com.br/politica/nikolas-stf-inimigo-liberdade/', 'social_media_post', 4, 'Belo Horizonte', 'Live em rede social', 'nikolas-stf-inimigo-b118-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende atuação da PF e rechaça pressões políticas.', 'A PF atua de forma técnica. Governo Lula não interfere nas investigações.', 'Entrevista ao Valor Econômico sobre autonomia da PF.', 'verified', false, '2024-03-15', 'https://valor.globo.com/politica/noticia/2024/03/15/rui-costa-pf-autonomia.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista à imprensa', 'rui-costa-pf-autonomia-b118-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio admite constrangimento com generais condenados no STF.', 'É um momento doloroso para as Forças Armadas ver generais condenados. Mas a Justiça tem que agir.', 'Declaração após início de julgamento no STF dos militares envolvidos na trama.', 'verified', true, '2025-03-25', 'https://www1.folha.uol.com.br/poder/2025/03/mucio-constrangimento-generais-stf.shtml', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-constrangimento-generais-b118-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson diz em plenário que generais merecem "respeito, não cadeia".', 'Generais brasileiros merecem respeito, não cadeia. Eles defenderam a Pátria.', 'Discurso exaltado em plenário após julgamento no STF.', 'verified', false, '2025-03-26', 'https://www.poder360.com.br/congresso/sanderson-generais-respeito-cadeia/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-generais-respeito-b118-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia nova portaria sobre atuação da Força Nacional.', 'A Força Nacional atuará de forma coordenada com estados para combater o crime organizado.', 'Anúncio após crise de segurança pública em estados do nordeste.', 'verified', false, '2024-08-20', 'https://g1.globo.com/politica/noticia/2024/08/20/lewandowski-forca-nacional-portaria.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de imprensa', 'lewandowski-forca-nacional-b118-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro pede ajuda das Forças Armadas após ataques no Rio.', 'Precisamos das Forças Armadas no Rio. O crime organizado superou nossa capacidade.', 'Declaração após onda de ataques do Comando Vermelho no Rio.', 'verified', true, '2023-10-24', 'https://oglobo.globo.com/rio/claudio-castro-forcas-armadas-rio/', 'news_article', 3, 'Palácio Guanabara', 'Entrevista à imprensa', 'castro-forcas-armadas-rio-b118-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino responsabiliza ex-governo pelo descontrole da segurança no Brasil.', 'O governo Bolsonaro esvaziou as polícias e fortaleceu o crime organizado. Herança nefasta.', 'Pronunciamento em evento sobre combate às facções criminosas.', 'verified', false, '2023-08-15', 'https://www1.folha.uol.com.br/cotidiano/2023/08/dino-bolsonaro-policia-crime.shtml', 'news_article', 2, 'Brasília', 'Evento do MJSP', 'dino-bolsonaro-policia-b118-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende FAB após escândalo envolvendo aviões particulares de generais.', 'Esses casos são isolados. A instituição FAB é íntegra e patriota.', 'Declaração após matéria do UOL sobre uso irregular de aeronaves da FAB.', 'verified', false, '2024-07-25', 'https://www.infrel.com.br/mucio-fab-avioes-escandalo/', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-fab-escandalo-b118-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende transparência em gastos militares.', 'Os gastos militares precisam de transparência total. Não há mais caixa-preta em 2024.', 'Audiência pública no Senado sobre orçamento da Defesa.', 'verified', false, '2024-09-10', 'https://www.defesanet.com.br/geopolitica/jaques-wagner-transparencia-gastos-militares/', 'news_article', 1, 'Senado Federal', 'Audiência pública', 'jaques-wagner-transparencia-b118-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão elogia 1964 e defende Forças Armadas como poder moderador.', 'O Brasil deve muito a 1964. As Forças Armadas são e sempre serão o poder moderador.', 'Discurso em plenário durante sessão sobre a data militar.', 'verified', true, '2023-03-31', 'https://www.metropoles.com/brasil/politica-br/girao-1964-poder-moderador', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'girao-1964-moderador-b118-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula proíbe comemorações do 31 de março nos quartéis.', 'Não cabe celebrar ruptura democrática. Proíbo oficialmente qualquer comemoração de 1964.', 'Determinação presidencial aos comandantes das Forças Armadas.', 'verified', true, '2023-03-28', 'https://g1.globo.com/politica/noticia/2023/03/28/lula-proibe-1964-quarteis.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Reunião com comandantes', 'lula-proibe-1964-b118-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão contesta Lula sobre proibir comemorações do 31 de março.', 'Proibir a celebração de 1964 é revisionismo histórico. Foi uma revolução democrática.', 'Entrevista à Jovem Pan sobre decisão de Lula.', 'verified', true, '2023-03-29', 'https://www.cnnbrasil.com.br/politica/mourao-1964-revolucao/', 'news_article', 4, 'Brasília', 'Entrevista à rádio', 'mourao-1964-revolucao-b118-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio adere a proibição e envia circular aos comandantes.', 'Seguindo a orientação presidencial, nenhum quartel celebrará a data.', 'Circular assinada pelo ministro após determinação de Lula.', 'verified', false, '2023-03-30', 'https://www.defesanet.com.br/geopolitica/mucio-circular-31-marco/', 'news_article', 1, 'Ministério da Defesa', 'Circular ministerial', 'mucio-circular-31-marco-b118-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Daniel Silveira convoca "resistência armada" contra STF em postagem bloqueada.', 'Se o STF não parar, o povo armado terá que resistir. Não há mais opção.', 'Postagem em Telegram posteriormente bloqueada por ordem judicial.', 'verified', true, '2023-04-20', 'https://www1.folha.uol.com.br/poder/2023/04/daniel-silveira-resistencia-armada.shtml', 'social_media_post', 5, 'Petrópolis', 'Postagem em rede social', 'silveira-resistencia-armada-b118-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão pede "intervenção militar com Bolsonaro no poder".', 'É necessária uma intervenção militar com Bolsonaro no poder para restabelecer a ordem.', 'Postagem em redes sociais que motivou representação no STF.', 'verified', true, '2023-02-10', 'https://oglobo.globo.com/politica/girao-intervencao-militar-bolsonaro/', 'social_media_post', 5, 'Brasília', 'Postagem em rede social', 'girao-intervencao-bolsonaro-b118-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio defende soberania e Sisfron contra "ingerência estrangeira".', 'A Amazônia é brasileira. Nosso Sisfron garantirá soberania contra qualquer ingerência.', 'Pronunciamento em evento de tecnologia militar.', 'verified', false, '2024-05-15', 'https://www.infrel.com.br/mucio-sisfron-amazonia-soberania/', 'news_article', 1, 'Brasília', 'Evento Sisfron', 'mucio-sisfron-amazonia-b118-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pgu, 'Paulo Guedes defende Bolsonaro em depoimento sobre 8 de janeiro.', 'Bolsonaro nunca falou de golpe comigo. Tudo que vi foi respeito às instituições.', 'Depoimento à CPMI do 8 de janeiro em 2023.', 'verified', false, '2023-08-08', 'https://www.cnnbrasil.com.br/politica/paulo-guedes-cpmi-bolsonaro/', 'news_article', 3, 'CPMI 8 de Janeiro', 'Depoimento em comissão', 'guedes-cpmi-bolsonaro-b118-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles defende militares em operação Yanomami como "injustiçados".', 'Militares que atuaram na Amazônia foram injustiçados pela narrativa do genocídio.', 'Postagem em X sobre operação na Terra Indígena Yanomami.', 'verified', false, '2023-02-25', 'https://www.metropoles.com/brasil/politica-br/salles-militares-yanomami', 'social_media_post', 3, 'São Paulo', 'Postagem em rede social', 'salles-yanomami-b118-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia papel das Forças Armadas em sua cerimônia de inelegibilidade.', 'As Forças Armadas são a última trincheira da Pátria. Não serão derrotadas.', 'Declaração após julgamento no TSE que o tornou inelegível.', 'verified', true, '2023-06-30', 'https://www1.folha.uol.com.br/poder/2023/06/bolsonaro-forcas-armadas-trincheira.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-forcas-trincheira-b118-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio rebate Bolsonaro e reafirma papel constitucional das Forças Armadas.', 'Forças Armadas não são trincheira política. São instituição do Estado, não do governo.', 'Entrevista em reposta a declaração de Bolsonaro.', 'verified', true, '2023-07-01', 'https://g1.globo.com/politica/noticia/2023/07/01/mucio-forcas-armadas-instituicao-estado.ghtml', 'news_article', 1, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-instituicao-estado-b118-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende policiais militares golpistas como "vítimas do sistema".', 'Os PMs que atuaram no 8 de janeiro foram injustamente criminalizados.', 'Entrevista em Goiânia sobre investigações contra policiais.', 'verified', false, '2024-01-14', 'https://www.poder360.com.br/politica/caiado-pms-vitimas-sistema/', 'news_article', 3, 'Goiânia', 'Entrevista à imprensa', 'caiado-pms-vitimas-b118-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino ataca PMDF em CPMI por omissão criminosa em 8 de janeiro.', 'A PMDF teve omissão criminosa. Hajam investigações rigorosas.', 'Depoimento à CPMI do 8 de janeiro sobre atuação da PMDF.', 'verified', true, '2023-05-09', 'https://www1.folha.uol.com.br/poder/2023/05/dino-pmdf-omissao-criminosa.shtml', 'news_article', 1, 'CPMI 8 de Janeiro', 'Depoimento em comissão', 'dino-pmdf-omissao-b118-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio lamenta delação de Mauro Cid como "doloroso para o Exército".', 'A delação de Cid é dolorosa para o Exército, mas a Justiça deve seguir seu curso.', 'Entrevista após homologação da delação de Mauro Cid.', 'verified', true, '2023-09-08', 'https://www.defesanet.com.br/geopolitica/mucio-delacao-cid-doloroso/', 'news_article', 2, 'Ministério da Defesa', 'Entrevista à imprensa', 'mucio-delacao-cid-b118-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis compara Mauro Cid a traidor histórico como Silverado.', 'Cid é o Silverado da história recente. Vendeu a honra por benefício próprio.', 'Postagens em rede social sobre delação de Cid.', 'verified', false, '2024-03-09', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-cid-silverado', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'bia-kicis-cid-silverado-b118-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Júlia Zanatta chama PF de "polícia política" após operação contra aliados.', 'A PF virou polícia política. Persegue opositores, não criminosos.', 'Postagem em X após operação contra aliados de Bolsonaro.', 'verified', false, '2024-02-10', 'https://veja.abril.com.br/politica/julia-zanatta-pf-policia-politica/', 'social_media_post', 4, 'Florianópolis', 'Postagem em rede social', 'julia-zanatta-pf-politica-b118-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende atuação técnica da PF em inquérito do golpe.', 'A PF atua tecnicamente. Os resultados mostram trabalho sério e baseado em provas.', 'Entrevista após operações bem-sucedidas contra a trama golpista.', 'verified', false, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/lewandowski-pf-tecnica-golpe.ghtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de imprensa', 'lewandowski-pf-tecnica-b118-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pede anistia ampla para presos de 8 de janeiro.', 'Anistia é justiça. Temos que libertar as centenas de inocentes presos.', 'Pronunciamento no Senado em defesa do PL da Anistia.', 'verified', true, '2024-04-22', 'https://oglobo.globo.com/politica/flavio-anistia-8-janeiro/', 'news_article', 4, 'Senado Federal', 'Pronunciamento em plenário', 'flavio-anistia-8-janeiro-b118-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias rechaça anistia aos golpistas como afronta à democracia.', 'Anistia a golpistas é afronta à democracia. Não permitiremos esse retrocesso.', 'Pronunciamento na Câmara contra o PL da Anistia.', 'verified', false, '2024-04-23', 'https://g1.globo.com/politica/noticia/2024/04/23/lindbergh-anistia-golpistas.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'lindbergh-anistia-afronta-b118-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio admite necessidade de reformular educação militar.', 'Nossa educação militar precisa reforçar o compromisso com a democracia.', 'Discurso em formatura na ECEME sobre ajustes no currículo.', 'verified', false, '2024-06-28', 'https://www.defesanet.com.br/geopolitica/mucio-educacao-militar-democracia/', 'news_article', 1, 'ECEME', 'Cerimônia na ECEME', 'mucio-educacao-militar-b118-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Rui Costa por supervisão da PF sobre militares.', 'Rui Costa usa a PF para perseguir militares. É lawfare descarado.', 'Entrevista à Gazeta do Povo sobre investigações contra aliados.', 'verified', false, '2024-08-10', 'https://www.gazetadopovo.com.br/republica/bolsonaro-rui-costa-pf-militares/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista à imprensa', 'bolsonaro-rui-costa-pf-b118-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa responde a Bolsonaro afirmando autonomia técnica da PF.', 'A PF atua com autonomia técnica. Quem cometeu crimes tem que responder, e militares não são exceção.', 'Entrevista em resposta a ataques de Bolsonaro.', 'verified', false, '2024-08-11', 'https://g1.globo.com/politica/noticia/2024/08/11/rui-costa-responde-bolsonaro-pf.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista à imprensa', 'rui-costa-responde-bolsonaro-b118-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem denuncia "Estado policial" em discurso inflamado.', 'O Brasil virou um Estado policial sob Lula e Lewandowski. Temos que resistir.', 'Discurso em ato pela anistia em São Paulo.', 'verified', true, '2024-08-25', 'https://www.metropoles.com/brasil/politica-br/van-hattem-estado-policial', 'news_article', 4, 'Paulista, São Paulo', 'Ato pela Anistia', 'van-hattem-estado-policial-b118-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto convoca PMs a "desobedecer ordens ilegais" de Moraes.', 'Policiais militares não devem cumprir ordens ilegais do STF contra patriotas.', 'Postagem em redes sociais gerou investigação por incitação.', 'verified', true, '2024-06-12', 'https://www1.folha.uol.com.br/poder/2024/06/cabo-gilberto-desobedecer-moraes.shtml', 'social_media_post', 5, 'João Pessoa', 'Postagem em rede social', 'cabo-gilberto-desobedecer-b118-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio anuncia recompra do Mar da China para reforço da Marinha.', 'Fortaleceremos a Marinha com recompra estratégica de equipamentos chineses.', 'Anúncio de acordo bilateral com a China na área naval.', 'verified', false, '2025-01-20', 'https://www.defesanet.com.br/geopolitica/mucio-china-marinha-equipamentos/', 'news_article', 1, 'Ministério da Defesa', 'Assinatura de acordo', 'mucio-china-marinha-b118-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias articula ação para cassar mandatos de bolsonaristas golpistas.', 'Parlamentares que apoiaram o golpe devem responder também no campo político.', 'Declaração sobre estratégia jurídica contra parlamentares envolvidos.', 'verified', false, '2024-12-20', 'https://oglobo.globo.com/politica/messias-mandatos-bolsonaristas/', 'news_article', 2, 'AGU', 'Coletiva de imprensa', 'messias-cassar-mandatos-b118-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende reforma da Doutrina Militar para adequar à democracia.', 'Precisamos reformar a doutrina militar para que nunca mais tenhamos golpes ou tentativas.', 'Discurso em evento sobre defesa democrática no Celso Furtado.', 'verified', false, '2024-09-18', 'https://g1.globo.com/politica/noticia/2024/09/18/orlando-silva-doutrina-militar.ghtml', 'news_article', 1, 'São Paulo', 'Evento Celso Furtado', 'orlando-silva-doutrina-b118-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros defende generais condenados como "heróis da pátria".', 'Braga Netto, Heleno e outros generais são heróis. A história os absolverá.', 'Discurso em plenário após condenações no STF.', 'verified', false, '2026-02-10', 'https://www.poder360.com.br/congresso/filipe-barros-generais-herois-stf/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'filipe-barros-herois-b118-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão comenta reforma previdenciária militar com ressalvas.', 'Reforma de pensões militares precisa respeitar especificidades da carreira.', 'Entrevista ao Estadão sobre reforma administrativa.', 'verified', false, '2024-10-12', 'https://www.estadao.com.br/politica/mourao-reforma-pensoes-militares/', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'mourao-pensoes-militares-b118-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Múcio celebra condenação da trama golpista como "vitória da democracia".', 'A condenação dos envolvidos na trama golpista é vitória da democracia brasileira.', 'Declaração após conclusão do julgamento no STF.', 'verified', true, '2026-03-05', 'https://www1.folha.uol.com.br/poder/2026/03/mucio-condenacao-trama-vitoria-democracia.shtml', 'news_article', 2, 'Ministério da Defesa', 'Coletiva de imprensa', 'mucio-vitoria-democracia-b118-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
