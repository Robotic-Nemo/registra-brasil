-- Batch 138: LGBTQ+ rights and attacks 2023-2026 (Part 1)
DO $$
DECLARE
  v_eri UUID; v_sam UUID; v_tal UUID; v_jan UUID; v_orl UUID;
  v_chi UUID; v_fme UUID; v_tab UUID; v_gle UUID; v_ani UUID;
  v_son UUID; v_lul UUID; v_pad UUID; v_sil UUID; v_cid UUID;
  v_jom UUID; v_nik UUID; v_jan2 UUID; v_caz UUID; v_bia UUID;
  v_mfe UUID; v_dam UUID; v_mag UUID; v_sic UUID; v_jai UUID;
  v_edu UUID; v_fla UUID; v_car2 UUID; v_mic UUID; v_jul UUID;
  v_san UUID; v_fib UUID; v_gir UUID; v_cgi UUID; v_gpe UUID;
  v_mvh UUID; v_kim UUID; v_adv UUID; v_pmc UUID; v_bou UUID;
  v_mor UUID; v_clu UUID; v_bar UUID; v_zan UUID; v_fac UUID;
  v_din UUID; v_tof UUID;
  c_hom UUID; c_dis UUID; c_mis UUID; c_mac UUID; c_int UUID;
  c_vio UUID; c_abu UUID; c_des UUID; c_iti UUID; c_rac UUID;
