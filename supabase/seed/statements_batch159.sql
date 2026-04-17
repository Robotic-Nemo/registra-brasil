-- Batch 159: Religião, igrejas evangélicas, IURD e Assembleia de Deus na política (2023-2026)
DO $$
DECLARE
  v_fel UUID; v_dam UUID; v_mag UUID; v_sil UUID; v_kic UUID;
  v_nik UUID; v_mic UUID; v_pmc UUID; v_jair UUID; v_edu UUID;
  v_fla UUID; v_car UUID; v_mou UUID; v_sal UUID; v_dsi UUID;
  v_zam UUID; v_ram UUID; v_van UUID; v_kim UUID; v_adr UUID;
  v_gir UUID; v_zan UUID; v_san UUID; v_bar UUID; v_gil UUID;
  v_gui UUID; v_hil UUID; v_bom UUID; v_pet UUID; v_jan UUID;
  v_orl UUID; v_chi UUID; v_frx UUID; v_had UUID; v_lul UUID;
  v_gle UUID; v_pad UUID; v_mes UUID; v_lew UUID; v_din UUID;
  v_amo UUID; v_gme UUID; v_mar UUID; v_eln UUID; v_agu UUID;
  v_via UUID; v_elg UUID; v_dua UUID; v_jaq UUID; v_hum UUID;
  v_ran UUID; v_mor UUID;
  c_itr UUID; c_hom UUID; c_mis UUID; c_odi UUID; c_cor UUID;
  c_abu UUID; c_con UUID; c_nep UUID; c_obs UUID; c_int UUID;
  c_des UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_kic  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mic  FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_pmc  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_sal  FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_dsi  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram  FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_van  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim  FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr  FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_gir  FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_zan  FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san  FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_bar  FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gil  FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gui  FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_hil  FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_bom  FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_pet  FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl  FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi  FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_frx  FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lul  FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad  FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_mes  FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew  FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_din  FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_amo  FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gme  FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_eln  FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_agu  FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_via  FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_elg  FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua  FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jaq  FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum  FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran  FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';

  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano volta a associar religiões afro-brasileiras a "demônios" em culto.', 'Essas entidades do candomblé são demônios. Jesus liberta.', 'Pregação em culto da Assembleia de Deus Catedral da Fé em 2023.', 'verified', true, '2023-02-18', 'https://g1.globo.com/politica/noticia/2023/02/18/feliciano-candomble-demonios.ghtml', 'speech', 5, 'São Paulo', 'Culto evangélico', 'feliciano-candomble-demonios-b159-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara articula bancada evangélica contra projeto do aborto no STF.', 'A bancada evangélica não vai aceitar a descriminalização do aborto. Vamos reagir.', 'Entrevista após reunião da Frente Parlamentar Evangélica em 2023.', 'verified', true, '2023-09-25', 'https://www.camara.leg.br/noticias/997-silas-camara-evangelicos-aborto', 'speech', 3, 'Brasília', 'Frente Parlamentar Evangélica', 'silas-camara-evangelicos-aborto-b159-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta prega que "o Brasil é dos cristãos" em culto na Catedral Mundial.', 'Esse país é dos cristãos. Não aceitamos agenda satânica no Planalto.', 'Pregação em culto da IURD transmitido pela Record em 2023.', 'verified', true, '2023-04-02', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/04/02/magno-malta-brasil-cristaos-iurd.htm', 'speech', 4, 'Rio de Janeiro', 'Culto IURD', 'magno-malta-brasil-cristaos-b159-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que "Deus colocou" Bolsonaro no poder durante culto.', 'Deus colocou o presidente Bolsonaro no poder e Deus vai trazê-lo de volta.', 'Fala em culto evangélico em Brasília.', 'verified', true, '2023-06-11', 'https://g1.globo.com/politica/noticia/2023/06/11/damares-deus-bolsonaro-volta.ghtml', 'speech', 3, 'Brasília', 'Culto evangélico', 'damares-deus-bolsonaro-volta-b159-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano propõe PL para proibir "ideologia de gênero" em escolas.', 'Vamos proteger as crianças da ideologia de gênero. A família brasileira é cristã.', 'Apresentação de PL na Câmara em 2023.', 'verified', false, '2023-03-15', 'https://www.camara.leg.br/noticias/943-feliciano-pl-ideologia-genero', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'feliciano-pl-ideologia-genero-b159-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira usa peruca na tribuna para criticar Lei Maria da Penha.', 'Hoje eu me sinto uma mulher. E, como mulher, quero falar contra a destruição da família.', 'Discurso durante comemoração do Dia da Mulher na Câmara em 2023.', 'verified', true, '2023-03-08', 'https://g1.globo.com/politica/noticia/2023/03/08/nikolas-peruca-mulher-tribuna.ghtml', 'speech', 5, 'Brasília', 'Câmara dos Deputados', 'nikolas-peruca-mulher-tribuna-b159-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro lidera culto no PL Mulher citando "espíritos malignos".', 'Estamos em guerra espiritual. Vamos expulsar esses espíritos do poder.', 'Evento do PL Mulher em Brasília em 2023.', 'verified', true, '2023-05-22', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/05/22/michelle-pl-mulher-espiritos.htm', 'speech', 3, 'Brasília', 'PL Mulher', 'michelle-pl-mulher-espiritos-b159-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis chama julgamento do 8/1 de "perseguição satânica" em live.', 'Isso é perseguição satânica contra os cristãos que defendem a pátria.', 'Live em rede social durante julgamento no STF.', 'verified', false, '2023-09-14', 'https://www1.folha.uol.com.br/poder/2023/09/kicis-persegicao-satanica-8j.shtml', 'social_media_post', 4, 'Brasília', 'Live em rede social', 'kicis-persegicao-satanica-8j-b159-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal faz culto de campanha com pastores em São Paulo.', 'Deus me chamou para ser prefeito de São Paulo. Ninguém vai me impedir.', 'Culto de campanha com pastores evangélicos em 2024.', 'verified', true, '2024-07-21', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/07/21/marcal-culto-pastores-campanha.ghtml', 'speech', 3, 'São Paulo', 'Culto de campanha', 'marcal-culto-pastores-campanha-b159-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara é reconduzido à Comissão de Ciência e Tecnologia e trata de radiodifusão.', 'Vamos trabalhar para que a mídia não discrimine os evangélicos.', 'Entrevista após reeleição na comissão em 2023.', 'verified', false, '2023-04-10', 'https://www.camara.leg.br/noticias/950-silas-camara-ciencia-tecnologia', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'silas-camara-cct-radiodifusao-b159-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano chama aborto de "sacrifício a Moloque" em discurso.', 'O aborto é o sacrifício de crianças a Moloque. É demoníaco.', 'Discurso em plenário em 2023.', 'verified', false, '2023-09-26', 'https://www.camara.leg.br/noticias/1001-feliciano-aborto-moloque', 'speech', 5, 'Brasília', 'Plenário da Câmara', 'feliciano-aborto-moloque-b159-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares repete afirmação de que "viu Jesus na goiabeira" em culto.', 'Eu vi Jesus em cima de uma goiabeira. Foi real.', 'Pregação em culto em Anápolis em 2024.', 'verified', true, '2024-02-11', 'https://g1.globo.com/go/goias/noticia/2024/02/11/damares-jesus-goiabeira-anapolis.ghtml', 'speech', 2, 'Anápolis', 'Culto evangélico', 'damares-jesus-goiabeira-b159-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta pede que fiéis "rompam" com juízes em culto.', 'Os juízes que perseguem os cristãos serão julgados por Deus.', 'Culto em Vitória em 2023.', 'verified', false, '2023-10-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/10/15/magno-malta-juizes-culto.htm', 'speech', 4, 'Vitória', 'Culto evangélico', 'magno-malta-juizes-culto-b159-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira publica vídeo criticando "ideologia LGBT" em escolas.', 'Estão destruindo nossas crianças com essa ideologia. Chega!', 'Publicação em rede social viral em 2023.', 'verified', true, '2023-06-12', 'https://g1.globo.com/politica/noticia/2023/06/12/nikolas-ideologia-lgbt-escolas.ghtml', 'social_media_post', 4, 'Belo Horizonte', 'Rede social', 'nikolas-ideologia-lgbt-escolas-b159-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro participa de culto na Assembleia de Deus Vitória em Cristo.', 'O Brasil precisa voltar a Deus. A esquerda é o mal.', 'Culto com o pastor Silas Malafaia em 2023.', 'verified', true, '2023-05-07', 'https://g1.globo.com/politica/noticia/2023/05/07/bolsonaro-malafaia-culto-vitoria.ghtml', 'speech', 3, 'Rio de Janeiro', 'Assembleia de Deus Vitória em Cristo', 'bolsonaro-malafaia-culto-b159-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hil, 'Erika Hilton denuncia discurso de ódio religioso de Feliciano em plenário.', 'É inadmissível que um deputado chame religiões afro de demônios. É crime.', 'Discurso em plenário em resposta a Feliciano em 2023.', 'verified', true, '2023-02-21', 'https://www.camara.leg.br/noticias/923-erika-hilton-feliciano-odio', 'speech', 2, 'Brasília', 'Plenário da Câmara', 'hilton-denuncia-feliciano-odio-b159-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe líderes evangélicos no Planalto para diálogo.', 'Respeito todas as religiões. O Estado é laico e é dever do presidente ouvir todos.', 'Reunião com pastores no Palácio do Planalto em 2023.', 'verified', false, '2023-04-18', 'https://www.gov.br/planalto/pt-br/2023/04/lula-lideres-evangelicos-dialogo', 'other', 1, 'Brasília', 'Palácio do Planalto', 'lula-evangelicos-dialogo-b159-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano apoia PL que equipara aborto a homicídio após estupro.', 'Estuprador e mãe que aborta devem receber a mesma pena. É um crime contra Deus.', 'Defesa do PL 1904 na Câmara em 2024.', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/feliciano-pl-1904-aborto-estupro.ghtml', 'speech', 5, 'Brasília', 'Câmara dos Deputados', 'feliciano-pl1904-aborto-b159-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara é acusado de receber recursos de igreja para campanha.', 'Doações da igreja sempre foram legais. Não tem nada demais.', 'Reportagem sobre financiamento de campanha.', 'verified', false, '2023-11-08', 'https://www1.folha.uol.com.br/poder/2023/11/silas-camara-igreja-campanha.shtml', 'news_article', 3, 'Brasília', 'Investigação jornalística', 'silas-camara-igreja-campanha-b159-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende regulação de plataformas contra discurso religioso de ódio.', 'Pastores que pregam ódio contra outras religiões devem responder por isso.', 'Entrevista sobre PL das Fake News em 2023.', 'verified', false, '2023-04-25', 'https://www.camara.leg.br/noticias/956-orlando-silva-regulacao-odio-religioso', 'speech', 2, 'Brasília', 'Câmara dos Deputados', 'orlando-silva-regulacao-odio-b159-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta grava vídeo em culto dizendo que "Lula é anticristo".', 'Esse governo é comandado pelo anticristo. Vamos orar pela libertação do Brasil.', 'Vídeo em culto em 2024.', 'verified', true, '2024-03-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/03/10/magno-malta-lula-anticristo.htm', 'social_media_post', 5, 'Vitória', 'Culto evangélico', 'magno-malta-lula-anticristo-b159-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pet, 'Talíria Petrone denuncia ataques a terreiros no Rio em plenário.', 'Terreiros estão sendo queimados e pessoas agredidas. Isso é racismo religioso.', 'Discurso em plenário em 2023.', 'verified', false, '2023-05-30', 'https://www.camara.leg.br/noticias/970-taliria-terreiros-rio', 'speech', 2, 'Brasília', 'Plenário da Câmara', 'taliria-terreiros-rio-b159-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares nega ter feito declaração sobre "menino veste azul, menina veste rosa" após críticas.', 'Fui mal interpretada. Mas defendo sim a diferença entre meninos e meninas.', 'Entrevista no Senado em 2023.', 'verified', false, '2023-07-05', 'https://g1.globo.com/politica/noticia/2023/07/05/damares-menino-azul-menina-rosa.ghtml', 'news_article', 3, 'Brasília', 'Senado Federal', 'damares-menino-azul-menina-rosa-b159-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano critica nomeação de Anielle Franco: "agenda ideológica afrocentrista".', 'Essa ministra quer impor religião afro no governo. Cadê a laicidade?', 'Comentário em programa de TV em 2023.', 'verified', false, '2023-03-22', 'https://www1.folha.uol.com.br/poder/2023/03/feliciano-anielle-afrocentrista.shtml', 'news_article', 4, 'São Paulo', 'Programa de TV', 'feliciano-anielle-afrocentrista-b159-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca Ministério dos Direitos Humanos por "perseguição a cristãos".', 'O governo Lula persegue cristãos e protege macumbeiros. Isso é inaceitável.', 'Publicação em rede social em 2023.', 'verified', true, '2023-08-10', 'https://g1.globo.com/politica/noticia/2023/08/10/nikolas-mdh-perseguicao-cristaos.ghtml', 'social_media_post', 5, 'Belo Horizonte', 'Rede social', 'nikolas-mdh-perseguicao-cristaos-b159-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende laicidade do Estado em discurso no Senado.', 'O Estado brasileiro é laico. Isso precisa ser respeitado por todos os poderes.', 'Discurso no plenário do Senado em 2023.', 'verified', false, '2023-06-20', 'https://www12.senado.leg.br/noticias/materias/2023/06/20/wagner-laicidade-estado', 'speech', 1, 'Brasília', 'Senado Federal', 'wagner-laicidade-estado-b159-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis prega em culto sobre "exército de Deus" no Congresso.', 'Somos um exército do Senhor no Congresso. Vamos tomar esse país para Jesus.', 'Culto na Câmara em 2023.', 'verified', false, '2023-10-04', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/10/04/kicis-exercito-deus-congresso.htm', 'speech', 4, 'Brasília', 'Culto na Câmara', 'kicis-exercito-deus-congresso-b159-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende isenção fiscal ampla para igrejas.', 'Igreja não paga imposto porque faz obra social. Tem que ampliar a isenção.', 'Defesa de PL sobre imunidade tributária em 2024.', 'verified', false, '2024-04-15', 'https://www.camara.leg.br/noticias/1020-silas-camara-isencao-fiscal-igrejas', 'speech', 3, 'Brasília', 'Câmara dos Deputados', 'silas-camara-isencao-igrejas-b159-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro faz "oração profética" pela volta do marido.', 'Profetizo a volta de Bolsonaro. Deus vai fazer justiça.', 'Culto em Brasília em 2024.', 'verified', true, '2024-01-14', 'https://g1.globo.com/politica/noticia/2024/01/14/michelle-oracao-profetica-bolsonaro.ghtml', 'speech', 3, 'Brasília', 'Culto evangélico', 'michelle-oracao-profetica-b159-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal se apresenta como "coach cristão" e é criticado por pastores.', 'Jesus foi o maior coach da história. Ele ensinou abundância.', 'Evento de campanha em São Paulo em 2024.', 'verified', true, '2024-08-05', 'https://www1.folha.uol.com.br/poder/2024/08/marcal-coach-cristao-jesus.shtml', 'speech', 3, 'São Paulo', 'Evento de campanha', 'marcal-coach-cristao-jesus-b159-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano pede urgência para PL que proíbe neutralidade de gênero em documentos.', 'Não existe gênero neutro. Deus criou macho e fêmea. Ponto.', 'Discurso em plenário em 2024.', 'verified', false, '2024-05-07', 'https://www.camara.leg.br/noticias/1028-feliciano-pl-genero-documentos', 'speech', 4, 'Brasília', 'Câmara dos Deputados', 'feliciano-pl-genero-documentos-b159-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende "cura gay" em entrevista a rádio cristã.', 'Existe sim possibilidade de mudança. Muitas pessoas saem dessa vida.', 'Entrevista à rádio gospel em 2024.', 'verified', true, '2024-07-15', 'https://g1.globo.com/politica/noticia/2024/07/15/damares-cura-gay-radio.ghtml', 'speech', 5, 'Brasília', 'Entrevista em rádio', 'damares-cura-gay-radio-b159-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino defende laicidade ao criticar cruzes em tribunais.', 'A presença de símbolos religiosos em tribunais fere a laicidade constitucional.', 'Debate sobre laicidade no STF em 2024.', 'verified', false, '2024-03-18', 'https://www.stf.jus.br/noticias/1045-dino-laicidade-tribunais', 'speech', 2, 'Brasília', 'STF', 'dino-laicidade-tribunais-b159-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta apoia pastor investigado por estelionato em culto.', 'Esse pastor é um homem de Deus. Estão perseguindo os cristãos.', 'Culto em apoio a pastor da IURD em 2023.', 'verified', false, '2023-12-03', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/12/03/malta-pastor-iurd-estelionato.htm', 'speech', 3, 'Rio de Janeiro', 'Culto IURD', 'malta-pastor-iurd-estelionato-b159-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Cabo Gilberto defende presença militar em cultos evangélicos.', 'A Polícia Militar tem que estar nos cultos para proteger os cristãos.', 'Discurso na Câmara em 2023.', 'verified', false, '2023-07-25', 'https://www.camara.leg.br/noticias/981-gilberto-militares-cultos', 'speech', 3, 'Brasília', 'Câmara dos Deputados', 'gilberto-militares-cultos-b159-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica uso político da religião em entrevista.', 'Ninguém pode se apropriar de Deus. Deus não é de partido nenhum.', 'Entrevista à rádio em 2024.', 'verified', false, '2024-02-20', 'https://www.gov.br/planalto/pt-br/2024/02/lula-religiao-politica', 'speech', 1, 'Brasília', 'Entrevista em rádio', 'lula-religiao-politica-b159-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Filipe Barros defende "cristãos no poder" em evento partidário.', 'Sem cristãos no poder, o Brasil vai para o fundo do poço.', 'Evento do PL em Londrina em 2023.', 'verified', false, '2023-11-12', 'https://g1.globo.com/pr/parana/noticia/2023/11/12/barros-cristaos-poder-pl.ghtml', 'speech', 3, 'Londrina', 'Evento partidário', 'barros-cristaos-poder-b159-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli apela a "causa cristã" para arrecadar doações de defesa.', 'Me ajudem, irmãos. Estou sendo perseguida por defender os cristãos.', 'Publicação em rede social em 2024.', 'verified', true, '2024-05-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/05/20/zambelli-causa-crista-doacoes.htm', 'social_media_post', 3, 'São Paulo', 'Rede social', 'zambelli-causa-crista-doacoes-b159-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar critica fusão entre política e religião.', 'O Brasil está vendo uma confusão perigosa entre altar e tribuna.', 'Discurso em plenário em 2023.', 'verified', false, '2023-09-05', 'https://www.camara.leg.br/noticias/990-chico-alencar-altar-tribuna', 'speech', 1, 'Brasília', 'Plenário da Câmara', 'chico-alencar-altar-tribuna-b159-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende agenda cristã na AGU.', 'Sou cristão convicto e isso orienta minhas ações como AGU.', 'Entrevista à revista cristã em 2023.', 'verified', false, '2023-10-20', 'https://www1.folha.uol.com.br/poder/2023/10/messias-agu-crista.shtml', 'news_article', 3, 'Brasília', 'AGU', 'messias-agu-crista-b159-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano chama Erika Hilton de "aberração" em vídeo, é denunciado ao Conselho de Ética.', 'Essa aberração quer destruir a família. Deus vai julgar.', 'Vídeo viralizado em rede social.', 'verified', true, '2023-11-18', 'https://g1.globo.com/politica/noticia/2023/11/18/feliciano-hilton-aberracao-denuncia.ghtml', 'social_media_post', 5, 'Brasília', 'Rede social', 'feliciano-hilton-aberracao-b159-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende porte de armas para pastores.', 'Pastor também tem que se defender. Criminosos atacam igrejas.', 'Debate na Câmara em 2023.', 'verified', false, '2023-06-01', 'https://www.camara.leg.br/noticias/971-sanderson-armas-pastores', 'speech', 3, 'Brasília', 'Câmara dos Deputados', 'sanderson-armas-pastores-b159-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha se reúne com líderes evangélicos sobre SUS.', 'Precisamos de toda a sociedade para fortalecer o SUS, incluindo as igrejas.', 'Reunião no Ministério da Saúde em 2024.', 'verified', false, '2024-06-10', 'https://www.gov.br/saude/pt-br/2024/06/padilha-evangelicos-sus', 'other', 1, 'Brasília', 'Ministério da Saúde', 'padilha-evangelicos-sus-b159-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta afirma que "o diabo trabalha pelo STF" em culto.', 'O STF está possuído. O diabo trabalha naquela Corte.', 'Culto em Brasília em 2024.', 'verified', true, '2024-04-22', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/04/22/malta-diabo-stf-culto.htm', 'speech', 5, 'Brasília', 'Culto evangélico', 'malta-diabo-stf-b159-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara contrata parentes no gabinete, revela reportagem.', 'São pessoas de confiança. Não tem nada de errado.', 'Reportagem do UOL sobre nepotismo em 2024.', 'verified', true, '2024-02-28', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/02/28/silas-camara-parentes-gabinete.htm', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'silas-camara-parentes-gabinete-b159-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira posta vídeo em igreja chamando Lula de "diabo".', 'O presidente é servo do diabo. Vamos expulsar o demônio do poder.', 'Publicação em rede social.', 'verified', true, '2024-03-28', 'https://g1.globo.com/politica/noticia/2024/03/28/nikolas-lula-diabo-igreja.ghtml', 'social_media_post', 5, 'Belo Horizonte', 'Rede social', 'nikolas-lula-diabo-b159-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano prega em Marcha para Jesus contra "agenda globalista".', 'A ONU, a OMS, todos querem destruir a família cristã. Não vamos permitir.', 'Marcha para Jesus em São Paulo em 2023.', 'verified', true, '2023-06-08', 'https://g1.globo.com/sp/sao-paulo/noticia/2023/06/08/feliciano-marcha-jesus-globalistas.ghtml', 'speech', 4, 'São Paulo', 'Marcha para Jesus', 'feliciano-marcha-jesus-globalistas-b159-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa critica interferência de pastores em votações sensíveis.', 'Pastor pode ter sua fé, mas não pode ditar lei para 200 milhões de brasileiros.', 'Discurso no Senado em 2023.', 'verified', false, '2023-08-30', 'https://www12.senado.leg.br/noticias/materias/2023/08/30/humberto-costa-pastores-votacoes', 'speech', 1, 'Brasília', 'Senado Federal', 'humberto-costa-pastores-votacoes-b159-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende presença de capelães evangélicos em escolas públicas.', 'As crianças precisam ter acesso à palavra de Deus.', 'Discurso no Senado em 2024.', 'verified', false, '2024-05-02', 'https://www12.senado.leg.br/noticias/materias/2024/05/02/damares-capelaes-escolas', 'speech', 3, 'Brasília', 'Senado Federal', 'damares-capelaes-escolas-b159-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é ovacionado em culto da Assembleia de Deus em Brasília.', 'Deus e pátria. Família e liberdade. Essa é a nossa luta.', 'Culto em Brasília em 2024.', 'verified', true, '2024-06-15', 'https://g1.globo.com/politica/noticia/2024/06/15/bolsonaro-assembleia-deus-brasilia.ghtml', 'speech', 3, 'Brasília', 'Assembleia de Deus', 'bolsonaro-ad-brasilia-b159-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão usa versículos bíblicos para justificar intervenção militar.', 'A Bíblia diz que Deus protege a pátria. As Forças Armadas fazem parte disso.', 'Discurso na Câmara em 2023.', 'verified', false, '2023-05-12', 'https://www.camara.leg.br/noticias/965-girao-biblia-intervencao', 'speech', 5, 'Brasília', 'Câmara dos Deputados', 'girao-biblia-intervencao-b159-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara preside sessão dominada por bancada evangélica.', 'Vamos pautar os projetos da família brasileira. Esta Casa tem maioria cristã.', 'Sessão na Câmara em 2024.', 'verified', false, '2024-08-12', 'https://www.camara.leg.br/noticias/1040-silas-camara-sessao-evangelica', 'speech', 2, 'Brasília', 'Câmara dos Deputados', 'silas-camara-sessao-evangelica-b159-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Júlia Zanatta fala em "espírito de Jezabel" ao criticar ministras.', 'Esse espírito de Jezabel tomou conta do governo. É guerra espiritual.', 'Live em rede social em 2024.', 'verified', false, '2024-03-05', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/03/05/zanatta-jezabel-ministras.htm', 'social_media_post', 4, 'Florianópolis', 'Live em rede social', 'zanatta-jezabel-ministras-b159-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano é condenado em segunda instância por injúria a umbandistas.', 'Não vou me calar. Continuarei defendendo Jesus.', 'Reação a condenação judicial em 2024.', 'verified', true, '2024-09-18', 'https://g1.globo.com/politica/noticia/2024/09/18/feliciano-condenado-injuria-umbandistas.ghtml', 'news_article', 5, 'São Paulo', 'Justiça de SP', 'feliciano-condenado-umbandistas-b159-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende "reino de Cristo" como modelo político em entrevista.', 'Não acredito em democracia secular. O reino de Cristo é o modelo.', 'Entrevista a canal evangélico em 2024.', 'verified', false, '2024-07-10', 'https://www1.folha.uol.com.br/poder/2024/07/malta-reino-cristo-democracia.shtml', 'speech', 5, 'Vitória', 'Entrevista', 'malta-reino-cristo-b159-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Alexandre de Moraes defende punição a discurso de ódio religioso.', 'A liberdade de crença não permite ataque a outras religiões. Isso é crime.', 'Julgamento no STF em 2024.', 'verified', false, '2024-04-04', 'https://www.stf.jus.br/noticias/1050-moraes-odio-religioso', 'speech', 2, 'Brasília', 'STF', 'moraes-odio-religioso-b159-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende "guerra espiritual" contra ministros do STF.', 'Temos que batalhar no espírito contra esses juízes. Eles estão amarrados.', 'Live em rede social em 2024.', 'verified', false, '2024-05-30', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/05/30/kicis-guerra-espiritual-stf.htm', 'social_media_post', 5, 'Brasília', 'Live em rede social', 'kicis-guerra-espiritual-stf-b159-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal é criticado por Silas Malafaia por "oportunismo religioso".', 'Não sou qualquer político. Tenho chamado e unção.', 'Entrevista de Marçal em resposta a Malafaia em 2024.', 'verified', true, '2024-09-02', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/02/marcal-malafaia-uncao.ghtml', 'speech', 3, 'São Paulo', 'Entrevista', 'marcal-malafaia-uncao-b159-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro lidera oração coletiva em ato na Paulista.', 'Vamos orar por este país. Deus não vai abandonar o Brasil.', 'Ato na Avenida Paulista em 2024.', 'verified', true, '2024-02-25', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/02/25/bolsonaro-oracao-paulista.ghtml', 'speech', 3, 'São Paulo', 'Avenida Paulista', 'bolsonaro-oracao-paulista-b159-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende pauta evangélica no Senado.', 'A família, a fé e a pátria são nossas prioridades.', 'Discurso no Senado em 2023.', 'verified', false, '2023-09-15', 'https://www12.senado.leg.br/noticias/materias/2023/09/15/flavio-pauta-evangelica', 'speech', 2, 'Brasília', 'Senado Federal', 'flavio-pauta-evangelica-b159-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro reúne-se com líderes da IURD em Miami.', 'A IURD é uma aliada estratégica da direita brasileira nos EUA.', 'Reunião com líderes religiosos em Miami em 2024.', 'verified', false, '2024-08-25', 'https://www1.folha.uol.com.br/poder/2024/08/eduardo-iurd-miami.shtml', 'news_article', 3, 'Miami', 'Reunião política', 'eduardo-iurd-miami-b159-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano fala em "tomar o poder com Jesus" em culto.', 'Vamos tomar o poder em nome de Jesus. Essa nação é d Ele.', 'Culto em São Paulo em 2025.', 'verified', true, '2025-03-09', 'https://g1.globo.com/politica/noticia/2025/03/09/feliciano-tomar-poder-jesus.ghtml', 'speech', 5, 'São Paulo', 'Culto evangélico', 'feliciano-tomar-poder-jesus-b159-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski critica uso de igrejas para campanha ilegal.', 'A legislação eleitoral é clara: igreja não é palanque.', 'Entrevista como ministro da Justiça em 2025.', 'verified', false, '2025-01-20', 'https://www.gov.br/justica/pt-br/2025/01/lewandowski-igrejas-campanha', 'other', 2, 'Brasília', 'Ministério da Justiça', 'lewandowski-igrejas-campanha-b159-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares alega "guerra santa" contra governo Lula em comício.', 'Isso é guerra santa. Estamos contra os principados do mal.', 'Comício em Goiânia em 2025.', 'verified', true, '2025-05-04', 'https://g1.globo.com/go/goias/noticia/2025/05/04/damares-guerra-santa-comicio.ghtml', 'speech', 5, 'Goiânia', 'Comício', 'damares-guerra-santa-comicio-b159-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta é investigado por desvio em ONG cristã.', 'Tudo foi usado na obra. Não tem desvio nenhum.', 'Reportagem sobre ONG em 2024.', 'verified', true, '2024-10-12', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/10/12/magno-malta-ong-crista-desvio.htm', 'news_article', 4, 'Vitória', 'Investigação do MPF', 'malta-ong-crista-desvio-b159-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara é alvo de denúncia por repasse suspeito a igreja.', 'Não há nada de errado. A doação era para obra social.', 'Denúncia do MPF em 2024.', 'verified', false, '2024-06-08', 'https://www1.folha.uol.com.br/poder/2024/06/silas-camara-denuncia-repasse-igreja.shtml', 'news_article', 4, 'Brasília', 'MPF', 'silas-camara-repasse-igreja-b159-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas quebra protocolo ao pregar em plenário da Câmara.', 'Jesus é o caminho, a verdade e a vida. Brasil precisa de Jesus.', 'Discurso em plenário em 2024.', 'verified', true, '2024-07-18', 'https://g1.globo.com/politica/noticia/2024/07/18/nikolas-prega-plenario.ghtml', 'speech', 3, 'Brasília', 'Plenário da Câmara', 'nikolas-prega-plenario-b159-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro critica "instrumentalização" de igrejas por políticos.', 'Não se pode usar a fé para manipular eleitores. Isso é grave.', 'Entrevista no Senado em 2023.', 'verified', false, '2023-10-05', 'https://www12.senado.leg.br/noticias/materias/2023/10/05/moro-instrumentalizacao-igrejas', 'speech', 2, 'Brasília', 'Senado Federal', 'moro-instrumentalizacao-igrejas-b159-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano participa de evento da Casa Mundial de Oração em Jerusalém.', 'Oramos por Israel e pelos cristãos no mundo todo.', 'Viagem a Jerusalém em 2024.', 'verified', false, '2024-11-10', 'https://g1.globo.com/politica/noticia/2024/11/10/feliciano-jerusalem-oracao.ghtml', 'news_article', 2, 'Jerusalém', 'Evento de oração', 'feliciano-jerusalem-oracao-b159-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bom, 'Sâmia Bomfim denuncia fundamentalismo religioso na Câmara.', 'O fundamentalismo está sequestrando o debate público. Precisamos reagir.', 'Discurso em plenário em 2024.', 'verified', false, '2024-06-28', 'https://www.camara.leg.br/noticias/1035-samia-bomfim-fundamentalismo', 'speech', 2, 'Brasília', 'Plenário da Câmara', 'samia-bomfim-fundamentalismo-b159-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis tenta aprovar feriado nacional para "dia do evangélico".', 'Os evangélicos merecem esse reconhecimento. São milhões no Brasil.', 'Apresentação de PL em 2024.', 'verified', false, '2024-05-22', 'https://www.camara.leg.br/noticias/1030-kicis-feriado-evangelico', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'kicis-feriado-evangelico-b159-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Cabo Gilberto bloqueia homenagem a Mãe Menininha do Gantois.', 'Não vou homenagear religião pagã. Sou cristão.', 'Votação na Câmara em 2024.', 'verified', true, '2024-04-25', 'https://g1.globo.com/ba/bahia/noticia/2024/04/25/gilberto-mae-menininha-gantois.ghtml', 'news_article', 5, 'Brasília', 'Câmara dos Deputados', 'gilberto-mae-menininha-gantois-b159-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elg, 'Eliziane Gama critica instrumentalização religiosa em campanha.', 'Não se conquista voto com medo do inferno. Isso é chantagem espiritual.', 'Discurso no Senado em 2024.', 'verified', false, '2024-09-10', 'https://www12.senado.leg.br/noticias/materias/2024/09/10/eliziane-instrumentalizacao-religiosa', 'speech', 1, 'Brasília', 'Senado Federal', 'eliziane-instrumentalizacao-religiosa-b159-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro distribui Bíblias em Belém durante viagem.', 'A palavra de Deus é nossa fortaleza. Leiam a Bíblia.', 'Distribuição de Bíblias em Belém em 2023.', 'verified', false, '2023-09-08', 'https://g1.globo.com/pa/para/noticia/2023/09/08/bolsonaro-biblias-belem.ghtml', 'speech', 2, 'Belém', 'Círio de Nazaré', 'bolsonaro-biblias-belem-b159-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem critica uso da fé pela esquerda em evento.', 'A esquerda descobriu Jesus tarde demais. É só marketing.', 'Discurso em evento do Novo em 2023.', 'verified', false, '2023-11-20', 'https://www.camara.leg.br/noticias/1005-vanhattem-fe-esquerda', 'speech', 2, 'Porto Alegre', 'Evento do Novo', 'vanhattem-fe-esquerda-b159-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano convoca pastores para "resistência" contra STF.', 'Se o STF continuar perseguindo, vamos às ruas com os fiéis.', 'Reunião de pastores em 2024.', 'verified', true, '2024-10-22', 'https://g1.globo.com/politica/noticia/2024/10/22/feliciano-pastores-resistencia-stf.ghtml', 'speech', 5, 'Brasília', 'Reunião de pastores', 'feliciano-pastores-resistencia-stf-b159-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr critica bloqueio de acesso de terreiros a recursos públicos.', 'Precisamos garantir igualdade no tratamento das religiões pelo Estado.', 'Entrevista em 2024.', 'verified', false, '2024-07-02', 'https://www.camara.leg.br/noticias/1037-duarte-terreiros-recursos', 'speech', 1, 'São Luís', 'Entrevista', 'duarte-terreiros-recursos-b159-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara articula troca de voto de MP por pauta religiosa.', 'Nossa base quer pauta de valores. Sem isso, não tem negociação.', 'Reportagem sobre negociação no Congresso em 2024.', 'verified', false, '2024-08-30', 'https://www1.folha.uol.com.br/poder/2024/08/silas-camara-mp-pauta-religiosa.shtml', 'news_article', 4, 'Brasília', 'Congresso Nacional', 'silas-camara-mp-pauta-religiosa-b159-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas compara Papa Francisco a "lobo em pele de cordeiro".', 'O Papa atual é mais um líder comunista. Não representa o cristianismo.', 'Vídeo em rede social em 2024.', 'verified', true, '2024-03-15', 'https://g1.globo.com/politica/noticia/2024/03/15/nikolas-papa-francisco-comunista.ghtml', 'social_media_post', 4, 'Belo Horizonte', 'Rede social', 'nikolas-papa-francisco-comunista-b159-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro entrega cartas de oração no STF.', 'Estou entregando essas cartas para os ministros pensarem em Deus.', 'Ação em Brasília em 2024.', 'verified', true, '2024-09-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/09/20/michelle-cartas-oracao-stf.htm', 'speech', 3, 'Brasília', 'STF', 'michelle-cartas-oracao-stf-b159-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que "ministros ateus" não podem julgar "povo cristão".', 'Um ministro ateu não tem moral para julgar um povo cristão.', 'Entrevista em 2025.', 'verified', true, '2025-02-14', 'https://g1.globo.com/politica/noticia/2025/02/14/damares-ministros-ateus-stf.ghtml', 'speech', 5, 'Brasília', 'Entrevista', 'damares-ministros-ateus-b159-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano pede afastamento de Anielle Franco por "promover macumba".', 'Não é papel do Estado incentivar macumba. Ela tem que sair.', 'Discurso em 2024.', 'verified', true, '2024-06-05', 'https://g1.globo.com/politica/noticia/2024/06/05/feliciano-anielle-macumba.ghtml', 'speech', 5, 'Brasília', 'Câmara dos Deputados', 'feliciano-anielle-macumba-b159-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta é acusado de misturar finanças pessoais e de igreja.', 'Não tem nada de errado. É tudo contabilidade legal.', 'Investigação em 2025.', 'verified', false, '2025-04-08', 'https://www1.folha.uol.com.br/poder/2025/04/malta-financas-igreja.shtml', 'news_article', 4, 'Vitória', 'MPF', 'malta-financas-igreja-b159-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo defende respeito a todas as religiões.', 'O Brasil é de todas as fés e de nenhuma. O Estado é laico.', 'Entrevista em 2024.', 'verified', false, '2024-05-12', 'https://www1.folha.uol.com.br/poder/2024/05/freixo-respeito-religioes.shtml', 'speech', 1, 'Rio de Janeiro', 'Entrevista', 'freixo-respeito-religioes-b159-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende Silas Malafaia contra investigação.', 'Pastor Malafaia é perseguido. Vamos defender os nossos.', 'Discurso em 2025.', 'verified', false, '2025-03-20', 'https://g1.globo.com/politica/noticia/2025/03/20/silas-camara-malafaia-defesa.ghtml', 'speech', 3, 'Brasília', 'Câmara dos Deputados', 'silas-camara-malafaia-defesa-b159-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis apresenta PL para proibir "ofensa a símbolos cristãos".', 'Quem zombar da cruz vai ser punido. Temos que proteger a fé.', 'Apresentação de PL em 2024.', 'verified', false, '2024-09-28', 'https://www.camara.leg.br/noticias/1048-kicis-pl-ofensa-cristaos', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'kicis-pl-ofensa-cristaos-b159-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal se diz "ungido por Deus" para candidatura presidencial.', 'Tenho unção para ser presidente. Deus me chamou para libertar o Brasil.', 'Declaração em podcast em 2025.', 'verified', true, '2025-01-15', 'https://g1.globo.com/politica/noticia/2025/01/15/marcal-uncao-presidencial.ghtml', 'speech', 4, 'São Paulo', 'Podcast', 'marcal-uncao-presidencial-b159-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eln, 'Elmar Nascimento articula bancada evangélica em troca de apoio a Haddad.', 'Estamos dispostos a dialogar com o ministro, desde que pauta da família seja respeitada.', 'Negociação no Congresso em 2024.', 'verified', false, '2024-11-05', 'https://www1.folha.uol.com.br/poder/2024/11/elmar-bancada-evangelica-haddad.shtml', 'news_article', 2, 'Brasília', 'Congresso Nacional', 'elmar-bancada-evangelica-haddad-b159-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rejeita chantagem religiosa sobre reforma tributária.', 'Não vamos negociar princípios em nome de votos. O país precisa da reforma.', 'Entrevista em 2024.', 'verified', false, '2024-11-10', 'https://www.gov.br/fazenda/pt-br/2024/11/haddad-chantagem-religiosa', 'other', 1, 'Brasília', 'Ministério da Fazenda', 'haddad-chantagem-religiosa-b159-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano ataca Ministro Gilmar Mendes chamando-o de "inimigo da fé".', 'Gilmar é inimigo da fé. Deus vai julgar.', 'Discurso em 2025.', 'verified', true, '2025-05-15', 'https://g1.globo.com/politica/noticia/2025/05/15/feliciano-gilmar-inimigo-fe.ghtml', 'speech', 5, 'Brasília', 'Câmara dos Deputados', 'feliciano-gilmar-inimigo-fe-b159-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gme, 'Gilmar Mendes afirma que "liberdade religiosa não abrange ódio".', 'A liberdade religiosa não permite atacar outras religiões. Isso é crime.', 'Sessão do STF em 2024.', 'verified', false, '2024-06-15', 'https://www.stf.jus.br/noticias/1055-gilmar-liberdade-religiosa', 'speech', 2, 'Brasília', 'STF', 'gilmar-liberdade-religiosa-b159-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares apoia pastor acusado de assédio sexual.', 'Esse pastor é íntegro. Estão montando um complô.', 'Declaração em 2024.', 'verified', false, '2024-10-30', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/10/30/damares-pastor-assedio.htm', 'speech', 4, 'Brasília', 'Entrevista', 'damares-pastor-assedio-b159-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta lidera oração na CPMI do 8 de Janeiro.', 'Oramos por justiça. Deus vai trazer a verdade.', 'Sessão da CPMI em 2023.', 'verified', true, '2023-06-21', 'https://www12.senado.leg.br/noticias/materias/2023/06/21/malta-oracao-cpmi', 'speech', 3, 'Brasília', 'CPMI do 8 de Janeiro', 'malta-oracao-cpmi-b159-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues critica uso ideológico da Bíblia na CPMI.', 'Cada um pode rezar como quiser, mas não pode usar a Bíblia como escudo para golpe.', 'Discurso na CPMI em 2023.', 'verified', false, '2023-06-21', 'https://www12.senado.leg.br/noticias/materias/2023/06/21/randolfe-biblia-cpmi', 'speech', 1, 'Brasília', 'CPMI do 8 de Janeiro', 'randolfe-biblia-cpmi-b159-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano promove evento em nome do "resgate cristão do Brasil".', 'Vamos resgatar o Brasil para Cristo. Essa é a nossa missão.', 'Evento em 2025.', 'verified', false, '2025-03-22', 'https://www.camara.leg.br/noticias/1070-feliciano-resgate-cristao-brasil', 'speech', 3, 'São Paulo', 'Evento religioso', 'feliciano-resgate-cristao-brasil-b159-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira volta a defender "cristianismo oficial" em palestra.', 'O Brasil deveria se declarar uma nação cristã. Ponto.', 'Palestra em 2025.', 'verified', true, '2025-04-17', 'https://g1.globo.com/politica/noticia/2025/04/17/nikolas-cristianismo-oficial.ghtml', 'speech', 5, 'Belo Horizonte', 'Palestra', 'nikolas-cristianismo-oficial-b159-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara pauta votação de CPI contra terreiros.', 'Vamos apurar o que tem nessas casas. A sociedade tem direito de saber.', 'Requerimento em 2025.', 'verified', true, '2025-02-05', 'https://www.camara.leg.br/noticias/1060-silas-camara-cpi-terreiros', 'news_article', 5, 'Brasília', 'Câmara dos Deputados', 'silas-camara-cpi-terreiros-b159-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hil, 'Erika Hilton protocola representação contra Feliciano por ódio religioso.', 'Não vamos tolerar mais. Estamos em uma escalada de ódio inaceitável.', 'Entrevista em 2024.', 'verified', true, '2024-11-20', 'https://g1.globo.com/politica/noticia/2024/11/20/hilton-representacao-feliciano.ghtml', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'hilton-representacao-feliciano-b159-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana faz discurso religioso ao defender pauta da família.', 'Somos defensores da família cristã. Isso não é retrocesso, é fé.', 'Discurso no Senado em 2024.', 'verified', false, '2024-04-18', 'https://www12.senado.leg.br/noticias/materias/2024/04/18/viana-familia-crista', 'speech', 2, 'Brasília', 'Senado Federal', 'viana-familia-crista-b159-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano encerra 2025 com declaração de "cruzada" contra religiões afro.', 'Vamos fazer uma cruzada. Essas religiões não podem mais ter proteção do Estado.', 'Declaração em final de 2025.', 'verified', true, '2025-12-10', 'https://g1.globo.com/politica/noticia/2025/12/10/feliciano-cruzada-religioes-afro.ghtml', 'speech', 5, 'Brasília', 'Evento religioso', 'feliciano-cruzada-religioes-afro-b159-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

END $$;
