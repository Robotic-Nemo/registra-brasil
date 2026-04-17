-- Batch 132: PT-government vs opposition daily combat (Jan 2023 - Apr 2026)
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
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi chama Eduardo Bolsonaro de traidor da pátria após articulação nos EUA.', 'Eduardo Bolsonaro é um traidor da pátria que pede sanções contra o próprio país.', 'Declaração em entrevista coletiva na sede do PT após reuniões de Eduardo em Washington.', 'verified', true, '2023-03-15', 'https://www1.folha.uol.com.br/poder/2023/03/gleisi-eduardo-bolsonaro-traidor.shtml', 'news_article', 3, 'São Paulo', 'Coletiva do PT', 'gleisi-eduardo-traidor-b132-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones publica vídeo viral chamando Bolsonaro de "genocida fujão".', 'Bolsonaro é um genocida fujão que abandonou o Brasil na pandemia e agora foge dos EUA.', 'Vídeo postado no TikTok com mais de 10 milhões de visualizações em 24 horas.', 'verified', true, '2023-02-10', 'https://www.metropoles.com/brasil/politica-br/janones-bolsonaro-genocida-fujao', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'janones-bolsonaro-genocida-fujao-b132-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton confronta Nikolas Ferreira em plenário chamando-o de fascista.', 'Você é um fascista que usa a tribuna para espalhar ódio contra minorias.', 'Bate-boca em plenário da Câmara durante debate sobre políticas LGBTQIA+.', 'verified', true, '2023-04-12', 'https://g1.globo.com/politica/noticia/2023/04/12/erika-hilton-nikolas-fascista.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'erika-nikolas-fascista-b132-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca ministra Anielle Franco com discurso racista velado.', 'Essa ministra só está no cargo por cota, não tem competência nenhuma.', 'Postagem em rede social criticando indicação da ministra da Igualdade Racial.', 'verified', true, '2023-01-20', 'https://noticias.uol.com.br/politica/2023/01/20/nikolas-anielle-cota-ataque.htm', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-anielle-cota-b132-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes chama Lula de "traste" em entrevista após primeiros 100 dias.', 'O Lula é um traste, um homem que só pensa em si mesmo e destruiu o Brasil.', 'Entrevista a podcast político criticando os primeiros 100 dias de governo.', 'verified', false, '2023-04-20', 'https://www.poder360.com.br/governo/ciro-gomes-lula-traste/', 'news_article', 3, 'Fortaleza', 'Entrevista a podcast', 'ciro-lula-traste-b132-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Tarcísio de "herdeiro de Bolsonaro" em crítica pública.', 'Tarcísio é o herdeiro político do Bolsonaro e quer destruir tudo que construímos.', 'Declaração em visita oficial a São Paulo para anúncio de obras federais.', 'verified', true, '2023-05-22', 'https://www1.folha.uol.com.br/poder/2023/05/lula-tarcisio-herdeiro-bolsonaro.shtml', 'news_article', 2, 'São Paulo', 'Visita oficial', 'lula-tarcisio-herdeiro-b132-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio chama Lula de "velho caduco" em evento empresarial.', 'O Lula já está caduco, não tem mais condições de governar o Brasil.', 'Fala durante evento da FIESP em São Paulo com empresários.', 'verified', false, '2023-06-10', 'https://g1.globo.com/sp/sao-paulo/noticia/2023/06/10/tarcisio-lula-caduco-fiesp.ghtml', 'news_article', 3, 'São Paulo', 'Evento FIESP', 'tarcisio-lula-caduco-b132-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos acusa Ricardo Nunes de "gestão invisível" em prefeitura de SP.', 'Nunes é o prefeito invisível, uma marionete do Bolsonaro e de Tarcísio.', 'Entrevista à TV Globo lançando pré-candidatura à Prefeitura de São Paulo.', 'verified', true, '2024-02-15', 'https://noticias.uol.com.br/politica/2024/02/15/boulos-nunes-invisivel.htm', 'news_article', 2, 'São Paulo', 'Entrevista TV Globo', 'boulos-nunes-invisivel-b132-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli chama Gleisi de "vagabunda" em plenário da Câmara.', 'Essa vagabunda da Gleisi só sabe defender bandido, é uma desgraça pro Brasil.', 'Discurso inflamado em plenário durante debate sobre segurança pública.', 'verified', true, '2023-03-28', 'https://www.cnnbrasil.com.br/politica/zambelli-gleisi-vagabunda/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'zambelli-gleisi-vagabunda-b132-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa Zambelli de "armar golpe" junto com Bolsonaro.', 'Zambelli é uma criminosa que ajudou a armar o golpe de 8 de janeiro.', 'Coletiva em resposta aos ataques da deputada bolsonarista.', 'verified', false, '2023-03-29', 'https://www1.folha.uol.com.br/poder/2023/03/gleisi-zambelli-criminosa.shtml', 'news_article', 3, 'Brasília', 'Coletiva PT', 'gleisi-zambelli-criminosa-b132-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis pede impeachment de Lula em primeiro mês de governo.', 'Vamos protocolar o impeachment de Lula antes que ele destrua o Brasil.', 'Pronunciamento no plenário da Câmara logo no início do mandato.', 'verified', false, '2023-01-30', 'https://g1.globo.com/politica/noticia/2023/01/30/kicis-impeachment-lula.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'kicis-impeachment-lula-b132-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate oposição chamando críticas de "fake news orquestrada".', 'É uma fake news orquestrada pela extrema-direita para desestabilizar o governo.', 'Entrevista após declarações de Nikolas sobre arcabouço fiscal.', 'verified', false, '2023-04-05', 'https://www.poder360.com.br/governo/haddad-fake-news-orquestrada/', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-fake-news-orquestrada-b132-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas espalha desinformação sobre programa Bolsa Família.', 'Lula vai tirar o Bolsa Família de 3 milhões de pessoas, é um criminoso social.', 'Vídeo no Instagram desmentido pela Agência Lupa no mesmo dia.', 'verified', true, '2023-02-20', 'https://www.metropoles.com/brasil/politica-br/nikolas-bolsa-familia-desinformacao', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-bolsa-familia-desinfo-b132-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim chama PL de "partido fascista" em discurso acalorado.', 'O PL virou o partido fascista do Brasil, defende miliciano e terrorista.', 'Discurso no PSOL após ataques ao STF por parlamentares do PL.', 'verified', false, '2023-05-10', 'https://noticias.uol.com.br/politica/2023/05/10/samia-pl-fascista.htm', 'news_article', 3, 'Brasília', 'Plenário PSOL', 'samia-pl-fascista-b132-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro acusa Lula de "loteamento" com centrão.', 'Lula está loteando o governo com o centrão corrupto, é o velho toma lá dá cá.', 'Entrevista no Senado criticando negociações por cargos.', 'verified', false, '2023-04-18', 'https://www.cnnbrasil.com.br/politica/flavio-lula-loteamento/', 'news_article', 2, 'Senado Federal', 'Coletiva Senado', 'flavio-lula-loteamento-b132-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza Bolsonaro chamando-o de "fujão" em evento oficial.', 'O fujão tá lá nos Estados Unidos com medo de responder pelos crimes.', 'Declaração em entrevista em Brasília após retorno de viagem internacional.', 'verified', true, '2023-02-25', 'https://g1.globo.com/politica/noticia/2023/02/25/lula-bolsonaro-fujao.ghtml', 'news_article', 2, 'Brasília', 'Entrevista Palácio do Planalto', 'lula-bolsonaro-fujao-b132-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem chama Padilha de "ditador de ministério".', 'O Padilha virou um pequeno ditador à frente das Relações Institucionais.', 'Discurso em plenário após embate sobre medidas provisórias.', 'verified', false, '2023-06-08', 'https://www.poder360.com.br/congresso/van-hattem-padilha-ditador/', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-padilha-ditador-b132-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia racismo estrutural após ataques a Anielle.', 'Anielle é alvo de racismo estrutural por ser mulher negra no poder.', 'Pronunciamento no plenário em defesa da ministra da Igualdade Racial.', 'verified', false, '2023-03-05', 'https://www1.folha.uol.com.br/poder/2023/03/taliria-anielle-racismo.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'taliria-anielle-racismo-b132-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca Sônia Guajajara com discurso preconceituoso.', 'Essa ministra indígena quer transformar o Brasil numa reserva, é um absurdo.', 'Discurso no Senado durante debate sobre marco temporal.', 'verified', false, '2023-06-15', 'https://www.cnnbrasil.com.br/politica/damares-sonia-guajajara-ataque/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'damares-sonia-preconceito-b132-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara rebate Damares dizendo que "Brasil é terra indígena".', 'O Brasil inteiro é terra indígena. Quem tem que respeitar são os invasores.', 'Coletiva no Ministério dos Povos Indígenas respondendo a Damares.', 'verified', true, '2023-06-16', 'https://g1.globo.com/politica/noticia/2023/06/16/sonia-damares-terra-indigena.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MPI', 'sonia-brasil-terra-indigena-b132-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado chama Lula de "aliado do crime" por política de drogas.', 'Lula é aliado do crime organizado, defende bandido em vez de polícia.', 'Declaração em evento de segurança pública em Goiás.', 'verified', false, '2023-07-10', 'https://noticias.uol.com.br/politica/2023/07/10/caiado-lula-aliado-crime.htm', 'news_article', 3, 'Goiânia', 'Evento segurança pública', 'caiado-lula-aliado-crime-b132-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama ministros do Lula de "incompetentes" em evento do Novo.', 'Os ministros do Lula são todos incompetentes, vão quebrar o Brasil.', 'Convenção nacional do Partido Novo em Belo Horizonte.', 'verified', false, '2023-08-12', 'https://www.poder360.com.br/politica/zema-ministros-lula-incompetentes/', 'news_article', 2, 'Belo Horizonte', 'Convenção Partido Novo', 'zema-ministros-incompetentes-b132-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones posta vídeo viral ridicularizando Nikolas Ferreira.', 'O Nikolas é só um garoto sem conteúdo que vive de polêmica barata no TikTok.', 'Vídeo no TikTok em resposta a ataques de Nikolas ao governo.', 'verified', true, '2023-09-05', 'https://www.metropoles.com/brasil/politica-br/janones-nikolas-garoto-tiktok', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'janones-nikolas-ridiculariza-b132-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin tenta conciliar e chama oposição ao diálogo civilizado.', 'Precisamos superar a polarização e dialogar em nome do Brasil.', 'Entrevista como vice-presidente em encontro com governadores.', 'verified', false, '2023-03-10', 'https://www1.folha.uol.com.br/poder/2023/03/alckmin-dialogo-oposicao.shtml', 'news_article', 1, 'Brasília', 'Encontro de governadores', 'alckmin-dialogo-oposicao-b132-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri acusa Haddad de "esconder dados" fiscais.', 'Haddad esconde os dados fiscais porque sabe que o governo vai quebrar.', 'Discurso em plenário durante debate sobre PLDO.', 'verified', false, '2023-08-20', 'https://g1.globo.com/politica/noticia/2023/08/20/kim-haddad-esconde-dados.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Debate PLDO', 'kim-haddad-esconde-dados-b132-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Fernanda Melchionna defende feminismo contra ataques da bancada evangélica.', 'A bancada evangélica é uma máquina de produzir misoginia e homofobia.', 'Pronunciamento em plenário após ataques a pauta feminista.', 'verified', false, '2023-07-25', 'https://noticias.uol.com.br/politica/2023/07/25/melchionna-bancada-evangelica.htm', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-bancada-evangelica-b132-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano ataca ministra Anielle com discurso religioso.', 'Essa ministra do diabo quer destruir a família cristã brasileira.', 'Sermão em culto transmitido ao vivo em São Paulo.', 'verified', false, '2023-05-28', 'https://www.cnnbrasil.com.br/politica/feliciano-anielle-diabo/', 'news_article', 4, 'São Paulo', 'Culto Catedral do Avivamento', 'feliciano-anielle-diabo-b132-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle rebate Feliciano dizendo que "racismo religioso não nos calará".', 'O racismo religioso disfarçado de fé não vai nos calar. Vamos resistir.', 'Coletiva no Ministério da Igualdade Racial em Brasília.', 'verified', true, '2023-05-29', 'https://g1.globo.com/politica/noticia/2023/05/29/anielle-feliciano-racismo-religioso.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MIR', 'anielle-racismo-religioso-b132-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro chama governo Lula de "reincidente em corrupção".', 'Lula é reincidente em corrupção e esse governo é a continuação do mensalão.', 'Entrevista como senador em veículo conservador.', 'verified', false, '2023-09-18', 'https://www.poder360.com.br/politica/moro-lula-reincidente-corrupcao/', 'news_article', 3, 'Curitiba', 'Entrevista Jovem Pan', 'moro-lula-reincidente-b132-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi chama Moro de "juiz ladrão" após críticas ao governo.', 'Moro é o juiz ladrão que fraudou a Lava Jato e agora faz política suja.', 'Coletiva do PT em resposta às declarações do senador.', 'verified', true, '2023-09-19', 'https://www1.folha.uol.com.br/poder/2023/09/gleisi-moro-juiz-ladrao.shtml', 'news_article', 4, 'Brasília', 'Coletiva PT', 'gleisi-moro-juiz-ladrao-b132-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal chama Lula de "presidiário" em vídeo viral.', 'O presidiário tá de volta ao poder e vai destruir a economia de novo.', 'Vídeo publicado em suas redes sociais atacando governo.', 'verified', true, '2023-10-10', 'https://www.metropoles.com/brasil/politica-br/marcal-lula-presidiario', 'social_media_post', 3, 'São Paulo', 'Postagem em rede social', 'marcal-lula-presidiario-b132-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia transfobia sistêmica da extrema-direita.', 'A extrema-direita transformou minha existência em alvo político diário.', 'Entrevista à Folha em aniversário do primeiro ano de mandato.', 'verified', true, '2024-02-01', 'https://www1.folha.uol.com.br/poder/2024/02/erika-hilton-transfobia-extrema-direita.shtml', 'news_article', 2, 'São Paulo', 'Entrevista Folha de S.Paulo', 'erika-transfobia-extrema-direita-b132-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz piada transfóbica contra Erika Hilton no plenário.', 'Dia internacional da mulher? Então Erika não precisa comemorar.', 'Postagem polêmica no Dia Internacional da Mulher no X.', 'verified', true, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/nikolas-piada-transfobica-erika.ghtml', 'social_media_post', 5, 'Brasília', 'Postagem em rede social', 'nikolas-piada-transfobica-erika-b132-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata critica governo Lula por "falta de responsabilidade fiscal".', 'O governo Lula abandonou completamente a responsabilidade fiscal.', 'Entrevista como deputada federal em rede de TV.', 'verified', false, '2024-04-12', 'https://noticias.uol.com.br/politica/2024/04/12/tabata-lula-fiscal.htm', 'news_article', 1, 'São Paulo', 'Entrevista GloboNews', 'tabata-lula-fiscal-b132-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos acusa Nunes de "prefeito da milícia" em campanha.', 'Ricardo Nunes é o prefeito da milícia, protege quem oprime o povo.', 'Comício na zona leste de São Paulo em campanha municipal.', 'verified', true, '2024-09-20', 'https://www.poder360.com.br/eleicoes/boulos-nunes-milicia/', 'news_article', 3, 'São Paulo', 'Comício zona leste', 'boulos-nunes-milicia-b132-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal ataca Boulos chamando-o de "invasor".', 'Boulos é um invasor profissional, não pode ser prefeito de São Paulo.', 'Debate na TV Cultura durante campanha municipal.', 'verified', true, '2024-08-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/08/15/marcal-boulos-invasor-debate.ghtml', 'news_article', 3, 'São Paulo', 'Debate TV Cultura', 'marcal-boulos-invasor-b132-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes chama Gleisi de "vassala do PT" em entrevista.', 'A Gleisi é uma vassala do PT, não tem personalidade política própria.', 'Entrevista ao Roda Viva na TV Cultura.', 'verified', false, '2024-05-20', 'https://www.cnnbrasil.com.br/politica/ciro-gleisi-vassala/', 'news_article', 3, 'São Paulo', 'Roda Viva TV Cultura', 'ciro-gleisi-vassala-b132-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende governo Lula contra ataques do centrão.', 'O centrão quer chantagear o governo, mas nós não vamos ceder.', 'Entrevista como ministra do Planejamento.', 'verified', false, '2024-06-10', 'https://www1.folha.uol.com.br/mercado/2024/06/tebet-centrao-chantagem.shtml', 'news_article', 2, 'Brasília', 'Entrevista ministério', 'tebet-centrao-chantagem-b132-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reage a Moro dizendo que "ex-juiz está com medo".', 'O Moro tá com medo de perder o mandato por inelegibilidade.', 'Entrevista matinal em rádio gaúcha.', 'verified', false, '2024-03-20', 'https://noticias.uol.com.br/politica/2024/03/20/lula-moro-medo.htm', 'news_article', 2, 'Porto Alegre', 'Entrevista Gaúcha', 'lula-moro-medo-b132-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca ministra Cida Gonçalves com viés religioso.', 'Essa ministra feminista quer destruir a família tradicional brasileira.', 'Discurso em culto em Cachoeiro de Itapemirim.', 'verified', false, '2023-10-22', 'https://www.metropoles.com/brasil/politica-br/magno-malta-cida-feminista', 'news_article', 3, 'Cachoeiro de Itapemirim', 'Culto evangélico', 'magno-malta-cida-familia-b132-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia machismo contra mulheres no poder.', 'As mulheres no poder são alvo diário do machismo organizado da direita.', 'Evento do 8 de março no Palácio do Planalto.', 'verified', false, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/cida-goncalves-machismo-poder.ghtml', 'news_article', 2, 'Brasília', 'Evento 8 de Março', 'cida-machismo-poder-b132-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama Padilha de "comissário político".', 'Padilha é um comissário político que controla o Congresso como na URSS.', 'Discurso em plenário após derrota do PL de armas.', 'verified', false, '2023-11-15', 'https://www.poder360.com.br/congresso/eduardo-padilha-comissario/', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'eduardo-padilha-comissario-b132-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha chama oposição de "terraplanista institucional".', 'A oposição virou terraplanista institucional, nega a realidade econômica.', 'Coletiva após aprovação de MP no Congresso.', 'verified', false, '2023-11-20', 'https://www1.folha.uol.com.br/poder/2023/11/padilha-oposicao-terraplanista.shtml', 'news_article', 2, 'Brasília', 'Coletiva SRI', 'padilha-terraplanista-institucional-b132-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Lula de "ladrão que governa para bandido".', 'O ladrão voltou e agora governa para bandido, para o PCC, para o CV.', 'Ato em Copacabana no Dia da Independência.', 'verified', true, '2023-09-07', 'https://www.cnnbrasil.com.br/politica/bolsonaro-lula-ladrao-7-setembro/', 'news_article', 4, 'Rio de Janeiro', 'Ato 7 de Setembro Copacabana', 'bolsonaro-lula-ladrao-bandido-b132-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avn, 'Adriana Ventura chama Haddad de "destruidor fiscal".', 'Haddad é o destruidor fiscal do Brasil, vai quebrar a economia de novo.', 'Discurso em plenário da Câmara em debate orçamentário.', 'verified', false, '2024-10-05', 'https://noticias.uol.com.br/politica/2024/10/05/ventura-haddad-destruidor-fiscal.htm', 'news_article', 2, 'Câmara dos Deputados', 'Debate orçamento', 'ventura-haddad-destruidor-b132-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa rebate oposição chamando críticas de "histeria organizada".', 'É uma histeria organizada da oposição que não aceita que Lula voltou.', 'Entrevista como ministro da Casa Civil na Globonews.', 'verified', false, '2024-01-18', 'https://g1.globo.com/politica/noticia/2024/01/18/rui-costa-oposicao-histeria.ghtml', 'news_article', 2, 'Brasília', 'Entrevista GloboNews', 'rui-costa-histeria-organizada-b132-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lmr, 'Luiz Marinho acusa oposição de "sabotar trabalhador brasileiro".', 'A oposição sabota sistematicamente os direitos do trabalhador brasileiro.', 'Ato do 1º de Maio em São Bernardo do Campo.', 'verified', false, '2024-05-01', 'https://www1.folha.uol.com.br/mercado/2024/05/marinho-oposicao-sabotar-trabalhador.shtml', 'news_article', 2, 'São Bernardo do Campo', 'Ato 1º de Maio', 'marinho-oposicao-sabotar-b132-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica desinformação sobre Ministério da Saúde.', 'O Ministério da Saúde quer obrigar crianças a tomar vacina experimental.', 'Vídeo no Instagram desmentido por agências de checagem.', 'verified', true, '2023-04-30', 'https://www.metropoles.com/brasil/politica-br/nikolas-ministerio-saude-desinformacao', 'social_media_post', 4, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-saude-desinfo-b132-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski responde oposição com tom institucional firme.', 'O Ministério da Justiça não vai se submeter a pressões políticas ilegítimas.', 'Coletiva no ministério após ataques de parlamentares bolsonaristas.', 'verified', false, '2024-07-18', 'https://www.poder360.com.br/governo/lewandowski-oposicao-pressao/', 'news_article', 1, 'Brasília', 'Coletiva MJSP', 'lewandowski-pressao-oposicao-b132-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão chama governo Lula de "governo de oportunistas".', 'Esse é um governo de oportunistas que usam o Estado para benefício próprio.', 'Discurso no Senado em debate sobre Orçamento.', 'verified', false, '2024-08-22', 'https://g1.globo.com/politica/noticia/2024/08/22/mourao-lula-oportunistas.ghtml', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'mourao-oportunistas-b132-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa Tarcísio de "governar para milícias" em SP.', 'Tarcísio governa para as milícias paulistas, não para o povo trabalhador.', 'Entrevista após operação policial controversa em SP.', 'verified', true, '2024-06-25', 'https://www1.folha.uol.com.br/poder/2024/06/gleisi-tarcisio-milicias.shtml', 'news_article', 3, 'São Paulo', 'Coletiva PT São Paulo', 'gleisi-tarcisio-milicias-b132-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio acusa Gleisi de "mentir descaradamente".', 'A Gleisi mente descaradamente sobre meu governo, é uma militante fracassada.', 'Coletiva no Palácio dos Bandeirantes em resposta a Gleisi.', 'verified', false, '2024-06-26', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/06/26/tarcisio-gleisi-militante-fracassada.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva Bandeirantes', 'tarcisio-gleisi-militante-b132-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones viraliza vídeo cobrando CPMI dos atos golpistas.', 'Cadê os bolsonaristas que diziam defender a democracia? Sumiram!', 'Vídeo no TikTok durante trabalhos da CPMI do 8 de Janeiro.', 'verified', true, '2023-06-02', 'https://noticias.uol.com.br/politica/2023/06/02/janones-cpmi-8-janeiro.htm', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'janones-cpmi-golpistas-b132-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende Bolsonaro e ataca STF chamando ministros de ditadores.', 'Os ministros do STF viraram ditadores de toga, perseguem Bolsonaro.', 'Entrevista em programa de rádio em Brasília.', 'verified', false, '2023-07-12', 'https://www.cnnbrasil.com.br/politica/kicis-stf-ditadores-toga/', 'news_article', 4, 'Brasília', 'Entrevista Jovem Pan', 'kicis-stf-ditadores-b132-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva rebate Caiado com defesa da Amazônia.', 'O Caiado defende o desmatamento da Amazônia, é um negacionista ambiental.', 'Coletiva no MMA após troca de farpas com governador.', 'verified', false, '2024-03-05', 'https://g1.globo.com/politica/noticia/2024/03/05/marina-caiado-negacionista.ghtml', 'news_article', 2, 'Brasília', 'Coletiva MMA', 'marina-caiado-negacionista-b132-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida denuncia racismo institucional da bancada bolsonarista.', 'A bancada bolsonarista pratica racismo institucional sistemático.', 'Pronunciamento no MDH antes de seu afastamento do cargo.', 'verified', false, '2024-02-20', 'https://www1.folha.uol.com.br/poder/2024/02/silvio-almeida-bolsonarismo-racismo.shtml', 'news_article', 3, 'Brasília', 'Pronunciamento MDH', 'silvio-bolsonarismo-racismo-b132-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pede cassação de Gleisi após crítica ao Senado.', 'A Gleisi tem que ser cassada, ela insulta o Senado todos os dias.', 'Discurso no Senado em resposta a críticas da presidente do PT.', 'verified', false, '2024-04-18', 'https://www.poder360.com.br/congresso/flavio-cassacao-gleisi/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'flavio-cassacao-gleisi-b132-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia Pablo Marçal como "representante do ódio".', 'Pablo Marçal é a síntese do ódio bolsonarista, um criminoso com palco.', 'Entrevista durante campanha municipal em São Paulo.', 'verified', true, '2024-09-05', 'https://noticias.uol.com.br/politica/2024/09/05/erika-marcal-odio.htm', 'news_article', 3, 'São Paulo', 'Entrevista BandNews', 'erika-marcal-odio-b132-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal ataca Erika Hilton com transfobia explícita.', 'A Erika não é mulher de verdade, é só mais um ativista extremista.', 'Live no YouTube durante campanha à Prefeitura.', 'verified', true, '2024-09-10', 'https://www.metropoles.com/sao-paulo/politica-sp/marcal-erika-transfobia', 'social_media_post', 5, 'São Paulo', 'Live YouTube', 'marcal-erika-transfobia-b132-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi acusa centrão de "chantagem permanente" contra governo.', 'O centrão faz chantagem permanente contra o governo Lula por emendas.', 'Coletiva do PT após derrota em votação de MP.', 'verified', false, '2024-07-02', 'https://g1.globo.com/politica/noticia/2024/07/02/gleisi-centrao-chantagem.ghtml', 'news_article', 2, 'Brasília', 'Coletiva PT', 'gleisi-centrao-chantagem-b132-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wel, 'Wellington Dias defende Bolsa Família contra "mentiras da oposição".', 'A oposição mente diariamente sobre o Bolsa Família para assustar o povo.', 'Entrevista em evento do MDS em Teresina.', 'verified', false, '2023-12-15', 'https://www1.folha.uol.com.br/mercado/2023/12/wellington-dias-oposicao-mentiras.shtml', 'news_article', 2, 'Teresina', 'Evento MDS', 'wellington-oposicao-mentiras-b132-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema chama Alckmin de "traidor da direita" por apoiar Lula.', 'Alckmin é o maior traidor da direita brasileira, vendeu sua alma.', 'Entrevista a portal conservador em Minas Gerais.', 'verified', false, '2024-02-28', 'https://www.cnnbrasil.com.br/politica/zema-alckmin-traidor/', 'news_article', 2, 'Belo Horizonte', 'Entrevista Gazeta do Povo', 'zema-alckmin-traidor-b132-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin rebate Zema defendendo aliança democrática com Lula.', 'A aliança com Lula foi para defender a democracia contra o bolsonarismo.', 'Entrevista como vice-presidente na GloboNews.', 'verified', false, '2024-03-01', 'https://noticias.uol.com.br/politica/2024/03/01/alckmin-zema-alianca-democratica.htm', 'news_article', 1, 'Brasília', 'Entrevista GloboNews', 'alckmin-alianca-democratica-b132-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira convoca seguidores a "não dar trégua" ao governo.', 'Não vamos dar trégua ao governo Lula, vamos incomodar todos os dias.', 'Live transmitida em suas redes sociais com mais de 500 mil visualizações.', 'verified', false, '2024-01-05', 'https://www.poder360.com.br/congresso/nikolas-nao-dar-tregua-lula/', 'social_media_post', 2, 'Belo Horizonte', 'Live Instagram', 'nikolas-nao-dar-tregua-b132-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad chama oposição de "derrotados que não aceitam eleição".', 'A oposição ainda não aceitou o resultado das urnas de 2022.', 'Entrevista em café da manhã com jornalistas.', 'verified', false, '2024-05-14', 'https://g1.globo.com/politica/noticia/2024/05/14/haddad-oposicao-derrotados.ghtml', 'news_article', 2, 'Brasília', 'Café com jornalistas', 'haddad-oposicao-derrotados-b132-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende governo de "lawfare da oposição".', 'A oposição pratica lawfare contra o governo e contra o presidente Lula.', 'Entrevista como AGU na Globonews em Brasília.', 'verified', false, '2024-04-25', 'https://www1.folha.uol.com.br/poder/2024/04/messias-oposicao-lawfare.shtml', 'news_article', 2, 'Brasília', 'Entrevista GloboNews', 'messias-oposicao-lawfare-b132-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Carlos Lupi enfrenta críticas e reage chamando oposição de "covarde".', 'A oposição é covarde, ataca Previdência sem apresentar solução.', 'Entrevista como ministro da Previdência.', 'verified', false, '2023-11-28', 'https://noticias.uol.com.br/politica/2023/11/28/lupi-oposicao-covarde.htm', 'news_article', 2, 'Brasília', 'Entrevista MPS', 'lupi-oposicao-covarde-b132-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano acusa governo Lula de "perseguir cristãos".', 'Esse governo ateu quer perseguir os cristãos, acabar com nossa fé.', 'Sermão em culto em Goiânia transmitido ao vivo.', 'verified', false, '2023-08-30', 'https://www.metropoles.com/brasil/politica-br/feliciano-lula-perseguir-cristaos', 'news_article', 3, 'Goiânia', 'Culto Catedral do Avivamento', 'feliciano-perseguir-cristaos-b132-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia violência política de gênero contra Gleisi.', 'Gleisi é alvo de violência política de gênero diária da extrema-direita.', 'Entrevista em sessão da Câmara sobre violência política.', 'verified', false, '2024-03-15', 'https://g1.globo.com/politica/noticia/2024/03/15/samia-gleisi-violencia-politica.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'samia-gleisi-violencia-politica-b132-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama Alexandre de Moraes de "tirano".', 'Moraes é um tirano que persegue opositores, merece sanção internacional.', 'Entrevista em rede conservadora americana em Miami.', 'verified', true, '2024-05-18', 'https://www.cnnbrasil.com.br/politica/eduardo-moraes-tirano-sancao/', 'news_article', 5, 'Miami, EUA', 'Entrevista Newsmax', 'eduardo-moraes-tirano-b132-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi cobra cassação de Eduardo por pedir sanções contra Brasil.', 'Eduardo precisa perder o mandato por pedir sanções contra seu próprio país.', 'Entrevista após declaração de Eduardo em Miami.', 'verified', true, '2024-05-19', 'https://www.poder360.com.br/congresso/gleisi-eduardo-cassacao-sancoes/', 'news_article', 3, 'Brasília', 'Coletiva PT', 'gleisi-eduardo-cassacao-b132-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones posta vídeo expondo "mentiras de Bolsonaro" sobre pandemia.', 'Bolsonaro matou mais brasileiros na pandemia do que qualquer guerra.', 'Vídeo viral no TikTok em aniversário da pandemia.', 'verified', true, '2024-03-20', 'https://www.metropoles.com/brasil/politica-br/janones-bolsonaro-pandemia-mortes', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'janones-bolsonaro-pandemia-b132-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Bolsonaro de "mais covarde da história" em comício.', 'Bolsonaro é o mais covarde da história do Brasil, fugiu na hora da prestação de contas.', 'Comício do PT em Salvador para eleições municipais.', 'verified', true, '2024-09-25', 'https://g1.globo.com/politica/noticia/2024/09/25/lula-bolsonaro-mais-covarde.ghtml', 'news_article', 3, 'Salvador', 'Comício PT', 'lula-bolsonaro-covarde-historia-b132-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca ministros petistas em série de posts.', 'Os ministros do Lula são todos incompetentes e corruptos, sem exceção.', 'Série de postagens no X em madrugada.', 'verified', false, '2024-02-08', 'https://www.cnnbrasil.com.br/politica/carlos-bolsonaro-ministros-petistas/', 'social_media_post', 3, 'Rio de Janeiro', 'Postagens em rede social', 'carlos-ministros-petistas-b132-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos defende PSOL-PT e rebate centrão sobre aliança.', 'A aliança PSOL-PT é fundamental para enfrentar o fascismo no Brasil.', 'Entrevista após tensões na base governista.', 'verified', false, '2024-11-10', 'https://noticias.uol.com.br/politica/2024/11/10/boulos-psol-pt-fascismo.htm', 'news_article', 2, 'São Paulo', 'Entrevista Folha', 'boulos-psol-pt-fascismo-b132-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro volta a atacar Lula chamando governo de "farsa populista".', 'Esse é um governo de farsa populista que engana o povo com migalhas.', 'Podcast com Reinaldo Azevedo comentando cenário político.', 'verified', false, '2024-10-08', 'https://www1.folha.uol.com.br/poder/2024/10/ciro-lula-farsa-populista.shtml', 'news_article', 3, 'Fortaleza', 'Podcast', 'ciro-lula-farsa-populista-b132-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ameaça jornalistas que criticam Bolsonaro em vídeo.', 'Esses jornalistas vão pagar por perseguir Bolsonaro, um dia a conta chega.', 'Vídeo publicado em suas redes antes de se refugiar nos EUA.', 'verified', true, '2024-05-30', 'https://g1.globo.com/politica/noticia/2024/05/30/zambelli-ameaca-jornalistas.ghtml', 'social_media_post', 5, 'São Paulo', 'Postagem em rede social', 'zambelli-ameaca-jornalistas-b132-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia fascismo de Pablo Marçal em SP.', 'Pablo Marçal representa a fase final do fascismo tupiniquim.', 'Ato em São Paulo durante campanha de Boulos à Prefeitura.', 'verified', false, '2024-09-18', 'https://www.poder360.com.br/eleicoes/taliria-marcal-fascismo-tupiniquim/', 'news_article', 3, 'São Paulo', 'Ato campanha Boulos', 'taliria-marcal-fascismo-b132-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem acusa Lewandowski de "entregar País ao crime".', 'Lewandowski virou ministro da anistia ao crime organizado.', 'Discurso em plenário após crise de segurança pública.', 'verified', false, '2024-08-30', 'https://www.metropoles.com/brasil/politica-br/van-hattem-lewandowski-crime', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'van-hattem-lewandowski-crime-b132-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri chama governo Lula de "governo das fake news".', 'Esse é o governo das fake news, vive distorcendo números para enganar.', 'Entrevista em podcast liberal em São Paulo.', 'verified', false, '2024-06-15', 'https://noticias.uol.com.br/politica/2024/06/15/kim-lula-fake-news.htm', 'news_article', 2, 'São Paulo', 'Podcast Liberal', 'kim-lula-fake-news-b132-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca Sônia Guajajara com xenofobia velada.', 'A ministra dos índios quer estrangeirizar a Amazônia brasileira.', 'Discurso no Senado contra demarcação de terras.', 'verified', false, '2024-07-05', 'https://www.cnnbrasil.com.br/politica/damares-sonia-estrangeirizar/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'damares-sonia-estrangeirizar-b132-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia genocídio indígena promovido pela oposição.', 'A oposição bolsonarista quer o genocídio dos povos originários.', 'Coletiva durante Acampamento Terra Livre em Brasília.', 'verified', true, '2024-04-22', 'https://g1.globo.com/politica/noticia/2024/04/22/sonia-guajajara-genocidio-bolsonarismo.ghtml', 'news_article', 3, 'Brasília', 'Acampamento Terra Livre', 'sonia-genocidio-oposicao-b132-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama governo Lula de "governo do capeta".', 'Esse governo é do capeta, quer destruir a família e os valores cristãos.', 'Sermão em culto no Espírito Santo.', 'verified', false, '2024-03-30', 'https://www.poder360.com.br/politica/magno-malta-lula-capeta/', 'news_article', 4, 'Vitória', 'Culto evangélico', 'magno-lula-capeta-b132-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmn, 'Fernanda Melchionna ataca governo Tarcísio por violência policial.', 'O governo Tarcísio é responsável direto pelos mortos pela PM em SP.', 'Pronunciamento em plenário após operação policial letal.', 'verified', false, '2024-10-15', 'https://www1.folha.uol.com.br/poder/2024/10/melchionna-tarcisio-pm-mortos.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'melchionna-tarcisio-pm-b132-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio chama Boulos de "invasor perigoso" em debate.', 'Boulos é um invasor perigoso, não pode governar a maior cidade.', 'Entrevista durante apoio a Ricardo Nunes em SP.', 'verified', true, '2024-09-30', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/30/tarcisio-boulos-invasor.ghtml', 'news_article', 3, 'São Paulo', 'Evento Nunes', 'tarcisio-boulos-invasor-b132-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos rebate Tarcísio acusando-o de "vassalo de Bolsonaro".', 'Tarcísio é o vassalo de Bolsonaro que nunca escondeu seu projeto autoritário.', 'Comício da campanha de Boulos em Itaquera.', 'verified', true, '2024-10-01', 'https://noticias.uol.com.br/politica/2024/10/01/boulos-tarcisio-vassalo.htm', 'news_article', 3, 'São Paulo', 'Comício Itaquera', 'boulos-tarcisio-vassalo-b132-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende governo de ataques do Nikolas por "cinco horas no TikTok".', 'O Nikolas só sabe fazer video de cinco horas no TikTok, não sabe governar.', 'Entrevista à rádio CBN em Brasília.', 'verified', false, '2024-07-22', 'https://www.cnnbrasil.com.br/politica/gleisi-nikolas-tiktok-governar/', 'news_article', 2, 'Brasília', 'Entrevista Rádio CBN', 'gleisi-nikolas-tiktok-b132-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama governo Lula de "quadrilha organizada".', 'O governo Lula é uma quadrilha organizada que volta a saquear o Brasil.', 'Ato em Brasília em defesa da anistia.', 'verified', true, '2024-04-21', 'https://www.metropoles.com/brasil/politica-br/bolsonaro-lula-quadrilha-organizada', 'news_article', 4, 'Brasília', 'Ato Esplanada Brasília', 'bolsonaro-lula-quadrilha-b132-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama oposição de "pseudo-patriotas" em cerimônia.', 'Esses pseudo-patriotas são na verdade traidores da Pátria.', 'Cerimônia da Semana da Pátria em Brasília.', 'verified', true, '2024-09-07', 'https://g1.globo.com/politica/noticia/2024/09/07/lula-oposicao-pseudo-patriotas.ghtml', 'news_article', 2, 'Brasília', 'Cerimônia 7 de Setembro', 'lula-pseudo-patriotas-b132-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avn, 'Adriana Ventura acusa PT de "capturar o Estado" com indicações.', 'O PT captura o Estado com indicações políticas até em estatais técnicas.', 'Discurso em plenário sobre CPI das Estatais.', 'verified', false, '2024-11-28', 'https://www.poder360.com.br/congresso/ventura-pt-capturar-estado/', 'news_article', 2, 'Câmara dos Deputados', 'CPI das Estatais', 'ventura-pt-capturar-estado-b132-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende Lula de ataques racistas da oposição.', 'Os ataques a Lula têm racismo de classe explícito, não aceitamos.', 'Entrevista à TV 247 em São Paulo.', 'verified', false, '2024-08-18', 'https://www1.folha.uol.com.br/poder/2024/08/erika-hilton-lula-racismo-classe.shtml', 'news_article', 2, 'São Paulo', 'Entrevista TV 247', 'erika-lula-racismo-classe-b132-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado acusa PT de "entregar Brasil ao narcotráfico".', 'O PT entregou o Brasil ao narcotráfico, as fronteiras são um queijo suíço.', 'Entrevista em programa de TV com apresentador conservador.', 'verified', false, '2024-08-05', 'https://g1.globo.com/go/goias/noticia/2024/08/05/caiado-pt-narcotrafico.ghtml', 'news_article', 3, 'Goiânia', 'Jovem Pan News', 'caiado-pt-narcotrafico-b132-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad ironiza Zema chamando-o de "economista amador".', 'O Zema é um economista amador, fala bobagem sobre fiscalidade.', 'Coletiva em resposta a Zema no Ministério da Fazenda.', 'verified', false, '2024-11-20', 'https://noticias.uol.com.br/politica/2024/11/20/haddad-zema-amador.htm', 'news_article', 2, 'Brasília', 'Coletiva Fazenda', 'haddad-zema-amador-b132-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira pede impeachment de Lula em evento.', 'Lula tem que sofrer impeachment já, cometeu crimes de responsabilidade.', 'Ato do PL em Belo Horizonte por anistia e impeachment.', 'verified', true, '2024-10-06', 'https://www.cnnbrasil.com.br/politica/nikolas-impeachment-lula-ato-bh/', 'news_article', 3, 'Belo Horizonte', 'Ato PL', 'nikolas-impeachment-lula-b132-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate pedidos de impeachment chamando-os de "teatro".', 'Os pedidos de impeachment de Lula são puro teatro da extrema-direita.', 'Entrevista após manifestações bolsonaristas na Paulista.', 'verified', false, '2024-10-08', 'https://g1.globo.com/politica/noticia/2024/10/08/padilha-impeachment-teatro.ghtml', 'news_article', 2, 'Brasília', 'Coletiva SRI', 'padilha-impeachment-teatro-b132-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão acusa governo de "fragilidade institucional" com ministros.', 'Esse governo tem fragilidade institucional, ministros despreparados.', 'Discurso como senador em sessão de debate sobre Orçamento.', 'verified', false, '2024-09-12', 'https://www.poder360.com.br/congresso/mourao-fragilidade-institucional/', 'news_article', 1, 'Senado Federal', 'Sessão plenária', 'mourao-fragilidade-institucional-b132-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro pede cassação de Lula por "descumprir acordão".', 'Lula tem que ser cassado por descumprir acordão do STF sobre Lava Jato.', 'Entrevista em Curitiba em evento do Podemos.', 'verified', false, '2024-07-28', 'https://www.metropoles.com/brasil/politica-br/moro-cassacao-lula-acordao', 'news_article', 3, 'Curitiba', 'Evento Podemos', 'moro-cassacao-lula-b132-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones cobra STF em vídeo viral contra impunidade de Bolsonaro.', 'STF, prenda o Bolsonaro de uma vez, já chega de protelação!', 'Vídeo no TikTok com mais de 15 milhões de visualizações.', 'verified', true, '2024-11-15', 'https://www1.folha.uol.com.br/poder/2024/11/janones-stf-prenda-bolsonaro.shtml', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'janones-stf-prenda-bolsonaro-b132-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi rebate Ciro Gomes chamando-o de "mágoa permanente".', 'O Ciro virou mágoa permanente, não supera ter perdido para Lula.', 'Coletiva em resposta a podcast de Ciro.', 'verified', false, '2024-10-15', 'https://g1.globo.com/politica/noticia/2024/10/15/gleisi-ciro-magoa-permanente.ghtml', 'news_article', 2, 'Brasília', 'Coletiva PT', 'gleisi-ciro-magoa-b132-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral critica Lula e Bolsonaro como "falsa polarização".', 'A polarização entre Lula e Bolsonaro é falsa, o Brasil precisa de nova política.', 'Lançamento de pré-candidatura em SP pelo PSB.', 'verified', true, '2024-12-05', 'https://noticias.uol.com.br/politica/2024/12/05/tabata-falsa-polarizacao.htm', 'news_article', 1, 'São Paulo', 'Lançamento pré-candidatura', 'tabata-falsa-polarizacao-b132-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

END $$;
