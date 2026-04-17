-- Batch 113: Crises sanitárias, SUS, dengue e debates sobre aborto (Jan 2023 - Abr 2026)
DO $$
DECLARE
  v_nis UUID; v_pad UUID; v_lul UUID; v_had UUID; v_teb UUID;
  v_mar UUID; v_rui UUID; v_son UUID; v_ani UUID; v_cid UUID;
  v_gle UUID; v_jai UUID; v_edu UUID; v_fla UUID; v_dam UUID;
  v_mfe UUID; v_bia UUID; v_nik UUID; v_mvh UUID; v_kim UUID;
  v_tab UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID;
  v_orl UUID; v_chi UUID; v_hum UUID; v_ott UUID; v_oma UUID;
  v_ran UUID; v_ale UUID; v_hug UUID; v_art UUID; v_mag UUID;
  v_sil UUID; v_pab UUID;
  c_des UUID; c_neg UUID; c_irr UUID; c_abu UUID; c_odi UUID;
  c_hom UUID; c_mis UUID; c_itr UUID; c_ame UUID; c_vio UUID;
  c_con UUID; c_mac UUID; c_int UUID;
BEGIN
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_oma FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alessandro-vieira';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_art FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia plano para reduzir filas de cirurgia no SUS em 2023.', 'O SUS vai recuperar sua capacidade. Vamos zerar filas de exames e cirurgias.', 'Apresentação do Programa Nacional de Redução de Filas de Espera na Saúde.', 'verified', true, '2023-05-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/maio/ministerio-da-saude-lanca-programa-de-reducao-de-filas-no-sus', 'official_statement', 1, 'Brasília', 'Lançamento Programa Filas SUS', 'nisia-filas-sus-b113-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha assume Saúde em fevereiro de 2025 prometendo continuidade do SUS.', 'Recebo a Saúde das mãos de Nísia com enorme responsabilidade. SUS é a política que salva vidas.', 'Cerimônia de posse como ministro da Saúde substituindo Nísia Trindade.', 'verified', true, '2025-03-04', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/marco/alexandre-padilha-toma-posse-como-ministro-da-saude', 'official_statement', 1, 'Brasília', 'Posse como ministro da Saúde', 'padilha-posse-saude-b113-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira compara vacinação infantil a experimento sem consentimento.', 'Estão transformando nossas crianças em cobaias. Isso é tirania sanitária.', 'Discurso em plenário após MS retomar obrigatoriedade da caderneta vacinal.', 'verified', true, '2023-07-12', 'https://www.camara.leg.br/noticias/nikolas-vacinacao-infantil-tirania-2023', 'official_statement', 4, 'Câmara dos Deputados', 'Debate vacinação', 'nikolas-tirania-sanitaria-b113-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali rebate negacionistas e defende caderneta vacinal.', 'Quem ataca a vacina está atacando o direito da criança de sobreviver.', 'Discurso na Câmara em resposta a Nikolas Ferreira.', 'verified', false, '2023-07-13', 'https://www.camara.leg.br/noticias/jandira-vacina-direito-crianca-2023', 'official_statement', 1, 'Câmara dos Deputados', 'Debate vacinação', 'jandira-vacina-direito-b113-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia Farmácia Popular ampliada com gratuidade total de medicamentos.', 'A Farmácia Popular vai ser de graça, porque remédio tem que chegar na mesa do povo.', 'Cerimônia de ampliação do programa no Palácio do Planalto.', 'verified', true, '2023-05-17', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2023/05/farmacia-popular-gratuita-lula', 'official_statement', 1, 'Brasília', 'Lançamento Farmácia Popular gratuita', 'lula-farmacia-popular-b113-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama aborto legal de infanticídio em audiência pública.', 'Não é aborto, é infanticídio de estado. Mata bebês indefesos.', 'Declaração em audiência pública sobre direitos reprodutivos.', 'verified', false, '2023-08-15', 'https://www.camara.leg.br/noticias/bia-kicis-aborto-infanticidio-audiencia', 'official_statement', 3, 'Câmara dos Deputados', 'Audiência sobre aborto', 'bia-aborto-infanticidio-b113-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia retrocessos no direito ao aborto legal.', 'Negar aborto legal a menina estuprada é tortura de Estado contra meninas pobres.', 'Discurso na tribuna da Câmara sobre barreiras ao aborto previsto em lei.', 'verified', false, '2023-08-22', 'https://www.camara.leg.br/noticias/taliria-aborto-menina-estuprada-tortura', 'official_statement', 2, 'Câmara dos Deputados', 'Debate aborto legal', 'taliria-aborto-tortura-b113-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança plano nacional contra malária na Amazônia.', 'Vamos eliminar a malária como problema de saúde pública até 2035.', 'Cerimônia em Manaus com autoridades sanitárias da região Norte.', 'verified', false, '2023-10-26', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/outubro/ministerio-lanca-plano-eliminacao-malaria', 'official_statement', 1, 'Manaus', 'Lançamento Plano Nacional Malária', 'nisia-plano-malaria-b113-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende criminalização total do aborto.', 'Vida começa na concepção. Aborto é crime sempre, sem exceção.', 'Discurso em culto evangélico transmitido em São Paulo.', 'verified', false, '2023-09-17', 'https://www.camara.leg.br/deputados/74168/biografia', 'official_statement', 3, 'São Paulo', 'Culto evangélico', 'feliciano-aborto-sempre-crime-b113-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende PL do aborto legal diante do avanço conservador.', 'Mulher que aborta não é criminosa, é vítima do abandono do Estado.', 'Discurso em plenário em defesa do aborto legal previsto em lei.', 'verified', false, '2023-10-04', 'https://www.camara.leg.br/noticias/samia-aborto-legal-plenario-2023', 'official_statement', 2, 'Câmara dos Deputados', 'Debate aborto legal', 'samia-aborto-vitima-b113-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia reestruturação do programa de saúde indígena pós-Yanomami.', 'Nunca mais um povo indígena vai ser abandonado à morte nesse país.', 'Anúncio de nova SESAI após CPI do genocídio Yanomami.', 'verified', true, '2023-11-30', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/novembro/nova-estrutura-sesai-saude-indigena', 'official_statement', 1, 'Brasília', 'Reestruturação SESAI', 'nisia-reestrutura-sesai-b113-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara cobra apuração criminal sobre mortes Yanomami.', 'Houve genocídio. Os responsáveis precisam ser presos e julgados.', 'Entrevista coletiva com ministros sobre saúde indígena.', 'verified', true, '2023-02-01', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-02/sonia-guajajara-yanomami-genocidio-responsabilizar', 'official_statement', 2, 'Brasília', 'Coletiva sobre Yanomami', 'sonia-yanomami-genocidio-b113-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro debocha do combate à dengue em vídeo nas redes.', 'Dengue é porque o governo é mole. No meu tempo não tinha essa epidemia toda.', 'Publicação em vídeo após Ministério declarar emergência por dengue.', 'verified', false, '2024-02-15', 'https://www.aosfatos.org/noticias/bolsonaro-dengue-governo-falso-2024/', 'social_media_post', 3, 'Orlando, EUA', 'Publicação em redes', 'bolsonaro-deboche-dengue-b113-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta defende atuação federal contra dengue em Minas e SP.', 'O Congresso precisa garantir recursos emergenciais para combater o mosquito.', 'Discurso na presidência da Câmara sobre crise da dengue.', 'verified', false, '2025-03-20', 'https://www.camara.leg.br/noticias/hugo-motta-dengue-recursos-2025', 'official_statement', 1, 'Câmara dos Deputados', 'Sessão sobre dengue', 'hugo-dengue-recursos-b113-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas minimiza epidemia de dengue e ataca PT.', 'Vocês estão inventando dengue agora? É distração do Lula.', 'Vídeo em rede social durante recorde de mortes por dengue.', 'verified', true, '2024-03-08', 'https://www.metropoles.com/brasil/politica-br/nikolas-dengue-invencao-pt', 'social_media_post', 4, 'Belo Horizonte', 'Publicação em rede social', 'nikolas-dengue-invencao-b113-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira articula recursos emergenciais para epidemia de dengue.', 'A Câmara vai liberar recursos para estados no combate à dengue. É prioridade.', 'Declaração à imprensa após reunião de líderes sobre dengue.', 'verified', false, '2024-03-05', 'https://www.camara.leg.br/noticias/arthur-lira-dengue-recursos-emergenciais-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Reunião de líderes', 'lira-dengue-recursos-b113-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende SUS universal e ataca PL do aborto da Câmara.', 'Querem criminalizar meninas estupradas. É crueldade travestida de religião.', 'Entrevista em Brasília sobre PL 1904 que equipara aborto após 22 semanas a homicídio.', 'verified', true, '2024-06-14', 'https://www.cartacapital.com.br/politica/gleisi-pl-aborto-crueldade-religiao', 'interview', 2, 'Brasília', 'Entrevista sobre PL 1904', 'gleisi-pl-1904-crueldade-b113-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira usa urgência para tentar aprovar PL que criminaliza estupradas.', 'A urgência está aprovada. O PL 1904 vai ao plenário.', 'Sessão relâmpago da Câmara que aprovou urgência em 20 segundos.', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/camara-aprova-urgencia-pl-aborto-20-segundos.ghtml', 'news_article', 4, 'Câmara dos Deputados', 'Aprovação urgência PL 1904', 'lira-urgencia-pl-1904-b113-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton explode com PL que pune meninas vítimas de estupro.', 'Vocês querem obrigar uma criança de 10 anos estuprada a parir. Isso é monstruoso.', 'Pronunciamento emocionado em plenário após aprovação de urgência do PL 1904.', 'verified', true, '2024-06-13', 'https://www.camara.leg.br/noticias/erika-hilton-pl-1904-monstruoso-2024', 'official_statement', 2, 'Câmara dos Deputados', 'Debate PL 1904', 'erika-pl-1904-monstruoso-b113-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende PL do aborto como proteção à vida.', 'Estamos protegendo a vida inocente. Criança no útero é criança.', 'Discurso na Câmara em defesa do PL 1904.', 'verified', false, '2024-06-13', 'https://www.camara.leg.br/deputados/74283/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Debate PL 1904', 'silas-camara-pl-1904-b113-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim convoca manifestação contra PL do aborto.', 'Não vamos aceitar. Criança não é mãe, estuprador não é pai.', 'Discurso em ato na Avenida Paulista após aprovação de urgência do PL 1904.', 'verified', true, '2024-06-15', 'https://www.brasildefato.com.br/2024/06/15/criana-nao-e-mae-ato-paulista-pl-1904', 'news_article', 2, 'São Paulo', 'Ato Avenida Paulista', 'samia-crianca-nao-e-mae-b113-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende que meninas estupradas devem parir.', 'Menina estuprada é mãe. O feto é inocente e precisa nascer.', 'Entrevista à imprensa evangélica sobre PL 1904.', 'verified', true, '2024-06-18', 'https://www.cartacapital.com.br/politica/damares-menina-estuprada-mae-2024', 'interview', 4, 'Brasília', 'Entrevista evangélica', 'damares-menina-estuprada-mae-b113-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula classifica PL do aborto como insanidade.', 'Tratar criança estuprada como criminosa é insanidade. Vou vetar se chegar a mim.', 'Entrevista coletiva após repercussão da urgência do PL 1904.', 'verified', true, '2024-06-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/06/lula-pl-1904-insanidade', 'official_statement', 1, 'Brasília', 'Coletiva sobre PL 1904', 'lula-pl-1904-insanidade-b113-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende PL 1904 e ataca abortistas.', 'O aborto tardio é homicídio. Quem mata nascituro tem que ir para a cadeia.', 'Declaração em entrevista a canal bolsonarista.', 'verified', false, '2024-06-17', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-aborto-tardio-homicidio', 'interview', 3, 'Brasília', 'Entrevista', 'bia-aborto-tardio-homicidio-b113-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia reafirma direito ao aborto legal previsto em lei no SUS.', 'A mulher vítima de estupro tem direito ao aborto previsto em lei. Isso não está em discussão.', 'Coletiva sobre serviços de saúde à mulher vítima de violência.', 'verified', true, '2024-06-19', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/junho/nisia-reafirma-aborto-legal-sus', 'official_statement', 1, 'Brasília', 'Coletiva direitos reprodutivos', 'nisia-aborto-legal-sus-b113-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves condena PL 1904 como violência contra meninas.', 'Quer obrigar meninas a parir seus estupradores. Isso é violência institucional.', 'Entrevista à Agência Brasil sobre políticas para mulheres.', 'verified', false, '2024-06-16', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-06/cida-goncalves-pl-1904-violencia-institucional', 'official_statement', 2, 'Brasília', 'Entrevista sobre PL 1904', 'cida-pl-1904-violencia-b113-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta promete arquivar PL 1904 ao assumir a presidência da Câmara.', 'Esse PL não é prioridade. Vamos arquivar para tratar das urgências.', 'Entrevista após vencer eleição para presidente da Câmara em 2025.', 'verified', false, '2025-02-03', 'https://www.camara.leg.br/noticias/hugo-motta-pl-1904-arquivar-2025', 'interview', 1, 'Câmara dos Deputados', 'Entrevista pós-eleição Câmara', 'hugo-arquivar-pl-1904-b113-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia R$ 1 bilhão para combate à dengue em 2024.', 'Vamos investir mais de 1 bilhão em UPAs, telessaúde e vacinação contra dengue.', 'Anúncio no Palácio do Planalto com governadores.', 'verified', true, '2024-02-22', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/fevereiro/ministerio-destina-1-bilhao-combate-dengue', 'official_statement', 1, 'Brasília', 'Pacote financeiro dengue', 'nisia-1-bi-dengue-b113-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano xinga aborto de holocausto de bebês.', 'O aborto é o holocausto silencioso dos bebês brasileiros.', 'Culto e pregação em igreja assembleiana em São Paulo.', 'verified', false, '2024-07-14', 'https://www.camara.leg.br/deputados/74168/biografia', 'official_statement', 3, 'São Paulo', 'Culto evangélico', 'feliciano-holocausto-bebes-b113-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali destaca retomada das vacinas no SUS em 2024.', 'Em um ano voltamos a vacinar, recuperamos coberturas. SUS é reconstrução.', 'Discurso na Comissão de Seguridade Social.', 'verified', false, '2024-03-20', 'https://www.camara.leg.br/noticias/jandira-vacinas-sus-recuperacao-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Comissão Seguridade', 'jandira-vacinas-retomada-b113-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende PEC que retira Saúde do teto de gastos.', 'Quem é contra o SUS é contra o povo. Vamos tirar Saúde e Educação do teto.', 'Discurso em sessão do Senado sobre PEC da Saúde.', 'verified', false, '2024-05-14', 'https://www12.senado.leg.br/noticias/materias/2024/05/14/humberto-pec-saude-fora-teto', 'official_statement', 1, 'Senado Federal', 'PEC da Saúde', 'humberto-pec-saude-fora-teto-b113-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri vota contra PL do aborto e é atacado por bolsonaristas.', 'Não posso votar para punir menina estuprada. Tem limite.', 'Voto em destaque no PL 1904 gerou ataques em redes bolsonaristas.', 'verified', false, '2024-06-13', 'https://www.camara.leg.br/noticias/kim-kataguiri-pl-1904-voto-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Votação PL 1904', 'kim-voto-pl-1904-b113-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral condena PL 1904 e critica pauta de costumes.', 'Criança estuprada não pode ter pena maior que seu estuprador. É absurdo.', 'Discurso em plenário contra PL 1904.', 'verified', false, '2024-06-13', 'https://www.camara.leg.br/noticias/tabata-pl-1904-estupradora-2024', 'official_statement', 2, 'Câmara dos Deputados', 'Votação PL 1904', 'tabata-pl-1904-absurdo-b113-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia celebra primeira vacina de dengue produzida no Brasil.', 'O Butantan nos dá a primeira vacina brasileira contra dengue. É soberania.', 'Cerimônia no Instituto Butantan com anúncio dos resultados da fase 3.', 'verified', true, '2024-03-12', 'https://agenciabrasil.ebc.com.br/saude/noticia/2024-03/butantan-vacina-dengue-soberania', 'official_statement', 1, 'São Paulo', 'Resultado Butantan-DV', 'nisia-butantan-dengue-b113-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende homeopatia e critica vacinas no Congresso.', 'Vamos parar de empurrar vacina goela abaixo. Homeopatia funciona.', 'Discurso em audiência pública sobre políticas públicas de saúde.', 'verified', false, '2024-04-10', 'https://www.aosfatos.org/noticias/nikolas-homeopatia-vacina-audiencia-2024/', 'official_statement', 4, 'Câmara dos Deputados', 'Audiência saúde', 'nikolas-homeopatia-vacina-b113-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar alerta para crise do fentanil e drogas injetáveis.', 'Temos que agir antes que o fentanil chegue ao Brasil como chegou nos EUA.', 'Discurso no Senado em debate sobre saúde pública e drogas.', 'verified', false, '2024-05-22', 'https://www12.senado.leg.br/noticias/materias/2024/05/22/otto-alencar-fentanil-saude-publica', 'official_statement', 1, 'Senado Federal', 'Debate drogas', 'otto-fentanil-alerta-b113-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro reitera ataques a vacina da Covid em entrevista.', 'A vacina matou mais do que o vírus. Um dia vão descobrir.', 'Participação em podcast conservador a partir dos EUA.', 'verified', true, '2024-07-22', 'https://www.aosfatos.org/noticias/bolsonaro-vacina-matou-mais-que-virus-falso-2024/', 'interview', 5, 'Orlando, EUA', 'Podcast bolsonarista', 'bolsonaro-vacina-matou-2024-b113-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira defende CPI da dengue no Senado.', 'Precisamos apurar por que a dengue matou tanto em 2024. CPI já.', 'Requerimento apresentado no Senado durante surto de casos.', 'verified', false, '2024-04-05', 'https://www12.senado.leg.br/noticias/materias/2024/04/05/alessandro-cpi-dengue-senado', 'official_statement', 1, 'Senado Federal', 'Requerimento CPI', 'alessandro-cpi-dengue-b113-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança estratégia nacional contra resistência antimicrobiana.', 'Antibiótico sem controle é bomba-relógio. Vamos regular prescrição no SUS.', 'Lançamento em Brasília com OMS e Fiocruz.', 'verified', false, '2024-11-18', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/novembro/plano-nacional-antimicrobianos', 'official_statement', 1, 'Brasília', 'Plano Nacional RAM', 'nisia-antimicrobianos-b113-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende investimento em saúde como desenvolvimento.', 'Saúde pública é desenvolvimento. Brasil não cresce sem SUS forte.', 'Fala em evento da FGV sobre política fiscal e social.', 'verified', false, '2024-04-18', 'https://www.gov.br/fazenda/pt-br/acesso-a-informacao/acoes-e-programas/noticias/2024/abril/haddad-saude-desenvolvimento', 'official_statement', 1, 'São Paulo', 'Evento FGV', 'haddad-saude-desenvolvimento-b113-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende tratamento precoce em PL no Senado.', 'Tratamento precoce salva vidas. Médicos devem ter autonomia.', 'Defesa de PL que protege médicos que prescreveram cloroquina.', 'verified', false, '2023-11-07', 'https://www12.senado.leg.br/noticias/materias/2023/11/07/flavio-tratamento-precoce-pl', 'official_statement', 4, 'Senado Federal', 'PL autonomia médica', 'flavio-tratamento-precoce-pl-b113-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_oma, 'Omar Aziz cobra indiciados da CPI da Covid após 2 anos.', 'A CPI entregou os indiciados. Cadê o processo? O Brasil merece resposta.', 'Discurso no plenário do Senado após aniversário da CPI da Covid.', 'verified', false, '2023-10-26', 'https://www12.senado.leg.br/noticias/materias/2023/10/26/omar-aziz-cobra-cpi-covid-2-anos', 'official_statement', 2, 'Senado Federal', 'CPI da Covid dois anos', 'omar-aziz-indiciados-cpi-b113-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues defende retirada da Saúde do teto de gastos.', 'Não existe Estado sério que limita gasto com saúde. Teto mata.', 'Discurso no Senado sobre PEC da Transição.', 'verified', false, '2023-05-31', 'https://www12.senado.leg.br/noticias/materias/2023/05/31/randolfe-pec-transicao-saude', 'official_statement', 1, 'Senado Federal', 'PEC da Transição', 'randolfe-teto-saude-b113-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende cura gay e ataca OMS.', 'A ciência diz que gay é doença. OMS mente para atender agenda internacional.', 'Discurso em convenção evangélica transmitida em rede.', 'verified', false, '2024-08-04', 'https://www.cartacapital.com.br/politica/magno-malta-cura-gay-convencao', 'official_statement', 4, 'Cachoeiro de Itapemirim', 'Convenção evangélica', 'magno-cura-gay-oms-b113-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal difunde desinformação sobre vacina e fígado.', 'Vacina destrói fígado. Eu não tomo e vivo melhor que vocês.', 'Live nas redes durante campanha à prefeitura de São Paulo em 2024.', 'verified', true, '2024-08-14', 'https://www.aosfatos.org/noticias/pablo-marcal-vacina-figado-falso-2024/', 'social_media_post', 5, 'São Paulo', 'Live campanha prefeitura', 'marcal-vacina-figado-b113-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende aborto legal como direito de saúde pública.', 'Aborto inseguro é causa de morte materna. SUS precisa atender com dignidade.', 'Discurso em plenário contra PL 1904.', 'verified', false, '2024-06-13', 'https://www.camara.leg.br/noticias/chico-alencar-aborto-saude-publica-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Debate PL 1904', 'chico-aborto-saude-publica-b113-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende regulamentação de big techs na saúde pública.', 'Redes sociais disseminam fake news sobre vacina. Precisamos regular.', 'Defesa do PL das Fake News em debate sobre desinformação em saúde.', 'verified', false, '2023-05-02', 'https://www.camara.leg.br/noticias/orlando-silva-pl-fake-news-saude-2023', 'official_statement', 1, 'Câmara dos Deputados', 'Debate PL Fake News', 'orlando-regular-saude-b113-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia coordena resposta à tragédia climática do Rio Grande do Sul.', 'Saúde em emergência. Vamos montar hospitais de campanha onde precisarem.', 'Coletiva sobre enchentes no RS e resposta federal.', 'verified', true, '2024-05-08', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/maio/resposta-sanitaria-rio-grande-do-sul', 'official_statement', 1, 'Porto Alegre', 'Resposta emergência RS', 'nisia-rs-enchente-b113-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa coordena gabinete de crise sobre enchentes no RS.', 'Não é hora de politicagem. O Rio Grande do Sul precisa de todos nós.', 'Entrevista coletiva no Palácio do Planalto durante enchentes.', 'verified', false, '2024-05-06', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-05/rui-costa-gabinete-crise-rs', 'official_statement', 1, 'Brasília', 'Gabinete de crise RS', 'rui-gabinete-rs-b113-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem espalha desinformação sobre ajuda federal ao RS.', 'Lula não mandou nada para o RS. É tudo mentira da propaganda oficial.', 'Publicação em redes sociais contradita por dados oficiais.', 'verified', true, '2024-05-12', 'https://www.aosfatos.org/noticias/marcel-van-hattem-rs-lula-falso-2024/', 'social_media_post', 4, 'Porto Alegre', 'Publicação redes', 'marcel-rs-desinfo-b113-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca ministra Nísia em rede social.', 'Nísia é uma socióloga sem nenhuma noção de saúde. Vergonha do Brasil.', 'Postagem em rede social durante crise da dengue.', 'verified', false, '2024-03-02', 'https://www.metropoles.com/brasil/politica-br/eduardo-bolsonaro-nisia-trindade-socioesquerda', 'social_media_post', 3, 'Brasília', 'Publicação redes', 'eduardo-ataca-nisia-b113-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia rebate machismo em ataques à sua gestão.', 'O ataque ao meu trabalho é ataque à ciência e ataque à mulher na política.', 'Entrevista à Folha após ataques do bolsonarismo.', 'verified', true, '2024-03-15', 'https://www1.folha.uol.com.br/poder/2024/03/nisia-rebate-ataque-machista-bolsonarismo.shtml', 'interview', 1, 'Brasília', 'Entrevista Folha', 'nisia-machismo-ataques-b113-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ri de ministra Nísia e imita voz feminina em comício.', 'A ministra fica lá nervosinha, igual mulherzinha.', 'Discurso em comício em Minas Gerais com tom misógino.', 'verified', true, '2024-04-20', 'https://g1.globo.com/politica/noticia/2024/04/20/bolsonaro-imita-nisia-machista.ghtml', 'news_article', 4, 'Belo Horizonte', 'Comício', 'bolsonaro-imita-nisia-b113-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia nova política de saúde mental com foco em suicídio.', 'Saúde mental é prioridade. Vamos ampliar CAPS e telessaúde no SUS.', 'Lançamento do Plano Nacional de Saúde Mental.', 'verified', false, '2024-09-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/setembro/plano-nacional-saude-mental', 'official_statement', 1, 'Brasília', 'Plano Saúde Mental', 'nisia-saude-mental-plano-b113-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha promete ampliar Mais Médicos com 10 mil vagas.', 'Vamos ter 10 mil novos médicos na atenção básica até 2026.', 'Coletiva após posse como ministro da Saúde em março de 2025.', 'verified', false, '2025-03-15', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/marco/padilha-anuncia-10-mil-mais-medicos', 'official_statement', 1, 'Brasília', 'Anúncio Mais Médicos 2025', 'padilha-10-mil-medicos-b113-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas promete fim do Mais Médicos se bolsonarismo voltar ao poder.', 'Quando voltarmos ao poder, o Mais Médicos cubano acaba. É ideologia.', 'Vídeo bolsonarista em rede social.', 'verified', false, '2024-10-12', 'https://www.metropoles.com/brasil/politica-br/nikolas-mais-medicos-cuba-fim', 'social_media_post', 3, 'Belo Horizonte', 'Publicação redes', 'nikolas-fim-mais-medicos-b113-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende investimento em primeira infância como política sanitária.', 'Investir em primeira infância é investir em saúde por toda a vida.', 'Discurso em seminário sobre políticas para crianças.', 'verified', false, '2023-08-10', 'https://www.gov.br/planejamento/pt-br/acompanhe-o-planalto/noticias/2023/08/tebet-primeira-infancia-saude', 'official_statement', 1, 'Brasília', 'Seminário primeira infância', 'tebet-primeira-infancia-b113-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco aponta racismo na crise de saúde materna negra.', 'Mulheres negras morrem mais no parto. Isso é racismo estrutural.', 'Entrevista sobre relatório de saúde materna no Brasil.', 'verified', false, '2024-02-08', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-02/anielle-franco-saude-mulher-negra-racismo', 'official_statement', 1, 'Brasília', 'Dia da Mulher Negra Latino-Americana', 'anielle-saude-mulher-negra-b113-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia atenção especializada para mulheres negras no SUS.', 'Precisamos protocolos específicos para mulher negra. O SUS deve combater racismo.', 'Lançamento da política de saúde da população negra.', 'verified', false, '2024-05-13', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/maio/politica-saude-populacao-negra', 'official_statement', 1, 'Brasília', 'Política Saúde Pop Negra', 'nisia-saude-pop-negra-b113-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia transfobia em acesso à saúde.', 'Pessoas trans são expulsas de hospitais. SUS precisa acolher com dignidade.', 'Discurso na Câmara sobre política de saúde LGBT.', 'verified', false, '2024-01-29', 'https://www.camara.leg.br/noticias/erika-hilton-transfobia-sus-2024', 'official_statement', 2, 'Câmara dos Deputados', 'Dia da Visibilidade Trans', 'erika-transfobia-sus-b113-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende abstinência como política de saúde pública.', 'Ensinem a abstinência. Preservativo não é educação, é permissividade.', 'Discurso no Senado em debate sobre educação sexual no SUS.', 'verified', false, '2023-10-18', 'https://www12.senado.leg.br/noticias/materias/2023/10/18/damares-abstinencia-preservativo', 'official_statement', 3, 'Senado Federal', 'Debate educação sexual', 'damares-abstinencia-b113-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia amplia distribuição de PrEP para prevenção ao HIV no SUS.', 'PrEP salva vidas. Vamos ampliar o acesso a todos que precisam.', 'Anúncio no Dia Mundial da Aids sobre expansão da PrEP.', 'verified', false, '2023-12-01', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/dezembro/prep-hiv-sus-ampliacao', 'official_statement', 1, 'Brasília', 'Dia Mundial da Aids', 'nisia-prep-hiv-b113-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara vota contra ampliação do aborto legal para estupro.', 'Estou do lado da vida. Mesmo em estupro, o bebê é inocente.', 'Voto na CCJ em PL que trata de direitos reprodutivos.', 'verified', false, '2024-10-08', 'https://www.camara.leg.br/deputados/74283/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Votação CCJ', 'silas-voto-ccj-aborto-b113-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia critica subfinanciamento crônico do SUS pelo Congresso.', 'O SUS é elogiado no mundo mas é pingado de recursos no Brasil. Precisa mudar.', 'Audiência na Comissão de Seguridade Social da Câmara.', 'verified', false, '2024-04-09', 'https://www.camara.leg.br/noticias/nisia-subfinanciamento-sus-audiencia-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Audiência Seguridade', 'nisia-subfinanciamento-b113-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende PL para proibir ensino de gênero nas escolas.', 'Ideologia de gênero é doutrinação. Vamos proibir nas escolas.', 'Defesa de PL da Escola sem Partido na Câmara.', 'verified', false, '2023-06-19', 'https://www.camara.leg.br/deputados/74847/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'PL Escola sem Partido', 'bia-ideologia-genero-b113-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva conecta crise climática a crises sanitárias no Brasil.', 'O clima está adoecendo gente. Dengue, calor extremo, tudo está ligado.', 'Discurso em evento da COP em Dubai sobre saúde e clima.', 'verified', false, '2023-12-03', 'https://www.gov.br/mma/pt-br/assuntos/noticias/2023/dezembro/marina-cop28-saude-clima', 'official_statement', 1, 'Dubai', 'COP28', 'marina-clima-dengue-b113-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Fiocruz e diz que instituição é aparelhada pelo PT.', 'A Fiocruz virou aparelhagem do PT. Precisa ser desmontada.', 'Entrevista a canal conservador dos EUA.', 'verified', false, '2024-09-18', 'https://www.aosfatos.org/noticias/bolsonaro-fiocruz-aparelhada-pt-falso/', 'interview', 4, 'Orlando, EUA', 'Entrevista canal EUA', 'bolsonaro-fiocruz-aparelhada-b113-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende Fiocruz como patrimônio do Brasil diante de ataques.', 'A Fiocruz é patrimônio nacional. Os ataques são injustos e perigosos.', 'Cerimônia dos 124 anos da Fiocruz no Rio de Janeiro.', 'verified', false, '2024-05-25', 'https://portal.fiocruz.br/noticia/2024/05/nisia-fiocruz-patrimonio-124-anos', 'official_statement', 1, 'Rio de Janeiro', '124 anos da Fiocruz', 'nisia-defende-fiocruz-b113-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone defende aborto legal após feminicídio em hospital.', 'Uma menina foi morta no hospital ao tentar abortar. O Brasil não pode tolerar.', 'Discurso em plenário após caso de morte materna por aborto inseguro.', 'verified', false, '2024-10-15', 'https://www.camara.leg.br/noticias/taliria-feminicidio-hospital-aborto-2024', 'official_statement', 2, 'Câmara dos Deputados', 'Homenagem vítima aborto', 'taliria-feminicidio-hospital-b113-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança estratégia nacional contra oropouche e mayaro.', 'Temos que monitorar arboviroses emergentes. A Amazônia é o epicentro.', 'Lançamento em Manaus diante do aumento de casos de oropouche.', 'verified', false, '2024-08-14', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/agosto/estrategia-oropouche-mayaro', 'official_statement', 1, 'Manaus', 'Estratégia arboviroses', 'nisia-oropouche-b113-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha lança plano contra filas de cirurgia com ajuda de governadores.', 'Vamos zerar a fila de cirurgia eletiva em 2026. Pacto com estados.', 'Lançamento em Brasília com governadores e secretarias de Saúde.', 'verified', false, '2025-05-08', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/maio/padilha-plano-zerar-filas-cirurgia', 'official_statement', 1, 'Brasília', 'Plano filas cirurgia 2025', 'padilha-filas-cirurgia-2025-b113-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate fake news sobre vacina de dengue em 2025.', 'Vacina é segura. Quem espalha mentira precisa ser responsabilizado.', 'Coletiva em resposta a desinformação nas redes sobre Qdenga.', 'verified', false, '2025-04-08', 'https://agenciabrasil.ebc.com.br/saude/noticia/2025-04/padilha-rebate-fake-news-vacina', 'official_statement', 1, 'Brasília', 'Coletiva fake news', 'padilha-fake-news-vacina-b113-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lança campanha antivacina disfarçada de liberdade.', 'Meu corpo minha escolha só vale quando não é para vacinar. Liberdade.', 'Postagem em rede social durante campanha vacinal de 2024.', 'verified', false, '2024-09-26', 'https://www.aosfatos.org/noticias/nikolas-antivacina-liberdade-2024/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem redes', 'nikolas-antivacina-liberdade-b113-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia celebra aumento da cobertura vacinal em 2024.', 'A cobertura vacinal voltou a subir. Brasil está reconstruindo o PNI.', 'Balanço anual do Ministério da Saúde sobre vacinação.', 'verified', false, '2024-12-19', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/dezembro/balanco-vacinacao-2024-nisia', 'official_statement', 1, 'Brasília', 'Balanço vacinação 2024', 'nisia-cobertura-vacinal-2024-b113-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca aborto e diz que mulher deve aceitar gestação.', 'Mulher deve aceitar o dom da vida. Abortar é se rebelar contra Deus.', 'Pregação em programa de TV evangélica.', 'verified', false, '2024-03-30', 'https://www.camara.leg.br/deputados/74168/biografia', 'official_statement', 3, 'Rio de Janeiro', 'Programa TV evangélica', 'feliciano-dom-vida-b113-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia telessaúde na atenção básica em todos os municípios.', 'Todos os municípios vão ter telessaúde. Tecnologia servindo ao SUS.', 'Lançamento em Brasília do Programa Saúde com Agente.', 'verified', false, '2024-07-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/julho/programa-saude-com-agente-telessaude', 'official_statement', 1, 'Brasília', 'Programa Saúde com Agente', 'nisia-telessaude-b113-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ironiza vacina da dengue e culpa Ministério da Saúde por mortes.', 'A vacina do Lula não funciona. As mortes são culpa do governo.', 'Vídeo publicado durante epidemia de dengue em 2024.', 'verified', false, '2024-04-02', 'https://www.aosfatos.org/noticias/bolsonaro-ironiza-vacina-dengue-lula/', 'social_media_post', 4, 'Orlando, EUA', 'Vídeo redes', 'bolsonaro-ironiza-qdenga-b113-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara cobra continuidade de ação contra desnutrição Yanomami.', 'Um ano não resolveu tudo. A tragédia Yanomami exige trabalho permanente.', 'Entrevista no aniversário da emergência sanitária em Roraima.', 'verified', false, '2024-01-21', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-01/sonia-yanomami-um-ano-desnutricao', 'interview', 1, 'Boa Vista, RR', 'Um ano da emergência Yanomami', 'sonia-yanomami-1ano-b113-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ridiculariza vacina indiana para dengue.', 'Vacina feita na Índia? Vão transformar brasileiro em cobaia.', 'Postagem em rede social no início da vacinação da dengue.', 'verified', false, '2024-02-11', 'https://www.aosfatos.org/noticias/eduardo-bolsonaro-vacina-india-xenofobia/', 'social_media_post', 3, 'Brasília', 'Postagem redes', 'eduardo-vacina-india-b113-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende SUS em debate sobre reforma administrativa em 2025.', 'Reforma que fragiliza servidor fragiliza SUS. Não vamos aceitar.', 'Audiência na Câmara sobre reforma administrativa.', 'verified', false, '2025-06-12', 'https://www.camara.leg.br/noticias/padilha-reforma-administrativa-sus-2025', 'official_statement', 1, 'Câmara dos Deputados', 'Audiência reforma', 'padilha-reforma-admin-sus-b113-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro apresenta CPI contra Nísia Trindade em 2024.', 'Nísia Trindade precisa explicar no Congresso a morte por dengue.', 'Apresentação de requerimento de CPI da Dengue no Senado.', 'verified', false, '2024-03-22', 'https://www12.senado.leg.br/noticias/materias/2024/03/22/flavio-cpi-dengue-nisia', 'official_statement', 3, 'Senado Federal', 'Requerimento CPI da Dengue', 'flavio-cpi-nisia-b113-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar rebate CPI da Dengue e defende Nísia.', 'Fazer CPI para intimidar ministra é covardia política.', 'Discurso no Senado em resposta a Flávio Bolsonaro.', 'verified', false, '2024-03-23', 'https://www12.senado.leg.br/noticias/materias/2024/03/23/otto-alencar-nisia-cpi-covardia', 'official_statement', 1, 'Senado Federal', 'Debate CPI Dengue', 'otto-defende-nisia-b113-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia reage a ataques e reafirma fatos da epidemia de dengue.', 'Ataques pessoais não mudam a realidade. Nós vacinamos 10 milhões.', 'Entrevista coletiva em resposta a ataques bolsonaristas.', 'verified', false, '2024-03-25', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/marco/nisia-responde-ataques-dengue', 'official_statement', 1, 'Brasília', 'Resposta a CPI da Dengue', 'nisia-responde-ataques-b113-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal nega benefícios de vacinas em pré-campanha.', 'Eu tomei jejum, meditação e rede de apoio. Não precisei de vacina.', 'Live de pré-campanha à prefeitura de São Paulo.', 'verified', false, '2024-06-05', 'https://www.aosfatos.org/noticias/pablo-marcal-jejum-meditacao-vacina/', 'social_media_post', 3, 'São Paulo', 'Live de pré-campanha', 'marcal-jejum-meditacao-b113-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares questiona vacina HPV e espalha desinformação.', 'A vacina do HPV deu reação em meninas. Precisa de investigação.', 'Entrevista em canal evangélico sobre vacinação.', 'verified', false, '2023-09-20', 'https://www.aosfatos.org/noticias/damares-vacina-hpv-desinformacao-2023/', 'interview', 4, 'Brasília', 'Entrevista canal evangélico', 'damares-vacina-hpv-b113-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende vacina HPV contra desinformação de Damares.', 'A vacina HPV é segura e protege meninas do câncer. Ciência, não boato.', 'Entrevista à Folha em resposta a Damares.', 'verified', false, '2023-09-22', 'https://www1.folha.uol.com.br/equilibrioesaude/2023/09/nisia-vacina-hpv-seguranca-damares.shtml', 'interview', 1, 'Brasília', 'Resposta a Damares', 'nisia-vacina-hpv-defesa-b113-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali lidera frente parlamentar em defesa do SUS.', 'Vamos constituir frente parlamentar para defender SUS de cada ataque.', 'Lançamento de frente em defesa do SUS na Câmara.', 'verified', false, '2023-04-26', 'https://www.camara.leg.br/noticias/jandira-frente-sus-2023', 'official_statement', 1, 'Câmara dos Deputados', 'Lançamento frente SUS', 'jandira-frente-sus-b113-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia Novo PAC da Saúde com hospitais e UPAs.', 'Vamos construir 40 novos hospitais e 500 UPAs pelo Brasil.', 'Anúncio do Novo PAC com ministra Nísia e presidenciais.', 'verified', true, '2023-08-11', 'https://www.gov.br/casacivil/pt-br/noticias/2023/agosto/novo-pac-saude-hospitais-upas', 'official_statement', 1, 'Rio de Janeiro', 'Lançamento Novo PAC Saúde', 'lula-novo-pac-saude-b113-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia abre envio de vacinas contra mpox para todo o Brasil.', 'A mpox exige resposta rápida. Todo estado vai receber vacinas.', 'Coletiva sobre resposta ao surto de mpox no Brasil.', 'verified', false, '2024-08-22', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/agosto/vacinas-mpox-brasil', 'official_statement', 1, 'Brasília', 'Resposta mpox 2024', 'nisia-mpox-vacinas-b113-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa cobra ações contra influenza em surtos sazonais.', 'Todo ano a gripe enche UPAs. Precisa antecipar vacinação e preparar rede.', 'Discurso no Senado sobre campanhas de influenza.', 'verified', false, '2024-05-02', 'https://www12.senado.leg.br/noticias/materias/2024/05/02/humberto-influenza-cobra-ministerio', 'official_statement', 1, 'Senado Federal', 'Debate influenza', 'humberto-influenza-b113-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende retomada do Farmácia Popular gratuito em 2025.', 'Ampliamos o Farmácia Popular. Mais 10 medicamentos gratuitos.', 'Cerimônia em Brasília com governadores.', 'verified', false, '2025-06-02', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/junho/padilha-farmacia-popular-amplia', 'official_statement', 1, 'Brasília', 'Ampliação Farmácia Popular 2025', 'padilha-farmacia-amplia-b113-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas afirma falsamente que SUS está quebrado.', 'O SUS quebrou. Lula entregou o SUS aos cubanos e hoje não atende ninguém.', 'Vídeo em rede social contradito pelos dados do Ministério.', 'verified', false, '2025-07-18', 'https://www.aosfatos.org/noticias/nikolas-sus-quebrou-falso-2025/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem redes', 'nikolas-sus-quebrou-b113-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira arquiva PL 1904 após pressão e decreta silêncio.', 'Vamos deixar o PL 1904 na gaveta. Não vai ao plenário.', 'Declaração a jornalistas após protestos em várias capitais.', 'verified', false, '2024-06-20', 'https://g1.globo.com/politica/noticia/2024/06/20/lira-gaveta-pl-1904.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Recuo PL 1904', 'lira-arquiva-pl-1904-b113-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende legalização do aborto em entrevista internacional.', 'Sou médica sanitarista. O aborto inseguro mata mulheres pobres no Brasil.', 'Entrevista ao jornal El País.', 'verified', true, '2024-07-02', 'https://brasil.elpais.com/brasil/2024-07-02/nisia-trindade-aborto-legalizacao-entrevista.html', 'interview', 1, 'Brasília', 'Entrevista El País', 'nisia-legalizacao-aborto-b113-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis pede impeachment de Nísia por falas sobre aborto.', 'Uma ministra da Saúde defender aborto é crime. Impeachment já.', 'Requerimento apresentado na Câmara após entrevista de Nísia.', 'verified', true, '2024-07-03', 'https://www.camara.leg.br/noticias/bia-kicis-impeachment-nisia-aborto-2024', 'official_statement', 3, 'Câmara dos Deputados', 'Pedido de impeachment', 'bia-impeachment-nisia-b113-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende Nísia e denuncia tentativa de intimidação.', 'Tentar calar uma ministra é crime contra a democracia e contra mulheres.', 'Discurso em plenário em defesa da ministra.', 'verified', false, '2024-07-04', 'https://www.camara.leg.br/noticias/erika-hilton-defende-nisia-intimidacao-2024', 'official_statement', 2, 'Câmara dos Deputados', 'Defesa ministra Nísia', 'erika-defende-nisia-b113-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira defende Nísia e critica PL 1904.', 'A ministra tem o direito de falar. A democracia exige respeito ao cargo.', 'Discurso em plenário do Senado em defesa da ministra.', 'verified', false, '2024-07-05', 'https://www12.senado.leg.br/noticias/materias/2024/07/05/alessandro-defende-nisia-aborto', 'official_statement', 1, 'Senado Federal', 'Defesa da ministra', 'alessandro-defende-nisia-b113-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia parceria Brasil-Argentina para produção de vacinas.', 'Vamos integrar produção sul-americana de imunizantes. Soberania regional.', 'Cerimônia em Buenos Aires sobre vacinas no Mercosul.', 'verified', false, '2025-09-12', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/setembro/padilha-argentina-vacinas-mercosul', 'official_statement', 1, 'Buenos Aires', 'Acordo vacinal Mercosul', 'padilha-argentina-vacinas-b113-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia estratégia nacional contra mpox clade I.', 'Temos protocolo. Vamos vacinar grupo de risco e isolar casos confirmados.', 'Coletiva no Palácio do Planalto sobre mpox clade I.', 'verified', false, '2025-11-04', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/novembro/padilha-mpox-clade-1', 'official_statement', 1, 'Brasília', 'Estratégia mpox 2025', 'padilha-mpox-clade1-b113-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha celebra avanços do SUS em balanço de abril de 2026.', 'Reconstruímos o SUS em três anos. Mas ainda há muito a fazer.', 'Balanço em evento nacional de saúde em abril de 2026.', 'verified', false, '2026-04-07', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2026/abril/balanco-sus-reconstrucao-padilha', 'official_statement', 1, 'Brasília', 'Dia Mundial da Saúde 2026', 'padilha-balanco-sus-2026-b113-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
