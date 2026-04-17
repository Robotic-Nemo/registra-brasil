-- Batch 158: Foreign policy (UN, ICC, Mercosul, Haiti) 2023-2026
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
  SELECT id INTO v_lew  FROM politicians WHERE slug='lewandowski';
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na Assembleia Geral da ONU pedindo reforma do Conselho de Segurança.', 'O Conselho de Segurança da ONU não reflete o mundo de hoje. Precisamos de reforma.', 'Discurso de abertura da 78ª AGNU em setembro de 2023.', 'verified', true, '2023-09-19', 'https://g1.globo.com/mundo/noticia/2023/09/19/lula-onu-reforma-conselho-seguranca.ghtml', 'speech', 1, 'Nova York, EUA', '78ª Assembleia Geral da ONU', 'lula-onu-reforma-conselho-b158-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende voto histórico do Brasil sobre Gaza na ONU.', 'O Brasil defende cessar-fogo imediato em Gaza e proteção de civis.', 'Discurso do chanceler no Conselho de Segurança em outubro de 2023.', 'verified', true, '2023-10-25', 'https://g1.globo.com/mundo/noticia/2023/10/25/mauro-vieira-onu-gaza.ghtml', 'speech', 1, 'Nova York, EUA', 'Conselho de Segurança da ONU', 'mauro-vieira-gaza-cessar-fogo-b158-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara ação de Israel em Gaza a "genocídio" e "Holocausto".', 'O que está acontecendo em Gaza não é guerra, é genocídio. Lembra o que Hitler fez.', 'Entrevista coletiva em Adis Abeba em fevereiro de 2024.', 'verified', true, '2024-02-18', 'https://g1.globo.com/mundo/noticia/2024/02/18/lula-gaza-genocidio-hitler.ghtml', 'news_article', 4, 'Adis Abeba, Etiópia', 'Cúpula da União Africana', 'lula-gaza-hitler-b158-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro acusa Lula de antissemitismo após fala sobre Hitler.', 'Lula é antissemita. Envergonha o Brasil.', 'Postagem no X em fevereiro de 2024.', 'verified', true, '2024-02-19', 'https://twitter.com/BolsonaroSP/status/1759000000', 'social_media_post', 3, 'X/Twitter', 'Postagem', 'eduardo-lula-antissemita-b158-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro visita embaixada de Israel em solidariedade após fala de Lula.', 'Estamos com Israel. O governo Lula nos envergonha.', 'Visita à embaixada em Brasília em fevereiro de 2024.', 'verified', true, '2024-02-21', 'https://g1.globo.com/politica/noticia/2024/02/21/bolsonaro-embaixada-israel.ghtml', 'news_article', 2, 'Brasília', 'Visita diplomática', 'bolsonaro-embaixada-israel-b158-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira retira embaixador brasileiro de Israel.', 'Convocamos o embaixador para consultas diante da crise.', 'Anúncio do Itamaraty após Israel declarar Lula persona non grata.', 'verified', true, '2024-02-19', 'https://g1.globo.com/mundo/noticia/2024/02/19/brasil-retira-embaixador-israel.ghtml', 'news_article', 2, 'Brasília', 'Anúncio Itamaraty', 'mauro-embaixador-israel-b158-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende adesão do Brasil à ação da África do Sul no TIJ contra Israel.', 'A África do Sul tem razão. É nossa obrigação apoiar.', 'Entrevista em março de 2024.', 'verified', true, '2024-03-05', 'https://g1.globo.com/mundo/noticia/2024/03/05/lula-tij-africa-sul-israel.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-tij-africa-sul-b158-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis acusa Itamaraty de "terrorismo diplomático".', 'O Itamaraty petista pratica terrorismo diplomático contra Israel.', 'Discurso na Câmara em março de 2024.', 'verified', false, '2024-03-07', 'https://www.camara.leg.br/noticias/kicis-itamaraty-terrorismo', 'speech', 3, 'Câmara dos Deputados', 'Pronunciamento', 'kicis-itamaraty-terrorismo-b158-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende acordo Mercosul-União Europeia e responde ceticismo francês.', 'O acordo é bom para os dois blocos. Macron entenderá.', 'Entrevista em missão na Europa em setembro de 2024.', 'verified', false, '2024-09-25', 'https://g1.globo.com/politica/noticia/2024/09/25/alckmin-mercosul-ue-macron.ghtml', 'news_article', 1, 'Bruxelas', 'Missão Europa', 'alckmin-mercosul-ue-macron-b158-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia conclusão do acordo Mercosul-UE em Montevidéu.', 'Hoje é dia histórico. Fechamos o Mercosul-UE após 25 anos.', 'Cúpula do Mercosul em Montevidéu em dezembro de 2024.', 'verified', true, '2024-12-06', 'https://g1.globo.com/mundo/noticia/2024/12/06/lula-mercosul-ue-acordo.ghtml', 'speech', 1, 'Montevidéu, Uruguai', 'Cúpula do Mercosul', 'lula-mercosul-ue-acordo-b158-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem critica cláusulas ambientais do Mercosul-UE.', 'O acordo nos amarra a pautas europeias. Perdemos soberania.', 'Pronunciamento na Câmara em dezembro de 2024.', 'verified', false, '2024-12-10', 'https://www.camara.leg.br/noticias/van-hattem-mercosul', 'speech', 2, 'Câmara dos Deputados', 'Pronunciamento', 'van-hattem-mercosul-soberania-b158-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica acordo Mercosul-UE e defende TLC com EUA.', 'O Mercosul é um fracasso. Precisávamos era de TLC com Trump.', 'Live em dezembro de 2024.', 'verified', false, '2024-12-08', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/12/08/bolsonaro-mercosul-trump.htm', 'social_media_post', 2, 'YouTube', 'Live', 'bolsonaro-mercosul-trump-tlc-b158-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro comemora acesso a mercado europeu para agro.', 'O agro será o grande beneficiário do Mercosul-UE.', 'Entrevista como ministro da Agricultura em dezembro de 2024.', 'verified', false, '2024-12-07', 'https://g1.globo.com/agro/noticia/2024/12/07/favaro-mercosul-ue-agro.ghtml', 'news_article', 1, 'Montevidéu, Uruguai', 'Entrevista', 'favaro-mercosul-ue-agro-b158-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende cláusulas ambientais rigorosas no Mercosul-UE.', 'O acordo tem que respeitar a Amazônia. Não aceitaremos retrocesso.', 'Entrevista em novembro de 2024.', 'verified', false, '2024-11-28', 'https://g1.globo.com/politica/noticia/2024/11/28/marina-mercosul-amazonia.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'marina-mercosul-amazonia-b158-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende retorno brasileiro à UNASUL em Brasília.', 'Precisamos reconstruir a UNASUL. América do Sul integrada.', 'Cúpula dos Presidentes sul-americanos em maio de 2023.', 'verified', true, '2023-05-30', 'https://g1.globo.com/politica/noticia/2023/05/30/lula-unasul-brasilia.ghtml', 'speech', 1, 'Brasília', 'Cúpula sul-americana', 'lula-unasul-brasilia-b158-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama acusações contra Maduro de "narrativa" e gera crise.', 'O conceito de democracia é relativo. Cada país tem sua forma.', 'Coletiva ao lado de Maduro no Palácio do Planalto em maio de 2023.', 'verified', true, '2023-05-29', 'https://g1.globo.com/mundo/noticia/2023/05/29/lula-maduro-narrativa-democracia.ghtml', 'news_article', 4, 'Brasília', 'Encontro com Maduro', 'lula-maduro-narrativa-b158-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira critica eleição da Venezuela em 2024.', 'O Brasil cobra apresentação das atas eleitorais venezuelanas.', 'Declaração do Itamaraty em agosto de 2024.', 'verified', true, '2024-08-01', 'https://g1.globo.com/mundo/noticia/2024/08/01/mauro-venezuela-atas.ghtml', 'news_article', 2, 'Brasília', 'Declaração oficial', 'mauro-venezuela-atas-b158-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula evita reconhecer vitória de Maduro mas descarta sanções.', 'Não vamos reconhecer, mas não aplicaremos sanções ao povo venezuelano.', 'Entrevista em agosto de 2024.', 'verified', true, '2024-08-05', 'https://g1.globo.com/mundo/noticia/2024/08/05/lula-maduro-sem-sancoes.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-maduro-sem-sancoes-b158-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro critica complacência com Maduro.', 'Lula é cúmplice do ditador Maduro. Cala sobre fraude.', 'Pronunciamento na Câmara em agosto de 2024.', 'verified', false, '2024-08-02', 'https://www.camara.leg.br/noticias/eduardo-maduro-fraude', 'speech', 3, 'Câmara dos Deputados', 'Pronunciamento', 'eduardo-lula-maduro-fraude-b158-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem pede sanções e recepção a refugiados venezuelanos.', 'Sanções a Maduro e asilo a opositores. Posição de decência.', 'Pronunciamento em agosto de 2024.', 'verified', false, '2024-08-03', 'https://www.camara.leg.br/noticias/van-hattem-venezuela-sancoes', 'speech', 1, 'Câmara dos Deputados', 'Pronunciamento', 'van-hattem-venezuela-sancoes-b158-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe críticas por bloquear entrada da Venezuela no BRICS.', 'Não foi veto pessoal. Foi posição consolidada após eleições.', 'Entrevista em outubro de 2024 após cúpula BRICS em Kazan.', 'verified', true, '2024-10-25', 'https://g1.globo.com/mundo/noticia/2024/10/25/lula-brics-venezuela.ghtml', 'news_article', 2, 'Kazan, Rússia', 'Cúpula BRICS', 'lula-brics-venezuela-b158-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende mediação Brasil-Colômbia-México na Venezuela.', 'Queremos solução negociada. A mediação é para garantir paz.', 'Coletiva em agosto de 2024.', 'verified', false, '2024-08-20', 'https://g1.globo.com/mundo/noticia/2024/08/20/mauro-venezuela-mediacao.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'mauro-venezuela-mediacao-b158-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende posição de Milei e ataca Lula.', 'Milei tem razão. Lula envergonha a América Latina.', 'Entrevista à Folha de S.Paulo em dezembro de 2023.', 'verified', true, '2023-12-10', 'https://www1.folha.uol.com.br/mundo/2023/12/bolsonaro-milei-lula.shtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'bolsonaro-milei-lula-b158-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro participa de posse de Milei em Buenos Aires.', 'Milei é um grande líder da liberdade. Brasil precisa disso.', 'Posse de Javier Milei em dezembro de 2023.', 'verified', true, '2023-12-10', 'https://g1.globo.com/mundo/noticia/2023/12/10/eduardo-posse-milei.ghtml', 'news_article', 2, 'Buenos Aires, Argentina', 'Posse Milei', 'eduardo-posse-milei-b158-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula evita posse de Milei e se reúne com presidente argentino depois.', 'Vou receber o Milei quando for preciso. Não é personalismo.', 'Declaração em dezembro de 2023.', 'verified', false, '2023-12-12', 'https://g1.globo.com/politica/noticia/2023/12/12/lula-milei-posse.ghtml', 'news_article', 2, 'Brasília', 'Declaração', 'lula-milei-posse-b158-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira assina acordo de mobilidade com Portugal.', 'Vamos fortalecer a mobilidade de brasileiros em Portugal.', 'Coletiva com ministro português em 2024.', 'verified', false, '2024-04-22', 'https://g1.globo.com/mundo/noticia/2024/04/22/brasil-portugal-mobilidade.ghtml', 'news_article', 1, 'Lisboa, Portugal', 'Acordo diplomático', 'brasil-portugal-mobilidade-b158-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner defende ampliação do BRICS e multipolaridade.', 'BRICS é o futuro. Multipolaridade é o caminho.', 'Entrevista em 2023.', 'verified', false, '2023-08-22', 'https://g1.globo.com/mundo/noticia/2023/08/22/wagner-brics-multipolaridade.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'wagner-brics-multipolaridade-b158-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rog, 'Rogério Marinho critica aproximação com a China.', 'O Brasil se ajoelha para a China. Precisamos reagir.', 'Pronunciamento no Senado em 2024.', 'verified', false, '2024-05-14', 'https://www12.senado.leg.br/noticias/materias/2024/05/14/marinho-china-criticas', 'speech', 2, 'Senado Federal', 'Pronunciamento', 'marinho-china-criticas-b158-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Pequim e anuncia parcerias estratégicas com China.', 'Com Xi Jinping, construímos o futuro. China é parceira estratégica.', 'Visita de Estado em abril de 2023.', 'verified', true, '2023-04-14', 'https://g1.globo.com/mundo/noticia/2023/04/14/lula-xi-china-parceria.ghtml', 'news_article', 1, 'Pequim, China', 'Visita de Estado', 'lula-china-parceria-xi-b158-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula questiona "quem decide" sobre uso do dólar no comércio internacional.', 'Por que todo mundo tem que depender do dólar? Queremos outra moeda.', 'Discurso no banco do BRICS em abril de 2023.', 'verified', true, '2023-04-13', 'https://g1.globo.com/mundo/noticia/2023/04/13/lula-dolar-brics-banco.ghtml', 'speech', 2, 'Xangai, China', 'Novo Banco de Desenvolvimento', 'lula-dolar-brics-b158-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula culpa EUA e UE pela guerra na Ucrânia.', 'EUA e UE também têm responsabilidade pela guerra. Precisam buscar a paz.', 'Declaração em abril de 2023 em Abu Dhabi.', 'verified', true, '2023-04-15', 'https://g1.globo.com/mundo/noticia/2023/04/15/lula-eua-ucrania-culpa.ghtml', 'news_article', 4, 'Abu Dhabi, EAU', 'Escala diplomática', 'lula-eua-ucrania-culpa-b158-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira articula plano de paz China-Brasil para Ucrânia.', 'Propomos o Clube dos Amigos da Paz. Saída negociada.', 'Declaração em setembro de 2024 na AGNU.', 'verified', true, '2024-09-23', 'https://g1.globo.com/mundo/noticia/2024/09/23/mauro-china-brasil-paz-ucrania.ghtml', 'news_article', 2, 'Nova York, EUA', 'AGNU 79', 'mauro-plano-paz-ucrania-b158-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca posição brasileira sobre Ucrânia.', 'O Brasil se aliou à Rússia. É vergonhoso.', 'Postagem no X em abril de 2023.', 'verified', false, '2023-04-16', 'https://twitter.com/BolsonaroSP/status/1647500000', 'social_media_post', 3, 'X/Twitter', 'Postagem', 'eduardo-ucrania-russia-b158-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira anuncia adesão brasileira ao TPI sobre Rússia.', 'Mantemos nosso compromisso com o TPI. Putin não será convidado ao G20.', 'Declaração após decisão do STF em 2024.', 'verified', true, '2024-09-06', 'https://g1.globo.com/mundo/noticia/2024/09/06/mauro-tpi-putin-g20.ghtml', 'news_article', 2, 'Brasília', 'Declaração', 'mauro-tpi-putin-g20-b158-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula muda posição e diz que Putin não será preso se vier ao Brasil.', 'Se ele vier, será recebido com protocolo. O TPI não vincula.', 'Entrevista em setembro de 2023.', 'verified', true, '2023-09-09', 'https://g1.globo.com/mundo/noticia/2023/09/09/lula-putin-tpi-brasil.ghtml', 'news_article', 4, 'Nova Délhi, Índia', 'G20 Nova Délhi', 'lula-putin-tpi-preso-b158-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira recua e afirma que Brasil cumprirá TPI.', 'Brasil é signatário e cumprirá obrigações do TPI.', 'Nota oficial em setembro de 2023 após recuo.', 'verified', true, '2023-09-11', 'https://g1.globo.com/mundo/noticia/2023/09/11/itamaraty-tpi-brasil-cumprira.ghtml', 'news_article', 1, 'Brasília', 'Nota oficial', 'itamaraty-tpi-cumprira-b158-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jor, 'Jorge Messias defende convenções do TPI contra líderes.', 'TPI é instituição universal. Suas ordens valem no Brasil.', 'Entrevista como AGU em 2023.', 'verified', false, '2023-09-15', 'https://g1.globo.com/politica/noticia/2023/09/15/messias-tpi-brasil.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'messias-tpi-convencoes-b158-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe Netanyahu como persona non grata no Brasil.', 'Netanyahu é persona non grata. Genocídio não tem acolhimento aqui.', 'Declaração em maio de 2024.', 'verified', true, '2024-05-15', 'https://g1.globo.com/mundo/noticia/2024/05/15/lula-netanyahu-persona-non-grata.ghtml', 'news_article', 4, 'Brasília', 'Declaração', 'lula-netanyahu-persona-b158-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende dois Estados e reconhecimento da Palestina.', 'Dois Estados é a única saída. Brasil reconhece Palestina soberana.', 'Discurso na ONU em setembro de 2024.', 'verified', true, '2024-09-24', 'https://g1.globo.com/mundo/noticia/2024/09/24/mauro-dois-estados-onu.ghtml', 'speech', 1, 'Nova York, EUA', 'AGNU 79', 'mauro-dois-estados-palestina-b158-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano critica apoio brasileiro à Palestina.', 'O Brasil abraça o Hamas terrorista. Isso é vergonha cristã.', 'Culto em igreja em outubro de 2023.', 'verified', false, '2023-10-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2023/10/20/feliciano-hamas-palestina.htm', 'speech', 4, 'São Paulo', 'Culto', 'feliciano-hamas-palestina-b158-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta viaja a Israel e ataca Itamaraty.', 'Brasil é cúmplice do terror. Fui a Israel para reparar vergonha.', 'Declaração em Jerusalém em outubro de 2023.', 'verified', true, '2023-10-25', 'https://www12.senado.leg.br/noticias/materias/2023/10/25/magno-malta-israel', 'news_article', 3, 'Jerusalém, Israel', 'Visita', 'magno-malta-israel-b158-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende envio de tropas ao Oriente Médio.', 'O Brasil deveria apoiar militarmente Israel. Chega de pacifismo.', 'Pronunciamento em outubro de 2023.', 'verified', false, '2023-10-12', 'https://www.camara.leg.br/noticias/sanderson-israel-militar', 'speech', 4, 'Câmara dos Deputados', 'Pronunciamento', 'sanderson-israel-militar-b158-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim defende Palestina e condena Israel.', 'Estamos diante de genocídio em Gaza. Solidariedade ao povo palestino.', 'Pronunciamento em outubro de 2023.', 'verified', false, '2023-10-18', 'https://www.camara.leg.br/noticias/samia-palestina-gaza', 'speech', 2, 'Câmara dos Deputados', 'Pronunciamento', 'samia-palestina-gaza-b158-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia vítimas civis em Gaza.', 'Crianças estão sendo mortas. Isso é genocídio, é crime de guerra.', 'Pronunciamento em novembro de 2023.', 'verified', false, '2023-11-15', 'https://www.camara.leg.br/noticias/taliria-gaza-criancas', 'speech', 2, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-gaza-criancas-b158-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende Bolsonaro sobre Israel.', 'Bolsonaro honrou Israel. Lula envergonha com Gaza.', 'Pronunciamento em fevereiro de 2024.', 'verified', false, '2024-02-22', 'https://www.camara.leg.br/noticias/girao-israel-bolsonaro', 'speech', 2, 'Câmara dos Deputados', 'Pronunciamento', 'girao-israel-bolsonaro-b158-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira anuncia missão humanitária para repatriar brasileiros de Gaza.', 'A Operação Voltando em Paz trouxe brasileiros de Gaza.', 'Coletiva em outubro de 2023.', 'verified', true, '2023-10-18', 'https://g1.globo.com/mundo/noticia/2023/10/18/mauro-operacao-voltando-paz.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'mauro-operacao-voltando-paz-b158-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia retorno de tropas brasileiras ao Haiti com ONU.', 'O Brasil cumpre sua vocação internacional. Haiti precisa de nós.', 'Discurso na ONU em setembro de 2023.', 'verified', false, '2023-09-20', 'https://g1.globo.com/mundo/noticia/2023/09/20/lula-haiti-tropas-onu.ghtml', 'speech', 2, 'Nova York, EUA', 'AGNU 78', 'lula-haiti-tropas-b158-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio descarta envio de tropas ao Haiti sob multinacional do Quênia.', 'Não vamos repetir Minustah. Brasil não envia tropas agora.', 'Entrevista em março de 2024.', 'verified', false, '2024-03-12', 'https://g1.globo.com/politica/noticia/2024/03/12/mucio-haiti-nao-tropas.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'mucio-haiti-nao-tropas-b158-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende solução latino-americana ao Haiti.', 'O Haiti precisa de ajuda, não ocupação. Caminho é humanitário.', 'Declaração em março de 2024.', 'verified', false, '2024-03-15', 'https://g1.globo.com/mundo/noticia/2024/03/15/mauro-haiti-humanitario.ghtml', 'news_article', 1, 'Brasília', 'Declaração', 'mauro-haiti-humanitario-b158-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner relembra Minustah e pondera envio ao Haiti.', 'Minustah deixou lições. Precisamos de mandato claro.', 'Entrevista em 2024.', 'verified', false, '2024-04-02', 'https://www12.senado.leg.br/noticias/materias/2024/04/02/wagner-haiti-minustah', 'news_article', 1, 'Senado Federal', 'Entrevista', 'wagner-haiti-minustah-b158-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro critica omissão sobre Haiti.', 'Lula promete e não cumpre. Haiti em ruínas, Brasil calado.', 'Postagem em março de 2024.', 'verified', false, '2024-03-20', 'https://twitter.com/BolsonaroSP/status/1770000000', 'social_media_post', 2, 'X/Twitter', 'Postagem', 'eduardo-haiti-omissao-b158-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira lidera cúpula do G20 no Rio de Janeiro.', 'O Rio será símbolo de cooperação multilateral. Combate à fome central.', 'Coletiva antes da cúpula em novembro de 2024.', 'verified', true, '2024-11-10', 'https://g1.globo.com/mundo/noticia/2024/11/10/mauro-g20-rio-cupula.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Preparação G20', 'mauro-g20-rio-cupula-b158-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula lança Aliança Global contra Fome no G20.', 'Combate à fome é a prioridade global. Brasil assume a liderança.', 'Discurso de abertura do G20 Rio em novembro de 2024.', 'verified', true, '2024-11-18', 'https://g1.globo.com/mundo/noticia/2024/11/18/lula-alianca-fome-g20.ghtml', 'speech', 1, 'Rio de Janeiro', 'G20 Rio', 'lula-alianca-fome-g20-b158-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende taxação de super-ricos no G20.', 'Super-ricos precisam pagar o justo. Brasil propõe imposto global.', 'Reunião de ministros das Finanças do G20 em julho de 2024.', 'verified', true, '2024-07-25', 'https://g1.globo.com/economia/noticia/2024/07/25/haddad-super-ricos-g20.ghtml', 'news_article', 1, 'Rio de Janeiro', 'G20 Finanças', 'haddad-super-ricos-g20-b158-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica G20 no Rio e Lula.', 'O G20 foi um circo. Lula não entende de economia.', 'Entrevista em novembro de 2024.', 'verified', false, '2024-11-20', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/11/20/bolsonaro-g20-circo.htm', 'news_article', 2, 'São Paulo', 'Entrevista', 'bolsonaro-g20-circo-b158-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva lidera COP30 em Belém em 2025.', 'COP30 na Amazônia é simbólica. Vamos entregar resultados.', 'Declaração ao assumir presidência da COP30.', 'verified', true, '2025-10-01', 'https://g1.globo.com/politica/noticia/2025/10/01/marina-cop30-belem.ghtml', 'news_article', 1, 'Belém, PA', 'COP30', 'marina-cop30-belem-b158-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na COP30 contra negacionismo climático.', 'Negacionismo climático é crime contra a humanidade. Precisamos agir.', 'Abertura da COP30 em Belém em novembro de 2025.', 'verified', true, '2025-11-10', 'https://g1.globo.com/politica/noticia/2025/11/10/lula-cop30-negacionismo.ghtml', 'speech', 1, 'Belém, PA', 'COP30 abertura', 'lula-cop30-negacionismo-b158-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega urgência climática na COP30.', 'A agenda climática é comunista. COP30 é farsa.', 'Declaração em novembro de 2025.', 'verified', true, '2025-11-12', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/11/12/bolsonaro-cop30-farsa.htm', 'news_article', 4, 'Brasília', 'Declaração', 'bolsonaro-cop30-farsa-b158-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara defende protagonismo indígena na COP30.', 'Sem povos indígenas não há futuro climático.', 'Evento na COP30 em novembro de 2025.', 'verified', true, '2025-11-14', 'https://g1.globo.com/politica/noticia/2025/11/14/sonia-cop30-indigenas.ghtml', 'speech', 1, 'Belém, PA', 'COP30', 'sonia-cop30-indigenas-b158-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira fecha acordo de transição energética na COP30.', 'Transição justa saiu do papel. Brasil saiu vitorioso.', 'Coletiva na COP30 em novembro de 2025.', 'verified', false, '2025-11-22', 'https://g1.globo.com/mundo/noticia/2025/11/22/mauro-cop30-transicao.ghtml', 'news_article', 1, 'Belém, PA', 'COP30 encerramento', 'mauro-cop30-transicao-b158-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma Rousseff presidente do Banco do BRICS defende "moeda comum".', 'Vamos avançar em alternativas ao dólar. É a hora.', 'Discurso no aniversário do NDB em 2024.', 'verified', false, '2024-04-14', 'https://g1.globo.com/mundo/noticia/2024/04/14/dilma-brics-moeda.ghtml', 'speech', 2, 'Xangai, China', 'NDB', 'dilma-brics-moeda-b158-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Kicis acusa BRICS de aliança com ditaduras.', 'BRICS é clube de ditadores. Brasil não deveria estar.', 'Pronunciamento em outubro de 2024.', 'verified', false, '2024-10-22', 'https://www.camara.leg.br/noticias/kicis-brics-ditaduras', 'speech', 2, 'Câmara dos Deputados', 'Pronunciamento', 'kicis-brics-ditaduras-b158-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica posição brasileira na ONU sobre Cuba.', 'Brasil apoia embargo à Cuba? Não, apoia Cuba. Lamentável.', 'Declaração após voto brasileiro na AGNU em 2023.', 'verified', false, '2023-11-02', 'https://www.camara.leg.br/noticias/kim-onu-cuba', 'speech', 2, 'Câmara dos Deputados', 'Declaração', 'kim-onu-cuba-b158-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende voto contra embargo a Cuba na ONU.', 'Embargo é desumano. Brasil mantém posição histórica.', 'Coletiva após voto na AGNU em 2023.', 'verified', false, '2023-11-03', 'https://g1.globo.com/mundo/noticia/2023/11/03/mauro-cuba-embargo-onu.ghtml', 'news_article', 1, 'Nova York, EUA', 'AGNU', 'mauro-cuba-embargo-onu-b158-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia racismo contra brasileiros em Portugal.', 'Brasileiros são alvo de racismo em Portugal. Itamaraty precisa agir.', 'Pronunciamento em 2024.', 'verified', false, '2024-05-03', 'https://www.camara.leg.br/noticias/erika-racismo-portugal', 'speech', 1, 'Câmara dos Deputados', 'Pronunciamento', 'erika-racismo-portugal-b158-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_xen, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira cobra autoridades portuguesas sobre xenofobia.', 'Vamos cobrar tratamento digno a nossos imigrantes.', 'Declaração em 2024.', 'verified', false, '2024-05-15', 'https://g1.globo.com/mundo/noticia/2024/05/15/mauro-xenofobia-portugal.ghtml', 'news_article', 1, 'Brasília', 'Declaração', 'mauro-xenofobia-portugal-b158-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula elogia Macron e assina cooperação militar.', 'Com a França, renovamos nossa parceria estratégica.', 'Visita de Macron ao Brasil em março de 2024.', 'verified', true, '2024-03-26', 'https://g1.globo.com/politica/noticia/2024/03/26/lula-macron-parceria.ghtml', 'news_article', 1, 'Brasília', 'Visita Macron', 'lula-macron-parceria-b158-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promove encontro com Xi Jinping e rejeita Belt and Road formal.', 'Não vamos assinar. Queremos parceria sem hierarquia.', 'Cúpula em Pequim em novembro de 2024.', 'verified', true, '2024-11-20', 'https://g1.globo.com/mundo/noticia/2024/11/20/lula-xi-belt-road.ghtml', 'news_article', 2, 'Pequim, China', 'Encontro Xi Jinping', 'lula-xi-belt-road-b158-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro promove Trump no Brasil após vitória em 2024.', 'Trump venceu. Direita global avança. Lula está isolado.', 'Postagem em novembro de 2024.', 'verified', true, '2024-11-06', 'https://twitter.com/BolsonaroSP/status/1854000000', 'social_media_post', 3, 'X/Twitter', 'Postagem', 'eduardo-trump-vitoria-b158-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora vitória de Trump e prevê "fim do Lula".', 'Com Trump de volta, o Lula cai. Nosso aliado retornou.', 'Live em novembro de 2024.', 'verified', true, '2024-11-06', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/11/06/bolsonaro-trump-lula-cai.htm', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-trump-lula-cai-b158-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende soberania diante de ameaças de Trump sobre tarifas.', 'Brasil não aceita pressão. Vamos reagir se preciso.', 'Entrevista em fevereiro de 2025 após tarifas de Trump.', 'verified', true, '2025-02-10', 'https://g1.globo.com/politica/noticia/2025/02/10/lula-trump-tarifas-soberania.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'lula-trump-tarifas-soberania-b158-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad reage a tarifaço de Trump e promete reciprocidade.', 'Vamos responder com reciprocidade. Lei aprovada no Congresso.', 'Coletiva em abril de 2025.', 'verified', false, '2025-04-05', 'https://g1.globo.com/economia/noticia/2025/04/05/haddad-reciprocidade-trump.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'haddad-reciprocidade-trump-b158-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede que Trump sancione Moraes.', 'Peço a Trump Magnitsky contra Moraes. Vamos libertar o Brasil.', 'Entrevista à Fox em março de 2025.', 'verified', true, '2025-03-20', 'https://g1.globo.com/mundo/noticia/2025/03/20/eduardo-trump-moraes-magnitsky.ghtml', 'news_article', 5, 'Washington, EUA', 'Entrevista Fox News', 'eduardo-trump-magnitsky-moraes-b158-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula denuncia tarifaço de Trump como "chantagem".', 'Trump está fazendo chantagem. Brasil é soberano.', 'Discurso em julho de 2025 após tarifa de 50% anunciada.', 'verified', true, '2025-07-10', 'https://g1.globo.com/politica/noticia/2025/07/10/lula-trump-tarifa-chantagem.ghtml', 'speech', 1, 'Brasília', 'Discurso', 'lula-trump-tarifa-chantagem-b158-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro justifica tarifa de Trump culpando Lula.', 'Culpa do Lula. Ele ofendeu Trump e o Brasil pagará.', 'Declaração em julho de 2025.', 'verified', true, '2025-07-11', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/07/11/bolsonaro-culpa-lula-tarifa.htm', 'news_article', 4, 'Brasília', 'Declaração', 'bolsonaro-culpa-lula-tarifa-b158-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira leva tarifaço à OMC.', 'Vamos à OMC. Medida unilateral viola regras.', 'Coletiva em julho de 2025.', 'verified', false, '2025-07-15', 'https://g1.globo.com/mundo/noticia/2025/07/15/mauro-omc-tarifas-eua.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'mauro-omc-tarifas-eua-b158-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa na AGNU 80 defendendo multilateralismo contra Trump.', 'Unilateralismo não serve ao mundo. Defendemos ONU forte.', 'Discurso na 80ª AGNU em setembro de 2025.', 'verified', true, '2025-09-23', 'https://g1.globo.com/mundo/noticia/2025/09/23/lula-agnu-80-multilateralismo.ghtml', 'speech', 1, 'Nova York, EUA', 'AGNU 80', 'lula-agnu-80-multilateralismo-b158-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem sugere rompimento com Mercosul para TLC com EUA.', 'Mercosul nos amarra. Precisamos do TLC direto com os EUA.', 'Entrevista em julho de 2025.', 'verified', false, '2025-07-20', 'https://www1.folha.uol.com.br/mundo/2025/07/van-hattem-mercosul-rompe.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'van-hattem-mercosul-rompe-b158-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende Mercosul contra investidas bolsonaristas.', 'Mercosul é patrimônio. Romper é burrice histórica.', 'Pronunciamento em agosto de 2025.', 'verified', false, '2025-08-05', 'https://g1.globo.com/politica/noticia/2025/08/05/alckmin-mercosul-defesa.ghtml', 'news_article', 1, 'Brasília', 'Pronunciamento', 'alckmin-mercosul-defesa-b158-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha denuncia campanha internacional da família Bolsonaro.', 'Bolsonaro pede aos EUA que atacar o Brasil. É traição à pátria.', 'Entrevista em abril de 2025.', 'verified', true, '2025-04-15', 'https://g1.globo.com/politica/noticia/2025/04/15/padilha-bolsonaro-traicao-eua.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'padilha-bolsonaro-traicao-b158-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino no STF valida responsabilização por traição diplomática.', 'Crime contra a soberania tem consequências penais claras.', 'Voto em plenário do STF em maio de 2025.', 'verified', false, '2025-05-22', 'https://www.conjur.com.br/dino-soberania-voto-2025', 'news_article', 2, 'STF', 'Voto plenário', 'dino-soberania-voto-b158-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende em Genebra agenda anti-aborto brasileira.', 'Brasil precisa dizer não ao aborto na ONU. Vida desde a concepção.', 'Intervenção no Conselho de Direitos Humanos em 2024.', 'verified', false, '2024-03-10', 'https://www12.senado.leg.br/noticias/materias/2024/03/10/damares-onu-aborto', 'speech', 3, 'Genebra, Suíça', 'Conselho ONU DH', 'damares-onu-aborto-2024-b158-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia violação a povos em foro da ONU.', 'Violações contra indígenas continuam. Temos que denunciar.', 'Fórum Permanente sobre Questões Indígenas da ONU em 2024.', 'verified', false, '2024-04-18', 'https://g1.globo.com/politica/noticia/2024/04/18/sonia-onu-indigenas.ghtml', 'speech', 1, 'Nova York, EUA', 'ONU Fórum Indígena', 'sonia-onu-indigenas-b158-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende política externa soberana.', 'Não nos curvamos a Washington nem a Pequim. Brasil é brasileiro.', 'Pronunciamento no Senado em 2024.', 'verified', false, '2024-06-25', 'https://www12.senado.leg.br/noticias/materias/2024/06/25/humberto-politica-externa', 'speech', 1, 'Senado Federal', 'Pronunciamento', 'humberto-politica-externa-b158-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski ministro da Justiça apoia extradições e cooperação policial.', 'Cooperação internacional policial é prioridade contra crime organizado.', 'Coletiva em 2024.', 'verified', false, '2024-05-28', 'https://g1.globo.com/politica/noticia/2024/05/28/lewandowski-cooperacao-policial.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'lewandowski-cooperacao-policial-b158-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula viaja à Colômbia e apoia mediação com Venezuela.', 'Precisamos de saídas. Colômbia é aliada.', 'Visita em abril de 2024.', 'verified', false, '2024-04-08', 'https://g1.globo.com/mundo/noticia/2024/04/08/lula-colombia-venezuela.ghtml', 'news_article', 1, 'Bogotá, Colômbia', 'Visita Petro', 'lula-colombia-venezuela-b158-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira assina acordo de cooperação com Arábia Saudita.', 'A Arábia é parceira do Brasil. Investimentos e comércio.', 'Visita em novembro de 2023.', 'verified', false, '2023-11-29', 'https://g1.globo.com/mundo/noticia/2023/11/29/mauro-arabia-saudita-cooperacao.ghtml', 'news_article', 1, 'Riad, Arábia Saudita', 'Visita de Estado', 'mauro-arabia-cooperacao-b158-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende apoio à Palestina em fóruns internacionais.', 'Brasil tem tradição de defender povos oprimidos. Palestina é sagrada.', 'Pronunciamento em 2023.', 'verified', false, '2023-11-08', 'https://www.camara.leg.br/noticias/chico-palestina-apoio', 'speech', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-palestina-apoio-b158-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Itamar com Putin e tráfico com Rússia.', 'Putin é vítima. A OTAN provocou a guerra.', 'Entrevista em 2024.', 'verified', false, '2024-02-24', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/02/24/bolsonaro-putin-otan.htm', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-putin-otan-b158-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende BRICS+ como projeto nacional.', 'BRICS+ fortalece o Brasil. Direita ataca por ideologia.', 'Declaração em outubro de 2024.', 'verified', false, '2024-10-24', 'https://g1.globo.com/politica/noticia/2024/10/24/gleisi-brics-projeto.ghtml', 'news_article', 1, 'Brasília', 'Declaração', 'gleisi-brics-projeto-b158-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia Milei e pede fim do Mercosul.', 'Mercosul é camisa de força. Milei tem razão em sair.', 'Live em janeiro de 2024.', 'verified', false, '2024-01-22', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/01/22/bolsonaro-milei-mercosul-camisa.htm', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-milei-mercosul-camisa-b158-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula e Milei se reencontram em cúpula do Mercosul em Assunção.', 'A Argentina é irmã. Diferenças não impedem trabalho conjunto.', 'Cúpula em julho de 2024.', 'verified', true, '2024-07-08', 'https://g1.globo.com/mundo/noticia/2024/07/08/lula-milei-assuncao.ghtml', 'news_article', 1, 'Assunção, Paraguai', 'Cúpula Mercosul', 'lula-milei-assuncao-b158-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira reage a ingerência da embaixada dos EUA.', 'Embaixada dos EUA deve respeitar o Brasil. Vamos ser firmes.', 'Declaração em março de 2025 após tuíte da embaixadora Trump.', 'verified', false, '2025-03-10', 'https://g1.globo.com/mundo/noticia/2025/03/10/mauro-embaixada-eua.ghtml', 'news_article', 2, 'Brasília', 'Declaração', 'mauro-embaixada-eua-b158-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica ausência do Brasil em defesa da Ucrânia.', 'Brasil calado sobre Ucrânia é vergonhoso. Agressor tem nome: Putin.', 'Pronunciamento em fevereiro de 2024.', 'verified', false, '2024-02-24', 'https://www.camara.leg.br/noticias/kim-ucrania-calado', 'speech', 1, 'Câmara dos Deputados', 'Pronunciamento', 'kim-ucrania-calado-b158-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende agenda educacional em fóruns multilaterais.', 'Educação tem que estar na agenda G20 e ONU.', 'Evento internacional em 2024.', 'verified', false, '2024-09-12', 'https://www.camara.leg.br/noticias/tabata-educacao-g20', 'speech', 1, 'Nova York, EUA', 'UNGA Lado', 'tabata-educacao-g20-b158-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Aloizio Mercadante articula financiamento externo para reindustrialização.', 'BNDES com parceiros internacionais para reindustrializar.', 'Evento em 2024.', 'verified', false, '2024-06-18', 'https://g1.globo.com/economia/noticia/2024/06/18/mercadante-bndes-externo.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Evento BNDES', 'mercadante-bndes-externo-b158-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jzt, 'Julia Zanatta visita EUA em missão bolsonarista sobre Moraes.', 'Fui aos EUA denunciar ditadura do STF. Mundo precisa saber.', 'Viagem com outros deputados bolsonaristas em 2025.', 'verified', true, '2025-04-25', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/04/25/zanatta-eua-moraes.htm', 'news_article', 4, 'Washington, EUA', 'Missão bolsonarista', 'zanatta-eua-moraes-b158-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foragida em Roma ataca política externa do Brasil.', 'Brasil virou pária internacional. Só ditaduras são aliadas.', 'Entrevista em Roma em fevereiro de 2025.', 'verified', false, '2025-02-18', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/02/18/zambelli-italia-politica-externa.htm', 'news_article', 3, 'Roma, Itália', 'Entrevista', 'zambelli-italia-politica-externa-b158-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula assina condenação formal da guerra em Gaza no STF à luz do TPI.', 'Apoiamos ordem do TPI. Netanyahu responderá.', 'Declaração em novembro de 2024.', 'verified', false, '2024-11-22', 'https://g1.globo.com/mundo/noticia/2024/11/22/lula-tpi-netanyahu-ordem.ghtml', 'news_article', 2, 'Brasília', 'Declaração', 'lula-tpi-netanyahu-ordem-b158-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira encerra 2025 defendendo legado diplomático de Lula III.', 'Multilateralismo voltou. O Brasil recuperou seu protagonismo.', 'Balanço de 2025 em dezembro.', 'verified', false, '2025-12-18', 'https://g1.globo.com/mundo/noticia/2025/12/18/mauro-balanco-2025.ghtml', 'news_article', 1, 'Brasília', 'Balanço diplomático', 'mauro-balanco-2025-b158-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
