-- Batch 130: Impacto segundo mandato Trump no Brasil - Parte 1 (Jan 2025 - Ago 2025)
DO $$
DECLARE
  v_lul UUID; v_mau UUID; v_alc UUID; v_had UUID; v_edu UUID;
  v_fla UUID; v_jai UUID; v_car UUID; v_nik UUID; v_bia UUID;
  v_mvh UUID; v_pab UUID; v_tar UUID; v_cai UUID; v_zem UUID;
  v_mor UUID; v_cir UUID; v_gle UUID; v_ran UUID; v_teb UUID;
  v_msi UUID; v_fav UUID; v_muc UUID; v_pad UUID; v_ruc UUID;
  v_mes UUID; v_lew UUID; v_amo UUID; v_din UUID; v_gil UUID;
  v_hum UUID; v_hmo UUID; v_dav UUID; v_rom UUID; v_mpo UUID;
  v_sor UUID; v_mic UUID;
  c_ant UUID; c_des UUID; c_xen UUID; c_irr UUID; c_abu UUID;
  c_aut UUID; c_ame UUID; c_odi UUID; c_con UUID; c_int UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_ruc FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_amo FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_mpo FROM politicians WHERE slug = 'marcos-pontes';
  SELECT id INTO v_sor FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que relação com Trump será pragmática apesar de divergências ideológicas.', 'Vamos tratar com qualquer presidente americano com respeito e buscar o interesse do Brasil.', 'Entrevista coletiva após posse de Donald Trump nos Estados Unidos.', 'verified', true, '2025-01-21', 'https://www1.folha.uol.com.br/mundo/2025/01/lula-diz-que-relacao-com-trump-sera-pragmatica.shtml', 'news_article', 2, 'Brasília', 'Coletiva de imprensa no Planalto', 'lula-relacao-trump-pragmatica-b130-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro comparece à posse de Trump e afirma que bolsonarismo e trumpismo são um só movimento.', 'Estamos juntos em Washington porque bolsonarismo e trumpismo são o mesmo movimento pela liberdade.', 'Declaração dada após participar das cerimônias de posse em Washington.', 'verified', true, '2025-01-20', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-posse-trump-bolsonarismo-trumpismo/', 'news_article', 3, 'Washington, EUA', 'Posse de Donald Trump', 'eduardo-posse-trump-b130-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro parabeniza Trump e diz que posse inaugura nova era global conservadora.', 'Parabéns ao presidente Trump. Começa hoje uma nova era para a direita mundial.', 'Publicação em rede social após a posse de Trump.', 'verified', true, '2025-01-20', 'https://g1.globo.com/politica/noticia/2025/01/20/bolsonaro-parabeniza-trump-posse.ghtml', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'bolsonaro-parabens-trump-b130-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira rejeita ameaças tarifárias de Trump e promete reciprocidade.', 'O Brasil não aceita chantagem comercial e responderá com reciprocidade se houver agressão.', 'Entrevista concedida em Brasília após Trump ameaçar impor tarifas sobre países do BRICS.', 'verified', true, '2025-02-03', 'https://www.reuters.com/world/americas/brazil-foreign-minister-trump-tariffs-brics/', 'news_article', 2, 'Brasília', 'Coletiva no Itamaraty', 'mauro-vieira-tarifas-trump-b130-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se reúne com Marco Rubio e pede pressão dos EUA sobre STF.', 'Pedi ao secretário Rubio que os EUA analisem sanções contra ministros que perseguem conservadores.', 'Reunião no Departamento de Estado americano, confirmada por assessores do senador Rubio.', 'verified', true, '2025-02-10', 'https://www.politico.com/news/2025/02/10/eduardo-bolsonaro-rubio-brazil-supreme-court/', 'news_article', 5, 'Washington, EUA', 'Reunião no Departamento de Estado', 'eduardo-rubio-stf-b130-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin diz que tarifas de Trump prejudicariam ambos os países e pede diálogo.', 'Tarifas unilaterais prejudicam o comércio dos dois lados. Vamos negociar com firmeza.', 'Declaração após reunião com setores industriais em São Paulo.', 'verified', false, '2025-02-12', 'https://valor.globo.com/brasil/noticia/2025/02/12/alckmin-tarifas-trump-dialogo.ghtml', 'news_article', 1, 'São Paulo', 'Reunião com FIESP', 'alckmin-tarifas-dialogo-b130-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira celebra primeira ordem executiva de Trump contra imigrantes.', 'Trump está dando exemplo. Brasil precisa fechar fronteiras como os EUA estão fazendo.', 'Postagem após Trump assinar decretos migratórios no primeiro dia de governo.', 'verified', true, '2025-01-21', 'https://www.metropoles.com/brasil/politica-br/nikolas-ferreira-trump-imigracao', 'social_media_post', 3, 'Brasília', 'Postagem em rede social', 'nikolas-trump-imigracao-b130-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis defende que Brasil siga modelo Trump e saia da OMS.', 'Trump já saiu da OMS. O Brasil precisa seguir o mesmo caminho de soberania.', 'Declaração em entrevista a rádio em Brasília.', 'verified', false, '2025-01-23', 'https://www.poder360.com.br/congresso/bia-kicis-oms-trump/', 'news_article', 3, 'Brasília', 'Entrevista à rádio', 'bia-kicis-oms-trump-b130-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica saída dos EUA do Acordo de Paris e chama de crime contra a humanidade.', 'Retirar-se do Acordo de Paris é um crime contra as próximas gerações.', 'Discurso em cerimônia no Palácio do Planalto sobre meio ambiente.', 'verified', true, '2025-01-24', 'https://www.nytimes.com/2025/01/24/world/americas/lula-trump-paris-agreement.html', 'news_article', 2, 'Brasília', 'Cerimônia no Palácio do Planalto', 'lula-critica-saida-paris-b130-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva diz que decisão de Trump isola EUA na agenda climática.', 'Os Estados Unidos se isolam. O Brasil segue liderando a agenda climática global.', 'Declaração durante preparativos da COP30 em Belém.', 'verified', false, '2025-01-25', 'https://www1.folha.uol.com.br/ambiente/2025/01/marina-silva-trump-clima-cop30.shtml', 'news_article', 1, 'Brasília', 'Reunião preparatória da COP30', 'marina-trump-isolamento-clima-b130-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro discursa em evento do CPAC em Washington atacando o STF brasileiro.', 'Há uma tirania judicial no Brasil e precisamos do apoio dos conservadores americanos.', 'Discurso no CPAC de Washington em fevereiro.', 'verified', true, '2025-02-20', 'https://www.washingtonpost.com/world/2025/02/20/cpac-eduardo-bolsonaro-brazil/', 'news_article', 5, 'Washington, EUA', 'CPAC 2025', 'eduardo-cpac-washington-b130-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro defende que senadores republicanos cobrem sanções Magnitsky contra Moraes.', 'Senadores como Rick Scott precisam aplicar a Lei Magnitsky contra Alexandre de Moraes.', 'Entrevista a programa conservador em viagem aos EUA.', 'verified', true, '2025-02-22', 'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-magnitsky-moraes/', 'news_article', 5, 'Washington, EUA', 'Entrevista em podcast conservador', 'flavio-magnitsky-moraes-b130-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende BRICS e afirma que pressão de Trump não intimida o bloco.', 'O BRICS não vai recuar. Não vamos aceitar ameaças de nenhum país.', 'Pronunciamento após Trump ameaçar tarifas de 100% a países do BRICS.', 'verified', true, '2025-02-05', 'https://www.reuters.com/world/americas/lula-brics-trump-tariffs-100/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-brics-pressao-trump-b130-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro posta foto com bandeira de Trump e diz que Brasil será salvo de fora.', 'Se a justiça brasileira falhou, a pressão internacional vai resolver.', 'Postagem no X com foto em visita a Mar-a-Lago.', 'verified', false, '2025-03-02', 'https://www.metropoles.com/brasil/politica-br/carlos-bolsonaro-mar-a-lago-trump', 'social_media_post', 4, 'Palm Beach, EUA', 'Visita a Mar-a-Lago', 'carlos-mar-a-lago-b130-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal celebra sanções americanas e declara adesão ao trumpismo.', 'O trumpismo é a única saída. A direita brasileira precisa se alinhar com Trump.', 'Live em sua conta com milhões de seguidores após anúncio de medidas de Trump.', 'verified', false, '2025-03-08', 'https://www.uol.com.br/eleicoes/2025/03/pablo-marcal-trumpismo-alinhamento.htm', 'social_media_post', 3, 'São Paulo', 'Live em rede social', 'marcal-trumpismo-adesao-b130-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio evita criticar Trump e diz que tarifas são legítimas defesa nacional.', 'Cada país tem direito de defender sua economia. Trump está fazendo o que prometeu.', 'Entrevista em evento do agronegócio em Ribeirão Preto.', 'verified', false, '2025-03-14', 'https://www1.folha.uol.com.br/poder/2025/03/tarcisio-trump-tarifas-legitimas.shtml', 'news_article', 3, 'Ribeirão Preto', 'Agrishow', 'tarcisio-tarifas-legitimas-b130-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro defende aproximação pragmática com governo Trump e modernização da Lava Jato.', 'Precisamos aproveitar a vinda do trumpismo para reforçar a cooperação anticorrupção.', 'Entrevista a jornal brasileiro em Brasília.', 'verified', false, '2025-03-18', 'https://www.poder360.com.br/congresso/sergio-moro-trump-lava-jato/', 'news_article', 2, 'Brasília', 'Entrevista ao Estadão', 'moro-trump-lava-jato-b130-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia lobby de Eduardo Bolsonaro por sanções contra o Brasil.', 'É traição à pátria. Eduardo Bolsonaro trabalha contra o próprio país em Washington.', 'Pronunciamento em plenário da Câmara após reportagem sobre lobby em Washington.', 'verified', true, '2025-03-20', 'https://g1.globo.com/politica/noticia/2025/03/20/gleisi-eduardo-lobby-washington.ghtml', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'gleisi-lobby-eduardo-b130-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes reage a ameaças de sanções e diz que pressão externa não afetará decisões do STF.', 'Nenhuma pressão estrangeira intimidará a Suprema Corte. As decisões seguirão a Constituição.', 'Discurso em sessão solene do STF.', 'verified', true, '2025-03-25', 'https://www.cnnbrasil.com.br/politica/moraes-pressao-externa-stf-magnitsky/', 'news_article', 2, 'Brasília', 'Sessão STF', 'moraes-pressao-externa-stf-b130-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino critica interferência americana e propõe lei contra ataques estrangeiros ao Judiciário.', 'Precisamos de uma lei que puna articulações no exterior contra o Poder Judiciário brasileiro.', 'Entrevista a programa de TV sobre tentativas de sanções a ministros.', 'verified', false, '2025-03-27', 'https://www.jota.info/stf/flavio-dino-lei-ataques-externos/', 'news_article', 2, 'Brasília', 'Entrevista TV Cultura', 'dino-lei-ataques-externos-b130-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que tarifas de Trump impactariam PIB brasileiro e prepara contramedidas.', 'Estamos preparados para responder. Vamos acionar OMC e buscar alternativas comerciais.', 'Entrevista após reunião com equipe econômica em Brasília.', 'verified', true, '2025-04-02', 'https://valor.globo.com/politica/noticia/2025/04/02/haddad-tarifas-trump-contramedidas.ghtml', 'news_article', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-contramedidas-trump-b130-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia retaliação caso Trump taxe exportações brasileiras.', 'Se os Estados Unidos taxarem o Brasil, nós responderemos com a mesma moeda.', 'Declaração em cerimônia no Planalto com empresários e sindicalistas.', 'verified', true, '2025-04-05', 'https://www.reuters.com/world/americas/lula-trump-retaliation-brazil-us-trade/', 'news_article', 3, 'Brasília', 'Cerimônia no Planalto', 'lula-retaliacao-trump-b130-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que Lula provocou tarifas com sua guerra ideológica contra Trump.', 'Lula provocou Trump e agora o Brasil paga o preço. É culpa dele.', 'Entrevista à Jovem Pan em Brasília.', 'verified', false, '2025-04-06', 'https://jovempan.com.br/noticias/politica/bolsonaro-lula-culpa-tarifas-trump.html', 'news_article', 3, 'Brasília', 'Entrevista Jovem Pan', 'bolsonaro-culpa-lula-tarifas-b130-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende alinhamento total com Trump e critica neutralidade de Lula.', 'O Brasil precisa escolher o lado certo. Trump é parceiro natural de quem defende liberdade.', 'Entrevista a jornal após evento em Belo Horizonte.', 'verified', false, '2025-04-08', 'https://www.em.com.br/politica/zema-alinhamento-trump-lula.html', 'news_article', 3, 'Belo Horizonte', 'Evento empresarial', 'zema-alinhamento-trump-b130-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado sugere que Brasil deveria seguir modelo migratório de Trump.', 'Temos que ter coragem de fechar a fronteira como Trump está fazendo.', 'Coletiva após reunião com secretários de segurança em Goiânia.', 'verified', false, '2025-04-10', 'https://g1.globo.com/go/goias/noticia/2025/04/10/caiado-fronteira-trump.ghtml', 'news_article', 3, 'Goiânia', 'Reunião de segurança pública', 'caiado-fronteira-trump-b130-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira afirma que Brasil intensificará aliança com México frente à política Trump.', 'América Latina precisa se unir. Brasil e México trabalham juntos contra o protecionismo.', 'Coletiva conjunta com a chanceler mexicana em Brasília.', 'verified', false, '2025-04-14', 'https://www.afp.com/pt/noticias/brasil-mexico-alianca-trump-protecionismo', 'news_article', 1, 'Brasília', 'Encontro bilateral Brasil-México', 'vieira-brasil-mexico-trump-b130-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se muda oficialmente para os EUA e registra pedido de residência.', 'Vou ficar nos Estados Unidos o tempo que for necessário para defender a família e o Brasil.', 'Entrevista a canal americano após notícia de pedido de residência permanente.', 'verified', true, '2025-04-18', 'https://www.nytimes.com/2025/04/18/world/americas/eduardo-bolsonaro-us-residence.html', 'news_article', 4, 'Miami, EUA', 'Entrevista ao The New York Times', 'eduardo-residencia-eua-b130-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula viaja à China e reforça laços comerciais alternativos ao eixo americano.', 'China é parceira estratégica. Não vamos depender de um único mercado.', 'Declaração em Pequim durante visita oficial.', 'verified', true, '2025-05-12', 'https://www.reuters.com/world/americas/lula-china-visit-trump-counter/', 'news_article', 2, 'Pequim, China', 'Visita de Estado à China', 'lula-china-eixo-trump-b130-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca Lula por ir à China enquanto ignora Washington.', 'Lula corre pra China e foge dos EUA. Prefere ditadores a parceiros democráticos.', 'Postagem em rede social durante viagem de Lula a Pequim.', 'verified', false, '2025-05-13', 'https://www.metropoles.com/brasil/politica-br/nikolas-lula-china-eua', 'social_media_post', 2, 'Brasília', 'Postagem em rede social', 'nikolas-lula-china-eua-b130-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro grava podcast com Steve Bannon pedindo intervenção dos EUA.', 'O povo brasileiro precisa do apoio dos patriotas americanos para derrubar essa tirania.', 'Gravação do podcast War Room com Steve Bannon em Washington.', 'verified', true, '2025-05-20', 'https://www.politico.com/news/2025/05/20/eduardo-bolsonaro-bannon-war-room-brazil/', 'other', 5, 'Washington, EUA', 'War Room podcast', 'eduardo-bannon-podcast-b130-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis grava vídeo com Bannon chamando Moraes de ditador.', 'Moraes é um ditador judicial. O mundo precisa saber disso.', 'Aparição em edição do War Room Podcast em Washington.', 'verified', false, '2025-05-21', 'https://www.cnnbrasil.com.br/politica/bia-kicis-bannon-moraes/', 'other', 4, 'Washington, EUA', 'War Room podcast', 'bia-kicis-bannon-moraes-b130-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira convoca embaixador dos EUA para protestar contra interferências.', 'O Brasil não tolerará ingerências estrangeiras em assuntos internos. Esperamos respeito.', 'Nota oficial do Itamaraty após sucessivas declarações de autoridades americanas.', 'verified', true, '2025-05-23', 'https://www1.folha.uol.com.br/mundo/2025/05/itamaraty-embaixador-eua-interferencia.shtml', 'news_article', 3, 'Brasília', 'Itamaraty', 'vieira-embaixador-eua-interferencia-b130-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro propõe CPI para investigar ONGs financiadas por americanos de esquerda.', 'Vamos investigar as ONGs financiadas pelo Soros e pela USAID que atacam a família.', 'Pronunciamento no Senado após Trump cortar fundos da USAID.', 'verified', false, '2025-05-27', 'https://www.poder360.com.br/congresso/flavio-cpi-ongs-soros-usaid/', 'news_article', 3, 'Brasília', 'Senado Federal', 'flavio-cpi-ongs-usaid-b130-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem elogia política externa de Trump e defende recriação do Tesla no Mercosul.', 'Trump entendeu a realidade. O Mercosul precisa abandonar o protecionismo.', 'Pronunciamento na Câmara dos Deputados.', 'verified', false, '2025-05-29', 'https://www.poder360.com.br/congresso/van-hattem-trump-mercosul/', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'van-hattem-trump-mercosul-b130-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula acelera ratificação do acordo Mercosul-UE como resposta a Trump.', 'O acordo Mercosul-UE é estratégico num mundo fragmentado. Vamos acelerar a ratificação.', 'Discurso em encontro de presidentes do Mercosul em Montevidéu.', 'verified', true, '2025-06-05', 'https://www.nytimes.com/2025/06/05/world/americas/lula-mercosur-eu-trade-trump.html', 'news_article', 2, 'Montevidéu, Uruguai', 'Cúpula do Mercosul', 'lula-mercosul-ue-trump-b130-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet cobra do governo estratégia para tarifas Trump.', 'Temos que ter plano B, C e D. O governo precisa apresentar estratégia concreta.', 'Entrevista a jornal em São Paulo.', 'verified', false, '2025-06-08', 'https://valor.globo.com/brasil/noticia/2025/06/08/tebet-estrategia-tarifas-trump.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista ao Valor Econômico', 'tebet-estrategia-trump-b130-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro publica carta aberta ao Congresso dos EUA pedindo Magnitsky contra Moraes.', 'Conclamo o Congresso americano a aplicar a Lei Magnitsky contra Alexandre de Moraes.', 'Carta publicada em rede social e enviada a congressistas americanos.', 'verified', true, '2025-06-12', 'https://www.washingtonpost.com/world/2025/06/12/eduardo-bolsonaro-magnitsky-moraes-letter/', 'social_media_post', 5, 'Washington, EUA', 'Carta aberta ao Congresso', 'eduardo-carta-magnitsky-b130-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes classifica como crime lobby por sanções contra ministros do STF.', 'Articular sanções estrangeiras contra ministros é crime contra a soberania nacional.', 'Voto em sessão plenária do STF sobre inquérito das fake news.', 'verified', true, '2025-06-15', 'https://www.jota.info/stf/moraes-lobby-sancoes-crime/', 'news_article', 3, 'Brasília', 'Sessão do STF', 'moraes-lobby-crime-b130-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias defende mecanismos legais contra articulações no exterior para coação de autoridades.', 'Vamos estudar mecanismos legais para coibir quem atua no exterior para coagir o Brasil.', 'Declaração após reunião com AGU e MJ sobre reação a lobby bolsonarista.', 'verified', false, '2025-06-18', 'https://www.cnnbrasil.com.br/politica/messias-mecanismos-legais-lobby-exterior/', 'news_article', 2, 'Brasília', 'AGU', 'messias-mecanismos-lobby-b130-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se encontra com Milei em cúpula e mantém frieza após provocações Trump-Argentina.', 'Diferenças ideológicas não podem impedir cooperação regional. Brasil e Argentina são parceiros.', 'Declaração após breve encontro com Milei em Foz do Iguaçu.', 'verified', false, '2025-06-20', 'https://www1.folha.uol.com.br/mundo/2025/06/lula-milei-encontro-trump-argentina.shtml', 'news_article', 1, 'Foz do Iguaçu', 'Cúpula do Mercosul', 'lula-milei-encontro-b130-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula encontro entre Milei, Trump e lideranças bolsonaristas.', 'Estamos construindo um eixo conservador: Trump, Milei e Bolsonaro contra o socialismo.', 'Declaração em evento na Heritage Foundation em Washington.', 'verified', true, '2025-06-25', 'https://www.politico.com/news/2025/06/25/eduardo-bolsonaro-milei-trump-heritage/', 'news_article', 4, 'Washington, EUA', 'Heritage Foundation', 'eduardo-eixo-conservador-b130-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro manda mensagem gravada ao CPAC Brasil pedindo sanções contra o STF.', 'Peço aos amigos americanos que ajudem o Brasil a se libertar da tirania judicial.', 'Mensagem gravada exibida no CPAC Brasil em São Paulo.', 'verified', true, '2025-07-03', 'https://g1.globo.com/politica/noticia/2025/07/03/bolsonaro-cpac-brasil-sancoes-stf.ghtml', 'news_article', 5, 'São Paulo', 'CPAC Brasil 2025', 'bolsonaro-cpac-brasil-b130-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro participa de evento em Mar-a-Lago e é fotografada com Melania.', 'Melania e Trump estão com a família Bolsonaro. Deus está do nosso lado.', 'Postagem em rede social com fotos do encontro em Mar-a-Lago.', 'verified', false, '2025-07-06', 'https://www.uol.com.br/eleicoes/2025/07/michelle-mar-a-lago-melania.htm', 'social_media_post', 2, 'Palm Beach, EUA', 'Evento em Mar-a-Lago', 'michelle-mar-a-lago-melania-b130-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia tarifa de 50% sobre produtos americanos após decreto Trump impor 50% ao Brasil.', 'Se os EUA impuseram 50% sobre o Brasil, nós responderemos com a mesma tarifa.', 'Pronunciamento em rede nacional após Trump decretar tarifa de 50%% sobre exportações brasileiras.', 'verified', true, '2025-07-10', 'https://www.reuters.com/world/americas/brazil-lula-retaliates-trump-50-percent-tariff/', 'news_article', 3, 'Brasília', 'Pronunciamento em rede nacional', 'lula-tarifa-50-resposta-b130-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad calcula que tarifa Trump custará 0,5% do PIB e prepara programa emergencial.', 'Vamos proteger empregos e exportadores afetados. O governo não deixará ninguém sozinho.', 'Entrevista coletiva no Ministério da Fazenda em Brasília.', 'verified', true, '2025-07-11', 'https://valor.globo.com/brasil/noticia/2025/07/11/haddad-pib-tarifa-trump-programa.ghtml', 'news_article', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-pib-tarifa-programa-b130-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro declara que tarifa de Trump é culpa exclusiva de Lula e do STF.', 'Trump está punindo o Brasil porque Lula e o STF ultrapassaram todos os limites.', 'Entrevista à Jovem Pan em Brasília após decreto de Trump.', 'verified', true, '2025-07-12', 'https://jovempan.com.br/noticias/politica/bolsonaro-tarifa-trump-lula-stf.html', 'news_article', 4, 'Brasília', 'Entrevista Jovem Pan', 'bolsonaro-tarifa-culpa-lula-stf-b130-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro comemora tarifa Trump como vitória do lobby bolsonarista em Washington.', 'Nosso trabalho em Washington está dando frutos. Trump entendeu a gravidade da situação brasileira.', 'Postagem em rede social após anúncio da tarifa de 50%% por Trump.', 'verified', true, '2025-07-10', 'https://www1.folha.uol.com.br/mundo/2025/07/eduardo-comemora-tarifa-trump-lobby.shtml', 'social_media_post', 5, 'Washington, EUA', 'Postagem em rede social', 'eduardo-comemora-tarifa-lobby-b130-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann pede cassação de Eduardo Bolsonaro por traição ao país.', 'Eduardo Bolsonaro é traidor da pátria. Deve ser cassado por pedir sanções contra o Brasil.', 'Declaração em pronunciamento na Câmara após tarifa de Trump.', 'verified', true, '2025-07-14', 'https://g1.globo.com/politica/noticia/2025/07/14/gleisi-cassacao-eduardo-traicao.ghtml', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'gleisi-cassacao-eduardo-b130-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro alerta que tarifa Trump pode custar 40 bilhões ao agro brasileiro.', 'O impacto no agro é gigantesco. Precisamos abrir mercados e pressionar via OMC.', 'Coletiva após reunião com Lula sobre impacto no agronegócio.', 'verified', false, '2025-07-15', 'https://valor.globo.com/agronegocios/noticia/2025/07/15/favaro-tarifa-trump-agro-40-bilhoes.ghtml', 'news_article', 2, 'Brasília', 'Ministério da Agricultura', 'favaro-tarifa-agro-40bi-b130-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha afirma que tarifa Trump também prejudicará acesso a medicamentos.', 'A tarifa afeta até importação de insumos farmacêuticos. É irresponsabilidade global.', 'Entrevista em Brasília sobre impacto nos insumos de saúde.', 'verified', false, '2025-07-16', 'https://www.cnnbrasil.com.br/saude/padilha-tarifa-trump-medicamentos/', 'news_article', 2, 'Brasília', 'Ministério da Saúde', 'padilha-tarifa-medicamentos-b130-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio de Freitas ecoa narrativa Trump e diz que Lula isolou o Brasil.', 'Lula rompeu pontes com os EUA. O Brasil pagará caro pela guerra ideológica.', 'Entrevista à GloboNews em São Paulo.', 'verified', true, '2025-07-17', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/07/17/tarcisio-lula-isolou-brasil-trump.ghtml', 'news_article', 3, 'São Paulo', 'Entrevista GloboNews', 'tarcisio-lula-isolou-brasil-b130-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina investigação contra parlamentares que articularam sanções nos EUA.', 'Abro inquérito contra parlamentares que articularam sanções econômicas contra o Brasil.', 'Decisão divulgada na segunda-feira em despacho do STF.', 'verified', true, '2025-07-18', 'https://www.jota.info/stf/moraes-inquerito-parlamentares-sancoes/', 'news_article', 3, 'Brasília', 'Despacho do STF', 'moraes-inquerito-parlamentares-b130-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ameaça Moraes após inquérito contra Eduardo Bolsonaro.', 'Moraes precisa ser contido. A pressão internacional vai aumentar até ele cair.', 'Postagem em vídeo reagindo ao inquérito contra parlamentares.', 'verified', true, '2025-07-19', 'https://www.metropoles.com/brasil/politica-br/nikolas-ameaca-moraes-inquerito-eduardo', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'nikolas-ameaca-moraes-b130-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula discursa em rede nacional denunciando chantagem americana contra a soberania.', 'Não vou me curvar a chantagem imperial. O Brasil é soberano e ninguém manda no seu povo.', 'Pronunciamento em cadeia nacional defendendo o STF e a soberania.', 'verified', true, '2025-07-20', 'https://www.washingtonpost.com/world/2025/07/20/lula-trump-brazil-sovereignty-broadcast/', 'news_article', 3, 'Brasília', 'Pronunciamento em rede nacional', 'lula-chantagem-imperial-b130-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Davi Alcolumbre convoca sessão solene em defesa da soberania do Brasil.', 'O Senado vai defender a soberania brasileira de forma unânime.', 'Nota oficial da Presidência do Senado convocando sessão solene.', 'verified', false, '2025-07-21', 'https://www12.senado.leg.br/noticias/materias/2025/07/21/alcolumbre-sessao-solene-soberania', 'news_article', 1, 'Brasília', 'Senado Federal', 'alcolumbre-solene-soberania-b130-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta aprova moção contra interferência estrangeira em assuntos do Judiciário.', 'A Câmara não tolera ingerência externa. A soberania é inegociável.', 'Pronunciamento após aprovação unânime de moção na Câmara.', 'verified', false, '2025-07-22', 'https://www.camara.leg.br/noticias/hugo-motta-mocao-soberania', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'motta-mocao-soberania-b130-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues propõe que governo acione OMC contra tarifa Trump.', 'A OMC é o foro apropriado. Vamos mover todas as ações possíveis.', 'Declaração em coletiva em Brasília.', 'verified', false, '2025-07-23', 'https://www.poder360.com.br/congresso/randolfe-omc-tarifa-trump/', 'news_article', 1, 'Brasília', 'Liderança do governo no Senado', 'randolfe-omc-tarifa-b130-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro responsabiliza Lula por tarifa e diz que família pagará preço político.', 'Se Lula tivesse mantido boa relação com Trump, o Brasil não estaria sendo punido.', 'Entrevista à CNN Brasil em Brasília.', 'verified', false, '2025-07-24', 'https://www.cnnbrasil.com.br/politica/flavio-lula-tarifa-trump-preco-politico/', 'news_article', 3, 'Brasília', 'Entrevista CNN Brasil', 'flavio-lula-tarifa-preco-b130-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva rebate Trump após EUA cortarem financiamento para Amazônia.', 'A Amazônia não depende de Trump. O mundo inteiro apoia nossa agenda ambiental.', 'Entrevista em Brasília após corte de fundos do Fundo Amazônia.', 'verified', false, '2025-07-28', 'https://www1.folha.uol.com.br/ambiente/2025/07/marina-trump-amazonia-corte.shtml', 'news_article', 2, 'Brasília', 'Ministério do Meio Ambiente', 'marina-trump-amazonia-corte-b130-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio garante que Forças Armadas estão alinhadas à defesa da soberania.', 'As Forças Armadas defendem a Constituição e a soberania. Não há espaço para aventura.', 'Declaração após reunião com comandantes militares em Brasília.', 'verified', true, '2025-07-30', 'https://www.cnnbrasil.com.br/politica/mucio-forcas-armadas-soberania/', 'news_article', 2, 'Brasília', 'Ministério da Defesa', 'mucio-forcas-armadas-soberania-b130-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se encontra com Rubio novamente e articula sanções Magnitsky secundárias.', 'Rubio nos garantiu que análise de sanções Magnitsky está avançando no Departamento de Estado.', 'Declaração após reunião no Departamento de Estado americano.', 'verified', true, '2025-08-04', 'https://www.politico.com/news/2025/08/04/eduardo-bolsonaro-rubio-magnitsky-brazil-stf/', 'news_article', 5, 'Washington, EUA', 'Departamento de Estado', 'eduardo-rubio-magnitsky-b130-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina bloqueio de bens de Eduardo Bolsonaro no Brasil.', 'Determino o bloqueio de bens como medida cautelar no inquérito.', 'Decisão divulgada no STF em inquérito sobre coação contra ministros.', 'verified', true, '2025-08-06', 'https://www.jota.info/stf/moraes-bloqueio-bens-eduardo-bolsonaro/', 'news_article', 3, 'Brasília', 'Decisão STF', 'moraes-bloqueio-eduardo-b130-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro chama Moraes de psicopata após bloqueio de bens do irmão.', 'Moraes é um psicopata. Vai pagar por cada injustiça.', 'Postagem no X após decisão de Moraes sobre Eduardo.', 'verified', false, '2025-08-07', 'https://www.metropoles.com/brasil/politica-br/carlos-moraes-psicopata-eduardo', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em rede social', 'carlos-moraes-psicopata-b130-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula visita Caracas e critica agressividade de Trump contra Venezuela.', 'A América Latina precisa de diálogo. A escalada americana contra Caracas é irresponsável.', 'Declaração conjunta com Maduro em Caracas.', 'verified', true, '2025-08-12', 'https://www.afp.com/pt/noticias/lula-caracas-maduro-trump-venezuela', 'news_article', 3, 'Caracas, Venezuela', 'Visita oficial', 'lula-caracas-trump-venezuela-b130-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro critica visita de Lula a Maduro e defende alinhamento com Trump.', 'Lula abraça ditador enquanto Trump tenta libertar o povo venezuelano.', 'Entrevista a jornalistas em Brasília após visita de Lula a Caracas.', 'verified', true, '2025-08-13', 'https://www.poder360.com.br/politica/bolsonaro-lula-maduro-trump/', 'news_article', 3, 'Brasília', 'Coletiva à imprensa', 'bolsonaro-lula-maduro-trump-b130-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira defende canal direto de diálogo para evitar escalada na Venezuela.', 'A escalada militar é inaceitável. Brasil trabalha por solução diplomática.', 'Declaração após reunião da CELAC em Brasília.', 'verified', false, '2025-08-15', 'https://www.reuters.com/world/americas/mauro-vieira-venezuela-trump-celac/', 'news_article', 2, 'Brasília', 'Reunião da CELAC', 'vieira-celac-venezuela-b130-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende ação militar dos EUA contra Maduro.', 'Se Trump precisar intervir militarmente na Venezuela, o mundo conservador apoiará.', 'Aparição no Fox News em Washington.', 'verified', true, '2025-08-18', 'https://www.foxnews.com/world/eduardo-bolsonaro-venezuela-military-action-maduro', 'news_article', 5, 'Washington, EUA', 'Entrevista na Fox News', 'eduardo-venezuela-militar-b130-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis diz que haitianos e venezuelanos são invasão teleguiada.', 'A migração é teleguiada pelo foro de São Paulo para desestabilizar nossas fronteiras.', 'Fala em comissão parlamentar em Brasília.', 'verified', false, '2025-08-20', 'https://www.metropoles.com/brasil/politica-br/bia-kicis-migracao-invasao', 'news_article', 4, 'Brasília', 'Comissão de Direitos Humanos', 'bia-kicis-migracao-invasao-b130-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende deportação em massa nos moldes Trump.', 'Temos que deportar em massa como Trump faz nos EUA. Chega de bondade com invasores.', 'Live em rede social de Brasília após operação contra imigrantes no Acre.', 'verified', true, '2025-08-22', 'https://www.cnnbrasil.com.br/politica/nikolas-deportacao-massa-trump/', 'social_media_post', 4, 'Brasília', 'Live em rede social', 'nikolas-deportacao-massa-b130-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Ricardo Lewandowski defende acolhimento humanitário e critica retórica xenófoba.', 'O Brasil acolhe quem busca refúgio. A xenofobia é incompatível com nossa tradição.', 'Declaração em evento sobre migração em Brasília.', 'verified', false, '2025-08-23', 'https://www1.folha.uol.com.br/cotidiano/2025/08/lewandowski-migracao-xenofobia.shtml', 'news_article', 1, 'Brasília', 'Ministério da Justiça', 'lewandowski-migracao-xenofobia-b130-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula condena retórica de Trump sobre deportações em massa e diz que Brasil não copiará modelo.', 'Não vamos copiar o modelo xenófobo americano. Brasil é terra de acolhimento.', 'Discurso em cerimônia sobre migração em Brasília.', 'verified', true, '2025-08-24', 'https://www.nytimes.com/2025/08/24/world/americas/lula-trump-migration-deportations.html', 'news_article', 2, 'Brasília', 'Cerimônia oficial', 'lula-condena-deportacoes-b130-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema viaja aos EUA em missão econômica e encontra aliados de Trump.', 'Minas Gerais pode ser ponte com Trump. Vamos recuperar confiança e negócios.', 'Declaração em Miami após reuniões com empresários.', 'verified', false, '2025-08-26', 'https://www.em.com.br/politica/zema-eua-trump-missao-economica.html', 'news_article', 3, 'Miami, EUA', 'Missão comercial do governo de MG', 'zema-eua-missao-trump-b130-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio se reúne com empresários americanos em viagem estratégica.', 'São Paulo é porta de entrada. Precisamos recuperar diálogo comercial com os EUA.', 'Coletiva durante missão empresarial em Nova York.', 'verified', true, '2025-08-28', 'https://www.cnnbrasil.com.br/politica/tarcisio-eua-empresarios-trump/', 'news_article', 2, 'Nova York, EUA', 'Missão empresarial SP', 'tarcisio-ny-empresarios-b130-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal anuncia evento com apoio de ex-assessores de Trump.', 'Vou trazer pro Brasil o time de Trump. Vamos fazer uma revolução conservadora.', 'Anúncio em live de evento agendado para São Paulo.', 'verified', false, '2025-08-29', 'https://www.uol.com.br/eleicoes/2025/08/marcal-evento-assessores-trump.htm', 'social_media_post', 3, 'São Paulo', 'Live em rede social', 'marcal-evento-assessores-trump-b130-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes critica eventuais sanções americanas como inaceitáveis.', 'Sanções americanas contra ministros seriam uma afronta inaceitável à democracia brasileira.', 'Declaração em evento jurídico em Lisboa.', 'verified', true, '2025-09-01', 'https://www.jota.info/stf/gilmar-mendes-sancoes-americanas/', 'news_article', 3, 'Lisboa, Portugal', 'Fórum Jurídico Lisboa', 'gilmar-sancoes-americanas-b130-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa pede investigação do financiamento das atividades de Eduardo em Washington.', 'Quem paga as passagens e o escritório do Eduardo nos EUA? É preciso investigar.', 'Pronunciamento no Senado sobre atuação da família Bolsonaro em Washington.', 'verified', false, '2025-09-03', 'https://www12.senado.leg.br/noticias/materias/2025/09/03/humberto-investigacao-eduardo-washington', 'news_article', 2, 'Brasília', 'Senado Federal', 'humberto-financiamento-eduardo-b130-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro participa de jantar com Bannon e JD Vance em Washington.', 'Jantar histórico com Bannon e o vice-presidente Vance. A aliança está forte.', 'Postagem em rede social com foto do jantar em Washington.', 'verified', true, '2025-09-05', 'https://www.washingtonpost.com/world/2025/09/05/eduardo-bolsonaro-bannon-vance-dinner/', 'social_media_post', 5, 'Washington, EUA', 'Jantar conservador em Washington', 'eduardo-bannon-vance-jantar-b130-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rom, 'Rogério Marinho alinha discurso com Trump e ataca política externa de Lula.', 'Lula está isolando o Brasil. Só Trump pode salvar nossa economia.', 'Pronunciamento no Senado sobre tarifas americanas.', 'verified', false, '2025-09-06', 'https://www.poder360.com.br/congresso/rogerio-marinho-lula-trump/', 'news_article', 3, 'Brasília', 'Senado Federal', 'rogerio-marinho-lula-trump-b130-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke questiona eficácia de tarifas brasileiras em retaliação.', 'Retaliar com tarifas pode prejudicar mais o Brasil do que os EUA. É preciso prudência.', 'Declaração em coletiva no Senado.', 'verified', false, '2025-09-08', 'https://www.cnnbrasil.com.br/politica/soraya-thronicke-tarifas-retaliacao/', 'news_article', 2, 'Brasília', 'Senado Federal', 'soraya-tarifas-retaliacao-b130-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mpo, 'Marcos Pontes sugere acordo de tecnologia militar com governo Trump.', 'O Brasil precisa de acordos de defesa com os EUA. Tecnologia militar é estratégica.', 'Declaração em evento da indústria aeroespacial em São Paulo.', 'verified', false, '2025-09-10', 'https://valor.globo.com/politica/noticia/2025/09/10/marcos-pontes-acordo-defesa-trump.ghtml', 'news_article', 2, 'São José dos Campos', 'Evento da indústria aeroespacial', 'marcos-pontes-defesa-trump-b130-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz discurso na ONU cobrando multilateralismo e criticando unilateralismo Trump.', 'O mundo não pode ser refém do unilateralismo. Multilateralismo é o único caminho.', 'Discurso na Assembleia Geral da ONU em Nova York.', 'verified', true, '2025-09-23', 'https://www.nytimes.com/2025/09/23/world/americas/lula-un-speech-trump-multilateralism.html', 'news_article', 3, 'Nova York, EUA', 'Assembleia Geral da ONU', 'lula-onu-multilateralismo-b130-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro faz protesto em frente à ONU durante discurso de Lula.', 'Lula não representa o Brasil conservador. O mundo precisa saber.', 'Ato em frente à sede da ONU com bandeiras bolsonaristas.', 'verified', true, '2025-09-23', 'https://g1.globo.com/politica/noticia/2025/09/23/eduardo-protesto-onu-lula.ghtml', 'news_article', 3, 'Nova York, EUA', 'Protesto em frente à ONU', 'eduardo-protesto-onu-lula-b130-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mau, 'Mauro Vieira discursa sobre ataques à diplomacia brasileira por políticos em Washington.', 'Não é aceitável que parlamentares brasileiros conspirem no exterior contra o próprio país.', 'Discurso na ONU em Nova York.', 'verified', false, '2025-09-25', 'https://www.afp.com/pt/noticias/mauro-vieira-onu-eduardo-bolsonaro', 'news_article', 2, 'Nova York, EUA', 'Discurso na ONU', 'vieira-onu-ataques-diplomacia-b130-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Ronaldo Caiado viaja a Texas para evento do CPAC e defende alianças internacionais.', 'A direita brasileira precisa se conectar com a direita americana. É questão civilizacional.', 'Discurso no CPAC Texas em Dallas.', 'verified', false, '2025-09-27', 'https://www.cnnbrasil.com.br/politica/caiado-cpac-texas-direita/', 'news_article', 3, 'Dallas, EUA', 'CPAC Texas', 'caiado-cpac-texas-b130-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira discursa no CPAC Texas com ataques ao STF em inglês.', 'The Brazilian Supreme Court is the biggest threat to democracy in the Americas.', 'Discurso no CPAC Texas em Dallas.', 'verified', true, '2025-09-27', 'https://www.washingtonpost.com/world/2025/09/27/nikolas-ferreira-cpac-texas-supreme-court/', 'news_article', 4, 'Dallas, EUA', 'CPAC Texas', 'nikolas-cpac-texas-stf-b130-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se encontra com Xi Jinping e assina novos acordos diante tarifa Trump.', 'Brasil e China firmam parceria estratégica. Não vamos depender de Washington.', 'Declaração conjunta em Pequim durante visita de Xi a países do BRICS.', 'verified', true, '2025-10-02', 'https://www.reuters.com/world/americas/lula-xi-jinping-deals-trump-tariff/', 'news_article', 2, 'Brasília', 'Visita do presidente Xi', 'lula-xi-acordos-trump-b130-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro cita Trump em discurso no Senado defendendo anistia.', 'Trump perdoou presos do Capitólio. O Brasil precisa anistia urgente para 8 de janeiro.', 'Pronunciamento no Senado Federal.', 'verified', true, '2025-10-05', 'https://www.poder360.com.br/congresso/flavio-bolsonaro-trump-anistia/', 'news_article', 4, 'Brasília', 'Senado Federal', 'flavio-trump-anistia-b130-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino associa bolsonarismo a Trump e alerta para coordenação internacional.', 'Vemos coordenação internacional antidemocrática. Brasil precisa estar atento.', 'Discurso em sessão do STF.', 'verified', false, '2025-10-08', 'https://www.jota.info/stf/flavio-dino-bolsonarismo-trumpismo/', 'news_article', 3, 'Brasília', 'Sessão do STF', 'dino-bolsonarismo-trumpismo-b130-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ruc, 'Rui Costa coordena plano emergencial para setores atingidos pelas tarifas.', 'Vamos proteger empregos. O plano emergencial já está em execução.', 'Coletiva na Casa Civil em Brasília.', 'verified', false, '2025-10-10', 'https://g1.globo.com/politica/noticia/2025/10/10/rui-costa-plano-emergencial-tarifas.ghtml', 'news_article', 1, 'Brasília', 'Casa Civil', 'rui-costa-plano-emergencial-b130-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro defende diálogo com Trump para reduzir tarifas.', 'Precisamos negociar com Washington. Retaliação apenas agrava o quadro.', 'Entrevista em plenário do Senado.', 'verified', false, '2025-10-12', 'https://www.cnnbrasil.com.br/politica/moro-dialogo-trump-tarifas/', 'news_article', 2, 'Brasília', 'Senado Federal', 'moro-dialogo-trump-tarifas-b130-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica Lula por falta de ação concreta contra tarifa Trump.', 'Lula fala bonito, mas o Brasil está apanhando. Falta coragem na política externa.', 'Entrevista à BandNews no Rio.', 'verified', false, '2025-10-14', 'https://www.band.uol.com.br/noticias/ciro-gomes-lula-tarifa-trump.html', 'news_article', 2, 'Rio de Janeiro', 'Entrevista BandNews', 'ciro-lula-falta-acao-b130-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia programa de compras governamentais para substituir produtos americanos.', 'Vamos comprar mais do Brasil e menos dos EUA. É hora de fortalecer a indústria nacional.', 'Cerimônia em rede nacional no Palácio do Planalto.', 'verified', true, '2025-10-20', 'https://www1.folha.uol.com.br/mercado/2025/10/lula-compras-governo-substituir-eua.shtml', 'news_article', 2, 'Brasília', 'Cerimônia no Planalto', 'lula-compras-substituir-eua-b130-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende Paraguai como base de operações para direita americana na região.', 'Paraguai é peça-chave. Vamos fortalecer a base operacional conservadora na região.', 'Entrevista em viagem a Assunção.', 'verified', false, '2025-10-22', 'https://www.poder360.com.br/politica/eduardo-bolsonaro-paraguai-direita/', 'news_article', 3, 'Assunção, Paraguai', 'Visita a Paraguai', 'eduardo-paraguai-direita-b130-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro manda carta a Trump agradecendo solidariedade e pedindo mais pressão sobre STF.', 'Caro Presidente Trump, agradeço a solidariedade e peço que o Senhor continue cobrando.', 'Carta divulgada por aliados em Brasília.', 'verified', true, '2025-10-25', 'https://www.cnnbrasil.com.br/politica/bolsonaro-carta-trump-stf-pressao/', 'news_article', 5, 'Brasília', 'Carta divulgada por aliados', 'bolsonaro-carta-trump-stf-b130-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes abre novo inquérito para investigar carta de Bolsonaro a Trump.', 'Abro inquérito para apurar se houve coação institucional na carta enviada a Trump.', 'Despacho divulgado no STF.', 'verified', true, '2025-10-27', 'https://www.jota.info/stf/moraes-inquerito-carta-bolsonaro-trump/', 'news_article', 3, 'Brasília', 'Despacho STF', 'moraes-inquerito-carta-trump-b130-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula prepara viagem à COP30 Belém com defesa frontal ao multilateralismo climático.', 'Vamos realizar a maior COP da história e mostrar que o multilateralismo está vivo.', 'Coletiva sobre preparativos da COP30 em Brasília.', 'verified', false, '2025-10-29', 'https://valor.globo.com/politica/noticia/2025/10/29/lula-cop30-belem-multilateralismo.ghtml', 'news_article', 1, 'Brasília', 'Preparativos COP30', 'lula-cop30-multilateralismo-b130-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro participa de reunião com embaixador dos EUA para discutir sanções.', 'Estamos progredindo. Os americanos entendem a urgência de agir contra a ditadura do STF.', 'Declaração após encontro na embaixada em Brasília.', 'verified', true, '2025-11-01', 'https://www.politico.com/news/2025/11/01/eduardo-bolsonaro-us-ambassador-brazil-sanctions/', 'news_article', 5, 'Brasília', 'Embaixada dos EUA', 'eduardo-embaixador-eua-sancoes-b130-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia reunião de Eduardo com embaixador como afronta institucional.', 'Usar embaixada estrangeira para articular sanções é afronta sem precedentes.', 'Pronunciamento em entrevista após vazamento da reunião.', 'verified', false, '2025-11-02', 'https://g1.globo.com/politica/noticia/2025/11/02/gleisi-eduardo-embaixada-eua.ghtml', 'news_article', 2, 'Brasília', 'Coletiva do PT', 'gleisi-embaixada-eua-afronta-b130-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula recebe na COP30 líderes globais e isola discurso Trump sobre clima.', 'A COP30 mostra que o mundo continua comprometido com a agenda climática apesar de Trump.', 'Discurso de abertura da COP30 em Belém.', 'verified', true, '2025-11-10', 'https://www.nytimes.com/2025/11/10/climate/lula-cop30-belem-trump-climate.html', 'news_article', 2, 'Belém, Brasil', 'COP30', 'lula-cop30-abertura-trump-b130-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro celebra ausência dos EUA na COP30 como vitória conservadora.', 'Trump acertou em não mandar delegação à COP. Essa agenda verde é farsa globalista.', 'Postagem em rede social durante abertura da COP30.', 'verified', true, '2025-11-10', 'https://www.poder360.com.br/politica/eduardo-cop30-ausencia-eua/', 'social_media_post', 3, 'Washington, EUA', 'Postagem em rede social', 'eduardo-cop30-ausencia-eua-b130-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