BEGIN
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan2 FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_caz FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sic FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jul FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adv FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_pmc FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_clu FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';

  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_iti FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia na tribuna crescimento de ataques transfóbicos no Brasil.', 'O Brasil mata mais travestis e transexuais do que qualquer outro país do mundo. Isso é resultado direto do discurso de ódio que sai desta Casa.', 'Discurso na Câmara após divulgação do Dossiê ANTRA de assassinatos de 2023.', 'verified', true, '2024-01-29', 'https://antrabrasil.org/2024/01/29/dossie-antra-2023-assassinatos-pessoas-trans/', 'other', 2, 'Câmara dos Deputados', 'Dia da Visibilidade Trans', 'erika-dossie-antra-b138-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz discurso com peruca na tribuna da Câmara para atacar pessoas trans.', 'Hoje é o Dia da Mulher, mas hoje um homem veio aqui vestido de mulher para roubar o lugar das mulheres de verdade.', 'Nikolas sobe à tribuna com peruca no Dia Internacional da Mulher para atacar a existência de mulheres trans.', 'verified', true, '2023-03-08', 'https://www.camara.leg.br/noticias/946221-nikolas-ferreira-discurso-peruca-mulher-trans-8-marco', 'news_article', 5, 'Câmara dos Deputados', 'Sessão Dia da Mulher', 'nikolas-peruca-8marco-b138-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton responde ataque transfóbico de Nikolas e exige respeito.', 'Você não me cala. Travestis e mulheres trans existem, resistem e ocupam este Parlamento. Sua peruca não apaga a nossa história.', 'Resposta em plenário ao discurso de Nikolas Ferreira no Dia Internacional da Mulher.', 'verified', true, '2023-03-08', 'https://g1.globo.com/politica/noticia/2023/03/08/erika-hilton-responde-nikolas-ferreira-peruca.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Sessão Dia da Mulher', 'erika-resposta-nikolas-b138-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende projeto que proíbe ''ideologia de gênero'' em escolas.', 'Vamos tirar essa lixeira chamada ideologia de gênero das salas de aula brasileiras. As crianças precisam de proteção.', 'Discurso em culto em São Paulo defendendo PL contra educação de gênero.', 'verified', false, '2023-05-14', 'https://www.camara.leg.br/noticias/feliciano-pl-ideologia-genero-escolas-2023', 'news_article', 4, 'Igreja Assembleia de Deus', 'Culto evangélico', 'feliciano-ideologia-genero-b138-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona decreto ampliando política nacional LGBTQIA+.', 'O Brasil é o país que mais mata LGBTs no mundo. Nosso governo não vai aceitar isso. Vamos proteger quem sempre foi atacado.', 'Cerimônia no Planalto para sanção do decreto que retoma Conselho Nacional LGBTQIA+.', 'verified', true, '2023-05-17', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/decreto-conselho-lgbtqia-17052023', 'other', 1, 'Palácio do Planalto', 'Dia Internacional contra Homofobia', 'lula-decreto-lgbt-b138-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves afirma que crianças trans são resultado de ''doutrinação''.', 'Nenhuma criança nasce trans. Isso é doutrinação de adulto sobre criança, é abuso.', 'Entrevista a programa religioso na Record atacando infâncias trans.', 'verified', true, '2023-06-20', 'https://www12.senado.leg.br/radio/1/entrevista/2023/06/20/damares-criancas-trans-doutrinacao', 'news_article', 4, 'Rádio Senado', 'Entrevista religiosa', 'damares-criancas-trans-b138-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta PL para criminalizar discurso de ódio LGBTfóbico.', 'Discurso de ódio mata. Precisamos de lei que puna quem incita violência contra LGBTs nas redes e nas tribunas.', 'Apresentação do projeto em coletiva com ANTRA e ABGLT no Congresso.', 'verified', false, '2023-07-05', 'https://www.psol50.org.br/samia-bomfim-pl-discurso-odio-lgbt-2023/', 'other', 1, 'Câmara dos Deputados', 'Lançamento de PL', 'samia-pl-discurso-odio-b138-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz em evento que ''Brasil não pode virar Cuba nem virar reino gay''.', 'Não podemos deixar o Brasil virar uma ditadura gayzista onde criança aprende a ser homossexual na escola.', 'Discurso em evento do PL em Balneário Camboriú atacando governo Lula.', 'verified', true, '2023-08-12', 'https://www.poder360.com.br/eleicoes/bolsonaro-gayzismo-balneario-camboriu-2023/', 'news_article', 5, 'Balneário Camboriú', 'Ato do PL', 'bolsonaro-gayzismo-b138-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes equipara homofobia a racismo em decisão do STF.', 'Atos homofóbicos e transfóbicos configuram crime de racismo nos termos da Lei 7.716, conforme pacificado pelo STF em 2019.', 'Decisão monocrática negando habeas corpus a condenado por ofensa LGBTfóbica.', 'verified', false, '2023-09-10', 'https://www.conjur.com.br/2023-set-10/moraes-homofobia-racismo-hc-stf/', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-homofobia-racismo-b138-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caz, 'Carla Zambelli chama casamento homoafetivo de ''aberração'' em vídeo viral.', 'Casamento é entre homem e mulher. O resto é aberração que o STF inventou.', 'Vídeo postado no Instagram após decisão do CNJ reafirmando casamento igualitário.', 'verified', true, '2023-10-03', 'https://www.metropoles.com/brasil/zambelli-casamento-homoafetivo-aberracao-2023', 'news_article', 4, 'Redes sociais', 'Post no Instagram', 'zambelli-casamento-aberracao-b138-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida anuncia plano nacional de enfrentamento à LGBTfobia.', 'Governo federal não vai se omitir. Lançamos o plano nacional que articula educação, saúde, segurança e justiça contra a LGBTfobia.', 'Coletiva no MDH apresentando o Plano Nacional LGBTQIA+.', 'verified', true, '2023-11-21', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/2023/novembro/plano-nacional-lgbtqia', 'other', 1, 'MDH', 'Lançamento de plano nacional', 'silvio-plano-lgbt-b138-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro associa ''agenda gay'' a ''ataque à família cristã''.', 'Eles querem destruir a família brasileira com essa agenda gay imposta de cima para baixo.', 'Discurso em evento do PL Mulher em Brasília.', 'verified', false, '2023-11-28', 'https://www.gazetadopovo.com.br/politica/michelle-bolsonaro-agenda-gay-familia-2023/', 'news_article', 4, 'PL Mulher', 'Evento em Brasília', 'michelle-agenda-gay-b138-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende regulação de plataformas para conter LGBTfobia online.', 'Redes sociais não podem ser terra de ninguém. Discurso de ódio contra LGBTs se propaga sem freio e precisa ser responsabilizado.', 'Apresentação do relatório do PL 2630 destacando impacto em minorias.', 'verified', false, '2023-12-05', 'https://www.camara.leg.br/noticias/orlando-silva-pl-fake-news-lgbt-2023', 'news_article', 1, 'Câmara dos Deputados', 'Relatoria PL 2630', 'orlando-pl2630-lgbt-b138-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta diz em culto que ''Deus criou Adão e Eva, não Adão e Ivo''.', 'Deus não criou Adão e Ivo. Quem diz o contrário está contra a Palavra e contra a família.', 'Pregação em evento da Assembleia de Deus em Vitória transmitido ao vivo.', 'verified', false, '2024-01-14', 'https://www.gazetaonline.com.br/noticias/politica/2024/01/magno-malta-adao-eva-culto-1014999999.html', 'news_article', 4, 'Assembleia de Deus', 'Culto evangélico', 'magno-adao-eva-b138-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apresenta PL Trans+ para garantir cotas em concursos públicos.', 'Nossas vidas começam e terminam na prostituição porque nos negam educação e emprego. O PL Trans+ muda isso.', 'Lançamento do projeto com ANTRA e Grupo Dignidade no Congresso.', 'verified', true, '2024-01-29', 'https://grupodignidade.org.br/noticias/pl-trans-erika-hilton-cotas-2024/', 'other', 1, 'Câmara dos Deputados', 'Dia da Visibilidade Trans', 'erika-pl-trans-cotas-b138-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara articula frente evangélica contra adoção por casais gays.', 'Criança precisa de pai e mãe. Adoção homoafetiva é crueldade com a criança.', 'Reunião da Frente Parlamentar Evangélica para barrar decisões do STJ.', 'verified', false, '2024-02-15', 'https://www.camara.leg.br/noticias/silas-camara-frente-evangelica-adocao-gay-2024', 'news_article', 4, 'Câmara dos Deputados', 'Frente Parlamentar Evangélica', 'silas-adocao-gay-b138-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta vota contra criação de comissão especial sobre violência LGBTfóbica.', 'Não existe essa história de violência específica. Violência é violência e a pauta vitimista precisa parar.', 'Votação em comissão de direitos humanos rejeitando proposta de Erika Hilton.', 'verified', false, '2024-03-06', 'https://www.camara.leg.br/noticias/julia-zanatta-comissao-lgbt-violencia-2024', 'news_article', 3, 'Câmara dos Deputados', 'Comissão de Direitos Humanos', 'julia-comissao-lgbt-b138-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama banheiros neutros de ''insanidade ideológica''.', 'Banheiro unissex é insanidade. Mulher tem direito de ir ao banheiro sem ver homem de vestido ao lado.', 'Discurso no plenário contra resolução do MEC sobre uso de banheiros.', 'verified', true, '2024-03-20', 'https://www.camara.leg.br/noticias/bia-kicis-banheiro-neutro-mec-2024', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bia-banheiro-neutro-b138-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende política LGBTQIA+ como questão de direitos humanos.', 'Direitos LGBTQIA+ não são pauta de minoria, são pauta da democracia. Quem ataca hoje o gay, ataca amanhã qualquer um.', 'Entrevista a rádio CBN sobre plano nacional do governo.', 'verified', false, '2024-04-02', 'https://www.pt.org.br/gleisi-hoffmann-cbn-direitos-lgbt-2024/', 'news_article', 1, 'Rádio CBN', 'Entrevista política', 'gleisi-direitos-lgbt-b138-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro tenta derrubar resolução do CNJ sobre nome social.', 'O CNJ virou legislador e está impondo nome social a cartório. Vamos barrar no Senado.', 'Discurso no Senado anunciando PDL contra resolução do CNJ.', 'verified', false, '2024-04-10', 'https://www12.senado.leg.br/noticias/2024/04/flavio-cnj-nome-social-pdl', 'news_article', 3, 'Senado Federal', 'Anúncio de PDL', 'flavio-pdl-nome-social-b138-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia assassinato de mulher lésbica na Baixada Fluminense.', 'Mais uma lésbica assassinada no Rio. O Estado falha quando não protege quem ama fora da norma heterossexual.', 'Pronunciamento na Câmara pedindo apuração de lesbocídio em Nova Iguaçu.', 'verified', false, '2024-04-22', 'https://www.psol50.org.br/taliria-petrone-lesbocidio-baixada-2024/', 'other', 1, 'Câmara dos Deputados', 'Pronunciamento plenário', 'taliria-lesbocidio-b138-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro viaja para CPAC e compara ''lobby gay'' a ''marxismo cultural''.', 'O lobby gay no Brasil é braço do marxismo cultural. Quem não se adequa vira alvo de cancelamento.', 'Palestra no CPAC Hungria promovida por aliados do PL.', 'verified', true, '2024-05-02', 'https://www.poder360.com.br/internacional/eduardo-bolsonaro-cpac-lobby-gay-2024/', 'news_article', 4, 'CPAC Hungria', 'Conferência conservadora', 'eduardo-cpac-lobby-gay-b138-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajarara defende indígenas LGBTQIA+ em reunião da ONU.', 'Existimos em nossos territórios há milênios. Indígenas LGBTs são alvo de violência dupla e nosso governo vai protegê-los.', 'Fala no Foro Permanente para Questões Indígenas da ONU em Nova York.', 'verified', false, '2024-04-18', 'https://www.gov.br/povosindigenas/pt-br/assuntos/noticias/2024/04/sonia-onu-lgbt-indigenas', 'other', 1, 'ONU Nova York', 'Foro Permanente Indígena', 'sonia-onu-lgbt-b138-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão usa tribuna para atacar ''agenda LGBT nas Forças Armadas''.', 'Não vou aceitar agenda LGBT dentro do quartel. Militar não vira cobaia de ideologia.', 'Discurso contra portaria do Ministério da Defesa sobre inclusão.', 'verified', false, '2024-05-14', 'https://www.camara.leg.br/noticias/girao-agenda-lgbt-forcas-armadas-2024', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'girao-lgbt-forcas-armadas-b138-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula participa da Parada LGBT+ de São Paulo pela primeira vez como presidente.', 'Quero dizer a cada lésbica, gay, bissexual, travesti, transexual e não binária: vocês têm um presidente que respeita vocês.', 'Participação no trio elétrico da 28ª Parada do Orgulho LGBT+ na Avenida Paulista.', 'verified', true, '2024-06-02', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-parada-lgbt-sao-paulo', 'other', 1, 'Avenida Paulista', '28ª Parada LGBT+ SP', 'lula-parada-sp-b138-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira posta vídeo atacando Lula na Parada como ''vergonha nacional''.', 'Presidente em trio gay pedindo votos. É a vergonha nacional institucionalizada.', 'Vídeo publicado no X logo após Parada LGBT+ de São Paulo.', 'verified', true, '2024-06-02', 'https://www.metropoles.com/brasil/nikolas-lula-parada-vergonha-2024', 'news_article', 4, 'Redes sociais', 'Post no X', 'nikolas-lula-parada-b138-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso vota para barrar PL que limitaria nome social em documentos.', 'Dignidade da pessoa trans inclui ser chamada pelo nome que reconhece. Qualquer retrocesso fere a Constituição.', 'Voto em ADI no STF contra PL da Câmara que restringia nome social.', 'verified', false, '2024-06-18', 'https://www.jota.info/stf/barroso-nome-social-adi-2024', 'news_article', 1, 'STF', 'Julgamento de ADI', 'barroso-nome-social-adi-b138-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros articula obstrução contra PL anti-LGBTfobia no plenário.', 'Não vou permitir que criminalizem nosso direito de dizer que família é pai, mãe e filhos.', 'Articulação de obstrução a PL 672/2019 sobre criminalização de LGBTfobia.', 'verified', false, '2024-07-03', 'https://www.camara.leg.br/noticias/filipe-barros-obstrucao-pl-lgbt-2024', 'news_article', 3, 'Câmara dos Deputados', 'Obstrução parlamentar', 'filipe-obstrucao-lgbt-b138-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha anuncia ambulatórios trans em 10 capitais pelo SUS.', 'Saúde integral para pessoas trans é diretriz do SUS. Vamos abrir dez novos ambulatórios até o fim do ano.', 'Cerimônia no Ministério da Saúde anunciando expansão do Processo Transexualizador.', 'verified', false, '2024-07-15', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/07/padilha-ambulatorios-trans-sus', 'other', 1, 'Ministério da Saúde', 'Anúncio de política pública', 'padilha-ambulatorios-trans-b138-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal usa LGBTfobia em debate para atacar Boulos durante campanha em SP.', 'Boulos quer transformar São Paulo em caos progressista. Não deixaremos agenda LGBT radical sequestrar a cidade.', 'Fala em debate da Band entre candidatos à Prefeitura de São Paulo.', 'verified', true, '2024-08-08', 'https://www.band.com.br/eleicoes/2024/sp/debate-band-marcal-boulos-lgbt-2024', 'news_article', 4, 'TV Band', 'Debate para Prefeitura SP', 'marcal-debate-boulos-lgbt-b138-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos responde ataques LGBTfóbicos na campanha e defende diversidade.', 'Não vou me calar diante do ódio. São Paulo é cidade da diversidade e vai seguir sendo com a gente na Prefeitura.', 'Resposta em debate da Band após ataques de Marçal.', 'verified', true, '2024-08-08', 'https://www.psol50.org.br/boulos-debate-band-diversidade-2024/', 'news_article', 1, 'TV Band', 'Debate para Prefeitura SP', 'boulos-debate-diversidade-b138-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carlos Bolsonaro publica meme homofóbico contra vereador do PSOL.', 'Olha quem quer dar opinião sobre família. Me poupe desse circo de vestidos.', 'Post no X com meme ofensivo a vereador trans do PSOL-RJ.', 'verified', false, '2024-08-20', 'https://www.metropoles.com/brasil/carlos-bolsonaro-meme-psol-trans-2024', 'news_article', 4, 'Redes sociais', 'Post no X', 'carlos-meme-psol-b138-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna defende cotas LGBTQIA+ no serviço público do RS.', 'Estado precisa reparar séculos de exclusão. Cotas para LGBTs no Rio Grande do Sul são política de sobrevivência.', 'Defesa de PL na Assembleia do RS em debate sobre políticas afirmativas.', 'verified', false, '2024-09-01', 'https://www.psol50.org.br/melchionna-cotas-lgbt-rs-2024/', 'other', 1, 'AL-RS', 'Debate sobre PL', 'melchionna-cotas-rs-b138-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto posta vídeo chamando política LGBT de ''doutrinação de Estado''.', 'Governo Lula está doutrinando nossos filhos na escola com ideologia LGBT. Isso é crime.', 'Live no Facebook comentando cartilha do MEC sobre diversidade.', 'verified', false, '2024-09-12', 'https://www.gazetadopovo.com.br/politica/cabo-gilberto-mec-cartilha-lgbt-2024/', 'news_article', 4, 'Redes sociais', 'Live Facebook', 'cabo-gilberto-mec-b138-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_clu, 'Cármen Lúcia relata ação que garante uniões estáveis para casais homoafetivos em cartório.', 'A Constituição protege a família em todas as suas formas. Cartório não pode recusar união estável homoafetiva.', 'Relatoria de ADI no STF contra provimentos estaduais restritivos.', 'verified', false, '2024-09-25', 'https://www.conjur.com.br/2024-set-25/carmen-lucia-uniao-estavel-homoafetiva-adi/', 'news_article', 1, 'STF', 'Julgamento de ADI', 'carmen-uniao-estavel-b138-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson compara Parada LGBT a ''desfile de promiscuidade''.', 'Criança não precisa ver desfile de promiscuidade. Parada gay é apologia que não quero ver na minha cidade.', 'Discurso na tribuna criticando gastos de prefeitura com Parada LGBT.', 'verified', false, '2024-06-10', 'https://www.camara.leg.br/noticias/sanderson-parada-lgbt-promiscuidade-2024', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'sanderson-parada-b138-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Jorge Messias defende na AGU recurso contra decisão anti-LGBT de juiz federal.', 'AGU não aceita decisão que viola jurisprudência do STF sobre direitos LGBTQIA+. Vamos recorrer imediatamente.', 'Nota da AGU contra sentença do TRF4 que restringia reconhecimento civil de nome social.', 'verified', false, '2024-10-03', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2024/10/agu-nome-social-trf4', 'other', 1, 'AGU', 'Nota institucional', 'messias-trf4-nome-social-b138-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral apresenta PL sobre combate ao bullying LGBTfóbico nas escolas.', 'A escola tem que ser ambiente seguro para toda criança, inclusive a que descobre ser gay, lésbica ou trans.', 'Apresentação do projeto em audiência pública com ABGLT.', 'verified', false, '2024-10-17', 'https://www.camara.leg.br/noticias/tabata-amaral-pl-bullying-lgbt-escolas-2024', 'other', 1, 'Câmara dos Deputados', 'Audiência pública', 'tabata-pl-bullying-escolas-b138-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro em live chama política LGBT de Lula de ''diabólica''.', 'Lula tem um projeto diabólico de impor ideologia de gênero. Vamos derrubar isso em 2026.', 'Live semanal do ex-presidente atacando políticas do governo federal.', 'verified', true, '2024-10-24', 'https://www.poder360.com.br/governo/bolsonaro-live-lula-lgbt-diabolica-2024/', 'news_article', 4, 'Redes sociais', 'Live semanal', 'bolsonaro-live-diabolica-b138-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves articula política integrada para mulheres lésbicas e bissexuais.', 'Mulheres lésbicas e bissexuais são alvo de violência específica e o Estado brasileiro vai olhar para elas.', 'Lançamento da política integrada no Ministério das Mulheres.', 'verified', false, '2024-11-05', 'https://www.gov.br/mulheres/pt-br/assuntos/noticias/2024/11/cida-politica-lesbicas-bi', 'other', 1, 'Ministério das Mulheres', 'Lançamento de política', 'cida-politica-lesbicas-b138-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto compara drag queens em escolas a ''abuso infantil''.', 'Trazer drag queen para conversar com criança é abuso psicológico. Pais precisam reagir.', 'Vídeo em live contra projeto cultural em escola de São Paulo.', 'verified', false, '2024-11-12', 'https://www.metropoles.com/brasil/guiga-peixoto-drag-escola-abuso-2024', 'news_article', 5, 'Redes sociais', 'Live', 'guiga-drag-escola-b138-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende políticas públicas para idosos LGBTQIA+ abandonados.', 'Envelhecer sendo gay ou trans no Brasil é ser invisível. Precisamos de casas de acolhimento com recorte LGBT.', 'Discurso na Câmara dos Vereadores do Rio apresentando projeto.', 'verified', false, '2024-11-20', 'https://www.camara.rj.gov.br/noticias/chico-alencar-idosos-lgbt-acolhimento-2024', 'other', 1, 'Câmara Municipal RJ', 'Sessão plenária', 'chico-idosos-lgbt-b138-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende liberdade de expressão mesmo em críticas à ''pauta LGBT''.', 'Posso discordar da pauta LGBT sem virar criminosa. Criminalizar opinião é autoritarismo.', 'Discurso no plenário defendendo redução de tipificação em PL sobre LGBTfobia.', 'verified', false, '2024-12-03', 'https://www.camara.leg.br/noticias/adriana-ventura-liberdade-pauta-lgbt-2024', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'adriana-liberdade-lgbt-b138-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende que ''transição de gênero'' seja crime para menores.', 'Nenhum bisturi em menor de 18 anos. Bloqueio hormonal em criança é crime e precisa ser tipificado.', 'Defesa de PL no Senado inspirado em legislação de estados dos EUA.', 'verified', true, '2024-12-10', 'https://www12.senado.leg.br/noticias/materias/2024/12/10/damares-pl-transicao-menores', 'news_article', 4, 'Senado Federal', 'Defesa de PL', 'damares-pl-transicao-menores-b138-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin vota para criminalizar discurso de ódio contra LGBT como racismo qualificado.', 'Discurso que incita violência contra homossexuais e transgêneros configura modalidade de racismo, sujeito à mesma pena.', 'Voto em ARE no STF sobre postagens em redes sociais.', 'verified', false, '2024-12-18', 'https://www.conjur.com.br/2024-dez-18/fachin-discurso-odio-lgbt-racismo-are/', 'news_article', 1, 'STF', 'Julgamento de ARE', 'fachin-lgbt-racismo-are-b138-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco articula política para juventudes negras LGBTQIA+.', 'Jovem negro LGBT é o mais vulnerável da sociedade brasileira. Precisa de política pública integrada e o governo vai entregar.', 'Lançamento de programa conjunto com MDH e Ministério das Mulheres.', 'verified', false, '2025-01-15', 'https://www.gov.br/igualdaderacial/pt-br/assuntos/noticias/2025/01/anielle-juventude-negra-lgbt', 'other', 1, 'MIR', 'Lançamento de programa', 'anielle-juventude-negra-lgbt-b138-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia recorde de assassinatos de trans no Dossiê ANTRA 2024.', 'Mais uma vez o Brasil lidera. Em 2024 foram registrados 122 assassinatos de pessoas trans. Cada número é um nome, uma vida.', 'Lançamento do Dossiê ANTRA 2024 com balanço anual.', 'verified', true, '2025-01-29', 'https://antrabrasil.org/2025/01/29/dossie-antra-2024-assassinatos/', 'other', 2, 'ANTRA', 'Lançamento do Dossiê 2024', 'erika-dossie-antra-2024-b138-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri vota contra cota para pessoas trans em concurso municipal.', 'Sou contra qualquer cota por identidade de gênero. Concurso tem que ser mérito puro.', 'Voto na Câmara Municipal de SP contra PL de vereadora trans.', 'verified', false, '2025-02-05', 'https://www.saopaulo.sp.leg.br/blog/kim-kataguiri-cota-trans-concurso-2025', 'news_article', 3, 'Câmara Municipal SP', 'Votação de PL', 'kim-cota-trans-concurso-b138-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende política de saúde integral para mulheres lésbicas.', 'Mulher lésbica também precisa de ginecologista preparado. O SUS tem que acolher sem preconceito.', 'Audiência pública sobre saúde da mulher na Câmara.', 'verified', false, '2025-02-14', 'https://www.camara.leg.br/noticias/jandira-saude-mulher-lesbica-sus-2025', 'other', 1, 'Câmara dos Deputados', 'Audiência pública', 'jandira-saude-lesbica-b138-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano celebra derrota de PL anti-homofobia em votação simbólica.', 'Glória a Deus. Não passou o PL do coitadismo gay. Vamos seguir resistindo a essa pauta.', 'Post no Instagram após rejeição em comissão de projeto relatado por Sâmia Bomfim.', 'verified', false, '2025-03-04', 'https://www.camara.leg.br/noticias/feliciano-derrota-pl-lgbt-2025', 'news_article', 4, 'Redes sociais', 'Post no Instagram', 'feliciano-derrota-pl-lgbt-b138-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim responde a ataques e defende PL contra LGBTfobia.', 'Quem comemora a morte de projeto contra LGBTfobia está comemorando a continuidade do assassinato. A luta não para.', 'Entrevista ao Brasil de Fato após rejeição do PL.', 'verified', false, '2025-03-05', 'https://www.brasildefato.com.br/2025/03/05/samia-lgbtfobia-pl-rejeicao/', 'news_article', 1, 'Brasil de Fato', 'Entrevista', 'samia-resposta-pl-lgbt-b138-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan2, 'André Janones polemiza com piada LGBTfóbica em live e é criticado por aliados.', 'Calma gente, era só brincadeira. Vocês querem virar o bobo da vila por causa de piada?', 'Recuo após piada homofóbica em live do deputado.', 'verified', false, '2025-03-11', 'https://www.metropoles.com/brasil/andre-janones-piada-lgbt-live-2025', 'news_article', 3, 'Redes sociais', 'Live', 'janones-piada-lgbt-b138-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin vota para reconhecer casamento homoafetivo em tribunais religiosos.', 'Justiça comum não admite recusa religiosa para negar direito civil reconhecido pela Constituição.', 'Voto em ADI contra provimentos de varas de família.', 'verified', false, '2025-03-25', 'https://www.conjur.com.br/2025-mar-25/zanin-casamento-homoafetivo-varas-familia/', 'news_article', 1, 'STF', 'Julgamento de ADI', 'zanin-casamento-varas-b138-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ironiza cotas trans em concurso público.', 'Virou concurso de identidade. Enquanto isso o Brasil afunda em desigualdade real.', 'Discurso na Câmara contra resolução do ENAM sobre cotas trans.', 'verified', false, '2025-04-03', 'https://www.camara.leg.br/noticias/marcel-van-hattem-enam-cotas-trans-2025', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'marcel-enam-cotas-b138-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota contra lei estadual que proibia materiais sobre diversidade nas escolas.', 'Lei estadual não pode censurar conteúdo pedagógico que trata de diversidade. É inconstitucional desde a origem.', 'Voto em ADI contra legislação do Ceará sobre material didático.', 'verified', false, '2025-04-15', 'https://www.jota.info/stf/dino-lei-ceara-diversidade-escolas-2025', 'news_article', 1, 'STF', 'Julgamento de ADI', 'dino-lei-ceara-b138-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta ataca ministra Anielle por programa para juventude LGBT negra.', 'Ministra quer dividir o Brasil por raça e sexualidade. Programa racial LGBT é racismo ao contrário.', 'Post no X em resposta ao programa lançado pelo MIR.', 'verified', false, '2025-04-22', 'https://www.metropoles.com/brasil/julia-zanatta-anielle-programa-lgbt-2025', 'news_article', 4, 'Redes sociais', 'Post no X', 'julia-ataca-anielle-b138-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida anuncia disque 100 especializado para denúncias de LGBTfobia.', 'A partir de hoje o Disque 100 tem módulo específico para violência LGBTfóbica, com atendimento especializado.', 'Coletiva no MDH apresentando nova estrutura do Disque Direitos Humanos.', 'verified', false, '2025-05-05', 'https://www.gov.br/mdh/pt-br/assuntos/noticias/2025/05/disque-100-lgbt', 'other', 1, 'MDH', 'Lançamento de serviço', 'silvio-disque100-lgbt-b138-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro pede CPI contra gastos do governo com ''pauta LGBT''.', 'Quero CPI para investigar onde está o dinheiro que o governo joga em pauta LGBT enquanto povo passa fome.', 'Anúncio em coletiva no Senado pedindo assinaturas para CPI.', 'verified', false, '2025-05-14', 'https://www12.senado.leg.br/noticias/2025/05/flavio-cpi-pauta-lgbt', 'news_article', 3, 'Senado Federal', 'Pedido de CPI', 'flavio-cpi-lgbt-b138-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula condena violência contra trans em Dia contra Homofobia no Planalto.', 'Enquanto eu for presidente, travesti, transexual, gay e lésbica vão ter este palácio como casa.', 'Cerimônia no Planalto pelo 17 de maio, Dia Internacional contra a LGBTfobia.', 'verified', true, '2025-05-17', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-17-maio-lgbt', 'other', 1, 'Palácio do Planalto', 'Dia contra Homofobia', 'lula-17-maio-2025-b138-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca ministro Silvio Almeida com insinuações homofóbicas.', 'Ministro virou garoto-propaganda da agenda gay internacional. Precisamos de Estado laico, não missionário LGBT.', 'Vídeo no YouTube após evento de Silvio na ONU.', 'verified', true, '2025-05-20', 'https://www.metropoles.com/brasil/nikolas-ataca-silvio-almeida-lgbt-2025', 'news_article', 4, 'Redes sociais', 'Vídeo YouTube', 'nikolas-silvio-lgbt-b138-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal usa LGBTfobia em prévia presidencial do PL.', 'Não vamos permitir que agenda LGBT radical entre nas escolas se eu for presidente.', 'Discurso em evento do PL em Goiânia medindo apoio para 2026.', 'verified', false, '2025-06-01', 'https://www.poder360.com.br/eleicoes/marcal-pl-goiania-lgbt-2025/', 'news_article', 4, 'PL Goiás', 'Prévia presidencial', 'marcal-pl-goiania-b138-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos participa da Parada LGBT+ de SP como deputado federal.', 'A direita ataca porque tem medo da nossa força. A cada ataque, mais fortes ficamos nesta avenida.', 'Participação em trio da Parada LGBT+ de SP 2025.', 'verified', false, '2025-06-08', 'https://www.psol50.org.br/boulos-parada-lgbt-sp-2025/', 'news_article', 1, 'Avenida Paulista', 'Parada LGBT+ SP 2025', 'boulos-parada-2025-b138-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que ''agenda LGBT é arma de guerra cultural''.', 'Agenda LGBT é arma de guerra cultural da esquerda global contra os cristãos.', 'Discurso em conferência de lideranças conservadoras no Paraguai.', 'verified', false, '2025-06-15', 'https://www.poder360.com.br/internacional/eduardo-bolsonaro-paraguai-lgbt-guerra-cultural-2025/', 'news_article', 4, 'Conferência Paraguai', 'Encontro conservador', 'eduardo-paraguai-guerra-cultural-b138-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tof, 'Dias Toffoli vota para manter penas para LGBTfobia em redes sociais.', 'A liberdade de expressão não protege quem usa plataforma digital para incitar violência contra grupo vulnerável.', 'Voto em julgamento do STF sobre criminalização.', 'verified', false, '2025-06-25', 'https://www.conjur.com.br/2025-jun-25/toffoli-lgbtfobia-redes-sociais-stf/', 'news_article', 1, 'STF', 'Julgamento penal', 'toffoli-lgbt-redes-b138-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton é ameaçada de morte após discurso pró-LGBT e pede proteção.', 'Recebi mais uma ameaça de morte. Continuarei usando esta tribuna para falar de quem vive ameaçada todos os dias.', 'Denúncia em plenário após série de ameaças por e-mail e redes.', 'verified', true, '2025-07-02', 'https://www.camara.leg.br/noticias/erika-hilton-ameacas-morte-2025', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento plenário', 'erika-ameacas-2025-b138-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_iti, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caz, 'Carla Zambelli em exílio faz live atacando ''ditadura gay'' do STF.', 'STF virou tribunal da ditadura gay. Quem discorda vai para cadeia.', 'Live a partir de Roma após fuga para escapar de condenação.', 'verified', true, '2025-07-10', 'https://www.poder360.com.br/justica/zambelli-roma-live-stf-ditadura-gay-2025/', 'news_article', 4, 'Redes sociais', 'Live exílio Roma', 'zambelli-roma-ditadura-gay-b138-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone articula frente parlamentar contra lesbocídio.', 'Lesbocídio existe e o Congresso tem a obrigação de enfrentar. Estamos lançando a frente parlamentar.', 'Lançamento de frente parlamentar com vereadoras e deputadas lésbicas.', 'verified', false, '2025-07-18', 'https://www.camara.leg.br/noticias/taliria-petrone-frente-lesbocidio-2025', 'other', 1, 'Câmara dos Deputados', 'Lançamento frente', 'taliria-frente-lesbocidio-b138-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ataca Disque 100 LGBT como ''delação premiada ideológica''.', 'Disque 100 LGBT é delação premiada ideológica. Vão denunciar pastor por sermão?', 'Discurso na Câmara contra nova estrutura do Disque 100.', 'verified', false, '2025-07-22', 'https://www.camara.leg.br/noticias/bia-kicis-disque-100-lgbt-2025', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bia-disque-100-b138-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva defende cultura LGBT em edital da Lei Paulo Gustavo.', 'A Lei Paulo Gustavo é herança cultural. Projetos LGBTs fortalecem nossa diversidade e geram emprego no audiovisual.', 'Defesa em entrevista após lançamento de edital com cota LGBT.', 'verified', false, '2025-08-01', 'https://www.gov.br/cultura/pt-br/assuntos/noticias/2025/08/orlando-silva-cota-lgbt-paulo-gustavo', 'other', 1, 'Ministério da Cultura', 'Edital cultural', 'orlando-cota-paulo-gustavo-b138-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama Lei Paulo Gustavo com cota LGBT de ''farra do dinheiro gay''.', 'Dinheiro público agora financia farra gay no audiovisual. Cristão sustentando pornografia com imposto.', 'Discurso no Senado contra cota LGBT em edital.', 'verified', false, '2025-08-05', 'https://www12.senado.leg.br/noticias/2025/08/magno-malta-paulo-gustavo-lgbt', 'news_article', 4, 'Senado Federal', 'Sessão plenária', 'magno-paulo-gustavo-b138-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silvio Almeida defende política LGBT em audiência pública no Senado.', 'A política pública LGBTQIA+ é obrigação constitucional. Não é favor, é direito.', 'Audiência na Comissão de Direitos Humanos do Senado.', 'verified', false, '2025-08-12', 'https://www12.senado.leg.br/noticias/2025/08/silvio-almeida-cdh-senado-lgbt', 'other', 1, 'Senado Federal', 'Audiência pública CDH', 'silvio-cdh-senado-b138-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara defende PL para proibir bandeira LGBT em prédios públicos.', 'Prédio público não é ponto de militância. Bandeira LGBT em escola, quartel, órgão público é proibida.', 'Discurso defendendo PL 4208/2024 em plenário.', 'verified', false, '2025-08-20', 'https://www.camara.leg.br/noticias/silas-camara-pl-bandeira-lgbt-predios-2025', 'news_article', 4, 'Câmara dos Deputados', 'Defesa de PL', 'silas-bandeira-lgbt-b138-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna denuncia aumento de agressões trans em Porto Alegre.', 'Enquanto o Congresso debate bandeira, travestis são assassinadas no centro de Porto Alegre. O foco está errado.', 'Pronunciamento após assassinato de travesti em PoA.', 'verified', false, '2025-08-28', 'https://www.psol50.org.br/melchionna-agressao-trans-poa-2025/', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'melchionna-agressao-poa-b138-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro declara que em 2027 ''vai revogar todos os decretos LGBT'' se eleger aliado.', 'Vamos revogar todos os decretos LGBT desse governo. Família brasileira vai respirar de novo.', 'Discurso em convenção estadual do PL em Minas Gerais.', 'verified', true, '2025-09-05', 'https://www.poder360.com.br/eleicoes/bolsonaro-pl-mg-revogar-decretos-lgbt-2025/', 'news_article', 4, 'PL Minas Gerais', 'Convenção estadual', 'bolsonaro-revogar-decretos-b138-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann rebate Bolsonaro e defende direitos LGBT como conquista.', 'Direitos LGBTs são conquistas democráticas. Bolsonaro diz que vai revogar? Vamos eleger quem vai expandi-los.', 'Coletiva no PT após declaração de Bolsonaro.', 'verified', false, '2025-09-06', 'https://www.pt.org.br/gleisi-rebate-bolsonaro-lgbt-2025/', 'news_article', 1, 'Sede PT', 'Coletiva de imprensa', 'gleisi-rebate-bolsonaro-b138-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes suspende PL estadual paulista contra ''ideologia de gênero''.', 'Legislador estadual não pode invadir competência federal nem proibir conteúdo pedagógico.', 'Decisão monocrática em ADI contra lei da ALESP.', 'verified', false, '2025-09-15', 'https://www.conjur.com.br/2025-set-15/moraes-suspende-lei-alesp-ideologia-genero/', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-alesp-ideologia-b138-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira articula CPI das ONGs LGBT recebedoras de recursos públicos.', 'Vamos abrir CPI das ONGs gays que recebem milhões do governo para fazer militância. Dinheiro público não é bandeira do arco-íris.', 'Protocolo de requerimento na Câmara.', 'verified', false, '2025-09-22', 'https://www.camara.leg.br/noticias/nikolas-cpi-ongs-lgbt-2025', 'news_article', 3, 'Câmara dos Deputados', 'Pedido de CPI', 'nikolas-cpi-ongs-b138-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali articula bancada feminina em defesa de PL contra transfobia.', 'Bancada feminina inteira assina. Defender trans é defender mulheres, defender democracia.', 'Coletiva da bancada feminina da Câmara.', 'verified', false, '2025-10-01', 'https://www.camara.leg.br/noticias/bancada-feminina-pl-transfobia-2025', 'other', 1, 'Câmara dos Deputados', 'Coletiva bancada feminina', 'jandira-bancada-transfobia-b138-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares convoca ato em Brasília contra ''agenda arco-íris'' do governo.', 'Famílias vão às ruas contra a agenda arco-íris. Brasília vai ouvir a voz do povo de bem.', 'Convocação em live para ato em frente ao Congresso.', 'verified', false, '2025-10-10', 'https://www12.senado.leg.br/noticias/2025/10/damares-ato-agenda-arco-iris', 'news_article', 4, 'Redes sociais', 'Convocação de ato', 'damares-ato-arco-iris-b138-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton responde a convocação de Damares em vídeo viral.', 'Querem que nossas famílias desapareçam, que nossos filhos morram. A gente não vai desaparecer, não.', 'Vídeo nas redes sociais respondendo mobilização conservadora.', 'verified', true, '2025-10-11', 'https://www.metropoles.com/brasil/erika-hilton-resposta-damares-ato-2025', 'news_article', 1, 'Redes sociais', 'Vídeo resposta', 'erika-resposta-damares-b138-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson participa de ato contra agenda LGBT em Brasília.', 'Bolsonaristas de verdade não abandonam a família. Vamos derrotar a agenda LGBT do Planalto.', 'Discurso em ato em frente ao Congresso organizado pela direita.', 'verified', false, '2025-10-18', 'https://www.camara.leg.br/noticias/sanderson-ato-agenda-lgbt-brasilia-2025', 'news_article', 4, 'Esplanada dos Ministérios', 'Ato pró-família', 'sanderson-ato-brasilia-b138-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia expansão do Processo Transexualizador para mais 20 municípios.', 'Toda pessoa trans tem direito à saúde. Vamos chegar a 50 municípios com atendimento especializado até 2026.', 'Coletiva em São Paulo durante visita a ambulatório-piloto.', 'verified', false, '2025-10-25', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/10/padilha-expansao-processo-transexualizador', 'other', 1, 'Ministério da Saúde', 'Anúncio de expansão', 'padilha-expansao-trans-b138-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Carlos Bolsonaro debocha de ampliação do SUS para pessoas trans.', 'Dinheiro do SUS para bisturi trans enquanto criança morre na fila do câncer. Inversão moral total.', 'Post no X com meme associando ampliação a filas da oncologia.', 'verified', false, '2025-10-27', 'https://www.metropoles.com/brasil/carlos-bolsonaro-sus-trans-bisturi-2025', 'news_article', 4, 'Redes sociais', 'Post no X', 'carlos-sus-trans-b138-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso elogia avanços LGBT como presidente do STF em aula magna.', 'O Brasil avançou como poucos países na proteção de direitos LGBT, graças a um Judiciário que se posicionou.', 'Aula magna na UERJ sobre três décadas de constituição.', 'verified', false, '2025-11-04', 'https://www.jota.info/stf/barroso-avancos-lgbt-aula-magna-uerj-2025', 'news_article', 1, 'UERJ', 'Aula magna', 'barroso-avancos-lgbt-b138-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros chama Barroso de ''legislador arco-íris''.', 'Barroso acha que é legislador arco-íris. O Supremo não é parlamento gay.', 'Vídeo nas redes sociais após fala de Barroso na UERJ.', 'verified', false, '2025-11-05', 'https://www.gazetadopovo.com.br/politica/filipe-barros-barroso-legislador-arco-iris-2025/', 'news_article', 4, 'Redes sociais', 'Vídeo no Instagram', 'filipe-barroso-arco-iris-b138-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende política municipal LGBT no Rio.', 'Rio precisa ser referência em direitos LGBT, não em violência. Vamos aprovar o centro municipal de cidadania LGBT.', 'Defesa de PL na Câmara Municipal do Rio.', 'verified', false, '2025-11-12', 'https://www.camara.rj.gov.br/noticias/chico-alencar-centro-municipal-lgbt-2025', 'other', 1, 'Câmara Municipal RJ', 'Sessão plenária', 'chico-centro-lgbt-rio-b138-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende cota LGBT em programas de qualificação profissional.', 'Qualificação profissional com cota LGBT reduz desemprego e violência. É política de sobrevivência.', 'Audiência pública sobre juventude e empregabilidade.', 'verified', false, '2025-11-20', 'https://www.camara.leg.br/noticias/tabata-cota-lgbt-qualificacao-2025', 'other', 1, 'Câmara dos Deputados', 'Audiência pública', 'tabata-cota-qualificacao-b138-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jul, 'Julia Zanatta posta vídeo viralizando com ataque a professora lésbica.', 'Professora virou militante LGBT em sala de aula. Pais precisam reagir, tirar da escola e denunciar.', 'Post no X com vídeo recortado de professora em Santa Catarina.', 'verified', true, '2025-11-28', 'https://www.metropoles.com/brasil/julia-zanatta-professora-lesbica-sc-2025', 'news_article', 5, 'Redes sociais', 'Post no X', 'julia-professora-lesbica-b138-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_iti, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara cita pesquisa sobre indígenas LGBT em reunião no MPI.', 'Indígenas LGBTs dos nossos povos precisam de proteção territorial e proteção contra violência. Vamos agir em conjunto com o MDH.', 'Reunião com comitiva de lideranças indígenas LGBT.', 'verified', false, '2025-12-04', 'https://www.gov.br/povosindigenas/pt-br/assuntos/noticias/2025/12/sonia-indigenas-lgbt-mdh', 'other', 1, 'MPI', 'Reunião interministerial', 'sonia-indigenas-lgbt-mdh-b138-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta apoia PL que proíbe pessoas trans em esportes femininos.', 'Homem competindo com mulher é trapaça. O esporte feminino precisa ser protegido dessa invasão.', 'Entrevista à Jovem Pan sobre proposta no Senado.', 'verified', false, '2025-12-10', 'https://www.jovempan.com.br/noticias/politica/magno-malta-trans-esporte-feminino-2025.html', 'news_article', 4, 'Jovem Pan', 'Entrevista política', 'magno-trans-esporte-b138-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança relatório sobre violência contra jovens LGBT negros.', 'Jovem negro gay morre duas vezes: de racismo e de LGBTfobia. O relatório mostra a urgência.', 'Apresentação do relatório no MIR em dezembro.', 'verified', false, '2025-12-17', 'https://www.gov.br/igualdaderacial/pt-br/assuntos/noticias/2025/12/anielle-relatorio-lgbt-negros', 'other', 1, 'MIR', 'Lançamento de relatório', 'anielle-relatorio-lgbt-negros-b138-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Jorge Messias articula ação da AGU contra decretos municipais anti-LGBT.', 'AGU vai impugnar decretos municipais que proíbem temas LGBT em escolas. São inconstitucionais.', 'Nota da AGU sobre ação em prefeituras do interior de MG e GO.', 'verified', false, '2026-01-08', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/2026/01/messias-decretos-municipais-lgbt', 'other', 1, 'AGU', 'Nota institucional', 'messias-decretos-mg-go-b138-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ironiza aula inclusiva como ''militância com giz''.', 'Escola virou palco de militância com giz. Novo PL vai garantir a neutralidade em sala de aula.', 'Defesa de PL em plenário contra ''doutrinação'' ideológica.', 'verified', false, '2026-01-15', 'https://www.camara.leg.br/noticias/marcel-van-hattem-militancia-giz-2026', 'news_article', 3, 'Câmara dos Deputados', 'Defesa de PL', 'marcel-militancia-giz-b138-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton lança pré-candidatura ao Senado com pauta LGBT como central.', 'Preciso do Senado para dizer não ao retrocesso. Minha pré-candidatura é de todo mundo que não quer voltar ao armário.', 'Ato em São Paulo com lideranças LGBTQIA+ e do movimento negro.', 'verified', true, '2026-01-29', 'https://www.psol50.org.br/erika-hilton-pre-candidatura-senado-2026/', 'other', 1, 'São Paulo', 'Lançamento de pré-candidatura', 'erika-senado-pre-2026-b138-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Erika Hilton de ''aberração no Congresso'' em live.', 'Essa aberração no Congresso é prova do que virou o Brasil. Família de verdade precisa reagir em 2026.', 'Live no YouTube com aliados após lançamento de Erika.', 'verified', true, '2026-01-30', 'https://www.poder360.com.br/governo/bolsonaro-erika-hilton-aberracao-live-2026/', 'news_article', 5, 'Redes sociais', 'Live no YouTube', 'bolsonaro-erika-aberracao-b138-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina investigação de Bolsonaro por ataque a Erika Hilton.', 'A fala configura potencial crime de LGBTfobia. Determino abertura de inquérito para apuração.', 'Decisão monocrática no STF instaurando inquérito policial.', 'verified', true, '2026-02-03', 'https://www.conjur.com.br/2026-fev-03/moraes-inquerito-bolsonaro-erika-hilton/', 'news_article', 2, 'STF', 'Decisão monocrática', 'moraes-inquerito-erika-b138-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula em café com LGBTs no Planalto promete ampliar direitos.', 'Nosso governo vai ampliar, não reduzir. Em 2026 quero mais ministérios, mais políticas, mais proteção.', 'Café da manhã com lideranças LGBTQIA+ em fevereiro.', 'verified', false, '2026-02-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2026/lula-cafe-lgbt-planalto', 'other', 1, 'Palácio do Planalto', 'Café da manhã LGBT', 'lula-cafe-lgbt-2026-b138-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira anuncia pré-candidatura ao governo de MG com pauta anti-LGBT.', 'Minas vai respirar família. Minha pré-candidatura é contra a agenda arco-íris que tentam impor.', 'Ato em Belo Horizonte lançando pré-candidatura ao governo mineiro.', 'verified', true, '2026-02-20', 'https://www.poder360.com.br/eleicoes/nikolas-pre-candidatura-governo-mg-2026/', 'news_article', 4, 'Belo Horizonte', 'Lançamento pré-candidatura MG', 'nikolas-mg-pre-2026-b138-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin reafirma na abertura do ano judiciário proteção a LGBTs.', 'Nenhum retrocesso será tolerado. O Judiciário é guardião das minorias e seguirá guardando.', 'Discurso na abertura do ano judiciário do STF.', 'verified', false, '2026-02-02', 'https://www.jota.info/stf/fachin-abertura-ano-judiciario-lgbt-2026', 'news_article', 1, 'STF', 'Abertura ano judiciário', 'fachin-abertura-2026-b138-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton em audiência na OEA denuncia Brasil como ''campeão de mortes de trans''.', 'Levo à OEA os números do Brasil: o país que mais mata travestis e transexuais no mundo há 16 anos seguidos.', 'Audiência temática na Comissão Interamericana de Direitos Humanos.', 'verified', true, '2026-03-05', 'https://www.oas.org/pt/cidh/prensa/notas/2026/03/erika-hilton-brasil-trans.asp', 'other', 2, 'OEA Washington', 'Audiência temática CIDH', 'erika-cidh-oea-b138-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

END $$;
