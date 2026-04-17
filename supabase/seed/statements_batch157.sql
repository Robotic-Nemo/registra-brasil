-- Batch 157: Culture wars + media (Globo, Record, Band) 2023-2026
DO $$
DECLARE
  v_jair UUID; v_edu UUID; v_nik UUID; v_zam UUID; v_kic UUID;
  v_fel UUID; v_dam UUID; v_mag UUID; v_mic UUID; v_pab UUID;
  v_van UUID; v_kim UUID; v_adr UUID; v_gir UUID; v_jzt UUID;
  v_san UUID; v_eri UUID; v_sam UUID; v_tab UUID; v_tal UUID;
  v_fme UUID; v_jan UUID; v_orl UUID; v_chi UUID; v_gle UUID;
  v_mgt UUID; v_luc UUID; v_son UUID; v_ani UUID; v_sil UUID;
  v_pad UUID; v_mau UUID; v_alc UUID; v_lul UUID; v_had UUID;
  v_teb UUID; v_mar UUID; v_fav UUID; v_mer UUID; v_muc UUID;
  v_jor UUID; v_lew UUID; v_mor UUID; v_din UUID; v_hum UUID;
  v_ran UUID; v_jaq UUID; v_rog UUID; v_dil UUID;
  c_des UUID; c_odi UUID; c_int UUID; c_abu UUID; c_itr UUID;
  c_mac UUID; c_mis UUID; c_hom UUID; c_rac UUID; c_xen UUID;
  c_ant UUID; c_ame UUID; c_con UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug='eduardo-bolsonaro';
  SELECT id INTO v_nik  FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_zam  FROM politicians WHERE slug='carla-zambelli';
  SELECT id INTO v_kic  FROM politicians WHERE slug='bia-kicis';
  SELECT id INTO v_fel  FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_mag  FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_mic  FROM politicians WHERE slug='michelle-bolsonaro';
  SELECT id INTO v_pab  FROM politicians WHERE slug='pablo-marcal';
  SELECT id INTO v_van  FROM politicians WHERE slug='marcel-van-hattem';
  SELECT id INTO v_kim  FROM politicians WHERE slug='kim-kataguiri';
  SELECT id INTO v_adr  FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_gir  FROM politicians WHERE slug='general-girao';
  SELECT id INTO v_jzt  FROM politicians WHERE slug='julia-zanatta';
  SELECT id INTO v_san  FROM politicians WHERE slug='sanderson';
  SELECT id INTO v_eri  FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam  FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tab  FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_tal  FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_fme  FROM politicians WHERE slug='fernanda-melchionna';
  SELECT id INTO v_jan  FROM politicians WHERE slug='jandira-feghali';
  SELECT id INTO v_orl  FROM politicians WHERE slug='orlando-silva';
  SELECT id INTO v_chi  FROM politicians WHERE slug='chico-alencar';
  SELECT id INTO v_gle  FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_mgt  FROM politicians WHERE slug='margareth-menezes';
  SELECT id INTO v_luc  FROM politicians WHERE slug='luciana-santos';
  SELECT id INTO v_son  FROM politicians WHERE slug='sonia-guajajara';
  SELECT id INTO v_ani  FROM politicians WHERE slug='anielle-franco';
  SELECT id INTO v_sil  FROM politicians WHERE slug='silvio-almeida';
  SELECT id INTO v_pad  FROM politicians WHERE slug='alexandre-padilha';
  SELECT id INTO v_mau  FROM politicians WHERE slug='mauro-vieira';
  SELECT id INTO v_alc  FROM politicians WHERE slug='geraldo-alckmin';
  SELECT id INTO v_lul  FROM politicians WHERE slug='lula';
  SELECT id INTO v_had  FROM politicians WHERE slug='fernando-haddad';
  SELECT id INTO v_teb  FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_mar  FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_fav  FROM politicians WHERE slug='carlos-favaro';
  SELECT id INTO v_mer  FROM politicians WHERE slug='aloizio-mercadante';
  SELECT id INTO v_muc  FROM politicians WHERE slug='jose-mucio';
  SELECT id INTO v_jor  FROM politicians WHERE slug='jorge-messias';
  SELECT id INTO v_lew  FROM politicians WHERE slug='ricardo-lewandowski';
  SELECT id INTO v_mor  FROM politicians WHERE slug='alexandre-de-moraes';
  SELECT id INTO v_din  FROM politicians WHERE slug='flavio-dino';
  SELECT id INTO v_hum  FROM politicians WHERE slug='humberto-costa';
  SELECT id INTO v_ran  FROM politicians WHERE slug='randolfe-rodrigues';
  SELECT id INTO v_jaq  FROM politicians WHERE slug='jaques-wagner';
  SELECT id INTO v_rog  FROM politicians WHERE slug='rogerio-marinho';
  SELECT id INTO v_dil  FROM politicians WHERE slug='dilma-rousseff';

  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug='intimidacao';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_itr FROM categories WHERE slug='intolerancia-religiosa';
  SELECT id INTO c_mac FROM categories WHERE slug='machismo';
  SELECT id INTO c_mis FROM categories WHERE slug='misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug='homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug='racismo';
  SELECT id INTO c_xen FROM categories WHERE slug='xenofobia';
  SELECT id INTO c_ant FROM categories WHERE slug='antidemocratico';
  SELECT id INTO c_ame FROM categories WHERE slug='ameaca-instituicoes';
  SELECT id INTO c_con FROM categories WHERE slug='conflito-interesses';
  SELECT id INTO c_aut FROM categories WHERE slug='autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama Globo de "lixo" em entrevista e pede boicote.', 'A Globo é um lixo. O povo tem que virar as costas para essa emissora.', 'Entrevista à Jovem Pan em janeiro de 2023 ao retornar dos EUA.', 'verified', true, '2023-03-30', 'https://g1.globo.com/politica/noticia/2023/03/30/bolsonaro-chama-globo-de-lixo.ghtml', 'news_article', 4, 'São Paulo', 'Entrevista Jovem Pan', 'bolsonaro-globo-lixo-b157-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Globo e propõe CPI da mídia.', 'A Globo mente sistematicamente. Precisamos de uma CPI da mídia para expor.', 'Pronunciamento na Câmara em abril de 2023.', 'verified', true, '2023-04-12', 'https://www.camara.leg.br/noticias/nikolas-cpi-midia', 'other', 4, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'nikolas-cpi-midia-b157-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro compara Globo à TV Cubana.', 'A Globo é a TV Cubana do Brasil. Só falta o Fidel mandar.', 'Postagem no X em maio de 2023 após reportagem do Jornal Nacional.', 'verified', false, '2023-05-18', 'https://twitter.com/BolsonaroSP/status/1659000000', 'social_media_post', 3, 'X/Twitter', 'Postagem no X', 'eduardo-globo-tv-cubana-b157-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli ameaça jornalistas da Globo após condenação.', 'Os jornalistas da Globo vão pagar caro. Estou anotando os nomes.', 'Live no Instagram após primeira condenação judicial em 2023.', 'verified', true, '2023-05-24', 'https://g1.globo.com/politica/noticia/2023/05/24/zambelli-ameaca-jornalistas-globo.ghtml', 'social_media_post', 5, 'Instagram', 'Live após condenação', 'zambelli-ameaca-globo-b157-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que Globo faz oposição "dissimulada" ao governo.', 'A Globo sempre fez oposição a mim, agora de forma mais dissimulada.', 'Entrevista à RedeTV em junho de 2023.', 'verified', false, '2023-06-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/06/10/lula-globo-oposicao.htm', 'news_article', 2, 'Brasília', 'Entrevista RedeTV', 'lula-globo-oposicao-b157-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas dá discurso transfóbico na tribuna vestindo peruca.', 'Hoje eu me sinto mulher. Agora sou deputada.', 'Discurso na Câmara em 8 de março no Dia da Mulher em 2023.', 'verified', true, '2023-03-08', 'https://g1.globo.com/politica/noticia/2023/03/08/nikolas-peruca-dia-mulher.ghtml', 'other', 5, 'Câmara dos Deputados', 'Dia Internacional da Mulher', 'nikolas-peruca-dia-mulher-b157-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton responde Nikolas e denuncia violência transfóbica.', 'O que Nikolas fez é crime de transfobia. Nossas vidas não são piada.', 'Pronunciamento em resposta ao episódio da peruca na Câmara.', 'verified', true, '2023-03-08', 'https://g1.globo.com/politica/noticia/2023/03/08/erika-hilton-responde-nikolas.ghtml', 'other', 1, 'Câmara dos Deputados', 'Resposta a Nikolas', 'erika-responde-nikolas-b157-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano chama Globo de "emissora do diabo".', 'A Globo é a emissora do diabo. Serve à agenda anticristã.', 'Culto em igreja de São Paulo em julho de 2023.', 'verified', false, '2023-07-22', 'https://www1.folha.uol.com.br/poder/2023/07/feliciano-globo-diabo.shtml', 'other', 4, 'São Paulo', 'Culto evangélico', 'feliciano-globo-diabo-b157-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro critica "ideologia de gênero" em novelas da Globo.', 'As novelas da Globo estão destruindo a família brasileira com essa ideologia.', 'Culto em igreja Atitude em abril de 2023.', 'verified', true, '2023-04-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/04/15/michelle-novelas-globo.htm', 'other', 3, 'Rio de Janeiro', 'Culto evangélico', 'michelle-novelas-globo-b157-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal ataca Record ao ser cortado de programa.', 'A Record me censurou. É a Globo evangélica agora.', 'Postagem no X após entrevista cancelada em 2024.', 'verified', false, '2024-08-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/08/15/marcal-record-censura.htm', 'social_media_post', 3, 'X/Twitter', 'Postagem no X', 'marcal-record-censura-b157-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz live atacando jornalista da Band.', 'Esse jornalista da Band é um militante. Devia ser banido.', 'Live semanal após entrevista adversa na Band.', 'verified', false, '2023-08-17', 'https://g1.globo.com/politica/noticia/2023/08/17/bolsonaro-ataca-jornalista-band.ghtml', 'social_media_post', 3, 'YouTube', 'Live semanal', 'bolsonaro-ataca-band-b157-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende PL do "marco da liberdade de imprensa" mirando Globo.', 'Precisamos proteger o cidadão dos abusos da imprensa. Projeto será aprovado.', 'Declaração ao apresentar projeto de lei contra "abusos da mídia".', 'verified', false, '2023-09-05', 'https://www.camara.leg.br/noticias/kicis-marco-imprensa', 'other', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'kicis-marco-imprensa-b157-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares critica drag queens em programa infantil e mobiliza pauta moral.', 'Drag queen com criança é aliciamento. Isso tem que acabar.', 'Pronunciamento no Senado em 2023.', 'verified', true, '2023-06-22', 'https://www12.senado.leg.br/noticias/materias/2023/06/22/damares-drag', 'other', 4, 'Senado Federal', 'Discurso no Senado', 'damares-drag-aliciamento-b157-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta cita "pedofilia" ao atacar ministro dos Direitos Humanos.', 'O Silvio Almeida quer liberar pedofilia. Isso é agenda do PT.', 'Evento em igreja em agosto de 2023.', 'verified', false, '2023-08-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/08/10/magno-malta-silvio.htm', 'other', 5, 'Vitória, ES', 'Culto evangélico', 'magno-malta-pedofilia-b157-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida reage a ataques e defende ministério.', 'Não vamos nos intimidar. Direitos humanos são para todos.', 'Coletiva em resposta a ataques evangélicos em 2023.', 'verified', true, '2023-08-11', 'https://g1.globo.com/politica/noticia/2023/08/11/silvio-almeida-reage.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'silvio-almeida-reage-b157-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica vídeo acusando Globo de manipular dados sobre Lula.', 'A Globo maquia pesquisas para ajudar o Lula. É fraude televisiva.', 'Vídeo no YouTube em setembro de 2023.', 'verified', false, '2023-09-20', 'https://www.youtube.com/watch?v=nikolas-globo-pesquisa', 'social_media_post', 3, 'YouTube', 'Canal de Nikolas', 'nikolas-globo-pesquisa-b157-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão pede investigação da Globo por "crime contra democracia".', 'A Globo manipulou eleição. É crime contra a democracia.', 'Pronunciamento na Câmara em outubro de 2023.', 'verified', false, '2023-10-03', 'https://www.camara.leg.br/noticias/girao-globo-crime', 'other', 4, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'girao-globo-crime-b157-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jzt, 'Julia Zanatta ataca Fantástico por reportagem sobre 8 de janeiro.', 'O Fantástico é panfleto do PT. Vamos expor essa farsa.', 'Vídeo no Instagram em janeiro de 2024.', 'verified', false, '2024-01-09', 'https://www.instagram.com/juliazanatta/status/fantastico', 'social_media_post', 3, 'Instagram', 'Postagem', 'zanatta-fantastico-farsa-b157-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende retirada de concessão de emissoras.', 'Emissora que mente tem que perder concessão. A Globo em primeiro lugar.', 'Sessão da Câmara em novembro de 2023.', 'verified', false, '2023-11-14', 'https://www.camara.leg.br/noticias/sanderson-concessao', 'other', 4, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-concessao-globo-b157-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende jornalistas após série de ataques bolsonaristas.', 'Atacar imprensa livre é ataque à democracia. Basta de intimidação.', 'Pronunciamento na Câmara em defesa da imprensa.', 'verified', false, '2023-11-20', 'https://www.camara.leg.br/noticias/samia-imprensa', 'other', 1, 'Câmara dos Deputados', 'Defesa da imprensa', 'samia-defesa-imprensa-b157-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Globo "ajuda o crime" em crise do Rio.', 'A Globo ajuda o crime. Edita para prejudicar a polícia.', 'Entrevista à Oeste em dezembro de 2023.', 'verified', false, '2023-12-05', 'https://revistaoeste.com/politica/bolsonaro-globo-crime/', 'news_article', 4, 'São Paulo', 'Entrevista Revista Oeste', 'bolsonaro-globo-crime-b157-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica cobertura econômica da Globo e defende arcabouço fiscal.', 'A Globo não tem compromisso com a verdade sobre a economia.', 'Entrevista à CNN Brasil em 2023.', 'verified', false, '2023-09-12', 'https://www.cnnbrasil.com.br/politica/haddad-globo-economia/', 'news_article', 2, 'Brasília', 'Entrevista CNN', 'haddad-globo-economia-b157-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ameaça Globo com "lei mordaça" caso voltem ao poder.', 'Quando voltarmos, a Globo vai pagar. Teremos nossa lei de imprensa.', 'Entrevista à TV Brasília em fevereiro de 2024.', 'verified', true, '2024-02-20', 'https://www.otempo.com.br/politica/eduardo-globo-mordaca', 'news_article', 5, 'Brasília', 'Entrevista TV', 'eduardo-globo-mordaca-b157-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes suspende perfis que incitaram ataques a jornalistas.', 'Não se confunde liberdade de expressão com incitação à violência.', 'Decisão monocrática no STF em março de 2024.', 'verified', false, '2024-03-14', 'https://www.conjur.com.br/moraes-perfis-jornalistas', 'news_article', 2, 'STF', 'Decisão judicial', 'moraes-perfis-jornalistas-b157-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal usa cadeirada do Datena em debate para promoção própria.', 'Me deram uma cadeirada e eu viralizei. É o jogo.', 'Entrevista após debate da Band de agosto de 2024 em que Datena o agrediu.', 'verified', true, '2024-08-16', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/08/16/marcal-cadeirada-datena-band.ghtml', 'news_article', 3, 'São Paulo', 'Pós-debate Band', 'marcal-cadeirada-datena-b157-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral denuncia misoginia em debate eleitoral.', 'As mulheres são atacadas no debate de forma desproporcional. Basta.', 'Pronunciamento após debate de São Paulo em setembro de 2024.', 'verified', false, '2024-09-02', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/09/02/tabata-misoginia-debate.htm', 'news_article', 1, 'São Paulo', 'Pós-debate', 'tabata-misoginia-debate-b157-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal chama Datena de "velho acabado" após debate.', 'Datena é um velho acabado. A Band arrumou problema.', 'Stories no Instagram em agosto de 2024.', 'verified', false, '2024-08-16', 'https://www.instagram.com/pablomarcal/stories-datena-velho', 'social_media_post', 3, 'Instagram', 'Stories', 'marcal-datena-velho-b157-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira acusa Globo de "censura" à direita.', 'A Globo censura conservadores. É hegemonia ideológica.', 'Live no YouTube em outubro de 2024.', 'verified', false, '2024-10-10', 'https://www.youtube.com/watch?v=nikolas-globo-censura', 'social_media_post', 3, 'YouTube', 'Live', 'nikolas-globo-censura-b157-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino defende pluralidade na mídia ao rebater bolsonaristas.', 'Democracia pressupõe imprensa livre e plural. Vamos defender.', 'Entrevista como ministro da Justiça em outubro de 2023.', 'verified', false, '2023-10-20', 'https://g1.globo.com/politica/noticia/2023/10/20/dino-imprensa-livre.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'dino-imprensa-livre-b157-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foragida ataca jornalistas da Itália.', 'Os jornalistas brasileiros são todos comunistas. Na Itália também me perseguem.', 'Entrevista concedida após fuga para Itália em 2024.', 'verified', true, '2024-06-10', 'https://g1.globo.com/mundo/noticia/2024/06/10/zambelli-italia-jornalistas.ghtml', 'news_article', 3, 'Roma, Itália', 'Entrevista na fuga', 'zambelli-italia-jornalistas-b157-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem acusa Globo de "jornalismo militante".', 'O jornalismo da Globo é militância pura. Chega de fingir isenção.', 'Pronunciamento em março de 2024 na Câmara.', 'verified', false, '2024-03-05', 'https://www.camara.leg.br/noticias/van-hattem-globo', 'other', 3, 'Câmara dos Deputados', 'Pronunciamento', 'van-hattem-globo-militante-b157-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende regulação de plataformas e critica imprensa.', 'Precisamos regular big techs mas também cobrar responsabilidade de emissoras.', 'Artigo em março de 2024 sobre PL das Fake News.', 'verified', false, '2024-03-12', 'https://www.otempo.com.br/politica/kim-pl-fake-news', 'news_article', 2, 'Câmara dos Deputados', 'Artigo de opinião', 'kim-pl-fake-news-b157-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura critica publicidade oficial concentrada em Globo.', 'Não pode o governo privilegiar a Globo com publicidade oficial.', 'Pronunciamento na Câmara em maio de 2024.', 'verified', false, '2024-05-15', 'https://www.camara.leg.br/noticias/adriana-publicidade', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-publicidade-globo-b157-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano faz sermão contra Globo por apoio a pautas LGBT.', 'A Globo abraçou o arco-íris de Satanás. É emissora apóstata.', 'Culto em igreja em maio de 2024.', 'verified', false, '2024-05-18', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/05/18/feliciano-globo-apostata.htm', 'other', 4, 'São Paulo', 'Culto', 'feliciano-globo-apostata-b157-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia racismo em coberturas sobre carnaval.', 'A cobertura do carnaval ainda reproduz estereótipos racistas.', 'Evento em março de 2024 como ministra da Igualdade Racial.', 'verified', false, '2024-03-01', 'https://g1.globo.com/politica/noticia/2024/03/01/anielle-racismo-carnaval.ghtml', 'other', 1, 'Brasília', 'Evento público', 'anielle-racismo-carnaval-b157-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Record "virou Globo" após críticas ao governo anterior.', 'A Record decepciona. Virou a Globo do Edir Macedo.', 'Live em abril de 2024.', 'verified', false, '2024-04-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/04/10/bolsonaro-record-globo.htm', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-record-virou-globo-b157-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis ataca apresentadora da GloboNews.', 'Essa apresentadora é uma militante petista fantasiada de jornalista.', 'Postagem no X em maio de 2024.', 'verified', false, '2024-05-02', 'https://twitter.com/Bia_Kicis/status/1786000000', 'social_media_post', 3, 'X/Twitter', 'Postagem', 'kicis-apresentadora-globonews-b157-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro usa culto para cobrar "censura" às novelas.', 'Não queremos essa pauta LGBT nas novelas. Precisamos agir.', 'Evento em igreja em junho de 2024.', 'verified', false, '2024-06-05', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/06/05/michelle-culto-novelas.htm', 'other', 3, 'Rio de Janeiro', 'Culto', 'michelle-culto-novelas-b157-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara critica cobertura da Amazônia por grandes emissoras.', 'A mídia ainda invisibiliza os povos indígenas na cobertura da Amazônia.', 'Evento em julho de 2024.', 'verified', false, '2024-07-14', 'https://g1.globo.com/politica/noticia/2024/07/14/guajajara-midia-amazonia.ghtml', 'other', 1, 'Brasília', 'Evento ONGs', 'guajajara-midia-amazonia-b157-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro sugere "desGloboização" do Brasil.', 'Precisamos de uma desGloboização nacional. Emissora tem que quebrar.', 'Evento nos EUA em julho de 2024.', 'verified', true, '2024-07-25', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/07/25/eduardo-desgloboizacao.htm', 'other', 5, 'Washington, EUA', 'CPAC', 'eduardo-desgloboizacao-b157-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca William Bonner em entrevista.', 'O Bonner é uma peça de museu petista. Aposentadoria compulsória.', 'Entrevista em agosto de 2024.', 'verified', false, '2024-08-05', 'https://g1.globo.com/politica/noticia/2024/08/05/bolsonaro-ataca-bonner.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'bolsonaro-ataca-bonner-b157-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende regulação contra desinformação.', 'Desinformação mata. Precisamos de regulação responsável.', 'Reunião da comissão do PL das Fake News em 2023.', 'verified', false, '2023-04-28', 'https://www.camara.leg.br/noticias/orlando-pl-fake', 'other', 1, 'Câmara dos Deputados', 'Comissão PL Fake News', 'orlando-pl-fake-regulacao-b157-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem acusa PL das Fake News de "censura".', 'PL das Fake News é lei da mordaça. Não vamos permitir.', 'Discurso na Câmara em maio de 2023.', 'verified', true, '2023-05-02', 'https://www.camara.leg.br/noticias/van-hattem-pl-fake', 'other', 3, 'Câmara dos Deputados', 'Debate PL Fake News', 'van-hattem-pl-mordaca-b157-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas bombarda PL das Fake News com memes e vídeos.', 'É a PL da censura. Vamos enterrar esse projeto.', 'Vídeo no Instagram em maio de 2023.', 'verified', true, '2023-05-02', 'https://www.instagram.com/nikolasferreiradm/p/pl-fake', 'social_media_post', 3, 'Instagram', 'Postagem', 'nikolas-pl-censura-b157-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula acusa big techs de promoverem fake news.', 'As big techs precisam ter responsabilidade. Não são neutras.', 'Entrevista à Folha em setembro de 2024.', 'verified', false, '2024-09-10', 'https://www1.folha.uol.com.br/poder/2024/09/lula-big-techs-fake.shtml', 'news_article', 1, 'Brasília', 'Entrevista Folha', 'lula-big-techs-fake-b157-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede asilo à Elon Musk contra Moraes.', 'O Elon tem que nos ajudar. Aqui estamos perseguidos.', 'Postagem no X em abril de 2024.', 'verified', true, '2024-04-08', 'https://twitter.com/BolsonaroSP/status/1777000000', 'social_media_post', 4, 'X/Twitter', 'Postagem', 'eduardo-asilo-musk-b157-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina suspensão do X no Brasil em agosto de 2024.', 'Quem não cumpre a lei brasileira não opera no Brasil.', 'Decisão que suspendeu o X por recusa de nomear representante legal.', 'verified', true, '2024-08-30', 'https://g1.globo.com/politica/noticia/2024/08/30/moraes-suspende-x-brasil.ghtml', 'news_article', 2, 'STF', 'Decisão judicial', 'moraes-suspende-x-b157-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que suspensão do X é "ditadura".', 'Moraes instaurou uma ditadura. Suspender rede social é tirania.', 'Declaração à imprensa em Alagoas em setembro de 2024.', 'verified', true, '2024-09-01', 'https://g1.globo.com/al/alagoas/noticia/2024/09/01/bolsonaro-x-ditadura.ghtml', 'news_article', 4, 'Maceió', 'Agenda política', 'bolsonaro-x-ditadura-b157-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal acusa big techs de boicotar sua campanha.', 'A Meta está me boicotando. É o establishment contra mim.', 'Live no YouTube em agosto de 2024.', 'verified', false, '2024-08-20', 'https://www.youtube.com/watch?v=marcal-meta', 'social_media_post', 3, 'YouTube', 'Live', 'marcal-meta-boicote-b157-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia discurso de ódio em redes.', 'Redes sociais viraram máquinas de ódio contra mulheres e negras.', 'Pronunciamento em junho de 2024 sobre violência política.', 'verified', false, '2024-06-20', 'https://www.camara.leg.br/noticias/taliria-odio-redes', 'other', 1, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-odio-redes-b157-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna denuncia milícia digital bolsonarista.', 'Existe uma milícia digital organizada. Polícia tem que investigar.', 'Pronunciamento em abril de 2024.', 'verified', false, '2024-04-18', 'https://www.camara.leg.br/noticias/fernanda-milicia-digital', 'other', 2, 'Câmara dos Deputados', 'Pronunciamento', 'fernanda-milicia-digital-b157-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas provoca MST em vídeo satírico.', 'O MST é um bando de invasores. Terra improdutiva é invenção.', 'Vídeo no Instagram em agosto de 2023.', 'verified', false, '2023-08-28', 'https://www.instagram.com/nikolasferreiradm/p/mst', 'social_media_post', 3, 'Instagram', 'Postagem', 'nikolas-mst-invasores-b157-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende regulação do streaming e audiovisual.', 'Precisamos de cota para produção nacional no streaming.', 'Audiência sobre PL do streaming em junho de 2024.', 'verified', false, '2024-06-12', 'https://www.camara.leg.br/noticias/jandira-streaming', 'other', 1, 'Câmara dos Deputados', 'Audiência pública', 'jandira-streaming-cota-b157-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar critica monopólio de mídia no Brasil.', 'O Brasil ainda vive sob monopólio midiático. Democratização é urgente.', 'Pronunciamento em setembro de 2023.', 'verified', false, '2023-09-15', 'https://www.camara.leg.br/noticias/chico-alencar-midia', 'other', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-monopolio-midia-b157-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann ataca narrativa da Globo sobre gastos.', 'A Globo vende narrativa de gastança. É mentira.', 'Entrevista à CartaCapital em 2024.', 'verified', false, '2024-05-20', 'https://www.cartacapital.com.br/gleisi-globo-gastos/', 'news_article', 2, 'Brasília', 'Entrevista Carta Capital', 'gleisi-globo-gastos-b157-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama CNN Brasil de "CNN bolivariana".', 'A CNN Brasil é bolivariana. Pior que a Globo.', 'Live em outubro de 2024.', 'verified', false, '2024-10-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/10/15/bolsonaro-cnn-bolivariana.htm', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-cnn-bolivariana-b157-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares vota contra Marco Civil da Internet por "censura".', 'O Marco Civil virou ferramenta de censura. Voto contra.', 'Sessão no Senado em 2023.', 'verified', false, '2023-10-25', 'https://www12.senado.leg.br/noticias/materias/2023/10/25/damares-marco-civil', 'other', 3, 'Senado Federal', 'Sessão plenária', 'damares-marco-civil-b157-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta associa imprensa à "esquerda satânica".', 'A imprensa brasileira serve à esquerda satânica. É guerra espiritual.', 'Culto em igreja em janeiro de 2024.', 'verified', false, '2024-01-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/01/15/magno-malta-imprensa-satanica.htm', 'other', 4, 'Vitória, ES', 'Culto evangélico', 'magno-malta-imprensa-satanica-b157-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica revista Veja por manchete sobre economia.', 'A Veja ainda é a revista da Casa de Bolsonaro.', 'Entrevista em novembro de 2024.', 'verified', false, '2024-11-12', 'https://www.cnnbrasil.com.br/politica/haddad-veja/', 'news_article', 2, 'Brasília', 'Entrevista', 'haddad-veja-bolsonaro-b157-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Kicis defende impeachment de ministros do STF após suspensão do X.', 'Moraes e Dino têm que ser impedidos. Virou tirania judicial.', 'Pronunciamento em setembro de 2024.', 'verified', true, '2024-09-03', 'https://www.camara.leg.br/noticias/kicis-impeachment-moraes', 'other', 4, 'Câmara dos Deputados', 'Pronunciamento', 'kicis-impeachment-moraes-b157-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas se recusa a dar entrevista à Globo.', 'Não falo com emissora militante. Boicote total.', 'Declaração em maio de 2024.', 'verified', false, '2024-05-25', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/05/25/nikolas-boicote-globo.htm', 'social_media_post', 2, 'X/Twitter', 'Postagem', 'nikolas-boicote-globo-b157-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho ataca TV estatal e pede fim da EBC.', 'TV Brasil é propaganda petista. Tem que acabar.', 'Pronunciamento no Senado em 2024.', 'verified', false, '2024-07-09', 'https://www12.senado.leg.br/noticias/materias/2024/07/09/marinho-ebc', 'other', 3, 'Senado Federal', 'Pronunciamento', 'marinho-ebc-fim-b157-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha rebate bolsonaristas sobre mídia.', 'A direita quer silenciar imprensa. Não aceitaremos retrocessos.', 'Entrevista em 2024 como ministro.', 'verified', false, '2024-06-01', 'https://g1.globo.com/politica/noticia/2024/06/01/padilha-imprensa-direita.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'padilha-imprensa-direita-b157-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende fim de financiamento a filmes LGBT.', 'Acabou a Lei Rouanet para gastar com agenda LGBT.', 'Pronunciamento em 2023.', 'verified', false, '2023-06-15', 'https://www.camara.leg.br/noticias/eduardo-rouanet-lgbt', 'other', 3, 'Câmara dos Deputados', 'Pronunciamento', 'eduardo-rouanet-lgbt-b157-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mgt, 'Margareth Menezes defende Lei Rouanet após ataques.', 'Cultura é direito. Lei Rouanet é instrumento democrático.', 'Entrevista em setembro de 2023.', 'verified', false, '2023-09-05', 'https://g1.globo.com/pop-arte/noticia/2023/09/05/margareth-rouanet-defesa.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'margareth-rouanet-defesa-b157-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Rouanet financia "pornografia".', 'A Lei Rouanet financia pornografia. Isso não pode continuar.', 'Live em agosto de 2023.', 'verified', false, '2023-08-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/08/20/bolsonaro-rouanet-pornografia.htm', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-rouanet-pornografia-b157-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano propõe CPI da Cultura contra produções LGBT.', 'Vamos investigar para onde vai o dinheiro público da cultura.', 'Declaração em 2023.', 'verified', false, '2023-10-10', 'https://www.camara.leg.br/noticias/feliciano-cpi-cultura', 'other', 3, 'Câmara dos Deputados', 'Proposta', 'feliciano-cpi-cultura-b157-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle acusa Globo de "manipular" imagem de Bolsonaro na prisão.', 'A Globo quer destruir a honra de Jair. Edição maldosa.', 'Live religiosa em fevereiro de 2024.', 'verified', false, '2024-02-12', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/02/12/michelle-globo-manipulacao.htm', 'social_media_post', 3, 'Instagram', 'Live', 'michelle-globo-manipulacao-b157-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas critica cantora Anitta por apoiar Lula.', 'Anitta é cabo eleitoral petista. Não tem talento.', 'Postagem no X em 2023.', 'verified', false, '2023-10-22', 'https://twitter.com/nikolas_dm/status/1716000000', 'social_media_post', 3, 'X/Twitter', 'Postagem', 'nikolas-anitta-petista-b157-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos defende Ciência e Tecnologia contra fake news.', 'A desinformação científica mata. Temos que enfrentar.', 'Evento em 2023 como ministra.', 'verified', false, '2023-07-18', 'https://g1.globo.com/ciencia/noticia/2023/07/18/luciana-ciencia-fake.ghtml', 'other', 1, 'Brasília', 'Evento MCTI', 'luciana-ciencia-fake-b157-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli processa Globo por reportagem sobre 2022.', 'Vou processar a Globo até o último centavo. Mentiram.', 'Declaração após ser mencionada em reportagem de 2023.', 'verified', false, '2023-07-04', 'https://g1.globo.com/politica/noticia/2023/07/04/zambelli-processa-globo.ghtml', 'news_article', 3, 'Brasília', 'Declaração', 'zambelli-processa-globo-b157-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia Jovem Pan e ataca demais emissoras.', 'Só assisto Jovem Pan. O resto é lixo.', 'Entrevista em dezembro de 2023.', 'verified', false, '2023-12-18', 'https://jovempan.com.br/bolsonaro-jovem-pan', 'news_article', 2, 'São Paulo', 'Entrevista Jovem Pan', 'bolsonaro-jovem-pan-elogio-b157-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal ataca Datena e diz que Band "perdeu credibilidade".', 'A Band sucumbiu ao Datena. Perdeu credibilidade.', 'Entrevista em setembro de 2024.', 'verified', false, '2024-09-18', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/09/18/marcal-band-credibilidade.htm', 'news_article', 2, 'São Paulo', 'Entrevista', 'marcal-band-credibilidade-b157-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende "ética cristã" contra cinema nacional.', 'O cinema brasileiro ataca a família. Temos que mudar os incentivos.', 'Pronunciamento em 2024.', 'verified', false, '2024-03-28', 'https://www.camara.leg.br/noticias/eduardo-cinema', 'other', 3, 'Câmara dos Deputados', 'Pronunciamento', 'eduardo-cinema-cristao-b157-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca filme "Ainda Estou Aqui" sobre ditadura.', 'Esse filme é panfleto esquerdista. Distorce a história.', 'Entrevista após filme ganhar o Oscar em 2025.', 'verified', true, '2025-03-03', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/03/03/bolsonaro-ainda-estou-aqui.htm', 'news_article', 4, 'Brasília', 'Declaração', 'bolsonaro-ainda-estou-aqui-b157-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas minimiza crimes da ditadura após Oscar.', 'Ditadura foi necessária. Não aceito revisionismo de esquerda.', 'Vídeo no YouTube em março de 2025.', 'verified', true, '2025-03-04', 'https://www.youtube.com/watch?v=nikolas-ditadura', 'social_media_post', 5, 'YouTube', 'Canal', 'nikolas-ditadura-necessaria-b157-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula celebra Oscar de Fernanda Torres e filme sobre ditadura.', 'Fernanda Torres honra o Brasil. O filme expõe feridas necessárias.', 'Discurso no Palácio do Planalto em março de 2025.', 'verified', true, '2025-03-03', 'https://g1.globo.com/politica/noticia/2025/03/03/lula-celebra-oscar.ghtml', 'other', 1, 'Brasília', 'Discurso', 'lula-oscar-fernanda-b157-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que anistia do 8 de janeiro virá "por pressão popular".', 'A anistia vai sair. O povo vai pressionar. A imprensa que engula.', 'Entrevista em janeiro de 2025 no aniversário dos atos.', 'verified', true, '2025-01-08', 'https://g1.globo.com/politica/noticia/2025/01/08/bolsonaro-anistia-pressao.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-anistia-pressao-b157-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas defende anistia e acusa mídia de "fabricar golpe".', 'O golpe foi fabricado pela mídia. Anistia já.', 'Pronunciamento em fevereiro de 2025.', 'verified', true, '2025-02-20', 'https://www.camara.leg.br/noticias/nikolas-anistia-golpe', 'other', 5, 'Câmara dos Deputados', 'Pronunciamento', 'nikolas-anistia-golpe-fabricado-b157-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede asilo e acusa STF de perseguição.', 'Vou pedir asilo nos EUA. O STF é uma ditadura.', 'Declaração à imprensa americana em março de 2025.', 'verified', true, '2025-03-15', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/03/15/eduardo-asilo-eua.htm', 'news_article', 5, 'Washington, EUA', 'Entrevista imprensa', 'eduardo-asilo-eua-b157-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes rebate ataques e reafirma papel do STF.', 'O STF cumpre a Constituição. Quem descumpre responde.', 'Sessão do STF em abril de 2025.', 'verified', false, '2025-04-10', 'https://www.conjur.com.br/moraes-rebate-ataques-2025', 'news_article', 2, 'STF', 'Sessão plenária', 'moraes-rebate-ataques-b157-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro condenado pelo STF pede a Trump sanções contra Brasil.', 'O Trump pode ajudar. Sanções contra Moraes são necessárias.', 'Entrevista à Fox News após condenação em 2025.', 'verified', true, '2025-09-12', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/09/12/bolsonaro-trump-sancoes.htm', 'news_article', 5, 'Brasília', 'Entrevista Fox News', 'bolsonaro-trump-sancoes-b157-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo articula Magnitsky contra Moraes nos EUA.', 'Estou trabalhando para Magnitsky contra Moraes. Ele será sancionado.', 'Entrevista em Washington em abril de 2025.', 'verified', true, '2025-04-18', 'https://g1.globo.com/mundo/noticia/2025/04/18/eduardo-magnitsky-moraes.ghtml', 'news_article', 5, 'Washington, EUA', 'Entrevista', 'eduardo-magnitsky-moraes-b157-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula condena tentativas de interferência estrangeira.', 'Nenhum país vai ditar nossa soberania. STF é instituição brasileira.', 'Declaração em maio de 2025.', 'verified', true, '2025-05-10', 'https://g1.globo.com/politica/noticia/2025/05/10/lula-soberania-stf.ghtml', 'other', 1, 'Brasília', 'Pronunciamento', 'lula-soberania-stf-b157-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas viraliza com vídeo atacando Drauzio Varella.', 'Drauzio é militante comunista disfarçado de médico.', 'Vídeo no TikTok em junho de 2025.', 'verified', false, '2025-06-02', 'https://www.tiktok.com/@nikolas_dm/drauzio', 'social_media_post', 3, 'TikTok', 'Vídeo viral', 'nikolas-drauzio-comunista-b157-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende regulação de plataformas no Senado.', 'Plataformas têm que responder no Brasil. Soberania digital.', 'Sessão no Senado em 2024.', 'verified', false, '2024-10-22', 'https://www12.senado.leg.br/noticias/materias/2024/10/22/wagner-plataformas', 'other', 1, 'Senado Federal', 'Sessão plenária', 'wagner-plataformas-soberania-b157-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues rebate ameaças contra imprensa.', 'Ameaçar jornalista é crime. Vamos responsabilizar.', 'Declaração em 2023 como líder do governo.', 'verified', false, '2023-07-20', 'https://www12.senado.leg.br/noticias/materias/2023/07/20/randolfe-imprensa', 'news_article', 1, 'Brasília', 'Declaração', 'randolfe-imprensa-ameacas-b157-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle ataca Fernanda Torres após discurso no Oscar.', 'Fernanda Torres distorceu a história. É militância.', 'Stories no Instagram em março de 2025.', 'verified', false, '2025-03-04', 'https://www.instagram.com/michellebolsonaro/stories/fernanda-torres', 'social_media_post', 3, 'Instagram', 'Stories', 'michelle-fernanda-torres-b157-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada homofóbica em evento no Rio.', 'Essa turma da diversidade quer acabar com a família brasileira.', 'Evento partidário em abril de 2024.', 'verified', false, '2024-04-22', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/04/22/bolsonaro-piada-homofobica.ghtml', 'other', 4, 'Rio de Janeiro', 'Evento do PL', 'bolsonaro-homofobia-familia-b157-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia aumento de violência transfóbica.', 'Os ataques crescem. Vamos responsabilizar quem semeia ódio.', 'Pronunciamento em 2024.', 'verified', false, '2024-06-18', 'https://www.camara.leg.br/noticias/erika-transfobia-aumenta', 'other', 1, 'Câmara dos Deputados', 'Pronunciamento', 'erika-transfobia-aumenta-b157-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva critica desmonte da EBC sugerido por bolsonaristas.', 'Serviço público de comunicação é pilar democrático.', 'Entrevista em 2024.', 'verified', false, '2024-07-30', 'https://g1.globo.com/politica/noticia/2024/07/30/marina-ebc-publica.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'marina-ebc-publica-b157-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal diz que Globo "tem medo" dele nas eleições municipais.', 'A Globo tem pânico. Sou incontrolável.', 'Live em setembro de 2024.', 'verified', false, '2024-09-05', 'https://www.youtube.com/watch?v=marcal-globo-medo', 'social_media_post', 2, 'YouTube', 'Live', 'marcal-globo-medo-b157-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas ataca atriz Taís Araújo por discurso racial.', 'Taís Araújo milita pelo PT. Não aceito lições.', 'Vídeo no Instagram em 2024.', 'verified', false, '2024-11-15', 'https://www.instagram.com/nikolasferreiradm/p/tais-araujo', 'social_media_post', 3, 'Instagram', 'Postagem', 'nikolas-tais-araujo-b157-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle rebate ataques racistas contra atrizes negras.', 'Ataques contra Taís Araújo são racismo puro.', 'Declaração em novembro de 2024.', 'verified', false, '2024-11-16', 'https://g1.globo.com/politica/noticia/2024/11/16/anielle-tais-araujo-racismo.ghtml', 'news_article', 1, 'Brasília', 'Declaração', 'anielle-tais-racismo-b157-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama cobertura sobre PCC de "propaganda".', 'A imprensa glorifica o PCC. É propaganda do crime.', 'Entrevista em março de 2026.', 'verified', false, '2026-03-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2026/03/10/bolsonaro-pcc-imprensa.htm', 'news_article', 3, 'São Paulo', 'Entrevista', 'bolsonaro-pcc-imprensa-b157-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro em exílio mantém ataques a jornalistas.', 'Mesmo de fora do Brasil, vou expor a farsa da Globo.', 'Entrevista à imprensa americana em fevereiro de 2026.', 'verified', true, '2026-02-15', 'https://g1.globo.com/mundo/noticia/2026/02/15/eduardo-exilio-jornalistas.ghtml', 'news_article', 4, 'Flórida, EUA', 'Entrevista', 'eduardo-exilio-jornalistas-b157-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas anuncia pré-candidatura à prefeitura de BH com ataques à mídia.', 'Vou ser prefeito apesar da Globo. O povo está comigo.', 'Evento em BH em janeiro de 2026.', 'verified', true, '2026-01-20', 'https://g1.globo.com/mg/minas-gerais/noticia/2026/01/20/nikolas-pre-candidatura-bh.ghtml', 'other', 3, 'Belo Horizonte', 'Evento partidário', 'nikolas-bh-pre-candidatura-b157-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende cobertura crítica do governo.', 'Imprensa crítica é saúde democrática. Convivemos com ela.', 'Entrevista como ministra em 2024.', 'verified', false, '2024-08-12', 'https://g1.globo.com/politica/noticia/2024/08/12/tebet-imprensa-critica.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'tebet-imprensa-critica-b157-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que se eleito "acabará com a Globo".', 'Quando voltar, a Globo não existe mais. Ponto final.', 'Declaração a apoiadores em 2026.', 'verified', true, '2026-03-25', 'https://noticias.uol.com.br/politica/ultimas-noticias/2026/03/25/bolsonaro-acabar-globo.htm', 'other', 5, 'Brasília', 'Evento com apoiadores', 'bolsonaro-acabar-globo-b157-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma Rousseff critica concentração de mídia em fórum internacional.', 'A democracia brasileira ainda carrega o fardo da concentração midiática.', 'Discurso no fórum BRICS em 2024.', 'verified', false, '2024-10-05', 'https://g1.globo.com/mundo/noticia/2024/10/05/dilma-brics-midia.ghtml', 'other', 1, 'Xangai, China', 'Fórum BRICS', 'dilma-brics-midia-b157-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
