-- Batch 112: Crises sanitárias, SUS e pandemias (Jan 2023 - Abr 2026) - Parte 1
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
  c_con UUID;
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

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia assume Ministério da Saúde prometendo reconstruir SUS e vacinação.', 'O SUS é patrimônio do povo brasileiro e vamos reconstruí-lo com ciência e coragem.', 'Discurso de posse como primeira mulher a comandar o Ministério da Saúde.', 'verified', true, '2023-01-02', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/janeiro/nisia-trindade-toma-posse-como-ministra-da-saude', 'official_statement', 1, 'Brasília', 'Posse como ministra da Saúde', 'nisia-posse-sus-b112-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia declara emergência de saúde em Roraima por crise Yanomami.', 'O que vimos foi genocídio. Não podemos mais aceitar o abandono do povo Yanomami.', 'Declaração após visita a Boa Vista com Lula para conhecer situação sanitária.', 'verified', true, '2023-01-21', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/janeiro/ministerio-da-saude-declara-emergencia-sanitaria-em-roraima', 'official_statement', 1, 'Boa Vista, RR', 'Missão emergencial Yanomami', 'nisia-emergencia-yanomami-b112-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro nega responsabilidade por tragédia Yanomami e acusa imprensa de farsa.', 'Isso é uma farsa da esquerda. Fizemos mais pelos yanomamis do que qualquer governo.', 'Entrevista a jornalistas nos EUA após reportagens sobre desnutrição e mortes.', 'verified', true, '2023-01-24', 'https://www1.folha.uol.com.br/poder/2023/01/bolsonaro-nega-genocidio-yanomami.shtml', 'news_article', 4, 'Orlando, EUA', 'Entrevista a apoiadores', 'bolsonaro-nega-yanomami-b112-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia relança Mais Médicos para ampliar atenção básica no SUS.', 'Vamos levar médicos a cada rincão do Brasil. O Mais Médicos está de volta.', 'Cerimônia de relançamento do programa Mais Médicos com Lula no Planalto.', 'verified', true, '2023-03-20', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/marco/presidente-lula-relanca-programa-mais-medicos', 'official_statement', 1, 'Brasília', 'Relançamento Mais Médicos', 'nisia-mais-medicos-b112-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende SUS universal e ataca política sanitária do governo anterior.', 'O Brasil perdeu 700 mil pessoas porque teve um presidente que zombou da vacina.', 'Discurso na abertura do ano legislativo sobre prioridades em saúde.', 'verified', true, '2023-02-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/discurso-presidente-abertura-legislativa', 'official_statement', 2, 'Brasília', 'Abertura do Congresso', 'lula-700-mil-mortes-b112-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca retomada da vacinação infantil com desinformação.', 'Não vou obrigar meu filho a tomar vacina experimental. Ninguém vai.', 'Vídeo publicado em redes sociais sobre calendário vacinal do Ministério da Saúde.', 'verified', true, '2023-02-28', 'https://www.aosfatos.org/noticias/nikolas-ferreira-vacina-infantil-desinformacao/', 'social_media_post', 5, 'Brasília', 'Publicação em redes sociais', 'nikolas-vacina-infantil-b112-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança Movimento Nacional pela Vacinação após cobertura cair a mínimas históricas.', 'A cobertura vacinal caiu durante a pandemia e precisamos recuperar agora, casa a casa.', 'Lançamento em Brasília diante da queda da cobertura infantil a 67 por cento.', 'verified', true, '2023-02-24', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/fevereiro/ministerio-da-saude-lanca-movimento-nacional-pela-vacinacao', 'official_statement', 1, 'Brasília', 'Lançamento Movimento Vacinação', 'nisia-movimento-vacinacao-b112-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende SUS no Senado após anos de subfinanciamento.', 'O SUS saiu da pandemia ferido. O Congresso tem obrigação histórica de refinanciá-lo.', 'Discurso no plenário do Senado sobre PEC da Saúde.', 'verified', false, '2023-03-15', 'https://www12.senado.leg.br/noticias/materias/2023/03/15/humberto-costa-defende-refinanciamento-sus', 'official_statement', 1, 'Senado Federal', 'Debate sobre saúde pública', 'humberto-sus-refinanciamento-b112-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis pede fim do Mais Médicos chamando programa de comunismo.', 'O Mais Médicos é invasão cubana. Querem importar ideologia comunista em forma de médico.', 'Discurso na tribuna da Câmara após relançamento do programa.', 'verified', false, '2023-03-22', 'https://www.camara.leg.br/deputados/74847/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Debate Mais Médicos', 'bia-mais-medicos-cubano-b112-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança Complexo Econômico-Industrial da Saúde para produção nacional.', 'Não podemos depender do exterior para fabricar nossos remédios e vacinas. Soberania sanitária.', 'Anúncio em Manguinhos, Fiocruz, sobre retomada da produção de IFAs no Brasil.', 'verified', true, '2023-04-25', 'https://portal.fiocruz.br/noticia/presidente-lula-lanca-complexo-economico-industrial-da-saude', 'official_statement', 1, 'Rio de Janeiro', 'Lançamento CEIS', 'nisia-ceis-fiocruz-b112-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro nos EUA ataca OMS e pede saída do Brasil.', 'A OMS é uma organização que traiu a humanidade na pandemia. O Brasil tem que sair.', 'Participação em evento conservador CPAC em Washington.', 'verified', false, '2023-03-03', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-oms-cpac/', 'news_article', 4, 'Washington, EUA', 'CPAC 2023', 'eduardo-oms-cpac-b112-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia confirma encerramento da emergência de saúde pública por covid no Brasil.', 'Encerramos a emergência, mas o vírus continua entre nós. Vacinar é proteger.', 'Entrevista coletiva após OMS declarar fim da emergência internacional.', 'verified', true, '2023-05-22', 'https://agenciabrasil.ebc.com.br/saude/noticia/2023-05/brasil-encerra-emergencia-em-saude-publica-por-covid-19', 'official_statement', 1, 'Brasília', 'Encerramento da ESPIN Covid', 'nisia-fim-emergencia-covid-b112-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro volta a defender cloroquina mesmo após CPI da Covid.', 'A cloroquina salvou muita gente. Quem tomou cedo não morreu.', 'Entrevista a podcast conservador revisitando pandemia.', 'verified', false, '2023-06-08', 'https://www.aosfatos.org/noticias/bolsonaro-cloroquina-pandemia-podcast/', 'interview', 5, 'Orlando, EUA', 'Podcast conservador', 'bolsonaro-cloroquina-2023-b112-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende ampliar orçamento do SUS na LDO de 2024.', 'O Brasil não pode gastar menos em saúde. Precisamos revogar o teto para o SUS.', 'Discurso na Comissão de Seguridade Social da Câmara.', 'verified', false, '2023-06-14', 'https://www.camara.leg.br/noticias/jandira-feghali-orcamento-sus-ldo-2024', 'official_statement', 1, 'Câmara dos Deputados', 'Comissão de Seguridade Social', 'jandira-orcamento-sus-b112-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama aborto legal de assassinato em sessão do Senado.', 'Aborto é assassinato. Não existe aborto legal, existe o legalizado pela maldade.', 'Discurso no Senado em debate sobre direitos reprodutivos.', 'verified', false, '2023-07-05', 'https://www12.senado.leg.br/noticias/materias/2023/07/05/magno-malta-aborto-debate', 'official_statement', 3, 'Senado Federal', 'Debate sobre aborto', 'magno-aborto-senado-b112-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia incorporação da vacina de dengue da Takeda ao SUS.', 'Vamos ser o primeiro país do mundo a incluir a vacina da dengue no sistema público.', 'Anúncio em Brasília com apoio da Fiocruz para enfrentamento da doença.', 'verified', true, '2023-12-22', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/dezembro/brasil-sera-primeiro-pais-a-oferecer-vacina-da-dengue-no-sus', 'official_statement', 1, 'Brasília', 'Incorporação Qdenga SUS', 'nisia-qdenga-sus-b112-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia declara emergência nacional contra maior epidemia de dengue da história.', 'Estamos diante da maior epidemia de dengue da história do Brasil. Todos os estados em alerta.', 'Coletiva anunciando Centro de Operações de Emergência diante de casos explosivos.', 'verified', true, '2024-02-02', 'https://portal.fiocruz.br/noticia/2024/02/brasil-enfrenta-maior-epidemia-de-dengue-da-historia', 'official_statement', 1, 'Brasília', 'COE Dengue 2024', 'nisia-coe-dengue-b112-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ironiza esforço do governo contra dengue e culpa Lula.', 'Lula fala de dengue enquanto o mosquito ri. Governo incompetente até no Aedes.', 'Postagem no X durante picos diários de casos no início de 2024.', 'verified', false, '2024-02-10', 'https://www.metropoles.com/brasil/politica-br/nikolas-dengue-lula-ironia', 'social_media_post', 2, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-ironia-dengue-b112-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia ampliação da vacinação contra dengue em 521 municípios.', 'Vamos proteger primeiro as áreas mais atingidas. Falta vacina no mundo, mas vamos fazer nossa parte.', 'Entrevista em São Paulo durante pico da epidemia.', 'verified', true, '2024-02-09', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/fevereiro/ministerio-da-saude-define-521-municipios-para-vacinacao-contra-dengue', 'official_statement', 1, 'São Paulo', 'Estratégia vacinal dengue', 'nisia-vacina-dengue-521-b112-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro culpa governo Lula pela epidemia de dengue.', 'No meu governo não tinha essa dengue toda. Agora o povo morre porque o Lula não cuida.', 'Comício em Belo Horizonte durante pico epidêmico.', 'verified', false, '2024-02-25', 'https://g1.globo.com/politica/noticia/2024/02/25/bolsonaro-dengue-lula-comicio.ghtml', 'news_article', 3, 'Belo Horizonte', 'Comício', 'bolsonaro-culpa-dengue-b112-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas espalha desinformação sobre vacina da dengue ser experimental.', 'A vacina que vão dar nas crianças é experimental. Pais, protejam seus filhos.', 'Vídeo viral em redes sociais durante início da vacinação no SUS.', 'verified', true, '2024-02-12', 'https://www.aosfatos.org/noticias/nikolas-vacina-dengue-experimental-falso/', 'social_media_post', 5, 'Belo Horizonte', 'Publicação em redes', 'nikolas-desinfo-vacina-dengue-b112-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia rebate ataques sobre vacina da dengue com dados da Anvisa.', 'A vacina é segura, aprovada pela Anvisa e recomendada pela SBIm. Quem espalha mentira mata.', 'Entrevista coletiva respondendo ondas de desinformação.', 'verified', true, '2024-02-14', 'https://agenciabrasil.ebc.com.br/saude/noticia/2024-02/nisia-vacina-dengue-segura', 'official_statement', 1, 'Brasília', 'Coletiva sobre dengue', 'nisia-rebate-desinfo-dengue-b112-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ort := v_orl, 'Orlando Silva critica desinformação como crime contra saúde pública.', 'Espalhar mentira sobre vacina em meio a epidemia é crime contra a saúde pública.', 'Discurso no plenário defendendo PL das Fake News e proteção sanitária.', 'verified', false, '2024-03-06', 'https://www.camara.leg.br/noticias/orlando-silva-desinformacao-vacina-crime', 'official_statement', 1, 'Câmara dos Deputados', 'Debate PL Fake News', 'orlando-desinfo-crime-saude-b112-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende Mais Médicos como ministro das Relações Institucionais.', 'O Mais Médicos salva vidas. Vamos barrar qualquer tentativa de acabar com o programa.', 'Entrevista à TV Brasil sobre articulação do programa no Congresso.', 'verified', false, '2023-08-10', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-08/padilha-mais-medicos-congresso', 'interview', 1, 'Brasília', 'Entrevista TV Brasil', 'padilha-mais-medicos-defesa-b112-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano ataca ministra Nísia por defender aborto legal.', 'Essa ministra defende matar crianças. É uma vergonha ter gente assim no governo.', 'Pronunciamento na tribuna da Câmara após entrevista da ministra sobre violência sexual.', 'verified', false, '2023-09-14', 'https://www.camara.leg.br/deputados/74367/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Pronunciamento', 'feliciano-ataca-nisia-b112-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende aborto legal em casos previstos em lei e atendimento humanizado.', 'O SUS tem obrigação legal de atender mulheres vítimas de estupro. Não vamos recuar.', 'Entrevista sobre reabertura de serviços de aborto legal em hospitais do SUS.', 'verified', true, '2023-09-12', 'https://www.bbc.com/portuguese/articles/nisia-trindade-aborto-legal-sus', 'news_article', 1, 'Brasília', 'Entrevista BBC Brasil', 'nisia-aborto-legal-sus-b112-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares pede impeachment de Nísia por apoio ao aborto legal.', 'Essa ministra tem que cair. Está promovendo cultura de morte no SUS.', 'Discurso no Senado em defesa do projeto que restringe aborto em casos de estupro.', 'verified', false, '2023-09-20', 'https://www12.senado.leg.br/noticias/materias/2023/09/20/damares-impeachment-nisia', 'official_statement', 3, 'Senado Federal', 'Sessão sobre aborto', 'damares-impeachment-nisia-b112-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia novo calendário de vacinação do HPV em dose única.', 'A dose única aumenta a cobertura e protege meninos e meninas do câncer.', 'Anúncio em São Paulo ao lado de entidades pediátricas.', 'verified', false, '2024-04-01', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/abril/ministerio-da-saude-adota-dose-unica-da-vacina-hpv', 'official_statement', 1, 'São Paulo', 'Mudança calendário HPV', 'nisia-hpv-dose-unica-b112-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara ataca vacina de HPV com discurso moral.', 'Não é a vacina que vai salvar nossas crianças, é a educação cristã.', 'Discurso na Câmara contra adoção de dose única do HPV.', 'verified', false, '2024-04-09', 'https://www.camara.leg.br/deputados/74373/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Sessão sobre HPV', 'silas-hpv-b112-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala sobre cirurgia no quadril e recuperação.', 'Operei o quadril, estou bem. A medicina do SUS é a melhor do mundo.', 'Declaração após cirurgia no quadril e cirurgia reparadora na pálpebra.', 'verified', false, '2023-10-03', 'https://agenciabrasil.ebc.com.br/politica/noticia/2023-10/lula-cirurgia-quadril-sus', 'official_statement', 1, 'Brasília', 'Declaração pós-cirurgia', 'lula-cirurgia-quadril-b112-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro ironiza cirurgia de Lula e política de saúde.', 'Lula só fala em saúde quando é a saúde dele. Do povo esquece.', 'Postagem em rede social logo após internação presidencial.', 'verified', false, '2023-10-05', 'https://www.poder360.com.br/politica/flavio-bolsonaro-lula-cirurgia-ironia/', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'flavio-ironia-lula-cirurgia-b112-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança programa de saúde mental no SUS após alta de suicídios.', 'Saúde mental é saúde. Vamos abrir CAPS e fortalecer a atenção psicossocial.', 'Lançamento do programa junto à Associação Brasileira de Psiquiatria.', 'verified', false, '2024-05-17', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/maio/ministerio-da-saude-lanca-programa-nacional-de-saude-mental', 'official_statement', 1, 'Brasília', 'Programa Saúde Mental SUS', 'nisia-saude-mental-caps-b112-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton critica falta de atendimento de saúde para pessoas trans no SUS.', 'Pessoas trans morrem porque o SUS ainda não aprendeu a nos receber. Isso precisa mudar.', 'Discurso na Comissão de Direitos Humanos da Câmara.', 'verified', false, '2023-06-28', 'https://www.camara.leg.br/noticias/erika-hilton-saude-trans-sus', 'official_statement', 1, 'Câmara dos Deputados', 'Comissão de Direitos Humanos', 'erika-saude-trans-sus-b112-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano compara atendimento trans no SUS a aberração.', 'O SUS não pode gastar dinheiro do povo com aberração. É contra a natureza.', 'Fala em culto transmitido ao vivo após nota técnica do Ministério.', 'verified', false, '2023-07-02', 'https://www.aosfatos.org/noticias/feliciano-pessoas-trans-sus-discurso/', 'social_media_post', 4, 'São Paulo', 'Culto transmitido', 'feliciano-aberracao-trans-b112-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia retorno da política nacional para saúde da população LGBT.', 'O SUS acolhe todas as pessoas. Vamos retomar a política nacional de saúde LGBTQIA+.', 'Anúncio no Palácio do Planalto junto a organizações LGBTQIA+.', 'verified', false, '2023-06-28', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/junho/ministerio-da-saude-retoma-politica-nacional-lgbt', 'official_statement', 1, 'Brasília', 'Dia do Orgulho LGBTQIA+', 'nisia-saude-lgbt-b112-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia mortalidade materna negra como racismo estrutural no SUS.', 'Mulheres negras morrem muito mais no parto. Isso não é acaso, é racismo no SUS.', 'Discurso no plenário da Câmara em audiência pública sobre mortalidade materna.', 'verified', false, '2023-11-20', 'https://www.camara.leg.br/noticias/taliria-petrone-mortalidade-materna-negra', 'official_statement', 1, 'Câmara dos Deputados', 'Audiência Pública', 'taliria-mortalidade-materna-b112-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara cobra conclusão da Casa de Saúde Indígena Yanomami.', 'Os yanomamis ainda sofrem. Precisamos concluir a Casa de Saúde Indígena e garantir SUS de verdade.', 'Entrevista em Brasília sobre balanço do primeiro ano da operação Yanomami.', 'verified', false, '2024-01-22', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-01/sonia-guajajara-yanomami-balanco', 'interview', 1, 'Brasília', 'Balanço 1 ano Yanomami', 'sonia-yanomami-balanco-b112-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende saúde da população negra no SUS.', 'O racismo também está nas mesas de obstetrícia. O SUS precisa enxergar a mulher negra.', 'Participação em seminário sobre equidade racial em saúde na Fiocruz.', 'verified', false, '2023-11-23', 'https://portal.fiocruz.br/noticia/2023/11/anielle-franco-saude-populacao-negra-fiocruz', 'official_statement', 1, 'Rio de Janeiro', 'Seminário Fiocruz', 'anielle-saude-negra-fiocruz-b112-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica gasto com propaganda de vacinação e defende corte.', 'O governo gasta milhões com propaganda de vacina enquanto faltam remédios no SUS.', 'Entrevista sobre orçamento do Ministério da Saúde no início de 2024.', 'verified', false, '2024-02-20', 'https://www.camara.leg.br/deputados/204536/biografia', 'interview', 2, 'Brasília', 'Entrevista sobre orçamento', 'kim-propaganda-vacina-b112-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia declara emergência nacional por Oropouche em Manaus.', 'O Oropouche é um desafio novo. Vamos apoiar estados e municípios a enfrentar.', 'Anúncio após surto do vírus Oropouche atingir múltiplos estados.', 'verified', true, '2024-06-27', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/junho/ministerio-declara-emergencia-por-oropouche', 'official_statement', 1, 'Brasília', 'Emergência Oropouche', 'nisia-oropouche-emergencia-b112-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia responde à emergência global de Mpox declarada pela OMS.', 'O Brasil está preparado. Temos vacinas, protocolos e vigilância para a Mpox.', 'Coletiva após OMS declarar nova emergência internacional por Mpox.', 'verified', true, '2024-08-15', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/agosto/ministerio-da-saude-preparado-mpox', 'official_statement', 1, 'Brasília', 'Resposta Mpox', 'nisia-mpox-resposta-b112-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ridiculariza campanha de Mpox com tom homofóbico.', 'Agora é doença de gay de novo. O governo gasta fortuna para isso.', 'Postagem em rede social após decreto de emergência internacional.', 'verified', true, '2024-08-17', 'https://www.aosfatos.org/noticias/nikolas-mpox-homofobia-post/', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-mpox-homofobia-b112-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia homofobia institucional em fala sobre Mpox.', 'A homofobia mata. Vacinar contra Mpox salva vidas. Chega de estigma.', 'Discurso na tribuna da Câmara em defesa da política de vacinação.', 'verified', false, '2024-08-20', 'https://www.camara.leg.br/noticias/samia-bomfim-mpox-homofobia-estigma', 'official_statement', 1, 'Câmara dos Deputados', 'Sessão sobre Mpox', 'samia-mpox-defesa-b112-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia Farmácia Popular ampliada com medicamentos gratuitos.', 'Medicamento não é mercadoria, é direito. Farmácia Popular 100 por cento gratuita.', 'Cerimônia no Planalto em 2023 com ampliação de cobertura.', 'verified', false, '2023-03-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2023/marco/farmacia-popular-gratuita-ampliada', 'official_statement', 1, 'Brasília', 'Relançamento Farmácia Popular', 'nisia-farmacia-popular-b112-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende ampliação de recursos para SUS no novo arcabouço fiscal.', 'Saúde é prioridade. Não há como fazer ajuste sem proteger o SUS.', 'Entrevista sobre LDO como ministra do Planejamento.', 'verified', false, '2023-05-30', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-05/tebet-defende-sus-ldo', 'interview', 1, 'Brasília', 'Debate orçamento 2024', 'tebet-sus-arcabouco-b112-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende investimento em saúde como política fiscal responsável.', 'Investir no SUS é eficiência econômica. Cada real em prevenção salva dez no hospital.', 'Fala em seminário sobre fiscal e social no Rio de Janeiro.', 'verified', false, '2023-07-18', 'https://agenciabrasil.ebc.com.br/economia/noticia/2023-07/haddad-sus-investimento-fiscal', 'official_statement', 1, 'Rio de Janeiro', 'Seminário Fiscal e Social', 'haddad-sus-fiscal-b112-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira diz que mudará Bolsa Família e SUS se for necessário.', 'Se o governo não cortar, o Congresso vai cortar. Saúde também entra na conta.', 'Entrevista à imprensa em meio a discussão do arcabouço fiscal.', 'verified', false, '2023-08-07', 'https://www1.folha.uol.com.br/mercado/2023/08/arthur-lira-corte-orcamento.shtml', 'interview', 3, 'Brasília', 'Entrevista coletiva', 'lira-corte-sus-b112-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia acordo de transferência de tecnologia para vacina da dengue brasileira.', 'Vamos ter vacina de dengue fabricada 100 por cento no Brasil pelo Butantan.', 'Anúncio com Instituto Butantan para vacina nacional de dose única.', 'verified', true, '2024-03-14', 'https://butantan.gov.br/noticias/vacina-dengue-butantan-brasileira', 'official_statement', 1, 'São Paulo', 'Anúncio vacina Butantan', 'nisia-butantan-dengue-b112-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende aumento do investimento em saúde básica e creches.', 'Investir em saúde das crianças é investir no futuro do país.', 'Pronunciamento em defesa de emenda sobre saúde infantil.', 'verified', false, '2023-10-18', 'https://www.camara.leg.br/noticias/tabata-amaral-saude-infantil', 'official_statement', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-saude-infantil-b112-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem acusa SUS de ser falido e defende seguro privado.', 'O SUS é um plano falido. O futuro é ter vouchers e concorrência privada.', 'Discurso na Câmara durante debate sobre planos de saúde.', 'verified', false, '2023-11-08', 'https://www.camara.leg.br/deputados/156190/biografia', 'official_statement', 4, 'Câmara dos Deputados', 'Debate plano de saúde', 'marcel-sus-falido-b112-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende SUS como maior política pública do Brasil.', 'O SUS é a maior política pública do mundo. Não há democracia sem saúde universal.', 'Discurso de tribuna em defesa do PNS e da PEC da Saúde.', 'verified', false, '2023-11-10', 'https://www.camara.leg.br/noticias/chico-alencar-sus-maior-politica', 'official_statement', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-sus-maior-politica-b112-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar, médico, defende mais financiamento federal ao SUS.', 'O Brasil gasta menos em saúde pública que a maioria dos países com sistema universal.', 'Discurso na CCJ do Senado sobre financiamento da saúde.', 'verified', false, '2023-12-05', 'https://www12.senado.leg.br/noticias/materias/2023/12/05/otto-alencar-financiamento-sus', 'official_statement', 1, 'Senado Federal', 'CCJ do Senado', 'otto-financiamento-sus-b112-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia comemora aprovação da Lei do Vacinômetro e transparência da vacinação.', 'Transparência é o antídoto da desinformação. Todo cidadão saberá as coberturas.', 'Sanção de lei que obriga divulgação pública de coberturas vacinais.', 'verified', false, '2024-07-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/julho/vacinometro-transparencia-lei', 'official_statement', 1, 'Brasília', 'Sanção Lei Vacinômetro', 'nisia-vacinometro-b112-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia comemora recuperação da cobertura da poliomielite acima de 90%.', 'Recuperamos a pólio acima de 90%. Só a vacina ergue o Brasil de novo.', 'Entrevista após divulgação da cobertura vacinal do PNI.', 'verified', false, '2024-09-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/setembro/cobertura-polio-recuperada-90', 'official_statement', 1, 'Brasília', 'Balanço vacinal PNI', 'nisia-polio-90-b112-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro afirma em entrevista que covid foi exagerado e CPI foi político.', 'A CPI da Covid foi uma farsa política. O número de mortes foi inflado.', 'Entrevista a canal de YouTube bolsonarista revisando pandemia.', 'verified', false, '2024-03-21', 'https://www.aosfatos.org/noticias/bolsonaro-entrevista-covid-inflado-falso/', 'interview', 5, 'Angra dos Reis, RJ', 'Entrevista a canal bolsonarista', 'bolsonaro-covid-inflado-b112-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_oma, 'Omar Aziz recorda CPI da Covid e cobra responsabilização.', 'As 700 mil mortes não vão ser esquecidas. A CPI mostrou tudo.', 'Entrevista ao Roda Viva reagindo às declarações revisionistas de Bolsonaro.', 'verified', false, '2024-03-25', 'https://www12.senado.leg.br/noticias/materias/2024/03/25/omar-aziz-cpi-covid-memoria', 'interview', 1, 'São Paulo', 'Entrevista Roda Viva', 'omar-cpi-memoria-b112-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues lembra que oposição sabotou vacinas no Brasil.', 'Quem duvidou da vacina em 2020 e 2021 tem sangue nas mãos. A história condena.', 'Pronunciamento no Senado no aniversário da CPI da Covid.', 'verified', false, '2024-04-27', 'https://www12.senado.leg.br/noticias/materias/2024/04/27/randolfe-cpi-aniversario', 'official_statement', 2, 'Senado Federal', 'Aniversário CPI Covid', 'randolfe-cpi-aniversario-b112-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende restrição total ao aborto legal em entrevista.', 'Não existe aborto legal. Toda vida é sagrada desde a concepção.', 'Entrevista a rádio evangélica em Brasília sobre projeto restritivo.', 'verified', false, '2024-04-30', 'https://www.bbc.com/portuguese/articles/damares-aborto-legal-restringir', 'interview', 3, 'Brasília', 'Entrevista rádio evangélica', 'damares-aborto-restringir-b112-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara protocola PL 1904 com pena maior para aborto que estupro.', 'Aborto tem que ter pena maior que estupro porque o inocente é a criança.', 'Defesa do PL 1904, da Gravidez do Estuprador, na tribuna da Câmara.', 'verified', true, '2024-06-11', 'https://www.camara.leg.br/propostas-legislativas/pl-1904-2024', 'official_statement', 5, 'Câmara dos Deputados', 'Defesa PL 1904', 'silas-pl-1904-b112-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira coloca PL 1904 em regime de urgência na Câmara.', 'Vou pautar. O Congresso é soberano para decidir sobre esse tema.', 'Anúncio em plenário sobre tramitação em urgência do PL 1904.', 'verified', true, '2024-06-12', 'https://www1.folha.uol.com.br/cotidiano/2024/06/lira-pl-1904-urgencia.shtml', 'official_statement', 5, 'Câmara dos Deputados', 'Urgência PL 1904', 'lira-pl-1904-urgencia-b112-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia condena PL 1904 chamando de crueldade contra meninas.', 'Obrigar uma menina a parir do estuprador é crueldade. O SUS vai garantir direitos.', 'Entrevista coletiva após urgência do PL na Câmara.', 'verified', true, '2024-06-13', 'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2024-06/nisia-pl-1904-crueldade', 'official_statement', 1, 'Brasília', 'Resposta PL 1904', 'nisia-pl-1904-crueldade-b112-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia PL 1904 como tortura contra meninas vítimas de estupro.', 'É tortura. É dar ao estuprador 10 anos e à vítima 20. Vergonha histórica.', 'Discurso viral no plenário da Câmara contra PL 1904.', 'verified', true, '2024-06-13', 'https://www.camara.leg.br/noticias/erika-hilton-pl-1904-tortura', 'official_statement', 1, 'Câmara dos Deputados', 'Discurso contra PL 1904', 'erika-pl-1904-tortura-b112-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim protesta contra PL 1904 em ato no Congresso.', 'Criança não é mãe. Estuprador não é pai. Este PL é um atentado à vida das meninas.', 'Discurso em ato feminista no Congresso contra PL 1904.', 'verified', true, '2024-06-13', 'https://www.camara.leg.br/noticias/samia-pl-1904-criança-mae', 'official_statement', 1, 'Câmara dos Deputados', 'Ato contra PL 1904', 'samia-pl-1904-crianca-mae-b112-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende PL 1904 afirmando que feto é vítima.', 'A vítima é o bebê. A mulher também é vítima, mas matar não é solução.', 'Fala em coletiva de bancada evangélica sobre PL 1904.', 'verified', false, '2024-06-14', 'https://www.camara.leg.br/deputados/74847/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Coletiva bancada evangélica', 'bia-pl-1904-defesa-b112-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves chama PL 1904 de retrocesso civilizatório.', 'O PL da Gravidez do Estuprador é um retrocesso civilizatório que envergonha o Brasil.', 'Coletiva do Ministério das Mulheres em Brasília.', 'verified', true, '2024-06-13', 'https://www.gov.br/mulheres/pt-br/assuntos/noticias/2024/cida-goncalves-pl-1904-retrocesso', 'official_statement', 1, 'Brasília', 'Coletiva do Ministério', 'cida-pl-1904-retrocesso-b112-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula classifica PL 1904 de insanidade e diz que vetará.', 'Isso é uma insanidade. Não aceito comparar estupro com aborto legal.', 'Entrevista em Brasília após manifestações pelo país.', 'verified', true, '2024-06-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-pl-1904-insanidade', 'official_statement', 2, 'Brasília', 'Entrevista coletiva', 'lula-pl-1904-insanidade-b112-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali acusa PL 1904 de ser estupro institucional.', 'Estuprar uma menina duas vezes: uma pelo criminoso, outra pelo Estado.', 'Discurso emocionado na Câmara durante obstrução.', 'verified', false, '2024-06-13', 'https://www.camara.leg.br/noticias/jandira-pl-1904-estupro-institucional', 'official_statement', 1, 'Câmara dos Deputados', 'Obstrução contra PL 1904', 'jandira-pl-1904-b112-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia acordo para produção de IFA de vacinas da gripe em Bio-Manguinhos.', 'Vamos produzir IFA no Brasil. Não podemos depender da China ou da Índia.', 'Anúncio em Bio-Manguinhos sobre fabricação nacional de insumos farmacêuticos.', 'verified', false, '2024-02-05', 'https://portal.fiocruz.br/noticia/2024/02/bio-manguinhos-ifa-producao-nacional', 'official_statement', 1, 'Rio de Janeiro', 'Anúncio CEIS Bio-Manguinhos', 'nisia-ifa-biomanguinhos-b112-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa coordena ação federal na dengue como Casa Civil.', 'O governo inteiro está mobilizado. Saúde, Defesa, Educação unidas contra a dengue.', 'Coletiva na Casa Civil anunciando plano integrado.', 'verified', false, '2024-02-02', 'https://www.gov.br/casacivil/pt-br/assuntos/noticias/2024/rui-costa-plano-dengue', 'official_statement', 1, 'Brasília', 'Plano integrado dengue', 'rui-dengue-casa-civil-b112-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal promove suposto tratamento natural para dengue em redes.', 'Dengue se cura com chá de folha e jejum. Sistema não quer que você saiba.', 'Vídeo em redes sociais durante pico de dengue.', 'verified', true, '2024-03-01', 'https://www.aosfatos.org/noticias/marcal-cha-dengue-desinformacao/', 'social_media_post', 5, 'São Paulo', 'Postagem em redes sociais', 'marcal-cha-dengue-b112-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia avalia impacto de enchentes no RS na saúde pública.', 'As enchentes do Rio Grande do Sul são emergência sanitária. Leptospirose, dengue, saúde mental.', 'Visita a Porto Alegre durante catástrofe climática.', 'verified', true, '2024-05-10', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/maio/ministra-da-saude-visita-rio-grande-do-sul', 'official_statement', 1, 'Porto Alegre', 'Visita às enchentes do RS', 'nisia-enchentes-rs-b112-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Alessandro Vieira cobra CPI das enchentes e falhas na saúde do RS.', 'Precisamos entender as falhas. Saúde, prevenção, tudo falhou no Rio Grande.', 'Discurso no Senado em meio ao desastre no RS.', 'verified', false, '2024-05-14', 'https://www12.senado.leg.br/noticias/materias/2024/05/14/alessandro-vieira-rs-falhas', 'official_statement', 1, 'Senado Federal', 'Pronunciamento enchentes RS', 'alessandro-rs-falhas-b112-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia anuncia novo balanço da dengue com mais de 6 milhões de casos.', 'Superamos 6 milhões de casos. Ninguém pode relaxar. É a maior epidemia da nossa história.', 'Coletiva em agosto revisando picos da epidemia.', 'verified', true, '2024-08-02', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/agosto/balanco-dengue-6-milhoes-casos', 'official_statement', 1, 'Brasília', 'Balanço epidemia dengue', 'nisia-6mi-casos-dengue-b112-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula revela descoberta de lesão cerebral e cirurgia de urgência.', 'Levei um tombo em casa. Graças a Deus e à equipe médica do SUS, estou aqui.', 'Declaração à imprensa após cirurgia por hemorragia intracraniana.', 'verified', true, '2024-12-10', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-cirurgia-hemorragia', 'official_statement', 1, 'Brasília', 'Recuperação cirurgia cerebral', 'lula-cirurgia-cerebral-b112-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro ironiza internação de Lula por problema cerebral.', 'Agora entendi muita coisa do governo. O cérebro do capitão estava vazando.', 'Postagem em redes sociais pouco após a cirurgia do presidente.', 'verified', true, '2024-12-11', 'https://www.metropoles.com/brasil/politica-br/flavio-bolsonaro-lula-cerebro', 'social_media_post', 3, 'Rio de Janeiro', 'Postagem em redes sociais', 'flavio-ironia-lula-cerebro-b112-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia uso político da cirurgia de Lula.', 'A extrema-direita comemora doença de presidente. Isso diz muito do caráter dessa gente.', 'Entrevista ao SBT após ataques bolsonaristas à saúde de Lula.', 'verified', false, '2024-12-12', 'https://noticias.uol.com.br/politica/2024/12/12/gleisi-ataques-saude-lula.htm', 'interview', 1, 'Brasília', 'Entrevista SBT', 'gleisi-ataques-saude-lula-b112-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende compra de vacinas para influenza pelo SUS em 2024.', 'A gripe volta todo ano. Precisamos vacinar para salvar idosos e crianças.', 'Coletiva sobre campanha de influenza 2024.', 'verified', false, '2024-03-22', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/marco/campanha-influenza-2024', 'official_statement', 1, 'Brasília', 'Campanha Influenza 2024', 'nisia-influenza-2024-b112-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha articula no Congresso contra PL 1904 como ministro de relações institucionais.', 'O governo trabalha para derrubar essa barbárie. O PL 1904 é intolerável.', 'Coletiva no Planalto sobre articulação parlamentar.', 'verified', false, '2024-06-14', 'https://agenciabrasil.ebc.com.br/politica/noticia/2024-06/padilha-pl-1904-articulacao', 'official_statement', 2, 'Brasília', 'Coletiva pós PL 1904', 'padilha-pl-1904-articula-b112-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apoia PL 1904 em vídeo de apoiadores.', 'A vida começa na concepção. Apoio os deputados que querem proteger o inocente.', 'Postagem em rede social apoiando o PL 1904.', 'verified', false, '2024-06-15', 'https://www.poder360.com.br/politica/bolsonaro-apoia-pl-1904/', 'social_media_post', 3, 'Angra dos Reis', 'Postagem em rede social', 'bolsonaro-apoia-pl-1904-b112-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta, então articulador, afirma que PL 1904 só voltará com consenso.', 'Não vou pautar sem acordo. Ponto. Ninguém ganha forçando.', 'Entrevista como vice-líder após recuo do PL 1904.', 'verified', false, '2024-06-17', 'https://www.camara.leg.br/noticias/hugo-motta-pl-1904-consenso', 'interview', 2, 'Brasília', 'Entrevista em Brasília', 'hugo-pl-1904-consenso-b112-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia defende atuação do SUS em saúde mental durante enchentes do RS.', 'A saúde mental dos gaúchos também está submersa. CAPS e apoio psicossocial em toda área atingida.', 'Visita a abrigo em Canoas durante enchentes.', 'verified', false, '2024-05-25', 'https://agenciabrasil.ebc.com.br/saude/noticia/2024-05/nisia-saude-mental-rs-enchentes', 'official_statement', 1, 'Canoas', 'Visita a abrigos RS', 'nisia-saude-mental-rs-b112-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares aciona STF contra portaria que amplia acesso a aborto legal.', 'Vou ao STF. Essa portaria é flexibilização ilegal do aborto.', 'Coletiva no Senado após portaria do Ministério da Saúde.', 'verified', false, '2024-09-20', 'https://www12.senado.leg.br/noticias/materias/2024/09/20/damares-stf-portaria-aborto', 'official_statement', 3, 'Senado Federal', 'Ação contra portaria', 'damares-stf-portaria-b112-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia lança Força Nacional do SUS para emergências.', 'Quando um estado for atingido, a Força Nacional do SUS estará lá em 48 horas.', 'Lançamento em Brasília com profissionais em uniforme.', 'verified', false, '2024-09-05', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/setembro/forca-nacional-sus-lancamento', 'official_statement', 1, 'Brasília', 'Lançamento Força Nacional SUS', 'nisia-forca-nacional-sus-b112-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro tem AVC e é transferido em UTI aérea.', 'Foi uma coisa repentina. Mas vou voltar em breve, estou sendo bem cuidado.', 'Declaração gravada de hospital após AVC isquêmico em abril de 2025.', 'verified', true, '2025-04-14', 'https://g1.globo.com/politica/noticia/2025/04/14/bolsonaro-avc-hospital.ghtml', 'official_statement', 1, 'Natal', 'Internação após AVC', 'bolsonaro-avc-2025-b112-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha assume Ministério da Saúde após saída de Nísia.', 'Recebo o SUS fortalecido por Nísia. Vou honrar esse legado.', 'Discurso de posse como ministro da Saúde em fevereiro de 2025.', 'verified', true, '2025-02-27', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/fevereiro/alexandre-padilha-toma-posse-ministro-saude', 'official_statement', 1, 'Brasília', 'Posse como ministro', 'padilha-posse-saude-b112-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia se despede do Ministério da Saúde defendendo legado.', 'Saio de coração pleno. O SUS está mais forte, vacinas voltaram, a saúde voltou a ser prioridade.', 'Discurso de despedida no Ministério da Saúde.', 'verified', true, '2025-02-27', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/fevereiro/discurso-despedida-ministra-nisia', 'official_statement', 1, 'Brasília', 'Despedida ministerial', 'nisia-despedida-b112-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia prioridades: vacinação, APS e Mais Médicos.', 'Minhas prioridades são vacinação, atenção primária e o Mais Médicos. Essa é a receita.', 'Entrevista coletiva na semana de posse.', 'verified', false, '2025-03-03', 'https://agenciabrasil.ebc.com.br/saude/noticia/2025-03/padilha-prioridades-saude', 'interview', 1, 'Brasília', 'Coletiva de posse', 'padilha-prioridades-b112-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia expansão do Mais Médicos para 28 mil profissionais.', 'Vamos chegar a 28 mil médicos em todo o Brasil. A atenção primária está de volta.', 'Anúncio em cerimônia no Planalto com Lula.', 'verified', false, '2025-03-18', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/marco/mais-medicos-28-mil-expansao', 'official_statement', 1, 'Brasília', 'Expansão Mais Médicos', 'padilha-28mil-mais-medicos-b112-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca novo ministro Padilha com acusações infundadas.', 'Padilha voltou para repetir o fracasso do Mais Médicos cubano. Vai dar ruim.', 'Postagem em redes sociais após nomeação do ministro.', 'verified', false, '2025-02-28', 'https://www.metropoles.com/brasil/politica-br/nikolas-padilha-ataque', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em redes sociais', 'nikolas-ataque-padilha-b112-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia novo centro de emergência para pandemias.', 'Vamos ter um centro nacional de preparação para pandemias. Aprender com a covid.', 'Cerimônia de lançamento com Fiocruz em Manguinhos.', 'verified', false, '2025-05-05', 'https://portal.fiocruz.br/noticia/2025/05/centro-nacional-preparacao-pandemias', 'official_statement', 1, 'Rio de Janeiro', 'Lançamento CNPP', 'padilha-cnpp-fiocruz-b112-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone defende aborto legal diante de nova tentativa do PL 1904.', 'Não vamos recuar. Meninas vítimas de estupro têm direito à vida e dignidade.', 'Discurso em plenário durante obstrução em 2025.', 'verified', false, '2025-05-12', 'https://www.camara.leg.br/noticias/taliria-aborto-legal-pl-1904-2025', 'official_statement', 1, 'Câmara dos Deputados', 'Obstrução 2025', 'taliria-aborto-2025-b112-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha defende cooperação técnica de Cuba no Mais Médicos.', 'A cooperação com Cuba deu certo. Não há por que demonizar o que salva vidas.', 'Entrevista a TV Globo sobre história do programa.', 'verified', false, '2025-06-02', 'https://g1.globo.com/saude/noticia/2025/06/02/padilha-mais-medicos-cuba.ghtml', 'interview', 1, 'Rio de Janeiro', 'Entrevista TV Globo', 'padilha-cuba-b112-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem chama cooperação cubana de esquema ideológico.', 'O Mais Médicos com Cuba é esquema ideológico. Venderam brasileiros para Havana.', 'Discurso na Câmara repercutindo ministro Padilha.', 'verified', false, '2025-06-05', 'https://www.camara.leg.br/deputados/156190/biografia', 'official_statement', 3, 'Câmara dos Deputados', 'Sessão sobre Mais Médicos', 'marcel-mais-medicos-cuba-b112-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha divulga queda de 70% nos casos de dengue em 2025.', 'Caiu 70% os casos de dengue. O SUS funcionou. A vacina funcionou.', 'Coletiva de imprensa em maio de 2025 sobre balanço epidemiológico.', 'verified', true, '2025-05-20', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/maio/dengue-cai-70-por-cento-2025', 'official_statement', 1, 'Brasília', 'Balanço dengue 2025', 'padilha-dengue-cai-70-b112-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia recuperação plena da cobertura vacinal infantil.', 'Recuperamos a cobertura infantil. Estamos onde estávamos antes de Bolsonaro.', 'Coletiva sobre balanço PNI em 2025.', 'verified', true, '2025-08-07', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/agosto/cobertura-vacinal-recuperada-pni', 'official_statement', 1, 'Brasília', 'Balanço PNI 2025', 'padilha-pni-recuperado-b112-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton celebra ampliação de hormonioterapia trans no SUS.', 'Ter hormônio pelo SUS não é privilégio, é dignidade. Seguimos avançando.', 'Entrevista ao Brasil de Fato sobre política trans no SUS.', 'verified', false, '2025-06-28', 'https://www.brasildefato.com.br/2025/06/28/erika-hilton-hormonioterapia-sus', 'interview', 1, 'Brasília', 'Entrevista Brasil de Fato', 'erika-hormonio-sus-b112-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca hormonioterapia trans como desperdício do SUS.', 'Tem criança morrendo sem atendimento e o governo paga hormônio para homem virar mulher.', 'Discurso no Senado em sessão sobre portaria do SUS.', 'verified', false, '2025-07-01', 'https://www12.senado.leg.br/noticias/materias/2025/07/01/magno-malta-sus-trans', 'official_statement', 4, 'Senado Federal', 'Sessão Senado', 'magno-sus-trans-b112-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate Magno Malta em defesa de população trans.', 'O SUS não escolhe cidadão. O SUS atende. Pessoas trans são cidadãos como qualquer outro.', 'Entrevista coletiva respondendo a ataques no Senado.', 'verified', false, '2025-07-02', 'https://agenciabrasil.ebc.com.br/saude/noticia/2025-07/padilha-rebate-magno-malta', 'official_statement', 1, 'Brasília', 'Coletiva de imprensa', 'padilha-rebate-magno-b112-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva alerta sobre impactos da crise climática na saúde pública.', 'Mudança climática é a maior crise sanitária do século. Arboviroses vão explodir.', 'Conferência em Belém sobre saúde e clima pré-COP30.', 'verified', false, '2025-10-20', 'https://www.gov.br/mma/pt-br/assuntos/noticias/2025/outubro/marina-silva-saude-clima-cop30', 'official_statement', 1, 'Belém', 'Pré-COP30 saúde e clima', 'marina-saude-clima-b112-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia aprovação e compra da vacina nacional de dengue do Butantan.', 'A vacina brasileira de dengue é realidade. SUS terá dose nacional em 2026.', 'Anúncio em São Paulo após aprovação da Anvisa.', 'verified', true, '2025-12-03', 'https://butantan.gov.br/noticias/vacina-dengue-butantan-aprovada-anvisa', 'official_statement', 1, 'São Paulo', 'Aprovação vacina Butantan', 'padilha-butantan-aprovada-b112-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
