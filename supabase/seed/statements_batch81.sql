-- Batch 81: Evangelical caucus & religious politics — Part 2
-- Focus: Universal/IURD, prosperity theology, CPMI INSS igrejas, Padre Fábio de Melo,
-- religious freedom debates, abortion/LGBTQ+ opposition, Lula-evangelical tensions
-- Jan 2023 – Apr 2026
-- 100 statements
DO $$
DECLARE
  v_mfe UUID; v_dam UUID; v_mag UUID; v_sil UUID; v_bia UUID;
  v_nik UUID; v_mic UUID; v_pab UUID; v_zan UUID; v_amd UUID;
  v_mou UUID; v_edu UUID; v_fla UUID; v_jair UUID; v_gir UUID;
  v_jul UUID; v_san UUID; v_fil UUID; v_cgi UUID; v_mej UUID;
  v_esp UUID; v_lul UUID; v_gle UUID; v_sog UUID; v_ani UUID;
  v_car UUID; v_eri UUID; v_sam UUID; v_jaf UUID; v_orl UUID;
  v_chi UUID; v_tal UUID; v_fer UUID; v_bou UUID;
  c_int UUID; c_hom UUID; c_mis UUID; c_odi UUID; c_mac UUID;
  c_des UUID; c_neg UUID; c_con UUID; c_abu UUID; c_nep UUID;
  c_cor UUID;
