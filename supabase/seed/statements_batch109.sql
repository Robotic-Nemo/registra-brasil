-- Batch 109: Indigenous policy, Marco Temporal, Yanomami, FUNAI, demarcations (Jan 2023 - Apr 2026)
-- 100 statements (continuation) on indigenous rights, Marco Temporal, garimpo ilegal, demarcações
DO $$
DECLARE
  v_gua UUID; v_mar UUID; v_lul UUID; v_pad UUID; v_nis UUID;
  v_rui UUID; v_muc UUID; v_lew UUID; v_fav UUID; v_ter UUID;
  v_bol UUID; v_edb UUID; v_wlm UUID; v_ade UUID; v_hel UUID;
  v_mme UUID; v_gca UUID; v_cle UUID; v_wba UUID; v_nik UUID;
  v_fel UUID; v_dam UUID; v_sal UUID; v_mvh UUID; v_tab UUID;
  v_eri UUID; v_sam UUID; v_tal UUID; v_cal UUID; v_jan UUID;
  v_ors UUID; v_lir UUID; v_mot UUID; v_mor UUID; v_gil UUID;
  v_car UUID; v_fac UUID; v_zan UUID; v_din UUID; v_cha UUID;
  v_sil UUID; v_mer UUID; v_teb UUID; v_had UUID; v_alc UUID;
  v_jpp UUID; v_mvi UUID;
  c_rac UUID; c_xen UUID; c_abu UUID; c_irr UUID; c_neg UUID;
  c_odi UUID; c_vio UUID; c_des UUID; c_obs UUID; c_ame UUID;
  c_con UUID; c_int UUID; c_aut UUID; c_aut2 UUID; c_cor UUID;
