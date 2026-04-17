-- Batch 125: Julgamentos e condenações do 8 de Janeiro (2023-2026)
DO $$
DECLARE
  v_mor UUID; v_car UUID; v_zan UUID; v_din UUID; v_bar UUID;
  v_fac UUID; v_mes UUID; v_lew UUID; v_lul UUID; v_wag UUID;
  v_jai UUID; v_edu UUID; v_fla UUID; v_car2 UUID; v_mic UUID;
  v_nik UUID; v_zam UUID; v_ram UUID; v_kic UUID; v_fel UUID;
  v_dam UUID; v_mag UUID; v_mou UUID; v_van UUID; v_mor2 UUID;
  v_lir UUID; v_mot UUID; v_pac UUID; v_alc UUID; v_gle UUID;
  v_lin UUID; v_hum UUID; v_eli UUID; v_dua UUID; v_ran UUID;
  v_eri UUID; v_sam UUID;
  c_ant UUID; c_vio UUID; c_aut UUID; c_abu UUID; c_obs UUID;
  c_ame UUID; c_odi UUID; c_des UUID; c_neg UUID; c_int UUID;
  c_con UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_wag FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_mor2 FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_eli FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes inicia julgamentos dos primeiros réus do 8 de Janeiro no STF.', 'Os atos de 8 de janeiro foram uma tentativa de golpe de Estado e serão punidos com rigor.', 'Sessão do STF que iniciou o julgamento dos executores dos atos antidemocráticos.', 'verified', true, '2023-09-13', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=514894', 'official_document', 1, 'Brasília', 'Julgamento 8 de Janeiro', 'moraes-inicia-julgamentos-b125-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes condena Aécio Pereira a 17 anos pela invasão do Congresso.', 'A responsabilização é essencial para que tais atos nunca mais se repitam.', 'Primeira condenação em definitivo de réu do 8 de Janeiro pelo STF.', 'verified', true, '2023-09-14', 'https://g1.globo.com/politica/noticia/2023/09/14/stf-condena-aecio-pereira-8-de-janeiro.ghtml', 'news_article', 1, 'Brasília', 'Primeira condenação 8J', 'moraes-condena-aecio-pereira-b125-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro critica condenações e chama réus do 8J de patriotas.', 'Essas pessoas não merecem ser tratadas como criminosas, são patriotas.', 'Entrevista a apoiadores em frente a sua casa em Brasília.', 'verified', true, '2023-09-15', 'https://www1.folha.uol.com.br/poder/2023/09/bolsonaro-chama-reus-8j-patriotas.shtml', 'news_article', 4, 'Brasília', 'Declaração a apoiadores', 'bolsonaro-reus-patriotas-b125-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca STF e chama Moraes de ditador em discurso na Câmara.', 'Alexandre de Moraes é um ditador de toga que está destruindo a democracia.', 'Discurso em plenário da Câmara dos Deputados.', 'verified', true, '2023-09-19', 'https://www.camara.leg.br/noticias/2023/09/nikolas-ferreira-ataca-stf.html', 'official_document', 3, 'Câmara dos Deputados', 'Discurso em plenário', 'nikolas-ataca-moraes-ditador-b125-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia vota pela condenação de ré do 8J por dano ao patrimônio.', 'O ataque à sede dos três Poderes é ataque ao coração da República.', 'Sessão do STF sobre atos de 8 de janeiro.', 'verified', false, '2023-09-20', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=515120', 'official_document', 1, 'Brasília', 'Voto no STF', 'carmen-lucia-voto-8j-b125-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota com relator e condena réu do 8J a 14 anos.', 'A democracia exige responsabilização de quem atenta contra ela.', 'Sessão do STF no julgamento de executores do 8J.', 'verified', false, '2023-09-21', 'https://g1.globo.com/politica/noticia/2023/09/21/zanin-vota-condenacao-reu-8j.ghtml', 'news_article', 1, 'Brasília', 'Voto no STF', 'zanin-vota-condenacao-8j-b125-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino afirma que ministérios colaboram com investigações do 8J.', 'Nenhum envolvido terá proteção do governo, a apuração seguirá até o fim.', 'Entrevista coletiva sobre investigações federais.', 'verified', false, '2023-10-03', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2023/10/dino-colaboracao-investigacoes-8j', 'other', 1, 'Brasília', 'Entrevista coletiva', 'dino-colaboracao-investigacoes-b125-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro classifica julgamentos do 8J como perseguição política.', 'O STF está fazendo uma perseguição política, não um julgamento.', 'Entrevista à TV Senado sobre os julgamentos.', 'verified', false, '2023-10-10', 'https://www12.senado.leg.br/noticias/materias/2023/10/10/flavio-bolsonaro-critica-stf', 'news_article', 3, 'Senado Federal', 'Entrevista à TV Senado', 'flavio-critica-julgamentos-8j-b125-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende anistia para réus do 8 de Janeiro.', 'Essa gente não merece estar na cadeia, precisamos de uma anistia ampla.', 'Entrevista a rádio após sessão na Câmara.', 'verified', true, '2023-10-18', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-anistia-8j/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista a rádio', 'eduardo-defende-anistia-8j-b125-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira adia votação do projeto de anistia do 8J após pressão.', 'Não há consenso para pautar a anistia neste momento.', 'Declaração após reunião de líderes na Câmara.', 'verified', false, '2023-10-25', 'https://www1.folha.uol.com.br/poder/2023/10/lira-adia-anistia-8j.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Declaração a imprensa', 'lira-adia-anistia-b125-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis afirma que não houve golpe e minimiza 8J.', 'Não houve golpe, houve apenas cidadãos protestando contra a fraude eleitoral.', 'Entrevista à CNN Brasil sobre julgamentos.', 'verified', true, '2023-10-27', 'https://www.cnnbrasil.com.br/politica/bia-kicis-nega-golpe-8j/', 'news_article', 4, 'Brasília', 'Entrevista CNN', 'kicis-nega-golpe-8j-b125-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli relaciona julgamentos do 8J a uma perseguição política organizada.', 'Estão criminalizando qualquer um que divergiu do governo Lula.', 'Publicação em redes sociais da deputada.', 'verified', false, '2023-11-02', 'https://www.metropoles.com/brasil/politica-brasil/zambelli-critica-julgamentos-8j', 'news_article', 3, 'Redes sociais', 'Publicação em redes', 'zambelli-critica-julgamentos-b125-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende punição rigorosa aos responsáveis pelo 8J.', 'Quem atentou contra a democracia precisa pagar pelo que fez.', 'Entrevista à imprensa na sede do PT.', 'verified', false, '2023-11-08', 'https://www.pt.org.br/gleisi-punicao-8j/', 'other', 1, 'São Paulo', 'Coletiva de imprensa', 'gleisi-defende-punicao-8j-b125-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina quebra de sigilo de financiadores do 8J.', 'Quem financiou os atos responderá criminalmente por tentativa de golpe.', 'Decisão monocrática em inquérito do STF.', 'verified', true, '2023-11-16', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=517002', 'official_document', 1, 'Brasília', 'Decisão STF', 'moraes-quebra-sigilo-financiadores-b125-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro nega envolvimento em tentativa de golpe ao ser ouvido pela PF.', 'Nunca incentivei nenhum ato antidemocrático, isso é narrativa da esquerda.', 'Depoimento à Polícia Federal em Brasília.', 'verified', true, '2023-11-29', 'https://g1.globo.com/politica/noticia/2023/11/29/bolsonaro-nega-golpe-pf.ghtml', 'news_article', 3, 'Brasília', 'Depoimento PF', 'bolsonaro-nega-golpe-pf-b125-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso cobra responsabilização de quem planejou os atos de 8J.', 'O Brasil tem o direito de saber quem planejou e financiou esses atos.', 'Discurso em evento da OAB.', 'verified', false, '2023-12-04', 'https://www.oab.org.br/noticia/61230/barroso-participa-evento-oab', 'other', 1, 'Brasília', 'Evento OAB', 'barroso-cobra-responsabilizacao-b125-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes prorroga inquéritos do 8 de Janeiro no STF por mais 180 dias.', 'Há muitos suspeitos ainda não identificados, a apuração continua.', 'Despacho em inquérito no STF.', 'verified', false, '2023-12-13', 'https://g1.globo.com/politica/noticia/2023/12/13/moraes-prorroga-inquerito-8j.ghtml', 'news_article', 1, 'Brasília', 'Despacho STF', 'moraes-prorroga-inquerito-b125-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que 8 de Janeiro foi resultado de anos de discurso de ódio.', 'O 8 de Janeiro é consequência de quatro anos de incitação de violência.', 'Entrevista em um ano do 8J.', 'verified', true, '2024-01-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/01/lula-8-janeiro-discurso-odio', 'official_document', 2, 'Brasília', 'Ato um ano do 8J', 'lula-8j-discurso-odio-b125-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama divulga relatório final da CPMI do 8 de Janeiro.', 'O relatório prova o envolvimento de Bolsonaro e aliados na tentativa de golpe.', 'Apresentação do relatório no Congresso.', 'verified', true, '2023-10-17', 'https://www12.senado.leg.br/noticias/materias/2023/10/17/eliziane-relatorio-cpmi-8j', 'official_document', 2, 'Senado Federal', 'Relatório CPMI 8J', 'eliziane-relatorio-cpmi-b125-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão afirma que CPMI do 8J foi viés político e não apurou nada.', 'A CPMI foi uma caça às bruxas contra quem pensa diferente.', 'Discurso em plenário do Senado.', 'verified', false, '2023-10-19', 'https://www12.senado.leg.br/noticias/materias/2023/10/19/mourao-critica-cpmi', 'official_document', 2, 'Senado Federal', 'Discurso plenário', 'mourao-critica-cpmi-b125-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin vota pela condenação de réu do 8J e defende democracia.', 'A democracia exige proteção incondicional de suas instituições.', 'Sessão do STF.', 'verified', false, '2024-02-15', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=519100', 'official_document', 1, 'Brasília', 'Voto STF', 'fachin-voto-condenacao-b125-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro tem passaporte apreendido pela PF em operação sobre golpe.', 'Isso é perseguição política, estão tentando me silenciar.', 'Declaração a jornalistas após operação da PF.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/2024/02/08/bolsonaro-passaporte-apreendido.ghtml', 'news_article', 3, 'Brasília', 'Operação PF', 'bolsonaro-passaporte-apreendido-b125-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro participa de ato na Paulista e ataca STF.', 'Eles querem me calar, mas o povo brasileiro não permitirá.', 'Ato na Avenida Paulista organizado por apoiadores.', 'verified', true, '2024-02-25', 'https://www1.folha.uol.com.br/poder/2024/02/ato-bolsonaro-paulista-stf.shtml', 'news_article', 3, 'São Paulo', 'Ato Paulista 25/02', 'bolsonaro-ato-paulista-stf-b125-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas discursa em ato da Paulista pedindo anistia do 8J.', 'Queremos anistia para os presos políticos do Brasil.', 'Discurso no ato da Avenida Paulista.', 'verified', true, '2024-02-25', 'https://www.cnnbrasil.com.br/politica/nikolas-ato-paulista-anistia/', 'news_article', 3, 'São Paulo', 'Ato Paulista 25/02', 'nikolas-ato-paulista-anistia-b125-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que não haverá anistia para golpistas do 8 de Janeiro.', 'Não vai ter anistia. Quem mexeu com a democracia vai pagar.', 'Entrevista à Rádio Clube do Pará.', 'verified', true, '2024-02-29', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2024/02/lula-nao-havera-anistia', 'official_document', 2, 'Belém', 'Entrevista Rádio Clube', 'lula-nao-havera-anistia-b125-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'PF indicia Bolsonaro por tentativa de golpe de Estado.', 'O ex-presidente liderou organização criminosa para atentar contra a democracia.', 'Indiciamento pela Polícia Federal no inquérito da tentativa de golpe.', 'verified', true, '2024-03-22', 'https://g1.globo.com/politica/noticia/2024/03/22/pf-indicia-bolsonaro-joias.ghtml', 'news_article', 2, 'Brasília', 'Indiciamento PF', 'pf-indicia-bolsonaro-joias-b125-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wag, 'Jaques Wagner defende rito acelerado para julgar tentativa de golpe.', 'O Brasil precisa julgar e punir quem atentou contra a democracia.', 'Entrevista no Senado.', 'verified', false, '2024-04-02', 'https://www12.senado.leg.br/noticias/materias/2024/04/02/wagner-defende-julgamento-golpe', 'official_document', 1, 'Senado Federal', 'Entrevista imprensa', 'wagner-rito-golpe-b125-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe classifica tentativa de golpe como atentado histórico.', 'O que aconteceu no 8J foi um atentado sem precedentes à democracia.', 'Pronunciamento no plenário do Senado.', 'verified', false, '2024-04-10', 'https://www12.senado.leg.br/noticias/materias/2024/04/10/randolfe-tentativa-golpe', 'official_document', 1, 'Senado Federal', 'Pronunciamento', 'randolfe-atentado-historico-b125-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr defende punição exemplar para articuladores do 8J.', 'Sem punição exemplar, o risco de repetição permanece.', 'Discurso na Câmara dos Deputados.', 'verified', false, '2024-04-11', 'https://www.camara.leg.br/noticias/2024/04/duarte-jr-punicao-8j', 'official_document', 1, 'Câmara dos Deputados', 'Discurso plenário', 'duarte-punicao-exemplar-b125-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes manda prender general Braga Netto em investigação do golpe.', 'A prisão é necessária para garantir a ordem pública e a aplicação da lei penal.', 'Decisão de prisão preventiva no inquérito do golpe.', 'verified', true, '2024-12-14', 'https://g1.globo.com/politica/noticia/2024/12/14/moraes-prende-braga-netto.ghtml', 'news_article', 2, 'Brasília', 'Prisão Braga Netto', 'moraes-prende-braga-netto-b125-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se muda para os EUA e pede asilo político.', 'O Brasil vive uma ditadura do STF, não posso voltar.', 'Declaração à imprensa americana após deixar o Brasil.', 'verified', true, '2025-03-04', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-eua-asilo/', 'news_article', 4, 'Estados Unidos', 'Declaração imprensa', 'eduardo-eua-asilo-b125-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'STF aceita denúncia e Bolsonaro se torna réu por tentativa de golpe.', 'A trama golpista precisa ser julgada com todo o rigor da lei.', 'Sessão da Primeira Turma do STF.', 'verified', true, '2025-03-26', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=523421', 'official_document', 1, 'Brasília', 'Aceite denúncia STF', 'stf-aceita-denuncia-bolsonaro-b125-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro reage a se tornar réu e culpa Alexandre de Moraes.', 'Isso é perseguição política de Alexandre de Moraes contra mim.', 'Entrevista a jornalistas em Brasília.', 'verified', true, '2025-03-26', 'https://g1.globo.com/politica/noticia/2025/03/26/bolsonaro-reacao-reu-stf.ghtml', 'news_article', 3, 'Brasília', 'Declaração imprensa', 'bolsonaro-reacao-reu-b125-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora em sessão do STF a aceitação da denúncia contra Bolsonaro.', 'A democracia vence. Quem tentou destruir o Brasil vai responder.', 'Entrevista no Palácio do Planalto.', 'verified', true, '2025-03-27', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2025/03/lula-stf-denuncia', 'official_document', 1, 'Brasília', 'Entrevista Planalto', 'lula-comemora-denuncia-b125-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota por aceitar denúncia contra Bolsonaro na Primeira Turma.', 'Há indícios suficientes da participação dos denunciados na trama golpista.', 'Voto na Primeira Turma do STF.', 'verified', false, '2025-03-26', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=523422', 'official_document', 1, 'Brasília', 'Voto Primeira Turma', 'zanin-voto-denuncia-b125-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota pela aceitação da denúncia do golpe no STF.', 'Os fatos narrados configuram gravíssimos atentados à democracia.', 'Voto na Primeira Turma do STF.', 'verified', false, '2025-03-26', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=523423', 'official_document', 1, 'Brasília', 'Voto Primeira Turma', 'dino-voto-denuncia-b125-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia afirma que STF não cederá a pressões ao julgar golpe.', 'Este tribunal não se curvará a pressões externas ou políticas.', 'Discurso em sessão do STF.', 'verified', false, '2025-04-10', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=523678', 'official_document', 1, 'Brasília', 'Sessão STF', 'carmen-stf-nao-cedera-b125-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas convoca ato em defesa de Bolsonaro após virar réu.', 'Vamos às ruas defender o presidente Bolsonaro da perseguição.', 'Publicação em redes sociais.', 'verified', true, '2025-04-02', 'https://www.cnnbrasil.com.br/politica/nikolas-ato-bolsonaro-reu/', 'news_article', 3, 'Redes sociais', 'Publicação redes', 'nikolas-convoca-ato-bolsonaro-b125-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro comparece ao ato da Paulista após virar réu no STF.', 'Estamos sendo perseguidos, mas o povo está conosco.', 'Ato na Avenida Paulista em defesa de Bolsonaro.', 'verified', true, '2025-04-06', 'https://www1.folha.uol.com.br/poder/2025/04/ato-bolsonaro-paulista-reu.shtml', 'news_article', 3, 'São Paulo', 'Ato Paulista abril', 'bolsonaro-ato-paulista-reu-b125-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle defende Bolsonaro e ataca STF em ato da Paulista.', 'Estão perseguindo um homem inocente, Deus julgará.', 'Discurso no ato da Paulista.', 'verified', false, '2025-04-06', 'https://g1.globo.com/politica/noticia/2025/04/06/michelle-ato-paulista.ghtml', 'news_article', 3, 'São Paulo', 'Ato Paulista abril', 'michelle-ato-paulista-b125-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Senador discursa em ato da Paulista em defesa de Bolsonaro.', 'São Paulo está com o presidente Bolsonaro.', 'Discurso no ato da Paulista.', 'verified', false, '2025-04-07', 'https://www.cnnbrasil.com.br/politica/ato-paulista-abril-2/', 'news_article', 2, 'São Paulo', 'Ato Paulista abril', 'ato-paulista-abril2-b125-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta discursa em ato e defende anistia aos presos do 8J.', 'Os patriotas precisam ser libertados, chega de injustiça.', 'Discurso no ato da Paulista.', 'verified', false, '2025-04-06', 'https://www.metropoles.com/politica/magno-malta-paulista', 'news_article', 3, 'São Paulo', 'Ato Paulista abril', 'magno-malta-paulista-b125-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca STF em discurso a apoiadores de Bolsonaro.', 'O STF se transformou em um tribunal de exceção.', 'Discurso no ato da Paulista.', 'verified', false, '2025-04-06', 'https://www12.senado.leg.br/noticias/materias/2025/04/06/damares-stf-exception', 'official_document', 3, 'São Paulo', 'Ato Paulista abril', 'damares-stf-excecao-b125-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano pede orações pelos réus do 8J em culto evangélico.', 'Orem pelos presos políticos do Brasil, Deus os libertará.', 'Culto em igreja na zona sul de São Paulo.', 'verified', false, '2025-04-13', 'https://www.cnnbrasil.com.br/politica/feliciano-oracoes-8j/', 'news_article', 3, 'São Paulo', 'Culto evangélico', 'feliciano-oracoes-8j-b125-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem apresenta PL que amplia anistia para réus do 8J.', 'A anistia é um gesto de pacificação necessário ao país.', 'Apresentação de projeto de lei na Câmara.', 'verified', false, '2025-05-14', 'https://www.camara.leg.br/noticias/2025/05/van-hattem-pl-anistia', 'official_document', 3, 'Câmara dos Deputados', 'Projeto de lei', 'van-hattem-pl-anistia-b125-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta afirma que anistia não deve ser prioridade da Câmara.', 'Há temas mais urgentes do que a pauta da anistia.', 'Entrevista em seu gabinete.', 'verified', false, '2025-05-20', 'https://www1.folha.uol.com.br/poder/2025/05/motta-anistia-prioridade.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista imprensa', 'motta-anistia-prioridade-b125-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alcolumbre defende rejeição de qualquer anistia ampla pelo Senado.', 'O Senado não concederá anistia para quem atentou contra a democracia.', 'Entrevista no Senado Federal.', 'verified', false, '2025-05-22', 'https://www12.senado.leg.br/noticias/materias/2025/05/22/alcolumbre-rejeicao-anistia', 'official_document', 1, 'Senado Federal', 'Entrevista imprensa', 'alcolumbre-rejeicao-anistia-b125-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa classifica PL da anistia como afronta à democracia.', 'Anistiar golpistas é dar licença para novas tentativas de golpe.', 'Pronunciamento no Senado Federal.', 'verified', false, '2025-05-28', 'https://www12.senado.leg.br/noticias/materias/2025/05/28/humberto-anistia-afronta', 'official_document', 1, 'Senado Federal', 'Pronunciamento', 'humberto-anistia-afronta-b125-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'STF marca data para julgar mérito da ação contra Bolsonaro por golpe.', 'O julgamento do núcleo central da trama golpista será no segundo semestre.', 'Decisão de Moraes marcando sessão de julgamento.', 'verified', true, '2025-06-20', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=524890', 'official_document', 1, 'Brasília', 'Marcação julgamento', 'stf-marca-julgamento-merito-b125-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes vota pela condenação de Bolsonaro a mais de 27 anos por golpe.', 'Ficou comprovada a participação ativa do ex-presidente na trama golpista.', 'Voto como relator no julgamento do STF.', 'verified', true, '2025-09-02', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=525678', 'official_document', 1, 'Brasília', 'Julgamento mérito STF', 'moraes-voto-condenacao-bolsonaro-b125-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin acompanha relator e vota por condenar Bolsonaro.', 'O conjunto probatório é robusto e autoriza a condenação.', 'Voto na Primeira Turma do STF.', 'verified', false, '2025-09-03', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=525680', 'official_document', 1, 'Brasília', 'Julgamento mérito STF', 'zanin-vota-condenar-bolsonaro-b125-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota pela condenação de Bolsonaro e do núcleo do golpe.', 'A responsabilização penal é imprescindível à preservação da democracia.', 'Voto na Primeira Turma do STF.', 'verified', false, '2025-09-03', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=525681', 'official_document', 1, 'Brasília', 'Julgamento mérito STF', 'dino-vota-condenar-bolsonaro-b125-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia vota com relator e condena Bolsonaro a 27 anos.', 'A democracia não pode tolerar tentativas de retrocesso autoritário.', 'Voto na Primeira Turma do STF.', 'verified', true, '2025-09-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=525682', 'official_document', 1, 'Brasília', 'Julgamento mérito STF', 'carmen-condena-bolsonaro-b125-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora condenação de Bolsonaro em pronunciamento à nação.', 'Hoje o Brasil fez história. A democracia venceu o golpismo.', 'Pronunciamento no Palácio do Planalto.', 'verified', true, '2025-09-12', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2025/09/lula-condenacao-bolsonaro', 'official_document', 2, 'Brasília', 'Pronunciamento à nação', 'lula-comemora-condenacao-b125-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro reage à condenação e promete recorrer.', 'Sou inocente e vou provar isso. Essa condenação é política.', 'Declaração de sua residência em Brasília.', 'verified', true, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/bolsonaro-reacao-condenacao.ghtml', 'news_article', 3, 'Brasília', 'Declaração residência', 'bolsonaro-reacao-condenacao-b125-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann chama condenação de marco histórico da democracia.', 'Quem atentou contra a democracia foi responsabilizado. Estado de Direito funcionou.', 'Entrevista na sede do PT.', 'verified', false, '2025-09-13', 'https://www.pt.org.br/gleisi-condenacao-marco/', 'other', 1, 'São Paulo', 'Entrevista imprensa', 'gleisi-marco-historico-b125-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh Farias afirma que condenação encerra ciclo autoritário.', 'Hoje o Brasil fecha um ciclo de tentativas autoritárias.', 'Discurso em plenário da Câmara.', 'verified', false, '2025-09-15', 'https://www.camara.leg.br/noticias/2025/09/lindbergh-condenacao-ciclo', 'official_document', 1, 'Câmara dos Deputados', 'Discurso plenário', 'lindbergh-encerra-ciclo-b125-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton comemora condenação de Bolsonaro no Congresso.', 'É reparação histórica. O Brasil venceu o golpe.', 'Declaração em plenário da Câmara.', 'verified', false, '2025-09-13', 'https://www.camara.leg.br/noticias/2025/09/erika-comemora-condenacao', 'official_document', 2, 'Câmara dos Deputados', 'Declaração plenário', 'erika-comemora-condenacao-b125-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim celebra condenação e defende responsabilização ampla.', 'A condenação é primeiro passo, há mais envolvidos a responder.', 'Entrevista em plenário da Câmara.', 'verified', false, '2025-09-13', 'https://www.camara.leg.br/noticias/2025/09/samia-condenacao-ampla', 'official_document', 1, 'Câmara dos Deputados', 'Entrevista plenário', 'samia-responsabilizacao-ampla-b125-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama condenação de Bolsonaro de dia mais triste da democracia.', 'Hoje é um dos dias mais tristes da democracia brasileira.', 'Declaração em redes sociais após condenação.', 'verified', true, '2025-09-12', 'https://www.cnnbrasil.com.br/politica/nikolas-condenacao-bolsonaro/', 'news_article', 3, 'Redes sociais', 'Reação condenação', 'nikolas-dia-triste-b125-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula sanções dos EUA contra Moraes.', 'Vamos trabalhar para que Alexandre de Moraes seja sancionado.', 'Entrevista em Washington após condenação do pai.', 'verified', true, '2025-09-16', 'https://www.cnnbrasil.com.br/politica/eduardo-sancoes-moraes-eua/', 'news_article', 4, 'Washington', 'Entrevista imprensa', 'eduardo-sancoes-moraes-b125-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula estratégia para reverter condenação do pai.', 'Vamos recorrer a todas as instâncias nacionais e internacionais.', 'Entrevista no Senado após condenação.', 'verified', true, '2025-09-15', 'https://www12.senado.leg.br/noticias/materias/2025/09/15/flavio-estrategia-condenacao', 'news_article', 3, 'Senado Federal', 'Entrevista imprensa', 'flavio-estrategia-condenacao-b125-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carlos Bolsonaro ataca Moraes em redes após condenação do pai.', 'Alexandre de Moraes entrará para a história como o maior algoz do Brasil.', 'Publicação em redes sociais.', 'verified', false, '2025-09-13', 'https://www.metropoles.com/politica/carlos-ataca-moraes-condenacao', 'news_article', 3, 'Redes sociais', 'Publicação redes', 'carlos-ataca-moraes-condenacao-b125-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro posta oração após condenação do marido.', 'Deus é justo, a verdade prevalecerá sobre essa injustiça.', 'Publicação em redes sociais.', 'verified', false, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/michelle-oracao-condenacao.ghtml', 'news_article', 2, 'Redes sociais', 'Publicação redes', 'michelle-oracao-condenacao-b125-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli, foragida, ataca STF de Roma após condenação.', 'O Brasil vive uma ditadura judicial. Nunca voltarei.', 'Entrevista concedida de Roma após condenação de Bolsonaro.', 'verified', true, '2025-09-14', 'https://www1.folha.uol.com.br/poder/2025/09/zambelli-roma-stf.shtml', 'news_article', 4, 'Roma', 'Entrevista imprensa', 'zambelli-roma-stf-b125-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem foge e se refugia nos EUA após condenação no STF.', 'Não tenho garantias de julgamento justo no Brasil.', 'Entrevista concedida dos EUA após condenação.', 'verified', true, '2025-09-18', 'https://www.cnnbrasil.com.br/politica/ramagem-eua-refugio/', 'news_article', 4, 'Estados Unidos', 'Entrevista imprensa', 'ramagem-eua-refugio-b125-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina início de cumprimento da pena de Bolsonaro.', 'Não há mais recurso que suspenda a execução da pena.', 'Decisão de execução imediata da pena.', 'verified', true, '2025-11-22', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=527890', 'official_document', 1, 'Brasília', 'Execução da pena', 'moraes-execucao-pena-b125-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro é preso para cumprir pena por tentativa de golpe.', 'Estou indo preso por amor ao Brasil.', 'Declaração antes de se apresentar à PF.', 'verified', true, '2025-11-22', 'https://g1.globo.com/politica/noticia/2025/11/22/bolsonaro-preso-golpe.ghtml', 'news_article', 2, 'Brasília', 'Prisão Bolsonaro', 'bolsonaro-preso-golpe-b125-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que prisão de Bolsonaro mostra que instituições funcionaram.', 'As instituições cumpriram seu papel. A democracia é o maior vencedor.', 'Entrevista à imprensa internacional.', 'verified', true, '2025-11-23', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2025/11/lula-prisao-bolsonaro', 'official_document', 1, 'Brasília', 'Entrevista internacional', 'lula-prisao-instituicoes-b125-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que prisão do pai é ilegal e vai recorrer a cortes internacionais.', 'Vamos à Corte Interamericana denunciar essa perseguição.', 'Entrevista após prisão do pai.', 'verified', true, '2025-11-23', 'https://www.cnnbrasil.com.br/politica/flavio-prisao-pai-corte/', 'news_article', 3, 'Brasília', 'Entrevista imprensa', 'flavio-prisao-corte-internacional-b125-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pede sanções dos EUA após prisão do pai.', 'O Brasil se tornou uma ditadura, os EUA precisam agir.', 'Entrevista a veículos americanos.', 'verified', true, '2025-11-24', 'https://www.metropoles.com/politica/eduardo-sancoes-prisao-pai', 'news_article', 4, 'Washington', 'Entrevista veículos EUA', 'eduardo-sancoes-prisao-b125-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas convoca marcha em defesa de Bolsonaro preso.', 'Não vamos aceitar em silêncio essa prisão política.', 'Publicação em redes sociais convocando protesto.', 'verified', true, '2025-11-23', 'https://g1.globo.com/politica/noticia/2025/11/23/nikolas-marcha-bolsonaro-preso.ghtml', 'news_article', 3, 'Redes sociais', 'Convocação de ato', 'nikolas-marcha-preso-b125-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende condenações e diz que Estado de Direito prevaleceu.', 'O Brasil mostrou que o Estado de Direito não tem vencedores nem perdedores.', 'Entrevista como ministro da Justiça.', 'verified', false, '2025-11-26', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2025/11/lewandowski-estado-direito', 'other', 1, 'Brasília', 'Entrevista imprensa', 'lewandowski-estado-direito-b125-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias afirma que decisão do STF é marco da maturidade democrática.', 'A decisão do STF consolida a maturidade das instituições.', 'Entrevista como advogado-geral da União.', 'verified', false, '2025-09-16', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2025/09/messias-maturidade-democratica', 'other', 1, 'Brasília', 'Entrevista imprensa', 'messias-maturidade-democratica-b125-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso diz que STF cumpriu seu papel histórico ao julgar golpistas.', 'O STF foi firme na defesa da Constituição, como era seu dever.', 'Entrevista em evento na USP.', 'verified', false, '2025-10-05', 'https://www.usp.br/evento/barroso-stf-papel-historico', 'other', 1, 'São Paulo', 'Evento USP', 'barroso-papel-historico-b125-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin assume presidência do STF em meio à execução das penas do golpe.', 'Manteremos o rigor na defesa da democracia e das instituições.', 'Discurso de posse como presidente do STF.', 'verified', true, '2025-09-29', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=526890', 'official_document', 2, 'Brasília', 'Posse STF', 'fachin-assume-stf-b125-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor2, 'Sergio Moro critica condenação e vê desequilíbrio no STF.', 'Preocupa o desequilíbrio institucional nesse julgamento.', 'Entrevista à imprensa no Senado.', 'verified', false, '2025-09-14', 'https://www12.senado.leg.br/noticias/materias/2025/09/14/moro-desequilibrio-stf', 'official_document', 2, 'Senado Federal', 'Entrevista imprensa', 'moro-desequilibrio-stf-b125-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende anistia ampla como reconciliação nacional.', 'Só uma anistia ampla pode pacificar o país.', 'Discurso em plenário do Senado.', 'verified', false, '2025-09-18', 'https://www12.senado.leg.br/noticias/materias/2025/09/18/mourao-anistia-reconciliacao', 'official_document', 3, 'Senado Federal', 'Discurso plenário', 'mourao-anistia-reconciliacao-b125-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco afirma que Senado arquivará PL da anistia ampla.', 'O Senado jamais concederá anistia aos condenados pelo STF.', 'Entrevista no Senado Federal.', 'verified', false, '2025-09-20', 'https://www12.senado.leg.br/noticias/materias/2025/09/20/pacheco-arquivar-anistia', 'official_document', 1, 'Senado Federal', 'Entrevista imprensa', 'pacheco-arquivar-anistia-b125-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes nega pedido de Bolsonaro para cumprir pena em regime domiciliar.', 'Não há fundamento legal que permita regime domiciliar ao condenado.', 'Decisão monocrática no STF.', 'verified', false, '2025-12-15', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=528123', 'official_document', 1, 'Brasília', 'Decisão STF', 'moraes-nega-domiciliar-b125-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro tem recurso negado e segue preso em unidade militar.', 'Estou sofrendo uma das maiores injustiças da história.', 'Declaração enviada de sua cela.', 'verified', true, '2025-12-20', 'https://g1.globo.com/politica/noticia/2025/12/20/bolsonaro-recurso-negado.ghtml', 'news_article', 3, 'Brasília', 'Declaração cela', 'bolsonaro-recurso-negado-b125-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes cita necessidade de julgar militares envolvidos no golpe.', 'Os militares que participaram da trama serão responsabilizados igualmente.', 'Voto em sessão do STF.', 'verified', false, '2026-01-22', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=528901', 'official_document', 1, 'Brasília', 'Sessão STF', 'moraes-julgar-militares-b125-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz balanço de três anos do 8 de Janeiro em cerimônia oficial.', 'Três anos depois, a democracia está mais forte e as instituições, respeitadas.', 'Cerimônia em Brasília marcando os três anos do 8J.', 'verified', true, '2026-01-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2026/01/lula-tres-anos-8j', 'official_document', 2, 'Brasília', 'Três anos do 8J', 'lula-tres-anos-8j-b125-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino prefaceia livro sobre julgamento histórico do 8J.', 'A memória desses julgamentos é patrimônio da nossa democracia.', 'Lançamento de livro em evento acadêmico.', 'verified', false, '2026-02-14', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=529201', 'official_document', 1, 'Brasília', 'Lançamento livro', 'dino-livro-julgamento-b125-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin rejeita novo habeas corpus de Bolsonaro em 2026.', 'Não há fatos novos que justifiquem a concessão de habeas corpus.', 'Decisão monocrática no STF.', 'verified', false, '2026-03-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=529510', 'official_document', 1, 'Brasília', 'Decisão STF', 'zanin-rejeita-hc-bolsonaro-b125-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes condena Carlos Bolsonaro por ataques ao STF em redes.', 'Ataques sistemáticos às instituições também são crimes contra a democracia.', 'Decisão de condenação no STF.', 'verified', true, '2026-04-01', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=530010', 'official_document', 1, 'Brasília', 'Condenação Carlos', 'moraes-condena-carlos-b125-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carlos Bolsonaro é condenado por ataques sistemáticos ao STF.', 'Essa condenação é mais uma perseguição política da família Bolsonaro.', 'Declaração após decisão do STF.', 'verified', true, '2026-04-01', 'https://g1.globo.com/politica/noticia/2026/04/01/carlos-bolsonaro-condenado.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Reação condenação', 'carlos-condenado-b125-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula participa de evento em memória ao 8 de Janeiro com democracia consolidada.', 'A democracia brasileira passou pelo seu teste mais duro e venceu.', 'Cerimônia no Palácio do Planalto em 2026.', 'verified', false, '2026-01-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2026/01/lula-memoria-8j', 'official_document', 2, 'Brasília', 'Cerimônia 8J 2026', 'lula-memoria-8j-2026-b125-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro lança biografia da cadeia acusando perseguição.', 'Quando sair, escreverei a verdadeira história do Brasil.', 'Entrevista concedida da prisão.', 'verified', true, '2026-02-20', 'https://www.cnnbrasil.com.br/politica/bolsonaro-biografia-cadeia/', 'news_article', 3, 'Brasília', 'Entrevista prisão', 'bolsonaro-biografia-cadeia-b125-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lança campanha pela anistia ampla em caravana nacional.', 'Vamos percorrer o Brasil pedindo anistia aos presos políticos.', 'Ato em Belo Horizonte iniciando caravana.', 'verified', false, '2026-02-28', 'https://www.em.com.br/politica/2026/02/nikolas-caravana-anistia.html', 'news_article', 3, 'Belo Horizonte', 'Caravana anistia', 'nikolas-caravana-anistia-b125-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina bloqueio de bens dos condenados no 8J.', 'Bens dos condenados responderão pelos danos causados ao erário.', 'Decisão de execução em sede do STF.', 'verified', false, '2026-03-18', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=529899', 'official_document', 1, 'Brasília', 'Bloqueio bens', 'moraes-bloqueio-bens-b125-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin defende consolidação institucional após julgamento do golpe.', 'O Brasil precisa avançar na consolidação de sua democracia.', 'Discurso em evento na AMB.', 'verified', false, '2026-03-22', 'https://www.amb.com.br/noticias/fachin-consolidacao-institucional', 'other', 1, 'Brasília', 'Evento AMB', 'fachin-consolidacao-b125-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wag, 'Wagner celebra três anos do 8J e balanço positivo das instituições.', 'As instituições superaram o maior desafio de sua história recente.', 'Entrevista no Senado.', 'verified', false, '2026-01-09', 'https://www12.senado.leg.br/noticias/materias/2026/01/09/wagner-tres-anos-8j', 'official_document', 1, 'Senado Federal', 'Entrevista imprensa', 'wagner-tres-anos-b125-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe afirma que 8 de Janeiro deixou lições permanentes.', 'O 8J deixou lições que jamais poderemos esquecer.', 'Discurso em sessão solene.', 'verified', false, '2026-01-08', 'https://www12.senado.leg.br/noticias/materias/2026/01/08/randolfe-licoes-8j', 'official_document', 1, 'Senado Federal', 'Sessão solene 8J', 'randolfe-licoes-8j-b125-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende memória permanente do 8 de Janeiro em lei.', 'Precisamos de políticas públicas de memória sobre o 8J.', 'Apresentação de projeto na Câmara.', 'verified', false, '2026-02-03', 'https://www.camara.leg.br/noticias/2026/02/erika-memoria-8j', 'official_document', 1, 'Câmara dos Deputados', 'Projeto de lei', 'erika-memoria-8j-b125-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro articula com PL candidatura para enfrentar Lula em 2026.', 'Vamos escolher um nome forte para derrotar Lula em 2026.', 'Entrevista no Senado após condenação do pai.', 'verified', false, '2026-02-15', 'https://www12.senado.leg.br/noticias/materias/2026/02/15/flavio-candidato-2026', 'news_article', 2, 'Senado Federal', 'Entrevista 2026', 'flavio-candidato-2026-b125-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro cogita candidatura presidencial em 2026.', 'Vou para onde o povo brasileiro quiser que eu vá.', 'Entrevista após visita ao marido preso.', 'verified', false, '2026-03-10', 'https://www1.folha.uol.com.br/poder/2026/03/michelle-candidata-2026.shtml', 'news_article', 2, 'Brasília', 'Entrevista pós visita', 'michelle-candidata-2026-b125-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confirma que buscará reeleição em 2026 com legado democrático.', 'O Brasil precisa consolidar a reconstrução democrática iniciada em 2023.', 'Entrevista em cadeia nacional.', 'verified', true, '2026-04-05', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2026/04/lula-reeleicao-2026', 'official_document', 1, 'Brasília', 'Cadeia nacional', 'lula-reeleicao-2026-b125-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes faz balanço do julgamento do golpe em evento jurídico.', 'Nenhum país democrático condenou uma trama golpista com o rigor que o Brasil fez.', 'Palestra em congresso jurídico.', 'verified', false, '2026-04-10', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=530301', 'official_document', 1, 'São Paulo', 'Congresso jurídico', 'moraes-balanco-julgamento-b125-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma em abril de 2026 que democracia superou o teste do 8J.', 'Estamos agora num Brasil mais maduro, que venceu o seu maior teste.', 'Entrevista à imprensa internacional.', 'verified', true, '2026-04-15', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/entrevistas/2026/04/lula-democracia-teste', 'official_document', 2, 'Brasília', 'Entrevista internacional', 'lula-democracia-superou-b125-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