BEGIN
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_amd FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fil FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_mej FROM politicians WHERE slug = 'mecias-de-jesus';
  SELECT id INTO v_esp FROM politicians WHERE slug = 'esperidiao-amin';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_sog FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_jaf FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fer FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';

  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara admite na CPMI do INSS receber dízimos como "salário pastoral" além da verba parlamentar.', 'Meu salário pastoral é pago pela igreja e não se mistura com a verba parlamentar. Dízimo é do dízimista, não do Congresso.', 'Depoimento na CPMI do INSS respondendo a questionamentos sobre patrimônio.', 'verified', true, '2025-09-24', 'https://www.oglobo.globo.com/politica/silas-camara-cpmi-inss-dizimo-salario-pastoral.ghtml', 'news_article', 3, 'Senado Federal', 'CPMI do INSS', 'silas-camara-dizimo-salario-b81-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano chama Padre Fábio de Melo de "padre da esquerda" após postagem pró-LGBT.', 'Esse Fábio de Melo virou padre da esquerda. Defende casamento gay, apoia Lula. Cadê a fidelidade à Roma?', 'Post no X reagindo a vídeo de Fábio de Melo sobre acolhimento LGBT.', 'verified', false, '2024-06-18', 'https://www.revistaoeste.com/politica/feliciano-padre-fabio-de-melo-esquerda/', 'social_media_post', 3, 'Redes sociais', 'Post no X', 'feliciano-padre-fabio-esquerda-b81-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que STF "tenta impor agenda globalista de aborto".', 'O STF está tentando impor uma agenda globalista de aborto no Brasil, contrariando a vontade do povo e a palavra de Deus.', 'Discurso no Senado após STF incluir pauta do aborto.', 'verified', true, '2024-09-24', 'https://www12.senado.leg.br/noticias/materias/2024/09/24/damares-stf-aborto-globalista', 'news_article', 4, 'Senado Federal', 'Plenário — pauta do aborto no STF', 'damares-stf-aborto-globalista-b81-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama deputados do PSOL de "endemoninhados" em sessão plenária.', 'Esses deputados do PSOL são endemoninhados, literalmente. Só quem está dominado pelas trevas defende aborto e droga.', 'Discurso no Senado em debate sobre drogas.', 'verified', true, '2024-06-27', 'https://www.gospelmais.com.br/magno-malta-psol-endemoninhados-2024.html', 'news_article', 5, 'Senado Federal', 'Plenário', 'magno-malta-psol-endemoninhados-b81-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis propõe tornar "Marcha para Jesus" feriado nacional.', 'A Marcha para Jesus merece ser feriado nacional. É o Brasil se curvando a Cristo, e o Brasil é cristão, queiram ou não.', 'Apresentação de PL na Câmara.', 'verified', false, '2024-05-31', 'https://www.camara.leg.br/noticias/1045987-bia-kicis-marcha-jesus-feriado', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'bia-kicis-marcha-feriado-b81-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas declara que "evangélico verdadeiro não vota em PT".', 'Evangélico verdadeiro não vota em PT. Simples assim. Quem vota em PT ou está enganado ou mentiu pra Deus.', 'Live em seu canal do YouTube.', 'verified', true, '2024-08-17', 'https://www.gospelmais.com.br/nikolas-evangelico-nao-vota-pt.html', 'social_media_post', 4, 'Internet', 'Live no YouTube', 'nikolas-evangelico-nao-pt-b81-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle faz culto em Brasília antes de votação sobre Bolsonaro.', 'Convocamos as mulheres cristãs a vigiarem em oração enquanto o Senado decide. A Palavra diz: orai sem cessar.', 'Culto organizado na véspera de votação no Senado.', 'verified', true, '2025-09-10', 'https://www.plenonews.com/politica/michelle-culto-vespera-votacao-senado/', 'news_article', 3, 'Brasília', 'Culto véspera da votação', 'michelle-vigilia-votacao-b81-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal aparece em TV evangélica prometendo "cura física" pela fé.', 'Eu vi cegos voltarem a enxergar em meus eventos. É a fé, é a unção. Deus se move quando tem fé.', 'Participação em programa da TV Gospel Century.', 'disputed', true, '2024-08-30', 'https://www.uol.com.br/eleicoes/2024/08/marcal-cura-fisica-tv-gospel.htm', 'news_article', 4, 'São Paulo', 'TV Gospel Century', 'marcal-cura-fisica-tv-b81-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amd, 'André Mendonça diz em pregação que "nunca vai votar contra a família".', 'Eu sou juiz, mas antes disso sou servo de Deus. Nunca vou votar contra a família, nunca vou votar a favor do aborto.', 'Pregação em culto na Assembleia de Deus de Brasília.', 'verified', true, '2023-04-30', 'https://www.gospelmais.com.br/mendonca-nunca-votar-contra-familia.html', 'news_article', 4, 'Brasília', 'Culto AD Brasília', 'mendonca-nunca-contra-familia-b81-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "fé de político é privada" ao comentar André Mendonça.', 'A fé do ministro é dele, mas a decisão no tribunal precisa ser técnica, imparcial. Se não, a gente vira teocracia.', 'Entrevista rádio.', 'verified', false, '2023-05-02', 'https://www1.folha.uol.com.br/poder/2023/05/lula-mendonca-fe-privada.shtml', 'news_article', 1, 'Brasília', 'Rádio CBN', 'lula-mendonca-fe-privada-b81-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano diz que "religião afro não é brasileira" em culto em Recife.', 'Essa religião afro não é brasileira, é importada da África, e não tem a mesma dignidade do cristianismo que fundou esta nação.', 'Culto em Recife na Catedral do Avivamento local.', 'verified', true, '2024-02-11', 'https://www1.folha.uol.com.br/cotidiano/2024/02/feliciano-religiao-afro-recife.shtml', 'news_article', 5, 'Recife', 'Catedral do Avivamento — Recife', 'feliciano-religiao-afro-recife-b81-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco anuncia pacote de proteção a terreiros após ataques.', 'Estamos lançando pacote nacional de proteção a terreiros. Ninguém pode ser atacado por sua fé neste país.', 'Coletiva no Ministério da Igualdade Racial.', 'verified', true, '2024-05-21', 'https://www.oglobo.globo.com/politica/anielle-franco-pacote-terreiros-protecao-2024.ghtml', 'news_article', 1, 'Brasília', 'Ministério da Igualdade Racial', 'anielle-pacote-terreiros-b81-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta vincula crimes violentos a "ausência de Cristo nas escolas".', 'Enquanto não tiver Cristo nas escolas, vai ter sangue nas ruas. É simples assim. Tirem a Bíblia, colham violência.', 'Entrevista à rádio gospel em Vitória.', 'verified', false, '2023-04-07', 'https://www.gospelmais.com.br/magno-malta-cristo-escolas-violencia.html', 'news_article', 4, 'Vitória (ES)', 'Rádio gospel ES', 'magno-malta-cristo-escolas-b81-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara articula bancada evangélica contra PL do feminicídio qualificado.', 'Esse PL do feminicídio mistura militância de gênero no Código Penal. Estamos contra, a bancada toda.', 'Reunião fechada da FPE.', 'verified', false, '2024-10-08', 'https://www.plenonews.com/politica/silas-camara-fpe-feminicidio-pl/', 'news_article', 3, 'Brasília', 'Reunião FPE', 'silas-fpe-feminicidio-b81-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende punição criminal para "apologia à ideologia de gênero" em escolas.', 'Professor que fica ensinando que menino pode virar menina tem que responder na Justiça. Esse PL vai proteger nossas crianças.', 'Entrevista a site gospel.', 'verified', false, '2023-08-22', 'https://www.gospelmais.com.br/bia-kicis-pl-ideologia-genero-escolas.html', 'news_article', 4, 'Brasília', 'Entrevista Gospel Mais', 'bia-kicis-pl-genero-escolas-b81-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que "MST é mão do capeta" em vídeo viral.', 'O MST é a mão do capeta no campo. Invadir propriedade é roubar, e roubar é coisa do diabo.', 'Vídeo publicado nas redes após invasões.', 'verified', false, '2023-04-17', 'https://www.revistaoeste.com/politica/nikolas-mst-mao-do-capeta/', 'social_media_post', 4, 'Redes sociais', 'Vídeo no Instagram', 'nikolas-mst-capeta-b81-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle pede "oração pela queda do governo" em live nacional.', 'Irmãs, peçam a Deus que este governo caia em nome de Jesus. Quando o justo domina, o povo se alegra.', 'Live transmitida em 12 emissoras evangélicas.', 'verified', true, '2023-10-25', 'https://www.plenonews.com/politica/michelle-oracao-queda-governo/', 'social_media_post', 4, 'Internet', 'Live nacional evangélica', 'michelle-oracao-queda-governo-b81-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares anuncia ONG para combater "aborto clandestino" com apoio de igrejas.', 'Lançamos a ONG Brasil Vida com igrejas de todo o país para resgatar mulheres do aborto. Vida acima de tudo.', 'Lançamento em culto da Catedral do Avivamento SP.', 'verified', false, '2024-08-08', 'https://www.gospelmais.com.br/damares-ong-brasil-vida-aborto.html', 'news_article', 2, 'São Paulo', 'Lançamento ONG Brasil Vida', 'damares-ong-brasil-vida-b81-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano chama Marcha das Margaridas de "pagã".', 'Essa Marcha das Margaridas é pagã, é idolatria feminista. Não representa a mulher cristã brasileira.', 'Post em redes sociais sobre a marcha do dia 15 de agosto.', 'verified', false, '2023-08-15', 'https://www.revistaoeste.com/politica/feliciano-marcha-margaridas-paga/', 'social_media_post', 4, 'Redes sociais', 'Post em redes sociais', 'feliciano-marcha-margaridas-b81-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta PL que regula propaganda política em cultos religiosos.', 'Igreja não é palanque. Apresentamos PL para proibir propaganda política direta em cultos, em respeito ao fiel e à laicidade.', 'Coletiva do PSOL na Câmara.', 'verified', false, '2024-11-05', 'https://www.cartacapital.com.br/politica/samia-pl-cultos-propaganda/', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva PSOL', 'samia-pl-cultos-propaganda-b81-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama ONU de "agência do mal" por pressão pró-aborto.', 'A ONU virou agência do mal, promovendo aborto na América Latina. Brasil não é colônia deles.', 'Discurso em plenário.', 'verified', false, '2024-03-27', 'https://www12.senado.leg.br/noticias/materias/2024/03/27/magno-malta-onu-agencia-mal', 'news_article', 4, 'Senado Federal', 'Plenário', 'magno-malta-onu-aborto-b81-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara articula com bispo Edir Macedo apoio da Rede Record a PL das igrejas.', 'Tivemos audiência com o bispo Macedo. A Record é parceira da Frente, e vamos aprovar o PL das Entidades Religiosas.', 'Coletiva após reunião na Record TV.', 'verified', false, '2024-09-11', 'https://www.plenonews.com/politica/silas-camara-record-edir-macedo-pl/', 'news_article', 3, 'São Paulo', 'Record TV — reunião com bispo Macedo', 'silas-record-edir-macedo-b81-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano propõe ensino religioso cristão obrigatório em escolas públicas.', 'Ensino religioso cristão obrigatório: essa é a reforma que falta no Brasil. Sem Cristo na sala, a família está órfã.', 'Apresentação de PL.', 'verified', false, '2023-08-03', 'https://www.camara.leg.br/noticias/994521-feliciano-ensino-religioso-cristao', 'news_article', 4, 'Câmara dos Deputados', 'Apresentação de PL', 'feliciano-ensino-religioso-cristao-b81-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende cota para "família tradicional" em programas habitacionais.', 'Programas habitacionais têm que privilegiar a família tradicional: pai, mãe e filhos. É a base da sociedade.', 'Entrevista à Jovem Pan.', 'verified', false, '2024-07-02', 'https://jovempan.com.br/noticias/politica/bia-kicis-cota-familia-tradicional-habitacional.html', 'news_article', 3, 'São Paulo', 'Jovem Pan', 'bia-kicis-cota-familia-b81-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ridiculariza padre Julio Lancellotti em vídeo viral.', 'Padre Julio Lancellotti defende bandido, defende morador de rua agressor. É padre da esquerda, não é pastor de Cristo.', 'Vídeo publicado no X.', 'verified', true, '2023-09-01', 'https://www.revistaoeste.com/politica/nikolas-padre-julio-lancellotti/', 'social_media_post', 3, 'Redes sociais', 'Post no X', 'nikolas-padre-julio-b81-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle admite arrecadação via PIX em culto e "ofertas milagrosas".', 'Quem quer apoiar a causa Bolsonaro, faz um PIX. Oferta com fé abre as portas que os homens fecharam.', 'Live no Instagram durante vigília política.', 'verified', false, '2025-12-14', 'https://www1.folha.uol.com.br/poder/2025/12/michelle-pix-oferta-milagrosa.shtml', 'social_media_post', 4, 'Redes sociais', 'Live vigília política', 'michelle-pix-oferta-b81-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal diz que "maconha é porta do inferno".', 'Maconha é porta do inferno. Jovem que começa na erva termina no crack, no crime e no inferno. Isso é ciência e é Bíblia.', 'Evento em escola evangélica em São Paulo.', 'verified', false, '2024-04-18', 'https://jovempan.com.br/noticias/politica/marcal-maconha-porta-inferno.html', 'news_article', 3, 'São Paulo', 'Evento em escola evangélica', 'marcal-maconha-inferno-b81-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que existe "lobby gay" no STF.', 'Existe sim um lobby gay no STF. Não é preconceito, é constatação. Eles votam sempre a favor da pauta LGBT.', 'Entrevista à Jovem Pan News.', 'verified', true, '2024-09-18', 'https://jovempan.com.br/noticias/politica/damares-lobby-gay-stf.html', 'news_article', 5, 'São Paulo', 'Jovem Pan News', 'damares-lobby-gay-stf-b81-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano compara aborto a "holocausto brasileiro".', 'O aborto é o holocausto brasileiro. Milhões de bebês mortos silenciosamente. Quando a história for escrita, vão se envergonhar.', 'Discurso em ato pela vida.', 'verified', true, '2024-05-25', 'https://www.gospelmais.com.br/feliciano-aborto-holocausto.html', 'news_article', 4, 'Brasília', 'Marcha pela Vida 2024', 'feliciano-aborto-holocausto-b81-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que respeita a Bíblia "mas governa por leis, não por versículos".', 'A minha fé é minha, mas o Brasil é governado pela Constituição, não pela Bíblia. Quem quer governo bíblico que vá para o Irã dos evangélicos.', 'Entrevista à Folha.', 'verified', true, '2024-03-10', 'https://www1.folha.uol.com.br/poder/2024/03/lula-biblia-governar-constituicao.shtml', 'news_article', 1, 'Brasília', 'Folha — entrevista', 'lula-biblia-constituicao-b81-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "gay tem cura pela fé" em live bolsonarista.', 'Conheço ex-gays, conheço ex-travestis que vieram a Cristo. Tem cura, sim. Não é discurso, é vida real.', 'Live com Carla Zambelli e pastores.', 'verified', true, '2023-12-10', 'https://www.revistaoeste.com/politica/magno-malta-gay-tem-cura-live/', 'social_media_post', 5, 'Internet', 'Live bolsonarista', 'magno-malta-gay-cura-b81-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara se elege novamente presidente da FPE prometendo "batalha em 2026".', 'Fui reeleito presidente da FPE para a batalha de 2026. Vamos eleger 200 evangélicos na Câmara e devolver o país a Deus.', 'Eleição interna na Frente Parlamentar Evangélica.', 'verified', true, '2025-02-19', 'https://www.plenonews.com/politica/silas-camara-reeleito-fpe-2025/', 'news_article', 2, 'Brasília', 'Reeleição FPE', 'silas-reeleito-fpe-b81-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis posta foto com Bolsonaro fazendo oração e chama de "verdadeiro ungido".', 'Bolsonaro é o verdadeiro ungido de Deus para o Brasil. Nenhum juiz tira o que Deus deu.', 'Foto compartilhada no Instagram após visita.', 'verified', false, '2025-10-22', 'https://www.revistaoeste.com/politica/bia-kicis-bolsonaro-ungido/', 'social_media_post', 4, 'Redes sociais', 'Instagram', 'bia-kicis-bolsonaro-ungido-b81-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas usa sessão da Câmara para exibir vídeo com "milagres" atribuídos a pastores do PL.', 'Vejam os milagres de Deus por meio desses pastores do PL. A esquerda não entrega milagre, só ideologia.', 'Sessão plenária com projeção de vídeo.', 'verified', false, '2024-10-16', 'https://www.gospelmais.com.br/nikolas-milagres-pastores-pl-camara.html', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'nikolas-milagres-pastores-camara-b81-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que "crianças indígenas precisam de Jesus".', 'Crianças indígenas precisam de Jesus. Não é colonialismo, é amor. Quem não prega a Cristo omite, é covarde.', 'Culto de missão evangelística indígena em Goiás.', 'verified', true, '2023-07-25', 'https://www.gospelmais.com.br/damares-criancas-indigenas-jesus.html', 'news_article', 5, 'Goiás', 'Culto missão indígena', 'damares-indigenas-jesus-b81-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sog, 'Sonia Guajajara denuncia Damares ao MPF por incitação à evangelização forçada.', 'Damares incita evangelização forçada de crianças indígenas, o que é crime contra a cultura dos povos originários. Encaminhamos ao MPF.', 'Coletiva no Ministério dos Povos Indígenas.', 'verified', true, '2023-07-28', 'https://www.oglobo.globo.com/politica/sonia-damares-mpf-indigenas-evangelizacao-2023.ghtml', 'news_article', 2, 'Brasília', 'MPI — coletiva', 'sonia-damares-mpf-b81-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta propõe Bíblia obrigatória em estabelecimentos públicos.', 'Todo órgão público tem que ter uma Bíblia na recepção. É um sinal de que este país ainda teme a Deus.', 'Apresentação de PL no Senado.', 'verified', false, '2024-01-11', 'https://www12.senado.leg.br/noticias/materias/2024/01/11/magno-malta-biblia-orgaos-publicos', 'news_article', 4, 'Senado Federal', 'Apresentação de PL', 'magno-malta-biblia-orgaos-b81-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fer, 'Fernanda Melchionna denuncia Malta: "Bíblia obrigatória viola Constituição".', 'O PL de Magno Malta viola o Estado laico. Já apresentei contraproposta para proteção à liberdade religiosa.', 'Coletiva do PSOL na Câmara.', 'verified', false, '2024-01-12', 'https://www.cartacapital.com.br/politica/melchionna-biblia-inconstitucional/', 'news_article', 1, 'Câmara dos Deputados', 'Coletiva PSOL', 'melchionna-biblia-inconstitucional-b81-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano pede uso de forças armadas para "proteger cristãos" em ato.', 'Se o STF continuar perseguindo cristãos, as Forças Armadas devem intervir. É a garantia da lei e da ordem.', 'Discurso em ato em Copacabana.', 'verified', true, '2025-02-25', 'https://www.cartacapital.com.br/politica/feliciano-forcas-armadas-cristaos/', 'news_article', 5, 'Rio de Janeiro', 'Ato em Copacabana', 'feliciano-forcas-armadas-cristaos-b81-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula convida 100 pastores evangélicos para jantar no Palácio da Alvorada.', 'Recebi pastores de diversas denominações. Nosso compromisso é respeitar a liberdade religiosa e cooperar no que for construtivo.', 'Jantar no Palácio da Alvorada.', 'verified', true, '2024-12-03', 'https://www1.folha.uol.com.br/poder/2024/12/lula-jantar-pastores-alvorada.shtml', 'news_article', 1, 'Brasília', 'Jantar Alvorada', 'lula-jantar-pastores-alvorada-b81-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares rejeita jantar com Lula e chama ação de "armadilha".', 'Esse jantar é armadilha. Pastor que for está traindo a igreja e virando cabo eleitoral do PT.', 'Live em seu canal.', 'verified', true, '2024-12-04', 'https://www.gospelmais.com.br/damares-jantar-lula-armadilha.html', 'social_media_post', 3, 'Internet', 'Live no Instagram', 'damares-jantar-armadilha-b81-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara propõe isenção total de contribuição previdenciária para pastores.', 'Pastor tem que ser isento de INSS. Ministro de Deus não trabalha para Estado, trabalha para Deus.', 'Apresentação de PL.', 'verified', false, '2024-06-04', 'https://www.camara.leg.br/noticias/1051234-silas-camara-pl-inss-pastores', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'silas-pl-inss-pastores-b81-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lidera "viralização" da Bíblia em horário nobre da Câmara.', 'Hoje li Romanos na Câmara em horário nobre. Viralizamos a palavra de Deus onde antes era só esquerda falando.', 'Discurso-pregação em plenário.', 'verified', true, '2023-08-10', 'https://www.gospelmais.com.br/nikolas-biblia-camara-viralizacao.html', 'news_article', 2, 'Câmara dos Deputados', 'Plenário', 'nikolas-biblia-viralizacao-b81-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle acusa Janja de "bruxaria" após visita a terreiro.', 'Janja foi num terreiro. Aquilo ali é bruxaria disfarçada. O Brasil não pode ser governado por feitiçaria.', 'Live no Instagram.', 'verified', true, '2023-11-03', 'https://www.revistaoeste.com/politica/michelle-janja-bruxaria-terreiro/', 'social_media_post', 5, 'Redes sociais', 'Live Instagram', 'michelle-janja-bruxaria-b81-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaf, 'Jandira Feghali aciona Justiça contra Michelle por racismo religioso.', 'Michelle Bolsonaro cometeu crime de racismo religioso ao chamar cerimônia afro-brasileira de bruxaria. Estamos protocolando queixa-crime.', 'Coletiva no Congresso.', 'verified', true, '2023-11-06', 'https://www.cartacapital.com.br/politica/jandira-michelle-racismo-religioso/', 'news_article', 2, 'Brasília', 'Coletiva no Congresso', 'jandira-michelle-queixa-b81-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão associa "descristianização" a perda de soberania.', 'Brasil que perde o cristianismo perde a soberania. Não é coincidência que nos atacam por dentro pela fé.', 'Entrevista à Brasil Paralelo.', 'verified', false, '2023-08-12', 'https://www.revistaoeste.com/politica/general-girao-descristianizacao-soberania/', 'news_article', 3, 'Internet', 'Brasil Paralelo — entrevista', 'girao-descristianizacao-b81-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta defende "guerra cultural cristã" em painel nos EUA.', 'Brazil is in a cultural war, and Christians must wake up. We need to take back schools, media and politics.', 'Painel no CPAC Brasil e evento nos EUA.', 'verified', false, '2024-10-04', 'https://www.revistaoeste.com/politica/julia-zanatta-guerra-cultural-cristao/', 'news_article', 3, 'Washington (EUA)', 'CPAC / Heritage Foundation', 'julia-guerra-cultural-b81-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson invoca "espada do Espírito" em homenagem a policiais mortos.', 'Pela espada do Espírito Santo, declaro vingança divina sobre quem matou nossos policiais. Deus é justo e cobra.', 'Culto em homenagem a policiais no Rio.', 'verified', false, '2024-07-20', 'https://www.gospelmais.com.br/sanderson-espada-espirito-policiais.html', 'news_article', 4, 'Rio de Janeiro', 'Culto policiais homenageados', 'sanderson-espada-espirito-b81-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fil, 'Filipe Barros critica "novela LGBT" em telinha pública.', 'A Globo, com dinheiro público de publicidade, impõe novela LGBT em horário infantil. Cadê a fiscalização?', 'Entrevista à Jovem Pan.', 'verified', false, '2024-02-15', 'https://jovempan.com.br/noticias/politica/filipe-barros-globo-novela-lgbt-infantil.html', 'news_article', 3, 'São Paulo', 'Jovem Pan', 'filipe-barros-globo-lgbt-b81-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto defende "milícia cristã" para defender igrejas.', 'Nossas igrejas precisam de milícia cristã para se defender. Polícia não tá nem aí, tem que ser o próprio cristão.', 'Live em canal bolsonarista.', 'disputed', true, '2024-05-12', 'https://www.revistaoeste.com/politica/cabo-gilberto-milicia-crista-igrejas/', 'social_media_post', 5, 'Internet', 'Live bolsonarista', 'cabo-gilberto-milicia-crista-b81-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mej, 'Mecias de Jesus afirma que "missão evangelística é política pública legítima".', 'Missão evangelística é política pública. Quem não entende isso quer calar a igreja em espaços públicos.', 'Discurso em audiência no Senado.', 'verified', false, '2024-08-07', 'https://www12.senado.leg.br/noticias/materias/2024/08/07/mecias-missao-politica-publica', 'news_article', 3, 'Senado Federal', 'Audiência pública', 'mecias-missao-politica-publica-b81-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esp, 'Esperidião Amin propõe "pacto conservador" entre CNBB e FPE.', 'CNBB e Frente Evangélica podem fazer pacto conservador em defesa da família, do trabalho e da vida. Essa é a maioria cristã do Brasil.', 'Entrevista ao Estadão.', 'verified', false, '2024-09-02', 'https://www.estadao.com.br/politica/amin-pacto-cnbb-fpe-conservador/', 'news_article', 2, 'Brasília', 'Estadão — entrevista', 'amin-pacto-cnbb-fpe-b81-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro propõe CPI da "censura a pastores" no STF.', 'Vou propor CPI para investigar censura a pastores cristãos pelo STF. Não dá pra aceitar que pastor seja preso por pregar.', 'Coletiva no Senado.', 'verified', false, '2024-02-20', 'https://www12.senado.leg.br/noticias/materias/2024/02/20/flavio-cpi-censura-pastores', 'news_article', 4, 'Senado Federal', 'Coletiva', 'flavio-cpi-censura-pastores-b81-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula com Heritage Foundation PL de "liberdade religiosa".', 'Estamos trabalhando com a Heritage para trazer padrões americanos de liberdade religiosa ao Brasil. Aqui falta jurisprudência sólida.', 'Entrevista em evento em Washington.', 'verified', false, '2024-11-13', 'https://www.revistaoeste.com/politica/eduardo-bolsonaro-heritage-liberdade-religiosa/', 'news_article', 3, 'Washington (EUA)', 'Evento Heritage Foundation', 'eduardo-heritage-liberdade-religiosa-b81-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin afirma em voto que "liberdade religiosa não autoriza crime".', 'A liberdade religiosa, garantida constitucionalmente, não autoriza prática de crime, inclusive racismo religioso contra religiões de matriz africana.', 'Voto no STF em ação sobre racismo religioso.', 'verified', true, '2024-09-11', 'https://www1.folha.uol.com.br/cotidiano/2024/09/zanin-liberdade-religiosa-racismo.shtml', 'news_article', 1, 'Brasília', 'Plenário STF', 'zanin-liberdade-crime-b81-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Hamilton Mourão diz que "evangelismo político radical afasta eleitor de centro".', 'A direita precisa entender que essa pregação radical de alguns pastores afasta eleitor de centro. Perdemos por isso.', 'Entrevista à GloboNews.', 'verified', false, '2024-11-04', 'https://www.oglobo.globo.com/politica/mourao-evangelismo-radical-direita.ghtml', 'news_article', 1, 'Brasília', 'GloboNews', 'mourao-evangelismo-radical-b81-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "mulher tem que obedecer ao marido" em culto.', 'A Bíblia manda a mulher obedecer ao marido. Não é opressão, é ordem divina. Quem prega o contrário é feminista radical.', 'Culto na Rede Paz em Vila Velha.', 'verified', true, '2024-03-08', 'https://www.gospelmais.com.br/magno-malta-mulher-obedecer-marido.html', 'news_article', 5, 'Vila Velha (ES)', 'Culto Rede Paz', 'magno-malta-mulher-obedecer-b81-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann responde Malta: "mulher petista não obedece a machista com Bíblia".', 'Magno Malta disfarça machismo de teologia. Mulher brasileira não obedece a machista, com ou sem Bíblia na mão.', 'Post no X.', 'verified', true, '2024-03-09', 'https://www.cartacapital.com.br/politica/gleisi-magno-malta-machista/', 'social_media_post', 1, 'Redes sociais', 'Post no X', 'gleisi-malta-machista-b81-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca escolas particulares religiosas que trataram pauta LGBT.', 'Colégio evangélico que adota pauta LGBT parou de ser colégio evangélico. Pais precisam boicotar.', 'Post em redes.', 'verified', false, '2024-05-24', 'https://www.revistaoeste.com/politica/damares-colegios-evangelicos-lgbt-boicote/', 'social_media_post', 4, 'Redes sociais', 'Post em redes', 'damares-colegios-lgbt-b81-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano promove congresso "Reino Agora" com pastores da Universal e AD juntos.', 'Universal e Assembleia juntas neste congresso. É Reino agora, é Brasil voltando a Deus.', 'Congresso Reino Agora em Brasília.', 'verified', true, '2025-06-18', 'https://www.gospelmais.com.br/feliciano-reino-agora-universal-ad.html', 'news_article', 2, 'Brasília', 'Congresso Reino Agora', 'feliciano-reino-agora-b81-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis critica Cármen Lúcia por chamar fé de "privada".', 'Cármen Lúcia errou feio dizendo que fé é privada. Fé é pública, fé é sal da terra, fé é testemunho.', 'Post no X em resposta a discurso da ministra.', 'verified', false, '2024-07-31', 'https://www.revistaoeste.com/politica/bia-kicis-carmen-lucia-fe-privada/', 'social_media_post', 3, 'Redes sociais', 'Post no X', 'bia-kicis-carmen-lucia-b81-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que "Lula ofendeu Deus" ao visitar terreiro.', 'Lula foi num terreiro e ofendeu Deus diretamente. Presidente do Brasil não pode se curvar a entidade pagã.', 'Vídeo publicado no X após visita de Lula a terreiro em SP.', 'verified', true, '2023-07-22', 'https://www.gospelmais.com.br/nikolas-lula-terreiro-ofender-deus.html', 'social_media_post', 5, 'Redes sociais', 'Post no X', 'nikolas-lula-terreiro-deus-b81-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita terreiro de candomblé e diz que "todos os deuses são respeitáveis".', 'Para mim, todos os deuses são respeitáveis. Eu fui criado católico, mas respeito orixás como respeito Jesus.', 'Visita a terreiro em São Paulo.', 'verified', true, '2023-07-21', 'https://www.oglobo.globo.com/politica/lula-terreiro-candomble-sao-paulo-2023-todos-deuses.ghtml', 'news_article', 1, 'São Paulo', 'Terreiro de candomblé — Itaquera', 'lula-terreiro-todos-deuses-b81-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro chama Lula de "político anticristão" em culto em SP.', 'Lula é um político anticristão. Foge de culto, mas se curva em terreiro. Quem tem olhos pra ver, viu.', 'Culto em megaigreja em SP.', 'verified', true, '2024-09-08', 'https://www.gospelmais.com.br/michelle-lula-anticristao-megaigreja-sp.html', 'news_article', 4, 'São Paulo', 'Culto megaigreja evangélica', 'michelle-lula-anticristao-b81-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares promete "fechar escolas com ideologia de gênero" se eleita governadora.', 'Se Deus me permitir governar o DF, fecho todas as escolas que ensinam ideologia de gênero. Sem concessão.', 'Evento de pré-campanha ao governo do DF.', 'verified', true, '2026-03-18', 'https://www.plenonews.com/politica/damares-pre-campanha-df-escolas-genero/', 'news_article', 4, 'Brasília', 'Pré-campanha DF', 'damares-fechar-escolas-genero-b81-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar relembra "Jesus histórico dos pobres" em debate.', 'O Jesus histórico esteve com os pobres, com os leprosos, com as prostitutas. Era o oposto da bancada do ódio que usa o nome dele em vão.', 'Debate em universidade católica.', 'verified', false, '2023-09-29', 'https://www.cartacapital.com.br/politica/chico-alencar-jesus-historico-pobres/', 'news_article', 1, 'Rio de Janeiro', 'PUC-Rio — debate', 'chico-alencar-jesus-historico-b81-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara diz que "denominações menores serão esmagadas" sem FPE.', 'Sem FPE, igrejas pequenas são esmagadas pelo fisco. Nosso trabalho é proteger as minorias religiosas evangélicas.', 'Coletiva FPE.', 'verified', false, '2023-03-23', 'https://www.plenonews.com/politica/silas-camara-denominacoes-esmagadas-fpe/', 'news_article', 2, 'Brasília', 'Coletiva FPE', 'silas-denominacoes-esmagadas-b81-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "bonito é mulher submissa" em vídeo viral.', 'Bonito é mulher submissa ao marido, que cuida dos filhos, que tempera o feijão. Essa mulher Deus abençoa.', 'Culto transmitido pela internet.', 'verified', true, '2023-05-14', 'https://www1.folha.uol.com.br/cotidiano/2023/05/magno-malta-mulher-submissa-viral.shtml', 'news_article', 5, 'Vitória (ES)', 'Culto Rede Paz', 'magno-malta-mulher-submissa-b81-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano é multado pelo TSE por uso eleitoral de culto.', 'Multa política é perseguição ao evangelho. TSE não vai calar o pastor, porque a fé é maior que a toga.', 'Entrevista após multa do TSE.', 'verified', false, '2024-10-23', 'https://www1.folha.uol.com.br/poder/2024/10/feliciano-tse-multa-culto.shtml', 'news_article', 3, 'São Paulo', 'Entrevista a rádio evangélica', 'feliciano-multa-tse-b81-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis diz que "Brasil precisa de presidente pastor" em 2026.', 'O Brasil precisa de um presidente pastor em 2026. Alguém que pastoreie o povo, não que governe só com planilha.', 'Entrevista à revista Oeste.', 'verified', false, '2025-05-12', 'https://www.revistaoeste.com/politica/bia-kicis-presidente-pastor-2026/', 'news_article', 3, 'Brasília', 'Revista Oeste — entrevista', 'bia-kicis-presidente-pastor-b81-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas aparece em campanha ao lado de 40 pastores.', 'Quarenta pastores ungiram minha candidatura hoje. O povo de Deus sabe em quem vota.', 'Ato de campanha em BH.', 'verified', true, '2024-09-20', 'https://www.plenonews.com/politica/nikolas-40-pastores-campanha-bh/', 'news_article', 3, 'Belo Horizonte', 'Ato de campanha', 'nikolas-40-pastores-b81-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle promete "Ministério da Família Cristã" em futuro governo do PL.', 'Se voltarmos ao poder em 2026, criaremos o Ministério da Família Cristã. Vamos cuidar do que de fato importa.', 'Encontro PL Mulher em Fortaleza.', 'verified', true, '2025-11-08', 'https://www.gospelmais.com.br/michelle-ministerio-familia-crista.html', 'news_article', 3, 'Fortaleza', 'Encontro PL Mulher', 'michelle-ministerio-familia-b81-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares apoia lei que permite "recusa médica por crença religiosa" para procedimentos do SUS.', 'Médico tem o direito de se recusar a fazer aborto, procedimento trans, o que for contra sua fé. Sem perseguição profissional.', 'Apresentação de PL no Senado.', 'verified', true, '2024-11-07', 'https://www12.senado.leg.br/noticias/materias/2024/11/07/damares-pl-recusa-medica-religiosa', 'news_article', 4, 'Senado Federal', 'Apresentação de PL', 'damares-pl-recusa-medica-b81-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaf, 'Jandira Feghali contrapõe PL de Damares: "recusa médica religiosa mata mulheres".', 'Esse PL de Damares mata mulheres em situação de estupro, mata pessoas trans. Liberdade religiosa não é liberdade de matar.', 'Coletiva do PCdoB na Câmara.', 'verified', false, '2024-11-08', 'https://www.cartacapital.com.br/politica/jandira-pl-damares-recusa-medica/', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva PCdoB', 'jandira-pl-damares-b81-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano critica Padre Fábio de Melo por abraçar artista trans.', 'Fábio de Melo abraçou artista trans no palco. Esse padre precisa ser disciplinado pela CNBB. Está fora da fé.', 'Post no X em reação a vídeo viral.', 'verified', true, '2024-08-03', 'https://www.revistaoeste.com/politica/feliciano-fabio-de-melo-trans-disciplinado/', 'social_media_post', 4, 'Redes sociais', 'Post no X', 'feliciano-fabio-melo-trans-b81-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton defende Padre Fábio de Melo: "esse é o Cristo que acolhe".', 'Padre Fábio de Melo demonstrou o que é cristianismo de verdade: abraço, acolhimento, dignidade. Pena que a bancada evangélica não aprendeu isso.', 'Post no X.', 'verified', false, '2024-08-03', 'https://www.cartacapital.com.br/politica/erika-hilton-padre-fabio-acolhimento/', 'social_media_post', 1, 'Redes sociais', 'Post no X', 'erika-padre-fabio-acolhimento-b81-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende prisão para "quem ofende religião cristã".', 'Tem que prender quem ofende religião cristã. Ofender muçulmano virou crime, ofender cristão ninguém fala nada. Isso vai acabar.', 'Entrevista à Jovem Pan.', 'verified', false, '2024-01-28', 'https://jovempan.com.br/noticias/politica/magno-malta-prender-ofensa-crista.html', 'news_article', 4, 'São Paulo', 'Jovem Pan', 'magno-malta-prender-ofensa-crista-b81-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva propõe ampliar marco regulatório de comunicação incluindo TVs religiosas.', 'As TVs religiosas de maior porte precisam ser incluídas no marco regulatório das comunicações. É questão de transparência, não de censura.', 'Audiência na Câmara.', 'verified', false, '2023-07-18', 'https://www.band.uol.com.br/noticias/politica/orlando-silva-marco-regulatorio-tvs-religiosas.html', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'orlando-silva-marco-tvs-religiosas-b81-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara classifica marco regulatório como "mordaça evangélica".', 'Orlando Silva quer colocar mordaça em emissora evangélica. Isso não vai passar, porque o evangelho não se cala.', 'Coletiva da FPE.', 'verified', false, '2023-07-19', 'https://www.plenonews.com/politica/silas-camara-marco-regulatorio-mordaca-evangelica/', 'news_article', 3, 'Brasília', 'Coletiva FPE', 'silas-marco-mordaca-b81-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compara Lula ao "Rei Herodes" em pregação.', 'Lula é o Rei Herodes dos nossos dias: persegue as crianças desde o ventre permitindo aborto. Deus o julga.', 'Pregação em congresso em Brasília.', 'verified', true, '2024-09-26', 'https://www.gospelmais.com.br/damares-lula-herodes-aborto.html', 'news_article', 5, 'Brasília', 'Congresso evangélico', 'damares-lula-herodes-b81-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone defende descriminalização do aborto e cita mães negras.', 'Mulheres negras morrem por abortos clandestinos. Criminalizar é deixar morrer. Onde está a defesa da vida deles?', 'Discurso na Câmara.', 'verified', false, '2024-09-13', 'https://www.cartacapital.com.br/politica/taliria-aborto-mulheres-negras/', 'news_article', 1, 'Câmara dos Deputados', 'Plenário', 'taliria-aborto-mulheres-negras-b81-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que "quem defende aborto é assassino moral".', 'Quem defende aborto é assassino moral. Tem responsabilidade no sangue das crianças. A história julgará.', 'Discurso em plenário.', 'verified', true, '2024-06-13', 'https://www.gospelmais.com.br/nikolas-aborto-assassino-moral.html', 'news_article', 4, 'Câmara dos Deputados', 'Plenário', 'nikolas-aborto-assassino-moral-b81-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano anuncia que "vai concorrer a senador com unção profética".', 'Deus me revelou em sonho que serei senador em 2026. Vou para o Senado com unção profética, para impedir que o STF destrua o Brasil.', 'Pré-convenção PRB.', 'verified', false, '2026-01-24', 'https://www.plenonews.com/politica/feliciano-candidato-senador-2026-uncao/', 'news_article', 3, 'São Paulo', 'Pré-convenção PRB', 'feliciano-candidato-senador-uncao-b81-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz que "Bolsonaro continua ungido mesmo preso".', 'Bolsonaro preso continua ungido. Davi também foi perseguido antes de ser rei. Deus restaura quem está ao lado dEle.', 'Culto na Rede Paz.', 'verified', true, '2025-12-22', 'https://www.gospelmais.com.br/magno-malta-bolsonaro-davi-ungido-preso.html', 'news_article', 4, 'Vitória (ES)', 'Culto Rede Paz', 'magno-malta-bolsonaro-davi-b81-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara nega relação com esquema de descontos na CPMI.', 'Não tenho relação alguma com esse esquema. Meu ministério é sério e o que acontece com outros não é problema meu.', 'Depoimento na CPMI INSS, segundo dia.', 'verified', false, '2025-09-25', 'https://www1.folha.uol.com.br/poder/2025/09/silas-camara-cpmi-nega-esquema-descontos.shtml', 'news_article', 3, 'Senado Federal', 'CPMI INSS — 2º dia depoimento', 'silas-cpmi-nega-esquema-b81-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis diz que "pastor pode orar pela morte do tirano" em live polêmica.', 'Tem pastor orando pela morte do tirano, e isso é bíblico. Não é incitação, é Salmos 109.', 'Live em canal bolsonarista.', 'verified', true, '2025-10-05', 'https://www.revistaoeste.com/politica/bia-kicis-pastor-orar-morte-tirano/', 'social_media_post', 5, 'Internet', 'Live bolsonarista', 'bia-kicis-orar-morte-tirano-b81-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares articula "presidenta evangélica" para 2030 em encontro secreto.', 'Temos o nome certo para 2030: mulher evangélica de direita, com apoio da Universal e da AD. Estamos construindo.', 'Áudio vazado.', 'disputed', true, '2025-11-15', 'https://www1.folha.uol.com.br/poder/2025/11/damares-audio-presidenta-evangelica-2030.shtml', 'other', 3, 'Brasília', 'Áudio vazado — encontro fechado', 'damares-presidenta-2030-b81-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que "Brasil evangélico é maioria e maioria manda".', 'O Brasil já é evangélico em sua maioria simbólica. E numa democracia, maioria manda. A esquerda vai ter que engolir.', 'Discurso em congresso do PL.', 'verified', false, '2024-12-07', 'https://www.revistaoeste.com/politica/nikolas-evangelico-maioria-democracia/', 'news_article', 3, 'Brasília', 'Congresso PL', 'nikolas-evangelico-maioria-b81-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos critica "pastores milionários" em debate municipal.', 'Pablo Marçal representa os pastores milionários que vivem da fé do pobre. Minha prefeitura combate isso.', 'Debate eleitoral em SP.', 'verified', false, '2024-09-10', 'https://www1.folha.uol.com.br/poder/2024/09/boulos-pastores-milionarios-debate.shtml', 'news_article', 1, 'São Paulo', 'Debate eleitoral', 'boulos-pastores-milionarios-b81-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reúne bispos católicos e diz que "teologia da libertação ainda é guia".', 'A teologia da libertação ainda guia a minha visão política. Jesus esteve com os pobres, e é essa a Igreja que eu amo.', 'Reunião com CNBB no Vaticano.', 'verified', true, '2023-06-22', 'https://www1.folha.uol.com.br/poder/2023/06/lula-vaticano-cnbb-teologia-libertacao.shtml', 'news_article', 1, 'Vaticano', 'Reunião CNBB — visita ao Papa', 'lula-vaticano-libertacao-b81-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano chama teologia da libertação de "heresia comunista".', 'Teologia da libertação é heresia comunista com verniz cristão. Jesus não era militante do PT, não.', 'Entrevista à Gospel TV.', 'verified', false, '2023-06-25', 'https://www.gospelmais.com.br/feliciano-teologia-libertacao-heresia.html', 'news_article', 4, 'São Paulo', 'Gospel TV', 'feliciano-teologia-libertacao-b81-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle propõe "dia nacional dos ex-gays cristãos".', 'Proponho um dia nacional dos ex-gays cristãos. Existem muitos, e o Brasil precisa saber que Jesus cura.', 'Post no Instagram.', 'verified', true, '2024-06-28', 'https://www.revistaoeste.com/politica/michelle-dia-nacional-ex-gays-cristaos/', 'social_media_post', 5, 'Redes sociais', 'Instagram', 'michelle-dia-ex-gays-b81-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal cria conta "O Profeta Marçal" e vende curso espiritual.', 'O profeta Marçal traz a palavra para o Brasil despertar. Quem assinar o curso entra na nova dimensão da política cristã.', 'Anúncio em rede social do próprio deputado.', 'verified', false, '2025-05-20', 'https://www1.folha.uol.com.br/mercado/2025/05/marcal-profeta-curso-espiritual.shtml', 'social_media_post', 3, 'Internet', 'Instagram O Profeta Marçal', 'marcal-profeta-curso-b81-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares é criticada por usar orfanato em campanha religiosa.', 'Estamos dando Cristo para as crianças do orfanato. Críticas de imprensa são fruto do inimigo querendo calar a evangelização.', 'Visita a orfanato em Goiânia com transmissão ao vivo.', 'verified', false, '2024-10-12', 'https://www1.folha.uol.com.br/cotidiano/2024/10/damares-orfanato-evangelizacao-transmissao.shtml', 'news_article', 4, 'Goiânia', 'Visita a orfanato', 'damares-orfanato-evangelizacao-b81-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara é acusado de contratar familiares como pastores-assessores.', 'Meus filhos são pastores concursados da igreja, não cargos fantasma. Imprensa vermelha inventa escândalo.', 'Entrevista à Folha em reação a reportagem.', 'verified', true, '2025-04-14', 'https://www1.folha.uol.com.br/poder/2025/04/silas-camara-familiares-pastores-assessores.shtml', 'news_article', 4, 'Brasília', 'Folha — entrevista', 'silas-familiares-pastores-b81-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca Janja em culto: "mulher de presidente tinha que saber rezar".', 'Essa mulher de presidente tinha que saber rezar, não ficar em culto de macumba. Deus vê tudo.', 'Culto com transmissão na TV Gospel Century.', 'verified', true, '2024-02-14', 'https://www.gospelmais.com.br/magno-malta-janja-macumba-culto.html', 'news_article', 5, 'Vitória (ES)', 'Culto Rede Paz', 'magno-malta-janja-macumba-b81-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que "homem gay não pode ser pastor".', 'Homem gay não pode ser pastor, ponto. Não é preconceito, é a Bíblia. Quem quer ser pastor tem que ser homem de Deus.', 'Live com pastores.', 'verified', true, '2024-01-14', 'https://www.gospelmais.com.br/nikolas-homem-gay-nao-pode-ser-pastor.html', 'social_media_post', 5, 'Internet', 'Live com pastores', 'nikolas-gay-nao-pastor-b81-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano promete "CPI das religiões afro" se oposição vencer 2026.', 'Se a oposição vencer em 2026, eu serei o primeiro a propor CPI das religiões afro, que estão por trás da violência no país.', 'Entrevista à Revista Oeste.', 'verified', true, '2025-07-29', 'https://www.revistaoeste.com/politica/feliciano-cpi-religioes-afro-2026/', 'news_article', 5, 'São Paulo', 'Revista Oeste — entrevista', 'feliciano-cpi-religioes-afro-b81-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula abre centro de apoio a terreiros em SP em resposta a ataques.', 'Inauguramos hoje o Centro Nacional de Apoio às Religiões de Matriz Africana. Terreiro tem o mesmo respeito que qualquer igreja.', 'Inauguração em São Paulo.', 'verified', true, '2025-03-14', 'https://www.oglobo.globo.com/politica/lula-centro-apoio-terreiros-matriz-africana-2025.ghtml', 'news_article', 1, 'São Paulo', 'Inauguração Centro Nacional', 'lula-centro-terreiros-b81-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares classifica o centro de apoio a terreiros como "templo do paganismo oficial".', 'Lula financia paganismo oficial com dinheiro do contribuinte cristão. Isso é afronta ao Brasil de fé.', 'Post em redes e entrevista à Record News.', 'verified', true, '2025-03-15', 'https://www.gospelmais.com.br/damares-centro-terreiros-paganismo.html', 'news_article', 5, 'Brasília', 'Record News + redes', 'damares-paganismo-oficial-b81-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

END $$;