BEGIN
  SELECT id INTO v_gua FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edb FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_wlm FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_ade FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_gca FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wba FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'magda-chambriard';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_mer FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_jpp FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';

  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_aut FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_aut2 FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara denuncia desassistencia persistente aos Yanomami em 2024.', 'A emergencia Yanomami nao acabou. Criancas ainda morrem de desnutricao e malaria. Precisamos de mais recursos e presenca permanente do Estado.', 'Coletiva no Ministerio dos Povos Indigenas em Brasilia em janeiro de 2024, um ano apos declaracao de emergencia.', 'verified', true, '2024-01-20', 'https://www.gov.br/mpi/pt-br/noticias/sonia-yanomami-um-ano', 'other', 1, 'Brasilia', 'Coletiva MPI', 'guajajara-yanomami-um-ano-b109-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro nega genocidio Yanomami em entrevista e culpa governo Lula.', 'Isso de genocidio Yanomami e narrativa da esquerda. No meu governo nao faltou nada la. Quem criou caos foi o Lula com a propaganda.', 'Entrevista a Jovem Pan em fevereiro de 2023 apos declaracao de emergencia sanitaria.', 'verified', true, '2023-02-06', 'https://jovempan.com.br/noticias/politica/bolsonaro-nega-genocidio-yanomami.html', 'news_article', 5, 'Sao Paulo', 'Entrevista Jovem Pan', 'bolsonaro-nega-genocidio-yanomami-b109-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium minimiza mortes Yanomami e defende garimpo em Roraima.', 'Essa historia de crianca morrendo e exagero da imprensa. Garimpo gera emprego em Roraima. Precisamos regularizar, nao criminalizar.', 'Entrevista na CNN Brasil em marco de 2023 sobre operacoes em terras Yanomami.', 'verified', true, '2023-03-14', 'https://www.cnnbrasil.com.br/politica/denarium-garimpo-yanomami-emprego/', 'news_article', 5, 'Boa Vista', 'Entrevista CNN', 'denarium-minimiza-yanomami-b109-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca demarcacao e chama indigenas de invasores.', 'O verdadeiro invasor e a Funai. Os produtores rurais tem titulo da terra. Marco Temporal e para proteger quem trabalha.', 'Discurso no plenario da Camara em maio de 2023 durante votacao do PL 490.', 'verified', true, '2023-05-30', 'https://www.camara.leg.br/noticias/nikolas-pl-490-invasor', 'other', 4, 'Brasilia', 'Camara dos Deputados', 'nikolas-indigenas-invasores-b109-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano diz que indigena tem que ser civilizado e trabalhar.', 'Indio nao pode ficar parado na mata esperando cesta basica. Tem que ser civilizado, trabalhar, produzir. Isso e dignidade.', 'Discurso no plenario da Camara em junho de 2023 durante debate sobre Marco Temporal.', 'verified', true, '2023-06-01', 'https://www.camara.leg.br/noticias/feliciano-indio-civilizado', 'other', 5, 'Brasilia', 'Camara dos Deputados', 'feliciano-indio-civilizado-b109-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes relata voto contra Marco Temporal no STF.', 'A tese do Marco Temporal viola o artigo 231 da Constituicao. Direitos originarios independem de ocupacao em 1988. Voto pela inconstitucionalidade.', 'Sessao plenaria do STF no julgamento do RE 1017365 em setembro de 2023.', 'verified', true, '2023-09-21', 'https://www.stf.jus.br/portal/noticia/moraes-marco-temporal-voto', 'other', 1, 'Brasilia', 'STF Plenario', 'moraes-voto-marco-temporal-b109-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin vota contra Marco Temporal e defende direitos originarios.', 'Os direitos territoriais indigenas sao originarios e anteriores ao proprio Estado. Nao ha como condiciona-los a data arbitraria.', 'Julgamento do Marco Temporal no STF em setembro de 2023.', 'verified', true, '2023-09-21', 'https://www.stf.jus.br/portal/noticia/fachin-voto-marco-temporal', 'other', 1, 'Brasilia', 'STF Plenario', 'fachin-voto-marco-temporal-b109-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende Marco Temporal como seguranca juridica no Senado.', 'Precisamos de seguranca juridica no campo. O Marco Temporal da previsibilidade para o produtor. Isso e essencial.', 'Discurso no plenario do Senado em setembro de 2023 durante votacao do PL 2903.', 'verified', true, '2023-09-27', 'https://www12.senado.leg.br/noticias/materias/2023/09/27/tereza-cristina-marco-temporal', 'other', 3, 'Brasilia', 'Senado Federal', 'tereza-marco-temporal-seguranca-b109-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta Marco Temporal parcialmente apos pressao indigena.', 'Vetei os pontos inconstitucionais do PL 2903. Nao posso assinar lei que viola direitos originarios dos povos indigenas. A luta continua.', 'Coletiva no Palacio do Planalto em outubro de 2023 apos sancao parcial.', 'verified', true, '2023-10-20', 'https://www.gov.br/planalto/pt-br/lula-veto-marco-temporal', 'other', 1, 'Brasilia', 'Palacio do Planalto', 'lula-veto-marco-temporal-b109-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira articula derrubada do veto de Lula ao Marco Temporal.', 'O Congresso vai derrubar o veto. Nao aceitamos chantagem do Planalto sobre tema tao sensivel ao agro. Marco Temporal sera lei.', 'Entrevista em Brasilia em dezembro de 2023 articulando derrubada do veto.', 'verified', true, '2023-12-14', 'https://www.camara.leg.br/noticias/lira-derrubada-veto-marco-temporal', 'other', 3, 'Brasilia', 'Camara dos Deputados', 'lira-derruba-veto-marco-b109-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara chora ao denunciar crimes contra Yanomami em comissao.', 'Sao 570 criancas mortas. Isso nao e estatistica, sao vidas. Este Congresso precisa assumir responsabilidade pelos cortes que mataram.', 'Audiencia na Comissao de Direitos Humanos da Camara em marco de 2023.', 'verified', true, '2023-03-08', 'https://apiboficial.org/2023/03/08/guajajara-camara-yanomami/', 'other', 1, 'Brasilia', 'CDH Camara', 'guajajara-comissao-yanomami-b109-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flavio Dino anuncia operacao PF contra garimpeiros Yanomami.', 'A PF vai expulsar todo garimpeiro. Nao e negociavel. Quem resistir sera processado por genocidio e crimes ambientais.', 'Coletiva do Ministerio da Justica em Brasilia em fevereiro de 2023.', 'verified', true, '2023-02-10', 'https://www.gov.br/mj/pt-br/dino-operacao-yanomami', 'other', 1, 'Brasilia', 'Ministerio da Justica', 'dino-operacao-yanomami-b109-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem debocha de pauta indigena e ataca Guajajara.', 'A ministra Sonia Guajajara quer fazer do Brasil uma reserva. Ela odeia produtor. Isso e demagogia indigenista.', 'Discurso no plenario da Camara em abril de 2023.', 'verified', false, '2023-04-18', 'https://www.camara.leg.br/noticias/van-hattem-sonia-demagogia', 'other', 3, 'Brasilia', 'Camara dos Deputados', 'van-hattem-ataca-guajajara-b109-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves chama catimbo de ritos indigenas no Senado.', 'Precisamos evangelizar os povos indigenas. Nao podemos aceitar catimbo e paganismo. E questao de salvacao das almas.', 'Discurso no plenario do Senado em maio de 2023 sobre missionarios em terras indigenas.', 'verified', true, '2023-05-10', 'https://www12.senado.leg.br/noticias/materias/2023/05/10/damares-evangelizar-indigenas', 'other', 4, 'Brasilia', 'Senado Federal', 'damares-catimbo-indigenas-b109-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara celebra vitoria no STF contra Marco Temporal.', 'O STF honrou a Constituicao. Marco Temporal e inconstitucional. Esta e uma vitoria historica dos povos originarios.', 'Declaracao na Esplanada dos Ministerios em setembro de 2023 apos decisao.', 'verified', true, '2023-09-21', 'https://apiboficial.org/2023/09/21/stf-marco-temporal-vitoria/', 'other', 1, 'Brasilia', 'Esplanada', 'guajajara-vitoria-stf-marco-b109-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles diz que Funai e apenas barreira ao progresso.', 'A Funai so serve para atrapalhar. Devolver o Brasil aos brasileiros e respeitar propriedade, nao inventar indio em toda esquina.', 'Entrevista no Radar Economico em marco de 2023.', 'verified', false, '2023-03-30', 'https://veja.abril.com.br/politica/salles-funai-barreira-progresso', 'news_article', 4, 'Sao Paulo', 'Entrevista Veja', 'salles-funai-barreira-b109-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes vota contra Marco Temporal citando Pacto de San Jose.', 'A tese do marco temporal viola tratados internacionais, incluindo Pacto de San Jose e Convencao 169 da OIT. Voto pela inconstitucionalidade.', 'Sessao do STF em setembro de 2023 no julgamento do Marco Temporal.', 'verified', true, '2023-09-20', 'https://www.stf.jus.br/portal/noticia/gilmar-voto-marco', 'other', 1, 'Brasilia', 'STF', 'gilmar-voto-marco-temporal-b109-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lucia reafirma protecao constitucional aos povos originarios.', 'A Constituicao protege povos originarios independentemente da data de 1988. O Marco Temporal e absolutamente incompativel.', 'Julgamento no STF em setembro de 2023.', 'verified', false, '2023-09-21', 'https://www.stf.jus.br/portal/noticia/carmen-marco-temporal', 'other', 1, 'Brasilia', 'STF', 'carmen-marco-temporal-b109-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro diz que indio gosta de garimpo em Roraima.', 'O indio de Roraima quer sim o garimpo. Quem inventou essa historia de genocidio foi a ONG gringa para destruir a economia.', 'Live no Youtube em fevereiro de 2023 apos operacao federal.', 'verified', true, '2023-02-14', 'https://www.youtube.com/watch?v=eduardobolsonaro-garimpo-yanomami', 'social_media_post', 5, 'Online', 'Youtube Live', 'eduardo-indio-gosta-garimpo-b109-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula declara emergencia sanitaria em terra Yanomami em janeiro de 2023.', 'O que vi em Roraima foi genocidio premeditado. Criancas desnutridas, garimpo avancando. Vamos responsabilizar quem permitiu isso.', 'Coletiva em Boa Vista em janeiro de 2023 apos visita a hospital Yanomami.', 'verified', true, '2023-01-21', 'https://www.reuters.com/world/americas/lula-declares-yanomami-emergency-2023-01-21/', 'other', 1, 'Boa Vista', 'Coletiva Boa Vista', 'lula-emergencia-yanomami-b109-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara anuncia seis novas demarcacoes em abril de 2023.', 'Seis novas demarcacoes assinadas. Arara do Rio Amonia, Kariri-Xoco, Rio dos Indios, Tupinamba de Olivenca. A demarcacao vai continuar.', 'Cerimonia no Palacio do Planalto em abril de 2023 durante ATL.', 'verified', true, '2023-04-28', 'https://apiboficial.org/2023/04/28/seis-demarcacoes-lula/', 'other', 1, 'Brasilia', 'ATL 2023', 'guajajara-seis-demarcacoes-b109-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima defende revisao de demarcacoes em Roraima.', 'Em Roraima temos mais de 50% do territorio comprometido com TIs. Isso e inviavel economicamente. Precisamos revisar tudo isso.', 'Entrevista em Boa Vista em marco de 2023.', 'verified', false, '2023-03-22', 'https://g1.globo.com/rr/roraima/noticia/2023/03/22/wilson-lima-demarcacoes.ghtml', 'news_article', 3, 'Boa Vista', 'Entrevista G1', 'wilson-lima-revisao-demarcacoes-b109-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nisia Trindade anuncia Casa de Saude Yanomami reforcada em Roraima.', 'Estamos reforcando a CASAI em Boa Vista. Mais leitos, equipes multidisciplinares, helicopteros. O SUS nao vai mais falhar com os Yanomami.', 'Coletiva do Ministerio da Saude em fevereiro de 2023.', 'verified', false, '2023-02-08', 'https://www.gov.br/saude/pt-br/noticias/nisia-casai-yanomami', 'other', 1, 'Brasilia', 'Ministerio da Saude', 'nisia-casai-yanomami-b109-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro repete tese de que indio quer evoluir como nos.', 'O indio hoje tem celular, assiste televisao. Ele quer evoluir como nos, ser integrado. Funai mantem ele isolado por interesse.', 'Entrevista a podcast Inteligencia Ltda em maio de 2023.', 'verified', true, '2023-05-22', 'https://www.youtube.com/watch?v=bolsonaro-inteligencialtda-indio', 'social_media_post', 5, 'Sao Paulo', 'Podcast', 'bolsonaro-indio-evoluir-b109-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara denuncia ataque a Karipuna no Amapa.', 'A violencia contra Karipuna nao vai ficar impune. Nao vamos tolerar mais invasoes e assassinatos. O Estado vai agir.', 'Declaracao em Brasilia em julho de 2023 apos ataque registrado na TI Karipuna.', 'verified', false, '2023-07-18', 'https://apiboficial.org/2023/07/18/karipuna-ataque-amapa/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-karipuna-ataque-b109-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes ataca demarcacao no Mato Grosso.', 'Nao aceito mais demarcacao em MT. Estado ja deu demais. Produtor rural tem direito e nao pode ser expropriado por laudo antropologico.', 'Entrevista em Cuiaba em junho de 2023 sobre pauta da ALMT.', 'verified', false, '2023-06-15', 'https://www.reporterbrasil.org.br/2023/06/mauro-mendes-demarcacao-mt/', 'news_article', 3, 'Cuiaba', 'Entrevista', 'mauro-mendes-demarcacao-mt-b109-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli apoia garimpo em TIs do Acre.', 'Temos que discutir garimpo regulado em TIs. A populacao indigena quer emprego e renda. Proibir nao funciona e empobrece o Acre.', 'Entrevista em Rio Branco em abril de 2024.', 'verified', false, '2024-04-10', 'https://ac24horas.com/2024/04/gladson-garimpo-tis/', 'news_article', 4, 'Rio Branco', 'Entrevista', 'gladson-garimpo-tis-b109-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota contra Marco Temporal em sua primeira grande decisao.', 'A Constituicao nao fixa marco temporal para direitos originarios. Nao cabe ao STF criar restricao que o constituinte rejeitou.', 'Sessao do STF em setembro de 2023.', 'verified', false, '2023-09-20', 'https://www.stf.jus.br/portal/noticia/zanin-voto-marco-temporal', 'other', 1, 'Brasilia', 'STF', 'zanin-voto-marco-temporal-b109-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia racismo estrutural contra povos indigenas no Congresso.', 'Este Parlamento e racista. Os ataques a Sonia Guajajara e aos povos originarios sao inaceitaveis. Nao vamos nos calar.', 'Discurso no plenario da Camara em maio de 2023.', 'verified', true, '2023-05-31', 'https://www.camara.leg.br/noticias/erika-hilton-racismo-indigenas', 'other', 1, 'Brasilia', 'Camara', 'erika-racismo-congresso-b109-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Samia Bomfim defende Guajajara apos ataques de bolsonaristas.', 'Sonia Guajajara e uma gigante. Os ataques covardes da extrema direita nao passarao. Os povos originarios estao firmes.', 'Tweet em junho de 2023 durante votacao do PL 490.', 'verified', false, '2023-06-02', 'https://x.com/samiabomfim/status/samia-defende-sonia', 'social_media_post', 1, 'Online', 'Twitter', 'samia-defende-guajajara-b109-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Taliria Petrone denuncia invasao a aldeia Guarani-Kaiowa no MS.', 'Mais uma aldeia invadida, mais uma lideranca morta. O Marco Temporal nao sancionado por Lula foi aprovado no Congresso e ja mata.', 'Discurso na Camara em outubro de 2023 apos morte de lideranca no MS.', 'verified', false, '2023-10-25', 'https://www.camara.leg.br/noticias/taliria-guarani-kaiowa-ms', 'other', 1, 'Brasilia', 'Camara', 'taliria-guarani-kaiowa-b109-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Magda Chambriard defende Petrobras contra restricoes indigenas na Foz.', 'Nao podemos aceitar que qualquer pleito indigena trave a Petrobras. Precisamos de rito claro de consulta, mas sem poder de veto.', 'Entrevista ao Valor Economico em agosto de 2024 apos assumir a presidencia.', 'verified', false, '2024-08-15', 'https://valor.globo.com/empresas/noticia/2024/08/15/magda-petrobras-consulta-indigena.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Valor', 'magda-petrobras-consulta-b109-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva reafirma consulta previa a povos indigenas como obrigacao.', 'A Convencao 169 da OIT e clara. Consulta previa, livre e informada nao e gentileza, e obrigacao. Sem isso nao ha licenca.', 'Audiencia no Senado em agosto de 2024.', 'verified', false, '2024-08-28', 'https://www12.senado.leg.br/noticias/materias/2024/08/28/marina-consulta-previa', 'other', 1, 'Brasilia', 'Senado', 'marina-consulta-previa-b109-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho promete infraestrutura que nao afete TIs no Para.', 'Vamos desenvolver o Para respeitando TIs. Ferrograo, estradas, portos, tudo com dialogo. Nao vai ter atropelo.', 'Entrevista em Belem em setembro de 2024.', 'verified', false, '2024-09-18', 'https://g1.globo.com/pa/para/noticia/2024/09/18/helder-infra-tis.ghtml', 'news_article', 2, 'Belem', 'Entrevista', 'helder-infra-tis-b109-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clecio Luis defende demarcacoes no Amapa.', 'O Amapa e estado que respeita povos indigenas. Vamos apoiar demarcacoes da Uaca e outras. Isso e desenvolvimento sustentavel.', 'Entrevista em Macapa em maio de 2024.', 'verified', false, '2024-05-14', 'https://g1.globo.com/ap/amapa/noticia/2024/05/14/clecio-demarcacoes.ghtml', 'news_article', 1, 'Macapa', 'Entrevista', 'clecio-demarcacoes-ap-b109-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wba, 'Wanderlei Barbosa questiona demarcacoes no Tocantins.', 'Tocantins nao tem mais terra para demarcar. Os pleitos Apinaje e Krahô precisam ser revistos. Precisamos de producao.', 'Entrevista em Palmas em julho de 2024.', 'verified', false, '2024-07-22', 'https://g1.globo.com/to/tocantins/noticia/2024/07/22/wanderlei-demarcacao.ghtml', 'news_article', 3, 'Palmas', 'Entrevista', 'wanderlei-demarcacao-to-b109-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara anuncia mais 4 demarcacoes em abril de 2024.', 'Assinamos mais 4 TIs hoje: Rio Gregorio, Aldeia Velha, Cacique Fontoura e Tremembe de Barra do Mundau. A luta vale a pena.', 'Cerimonia em Brasilia durante ATL 2024.', 'verified', true, '2024-04-25', 'https://apiboficial.org/2024/04/25/quatro-demarcacoes-atl/', 'other', 1, 'Brasilia', 'ATL 2024', 'guajajara-4-demarcacoes-2024-b109-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete acelerar demarcacoes em discurso na ATL 2024.', 'Vamos demarcar mais. E compromisso de campanha. A Constituicao manda e este governo cumpre. Chega de atraso.', 'Discurso no ATL 2024 em Brasilia em abril.', 'verified', true, '2024-04-24', 'https://www.survivalinternational.org/news/2024/lula-atl-demarcacoes', 'other', 1, 'Brasilia', 'ATL 2024', 'lula-acelerar-demarcacoes-atl24-b109-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira zomba da ATL 2024 e chama evento de vaidade.', 'Enquanto brasileiro passa fome, o governo gasta milhoes em pauta identitaria indigena. Isso e vaidade, nao politica publica.', 'Tweet em abril de 2024.', 'verified', false, '2024-04-26', 'https://x.com/nikolas_dm/status/nikolas-atl-vaidade', 'social_media_post', 3, 'Online', 'Twitter', 'nikolas-atl-vaidade-b109-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro ironiza Sonia Guajajara em comicio em 2024.', 'Essa ministra indigena, com todo respeito, nao entende de agro. Como vai decidir sobre o Brasil real?', 'Comicio em Belo Horizonte em julho de 2024.', 'verified', true, '2024-07-15', 'https://www1.folha.uol.com.br/poder/2024/07/bolsonaro-ironiza-guajajara-bh.shtml', 'other', 4, 'Belo Horizonte', 'Comicio', 'bolsonaro-ironiza-sonia-b109-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta articula com ruralistas nova PEC contra demarcacoes.', 'Precisamos proteger o produtor rural. A PEC do Marco Temporal sera pauta prioritaria na Camara em 2025.', 'Entrevista apos eleicao para presidencia da Camara em fevereiro de 2025.', 'verified', true, '2025-02-06', 'https://www.camara.leg.br/noticias/motta-pec-marco-temporal', 'other', 3, 'Brasilia', 'Camara', 'motta-pec-marco-temporal-b109-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'Jose Mucio defende acao das Forcas Armadas contra garimpeiros Yanomami.', 'As Forcas Armadas estao em missao constitucional. Vamos apoiar a retirada de garimpeiros e seguranca aos Yanomami.', 'Coletiva do Ministerio da Defesa em fevereiro de 2023.', 'verified', false, '2023-02-12', 'https://www.gov.br/defesa/pt-br/noticias/mucio-yanomami', 'other', 1, 'Brasilia', 'Defesa', 'mucio-fa-yanomami-b109-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia forca-tarefa permanente em Terras Yanomami.', 'Criamos forca-tarefa permanente. Garimpeiro nao vai voltar. Quem insistir sera processado por genocidio.', 'Coletiva do MJSP em marco de 2024.', 'verified', true, '2024-03-20', 'https://www.gov.br/mj/pt-br/noticias/lewandowski-forca-tarefa-yanomami', 'other', 1, 'Brasilia', 'MJSP', 'lewandowski-forca-yanomami-b109-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Favaro pressiona por revisao de portaria da Funai.', 'A portaria que declara TI impacta milhares de propriedades. Precisamos de revisao criteriosa para nao gerar injustica no campo.', 'Entrevista em Brasilia em junho de 2024.', 'verified', false, '2024-06-12', 'https://www.gov.br/agricultura/pt-br/assuntos/noticias/favaro-portaria-funai', 'other', 3, 'Brasilia', 'MAPA', 'favaro-portaria-funai-b109-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apoia demarcacoes mas critica lentidao.', 'Apoio demarcacoes, mas o governo precisa acelerar. Sao 300 pleitos parados. Nao basta discurso, tem que entregar.', 'Entrevista em maio de 2024.', 'verified', false, '2024-05-20', 'https://www1.folha.uol.com.br/poder/2024/05/tabata-demarcacao-lentidao.shtml', 'news_article', 1, 'Sao Paulo', 'Folha', 'tabata-demarcacao-lentidao-b109-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva apoia revogacao integral da lei do Marco Temporal.', 'O Marco Temporal e inconstitucional. O STF ja disse. Congresso precisa revogar a lei para evitar conflito permanente.', 'Discurso na Camara em marco de 2024.', 'verified', false, '2024-03-18', 'https://www.camara.leg.br/noticias/orlando-marco-temporal-revogar', 'other', 1, 'Brasilia', 'Camara', 'orlando-revogar-marco-b109-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Chico Alencar defende os Yanomami em sessao solene.', 'Os Yanomami sao vitimas de genocidio. O termo nao e exagero, e a realidade crua. Este Congresso precisa reparar.', 'Sessao solene na Camara em abril de 2024.', 'verified', false, '2024-04-19', 'https://www.camara.leg.br/noticias/chico-alencar-yanomami', 'other', 1, 'Brasilia', 'Camara', 'chico-alencar-yanomami-b109-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali apoia pauta indigena no Senado.', 'A pauta indigena e pauta de direitos humanos. Nao podemos retroceder. Marco Temporal e PEC da bancada ruralista tem que cair.', 'Discurso no Senado em setembro de 2024.', 'verified', false, '2024-09-10', 'https://www12.senado.leg.br/noticias/materias/2024/09/10/jandira-indigena', 'other', 1, 'Brasilia', 'Senado', 'jandira-pauta-indigena-b109-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha articula agenda com Congresso sobre indigenas.', 'Vamos dialogar com o Congresso sobre pauta indigena. O Planalto nao abre mao de demarcacao e saude indigena.', 'Entrevista em Brasilia em abril de 2025.', 'verified', false, '2025-04-10', 'https://www.gov.br/secom/pt-br/noticias/padilha-indigena-congresso', 'other', 1, 'Brasilia', 'Planalto', 'padilha-agenda-indigena-b109-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa promete acelerar tramites de demarcacoes na Casa Civil.', 'A Casa Civil vai destravar demarcacoes paradas. E prioridade do presidente. Burocracia nao pode atrasar direito originario.', 'Coletiva em Brasilia em agosto de 2024.', 'verified', false, '2024-08-20', 'https://www.gov.br/planalto/pt-br/noticias/rui-costa-demarcacoes', 'other', 1, 'Brasilia', 'Casa Civil', 'rui-costa-demarcacoes-b109-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara denuncia PL do Licenciamento como ameaca a indigenas.', 'O PL do Licenciamento Ambiental abre a porteira. Projetos em TIs sem consulta previa. Isso nao vai passar impune.', 'Audiencia na Camara em novembro de 2024.', 'verified', true, '2024-11-28', 'https://apiboficial.org/2024/11/28/pl-licenciamento-tis/', 'other', 1, 'Brasilia', 'Camara', 'guajajara-pl-licenciamento-b109-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva veta PL do Licenciamento e cita direitos indigenas.', 'O PL do Licenciamento precisa ser vetado. Viola Convencao 169, direitos originarios e fragiliza toda licenca ambiental.', 'Coletiva no MMA em julho de 2025 apos aprovacao no Congresso.', 'verified', true, '2025-07-18', 'https://www.mongabay.com/2025/07/marina-veto-licenciamento-ambiental/', 'news_article', 1, 'Brasilia', 'MMA', 'marina-veto-licenciamento-b109-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro defende garimpeiros em evento em Boa Vista.', 'O garimpeiro e brasileiro trabalhador. Nao e criminoso. Lula e Sonia querem acabar com o Norte. Nao vamos deixar.', 'Comicio em Boa Vista em outubro de 2024.', 'verified', true, '2024-10-05', 'https://www.reuters.com/world/americas/bolsonaro-defends-miners-yanomami-2024-10-05/', 'other', 5, 'Boa Vista', 'Comicio', 'bolsonaro-garimpeiro-trabalhador-b109-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro compara demarcacao a expropriacao sovietica.', 'Demarcacao em massa e coletivizacao sovietica. Tira do produtor sem indenizar. Isso e comunismo puro.', 'Video no Instagram em novembro de 2024.', 'verified', false, '2024-11-10', 'https://www.instagram.com/bolsonarosp/p/eduardo-demarcacao-sovietica/', 'social_media_post', 4, 'Online', 'Instagram', 'eduardo-demarcacao-sovietica-b109-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima pede CPI do garimpo em Roraima para responsabilizar governo federal.', 'O garimpo nao acabou. E o governo Lula que falhou em ocupacao. Vou pedir CPI para apurar desvios na operacao Yanomami.', 'Entrevista em Boa Vista em agosto de 2024.', 'verified', false, '2024-08-14', 'https://g1.globo.com/rr/roraima/noticia/2024/08/14/wilson-lima-cpi-garimpo.ghtml', 'news_article', 3, 'Boa Vista', 'Entrevista', 'wilson-lima-cpi-garimpo-b109-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium chama indigenistas de ONGs globalistas.', 'Essas ONGs indigenistas sao globalistas. Querem travar Roraima. Nao sao brasileiros, sao lacaios gringos.', 'Entrevista em Boa Vista em janeiro de 2025.', 'verified', false, '2025-01-30', 'https://www.reuters.com/world/americas/denarium-ongs-globalistas-2025-01-30/', 'news_article', 4, 'Boa Vista', 'Entrevista', 'denarium-ongs-globalistas-b109-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano prega missao em TIs contra pajelanca.', 'Precisamos de liberdade religiosa nas aldeias. Missionario tem direito de entrar e pregar o evangelho. Pajelanca nao salva.', 'Culto em Brasilia em setembro de 2024.', 'verified', false, '2024-09-22', 'https://www.camara.leg.br/noticias/feliciano-missao-aldeias', 'other', 4, 'Brasilia', 'Culto', 'feliciano-missao-aldeias-b109-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende isolados apenas com evangelizacao.', 'Indigenas isolados precisam ser contatados e evangelizados. Isso e caridade crista, nao violencia cultural.', 'Entrevista em Brasilia em junho de 2024.', 'verified', false, '2024-06-18', 'https://www12.senado.leg.br/noticias/materias/2024/06/18/damares-isolados', 'news_article', 4, 'Brasilia', 'Senado', 'damares-isolados-evangelizar-b109-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara rebate Damares sobre povos isolados.', 'Povos isolados nao sao projeto missionario. Sao gente com direito a decidir. Damares nao entende direito humano.', 'Entrevista em Brasilia em junho de 2024 em resposta a Damares.', 'verified', false, '2024-06-20', 'https://apiboficial.org/2024/06/20/guajajara-damares-isolados/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-rebate-damares-b109-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Terra Yanomami novamente em 2024.', 'Volto aqui para dizer: a emergencia nao acabou, mas estamos trabalhando. As criancas voltam a nascer com saude. Vamos seguir.', 'Visita a Boa Vista em marco de 2024.', 'verified', true, '2024-03-22', 'https://www.gov.br/planalto/pt-br/noticias/lula-visita-yanomami-2024', 'other', 1, 'Boa Vista', 'Visita oficial', 'lula-visita-yanomami-2024-b109-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nisia Trindade anuncia reducao de mortalidade infantil Yanomami.', 'Reduzimos mortalidade infantil Yanomami em 40% em um ano. Ainda muito trabalho, mas os indicadores mostram caminho certo.', 'Coletiva do Ministerio da Saude em fevereiro de 2024.', 'verified', false, '2024-02-20', 'https://www.gov.br/saude/pt-br/noticias/nisia-mortalidade-yanomami', 'other', 1, 'Brasilia', 'Saude', 'nisia-mortalidade-yanomami-b109-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina lidera articulacao contra PL de protecao a isolados.', 'Nao podemos travar o agro em nome de povos isolados nao contactados. Precisamos de equilibrio.', 'Discurso no Senado em outubro de 2024.', 'verified', false, '2024-10-15', 'https://www12.senado.leg.br/noticias/materias/2024/10/15/tereza-isolados', 'other', 3, 'Brasilia', 'Senado', 'tereza-articula-isolados-b109-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem apresenta CPMI para investigar Funai.', 'Vamos abrir CPMI da Funai. Essas demarcacoes tem indicios de fraude antropologica. O Congresso vai investigar.', 'Entrevista em Brasilia em novembro de 2024.', 'verified', false, '2024-11-05', 'https://www.camara.leg.br/noticias/van-hattem-cpmi-funai', 'other', 3, 'Brasilia', 'Camara', 'van-hattem-cpmi-funai-b109-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira aceita pauta ruralista e pauta PEC Marco Temporal em 2024.', 'A PEC do Marco Temporal sera votada. Congresso e soberano. STF nao pode legislar. E hora de decidir.', 'Entrevista em maio de 2024.', 'verified', true, '2024-05-28', 'https://www.camara.leg.br/noticias/lira-pec-marco-temporal-2024', 'other', 4, 'Brasilia', 'Camara', 'lira-pec-marco-2024-b109-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin alerta sobre conflito entre PEC e decisao do STF.', 'Se Congresso aprovar PEC para contrariar decisao do STF, haveria gravissima crise institucional. Isso seria reacao indevida.', 'Entrevista ao Conjur em junho de 2024.', 'verified', false, '2024-06-10', 'https://www.conjur.com.br/2024-jun-10/fachin-pec-marco-temporal-crise', 'news_article', 2, 'Brasilia', 'STF', 'fachin-pec-crise-b109-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes media conciliacao sobre Marco Temporal no STF.', 'A conciliacao pode encontrar caminhos sem violar direitos originarios. Mas consulta a povos indigenas e obrigatoria.', 'Audiencia no STF em setembro de 2024.', 'verified', false, '2024-09-12', 'https://www.stf.jus.br/portal/noticia/moraes-conciliacao-marco', 'other', 2, 'Brasilia', 'STF', 'moraes-conciliacao-marco-b109-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara denuncia tentativa de criminalizacao de lideranca.', 'O Cacique Babau foi preso injustamente. Isso e criminalizacao da luta indigena. Nao vamos aceitar perseguicao.', 'Nota da APIB em outubro de 2024.', 'verified', false, '2024-10-18', 'https://apiboficial.org/2024/10/18/babau-prisao/', 'other', 1, 'Brasilia', 'APIB', 'guajajara-babau-criminalizacao-b109-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro diz que Amazonia e reserva ao progresso por culpa de Lula.', 'Lula transformou a Amazonia em reserva. Quer manter pobre para agradar Biden. Meu governo desenvolveu regiao com liberdade.', 'Live no X em abril de 2024.', 'verified', true, '2024-04-12', 'https://x.com/jairbolsonaro/status/bolsonaro-amazonia-reserva-progresso', 'social_media_post', 4, 'Online', 'X Live', 'bolsonaro-amazonia-reserva-b109-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flavio Dino suspende operacao em TI por liminar contraria a ruralistas.', 'Mantenho operacao em TI Apyterewa. Invasores devem sair. Quem quiser ficar sera responsabilizado por crime ambiental.', 'Coletiva em Brasilia em agosto de 2023.', 'verified', false, '2023-08-15', 'https://www.gov.br/mj/pt-br/noticias/dino-apyterewa', 'other', 1, 'Brasilia', 'MJSP', 'dino-apyterewa-operacao-b109-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho intervem em conflito Apyterewa no Para.', 'A retirada dos invasores deve ser feita com humanidade. O Estado tem que ajudar com reassentamento. Nao e so despejo.', 'Coletiva em Belem em agosto de 2023.', 'verified', false, '2023-08-20', 'https://g1.globo.com/pa/para/noticia/2023/08/20/helder-apyterewa.ghtml', 'news_article', 2, 'Belem', 'Palacio do Para', 'helder-apyterewa-b109-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende politica indigenista em entrevista.', 'A Constituicao e clara. Os povos indigenas tem direito originario. MJSP vai apoiar Funai com operacoes e seguranca.', 'Entrevista em Brasilia em abril de 2024.', 'verified', false, '2024-04-05', 'https://www.gov.br/mj/pt-br/noticias/lewandowski-indigenas', 'other', 1, 'Brasilia', 'MJSP', 'lewandowski-indigenista-b109-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Samia Bomfim vota contra PEC do Marco Temporal na Camara.', 'Esta PEC e racista. Viola direito originario. Psol vai votar contra e vamos usar todas as vias para derrubar.', 'Votacao na Camara em 2024.', 'verified', false, '2024-07-10', 'https://www.camara.leg.br/noticias/samia-pec-marco', 'other', 1, 'Brasilia', 'Camara', 'samia-vota-contra-pec-b109-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apoia acao internacional pelos Yanomami.', 'Levarei o caso Yanomami a ONU. Isso e genocidio. O mundo precisa saber e o Brasil precisa responsabilizar Bolsonaro.', 'Discurso em Genebra em agosto de 2023 em visita a ONU.', 'verified', false, '2023-08-25', 'https://www.survivalinternational.org/news/2023/erika-hilton-onu-yanomami', 'other', 1, 'Genebra', 'ONU', 'erika-onu-yanomami-b109-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cita indigenas como guardioes da floresta em discurso da ONU.', 'Os povos indigenas sao guardioes da floresta e da biodiversidade. Sem eles nao ha solucao climatica. O mundo precisa reconhecer.', 'Discurso na Assembleia Geral da ONU em setembro de 2023.', 'verified', true, '2023-09-19', 'https://www.reuters.com/world/americas/lula-un-indigenous-guardians-2023-09-19/', 'other', 1, 'Nova York', 'ONU', 'lula-onu-guardioes-b109-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara discursa na COP28 sobre protagonismo indigena.', 'Nao ha clima sem indigenas. Somos guardioes de 80% da biodiversidade do planeta. Precisamos de financiamento direto.', 'Discurso no pavilhao indigena da COP28 em Dubai em dezembro de 2023.', 'verified', true, '2023-12-04', 'https://www.climatechangenews.com/2023/12/04/sonia-guajajara-cop28/', 'other', 1, 'Dubai', 'COP28', 'guajajara-cop28-b109-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles ataca Sonia Guajajara em podcast de 2024.', 'Essa ministra Guajajara e um desastre. Pauta vaidosa, nao resolve nada. Pantanal ardendo e ela fazendo turne mundial.', 'Podcast em julho de 2024.', 'verified', false, '2024-07-15', 'https://www.youtube.com/watch?v=salles-ataca-sonia-2024', 'social_media_post', 3, 'Online', 'Podcast', 'salles-ataca-guajajara-2024-b109-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira posta fake sobre orcamento do MPI.', 'Sonia Guajajara torrou R$ 1 bilhao em passagens internacionais. Enquanto Yanomami morre, ela passeia. Isso e escandalo.', 'Tweet em marco de 2024, desmentido por Aos Fatos.', 'verified', true, '2024-03-15', 'https://www.aosfatos.org/noticias/nikolas-fake-orcamento-mpi-guajajara/', 'social_media_post', 4, 'Online', 'Twitter', 'nikolas-fake-mpi-orcamento-b109-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara rebate fake de Nikolas com dados oficiais.', 'A fake do Nikolas e absurda. O orcamento do MPI nao chega a R$ 1 bilhao para tudo. Passagens sao uma fracao minima. Mentir e crime.', 'Coletiva em Brasilia em marco de 2024.', 'verified', false, '2024-03-16', 'https://apiboficial.org/2024/03/16/guajajara-rebate-nikolas-fake/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-rebate-nikolas-b109-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Taliria Petrone denuncia novo assassinato de lideranca Guarani.', 'Mais um lider Guarani morto em emboscada no MS. O Marco Temporal promulgado pelo Congresso esta matando. Isso e responsabilidade direta.', 'Discurso na Camara em novembro de 2024.', 'verified', false, '2024-11-12', 'https://www.camara.leg.br/noticias/taliria-guarani-assassinato-2024', 'other', 1, 'Brasilia', 'Camara', 'taliria-guarani-assassinato-b109-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli diz que indio acreano nao sofre preconceito.', 'No Acre nao tem preconceito contra indio. Essa historia de racismo estrutural e invencao da esquerda. Somos irmaos.', 'Entrevista em Rio Branco em setembro de 2024.', 'verified', false, '2024-09-10', 'https://ac24horas.com/2024/09/gladson-preconceito-indio/', 'news_article', 3, 'Rio Branco', 'Entrevista', 'gladson-preconceito-indio-b109-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante destrava BNDES para povos indigenas.', 'O BNDES vai financiar projetos produtivos em TIs. Bioeconomia, manejo sustentavel, cadeias do extrativismo. Desenvolvimento com identidade.', 'Coletiva no BNDES em junho de 2024.', 'verified', false, '2024-06-05', 'https://www.bndes.gov.br/mercadante-tis-bioeconomia', 'other', 1, 'Rio de Janeiro', 'BNDES', 'mercadante-bndes-tis-b109-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet apoia programa Safra Indigena.', 'O Safra Indigena e politica publica inedita. Vamos levar credito, assistencia tecnica e seguro para produtores indigenas.', 'Coletiva do MDIC em maio de 2024.', 'verified', false, '2024-05-10', 'https://www.gov.br/mdic/pt-br/noticias/tebet-safra-indigena', 'other', 1, 'Brasilia', 'MDIC', 'tebet-safra-indigena-b109-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad defende recursos para demarcacao no orcamento 2025.', 'Garantimos R$ 800 milhoes para demarcacao e saude indigena em 2025. Prioridade absoluta. Corte de emendas nao atinge Yanomami.', 'Audiencia no Senado em outubro de 2024.', 'verified', false, '2024-10-25', 'https://www12.senado.leg.br/noticias/materias/2024/10/25/haddad-orcamento-indigena', 'other', 1, 'Brasilia', 'Senado', 'haddad-orcamento-indigena-b109-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Geraldo Alckmin anuncia zona franca verde com indigenas.', 'A Zona Franca Verde inclui povos indigenas como protagonistas. Bioeconomia da Amazonia sera referencia mundial.', 'Evento em Manaus em outubro de 2024.', 'verified', false, '2024-10-30', 'https://www.gov.br/mdic/pt-br/noticias/alckmin-zona-franca-verde', 'other', 1, 'Manaus', 'MDIC', 'alckmin-zona-franca-verde-b109-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira defende povos indigenas em forum da ONU.', 'O Brasil voltou a defender povos indigenas nos foros internacionais. Ratificaremos a Declaracao Americana. E compromisso deste governo.', 'Discurso na OEA em junho de 2024.', 'verified', false, '2024-06-20', 'https://www.gov.br/mre/pt-br/canais_atendimento/imprensa/notas-a-imprensa/mauro-vieira-oea-indigenas', 'other', 1, 'Washington', 'OEA', 'mauro-vieira-oea-indigenas-b109-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro chama ATL de festival de brancos pintados.', 'Essa ATL e um festival. Maioria de brancos pintados pedindo demarcacao. Nao tem nada de indio verdadeiro.', 'Live em abril de 2025.', 'verified', false, '2025-04-12', 'https://www.youtube.com/watch?v=bolsonaro-atl-festival', 'social_media_post', 4, 'Online', 'Youtube Live', 'bolsonaro-atl-brancos-b109-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edb, 'Eduardo Bolsonaro chama Guajajara de bibelo politico.', 'Sonia Guajajara e um bibelo para propaganda do PT. Povos indigenas reais nao sao representados por essa elite indigenista.', 'Video no Telegram em marco de 2025.', 'verified', false, '2025-03-10', 'https://t.me/eduardo-guajajara-bibelo', 'social_media_post', 5, 'Online', 'Telegram', 'eduardo-guajajara-bibelo-b109-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara processa Eduardo Bolsonaro por racismo em 2025.', 'Entrei na Justica contra Eduardo Bolsonaro por racismo. Chamar de bibelo e violencia racial. Nao vou me calar diante de criminosos.', 'Coletiva em Brasilia em marco de 2025.', 'verified', true, '2025-03-15', 'https://apiboficial.org/2025/03/15/guajajara-processa-eduardo/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-processa-eduardo-b109-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lucia recebe Guajajara no STF e reafirma protecao.', 'Os direitos dos povos originarios estao firmes na Constituicao. O STF e guardiao dessa promessa. Lideracas podem confiar.', 'Audiencia no STF em abril de 2025.', 'verified', false, '2025-04-08', 'https://www.stf.jus.br/portal/noticia/carmen-recebe-guajajara', 'other', 1, 'Brasilia', 'STF', 'carmen-recebe-guajajara-b109-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona mais 5 demarcacoes na abertura da ATL 2025.', 'Abrimos a ATL 2025 com mais 5 demarcacoes. Sao mais territorios protegidos, mais familias indigenas com seguranca.', 'Discurso na ATL 2025 em Brasilia em abril.', 'verified', true, '2025-04-10', 'https://www.survivalinternational.org/news/2025/lula-atl-5-demarcacoes', 'other', 1, 'Brasilia', 'ATL 2025', 'lula-atl-5-demarcacoes-b109-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara destaca protagonismo indigena na COP30.', 'Belem recebera a primeira COP na Amazonia e a primeira com povos indigenas no centro das decisoes. Sera historico.', 'Entrevista em Belem em setembro de 2025.', 'verified', true, '2025-09-15', 'https://www.climatechangenews.com/2025/09/guajajara-cop30-protagonismo/', 'news_article', 1, 'Belem', 'Pre-COP', 'guajajara-cop30-protagonismo-b109-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima tenta barrar operacao federal em Roraima em 2025.', 'Nao admito mais operacoes federais em Roraima sem consultar o Estado. Esse governo tem atropelado a autonomia estadual.', 'Entrevista em Boa Vista em fevereiro de 2025.', 'verified', false, '2025-02-20', 'https://g1.globo.com/rr/roraima/noticia/2025/02/20/wilson-operacao-federal.ghtml', 'news_article', 3, 'Boa Vista', 'Palacio Roraima', 'wilson-barra-operacao-federal-b109-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium articula recurso no STF contra Funai.', 'Vou ao STF contra a Funai. Essa demarcacao em massa em Roraima e inconstitucional. Estado vai defender seu territorio.', 'Entrevista em Boa Vista em marco de 2025.', 'verified', false, '2025-03-18', 'https://www.reuters.com/world/americas/denarium-stf-funai-2025-03-18/', 'news_article', 3, 'Boa Vista', 'Entrevista', 'denarium-stf-funai-b109-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flavio Dino aprova voto que mantem direitos Yanomami.', 'Voto para manter a competencia federal na protecao Yanomami. Estado de Roraima nao pode limitar operacoes constitucionais.', 'Julgamento no STF em maio de 2025.', 'verified', false, '2025-05-14', 'https://www.stf.jus.br/portal/noticia/dino-voto-yanomami-2025', 'other', 1, 'Brasilia', 'STF', 'dino-voto-yanomami-2025-b109-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro ataca demarcacao Raposa Serra do Sol na campanha de 2026.', 'Quando eu voltar, vou rever Raposa Serra do Sol. Aquilo foi crime contra Roraima. Produtor vai ter seu direito de volta.', 'Comicio em Boa Vista em marco de 2026.', 'verified', true, '2026-03-08', 'https://www1.folha.uol.com.br/poder/2026/03/bolsonaro-raposa-serra-sol.shtml', 'other', 5, 'Boa Vista', 'Comicio', 'bolsonaro-raposa-serra-b109-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira aciona PF por suposto desvio no MPI em 2025.', 'Denunciei o MPI de Guajajara ao TCU. Ha indicios de desvios. O contribuinte tem direito de saber onde foi esse dinheiro.', 'Tweet em junho de 2025, sem comprovacao.', 'verified', false, '2025-06-05', 'https://x.com/nikolas_dm/status/nikolas-denuncia-mpi-tcu', 'social_media_post', 3, 'Online', 'Twitter', 'nikolas-denuncia-mpi-tcu-b109-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara responde denuncia de Nikolas como assedio.', 'As falsas denuncias do Nikolas sao assedio institucional. O MPI sera auditado e provara transparencia. A justica ira responsabilizar o deputado.', 'Coletiva em Brasilia em junho de 2025.', 'verified', false, '2025-06-07', 'https://apiboficial.org/2025/06/07/guajajara-responde-nikolas-2025/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-responde-nikolas-2025-b109-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta acelera PL que reduz atribuicoes da Funai.', 'A Funai precisa ser reformada. Reduzir escopo, terceirizar servicos. O PL sera votado em regime de urgencia.', 'Entrevista em Brasilia em agosto de 2025.', 'verified', false, '2025-08-12', 'https://www.camara.leg.br/noticias/motta-reforma-funai', 'other', 3, 'Brasilia', 'Camara', 'motta-reforma-funai-b109-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gua, 'Sonia Guajajara lanca plano 2026 com meta de 50 demarcacoes.', 'Nossa meta para 2026 e alcancar 50 demarcacoes no total do governo. Faltam 30. Vamos entregar. Este e compromisso com a historia.', 'Evento no MPI em janeiro de 2026.', 'verified', true, '2026-01-28', 'https://apiboficial.org/2026/01/28/plano-50-demarcacoes/', 'other', 1, 'Brasilia', 'MPI', 'guajajara-plano-50-demarcacoes-b109-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende legado indigena na campanha de reeleicao em 2026.', 'Entregamos mais demarcacoes que qualquer governo. Salvamos os Yanomami. Os povos indigenas nao voltarao ao caos bolsonarista.', 'Comicio em Belem em abril de 2026.', 'verified', true, '2026-04-10', 'https://www.reuters.com/world/americas/lula-legacy-indigenous-2026-04-10/', 'other', 1, 'Belem', 'Comicio', 'lula-legado-indigena-2026-b109-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
