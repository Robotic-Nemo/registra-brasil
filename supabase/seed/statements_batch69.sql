-- Batch 69: Bolsonaro family post-conviction (continuation, Dec 2025 - Apr 2026)
DO $$
DECLARE
  v_jair UUID; v_fla UUID; v_edu UUID; v_car UUID; v_mic UUID;
  v_nik UUID; v_bia UUID; v_mfe UUID; v_dam UUID; v_mou UUID;
  v_mag UUID; v_ram UUID; v_zam UUID; v_sil UUID; v_mor UUID;
  v_tar UUID; v_pab UUID; v_jan UUID; v_gle UUID; v_lul UUID;
  v_had UUID; v_mor2 UUID; v_din UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mor2 FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reclama de isolamento e compara cela a "tumba".', 'Isso aqui é uma tumba. Me enterraram vivo por pensar diferente.', 'Áudio vazado durante visita de advogado, distribuído em redes bolsonaristas.', 'verified', true, '2025-12-04', 'https://www1.folha.uol.com.br/poder/2025/12/bolsonaro-cela-tumba-audio.shtml', 'news_article', 3, 'Brasília', 'Áudio vazado', 'bolsonaro-cela-tumba-b69-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio pede que Senado rejeite indicação para o STF.', 'Não aprovaremos mais nenhum ministro enquanto meu pai estiver preso.', 'Discurso no Senado após indicação de novo nome à Suprema Corte.', 'verified', false, '2025-12-07', 'https://g1.globo.com/politica/noticia/2025/12/07/flavio-boicote-stf-indicacao.ghtml', 'news_article', 3, 'Senado Federal', 'Sessão de sabatina', 'flavio-boicote-stf-b69-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo participa de evento com Viktor Orbán na Hungria.', 'Aprendemos com o premiê Orbán como resistir ao globalismo que prende meu pai.', 'Foto com Orbán em evento ultraconservador em Budapeste.', 'verified', true, '2025-12-11', 'https://www.bbc.com/portuguese/articles/eduardo-orban-hungria', 'news_article', 4, 'Budapeste, Hungria', 'Cúpula CPAC Hungria', 'eduardo-orban-hungria-b69-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle critica vacinação escolar em evento religioso.', 'Essas vacinas na escola são veneno do governo para destruir nossas crianças.', 'Fala negacionista em culto em Vitória atraiu críticas de entidades médicas.', 'verified', true, '2025-12-13', 'https://veja.abril.com.br/politica/michelle-vacinas-escola-veneno/', 'news_article', 4, 'Vitória', 'Culto evangélico', 'michelle-vacinas-veneno-b69-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro mostra em vídeo suposto "dinheiro" de Moraes.', 'Olha o patrimônio do Moraes, essa é a tal Justiça.', 'Vídeo com informações falsas sobre patrimônio do ministro viralizou.', 'verified', true, '2025-12-17', 'https://www.metropoles.com/brasil/politica-br/carlos-video-moraes-patrimonio-falso', 'social_media_post', 4, 'Rio de Janeiro', 'Vídeo em rede social', 'carlos-moraes-patrimonio-b69-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reclama de comida da prisão em áudio viral.', 'A comida aqui é intragável. Querem me envenenar lentamente.', 'Áudio divulgado por Carlos em redes sociais.', 'verified', false, '2025-12-21', 'https://www.cnnbrasil.com.br/politica/bolsonaro-audio-comida-prisao/', 'social_media_post', 2, 'Brasília', 'Áudio da prisão', 'bolsonaro-comida-prisao-b69-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que pai "jamais" renunciará à direita.', 'Meu pai jamais vai renunciar à liderança da direita. Ele é o presidente moral.', 'Entrevista após rumores de que Tarcísio articulava sucessão.', 'verified', false, '2025-12-24', 'https://oglobo.globo.com/politica/flavio-pai-jamais-renuncia-direita/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'flavio-pai-jamais-renuncia-b69-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que filhos do casal estão "sofrendo bullying satânico".', 'Meus filhos sofrem bullying satânico nas escolas por causa do pai.', 'Declaração em evento em Uberaba considerada exagerada por comentaristas.', 'verified', false, '2025-12-27', 'https://noticias.uol.com.br/politica/2025/12/27/michelle-filhos-bullying-satanico.htm', 'news_article', 2, 'Uberaba', 'Evento evangélico', 'michelle-filhos-bullying-b69-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo associa governo Lula ao narcotráfico em postagem.', 'O governo Lula é aliado do tráfico internacional. Meu pai combatia. Por isso está preso.', 'Postagem em rede social com alegações sem provas.', 'verified', true, '2026-01-02', 'https://g1.globo.com/politica/noticia/2026/01/02/eduardo-lula-narcotrafico-postagem.ghtml', 'social_media_post', 4, 'EUA', 'Postagem em rede social', 'eduardo-lula-narcotrafico-b69-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos faz ataques homofóbicos em postagem contra ministro.', 'Ministro afeminado quer dar lição de moral. Que país é esse?', 'Postagem em rede social contra ministro do STF gerou ação penal.', 'verified', true, '2026-01-04', 'https://www1.folha.uol.com.br/poder/2026/01/carlos-ataque-homofobico-ministro.shtml', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-homofobia-ministro-b69-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio compara STF ao "Tribunal de Nuremberg às avessas".', 'O STF é um Nuremberg às avessas. Eles prendem os inocentes.', 'Discurso em tribuna do Senado.', 'verified', false, '2026-01-06', 'https://www.poder360.com.br/politica/flavio-stf-nuremberg-avessas/', 'news_article', 4, 'Senado Federal', 'Discurso plenário', 'flavio-nuremberg-b69-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle indica ter recebido "revelação divina" sobre candidatura.', 'Recebi em oração a revelação de que serei senadora para libertar meu marido.', 'Declaração em programa religioso da Record.', 'verified', false, '2026-01-09', 'https://veja.abril.com.br/politica/michelle-revelacao-divina-senado/', 'news_article', 2, 'Rio de Janeiro', 'Programa TV Record', 'michelle-revelacao-b69-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas posta chamadas para manifestação nas Forças Armadas.', 'Militares, é a hora! O povo está com vocês!', 'Postagem apagada rapidamente após ameaça de investigação.', 'verified', true, '2026-01-11', 'https://www.metropoles.com/brasil/politica-br/nikolas-convoca-militares', 'social_media_post', 5, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-convoca-militares-b69-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia generais que "se sacrificaram" por ele.', 'Os generais que estão presos comigo são verdadeiros heróis da pátria.', 'Mensagem manuscrita aos militares condenados pelo 8 de Janeiro.', 'verified', false, '2026-01-13', 'https://www.cnnbrasil.com.br/politica/bolsonaro-generais-presos-herois/', 'news_article', 4, 'Brasília', 'Carta aos militares', 'bolsonaro-generais-herois-b69-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio prega "limpeza" nos tribunais em entrevista.', 'Precisamos fazer uma limpeza em todos os tribunais do Brasil.', 'Entrevista polêmica em podcast conservador.', 'verified', false, '2026-01-14', 'https://oglobo.globo.com/politica/flavio-limpeza-tribunais-podcast/', 'news_article', 4, 'São Paulo', 'Podcast conservador', 'flavio-limpeza-tribunais-b69-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo divulga número de telefone de ministro nas redes.', 'Liguem para o ministro e digam o que acham da prisão do meu pai.', 'Vídeo que divulgou celular de Dino foi retirado pela plataforma.', 'verified', true, '2026-01-16', 'https://www.bbc.com/portuguese/articles/eduardo-telefone-ministro-dino', 'social_media_post', 5, 'EUA', 'Vídeo em rede social', 'eduardo-telefone-ministro-b69-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle defende que "mulher precisa obedecer ao marido".', 'A mulher precisa obedecer ao marido, assim fui criada e assim farei.', 'Fala em evento com mulheres evangélicas em São Paulo.', 'verified', true, '2026-01-19', 'https://www1.folha.uol.com.br/poder/2026/01/michelle-mulher-obedecer-marido.shtml', 'news_article', 4, 'São Paulo', 'Encontro PL Mulher', 'michelle-obedecer-marido-b69-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares aponta "satanismo" em políticas LGBT.', 'Essas políticas LGBT são satanismo disfarçado. Vamos combater sempre.', 'Declaração em evento no Senado.', 'verified', false, '2026-01-20', 'https://www.poder360.com.br/politica/damares-satanismo-lgbt/', 'news_article', 4, 'Senado Federal', 'Evento no Senado', 'damares-satanismo-lgbt-b69-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos critica irmão Flávio por "covardia" em bastidores.', 'Flávio tem medo de comprar briga de verdade. Só fala bonito em coletiva.', 'Mensagem vazada em grupo de WhatsApp chegou à imprensa.', 'verified', true, '2026-01-21', 'https://veja.abril.com.br/politica/carlos-flavio-covardia-whatsapp/', 'news_article', 2, 'Rio de Janeiro', 'Mensagem vazada', 'carlos-flavio-covardia-b69-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio defende corte de gastos com Bolsa Família em entrevista.', 'Vou cortar o Bolsa Família porque estimula preguiça.', 'Declaração de pré-campanha criticada por economistas e especialistas.', 'verified', false, '2026-01-23', 'https://g1.globo.com/politica/noticia/2026/01/23/flavio-corte-bolsa-familia.ghtml', 'news_article', 3, 'Brasília', 'Entrevista Jornal Nacional', 'flavio-corte-bolsa-familia-b69-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão descarta apoio a Flávio na eleição presidencial.', 'Não vou apoiar o Flávio. Precisamos de alguém preparado, não de sobrenome.', 'Entrevista rompendo com família Bolsonaro.', 'verified', true, '2026-01-24', 'https://www.cnnbrasil.com.br/politica/mourao-nao-apoia-flavio/', 'news_article', 2, 'Porto Alegre', 'Entrevista', 'mourao-nao-apoia-flavio-b69-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle ataca Lula em discurso com tom "apocalíptico".', 'Lula é o anticristo moderno. Precisamos expulsá-lo do poder.', 'Fala em culto em Campinas atraiu reações.', 'verified', true, '2026-01-28', 'https://noticias.uol.com.br/politica/2026/01/28/michelle-lula-anticristo.htm', 'news_article', 4, 'Campinas', 'Culto evangélico', 'michelle-lula-anticristo-b69-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo se aproxima do Partido Republicano em evento.', 'Somos irmãos ideológicos. O Brasil precisa virar aliado dos EUA como era com Bolsonaro.', 'Foto oficial com lideranças do GOP em evento na Flórida.', 'verified', false, '2026-01-30', 'https://oglobo.globo.com/politica/eduardo-gop-florida-evento/', 'news_article', 2, 'Flórida, EUA', 'Evento GOP', 'eduardo-gop-florida-b69-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reclama de falta de TV e pede que advogados entrem com ação.', 'Querem me deixar sem notícias. Isso é isolamento cruel e desumano.', 'Reclamação protocolada pela defesa na PF.', 'verified', false, '2026-02-01', 'https://www.metropoles.com/brasil/politica-br/bolsonaro-falta-tv-cela', 'news_article', 1, 'Brasília', 'Petição da defesa', 'bolsonaro-falta-tv-b69-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas afirma em entrevista que "democracia morreu" no Brasil.', 'A democracia brasileira morreu quando Bolsonaro foi preso.', 'Entrevista para portal de extrema direita.', 'verified', false, '2026-02-03', 'https://www.poder360.com.br/politica/nikolas-democracia-morreu-brasil/', 'news_article', 4, 'Belo Horizonte', 'Entrevista portal', 'nikolas-democracia-morreu-b69-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que "exterminará" a esquerda se eleito.', 'Se eleito, vou exterminar a esquerda brasileira, doa a quem doer.', 'Discurso em comício em Curitiba usando termo que gerou controvérsia.', 'verified', true, '2026-02-05', 'https://www1.folha.uol.com.br/poder/2026/02/flavio-exterminara-esquerda.shtml', 'news_article', 5, 'Curitiba', 'Comício', 'flavio-exterminar-esquerda-b69-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia Flávio por incitação à violência.', 'Flávio Bolsonaro prega o extermínio de adversários. Isso é crime.', 'Representação no MPF após discurso em Curitiba.', 'verified', false, '2026-02-06', 'https://veja.abril.com.br/politica/gleisi-denuncia-flavio-exterminio/', 'news_article', 1, 'Brasília', 'Representação MPF', 'gleisi-denuncia-flavio-b69-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz em TV que Bolsonaro pode se tornar "santo".', 'Meu marido está sendo santificado pelo sofrimento. Será reconhecido pela história.', 'Declaração em programa evangélico chocou até apoiadores.', 'verified', false, '2026-02-07', 'https://www.cnnbrasil.com.br/politica/michelle-bolsonaro-santo-tv/', 'news_article', 2, 'Rio de Janeiro', 'Programa evangélico', 'michelle-bolsonaro-santo-b69-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca senadora de esquerda com termo machista.', 'Essa senadora que chora toda hora não tem competência. Devia cuidar da família.', 'Postagem misógina viralizou entre bolsonaristas.', 'verified', true, '2026-02-10', 'https://g1.globo.com/politica/noticia/2026/02/10/carlos-ataque-machista-senadora.ghtml', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-ataque-senadora-b69-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo defende intervenção dos EUA em eleição brasileira.', 'Os EUA precisam garantir que a eleição brasileira de 2026 seja limpa.', 'Entrevista a site pró-Trump nos EUA.', 'verified', true, '2026-02-12', 'https://www.bbc.com/portuguese/articles/eduardo-eua-intervencao-eleicao-2026', 'news_article', 5, 'Washington, EUA', 'Entrevista portal', 'eduardo-intervencao-eua-b69-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio oferece cargo ministerial a Tarcísio em troca de apoio.', 'Se Tarcísio me apoiar, será meu ministro da Casa Civil.', 'Conversa vazada gerou crise entre aliados.', 'verified', true, '2026-02-14', 'https://oglobo.globo.com/politica/flavio-tarcisio-ministerio-vazamento/', 'news_article', 2, 'Brasília', 'Áudio vazado', 'flavio-tarcisio-ministerio-b69-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle nega que seja "marionete" do marido.', 'Não sou marionete de ninguém. Tenho minhas próprias ideias e vou implementá-las.', 'Resposta a pergunta em entrevista a Folha.', 'verified', false, '2026-02-16', 'https://www1.folha.uol.com.br/poder/2026/02/michelle-nao-sou-marionete.shtml', 'news_article', 1, 'Brasília', 'Entrevista Folha', 'michelle-nao-marionete-b69-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro envia carta defendendo indulto de natal perdido.', 'Lula me negou o indulto que era meu direito. Que ditadura.', 'Carta manuscrita divulgada pela família em rede social.', 'verified', false, '2026-02-17', 'https://www.poder360.com.br/politica/bolsonaro-carta-indulto-lula/', 'news_article', 2, 'Brasília', 'Carta manuscrita', 'bolsonaro-carta-indulto-b69-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas compara Moraes a "ditador soviético" em plenário.', 'Moraes é o Stálin brasileiro. Vai entrar para a história como ditador.', 'Discurso em plenário gerou representação no Conselho.', 'verified', true, '2026-02-18', 'https://veja.abril.com.br/politica/nikolas-moraes-stalin-plenario/', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-moraes-stalin-b69-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo se casa nos EUA, sem presença do pai preso.', 'É triste me casar sem meu pai. Mas faço isso para construir uma nova vida digna.', 'Cerimônia nos EUA foi acompanhada por apoiadores em live.', 'verified', false, '2026-02-20', 'https://noticias.uol.com.br/politica/2026/02/20/eduardo-casamento-eua-sem-pai.htm', 'news_article', 1, 'Flórida, EUA', 'Casamento', 'eduardo-casamento-eua-b69-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos critica publicamente o casamento do irmão nos EUA.', 'Enquanto papai tá preso, tem quem festeja fora do Brasil. Cada um sabe o que faz.', 'Postagem apagada em seguida atingiu Eduardo.', 'verified', false, '2026-02-21', 'https://www.metropoles.com/brasil/politica-br/carlos-critica-casamento-eduardo', 'social_media_post', 2, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-critica-casamento-b69-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio tenta mediar briga entre Carlos e Eduardo.', 'Carlos e Eduardo, cortem isso. Nossa luta é outra. Foquem.', 'Mensagem pública em rede social tentando conter crise interna.', 'verified', false, '2026-02-22', 'https://www.cnnbrasil.com.br/politica/flavio-mediar-carlos-eduardo/', 'social_media_post', 1, 'Brasília', 'Postagem em rede social', 'flavio-mediar-irmaos-b69-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que Lula "venderá o Brasil para a China".', 'Esse governo Lula vai vender o Brasil para os chineses comunistas.', 'Fala em comício em Belo Horizonte.', 'verified', false, '2026-02-24', 'https://g1.globo.com/politica/noticia/2026/02/24/michelle-lula-china-comunistas.ghtml', 'news_article', 3, 'Belo Horizonte', 'Comício', 'michelle-lula-china-b69-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis apresenta projeto de "punição" a ministros do STF.', 'Vou apresentar projeto para que ministros possam ser destituídos por crimes.', 'Anúncio em coletiva no Congresso.', 'verified', false, '2026-02-25', 'https://www1.folha.uol.com.br/poder/2026/02/bia-kicis-projeto-destituir-stf.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de imprensa', 'bia-kicis-destituir-stf-b69-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Feliciano defende "teocracia disfarçada" em culto.', 'Queremos um Brasil que obedeça às leis de Deus, não dos homens.', 'Discurso em culto gerou críticas sobre Estado laico.', 'verified', false, '2026-02-26', 'https://www.poder360.com.br/politica/feliciano-teocracia-culto/', 'news_article', 3, 'São Paulo', 'Culto evangélico', 'feliciano-teocracia-b69-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em vídeo vazado, elogia Trump em cela.', 'Trump é o único líder que entende minha situação. Que Deus o abençoe.', 'Vídeo gravado clandestinamente na cela chegou às redes.', 'verified', true, '2026-02-28', 'https://oglobo.globo.com/politica/bolsonaro-video-cela-trump/', 'social_media_post', 4, 'Brasília', 'Vídeo vazado', 'bolsonaro-video-trump-b69-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor2, 'Moraes manda apurar vídeo vazado de Bolsonaro e restringe visitas.', 'Apuraremos rigorosamente e as visitas serão restringidas.', 'Decisão imediata após vazamento de vídeo da cela.', 'verified', false, '2026-02-28', 'https://www.conjur.com.br/2026-fev-28/moraes-restringe-visitas-bolsonaro', 'news_article', 1, 'STF', 'Decisão judicial', 'moraes-restringe-visitas-b69-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio protesta restrição de visitas e chama de "tortura".', 'Isolar meu pai totalmente é tortura psicológica. Isso não passará impune.', 'Coletiva em protesto à decisão de Moraes.', 'verified', true, '2026-03-01', 'https://veja.abril.com.br/politica/flavio-tortura-psicologica-isolamento/', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'flavio-tortura-isolamento-b69-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle declara-se em "luto" e veste preto em eventos.', 'Estou de luto pela democracia e pelo meu marido. Vou vestir preto até ele sair.', 'Gesto simbólico adotado em pré-campanha.', 'verified', false, '2026-03-03', 'https://www.metropoles.com/brasil/politica-br/michelle-luto-preto-bolsonaro', 'news_article', 2, 'Brasília', 'Evento PL Mulher', 'michelle-luto-preto-b69-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro aciona rede estrangeira para "denunciar" Brasil.', 'Procurei a Newsmax e a Fox para contar a verdade sobre meu pai.', 'Postagem revelando articulação com mídia americana.', 'verified', false, '2026-03-04', 'https://www.cnnbrasil.com.br/politica/carlos-newsmax-fox-pai/', 'social_media_post', 3, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-newsmax-fox-b69-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo denuncia "genocídio" de evangélicos no Brasil.', 'No Brasil há um genocídio silencioso de evangélicos patriotas.', 'Depoimento em comitê religioso em Washington.', 'verified', true, '2026-03-05', 'https://www.bbc.com/portuguese/articles/eduardo-genocidio-evangelicos', 'news_article', 5, 'Washington, EUA', 'Comitê religioso', 'eduardo-genocidio-evangelicos-b69-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio ataca atuação do MST em propriedades rurais.', 'MST é organização terrorista. Vou tratar como tal se eleito.', 'Discurso a produtores rurais em Mato Grosso.', 'verified', false, '2026-03-06', 'https://g1.globo.com/politica/noticia/2026/03/06/flavio-mst-terrorista.ghtml', 'news_article', 3, 'Mato Grosso', 'Evento agronegócio', 'flavio-mst-terrorista-b69-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas afirma que "prisão política" justifica "resistência legítima".', 'Quando há prisão política, a resistência contra o regime é legítima.', 'Vídeo em canal de YouTube foi apagado pela plataforma.', 'verified', true, '2026-03-08', 'https://www1.folha.uol.com.br/poder/2026/03/nikolas-resistencia-legitima-regime.shtml', 'social_media_post', 5, 'Belo Horizonte', 'Vídeo em rede social', 'nikolas-resistencia-legitima-b69-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle agride verbalmente jornalista após pergunta incômoda.', 'Pergunta de lacraia, vai trabalhar. Não respondo.', 'Resposta agressiva em coletiva chocou profissionais de imprensa.', 'verified', true, '2026-03-09', 'https://veja.abril.com.br/politica/michelle-agride-jornalista-lacraia/', 'news_article', 4, 'São Paulo', 'Coletiva de imprensa', 'michelle-agride-jornalista-b69-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares compara STF a "inimigos de Deus".', 'Esses ministros são inimigos de Deus e do povo brasileiro.', 'Discurso em congresso eclesiástico.', 'verified', false, '2026-03-10', 'https://www.poder360.com.br/politica/damares-stf-inimigos-deus/', 'news_article', 4, 'Brasília', 'Congresso eclesiástico', 'damares-stf-inimigos-deus-b69-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "está com paciência no limite" em áudio.', 'Estou com paciência no limite. O povo precisa agir.', 'Áudio vazado em grupo bolsonarista provocou alerta.', 'verified', true, '2026-03-11', 'https://oglobo.globo.com/politica/bolsonaro-audio-paciencia-limite-povo/', 'social_media_post', 5, 'Brasília', 'Áudio vazado', 'bolsonaro-paciencia-limite-b69-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio diz que apoio do pai "vale por 30 milhões" de votos.', 'O apoio do meu pai vale por 30 milhões de votos. Ninguém supera.', 'Entrevista em rede nacional.', 'verified', false, '2026-03-12', 'https://www.cnnbrasil.com.br/politica/flavio-apoio-pai-30-milhoes-votos/', 'news_article', 1, 'Brasília', 'Entrevista CNN', 'flavio-30-milhoes-votos-b69-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo elogia golpe em país estrangeiro em postagem.', 'Que esse exemplo ecoe pelo mundo: exércitos patriotas defendem a liberdade.', 'Postagem em rede social após golpe em país asiático.', 'verified', true, '2026-03-13', 'https://noticias.uol.com.br/politica/2026/03/13/eduardo-elogia-golpe-pais.htm', 'social_media_post', 5, 'EUA', 'Postagem em rede social', 'eduardo-elogia-golpe-b69-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro divulga dados pessoais de juiz.', 'Esse é o juiz que condenou meu pai. Escola dos filhos, endereço, tudo.', 'Postagem que vazou dados pessoais de magistrado foi retirada.', 'verified', true, '2026-03-14', 'https://www.metropoles.com/brasil/politica-br/carlos-dados-pessoais-juiz', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-dados-juiz-b69-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que mulher "não pode se divorciar" em live.', 'Mulher cristã não se divorcia. Carrega a cruz ao lado do marido.', 'Declaração em live religiosa provocou polêmica.', 'verified', true, '2026-03-16', 'https://www1.folha.uol.com.br/poder/2026/03/michelle-divorcio-mulher-crista.shtml', 'news_article', 4, 'Brasília', 'Live em rede social', 'michelle-mulher-divorcio-b69-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio defende fim de cotas raciais em universidades.', 'Cotas raciais dividem o Brasil. No meu governo, acabo.', 'Debate da CNN sobre cotas como tema de campanha.', 'verified', false, '2026-03-17', 'https://veja.abril.com.br/politica/flavio-fim-cotas-raciais/', 'news_article', 3, 'São Paulo', 'Debate CNN', 'flavio-fim-cotas-b69-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas afirma que "multiculturalismo destruiu o Brasil".', 'Multiculturalismo é invenção comunista para destruir nações.', 'Fala em evento jovem conservador.', 'verified', false, '2026-03-18', 'https://www.poder360.com.br/politica/nikolas-multiculturalismo-destrui/', 'news_article', 3, 'Porto Alegre', 'Evento jovem', 'nikolas-multiculturalismo-b69-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede aos filhos que "não brigam" em carta.', 'Meus filhos, parem com brigas. A família é minha maior preocupação aqui dentro.', 'Carta manuscrita após vazamentos de brigas entre Carlos e Eduardo.', 'verified', true, '2026-03-19', 'https://g1.globo.com/politica/noticia/2026/03/19/bolsonaro-carta-filhos-brigas.ghtml', 'news_article', 2, 'Brasília', 'Carta manuscrita', 'bolsonaro-carta-filhos-brigas-b69-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle é acusada de usar verba pública em pré-campanha.', 'Não uso dinheiro do contribuinte. Tudo são doações dos fiéis.', 'Resposta a denúncia apresentada ao TSE.', 'verified', false, '2026-03-20', 'https://www.cnnbrasil.com.br/politica/michelle-verba-publica-campanha/', 'news_article', 2, 'Brasília', 'Resposta TSE', 'michelle-verba-publica-b69-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em sua primeira entrevista na prisão, ameaça "retornar".', 'Vou voltar, cedo ou tarde. O Brasil precisa de mim.', 'Primeira entrevista por escrito respondendo a Folha.', 'verified', true, '2026-03-20', 'https://www1.folha.uol.com.br/poder/2026/03/bolsonaro-entrevista-prisao-retorno.shtml', 'news_article', 3, 'Brasília', 'Entrevista escrita', 'bolsonaro-entrevista-retorno-b69-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio alinha discurso com setores empresariais conservadores.', 'O empresariado bolsonarista pode contar comigo. Vou pôr ordem no país.', 'Reunião com FIESP em São Paulo.', 'verified', false, '2026-03-22', 'https://oglobo.globo.com/politica/flavio-fiesp-empresariado/', 'news_article', 1, 'São Paulo', 'Reunião FIESP', 'flavio-fiesp-b69-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo ataca Gleisi em postagem misógina.', 'A Gleisi é apenas uma mulher raivosa que odeia meu pai.', 'Postagem misógina gerou ação judicial.', 'verified', true, '2026-03-23', 'https://veja.abril.com.br/politica/eduardo-ataque-gleisi-misoginia/', 'social_media_post', 4, 'EUA', 'Postagem em rede social', 'eduardo-ataque-gleisi-b69-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos insulta ministra negra em postagem racista.', 'Essa ministra só chegou ao cargo por cor da pele. Incompetente.', 'Postagem racista contra ministra do STF virou notícia internacional.', 'verified', true, '2026-03-24', 'https://www.metropoles.com/brasil/politica-br/carlos-ministra-negra-racismo', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-racismo-ministra-b69-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle cancela ato em favela depois de ameaça.', 'Infelizmente não posso ir à favela. É terreno do tráfico, não da democracia.', 'Cancelamento com declaração criticada por entidades.', 'verified', false, '2026-03-26', 'https://www.poder360.com.br/politica/michelle-cancela-favela-trafico/', 'news_article', 3, 'Rio de Janeiro', 'Cancelamento de agenda', 'michelle-cancela-favela-b69-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz piada sobre morte de indigenista.', 'Mais um esquerdista que foi para o céu dos índios.', 'Postagem chocou e foi denunciada por associações indígenas.', 'verified', true, '2026-03-27', 'https://www1.folha.uol.com.br/poder/2026/03/nikolas-piada-morte-indigenista.shtml', 'social_media_post', 5, 'Belo Horizonte', 'Postagem em rede social', 'nikolas-piada-indigenista-b69-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio apoia projeto contra ONGs ambientalistas.', 'ONGs ambientalistas estão destruindo o Brasil. Vou cortar tudo.', 'Discurso em plenário do Senado.', 'verified', false, '2026-03-29', 'https://g1.globo.com/politica/noticia/2026/03/29/flavio-ongs-ambientais-corte.ghtml', 'news_article', 3, 'Senado Federal', 'Discurso plenário', 'flavio-ongs-ambientais-b69-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo associa vacina Covid à "marca da besta" em postagem.', 'A vacina Covid é o ensaio para a marca da besta. Apocalipse está perto.', 'Postagem em rede social com conteúdo negacionista.', 'verified', true, '2026-03-30', 'https://www.cnnbrasil.com.br/politica/eduardo-vacina-marca-besta/', 'social_media_post', 4, 'EUA', 'Postagem em rede social', 'eduardo-vacina-besta-b69-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que "os comunistas querem sequestrar o Natal".', 'Comunistas do Lula querem sequestrar o Natal. Jesus é brasileiro!', 'Declaração em evento evangélico pós-Carnaval.', 'verified', false, '2026-03-31', 'https://noticias.uol.com.br/politica/2026/03/31/michelle-comunistas-natal-jesus.htm', 'news_article', 3, 'Brasília', 'Evento evangélico', 'michelle-comunistas-natal-b69-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro comemora ataque hacker contra TSE em postagem.', 'Viva os hackers patriotas que derrubaram o sistema corrupto do TSE.', 'Postagem apagada em minutos gerou inquérito.', 'verified', true, '2026-04-01', 'https://oglobo.globo.com/politica/carlos-hackers-tse-postagem/', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-hackers-tse-b69-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio ataca Moraes em discurso de abertura de convenção do PL.', 'Vamos eleger um presidente que aposente o Moraes da vida pública.', 'Discurso na convenção nacional do PL.', 'verified', true, '2026-04-02', 'https://veja.abril.com.br/politica/flavio-convencao-pl-moraes/', 'news_article', 4, 'Brasília', 'Convenção nacional PL', 'flavio-convencao-moraes-b69-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle anuncia site com doações para "libertar marido".', 'Lançamos o site para arrecadar doações pela libertação do meu marido.', 'Iniciativa foi alvo de apuração do TSE e MP.', 'verified', true, '2026-04-03', 'https://www.metropoles.com/brasil/politica-br/michelle-site-doacoes-bolsonaro', 'news_article', 3, 'Brasília', 'Lançamento de site', 'michelle-site-doacoes-b69-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede desculpas a Lula em mensagem filtrada.', 'Se houve excessos de minha parte, lamento. Quero paz.', 'Mensagem vazada foi considerada desmentida pela família.', 'verified', true, '2026-04-04', 'https://www1.folha.uol.com.br/poder/2026/04/bolsonaro-desculpas-lula-mensagem.shtml', 'news_article', 3, 'Brasília', 'Mensagem vazada', 'bolsonaro-desculpas-lula-b69-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio desmente mensagem de desculpa do pai a Lula.', 'Meu pai nunca pediu desculpa a Lula. Essa mensagem é falsa.', 'Coletiva para negar autenticidade da mensagem vazada.', 'verified', false, '2026-04-04', 'https://www.poder360.com.br/politica/flavio-desmente-desculpa-pai-lula/', 'news_article', 2, 'Brasília', 'Coletiva', 'flavio-desmente-desculpas-b69-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo convoca apoiadores a "não se resignar" com prisão.', 'Não podemos nos resignar com a prisão do meu pai. Resistência, sempre.', 'Vídeo conclamando protestos contínuos.', 'verified', false, '2026-04-05', 'https://g1.globo.com/politica/noticia/2026/04/05/eduardo-nao-resignar-prisao.ghtml', 'social_media_post', 3, 'EUA', 'Vídeo em rede social', 'eduardo-nao-resignar-b69-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos cria conta alternativa após bloqueios.', 'Moraes me bloqueia numa conta, eu crio dez novas. Nunca vão me calar.', 'Postagem em nova conta após bloqueios judiciais.', 'verified', false, '2026-04-06', 'https://www.cnnbrasil.com.br/politica/carlos-contas-alternativas-moraes-bloqueio/', 'social_media_post', 3, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-contas-alternativas-b69-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle convoca "oração coletiva" no dia do julgamento de recurso.', 'Convoco todos os evangélicos para orar no dia do julgamento.', 'Convocação em redes sociais para dia de decisão do STF.', 'verified', false, '2026-04-07', 'https://veja.abril.com.br/politica/michelle-oracao-coletiva-julgamento-stf/', 'news_article', 2, 'Brasília', 'Convocação rede social', 'michelle-oracao-coletiva-b69-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio publica manifesto "pela liberdade" com 50 aliados.', 'Nós, patriotas, assinamos manifesto pela libertação imediata de Bolsonaro.', 'Manifesto apresentado ao STF em ato em Brasília.', 'verified', false, '2026-04-08', 'https://noticias.uol.com.br/politica/2026/04/08/flavio-manifesto-liberdade.htm', 'news_article', 3, 'Brasília', 'Ato público', 'flavio-manifesto-liberdade-b69-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo defende autoritarismo em entrevista.', 'Às vezes o Brasil precisa de mão firme. Liberdade com responsabilidade.', 'Entrevista a podcast pró-Trump.', 'verified', false, '2026-04-10', 'https://www.metropoles.com/brasil/politica-br/eduardo-autoritarismo-mao-firme', 'news_article', 4, 'EUA', 'Podcast', 'eduardo-autoritarismo-b69-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas atira insultos homofóbicos contra deputado.', 'Esse deputado afeminado não é exemplo para nossas crianças.', 'Fala em plenário gerou pedido de cassação.', 'verified', true, '2026-04-11', 'https://www1.folha.uol.com.br/poder/2026/04/nikolas-insulto-homofobico-deputado.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Sessão plenária', 'nikolas-insulto-deputado-b69-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro envia áudio dizendo que "não deixarei filho gay".', 'Nenhum filho meu será gay enquanto eu for pai.', 'Áudio antigo revivido em rede após fala de Nikolas.', 'verified', true, '2026-04-12', 'https://oglobo.globo.com/politica/bolsonaro-audio-filho-gay/', 'social_media_post', 4, 'Brasília', 'Áudio vazado', 'bolsonaro-filho-gay-b69-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio anuncia programa "Brasil sem Esquerda" de campanha.', 'Meu programa se chama Brasil sem Esquerda. Vamos erradicar a praga.', 'Lançamento de programa de governo.', 'verified', true, '2026-04-12', 'https://g1.globo.com/politica/noticia/2026/04/12/flavio-programa-brasil-sem-esquerda.ghtml', 'news_article', 4, 'São Paulo', 'Lançamento de programa', 'flavio-brasil-sem-esquerda-b69-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle defende abolição do "ministério dos direitos humanos".', 'Não precisamos de ministério dos direitos humanos. Acabo com ele.', 'Fala em evento do PL.', 'verified', false, '2026-04-13', 'https://veja.abril.com.br/politica/michelle-abolir-direitos-humanos/', 'news_article', 4, 'Brasília', 'Evento PL', 'michelle-abolir-direitos-humanos-b69-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos critica apoiadores que visitam Bolsonaro sem permissão.', 'Tem apoiador querendo aparecer em foto ao lado do papai. Não é hora.', 'Postagem em rede social desautorizando aliados.', 'verified', false, '2026-04-14', 'https://www.cnnbrasil.com.br/politica/carlos-apoiadores-visitas-bolsonaro/', 'social_media_post', 1, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-apoiadores-visitas-b69-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo chama ministros do STF de "bandidos togados".', 'Bandidos togados que prendem inocentes e soltam criminosos.', 'Entrevista a jornal de oposição.', 'verified', false, '2026-04-14', 'https://www.poder360.com.br/politica/eduardo-ministros-bandidos-togados/', 'news_article', 4, 'EUA', 'Entrevista jornal', 'eduardo-bandidos-togados-b69-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reclama por carta de Lula ter perdoado outros presos, menos ele.', 'Lula perdoa aliado, mas mim, jamais. É vingança pessoal.', 'Carta divulgada após Lula conceder indultos tradicionais.', 'verified', false, '2026-04-15', 'https://www1.folha.uol.com.br/poder/2026/04/bolsonaro-carta-lula-indulto-perdao.shtml', 'news_article', 2, 'Brasília', 'Carta manuscrita', 'bolsonaro-carta-indulto-lula-b69-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle faz ataque em comício: "Lula é o anticristo".', 'Digo com todas as letras: Lula é o anticristo do nosso tempo.', 'Comício em Salvador gerou polêmica.', 'verified', true, '2026-04-15', 'https://oglobo.globo.com/politica/michelle-anticristo-salvador-comicio/', 'news_article', 5, 'Salvador', 'Comício', 'michelle-anticristo-salvador-b69-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio revela plano de "expurgo" no judiciário se eleito.', 'Vou fazer um expurgo no judiciário. Quem prendeu meu pai sai.', 'Entrevista a programa de TV conservador.', 'verified', true, '2026-04-16', 'https://veja.abril.com.br/politica/flavio-expurgo-judiciario/', 'news_article', 5, 'São Paulo', 'Entrevista TV', 'flavio-expurgo-judiciario-b69-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo diz que "disparar algoritmos" contra STF em campanha.', 'Vamos disparar conteúdo sobre a ditadura togada em todas as redes.', 'Áudio vazado em reunião com marqueteiros nos EUA.', 'verified', true, '2026-04-16', 'https://noticias.uol.com.br/politica/2026/04/16/eduardo-disparar-algoritmos-stf.htm', 'news_article', 4, 'Flórida, EUA', 'Áudio vazado', 'eduardo-disparar-algoritmos-b69-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos xinga ator por defender Lula em postagem ofensiva.', 'Esse ator mané defende o Lula ladrão. Macaco de auditório.', 'Ofensa em rede social gerou processo de ator.', 'verified', true, '2026-04-16', 'https://www.metropoles.com/brasil/politica-br/carlos-xinga-ator-macaco', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-xinga-ator-b69-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro elogia Netanyahu em mensagem vazada.', 'Netanyahu é um líder. Salva seu país mesmo perseguido.', 'Carta manuscrita divulgada por Michelle.', 'verified', false, '2026-04-16', 'https://www.cnnbrasil.com.br/politica/bolsonaro-carta-netanyahu-elogio/', 'news_article', 2, 'Brasília', 'Carta manuscrita', 'bolsonaro-netanyahu-b69-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle diz que "nunca processará adversário" para bancar imagem.', 'Eu perdôo, não processo. Esses são valores cristãos que o Lula não tem.', 'Declaração em entrevista em Belo Horizonte.', 'verified', false, '2026-04-16', 'https://g1.globo.com/politica/noticia/2026/04/16/michelle-nunca-processara-adversario.ghtml', 'news_article', 1, 'Belo Horizonte', 'Entrevista', 'michelle-nao-processa-b69-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio critica reforma tributária e promete revogar.', 'Reforma tributária é assalto. Revogarei tudo no meu primeiro dia.', 'Discurso em evento do agronegócio.', 'verified', false, '2026-04-16', 'https://oglobo.globo.com/politica/flavio-reforma-tributaria-revogar/', 'news_article', 2, 'Ribeirão Preto', 'Evento agronegócio', 'flavio-reforma-tributaria-b69-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em carta, ataca Tarcísio como "traidor".', 'Tarcísio me abandonou. Quem não estende a mão agora será lembrado.', 'Trecho de carta divulgado por aliado causou crise.', 'verified', true, '2026-04-16', 'https://veja.abril.com.br/politica/bolsonaro-carta-tarcisio-traidor/', 'news_article', 3, 'Brasília', 'Carta vazada', 'bolsonaro-tarcisio-traidor-b69-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio rebate fala de Bolsonaro e nega abandono.', 'Nunca abandonei o presidente. Tenho dever de governar São Paulo.', 'Coletiva em resposta à carta vazada de Bolsonaro.', 'verified', false, '2026-04-16', 'https://www.poder360.com.br/politica/tarcisio-rebate-bolsonaro-abandono/', 'news_article', 1, 'São Paulo', 'Coletiva', 'tarcisio-rebate-bolsonaro-b69-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo se reúne com senadores republicanos sobre "Lei Magnitsky contra Moraes".', 'Senadores americanos estão prontos para aplicar Magnitsky contra ministros do STF.', 'Reunião formal no Capitólio dos EUA.', 'verified', true, '2026-04-17', 'https://www.bbc.com/portuguese/articles/eduardo-capitolio-magnitsky-stf', 'news_article', 5, 'Washington, EUA', 'Reunião Capitólio', 'eduardo-capitolio-magnitsky-b69-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos organiza "dossiê" contra juízes em postagem.', 'Estamos montando dossiê contra todos os juízes que condenaram meu pai.', 'Postagem em rede social alardeando uso de recursos de inteligência.', 'verified', true, '2026-04-17', 'https://www1.folha.uol.com.br/poder/2026/04/carlos-dossie-juizes.shtml', 'social_media_post', 5, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-dossie-juizes-b69-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle promete "comandar" país junto com Bolsonaro preso.', 'Não sou só esposa. Vou ajudar a comandar o Brasil pelas costas do poder.', 'Declaração em comício em Florianópolis.', 'verified', true, '2026-04-17', 'https://www.cnnbrasil.com.br/politica/michelle-comandar-brasil-bolsonaro/', 'news_article', 4, 'Florianópolis', 'Comício', 'michelle-comandar-brasil-b69-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio afirma que PL apoiará Michelle ao Senado com força total.', 'Michelle tem o apoio total do PL. Vamos elegê-la com folga.', 'Entrevista após almoço com Valdemar Costa Neto.', 'verified', false, '2026-04-17', 'https://oglobo.globo.com/politica/flavio-pl-apoiara-michelle-senado/', 'news_article', 1, 'Brasília', 'Entrevista', 'flavio-pl-michelle-senado-b69-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro, em nova carta, "delega poderes" à família para liderar bolsonarismo.', 'Delego a Flávio, Michelle e Eduardo a missão de comandar meu movimento.', 'Carta lida em ato em Brasília por Michelle.', 'verified', true, '2026-04-17', 'https://g1.globo.com/politica/noticia/2026/04/17/bolsonaro-delega-poderes-familia.ghtml', 'news_article', 3, 'Brasília', 'Carta lida em ato', 'bolsonaro-delega-poderes-b69-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo promete "nunca perdoar" ministros do STF se família voltar ao poder.', 'Quando voltarmos, os ministros que prenderam meu pai pagarão. Prometo.', 'Vídeo gravado após reunião em Washington.', 'verified', true, '2026-04-17', 'https://veja.abril.com.br/politica/eduardo-nunca-perdoar-ministros-stf/', 'social_media_post', 5, 'Washington, EUA', 'Vídeo em rede social', 'eduardo-nunca-perdoar-b69-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
