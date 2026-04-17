-- Batch 133: PT-government vs opposition daily combat (continuation, 2023-2026)
DO $$
DECLARE
  v_gle UUID; v_had UUID; v_lul UUID; v_alc UUID; v_pad UUID;
  v_rui UUID; v_sil UUID; v_cid UUID; v_ani UUID; v_son UUID;
  v_mar UUID; v_lew UUID; v_mes UUID; v_wel UUID; v_lmr UUID;
  v_teb UUID; v_lup UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_nik UUID; v_zam UUID; v_kic UUID; v_fel UUID;
  v_dam UUID; v_mag UUID; v_mou UUID; v_van UUID; v_kim UUID;
  v_avn UUID; v_eri UUID; v_sam UUID; v_tal UUID; v_fmn UUID;
  v_tab UUID; v_jan UUID; v_bou UUID; v_cir UUID; v_mor UUID;
  v_pab UUID; v_tar UUID; v_zem UUID; v_cai UUID;
  c_des UUID; c_odi UUID; c_int UUID; c_abu UUID; c_con UUID;
  c_mac UUID; c_mis UUID; c_hom UUID; c_rac UUID; c_xen UUID;
  c_ame UUID; c_ant UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_wel FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_lmr FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'carlos-lupi';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_avn FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fmn FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas acusa Lula de "entregar o Brasil" para China em acordos.', 'Lula está entregando o Brasil para a China, é um traidor da pátria.', 'Postagem em rede social após viagem de Lula a Pequim.', 'verified', true, '2025-01-15', 'https://www.metropoles.com/brasil/politica-br/nikolas-lula-china-entrega', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'nikolas-lula-china-entrega-b133-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca bolsonaristas como "fascistas de farda e terno".', 'Essa turma é fascista, gente de farda e terno que quer golpe.', 'Discurso em comício do PT em Recife sobre tentativa de golpe.', 'verified', true, '2025-02-22', 'https://www1.folha.uol.com.br/poder/2025/02/lula-fascistas-farda-terno.shtml', 'news_article', 3, 'Recife', 'Comício PT', 'lula-fascistas-farda-terno-b133-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ataca Alexandre de Moraes chamando-o de "ditador de toga".', 'Alexandre de Moraes é um ditador de toga, o STF virou tribunal de exceção.', 'Live no Instagram após nova decisão do ministro contra bolsonaristas.', 'verified', true, '2023-08-15', 'https://www.cnnbrasil.com.br/politica/zambelli-moraes-ditador-toga/', 'social_media_post', 4, 'São Paulo', 'Live Instagram', 'zambelli-moraes-ditador-toga-b133-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi chama Tarcísio de "poste de Bolsonaro" em SP.', 'Tarcísio é poste do Bolsonaro, não tem projeto próprio para São Paulo.', 'Entrevista ao UOL criticando atuação do governador de SP.', 'verified', false, '2023-09-20', 'https://noticias.uol.com.br/politica/2023/09/20/gleisi-tarcisio-poste-bolsonaro.htm', 'news_article', 2, 'São Paulo', 'Entrevista UOL', 'gleisi-tarcisio-poste-b133-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano ataca Silvio Almeida com insinuações homofóbicas.', 'Esse ministro dos Direitos Humanos tem pautas estranhas, não é normal.', 'Discurso em culto evangélico em São Paulo atacando o ministro.', 'verified', false, '2023-10-08', 'https://www.poder360.com.br/congresso/feliciano-silvio-almeida-ataque/', 'news_article', 4, 'São Paulo', 'Culto evangélico', 'feliciano-silvio-homofobia-b133-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida rebate Feliciano denunciando "discurso de ódio".', 'O pastor Feliciano usa o púlpito para espalhar discurso de ódio.', 'Coletiva no MDH em resposta aos ataques do deputado.', 'verified', false, '2023-10-09', 'https://g1.globo.com/politica/noticia/2023/10/09/silvio-almeida-feliciano-odio.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MDH', 'silvio-feliciano-odio-b133-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Lula de "ladrão" em comício em Minas.', 'Lula é ladrão, foi condenado, vai voltar pra cadeia cedo ou tarde.', 'Discurso em comício de apoio a candidatos do PL em BH.', 'verified', true, '2023-11-12', 'https://www.metropoles.com/brasil/politica-br/bolsonaro-lula-ladrao-bh', 'news_article', 3, 'Belo Horizonte', 'Comício PL', 'bolsonaro-lula-ladrao-bh-b133-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad chama oposição de "terraplanista econômica" em evento.', 'A oposição virou terraplanista econômica, nega dados da realidade.', 'Evento com economistas em São Paulo sobre arcabouço fiscal.', 'verified', false, '2023-11-28', 'https://www1.folha.uol.com.br/mercado/2023/11/haddad-terraplanista-economica.shtml', 'news_article', 2, 'São Paulo', 'Evento economistas', 'haddad-terraplanista-economica-b133-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri chama governo Lula de "incompetente histórico".', 'Esse governo é a incompetência histórica personificada, quebra tudo que toca.', 'Discurso em plenário sobre relatório de contas do governo.', 'verified', false, '2023-12-05', 'https://www.cnnbrasil.com.br/politica/kim-lula-incompetente-historico/', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'kim-lula-incompetente-b133-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha acusa centrão de "chantagem institucional" contra governo.', 'O centrão faz chantagem institucional por cargos e emendas.', 'Declaração em coletiva após derrota em votação no Congresso.', 'verified', false, '2024-01-18', 'https://noticias.uol.com.br/politica/2024/01/18/padilha-centrao-chantagem.htm', 'news_article', 2, 'Brasília', 'Coletiva Planalto', 'padilha-centrao-chantagem-b133-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama Lula de "perseguidor político" em evento em MG.', 'Lula é perseguidor político, usa Receita e PF contra opositores.', 'Discurso em evento do Novo em Belo Horizonte.', 'verified', false, '2024-02-08', 'https://g1.globo.com/mg/minas-gerais/noticia/2024/02/08/zema-lula-perseguidor-politico.ghtml', 'news_article', 3, 'Belo Horizonte', 'Evento Novo', 'zema-lula-perseguidor-b133-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia transfobia após fala de Nikolas no plenário.', 'Nikolas usa a tribuna para espalhar transfobia criminosa.', 'Pronunciamento em resposta a discurso anti-trans de Nikolas.', 'verified', true, '2024-03-08', 'https://www1.folha.uol.com.br/cotidiano/2024/03/erika-nikolas-transfobia-plenario.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'erika-nikolas-transfobia-b133-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca pauta LGBTQIA+ chamando de "ideologia maligna".', 'Essa ideologia LGBT é maligna, quer destruir a família tradicional brasileira.', 'Discurso em culto evangélico em Brasília.', 'verified', false, '2024-03-20', 'https://www.poder360.com.br/congresso/damares-lgbt-ideologia-maligna/', 'news_article', 4, 'Brasília', 'Culto evangélico', 'damares-lgbt-maligna-b133-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia Damares por "discurso de ódio contra mulheres".', 'Damares faz discurso de ódio contra mulheres que não seguem seu padrão.', 'Coletiva do Ministério das Mulheres em resposta à Damares.', 'verified', false, '2024-03-21', 'https://g1.globo.com/politica/noticia/2024/03/21/cida-damares-odio-mulheres.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MMulheres', 'cida-damares-odio-b133-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro diz que Lula "mente descaradamente" sobre Lava Jato.', 'Lula mente descaradamente sobre Lava Jato, ele foi sim condenado.', 'Entrevista em SP como senador em evento do Podemos.', 'verified', false, '2024-04-12', 'https://noticias.uol.com.br/politica/2024/04/12/moro-lula-mente-lava-jato.htm', 'news_article', 2, 'São Paulo', 'Evento Podemos', 'moro-lula-mente-lava-jato-b133-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal chama Boulos de "invasor comunista" em debate.', 'Boulos é invasor de terra, comunista que quer destruir propriedade privada.', 'Debate eleitoral para Prefeitura de SP no SBT.', 'verified', true, '2024-08-08', 'https://www.cnnbrasil.com.br/politica/pablo-boulos-invasor-comunista-debate/', 'news_article', 4, 'São Paulo', 'Debate SBT', 'pablo-boulos-invasor-debate-b133-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos responde Marçal chamando-o de "coach golpista" em debate.', 'Você é coach golpista, vive de vender fumaça e atacar democracia.', 'Debate eleitoral para Prefeitura de SP no SBT.', 'verified', true, '2024-08-08', 'https://www1.folha.uol.com.br/poder/2024/08/boulos-marcal-coach-golpista.shtml', 'news_article', 3, 'São Paulo', 'Debate SBT', 'boulos-marcal-coach-golpista-b133-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro acusa Moraes de "perseguição à família".', 'Moraes persegue minha família, é uma vingança pessoal travestida de lei.', 'Entrevista no Senado sobre decisões do STF contra seus parentes.', 'verified', false, '2024-05-18', 'https://www.metropoles.com/brasil/politica-br/flavio-moraes-perseguicao-familia', 'news_article', 3, 'Senado Federal', 'Coletiva Senado', 'flavio-moraes-perseguicao-b133-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral critica "radicalização" de Lula e Bolsonaro em debate.', 'Lula e Bolsonaro radicalizam o país, precisamos de uma terceira via séria.', 'Debate promovido pelo PSB em São Paulo sobre eleições 2026.', 'verified', false, '2025-03-10', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/03/10/tabata-radicalizacao-lula-bolsonaro.ghtml', 'news_article', 1, 'São Paulo', 'Debate PSB', 'tabata-radicalizacao-b133-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama movimento LGBTQIA+ de "praga moderna" em culto.', 'Essa praga LGBT é coisa do demônio, Brasil é cristão e tem família de verdade.', 'Pregação em igreja em Vitória-ES.', 'verified', false, '2023-09-03', 'https://noticias.uol.com.br/politica/2023/09/03/magno-malta-lgbt-praga.htm', 'news_article', 5, 'Vitória', 'Culto evangélico', 'magno-malta-lgbt-praga-b133-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Melchionna denuncia PL como "partido da LGBTfobia" no plenário.', 'O PL é o partido da LGBTfobia, alimenta violência contra nossas vidas.', 'Discurso em plenário após ataques de bolsonaristas a drag queens.', 'verified', false, '2023-10-25', 'https://www.poder360.com.br/congresso/melchionna-pl-lgbtfobia/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-pl-lgbtfobia-b133-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que "Brasil precisa de Bukele" para solução.', 'Brasil precisa de um Bukele brasileiro para resolver a segurança.', 'Postagem em rede social elogiando presidente salvadorenho.', 'verified', true, '2024-06-14', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-bukele-brasil/', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'eduardo-bukele-brasil-b133-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama bolsonaristas de "insanos que querem golpe".', 'Esses bolsonaristas são insanos que sonham com golpe, não aceitam perder.', 'Entrevista exclusiva à Band TV em Brasília.', 'verified', true, '2024-07-05', 'https://www1.folha.uol.com.br/poder/2024/07/lula-bolsonaristas-insanos-golpe.shtml', 'news_article', 3, 'Brasília', 'Entrevista Band', 'lula-bolsonaristas-insanos-b133-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis convoca "protesto pacífico" contra STF em Brasília.', 'Brasileiros, às ruas pacificamente contra a ditadura do STF!', 'Postagem em rede social conclamando manifestação em Brasília.', 'verified', false, '2023-11-02', 'https://g1.globo.com/politica/noticia/2023/11/02/kicis-protesto-stf.ghtml', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'kicis-protesto-stf-b133-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio acusa Lula de "usar Receita contra empresários".', 'Lula usa a Receita Federal como arma política contra empresários.', 'Discurso em evento da FIESP em São Paulo.', 'verified', false, '2024-09-22', 'https://www.metropoles.com/brasil/politica-br/tarcisio-lula-receita-empresarios', 'news_article', 3, 'São Paulo', 'Evento FIESP', 'tarcisio-lula-receita-empresarios-b133-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia "racismo estrutural na imprensa brasileira".', 'Imprensa brasileira reproduz racismo estrutural contra mulheres negras.', 'Palestra em seminário sobre mídia e racismo na Bahia.', 'verified', false, '2024-05-08', 'https://noticias.uol.com.br/politica/2024/05/08/anielle-racismo-imprensa.htm', 'news_article', 2, 'Salvador', 'Seminário mídia', 'anielle-racismo-imprensa-b133-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem chama Lula de "chavista travestido de democrata".', 'Lula é chavista travestido de democrata, quer copiar a Venezuela.', 'Discurso em plenário sobre política externa do governo.', 'verified', false, '2024-10-14', 'https://www.poder360.com.br/congresso/van-hattem-lula-chavista/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-lula-chavista-b133-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet rebate oposição por "falta de projeto" para Brasil.', 'Oposição bolsonarista só tem ataque, não tem projeto nenhum para o Brasil.', 'Entrevista no Planalto como ministra do Planejamento.', 'verified', false, '2024-11-08', 'https://g1.globo.com/politica/noticia/2024/11/08/tebet-oposicao-sem-projeto.ghtml', 'news_article', 1, 'Brasília', 'Coletiva Planejamento', 'tebet-oposicao-sem-projeto-b133-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avn, 'Adriana Ventura acusa Haddad de "espoliação tributária" contra produtivos.', 'Haddad faz espoliação tributária, penaliza quem produz e trabalha.', 'Discurso em plenário durante votação de reforma tributária.', 'verified', false, '2024-12-03', 'https://www1.folha.uol.com.br/mercado/2024/12/ventura-haddad-espoliacao.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'ventura-haddad-espoliacao-b133-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Pablo Marçal de "picareta que vende vento".', 'Esse Marçal é um picareta que vende vento, coach de golpe.', 'Entrevista a jornalistas em viagem presidencial ao Nordeste.', 'verified', true, '2024-09-02', 'https://www.cnnbrasil.com.br/politica/lula-marcal-picareta/', 'news_article', 3, 'Recife', 'Entrevista coletiva', 'lula-marcal-picareta-b133-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal chama Lula de "ex-presidiário" em palestra motivacional.', 'O ex-presidiário Lula não tem moral nenhuma para falar de ética.', 'Palestra motivacional cobrada em São Paulo.', 'verified', false, '2024-03-15', 'https://noticias.uol.com.br/politica/2024/03/15/marcal-lula-ex-presidiario.htm', 'news_article', 3, 'São Paulo', 'Palestra paga', 'marcal-lula-ex-presidiario-b133-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones expõe mensagens vazadas de Nikolas em vídeo polêmico.', 'Olha o Nikolas se comunicando com bolsonaristas golpistas!', 'Vídeo no TikTok expondo supostas mensagens privadas do deputado.', 'verified', false, '2024-08-18', 'https://www.metropoles.com/brasil/politica-br/janones-nikolas-mensagens-vazadas', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'janones-nikolas-mensagens-b133-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin rebate Tarcísio chamando-o de "desleal ao Brasil".', 'Tarcísio é desleal ao Brasil, torce pelo fracasso do próprio país.', 'Entrevista após visita oficial a complexo industrial em SP.', 'verified', false, '2024-06-25', 'https://g1.globo.com/politica/noticia/2024/06/25/alckmin-tarcisio-desleal.ghtml', 'news_article', 2, 'São Paulo', 'Visita oficial', 'alckmin-tarcisio-desleal-b133-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão chama ministros do STF de "ativistas togados".', 'Alguns ministros do STF viraram ativistas togados, legislando pela toga.', 'Discurso no Senado sobre decisões do Supremo.', 'verified', false, '2024-04-08', 'https://www.poder360.com.br/congresso/mourao-stf-ativistas-togados/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'mourao-stf-ativistas-b133-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia Magno Malta por "terrorismo religioso".', 'Magno Malta faz terrorismo religioso, inflama ódio contra LGBT.', 'Pronunciamento em plenário após vídeo de pregação de Malta.', 'verified', false, '2023-09-10', 'https://www1.folha.uol.com.br/poder/2023/09/samia-magno-terrorismo-religioso.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'samia-magno-terrorismo-b133-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro acusa STF de "terrorismo judicial" em tweets.', 'STF pratica terrorismo judicial contra a direita brasileira.', 'Sequência de tweets na conta pessoal do vereador.', 'verified', false, '2024-05-02', 'https://noticias.uol.com.br/politica/2024/05/02/carlos-stf-terrorismo-judicial.htm', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-stf-terrorismo-judicial-b133-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa acusa oposição de "boicote antipatriótico" ao governo.', 'A oposição faz boicote antipatriótico, torce contra o país.', 'Coletiva na Casa Civil sobre Orçamento 2025.', 'verified', false, '2024-10-02', 'https://g1.globo.com/politica/noticia/2024/10/02/rui-costa-oposicao-boicote.ghtml', 'news_article', 2, 'Brasília', 'Coletiva Casa Civil', 'rui-oposicao-boicote-b133-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama Marina Silva de "ministra do atraso" em debate.', 'Marina Silva é a ministra do atraso, trava desenvolvimento brasileiro.', 'Discurso em plenário sobre marco regulatório ambiental.', 'verified', false, '2024-05-28', 'https://www.cnnbrasil.com.br/politica/nikolas-marina-ministra-atraso/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-marina-atraso-b133-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate Nikolas chamando-o de "negacionista climático".', 'Nikolas é negacionista climático, não quer ver o mundo em chamas.', 'Coletiva no MMA em resposta ao deputado bolsonarista.', 'verified', false, '2024-05-29', 'https://www1.folha.uol.com.br/ambiente/2024/05/marina-nikolas-negacionista.shtml', 'news_article', 2, 'Brasília', 'Coletiva MMA', 'marina-nikolas-negacionista-b133-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes chama Haddad de "medíocre da Fazenda" em entrevista.', 'Haddad é o medíocre da Fazenda, não entende nada de economia.', 'Entrevista em podcast político crítico ao governo.', 'verified', false, '2024-06-18', 'https://www.metropoles.com/brasil/politica-br/ciro-haddad-mediocre-fazenda', 'news_article', 3, 'Fortaleza', 'Entrevista podcast', 'ciro-haddad-mediocre-b133-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa Bolsonaro de "comandar milícia digital" contra governo.', 'Bolsonaro comanda milícia digital que ataca governo 24 horas.', 'Entrevista ao GloboNews sobre fake news políticas.', 'verified', true, '2024-07-22', 'https://g1.globo.com/politica/noticia/2024/07/22/gleisi-bolsonaro-milicia-digital.ghtml', 'news_article', 3, 'Brasília', 'Entrevista GloboNews', 'gleisi-bolsonaro-milicia-digital-b133-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama governo Lula de "narcoditadura".', 'Lula monta narcoditadura no Brasil, faz acordos com ditaduras.', 'Discurso no plenário sobre política externa.', 'verified', false, '2024-08-28', 'https://www.poder360.com.br/congresso/eduardo-lula-narcoditadura/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'eduardo-lula-narcoditadura-b133-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lmr, 'Luiz Marinho acusa empresários de "sabotagem ao emprego".', 'Alguns empresários bolsonaristas fazem sabotagem contra gerar emprego.', 'Entrevista ao Valor Econômico sobre relações sindicais.', 'verified', false, '2024-11-12', 'https://noticias.uol.com.br/politica/2024/11/12/marinho-empresarios-sabotagem.htm', 'news_article', 2, 'Brasília', 'Entrevista Valor', 'marinho-empresarios-sabotagem-b133-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro convoca motociata contra STF chamando-o de "ditadura".', 'Vamos à motociata pacífica, o STF virou ditadura no Brasil!', 'Postagem em rede social convocando motociatas nacionais.', 'verified', true, '2024-09-07', 'https://www.cnnbrasil.com.br/politica/bolsonaro-motociata-stf-ditadura/', 'social_media_post', 4, 'São Paulo', 'Postagem em rede social', 'bolsonaro-motociata-stf-b133-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski rebate oposição por "ataques à PF" sobre investigações.', 'Bolsonaristas atacam PF porque a PF está fazendo seu trabalho.', 'Coletiva no Ministério da Justiça sobre operações da PF.', 'verified', false, '2024-03-28', 'https://www1.folha.uol.com.br/poder/2024/03/lewandowski-bolsonaristas-pf.shtml', 'news_article', 2, 'Brasília', 'Coletiva MJ', 'lewandowski-bolsonaristas-pf-b133-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ataca Janja chamando-a de "rainha do marketing pessoal".', 'A Janja virou rainha do marketing pessoal em viagens oficiais.', 'Postagem em rede social criticando primeira-dama.', 'verified', false, '2023-12-18', 'https://www.metropoles.com/brasil/politica-br/zambelli-janja-rainha-marketing', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'zambelli-janja-marketing-b133-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria denuncia Zambelli por "misoginia contra Janja".', 'Zambelli faz ataques machistas à Janja, a misoginia define a direita.', 'Pronunciamento em plenário em defesa da primeira-dama.', 'verified', false, '2023-12-19', 'https://g1.globo.com/politica/noticia/2023/12/19/taliria-zambelli-misoginia-janja.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'taliria-zambelli-misoginia-b133-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias rebate oposição sobre polêmica de ministros indicados.', 'Oposição ataca a AGU de forma desonesta para criar crise falsa.', 'Coletiva de imprensa na AGU em Brasília.', 'verified', false, '2024-02-28', 'https://noticias.uol.com.br/politica/2024/02/28/messias-oposicao-agu-desonesta.htm', 'news_article', 1, 'Brasília', 'Coletiva AGU', 'messias-oposicao-agu-b133-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano diz que "comunismo vai acabar com família brasileira".', 'Esse comunismo do Lula vai acabar com a família cristã brasileira.', 'Pregação em culto evangélico transmitido online.', 'verified', false, '2024-01-21', 'https://www.poder360.com.br/congresso/feliciano-comunismo-familia/', 'news_article', 3, 'São Paulo', 'Culto evangélico', 'feliciano-comunismo-familia-b133-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos chama direita paulista de "elite escravocrata reciclada".', 'A direita paulista é filha da elite escravocrata reciclada.', 'Discurso em ato do MTST na Paulista.', 'verified', false, '2024-04-25', 'https://www1.folha.uol.com.br/cotidiano/2024/04/boulos-direita-paulista-escravocrata.shtml', 'news_article', 3, 'São Paulo', 'Ato MTST', 'boulos-direita-escravocrata-b133-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado ataca governo federal por "ignorar segurança pública".', 'Governo Lula ignora segurança pública, vive protegendo bandido.', 'Evento em Goiânia com lideranças policiais.', 'verified', false, '2024-02-14', 'https://g1.globo.com/go/goias/noticia/2024/02/14/caiado-lula-ignora-seguranca.ghtml', 'news_article', 2, 'Goiânia', 'Evento polícia', 'caiado-lula-ignora-seguranca-b133-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wel, 'Wellington Dias chama oposição de "atraso histórico ao Nordeste".', 'Essa oposição bolsonarista quer travar progresso do Nordeste.', 'Entrevista no MDS sobre programas sociais regionais.', 'verified', false, '2024-06-20', 'https://noticias.uol.com.br/politica/2024/06/20/wellington-oposicao-atraso-nordeste.htm', 'news_article', 1, 'Brasília', 'Coletiva MDS', 'wellington-oposicao-atraso-b133-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas usa tribuna para zombar de ministra Cida Gonçalves.', 'Essa ministra das Mulheres só sabe falar de gênero, não resolve nada.', 'Discurso em plenário atacando agenda do governo.', 'verified', false, '2024-03-08', 'https://www.cnnbrasil.com.br/politica/nikolas-cida-ministra-mulheres-ataque/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-cida-ministra-ataque-b133-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que "STF persegue conservadores" em discurso.', 'O STF persegue sistematicamente conservadores e evangélicos.', 'Discurso no Senado após decisões do STF.', 'verified', false, '2024-04-22', 'https://www.metropoles.com/brasil/politica-br/damares-stf-persegue-conservadores', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'damares-stf-persegue-b133-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Zema de "governador insensato" em evento em BH.', 'Zema é insensato, um governador que não cuida da saúde e educação.', 'Anúncio de obras federais em Minas Gerais.', 'verified', false, '2024-08-05', 'https://g1.globo.com/mg/minas-gerais/noticia/2024/08/05/lula-zema-insensato.ghtml', 'news_article', 2, 'Belo Horizonte', 'Evento obras', 'lula-zema-insensato-b133-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama Lula de "invejoso do sucesso mineiro".', 'Lula tem inveja do sucesso mineiro, quer sabotar nosso trabalho.', 'Entrevista em evento do Novo em Belo Horizonte.', 'verified', false, '2024-08-06', 'https://www1.folha.uol.com.br/poder/2024/08/zema-lula-inveja-mineiro.shtml', 'news_article', 2, 'Belo Horizonte', 'Evento Novo', 'zema-lula-invejoso-b133-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton faz discurso emocionado contra LGBTfobia no plenário.', 'Estão matando pessoas trans todo dia enquanto vocês fazem piada aqui!', 'Discurso em plenário com ataque de bolsonaristas.', 'verified', true, '2024-05-17', 'https://noticias.uol.com.br/politica/2024/05/17/erika-lgbtfobia-plenario-emocionado.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'erika-lgbtfobia-plenario-b133-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri ataca governo por "espantar investidores estrangeiros".', 'Governo Lula espanta investidor estrangeiro com esquerdismo infantil.', 'Entrevista em evento de mercado financeiro em SP.', 'verified', false, '2024-10-30', 'https://www.poder360.com.br/economia/kim-lula-espanta-investidores/', 'news_article', 2, 'São Paulo', 'Evento mercado', 'kim-lula-espanta-investidores-b133-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad chama Kim Kataguiri de "papagaio neoliberal".', 'Kim virou papagaio neoliberal, repete clichês sem entender economia.', 'Entrevista após evento em Brasília.', 'verified', false, '2024-10-31', 'https://g1.globo.com/politica/noticia/2024/10/31/haddad-kim-papagaio.ghtml', 'news_article', 2, 'Brasília', 'Entrevista Fazenda', 'haddad-kim-papagaio-b133-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa Valdemar Costa Neto de "chefe de quadrilha".', 'Valdemar é chefe de quadrilha golpista, comanda a milícia digital do PL.', 'Entrevista à CartaCapital sobre investigações golpistas.', 'verified', true, '2025-01-28', 'https://www.metropoles.com/brasil/politica-br/gleisi-valdemar-chefe-quadrilha', 'news_article', 3, 'Brasília', 'Entrevista Carta', 'gleisi-valdemar-quadrilha-b133-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio chama Lula de "chefe do crime organizado institucional".', 'Lula comanda o crime organizado institucional através de aparelhamento.', 'Entrevista a emissora bolsonarista em São Paulo.', 'verified', false, '2025-02-18', 'https://noticias.uol.com.br/politica/2025/02/18/tarcisio-lula-crime-organizado.htm', 'news_article', 4, 'São Paulo', 'Entrevista TV', 'tarcisio-lula-crime-institucional-b133-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones detona PL como "partido da milícia fardada" em vídeo viral.', 'O PL virou partido da milícia fardada, se não é bandido é cúmplice!', 'Vídeo no TikTok com mais de 20 milhões de views.', 'verified', true, '2025-03-05', 'https://www.cnnbrasil.com.br/politica/janones-pl-milicia-fardada/', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'janones-pl-milicia-fardada-b133-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Fernanda Melchionna denuncia "projeto fascista do PL brasileiro".', 'O PL executa projeto fascista, ataca imprensa, STF e minorias.', 'Pronunciamento em plenário após investigação golpista.', 'verified', false, '2024-11-25', 'https://www1.folha.uol.com.br/poder/2024/11/melchionna-pl-projeto-fascista.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-pl-fascista-b133-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão acusa Moraes de "exceder prerrogativas constitucionais".', 'Moraes excede prerrogativas sistematicamente, precisa de impeachment.', 'Discurso no Senado defendendo impeachment do ministro.', 'verified', false, '2024-07-08', 'https://g1.globo.com/politica/noticia/2024/07/08/mourao-moraes-excede-prerrogativas.ghtml', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'mourao-moraes-exceder-b133-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva acusa ruralistas de "boicote ambiental ao governo".', 'Bancada ruralista faz boicote ambiental para servir desmatadores.', 'Coletiva no MMA sobre Amazônia e COP30.', 'verified', false, '2025-02-12', 'https://www.metropoles.com/brasil/politica-br/marina-ruralistas-boicote-ambiental', 'news_article', 2, 'Brasília', 'Coletiva MMA', 'marina-ruralistas-boicote-b133-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia bancada ruralista por "etnocídio legal".', 'A bancada ruralista promove etnocídio legal, quer extinguir povos indígenas.', 'Ato em defesa de terras indígenas em Brasília.', 'verified', true, '2024-08-15', 'https://noticias.uol.com.br/politica/2024/08/15/sonia-ruralistas-etnocidio.htm', 'news_article', 3, 'Brasília', 'Ato público', 'sonia-ruralistas-etnocidio-b133-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avn, 'Adriana Ventura acusa Lula de "centralismo bolivariano".', 'Lula quer centralismo bolivariano, concentrar tudo no Planalto.', 'Debate em evento do Novo sobre reforma tributária.', 'verified', false, '2025-01-20', 'https://www.poder360.com.br/congresso/ventura-lula-centralismo-bolivariano/', 'news_article', 2, 'São Paulo', 'Evento Novo', 'ventura-lula-bolivariano-b133-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha acusa PL de "terra arrasada legislativa" contra governo.', 'O PL faz política de terra arrasada, obstrui tudo que vem do Planalto.', 'Coletiva na Secretaria de Relações Institucionais.', 'verified', false, '2025-02-25', 'https://g1.globo.com/politica/noticia/2025/02/25/padilha-pl-terra-arrasada.ghtml', 'news_article', 2, 'Brasília', 'Coletiva SRI', 'padilha-pl-terra-arrasada-b133-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli convoca apoiadores contra STF em live inflamada.', 'Bolsonaristas, vamos resistir, o STF quer prender o capitão!', 'Live no Telegram para milhares de apoiadores.', 'verified', false, '2023-10-12', 'https://www.cnnbrasil.com.br/politica/zambelli-resistir-stf-capitao/', 'social_media_post', 4, 'São Paulo', 'Live Telegram', 'zambelli-resistir-stf-capitao-b133-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos chama Nunes de "prefeito fantasma de SP" em ato.', 'Nunes é prefeito fantasma, SP está abandonada pelo bolsonarismo.', 'Ato de campanha em bairro periférico da zona leste.', 'verified', false, '2024-09-28', 'https://www1.folha.uol.com.br/cotidiano/2024/09/boulos-nunes-fantasma-sp.shtml', 'news_article', 2, 'São Paulo', 'Ato campanha', 'boulos-nunes-fantasma-b133-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro diz que Lula "perdeu noção da realidade" em terceiro mandato.', 'Lula perdeu a noção da realidade, acha que governa por decreto.', 'Palestra em evento empresarial no Rio de Janeiro.', 'verified', false, '2024-11-28', 'https://noticias.uol.com.br/politica/2024/11/28/ciro-lula-noção-realidade.htm', 'news_article', 2, 'Rio de Janeiro', 'Palestra empresarial', 'ciro-lula-perdeu-nocao-b133-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro acusa Lula de "aparelhar Polícia Federal" em investigações.', 'Lula aparelhou a PF para perseguir opositores e proteger aliados.', 'Discurso no Senado sobre operações da PF.', 'verified', false, '2025-03-18', 'https://www.metropoles.com/brasil/politica-br/moro-lula-aparelhar-pf', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'moro-lula-aparelhar-pf-b133-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Moro de "juiz ladrão de mandato" em discurso.', 'Moro é o juiz ladrão de mandato, roubou minha chance em 2018.', 'Comício do PT em Curitiba no estado do Paraná.', 'verified', true, '2025-03-20', 'https://g1.globo.com/pr/parana/noticia/2025/03/20/lula-moro-juiz-ladrao.ghtml', 'news_article', 3, 'Curitiba', 'Comício PT', 'lula-moro-juiz-ladrao-b133-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas chama Marielle morta de "caso mal investigado pela esquerda".', 'A esquerda explora morte de Marielle sem querer saber a verdade.', 'Postagem em rede social após novas investigações.', 'verified', false, '2024-03-24', 'https://www.poder360.com.br/congresso/nikolas-marielle-caso-mal-investigado/', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-marielle-mal-investigado-b133-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle rebate Nikolas em defesa de Marielle Franco.', 'Nikolas ofende memória de Marielle com desinformação criminosa.', 'Pronunciamento no MIR em solidariedade à família.', 'verified', true, '2024-03-25', 'https://www1.folha.uol.com.br/cotidiano/2024/03/anielle-nikolas-marielle.shtml', 'news_article', 2, 'Brasília', 'Coletiva MIR', 'anielle-nikolas-marielle-b133-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia acusa deputados bolsonaristas de "clube do bullying" no plenário.', 'Esses deputados do PL são clube do bullying, só sabem ofender mulheres.', 'Resposta após ataques no plenário da Câmara.', 'verified', false, '2024-04-18', 'https://noticias.uol.com.br/politica/2024/04/18/samia-bolsonaristas-clube-bullying.htm', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'samia-bolsonaristas-bullying-b133-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Lula de "Narcolula" em comício com apoiadores.', 'O Narcolula faz acordo com Venezuela e Cuba, é um narcoditador.', 'Comício bolsonarista em São Paulo capital.', 'verified', true, '2025-02-08', 'https://www.cnnbrasil.com.br/politica/bolsonaro-narcolula-comicio/', 'news_article', 4, 'São Paulo', 'Comício bolsonarista', 'bolsonaro-narcolula-comicio-b133-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula zomba de Bolsonaro como "jogador de baralho sem passaporte".', 'O Bolsonaro virou jogador de baralho sem passaporte, preso no Brasil.', 'Entrevista a rádio durante viagem a Pernambuco.', 'verified', true, '2025-04-02', 'https://g1.globo.com/pe/pernambuco/noticia/2025/04/02/lula-bolsonaro-baralho-passaporte.ghtml', 'news_article', 2, 'Recife', 'Entrevista rádio', 'lula-bolsonaro-baralho-b133-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio acusa PT de "perseguir família" com processo no Rio.', 'O PT persegue minha família no Rio como vingança política suja.', 'Entrevista no Senado sobre processos judiciais.', 'verified', false, '2025-01-10', 'https://www.metropoles.com/brasil/politica-br/flavio-pt-persegue-familia-rio', 'news_article', 3, 'Senado Federal', 'Coletiva Senado', 'flavio-pt-persegue-familia-b133-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet rebate oposição por "discurso de ruína" sobre economia.', 'Oposição pratica discurso de ruína, torce pelo desemprego crescer.', 'Coletiva no MPO sobre números do PIB.', 'verified', false, '2025-03-28', 'https://www1.folha.uol.com.br/mercado/2025/03/tebet-oposicao-discurso-ruina.shtml', 'news_article', 1, 'Brasília', 'Coletiva MPO', 'tebet-oposicao-ruina-b133-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Kicis chama Alexandre de Moraes de "Dom Xandão inquisidor".', 'O Dom Xandão virou inquisidor mor, persegue conservadores como bruxas.', 'Discurso no plenário contra decisões do STF.', 'verified', false, '2024-01-24', 'https://www.poder360.com.br/congresso/kicis-moraes-dom-xandao/', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'kicis-moraes-dom-xandao-b133-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama governo de "tutelado por Maduro".', 'Lula é tutelado por Maduro, virou fantoche do ditador venezuelano.', 'Pronunciamento em Washington em evento conservador.', 'verified', false, '2024-09-20', 'https://noticias.uol.com.br/politica/2024/09/20/eduardo-lula-tutelado-maduro.htm', 'news_article', 3, 'Washington', 'Evento conservador', 'eduardo-lula-tutelado-maduro-b133-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad debocha de Tarcísio chamando-o de "ministro suplente virou governador".', 'O Tarcísio é ministro suplente que virou governador, não entende economia.', 'Entrevista a economistas em evento na FGV.', 'verified', false, '2025-02-20', 'https://g1.globo.com/politica/noticia/2025/02/20/haddad-tarcisio-suplente-governador.ghtml', 'news_article', 2, 'São Paulo', 'Evento FGV', 'haddad-tarcisio-suplente-b133-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem acusa Haddad de "mentir sobre inflação" em dados.', 'Haddad mente sobre inflação, maquia números para enganar o povo.', 'Discurso em plenário durante debate econômico.', 'verified', false, '2025-03-12', 'https://www.cnnbrasil.com.br/politica/van-hattem-haddad-mentir-inflacao/', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-haddad-mentir-b133-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal faz ataque homofóbico a Boulos em live virulenta.', 'Esse Boulos é efeminado, não tem coragem nem de debater comigo!', 'Live em rede social durante campanha de SP.', 'verified', true, '2024-09-18', 'https://www.metropoles.com/brasil/politica-br/marcal-boulos-homofobia-live', 'social_media_post', 5, 'São Paulo', 'Live campanha', 'marcal-boulos-homofobia-b133-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos denuncia Marçal por "homofobia criminosa" em entrevista.', 'Marçal fez homofobia criminosa, vamos processar na Justiça eleitoral.', 'Coletiva de campanha em São Paulo.', 'verified', true, '2024-09-19', 'https://www1.folha.uol.com.br/poder/2024/09/boulos-marcal-homofobia-criminosa.shtml', 'news_article', 3, 'São Paulo', 'Coletiva campanha', 'boulos-marcal-homofobia-b133-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones detona Zambelli chamando-a de "foragida internacional".', 'A Zambelli vai para a cadeia, é foragida internacional da Justiça!', 'Vídeo nas redes após fuga da deputada.', 'verified', true, '2024-06-04', 'https://noticias.uol.com.br/politica/2024/06/04/janones-zambelli-foragida.htm', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'janones-zambelli-foragida-b133-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Eduardo Bolsonaro de "trumpista de serviço".', 'Esse Eduardo é trumpista de serviço, quer sanção contra o Brasil.', 'Coletiva no Planalto sobre diplomacia brasileira.', 'verified', true, '2025-03-15', 'https://www.poder360.com.br/governo/lula-eduardo-trumpista/', 'news_article', 3, 'Brasília', 'Coletiva Planalto', 'lula-eduardo-trumpista-b133-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio chama Tebet de "ministra decorativa" em entrevista.', 'A Tebet virou ministra decorativa, não tem autonomia nenhuma.', 'Entrevista ao programa Pânico na Jovem Pan.', 'verified', false, '2025-01-22', 'https://g1.globo.com/politica/noticia/2025/01/22/tarcisio-tebet-decorativa.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista Pânico', 'tarcisio-tebet-decorativa-b133-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet rebate Tarcísio chamando ataque de "machismo rotineiro".', 'Tarcísio faz ataque de machismo rotineiro quando não tem argumento.', 'Resposta em coletiva no Ministério do Planejamento.', 'verified', true, '2025-01-23', 'https://www1.folha.uol.com.br/poder/2025/01/tebet-tarcisio-machismo-rotineiro.shtml', 'news_article', 2, 'Brasília', 'Coletiva MPO', 'tebet-tarcisio-machismo-b133-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado diz que "Lula quer desarmar cidadão de bem" com decreto.', 'Lula quer desarmar cidadão de bem para entregar o país ao crime.', 'Evento em Goiânia com CACs bolsonaristas.', 'verified', false, '2024-04-05', 'https://www.metropoles.com/brasil/politica-br/caiado-lula-desarmar-cidadao', 'news_article', 3, 'Goiânia', 'Evento CAC', 'caiado-lula-desarmar-b133-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton chama Nikolas de "pastor do ódio digital".', 'Nikolas é o pastor do ódio digital, prega violência contra minorias.', 'Coletiva após novos ataques transfóbicos nas redes.', 'verified', false, '2025-02-05', 'https://noticias.uol.com.br/politica/2025/02/05/erika-nikolas-pastor-odio.htm', 'news_article', 3, 'Brasília', 'Coletiva Câmara', 'erika-nikolas-pastor-odio-b133-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas acusa Lula de "petrolão na Petrobras" em post viral.', 'Lula toca petrolão 2.0 na Petrobras, aparelhou a estatal toda.', 'Postagem em rede social após troca de diretoria.', 'verified', false, '2024-05-22', 'https://www.cnnbrasil.com.br/politica/nikolas-lula-petrolao-petrobras/', 'social_media_post', 3, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-lula-petrolao-b133-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi rebate nova acusação de Nikolas chamando-o de "mentiroso contumaz".', 'Nikolas é mentiroso contumaz, vive de desinformação criminosa.', 'Coletiva do PT em resposta a postagens do deputado.', 'verified', false, '2024-05-23', 'https://g1.globo.com/politica/noticia/2024/05/23/gleisi-nikolas-mentiroso-contumaz.ghtml', 'news_article', 2, 'Brasília', 'Coletiva PT', 'gleisi-nikolas-mentiroso-b133-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão chama Lewandowski de "ministro complacente com crime".', 'Lewandowski é complacente com crime organizado, não age firme.', 'Discurso no Senado sobre segurança pública.', 'verified', false, '2024-11-18', 'https://www1.folha.uol.com.br/poder/2024/11/mourao-lewandowski-complacente-crime.shtml', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'mourao-lewandowski-complacente-b133-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria denuncia Damares por "ataques sistemáticos a mulheres trans".', 'Damares faz ataques sistemáticos a mulheres trans, transfobia institucional.', 'Pronunciamento em plenário após declaração de Damares.', 'verified', false, '2024-06-28', 'https://noticias.uol.com.br/politica/2024/06/28/taliria-damares-ataques-trans.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'taliria-damares-ataques-trans-b133-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama imprensa progressista de "militância disfarçada".', 'Imprensa progressista é militância disfarçada, não faz jornalismo.', 'Entrevista a emissora conservadora em MG.', 'verified', false, '2024-10-18', 'https://www.poder360.com.br/midia/zema-imprensa-militancia-disfarcada/', 'news_article', 3, 'Belo Horizonte', 'Entrevista TV', 'zema-imprensa-militancia-b133-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin rebate Zema chamando-o de "administrador sem visão de país".', 'Zema é administrador sem visão de país, só pensa no próprio estado.', 'Coletiva no MDIC sobre política industrial nacional.', 'verified', false, '2024-10-19', 'https://www.metropoles.com/brasil/politica-br/alckmin-zema-visao-pais', 'news_article', 1, 'Brasília', 'Coletiva MDIC', 'alckmin-zema-visao-pais-b133-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal volta a atacar Lula chamando-o de "alcoolizado político".', 'Lula está alcoolizado politicamente, fala coisa sem sentido em evento.', 'Live no Instagram com milhares de espectadores.', 'verified', false, '2025-02-28', 'https://www.cnnbrasil.com.br/politica/marcal-lula-alcoolizado-politico/', 'social_media_post', 4, 'São Paulo', 'Live Instagram', 'marcal-lula-alcoolizado-b133-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi conclama base do PT a "derrotar fascismo nas eleições 2026".', 'Temos que derrotar o fascismo bolsonarista nas eleições de 2026.', 'Encontro nacional do PT em São Paulo.', 'verified', true, '2025-04-10', 'https://www1.folha.uol.com.br/poder/2025/04/gleisi-derrotar-fascismo-2026.shtml', 'news_article', 2, 'São Paulo', 'Encontro PT', 'gleisi-derrotar-fascismo-2026-b133-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

END $$;
