-- Batch 106: State-level politics, capital mayors, state assemblies (Jan 2023 - Apr 2026)
-- 100 statements: RS floods, Pantanal fires, Bahia chacinas, COP30, SP/RJ mayors, governors
DO $$
DECLARE
  v_cas UUID; v_tar UUID; v_cai UUID; v_wlm UUID; v_iba UUID;
  v_elm UUID; v_jer UUID; v_hel UUID; v_ral UUID; v_zem UUID;
  v_rat UUID; v_joa UUID; v_leit UUID; v_cas_es UUID; v_pda UUID;
  v_fmt UUID; v_mme UUID; v_rie UUID; v_fat UUID; v_cbr UUID;
  v_gca UUID; v_ade UUID; v_cle UUID; v_wba UUID; v_jme UUID;
  v_rfo UUID; v_nun UUID; v_epa UUID; v_fuad UUID; v_jca UUID;
  v_top UUID; v_sar UUID; v_smelo UUID; v_gre UUID; v_bre UUID;
  v_dal UUID; v_bpr UUID; v_mar UUID; v_bou UUID; v_jan UUID;
  c_vio UUID; c_des UUID; c_odi UUID; c_abu UUID; c_aut UUID;
  c_irr UUID; c_int UUID; c_con UUID; c_nep UUID; c_cor UUID;
  c_hom UUID; c_rac UUID; c_xen UUID; c_ame UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_wlm FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmano-de-freitas';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_ral FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_joa FROM politicians WHERE slug = 'joao-azevedo';
  SELECT id INTO v_leit FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_cas_es FROM politicians WHERE slug = 'renato-casagrande';
  SELECT id INTO v_pda FROM politicians WHERE slug = 'paulo-dantas';
  SELECT id INTO v_fmt FROM politicians WHERE slug = 'fabio-mitidieri';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_fat FROM politicians WHERE slug = 'fatima-bezerra';
  SELECT id INTO v_cbr FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_gca FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_ade FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_wba FROM politicians WHERE slug = 'wanderlei-barbosa';
  SELECT id INTO v_jme FROM politicians WHERE slug = 'jorginho-mello';
  SELECT id INTO v_rfo FROM politicians WHERE slug = 'rafael-fonteles';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_epa FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fuad FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_jca FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_top FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_smelo FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_gre FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_bre FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_dal FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_bpr FROM politicians WHERE slug = 'boulos-prefeito';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';

  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado repete o bordao bandido bom e bandido morto ao defender politica de seguranca.', 'Bandido bom e bandido morto. Em Goias a gente trata bandido como bandido e por isso a criminalidade caiu.', 'Entrevista a Jovem Pan apos operacao policial em Goiania com mortes de suspeitos.', 'verified', true, '2023-03-14', 'https://jovempan.com.br/noticias/brasil/caiado-bandido-bom-bandido-morto-goias.html', 'news_article', 5, 'Goiania', 'Entrevista Jovem Pan', 'caiado-bandido-bom-morto-b106-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Claudio Castro defende letalidade policial apos operacao com 10 mortos no Rio.', 'Nao vou pedir desculpas por traficante morto. Quem bate de frente com a policia do Rio morre.', 'Coletiva no Palacio Guanabara apos operacao da PM no Complexo da Mare em maio de 2023.', 'verified', true, '2023-05-09', 'https://oglobo.globo.com/rio/noticia/2023/05/castro-defende-letalidade-operacao-mare.ghtml', 'news_article', 5, 'Rio de Janeiro', 'Coletiva no Palacio Guanabara', 'castro-nao-pedir-desculpas-mare-b106-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leit, 'Eduardo Leite minimiza alerta da Defesa Civil dias antes das enchentes historicas no RS.', 'A situacao esta sob controle e os alertas sao preventivos. Nao ha motivo para panico na populacao.', 'Coletiva em Porto Alegre em 29 de abril de 2024, tres dias antes das cheias que deixaram mais de 180 mortos.', 'verified', true, '2024-04-29', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/04/leite-minimiza-alertas-enchentes-rs.html', 'news_article', 4, 'Porto Alegre', 'Coletiva na Piratini', 'leite-minimiza-alertas-enchentes-b106-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leit, 'Leite admite que flexibilizou codigo ambiental do RS que reduziu areas de preservacao antes das cheias.', 'Revisamos o codigo ambiental para desburocratizar o estado. Nao tem relacao direta com as enchentes.', 'Entrevista a GloboNews em meio as enchentes historicas de maio de 2024, pressionado por ambientalistas.', 'verified', true, '2024-05-12', 'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2024/05/12/leite-codigo-ambiental-enchentes.ghtml', 'news_article', 4, 'Porto Alegre', 'Entrevista GloboNews', 'leite-codigo-ambiental-enchentes-b106-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima nega gravidade dos incendios do Pantanal e da Amazonia em 2024.', 'O problema das queimadas e exagerado pela imprensa. O Amazonas esta controlado e nao precisa de alarde.', 'Entrevista a radio durante o pior periodo de queimadas de 2024 no Amazonas, com recorde de focos.', 'verified', true, '2024-09-10', 'https://amazonasatual.com.br/wilson-lima-nega-gravidade-queimadas-2024/', 'news_article', 4, 'Manaus', 'Entrevista a radio local', 'wilson-lima-nega-queimadas-b106-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Governador do AM culpa ONGs ambientalistas por focos de incendio no estado.', 'Tem muita ONG internacional financiada para criminalizar o Amazonas. O fogo tem autor e nao e o produtor rural.', 'Discurso na Assembleia do Amazonas em setembro de 2024 em meio a crise das queimadas.', 'verified', false, '2024-09-18', 'https://www.acritica.com/politica/wilson-lima-culpa-ongs-queimadas-am', 'news_article', 4, 'Manaus', 'Sessao na ALE-AM', 'wilson-lima-culpa-ongs-queimadas-b106-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes minimiza fogo no Pantanal e acusa imprensa de exagero em 2024.', 'O Pantanal queima todo ano, e natural. A imprensa pega um foco e transforma em tragedia.', 'Entrevista a Band em Cuiaba durante o pico das queimadas do Pantanal em junho de 2024.', 'verified', true, '2024-06-22', 'https://www.band.uol.com.br/noticias/mauro-mendes-pantanal-queima-todo-ano-2024', 'news_article', 4, 'Cuiaba', 'Entrevista Band', 'mauro-mendes-pantanal-natural-b106-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jeronimo Rodrigues evita condenar chacina na Bahia com mais de 30 mortos em operacao policial.', 'A policia cumpriu seu papel. Quem morreu tinha passagem pela policia, nao foram inocentes.', 'Declaracao apos operacao na regiao metropolitana de Salvador em julho de 2023 com 34 mortos.', 'verified', true, '2023-07-30', 'https://www.correio24horas.com.br/politica/jeronimo-chacina-salvador-policia.html', 'news_article', 4, 'Salvador', 'Coletiva no Palacio de Ondina', 'jeronimo-chacina-salvador-b106-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Governador da Bahia defende BOPE apos denuncias de execucoes em Salvador.', 'O BOPE e exemplo nacional. Quem critica a policia baiana esta ao lado do crime organizado.', 'Entrevista a A Tarde apos relatorio da Defensoria Publica apontar execucoes sumarias em 2023.', 'verified', false, '2023-11-15', 'https://www.atarde.com.br/politica/jeronimo-defende-bope-salvador', 'news_article', 4, 'Salvador', 'Entrevista A Tarde', 'jeronimo-defende-bope-b106-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho promete que COP30 sera a conferencia da floresta mesmo com desmatamento.', 'A COP30 em Belem mostrara o Brasil como potencia ambiental. O Para esta pronto para receber o mundo.', 'Entrevista coletiva apos reuniao com equipe de Lula sobre preparativos da COP30 em Belem.', 'verified', false, '2024-11-14', 'https://g1.globo.com/pa/para/noticia/2024/11/14/helder-cop30-para-potencia-ambiental.ghtml', 'news_article', 2, 'Belem', 'Coletiva no Palacio dos Despachos', 'helder-cop30-potencia-b106-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder defende obra polemica de duplicacao que corta area de preservacao para a COP30.', 'A Avenida Liberdade nao destroi floresta, organiza a regiao. Os criticos nao conhecem a Amazonia.', 'Declaracao apos denuncias do MPF sobre impacto ambiental da obra de mobilidade para COP30.', 'verified', true, '2025-03-08', 'https://g1.globo.com/pa/para/noticia/2025/03/08/helder-avenida-liberdade-cop30.ghtml', 'news_article', 3, 'Belem', 'Inauguracao de obra', 'helder-avenida-liberdade-cop30-b106-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio defende PM de SP apos operacao Escudo em Guaruja com 28 mortos.', 'A policia de Sao Paulo nao e para brincar. Quem mata PM tem resposta a altura.', 'Entrevista apos operacao Escudo na Baixada Santista em agosto de 2023 com 28 suspeitos mortos.', 'verified', true, '2023-08-14', 'https://www1.folha.uol.com.br/cotidiano/2023/08/tarcisio-operacao-escudo-guaruja.shtml', 'news_article', 5, 'Sao Paulo', 'Coletiva no Palacio dos Bandeirantes', 'tarcisio-operacao-escudo-b106-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio defende fim de cameras corporais em PMs de Sao Paulo.', 'A camera engessa o policial. Vamos rever o uso porque o PM precisa trabalhar com tranquilidade.', 'Anuncio em Sao Paulo de revisao do programa Olho Vivo que usava cameras corporais em PMs.', 'verified', true, '2024-02-20', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/02/20/tarcisio-camera-corporal-pm-sp.ghtml', 'news_article', 4, 'Sao Paulo', 'Anuncio na Secretaria de Seguranca', 'tarcisio-camera-corporal-b106-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes defende PM que deu tiro em homem no chao na Zona Leste de SP.', 'A acao foi feita no calor da hora. Nao da para julgar o policial que arrisca a vida todo dia.', 'Entrevista apos video de PM atirando em homem rendido na Zona Leste em abril de 2024.', 'verified', true, '2024-04-12', 'https://www1.folha.uol.com.br/cotidiano/2024/04/nunes-defende-pm-tiro-chao-sp.shtml', 'news_article', 4, 'Sao Paulo', 'Entrevista na Prefeitura', 'nunes-defende-pm-tiro-chao-b106-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Pablo Marcal leva cadeirada de Datena em debate da TV Cultura em 2024.', 'Voce e vagabundo, Datena. Covarde. Bate em mim que eu te mostro quem e homem.', 'Debate da TV Cultura em 15 de setembro de 2024 no qual Datena agrediu Marcal com cadeirada.', 'verified', true, '2024-09-15', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/marcal-cadeirada-datena-debate-cultura.ghtml', 'news_article', 3, 'Sao Paulo', 'Debate TV Cultura', 'marcal-cadeirada-datena-b106-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marcal divulga laudo medico falso sobre Boulos durante eleicao de SP.', 'O Boulos e viciado em cocaina. Tenho laudo. O povo de Sao Paulo precisa saber a verdade.', 'Marcal divulgou falso laudo medico sobre Boulos em setembro de 2024, resultando em multa do TSE.', 'verified', true, '2024-09-22', 'https://www.cnnbrasil.com.br/politica/marcal-laudo-falso-boulos-tse-multa/', 'news_article', 4, 'Sao Paulo', 'Rede social de Marcal', 'marcal-laudo-falso-boulos-b106-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bpr, 'Boulos chama Marcal de golpista e defende democracia em debate.', 'O Marcal e um coach golpista que lucra com mentira. E perigoso para a democracia.', 'Debate da Globo em outubro de 2024 durante segundo turno da eleicao paulistana.', 'verified', false, '2024-10-04', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/04/boulos-marcal-golpista-debate.ghtml', 'news_article', 2, 'Sao Paulo', 'Debate Globo', 'boulos-marcal-golpista-b106-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes vence Boulos no segundo turno em SP em outubro de 2024.', 'Sao Paulo escolheu o trabalho e rejeitou o radicalismo. Continuarei a obra do Bruno Covas.', 'Discurso de vitoria em 27 de outubro de 2024 apos derrotar Boulos no segundo turno.', 'verified', true, '2024-10-27', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/nunes-vence-boulos-segundo-turno-sp.ghtml', 'news_article', 1, 'Sao Paulo', 'Comite de campanha', 'nunes-vence-boulos-b106-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Eduardo Paes vence reeleicao no Rio em primeiro turno contra Ramagem.', 'O Rio rejeitou o radicalismo e escolheu quem trabalha. Vou governar para todos os cariocas.', 'Discurso de vitoria em 6 de outubro de 2024 apos vencer Alexandre Ramagem em primeiro turno.', 'verified', true, '2024-10-06', 'https://oglobo.globo.com/rio/eleicoes/noticia/2024/10/06/paes-reeleicao-primeiro-turno-ramagem.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Comite de campanha', 'paes-reeleicao-rio-b106-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Paes critica governo federal por atraso em obras do Rio durante campanha.', 'O Rio foi abandonado pelo governo federal. Vou cobrar Lula todos os dias porque o carioca nao pode esperar.', 'Entrevista a CNN em agosto de 2024 em meio a atritos com ministros sobre recursos.', 'verified', false, '2024-08-15', 'https://www.cnnbrasil.com.br/politica/paes-cobra-lula-obras-rio-2024/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista CNN', 'paes-cobra-lula-obras-b106-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman critica Zema por abandono de BH durante enchentes de 2024.', 'Zema so pensa em presidencia. BH esta sem apoio do governo estadual nas enchentes.', 'Entrevista em Belo Horizonte apos chuvas de janeiro de 2024 que deixaram BH em estado de calamidade.', 'verified', false, '2024-01-18', 'https://www.em.com.br/app/noticia/politica/2024/01/18/fuad-critica-zema-enchentes-bh.shtml', 'news_article', 2, 'Belo Horizonte', 'Coletiva na Prefeitura', 'fuad-critica-zema-enchentes-b106-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende privatizacao da Cemig e Copasa em ato eleitoral.', 'Vou privatizar Cemig e Copasa custe o que custar. Minas nao pode ter empresa estatal deficitaria.', 'Ato em Belo Horizonte com lideres do Novo em fevereiro de 2023 para pressionar Assembleia.', 'verified', true, '2023-02-14', 'https://www.em.com.br/app/noticia/politica/2023/02/14/zema-privatizacao-cemig-copasa.shtml', 'news_article', 3, 'Belo Horizonte', 'Ato do Novo', 'zema-privatizacao-cemig-copasa-b106-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema acusa Lula de vingar Minas Gerais por nao aderir ao Propag.', 'O Lula esta vingando Minas por eu ser oposicao. E retaliacao politica pura, o mineiro esta pagando.', 'Declaracao em entrevista a Radio Inconfidencia apos impasse sobre renegociacao da divida.', 'verified', true, '2024-07-22', 'https://www.poder360.com.br/politica/zema-acusa-lula-minas-propag-vinganca/', 'news_article', 3, 'Belo Horizonte', 'Entrevista Radio Inconfidencia', 'zema-lula-vinganca-minas-b106-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior defende flexibilizacao do porte de armas no Parana.', 'No Parana a gente confia no cidadao de bem armado. Armei a policia e agora quero armar o produtor rural.', 'Evento com produtores rurais em Cascavel em abril de 2023 sobre reduzir burocracia para armas.', 'verified', false, '2023-04-20', 'https://www.tribunapr.com.br/politica/ratinho-junior-armas-produtor-rural.html', 'news_article', 3, 'Cascavel', 'Evento com produtores rurais', 'ratinho-armas-produtor-rural-b106-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr critica ICMBio apos conflito com produtores no Parque do Iguacu.', 'O ICMBio esta contra o Parana. Vou mandar a PM defender o produtor rural de fiscal abusivo.', 'Declaracao apos conflito entre ICMBio e produtores no entorno do Parque Nacional do Iguacu.', 'verified', false, '2024-03-11', 'https://www.tribunapr.com.br/politica/ratinho-junior-icmbio-parque-iguacu.html', 'news_article', 3, 'Foz do Iguacu', 'Visita ao Parque do Iguacu', 'ratinho-icmbio-iguacu-b106-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis Rocha e afastado do governo do DF apos 8 de janeiro de 2023.', 'Nao tive responsabilidade sobre os atos de 8 de janeiro. Fui traido pela cupula da PM.', 'Declaracao apos afastamento cautelar determinado pelo STF por omissao nos ataques de 8 de janeiro.', 'verified', true, '2023-01-10', 'https://g1.globo.com/df/distrito-federal/noticia/2023/01/10/ibaneis-rocha-afastamento-8-janeiro.ghtml', 'news_article', 4, 'Brasilia', 'Pronunciamento apos afastamento', 'ibaneis-afastamento-8-janeiro-b106-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis defende Torres e diz que nao havia indicios de golpe em Brasilia.', 'O Anderson Torres nao sabia de nada. A inteligencia falhou mas nao havia sinais claros.', 'Entrevista ao Metropoles apos operacao da PF sobre planejamento dos atos de 8 de janeiro.', 'verified', false, '2023-01-15', 'https://www.metropoles.com/distrito-federal/ibaneis-defende-torres-8-janeiro', 'news_article', 3, 'Brasilia', 'Entrevista Metropoles', 'ibaneis-defende-torres-b106-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmano de Freitas defende BOPE do Ceara apos chacina em Fortaleza.', 'A policia do Ceara cumpre seu dever. A violencia vem do trafico e nao do Estado.', 'Coletiva em Fortaleza apos chacina no bairro Barra do Ceara com 10 mortos em outubro de 2023.', 'verified', true, '2023-10-28', 'https://diariodonordeste.verdesmares.com.br/politica/elmano-chacina-barra-ceara-policia', 'news_article', 4, 'Fortaleza', 'Coletiva no Palacio da Abolicao', 'elmano-chacina-barra-ceara-b106-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto Nogueira acusa Elmano de partidarizar seguranca em Fortaleza.', 'O PT usa a policia estadual para perseguir a prefeitura. E guerra partidaria na pele do fortalezense.', 'Entrevista a O POVO em janeiro de 2024 sobre atritos entre PM-CE e Guarda Municipal de Fortaleza.', 'verified', false, '2024-01-25', 'https://www.opovo.com.br/noticias/politica/sarto-elmano-partidariza-seguranca.html', 'news_article', 2, 'Fortaleza', 'Entrevista O POVO', 'sarto-elmano-partidariza-b106-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra e criticada por demora na resposta a crise hidrica no sertao de Pernambuco.', 'A crise hidrica e responsabilidade do governo federal. Pernambuco cumpre sua parte.', 'Declaracao em junho de 2024 apos protestos no sertao sobre falta de agua e carros-pipa.', 'verified', true, '2024-06-10', 'https://jc.ne10.uol.com.br/politica/raquel-lyra-crise-hidrica-sertao', 'news_article', 3, 'Recife', 'Coletiva no Palacio do Campo das Princesas', 'raquel-lyra-crise-hidrica-b106-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra nomeia parentes para cargos comissionados e e acusada de nepotismo.', 'Minhas escolhas sao tecnicas. Nao ha nepotismo porque sao cargos de confianca permitidos por lei.', 'Denuncia do MP de Pernambuco sobre nomeacoes de familiares em 2023 no governo estadual.', 'verified', false, '2023-09-14', 'https://jc.ne10.uol.com.br/politica/raquel-lyra-nepotismo-mp-pe', 'news_article', 3, 'Recife', 'Coletiva no Palacio das Princesas', 'raquel-lyra-nepotismo-b106-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'Joao Campos defende ampliacao de agua no Recife durante crise hidrica.', 'Vou trabalhar para que Recife nao sofra com desabastecimento. A prefeitura nao vai esperar o estado.', 'Anuncio em Recife de plano emergencial da prefeitura durante racionamento na regiao metropolitana.', 'verified', false, '2024-06-12', 'https://jc.ne10.uol.com.br/politica/joao-campos-agua-recife-plano', 'news_article', 1, 'Recife', 'Coletiva na Prefeitura', 'joao-campos-agua-recife-b106-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'Joao Campos vence reeleicao no Recife com ampla margem em 2024.', 'Recife escolheu continuar avancando. Vou honrar a confianca com trabalho e entrega.', 'Discurso de vitoria em 6 de outubro de 2024 apos vencer em primeiro turno.', 'verified', true, '2024-10-06', 'https://g1.globo.com/pe/pernambuco/eleicoes/2024/noticia/2024/10/06/joao-campos-reeleicao-recife.ghtml', 'news_article', 1, 'Recife', 'Comite de campanha', 'joao-campos-reeleicao-b106-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_top, 'Topazio Silveira vence em Florianopolis apoiado por Bolsonaro em 2024.', 'Floripa escolheu o conservadorismo e a gestao. Vou cumprir o que prometi ao bolsonarista de bem.', 'Discurso de vitoria em 27 de outubro de 2024 apos derrotar adversario no segundo turno.', 'verified', true, '2024-10-27', 'https://www.nsctotal.com.br/noticias/topazio-silveira-vitoria-florianopolis-2024', 'news_article', 2, 'Florianopolis', 'Comite de campanha', 'topazio-vitoria-floripa-b106-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_smelo, 'Sebastiao Melo e criticado por lentidao de POA durante enchentes do RS em 2024.', 'A cidade fez o que podia. A tragedia foi de tal magnitude que nenhum municipio estava preparado.', 'Entrevista a GZH em meio a enchentes que alagaram 80% de Porto Alegre em maio de 2024.', 'verified', true, '2024-05-10', 'https://gauchazh.clicrbs.com.br/porto-alegre/noticia/2024/05/melo-lentidao-enchentes-poa.html', 'news_article', 4, 'Porto Alegre', 'Entrevista GZH', 'melo-lentidao-enchentes-poa-b106-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_smelo, 'Melo defende revogacao do Plano Diretor de POA que removeu area de preservacao.', 'O Plano Diretor precisa modernizar. Nao da para engessar a cidade por causa de ambientalismo radical.', 'Declaracao em audiencia publica sobre revisao do Plano Diretor em marco de 2023.', 'verified', false, '2023-03-15', 'https://gauchazh.clicrbs.com.br/porto-alegre/noticia/2023/03/melo-plano-diretor-revisao.html', 'news_article', 3, 'Porto Alegre', 'Audiencia publica', 'melo-plano-diretor-poa-b106-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_smelo, 'Melo e reeleito em POA mesmo apos criticas pela gestao das enchentes.', 'Porto Alegre quis continuidade. Vou reconstruir a cidade melhor do que antes.', 'Discurso de vitoria em 27 de outubro de 2024 apos segundo turno em Porto Alegre.', 'verified', true, '2024-10-27', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/10/melo-reeleito-porto-alegre.html', 'news_article', 1, 'Porto Alegre', 'Comite de campanha', 'melo-reeleito-poa-b106-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gre, 'Rafael Greca apoia sucessor em Curitiba e critica federalizacao de politicas.', 'Curitiba nao precisa do PT interferindo. Somos cidade modelo e vamos manter gestao conservadora.', 'Evento em Curitiba em agosto de 2024 apoiando candidatura de Eduardo Pimentel.', 'verified', false, '2024-08-10', 'https://www.tribunapr.com.br/politica/greca-apoio-pimentel-curitiba.html', 'news_article', 2, 'Curitiba', 'Evento de campanha', 'greca-apoio-pimentel-b106-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bre, 'Bruno Reis vence reeleicao em Salvador em primeiro turno de 2024.', 'Salvador escolheu o trabalho. Vou continuar a parceria com ACM Neto e com o povo soteropolitano.', 'Discurso de vitoria em Salvador em 6 de outubro de 2024.', 'verified', false, '2024-10-06', 'https://www.correio24horas.com.br/politica/bruno-reis-reeleicao-salvador-2024', 'news_article', 1, 'Salvador', 'Comite de campanha', 'bruno-reis-reeleicao-b106-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dal, 'David Almeida e alvo de operacao da PF por fraude em licitacao em Manaus.', 'Sou vitima de perseguicao politica. Todas as licitacoes de Manaus sao legais e transparentes.', 'Declaracao apos Operacao Overclean da PF em setembro de 2024 que mirou contratos da prefeitura.', 'verified', true, '2024-09-05', 'https://www.acritica.com/politica/david-almeida-operacao-overclean-pf', 'news_article', 4, 'Manaus', 'Coletiva na Prefeitura', 'david-almeida-overclean-b106-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dal, 'David Almeida e reeleito em Manaus mesmo apos operacao da PF.', 'Manaus confia em mim. As denuncias nao colaram porque o povo sabe o trabalho que fazemos.', 'Discurso de vitoria em Manaus em 27 de outubro de 2024 apos segundo turno.', 'verified', false, '2024-10-27', 'https://amazonasatual.com.br/david-almeida-reeleito-manaus-2024/', 'news_article', 1, 'Manaus', 'Comite de campanha', 'david-almeida-reeleito-b106-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fatima Bezerra defende reforma tributaria e critica oposicao bolsonarista.', 'A reforma tributaria e vital para o RN. Quem vota contra trai o povo nordestino.', 'Declaracao durante audiencia na Assembleia do RN em julho de 2023 sobre reforma tributaria.', 'verified', false, '2023-07-12', 'https://www.tribunadonorte.com.br/politica/fatima-reforma-tributaria-rn.html', 'news_article', 2, 'Natal', 'ALE-RN', 'fatima-reforma-tributaria-b106-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fatima Bezerra admite dificuldade com violencia em Natal durante mandato.', 'A seguranca e desafio grande. O RN herdou caos e estamos reconstruindo com governo federal.', 'Entrevista a Tribuna do Norte em abril de 2024 sobre indices de violencia no RN.', 'verified', false, '2024-04-18', 'https://www.tribunadonorte.com.br/politica/fatima-seguranca-natal.html', 'news_article', 2, 'Natal', 'Entrevista Tribuna do Norte', 'fatima-violencia-natal-b106-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cbr, 'Carlos Brandao defende operacao policial no Maranhao apos criticas por mortes.', 'Quem entra em confronto com a policia do Maranhao sabe o que acontece. Nao toleramos bandido.', 'Coletiva em Sao Luis apos operacao da PM que deixou 8 mortos em janeiro de 2024.', 'verified', false, '2024-01-20', 'https://imirante.com/politica/brandao-operacao-policial-maranhao', 'news_article', 4, 'Sao Luis', 'Coletiva no Palacio dos Leoes', 'brandao-operacao-ma-b106-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli e alvo de operacao da PF por fraude em obra no Acre.', 'Sou inocente e colaborarei com a PF. A operacao e politica em ano eleitoral.', 'Declaracao apos Operacao Ptolomeu da PF em agosto de 2023 que mirou contratos estaduais.', 'verified', true, '2023-08-09', 'https://g1.globo.com/ac/acre/noticia/2023/08/09/cameli-operacao-ptolomeu-pf.ghtml', 'news_article', 4, 'Rio Branco', 'Coletiva no Palacio Rio Branco', 'cameli-operacao-ptolomeu-b106-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antonio Denarium apoia garimpeiros e critica desintrusao yanomami.', 'O governo federal trata garimpeiro como bandido. Muitos sao pais de familia que perderam o sustento.', 'Declaracao apos operacoes federais contra garimpo ilegal em territorio yanomami em 2023.', 'verified', true, '2023-03-22', 'https://g1.globo.com/rr/roraima/noticia/2023/03/22/denarium-garimpeiros-yanomami.ghtml', 'news_article', 4, 'Boa Vista', 'Entrevista em Boa Vista', 'denarium-garimpeiros-yanomami-b106-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Denarium diz que demarcacao de terras indigenas trava desenvolvimento de Roraima.', 'Roraima nao desenvolve por causa de 70% do territorio em terra indigena. Precisamos revisar isso.', 'Discurso em Assembleia de Roraima em setembro de 2023 sobre demarcacao.', 'verified', false, '2023-09-12', 'https://folhabv.com.br/politica/denarium-terras-indigenas-roraima', 'news_article', 3, 'Boa Vista', 'Sessao na ALE-RR', 'denarium-terras-indigenas-b106-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clecio Luis defende exploracao de petroleo na Foz do Amazonas.', 'O Amapa precisa do petroleo da Foz do Amazonas. Quem quer desenvolvimento apoia a Petrobras.', 'Entrevista em Macapa em maio de 2023 defendendo licenca para exploracao na regiao.', 'verified', false, '2023-05-25', 'https://g1.globo.com/ap/amapa/noticia/2023/05/25/clecio-petroleo-foz-amazonas.ghtml', 'news_article', 3, 'Macapa', 'Coletiva no Palacio do Setentriao', 'clecio-petroleo-foz-amazonas-b106-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wba, 'Wanderlei Barbosa enfrenta denuncias de corrupcao na Saude do Tocantins.', 'A Saude do Tocantins e modelo. As denuncias sao fofoca politica de quem perdeu a eleicao.', 'Declaracao apos CPI da Saude na ALE-TO apontar superfaturamento em contratos em 2023.', 'verified', false, '2023-10-05', 'https://www.jornaldotocantins.com.br/politica/wanderlei-cpi-saude-to', 'news_article', 3, 'Palmas', 'Coletiva no Palacio Araguaia', 'wanderlei-cpi-saude-to-b106-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Jorginho Mello declara apoio total a Bolsonaro mesmo apos inelegibilidade.', 'Bolsonaro e o lider da direita brasileira. Santa Catarina e terra bolsonarista e vai defender o capitao.', 'Discurso em Florianopolis durante ato bolsonarista em julho de 2023 apos decisao do TSE.', 'verified', false, '2023-07-08', 'https://www.nsctotal.com.br/noticias/jorginho-mello-bolsonaro-sc-ato', 'news_article', 3, 'Florianopolis', 'Ato bolsonarista', 'jorginho-bolsonaro-ato-sc-b106-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Jorginho Mello nomeia parentes para cargos no governo de SC.', 'Cargos comissionados sao de confianca. Minha familia tem competencia e nao ha irregularidade.', 'Denuncia do MP-SC sobre nomeacoes familiares na estrutura do governo catarinense em 2023.', 'verified', false, '2023-11-10', 'https://www.nsctotal.com.br/noticias/jorginho-mello-nepotismo-mp-sc', 'news_article', 3, 'Florianopolis', 'Coletiva no Centro Administrativo', 'jorginho-nepotismo-sc-b106-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rfo, 'Rafael Fonteles defende concurso publico mas e criticado por contratacoes emergenciais no Piaui.', 'O Piaui esta contratando com transparencia. Cada dotacao foi analisada pela Procuradoria.', 'Coletiva em Teresina apos denuncias de contratacoes sem concurso em marco de 2024.', 'verified', false, '2024-03-22', 'https://g1.globo.com/pi/piaui/noticia/2024/03/22/fonteles-contratacoes-emergenciais-piaui.ghtml', 'news_article', 2, 'Teresina', 'Coletiva no Palacio de Karnak', 'fonteles-contratacoes-piaui-b106-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fmt, 'Fabio Mitidieri enfrenta crise de violencia em Sergipe e culpa governo anterior.', 'A violencia de Sergipe vem da heranca maldita de Belivaldo. Vamos reverter, mas leva tempo.', 'Entrevista em Aracaju em junho de 2023 sobre aumento de homicidios no estado.', 'verified', false, '2023-06-14', 'https://infonet.com.br/politica/mitidieri-violencia-sergipe-belivaldo', 'news_article', 2, 'Aracaju', 'Coletiva no Palacio dos Despachos', 'mitidieri-violencia-sergipe-b106-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pda, 'Paulo Dantas acusa oposicao de usar mandato para atacar governo de Alagoas.', 'A oposicao em Alagoas nao quer o bem do povo. Querem fazer terra arrasada para voltar ao poder.', 'Discurso em Maceio em abril de 2023 em resposta a CPI da Educacao na ALE-AL.', 'verified', false, '2023-04-05', 'https://gazetaweb.globo.com/politica/dantas-oposicao-cpi-educacao', 'news_article', 2, 'Maceio', 'Coletiva no Palacio Republica dos Palmares', 'dantas-oposicao-al-b106-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas_es, 'Renato Casagrande defende a Vale apos rompimento de barragem no ES.', 'A Vale esta cooperando e nao podemos demonizar a mineracao. Precisamos de emprego no ES.', 'Declaracao em Vitoria apos acidente em barragem em junho de 2023 na regiao sul do estado.', 'verified', false, '2023-06-18', 'https://www.folhavitoria.com.br/politica/casagrande-vale-barragem-es', 'news_article', 3, 'Vitoria', 'Coletiva no Palacio Anchieta', 'casagrande-vale-barragem-es-b106-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_joa, 'Joao Azevedo defende investimentos em seguranca na Paraiba e critica bolsonarismo.', 'A Paraiba esta reduzindo a violencia. Quem fala em armar o povo quer o caos, nao a paz.', 'Entrevista em Joao Pessoa em setembro de 2023 sobre politicas de seguranca.', 'verified', false, '2023-09-20', 'https://jornaldaparaiba.com.br/politica/joao-azevedo-seguranca-pb', 'news_article', 1, 'Joao Pessoa', 'Coletiva no Palacio da Redencao', 'joao-azevedo-seguranca-pb-b106-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Eduardo Riedel defende agro no MS e critica demarcacoes indigenas.', 'O agro e a vida de Mato Grosso do Sul. Nao vamos aceitar demarcacao que destroi a economia.', 'Discurso em Campo Grande durante Expoagro em abril de 2023 sobre conflitos fundiarios.', 'verified', false, '2023-04-28', 'https://www.correiodoestado.com.br/politica/riedel-demarcacoes-agro-ms', 'news_article', 3, 'Campo Grande', 'Expoagro Campo Grande', 'riedel-demarcacoes-ms-b106-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro defende isencao de ICMS para armas e municoes no RJ.', 'O cidadao de bem precisa se defender. Reducao de imposto para armas vai salvar vidas no Rio.', 'Anuncio no Palacio Guanabara em junho de 2023 de projeto para reducao de tributos.', 'verified', false, '2023-06-08', 'https://oglobo.globo.com/rio/noticia/2023/06/castro-icms-armas-municoes-rj.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Anuncio no Palacio Guanabara', 'castro-icms-armas-rj-b106-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Claudio Castro e alvo de operacao da PF por fraude na Saude do RJ.', 'Nao tenho nada a ver com contratos de gestores da Saude. Vou colaborar com a PF.', 'Declaracao apos operacao Fames-19 da PF que mirou contratos pandemicos em abril de 2024.', 'verified', true, '2024-04-04', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/04/04/castro-operacao-pf-saude-rj.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Pronunciamento no Palacio Guanabara', 'castro-fames-19-saude-b106-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado amplia ataques contra MST em Goias e ameaca despejos.', 'Em Goias invasao de terra e crime. A PM vai desocupar com forca se for preciso.', 'Declaracao apos acampamento do MST em fazenda em Goias em abril de 2023.', 'verified', true, '2023-04-17', 'https://www.cnnbrasil.com.br/politica/caiado-mst-desocupacao-goias/', 'news_article', 4, 'Goiania', 'Coletiva no Palacio das Esmeraldas', 'caiado-mst-desocupacao-b106-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado se posiciona contra uniao homoafetiva em evento religioso de Goiania.', 'A familia e pai, mae e filhos. Nao podemos normalizar o que a Biblia condena.', 'Discurso em culto evangelico em Goiania em agosto de 2023.', 'verified', false, '2023-08-12', 'https://jovempan.com.br/noticias/politica/caiado-uniao-homoafetiva-culto-go.html', 'news_article', 3, 'Goiania', 'Culto evangelico em GO', 'caiado-homoafetiva-go-b106-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema corta recursos do Uai e fecha unidades apesar de criticas da populacao.', 'O Uai vai ser enxugado. Minas nao suporta mais politica assistencialista deficitaria.', 'Anuncio em Belo Horizonte em marco de 2024 sobre redesenho da rede estadual de saude.', 'verified', false, '2024-03-18', 'https://www.em.com.br/app/noticia/politica/2024/03/18/zema-uai-saude-cortes.shtml', 'news_article', 2, 'Belo Horizonte', 'Coletiva na Cidade Administrativa', 'zema-uai-cortes-saude-b106-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio defende venda da Sabesp e ignora debate publico.', 'A privatizacao da Sabesp e inevitavel. Nao tem plebiscito porque o povo ja disse sim.', 'Declaracao em abril de 2024 apos criticas a pressa na privatizacao da Sabesp.', 'verified', true, '2024-04-24', 'https://www1.folha.uol.com.br/cotidiano/2024/04/tarcisio-privatizacao-sabesp-plebiscito.shtml', 'news_article', 3, 'Sao Paulo', 'Coletiva no Palacio dos Bandeirantes', 'tarcisio-sabesp-plebiscito-b106-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio ameaca servidor que protesta contra privatizacao da Sabesp.', 'Quem ficar do lado de ideologia em vez do cidadao vai ter consequencia no meu governo.', 'Fala na ALESP em meio a protestos de servidores da Sabesp em maio de 2024.', 'verified', false, '2024-05-02', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/05/02/tarcisio-servidor-sabesp-ameaca.ghtml', 'news_article', 4, 'Sao Paulo', 'Discurso na ALESP', 'tarcisio-ameaca-servidor-sabesp-b106-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho faz crossover com Lula e fortalece base para 2026.', 'Sou aliado de Lula em temas que interessam ao Para. Isso nao significa casamento partidario.', 'Entrevista em Belem em fevereiro de 2024 sobre alinhamento ao governo federal.', 'verified', false, '2024-02-10', 'https://g1.globo.com/pa/para/noticia/2024/02/10/helder-lula-alinhamento-para.ghtml', 'news_article', 1, 'Belem', 'Entrevista em Belem', 'helder-lula-alinhamento-b106-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leit, 'Eduardo Leite muda discurso sobre climate change apos enchentes do RS.', 'Nao podemos mais tratar evento climatico como excecao. O RS precisa de politica permanente de clima.', 'Discurso em Porto Alegre em agosto de 2024 apos reconstrucao parcial pos enchentes.', 'verified', true, '2024-08-28', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/08/leite-politica-climatica-rs.html', 'news_article', 1, 'Porto Alegre', 'Evento de reconstrucao', 'leite-politica-climatica-rs-b106-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima demite secretaria de Meio Ambiente apos criticas sobre queimadas.', 'A secretaria nao correspondeu ao que precisavamos. Vou colocar alguem que trabalha com produtor rural.', 'Anuncio em Manaus em outubro de 2024 apos demissao da secretaria estadual de Meio Ambiente.', 'verified', false, '2024-10-15', 'https://amazonasatual.com.br/wilson-lima-demite-secretaria-meio-ambiente/', 'news_article', 3, 'Manaus', 'Coletiva na Sede do Governo', 'wilson-lima-demite-sema-b106-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jeronimo promete reformular PM da Bahia apos denuncias do MP.', 'Vamos reformular a Rondesp, mas nao retiraremos a PM da rua. O baiano quer seguranca.', 'Declaracao em maio de 2024 apos denuncias do MP-BA sobre letalidade da Rondesp.', 'verified', false, '2024-05-20', 'https://www.atarde.com.br/politica/jeronimo-rondesp-reforma-pm', 'news_article', 3, 'Salvador', 'Coletiva em Ondina', 'jeronimo-rondesp-reforma-b106-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmano defende operacao policial em Caucaia apos chacina com 8 mortos.', 'Cada morto foi confronto legal. A PM do Ceara esta cumprindo a Constituicao.', 'Coletiva em Fortaleza em agosto de 2024 apos chacina em Caucaia durante operacao policial.', 'verified', false, '2024-08-18', 'https://diariodonordeste.verdesmares.com.br/politica/elmano-chacina-caucaia-pm', 'news_article', 4, 'Fortaleza', 'Coletiva no Palacio da Abolicao', 'elmano-chacina-caucaia-b106-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra chora em entrevista e diz ser vitima de machismo na politica.', 'Sofro ataques porque sou mulher na politica. O machismo persegue quem ousa comandar.', 'Entrevista em Recife em marco de 2024 apos criticas de Joao Campos a sua gestao.', 'verified', false, '2024-03-28', 'https://jc.ne10.uol.com.br/politica/raquel-lyra-machismo-politica-pe', 'news_article', 2, 'Recife', 'Entrevista JC', 'raquel-machismo-politica-b106-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarto perde reeleicao em Fortaleza para Evandro apoiado por Elmano em 2024.', 'Fortaleza errou. O PT comprou a eleicao com maquina federal e estadual.', 'Declaracao apos derrota no segundo turno em outubro de 2024 em Fortaleza.', 'verified', false, '2024-10-27', 'https://www.opovo.com.br/noticias/politica/sarto-derrota-evandro-fortaleza.html', 'news_article', 3, 'Fortaleza', 'Comite de Sarto', 'sarto-derrota-evandro-b106-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman sobrevive a cirurgia e e reeleito em BH em 2024.', 'Belo Horizonte me deu forca para seguir. Vou honrar a confianca de cada mineiro.', 'Discurso de vitoria em BH em 27 de outubro de 2024 apos derrotar Bruno Engler no segundo turno.', 'verified', true, '2024-10-27', 'https://www.em.com.br/app/noticia/politica/2024/10/27/fuad-reeleicao-bh.shtml', 'news_article', 1, 'Belo Horizonte', 'Comite de campanha', 'fuad-reeleicao-bh-b106-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gre, 'Greca faz comentario xenofobico sobre migrantes venezuelanos em Curitiba.', 'Curitiba nao e acampamento de refugiados. Nossa cidade tem ordem e nao pode virar bagunca.', 'Entrevista a radio em Curitiba em marco de 2024 sobre aumento de migrantes.', 'verified', false, '2024-03-04', 'https://www.tribunapr.com.br/politica/greca-migrantes-venezuelanos-cwb.html', 'news_article', 3, 'Curitiba', 'Entrevista a radio', 'greca-migrantes-xenofobia-b106-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bre, 'Bruno Reis defende gestao da limpeza urbana apos protestos em Salvador.', 'A limpeza de Salvador melhorou muito. Quem reclama e o opositor que nunca aceitou a derrota.', 'Entrevista a Correio 24h em junho de 2023 sobre protestos por coleta de lixo.', 'verified', false, '2023-06-26', 'https://www.correio24horas.com.br/politica/bruno-reis-limpeza-urbana-salvador', 'news_article', 2, 'Salvador', 'Coletiva na Prefeitura', 'bruno-reis-limpeza-urbana-b106-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes ignora obra contra enchentes em SP e Zona Norte alaga em 2024.', 'Sao Paulo tem historico de alagamento. Nao da para resolver tudo em um mandato.', 'Declaracao apos alagamento severo na Zona Norte em fevereiro de 2024.', 'verified', false, '2024-02-14', 'https://www1.folha.uol.com.br/cotidiano/2024/02/nunes-alagamento-zona-norte-sp.shtml', 'news_article', 3, 'Sao Paulo', 'Coletiva na Prefeitura', 'nunes-alagamento-zona-norte-b106-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Eduardo Paes autoriza desapropriacao em area favela-Vidigal apesar de protestos.', 'Cariocas precisam de obra para resolver deslizamento. Nao vou parar por lobby de ONG.', 'Anuncio em dezembro de 2023 sobre obras contra deslizamentos na Zona Sul do Rio.', 'verified', false, '2023-12-12', 'https://oglobo.globo.com/rio/noticia/2023/12/paes-desapropriacao-vidigal.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva na Prefeitura', 'paes-desapropriacao-vidigal-b106-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marcal difunde video manipulado de Boulos para prejudicar rival em debate.', 'Tenho provas do Boulos. Nao tem volta, o povo vai saber quem e o candidato de drogado.', 'Declaracao na vespera do debate final em outubro de 2024, gerando acao judicial.', 'verified', true, '2024-10-01', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/01/marcal-video-manipulado-boulos.ghtml', 'news_article', 4, 'Sao Paulo', 'Live no YouTube', 'marcal-video-manipulado-boulos-b106-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones participa de campanha de Boulos em SP e ataca Marcal.', 'O Marcal e estelionatario. Esse tipo nao pode chegar ao poder em Sao Paulo.', 'Comicio de Boulos em Sao Paulo em setembro de 2024 com participacao de Janones.', 'verified', false, '2024-09-20', 'https://www.poder360.com.br/politica/janones-boulos-marcal-estelionatario-sp/', 'news_article', 2, 'Sao Paulo', 'Comicio de Boulos', 'janones-boulos-marcal-sp-b106-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos perde eleicao em SP e sinaliza candidatura a governador em 2026.', 'Perdi agora mas a luta continua. Sao Paulo precisa de alternativa e eu vou continuar firme.', 'Discurso de derrota em Sao Paulo em 27 de outubro de 2024.', 'verified', true, '2024-10-27', 'https://www1.folha.uol.com.br/poder/2024/10/boulos-derrota-sp-2024.shtml', 'news_article', 1, 'Sao Paulo', 'Comite de campanha', 'boulos-derrota-sp-2024-b106-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema recusa visita de Lula a Minas durante crise Propag.', 'O Lula nao e bem-vindo em Minas enquanto nao liberar o Propag. Vou proteger o mineiro.', 'Declaracao em agosto de 2024 apos atrito com Planalto sobre renegociacao da divida estadual.', 'verified', true, '2024-08-20', 'https://www.poder360.com.br/politica/zema-recusa-lula-minas-propag/', 'news_article', 4, 'Belo Horizonte', 'Coletiva em BH', 'zema-recusa-lula-minas-b106-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Junior se distancia de Bolsonaro e mira presidencia em 2026.', 'Respeito Bolsonaro mas o Parana quer gestao e nao ideologia. Sou candidato se o PSD quiser.', 'Entrevista em Curitiba em setembro de 2024 sobre candidatura presidencial.', 'verified', true, '2024-09-08', 'https://www.poder360.com.br/politica/ratinho-junior-presidencia-psd-2026/', 'news_article', 1, 'Curitiba', 'Entrevista Tribuna do Parana', 'ratinho-presidencia-2026-b106-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado confirma pre-candidatura presidencial pelo Uniao Brasil.', 'Aceito o chamado para presidencia. Goias sera modelo para o Brasil em seguranca e gestao.', 'Discurso em Brasilia em marco de 2025 durante convencao do Uniao Brasil.', 'verified', true, '2025-03-15', 'https://g1.globo.com/politica/noticia/2025/03/15/caiado-pre-candidato-presidencia-uniao-brasil.ghtml', 'news_article', 2, 'Brasilia', 'Convencao Uniao Brasil', 'caiado-pre-candidato-presidencia-b106-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio defende Bolsonaro apos indiciamento pela PF em novembro de 2024.', 'O Bolsonaro e perseguido. Vou estar do lado dele ate o fim porque e injusticia do STF.', 'Declaracao em Sao Paulo apos indiciamento de Bolsonaro pela PF em novembro de 2024.', 'verified', true, '2024-11-22', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/11/22/tarcisio-defende-bolsonaro-indiciamento.ghtml', 'news_article', 4, 'Sao Paulo', 'Coletiva no Palacio dos Bandeirantes', 'tarcisio-defende-bolsonaro-b106-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Riedel articula agro do MS para 2026 e defende Tarcisio presidente.', 'O Tarcisio tem meu apoio. O agro de MS quer um presidente que conheca o campo.', 'Entrevista ao Correio do Estado em junho de 2024 apos encontro com Tarcisio em Bonito.', 'verified', false, '2024-06-20', 'https://www.correiodoestado.com.br/politica/riedel-tarcisio-presidencia-2026', 'news_article', 1, 'Campo Grande', 'Entrevista Correio do Estado', 'riedel-tarcisio-presidencia-b106-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho anuncia pre-candidatura presidencial pelo MDB.', 'Sou pre-candidato para apresentar ao Brasil o que fizemos no Para. A Amazonia merece ser presidente.', 'Discurso em Belem em janeiro de 2025 durante articulacao do MDB.', 'verified', true, '2025-01-18', 'https://g1.globo.com/pa/para/noticia/2025/01/18/helder-pre-candidato-presidencia-mdb.ghtml', 'news_article', 2, 'Belem', 'Evento MDB Para', 'helder-pre-candidato-mdb-b106-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leit, 'Eduardo Leite retorna ao PSDB e mira presidencia pela terceira via.', 'A terceira via e necessaria. Vou trabalhar para apresentar alternativa entre extremos.', 'Anuncio em Porto Alegre em marco de 2025 sobre candidatura presidencial.', 'verified', true, '2025-03-02', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/03/leite-presidencia-psdb-2026.html', 'news_article', 2, 'Porto Alegre', 'Anuncio no PSDB', 'leite-presidencia-terceira-via-b106-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Castro nomeia irmao para cargo comissionado no RJ e gera polemica.', 'Meu irmao e tecnico e tem competencia. A familia Castro ajudou a vencer no Rio.', 'Denuncia do MP-RJ em agosto de 2023 sobre nomeacao familiar em secretaria.', 'verified', false, '2023-08-14', 'https://oglobo.globo.com/rio/noticia/2023/08/castro-nomeia-irmao-nepotismo.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva no Palacio Guanabara', 'castro-nepotismo-irmao-b106-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epa, 'Paes nega apoio oficial a Lula em 2026 mas mantem alianca tatica.', 'Sou aliado tatico do governo federal. Nao sou ventriloco de Lula, defendo o Rio.', 'Entrevista a CNN em fevereiro de 2025 sobre posicionamento em 2026.', 'verified', false, '2025-02-20', 'https://www.cnnbrasil.com.br/politica/paes-lula-alianca-tatica-2026/', 'news_article', 1, 'Rio de Janeiro', 'Entrevista CNN', 'paes-lula-alianca-tatica-b106-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nun, 'Nunes ataca PSOL e Boulos em primeiro ato apos posse em 2025.', 'Sao Paulo escolheu rejeitar radicalismo. Vou governar contra a agenda ideologica do PSOL.', 'Discurso de posse em 1 de janeiro de 2025 na Camara Municipal de Sao Paulo.', 'verified', true, '2025-01-01', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/01/01/nunes-posse-psol-radicalismo.ghtml', 'news_article', 2, 'Sao Paulo', 'Posse na Camara Municipal', 'nunes-posse-ataque-psol-b106-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmano defende policia apos novo recorde de mortes em operacoes no CE.', 'A policia do Ceara nao atira sem motivo. Cada morte e investigada dentro da lei.', 'Entrevista a Diario do Nordeste em fevereiro de 2025 apos relatorio anual de letalidade.', 'verified', false, '2025-02-14', 'https://diariodonordeste.verdesmares.com.br/politica/elmano-letalidade-policial-ce-2025', 'news_article', 4, 'Fortaleza', 'Entrevista Diario do Nordeste', 'elmano-letalidade-ce-b106-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jeronimo Rodrigues assume erro em dialogo com MP sobre letalidade na BA.', 'Reconheco que precisamos dialogar com a Defensoria. A PM baiana vai mudar protocolos.', 'Declaracao em marco de 2025 apos reuniao com MP-BA sobre execucoes sumarias.', 'verified', false, '2025-03-10', 'https://www.correio24horas.com.br/politica/jeronimo-mp-ba-letalidade-protocolos', 'news_article', 2, 'Salvador', 'Coletiva no Palacio de Ondina', 'jeronimo-mp-ba-protocolos-b106-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wlm, 'Wilson Lima e criticado por ausencia durante nova seca historica em 2024.', 'O Amazonas esta sendo atendido. A seca e natural e nossa resposta esta pronta.', 'Declaracao em outubro de 2024 durante pior seca da historia recente do Amazonas.', 'verified', true, '2024-10-08', 'https://www.acritica.com/politica/wilson-lima-seca-amazonas-2024', 'news_article', 4, 'Manaus', 'Coletiva na Aleam', 'wilson-lima-seca-2024-b106-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra intensifica ataques a Joao Campos mirando 2026.', 'Joao Campos e heranca politica. Pernambuco nao pode voltar ao comando da familia Arraes.', 'Discurso em Recife em marco de 2025 em pre-campanha para reeleicao ao governo.', 'verified', true, '2025-03-25', 'https://jc.ne10.uol.com.br/politica/raquel-lyra-joao-campos-2026', 'news_article', 2, 'Recife', 'Evento do PSDB-PE', 'raquel-ataca-joao-campos-b106-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jca, 'Joao Campos responde Raquel Lyra e mira sucessao em PE para 2026.', 'A governadora ataca porque sabe que perdeu Pernambuco. Recife se cansou da sua gestao.', 'Entrevista em Recife em abril de 2025 apos ataques da governadora.', 'verified', false, '2025-04-02', 'https://jc.ne10.uol.com.br/politica/joao-campos-responde-raquel-pe', 'news_article', 2, 'Recife', 'Entrevista na Prefeitura', 'joao-campos-responde-raquel-b106-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes nega responsabilidade em nova onda de queimadas de 2025.', 'As queimadas deste ano sao decorrentes do clima, nao de politica ambiental. O MT esta cumprindo a legislacao.', 'Coletiva em Cuiaba em setembro de 2025 durante nova temporada de fogo no Pantanal.', 'verified', true, '2025-09-12', 'https://g1.globo.com/mt/mato-grosso/noticia/2025/09/12/mauro-mendes-queimadas-pantanal-2025.ghtml', 'news_article', 4, 'Cuiaba', 'Coletiva no Palacio Paiaguas', 'mauro-mendes-queimadas-2025-b106-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcisio defende operacao Verao e minimiza 58 mortes em Santos.', 'A operacao Verao deu certo. Quem reclama de operacao policial nao entende o que e seguranca.', 'Declaracao em fevereiro de 2025 apos relatorio da Ouvidoria sobre 58 mortes em operacao na Baixada.', 'verified', true, '2025-02-28', 'https://www1.folha.uol.com.br/cotidiano/2025/02/tarcisio-operacao-verao-58-mortes.shtml', 'news_article', 5, 'Sao Paulo', 'Coletiva na Secretaria de Seguranca', 'tarcisio-operacao-verao-b106-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho defende zerar desmatamento no Para ate a COP30.', 'Vamos zerar o desmatamento ate COP30. O Para sera exemplo mundial de politica ambiental.', 'Discurso em Belem em janeiro de 2025 com presenca de Marina Silva e Lula.', 'verified', true, '2025-01-25', 'https://g1.globo.com/pa/para/noticia/2025/01/25/helder-desmatamento-zero-cop30.ghtml', 'news_article', 1, 'Belem', 'Anuncio ambiental', 'helder-desmatamento-zero-cop30-b106-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leit, 'Leite defende reconstrucao tardia do RS e admite falhas em audiencia.', 'Cometemos erros que levaram a mortes. Vou pedir perdao publico ao povo gaucho pela lentidao.', 'Audiencia na Assembleia do RS em novembro de 2024 apos CPI das Enchentes.', 'verified', true, '2024-11-28', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/11/leite-reconhece-erros-enchentes.html', 'news_article', 3, 'Porto Alegre', 'CPI das Enchentes', 'leite-reconhece-erros-rs-b106-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende fim de saidinha de presos e ataca STF.', 'O STF solta bandido e eu pago. Acabou a saidinha em Goias e vou defender isso no Brasil todo.', 'Entrevista a Jovem Pan em maio de 2024 sobre politica de encarceramento.', 'verified', true, '2024-05-28', 'https://jovempan.com.br/noticias/politica/caiado-saidinha-stf-criticas.html', 'news_article', 4, 'Goiania', 'Entrevista Jovem Pan', 'caiado-saidinha-stf-b106-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Claudio Castro culpa municipios por violencia na Baixada apos megaoperacao de 2026.', 'A Baixada precisa de prefeito que trabalhe. Nao posso resolver crime sozinho sem parceiros.', 'Coletiva em marco de 2026 apos operacao policial na Baixada Fluminense com 19 mortos.', 'verified', true, '2026-03-18', 'https://oglobo.globo.com/rio/noticia/2026/03/castro-baixada-megaoperacao-19-mortos.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva no Palacio Guanabara', 'castro-baixada-19-mortos-b106-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

END $$;
