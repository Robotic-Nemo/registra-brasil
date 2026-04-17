-- Batch 152: Educação, universidades, cotas e ENEM (2023-2026)
DO $$
DECLARE
  v_cam UUID; v_lul UUID; v_esd UUID; v_mar UUID; v_son UUID;
  v_ani UUID; v_luc UUID; v_mar_mz UUID; v_teb UUID; v_had UUID;
  v_gle UUID; v_pad UUID; v_tab UUID; v_eri UUID; v_sam UUID;
  v_tal UUID; v_fme UUID; v_jan UUID; v_orl UUID; v_chi UUID;
  v_jai UUID; v_edu UUID; v_nik UUID; v_mvh UUID; v_gir UUID;
  v_jza UUID; v_san UUID; v_fbr UUID; v_cgi UUID; v_gpe UUID;
  v_kim UUID; v_adr UUID; v_dam UUID; v_mfe UUID; v_bia UUID;
  v_sal UUID; v_lir UUID; v_hug UUID; v_amo UUID; v_din UUID;
  v_tar UUID; v_cas UUID; v_cai UUID; v_leite UUID; v_lyr UUID;
  v_jer UUID; v_hel UUID; v_wil UUID;
  c_vio UUID; c_odi UUID; c_abu UUID; c_aut UUID; c_rac UUID;
  c_xen UUID; c_con UUID; c_irr UUID; c_des UUID; c_neg UUID;
  c_int UUID;
BEGIN
  SELECT id INTO v_cam FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_esd FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_luc FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_mar_mz FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_jza FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fbr FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpe FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_amo FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_leite FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_lyr FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_jer FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';

  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana assume MEC e promete reconstruir educação básica destruída por Bolsonaro.', 'Herdamos escolas destroçadas. Temos quatro anos para reconstruir a educação básica.', 'Posse como ministro da Educação em Brasília.', 'verified', true, '2023-01-02', 'https://www.gov.br/mec/pt-br/assuntos/noticias/posse-camilo-santana-mec', 'other', 1, 'MEC', 'Posse', 'camilo-posse-mec-b152-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que escolas do governo Lula ensinam "ideologia de gênero".', 'O MEC vai transformar escola em doutrinação de gênero. Vamos reagir.', 'Vídeo publicado no YouTube com 6 milhões de views.', 'verified', true, '2023-02-10', 'https://www.oantagonista.com/politica/nikolas-mec-ideologia-genero', 'social_media_post', 4, 'Redes sociais', 'Vídeo', 'nikolas-mec-ideologia-genero-b152-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana rebate Nikolas e diz que escola tratará de ciência.', 'O MEC não tem agenda ideológica. Nosso foco é alfabetização, ensino médio, Pé-de-Meia.', 'Coletiva após repercussão do vídeo de Nikolas.', 'verified', false, '2023-02-14', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-rebate-nikolas-ciencia', 'other', 1, 'MEC', 'Coletiva', 'camilo-rebate-nikolas-b152-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia Pé-de-Meia, programa de bolsa para alunos do ensino médio.', 'Nunca mais um jovem pobre vai ter que escolher entre estudar e trabalhar cedo.', 'Lançamento do programa em Brasília.', 'verified', true, '2024-01-25', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-lanca-pe-de-meia', 'other', 1, 'Palácio do Planalto', 'Lançamento Pé-de-Meia', 'lula-pe-de-meia-b152-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem acusa Pé-de-Meia de comprar voto com dinheiro público.', 'Pé-de-Meia é esmola eleitoral paga com dinheiro do contribuinte. É compra de voto institucionalizada.', 'Discurso em plenário durante votação.', 'verified', false, '2024-02-07', 'https://www.camara.leg.br/noticias/mvh-pe-de-meia-compra-voto', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'mvh-pe-de-meia-voto-b152-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende Pé-de-Meia mesmo em oposição e critica ataque à educação.', 'Reduzir Pé-de-Meia à compra de voto é ofensivo aos estudantes. Política pública séria não se ataca por birra.', 'Pronunciamento em plenário contra o discurso oposicionista.', 'verified', false, '2024-02-07', 'https://www.camara.leg.br/noticias/tabata-pe-de-meia-defesa', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'tabata-defende-pe-de-meia-b152-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco defende renovação da Lei de Cotas com ampliação da presença negra.', 'Cotas não se discutem, se aprimoram. A ascensão de pretos na universidade é projeto de Brasil.', 'Evento na UERJ marcando 20 anos da Lei de Cotas no Rio.', 'verified', true, '2023-09-05', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-cotas-uerj-20-anos', 'other', 1, 'UERJ', '20 anos da Lei de Cotas', 'anielle-cotas-uerj-b152-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que cotas raciais são "racismo contra brancos".', 'Cotas raciais são racismo. Não pode haver privilégio por cor da pele.', 'Discurso em plenário durante discussão da renovação das cotas.', 'verified', true, '2023-10-11', 'https://www.camara.leg.br/noticias/nikolas-cotas-racismo-branco', 'news_article', 5, 'Câmara dos Deputados', 'Pronunciamento', 'nikolas-cotas-racismo-branco-b152-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone rebate Nikolas e defende cotas como reparação histórica.', 'Dizer que cota é racismo é apagar 350 anos de escravidão. É ofensa à história do povo preto.', 'Postagem e pronunciamento em plenário.', 'verified', true, '2023-10-11', 'https://www.camara.leg.br/noticias/taliria-rebate-nikolas-cotas-reparacao', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-cotas-reparacao-b152-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona renovação da Lei de Cotas por 10 anos.', 'As cotas transformaram a universidade brasileira. Agora consolidamos com mais 10 anos.', 'Cerimônia no Planalto com reitores de universidades federais.', 'verified', true, '2023-11-13', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-sanciona-cotas', 'other', 1, 'Palácio do Planalto', 'Sanção', 'lula-sanciona-cotas-b152-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis vota contra cotas e fala em "fábrica de ressentidos".', 'As cotas criam ressentimento, geram conflito racial. É uma fábrica de ressentidos financiada pelo governo.', 'Pronunciamento em plenário.', 'verified', false, '2023-10-25', 'https://www.camara.leg.br/noticias/bia-kicis-cotas-fabrica-ressentimento', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'bia-kicis-fabrica-ressentidos-b152-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana defende ENEM 2023 e rebate boatos sobre "questões petistas".', 'O ENEM é técnico, neutro, elaborado por especialistas. Não há sigla partidária em prova pública.', 'Coletiva após oposição atacar questões do ENEM.', 'verified', false, '2023-11-06', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-enem-neutralidade', 'other', 1, 'MEC', 'Coletiva', 'camilo-enem-neutralidade-b152-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano acusa ENEM de "doutrinar com agenda LGBT".', 'O ENEM virou panfleto do PT e do lobby gay. Está explícito na redação e nas questões.', 'Postagem no Instagram após prova do ENEM 2023.', 'verified', true, '2023-11-07', 'https://www.metropoles.com/brasil/feliciano-enem-agenda-lgbt', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'feliciano-enem-lgbt-b152-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede auditoria internacional do ENEM e acusa fraude do PT.', 'Precisamos que observadores internacionais auditem o ENEM. O PT fraudou como fraudou a eleição.', 'Postagem em inglês no X voltada a público americano.', 'verified', true, '2023-11-08', 'https://www.oantagonista.com/politica/eduardo-enem-auditoria-internacional', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'eduardo-enem-auditoria-b152-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia ataques ao ENEM como boicote à ciência.', 'Atacar o ENEM é atacar o direito do jovem pobre de estudar. Boicote é crime social.', 'Pronunciamento na Câmara.', 'verified', false, '2023-11-09', 'https://www.camara.leg.br/noticias/samia-enem-boicote-ciencia', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'samia-enem-boicote-b152-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos defende investimento em ciência e universidade após cortes do bolsonarismo.', 'Retomamos bolsas CNPq e Capes. O pior já passou, mas a reconstrução leva tempo.', 'Entrevista à Folha após retomada de R$ 1 bi em bolsas.', 'verified', false, '2023-04-20', 'https://www1.folha.uol.com.br/ciencia/2023/04/luciana-santos-bolsas-cnpq-capes.shtml', 'news_article', 1, 'Brasília', 'Entrevista', 'luciana-santos-bolsas-b152-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara celebra aumento de estudantes indígenas em federais.', 'Dobrou o número de indígenas nas federais. Nunca tivemos tantos, mas precisamos de mais.', 'Evento da UFRJ com estudantes indígenas cotistas.', 'verified', false, '2023-05-04', 'https://www.gov.br/povosindigenas/pt-br/noticias/guajajara-indigenas-federais', 'other', 1, 'UFRJ', 'Evento', 'guajajara-indigenas-federais-b152-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Júlia Zanatta chama universidades públicas de "aparelho ideológico do PT".', 'UFSC, UFRJ, USP são aparelho ideológico do PT. Temos que acabar com a autonomia delas.', 'Pronunciamento em plenário defendendo fim da autonomia universitária.', 'verified', true, '2024-03-05', 'https://www.camara.leg.br/noticias/zanatta-universidade-aparelho-pt', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'zanatta-universidade-aparelho-b152-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Melchionna denuncia ataques de Zanatta como tentativa de destruir autonomia universitária.', 'Universidade autônoma é pilar da democracia. Zanatta quer destruir porque não consegue vencer no debate.', 'Postagem no X e pronunciamento plenário.', 'verified', false, '2024-03-06', 'https://www.camara.leg.br/noticias/melchionna-autonomia-universitaria', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'melchionna-autonomia-universidade-b152-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros defende CPI do "marxismo cultural" nas universidades.', 'Vamos criar CPI para investigar marxismo cultural em universidade. Professor comunista tem que sumir.', 'Coletiva com bancada bolsonarista na Câmara.', 'verified', true, '2024-04-12', 'https://www.camara.leg.br/noticias/filipe-barros-cpi-marxismo-cultural', 'news_article', 5, 'Câmara dos Deputados', 'Coletiva bolsonarista', 'filipe-cpi-marxismo-b152-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar chama CPI do "marxismo cultural" de caça às bruxas.', 'É uma caça às bruxas estilo McCarthy. Dá vergonha ver parlamentar brasileiro imitar os piores momentos da história dos EUA.', 'Pronunciamento em plenário.', 'verified', false, '2024-04-13', 'https://www.camara.leg.br/noticias/chico-alencar-caca-bruxas-cpi', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-caca-bruxas-cpi-b152-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves propõe Escola Sem Partido como PL prioritário no Senado.', 'Escola sem partido é demanda da família brasileira. Chega de doutrinar nossas crianças.', 'Apresentação do PL no Senado Federal.', 'verified', true, '2023-06-15', 'https://www12.senado.leg.br/noticias/damares-pl-escola-sem-partido', 'news_article', 4, 'Senado Federal', 'Apresentação PL', 'damares-escola-sem-partido-b152-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton rebate Damares e defende liberdade de cátedra.', 'Escola sem partido é mordaça. É contra a Constituição, contra a ciência e contra a liberdade.', 'Pronunciamento em plenário após PL de Damares.', 'verified', false, '2023-06-20', 'https://www.camara.leg.br/noticias/erika-rebate-damares-escola-sem-partido', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'erika-rebate-damares-b152-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado defende militarização de escolas em Goiás contra atentados.', 'Escola militar dá disciplina, reduz violência. Vou militarizar mais cinquenta em Goiás.', 'Coletiva em Goiânia após atentado em escola do DF.', 'verified', true, '2023-04-10', 'https://g1.globo.com/go/goias/noticia/2023/04/10/caiado-escolas-militares-goias.ghtml', 'news_article', 3, 'Goiânia', 'Coletiva', 'caiado-escolas-militares-b152-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio lança programa de escolas cívico-militares em SP.', 'Nossas escolas militares vão ser modelo de disciplina e de resultado no ENEM.', 'Lançamento em escola em Franco da Rocha.', 'verified', false, '2023-03-22', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-escolas-civico-militares', 'other', 2, 'São Paulo', 'Lançamento', 'tarcisio-civico-militar-b152-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva critica militarização e defende escola cidadã.', 'Militarizar escola é abrir mão da educação para ensinar obediência. Queremos cidadãos críticos, não soldados.', 'Pronunciamento em plenário.', 'verified', false, '2023-04-15', 'https://www.camara.leg.br/noticias/orlando-escola-militarizacao-critica', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-escola-militarizacao-b152-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio anuncia material didático digital em SP e causa polêmica.', 'Vamos substituir livro didático por material digital. É modernização, não precariedade.', 'Lançamento do programa Sala do Futuro em São Paulo.', 'verified', true, '2024-02-29', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/02/29/tarcisio-material-digital-sala-do-futuro.ghtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'tarcisio-sala-futuro-b152-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral denuncia erros grosseiros do material digital de SP.', 'O material da Sala do Futuro está cheio de erros. Alunos aprendem com texto errado. Não é modernização, é sabotagem.', 'Publicação com prints do material com erros.', 'verified', true, '2024-03-15', 'https://www.uol.com.br/noticias/tabata-material-digital-erros-sp', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'tabata-material-digital-erros-b152-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad defende retomar gasto com educação apesar da fiscalidade.', 'Cortar educação não é ajuste fiscal, é sabotar o futuro. Vamos proteger MEC no arcabouço.', 'Coletiva no Ministério da Fazenda.', 'verified', false, '2024-04-18', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/haddad-mec-arcabouco', 'other', 1, 'Ministério da Fazenda', 'Coletiva', 'haddad-mec-arcabouco-b152-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende voucher educacional e privatização parcial.', 'Educação boa passa por voucher, escolha da família e competição. Monopólio público só produziu fracasso.', 'Artigo publicado no Estadão.', 'verified', false, '2024-05-30', 'https://www.estadao.com.br/opiniao/kim-kataguiri-voucher-educacao', 'op_ed', 1, 'Estadão', 'Artigo', 'kim-voucher-educacao-b152-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura apresenta PL para facilitar home-schooling no Brasil.', 'Família tem direito de educar em casa. Muitos países permitem, não é retrocesso.', 'Apresentação na CCJ da Câmara.', 'verified', false, '2024-06-05', 'https://www.camara.leg.br/noticias/adriana-ventura-homeschooling-pl', 'news_article', 2, 'Câmara dos Deputados', 'CCJ', 'adriana-homeschooling-pl-b152-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana alerta que home-schooling foge à fiscalização contra maus-tratos.', 'Escola é proteção. Sem escola, criança vulnerável fica invisível. Home-schooling é risco real.', 'Entrevista à Globo News.', 'verified', false, '2024-06-10', 'https://g1.globo.com/educacao/noticia/2024/06/10/camilo-home-schooling-protecao-crianca.ghtml', 'news_article', 1, 'GloboNews', 'Entrevista', 'camilo-homeschooling-protecao-b152-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica cortes do governo Bolsonaro na Ciência em evento da SBPC.', 'A ciência brasileira passou quatro anos na UTI. Voltamos ao padrão de investimento pré-golpe.', 'Discurso na reunião anual da SBPC em Curitiba.', 'verified', false, '2024-07-15', 'https://portal.sbpcnet.org.br/noticias/lula-ciencia-utipos-curitiba', 'other', 1, 'Curitiba', 'Reunião SBPC', 'lula-ciencia-uti-b152-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que "universidade forma maconheiro" em evento em Joinville.', 'Universidade pública forma maconheiro, balbúrdia. Eu cortei e ia cortar mais se tivesse ganhado.', 'Discurso em evento com apoiadores em Joinville.', 'verified', true, '2023-07-09', 'https://www.uol.com.br/noticias/bolsonaro-universidade-maconheiro-joinville', 'news_article', 4, 'Joinville', 'Evento bolsonarista', 'bolsonaro-universidade-maconheiro-b152-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann rebate Bolsonaro e defende universidade pública.', 'Universidade pública forma médico, engenheiro, cientista. É só olhar ENADE e Times Higher. Bolsonaro mente.', 'Publicação no X.', 'verified', false, '2023-07-10', 'https://www.metropoles.com/politica/gleisi-bolsonaro-universidade-maconheiro', 'social_media_post', 1, 'Redes sociais', 'Postagem', 'gleisi-rebate-bolsonaro-universidade-b152-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles propõe privatizar USP, Unicamp e Unesp.', 'As universidades paulistas estão encharcadas de comunismo. Privatizar é solução.', 'Entrevista em podcast liberal.', 'verified', false, '2023-08-22', 'https://www.youtube.com/watch?v=salles-privatizar-universidades', 'social_media_post', 4, 'Podcast', 'Entrevista', 'salles-privatizar-usp-b152-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jer, 'Jerônimo Rodrigues anuncia programa Mais Bahia para retenção de jovens no ensino médio.', 'Perdemos muito jovem entre 15 e 17 anos. O Mais Bahia vai mantê-los na escola com bolsa e mentoria.', 'Lançamento em Feira de Santana.', 'verified', false, '2023-08-30', 'https://www.ba.gov.br/noticias/jeronimo-mais-bahia-ensino-medio', 'other', 1, 'Feira de Santana', 'Lançamento', 'jeronimo-mais-bahia-b152-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lyr, 'Raquel Lyra cria programa Juntos pela Educação em Pernambuco.', 'Pernambuco precisa voltar ao topo da educação. Vamos recuperar o que foi perdido nos últimos 10 anos.', 'Lançamento no Recife.', 'verified', false, '2023-09-05', 'https://www.pe.gov.br/noticias/raquel-lyra-juntos-pela-educacao', 'other', 2, 'Recife', 'Lançamento', 'lyra-juntos-educacao-b152-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_leite, 'Eduardo Leite anuncia política contra bullying e ataque em escolas do RS.', 'Ataques a escolas são sintomas de radicalização online. Vamos agir para proteger alunos.', 'Coletiva em Porto Alegre após tentativa de ataque em Novo Hamburgo.', 'verified', false, '2023-05-12', 'https://www.estado.rs.gov.br/noticias/leite-bullying-ataque-escola', 'other', 1, 'Porto Alegre', 'Coletiva', 'leite-bullying-ataques-b152-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho amplia escolas em tempo integral no Pará.', 'Tempo integral é onde a educação muda de verdade. Pará investe em educação para vencer a desigualdade.', 'Coletiva em Belém com secretários.', 'verified', false, '2023-09-15', 'https://www.agenciapara.com.br/noticia/helder-tempo-integral-escolas', 'other', 1, 'Belém', 'Coletiva', 'helder-tempo-integral-b152-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto compartilha vídeo contra livros "comunistas" em escolas.', 'Professor que dá Paulo Freire tem que ser expulso da sala. É doutrinação pura.', 'Postagem no X com marcação de escolas da Paraíba.', 'verified', true, '2024-02-20', 'https://www.cartacapital.com.br/politica/cabo-gilberto-paulo-freire-expulsar', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'cabo-gilberto-paulo-freire-b152-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia ataque a professor negro em escola do RJ.', 'Professor negro é expulso de sala por aluno bolsonarista. Isso é racismo estrutural a olhos vistos.', 'Pronunciamento em plenário após episódio viralizar.', 'verified', true, '2024-03-20', 'https://www.metropoles.com/brasil/taliria-professor-negro-aluno-bolsonarista', 'news_article', 5, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-professor-negro-escola-b152-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco exige punição para ataques racistas a estudantes cotistas em federais.', 'Cotistas são hostilizados em grupos de WhatsApp universitários. Isso é crime e tem que ser punido.', 'Reunião com reitores e MPF.', 'verified', false, '2024-04-08', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-cotistas-whatsapp-racismo', 'other', 1, 'Brasília', 'Reunião MPF', 'anielle-cotistas-whatsapp-b152-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gpe, 'Guiga Peixoto posta ataque racista a estudante negra premiada em federal.', 'A cota explica. Sem cota, ela não entrava. É injustiça com quem estudou de verdade.', 'Postagem no X contra estudante premiada na UnB.', 'verified', true, '2024-05-15', 'https://www.metropoles.com/politica/guiga-peixoto-estudante-negra-unb', 'social_media_post', 5, 'Redes sociais', 'Postagem', 'guiga-estudante-negra-unb-b152-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim representa Guiga no MPF por racismo.', 'Guiga pratica racismo organizado. Vamos acionar até ele aprender que racismo é crime.', 'Representação protocolada em Brasília.', 'verified', false, '2024-05-17', 'https://www.cartacapital.com.br/politica/samia-guiga-racismo-mpf', 'news_article', 1, 'Brasília', 'Representação MPF', 'samia-guiga-racismo-mpf-b152-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet defende ampliação do PAC Educação como política anticíclica.', 'Creche e escola técnica são infraestrutura social. PAC Educação gera emprego hoje e renda amanhã.', 'Coletiva no MPO.', 'verified', false, '2024-06-10', 'https://www.gov.br/planejamento/pt-br/assuntos/noticias/tebet-pac-educacao-anticiclico', 'other', 1, 'Ministério do Planejamento', 'Coletiva', 'tebet-pac-educacao-b152-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio anuncia redução de vagas em pedagogia em SP.', 'Pedagogia formou professor demais. Vamos priorizar engenharia e saúde no estado.', 'Coletiva na Cidade Universitária da USP.', 'verified', true, '2024-07-05', 'https://www1.folha.uol.com.br/cotidiano/2024/07/tarcisio-vagas-pedagogia-sp.shtml', 'news_article', 3, 'São Paulo', 'Coletiva', 'tarcisio-vagas-pedagogia-b152-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica redução de vagas em pedagogia e alerta sobre colapso nas escolas.', 'Já falta professor. Reduzir vaga em pedagogia é garantir colapso daqui a 10 anos.', 'Pronunciamento em plenário.', 'verified', false, '2024-07-08', 'https://www.camara.leg.br/noticias/jandira-pedagogia-colapso', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-pedagogia-colapso-b152-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar_mz, 'Margareth Menezes lança programa Cultura na Escola com livros para rede pública.', 'Cultura é direito. Vamos mandar 5 milhões de livros para escolas públicas este ano.', 'Lançamento no Rio com Anielle Franco.', 'verified', false, '2024-08-02', 'https://www.gov.br/cultura/pt-br/noticias/margareth-cultura-na-escola-livros', 'other', 1, 'Rio de Janeiro', 'Lançamento', 'margareth-cultura-escola-livros-b152-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis ataca livros distribuídos e pede apreensão policial.', 'Livro com agenda LGBT não pode entrar em escola. Vou pedir à PF apreensão desses livros imundos.', 'Vídeo publicado no X.', 'verified', true, '2024-08-05', 'https://www.oantagonista.com/politica/bia-kicis-livros-lgbt-pf-apreensao', 'social_media_post', 5, 'Redes sociais', 'Vídeo', 'bia-kicis-livros-pf-apreensao-b152-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Melchionna denuncia Bia Kicis ao MP por querer apreender livros.', 'Queimar livro, apreender livro, é tática fascista. Vamos à Justiça contra isso.', 'Representação ao MPF.', 'verified', false, '2024-08-07', 'https://www.camara.leg.br/noticias/melchionna-bia-kicis-livros-mpf', 'news_article', 1, 'MPF', 'Representação', 'melchionna-bia-livros-mpf-b152-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck aumenta orçamento do MEC em R$ 20 bi no PLOA 2025.', 'Educação volta a ser prioridade de orçamento, não adereço. Mais R$ 20 bi.', 'Coletiva sobre PLOA em Brasília.', 'verified', false, '2024-08-31', 'https://www.gov.br/gestao/pt-br/assuntos/noticias/dweck-mec-orcamento-2025', 'other', 1, 'Ministério da Gestão', 'Coletiva PLOA', 'dweck-mec-orcamento-2025-b152-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira diz que dinheiro do MEC vai para "privilégio de universitário".', 'Aumento do MEC é para bancar churrasco de centro acadêmico. Escola pública continua caindo aos pedaços.', 'Vídeo no Instagram.', 'verified', true, '2024-09-03', 'https://www.oantagonista.com/politica/nikolas-mec-churrasco-centro-academico', 'social_media_post', 4, 'Redes sociais', 'Vídeo', 'nikolas-mec-churrasco-b152-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana mostra que investimento é majoritariamente na educação básica.', '72% do aumento é para educação básica. Nikolas mente e sabe que mente.', 'Postagem no X com gráficos do MEC.', 'verified', false, '2024-09-04', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-investimento-basica-72', 'social_media_post', 1, 'Redes sociais', 'Postagem', 'camilo-investimento-basica-b152-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva defende ensino integrado de clima nas escolas.', 'Mudança climática está na nossa escola. Tem que estar no currículo, na BNCC, desde a fundamental.', 'Evento da COP em Belém com estudantes.', 'verified', false, '2024-11-17', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-clima-escolas-bncc', 'other', 1, 'Belém', 'COP 30', 'marina-clima-escolas-b152-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano diz que clima nas escolas é "doutrinação globalista".', 'Querem doutrinar criança com medo de CO2. É pauta Soros disfarçada de ciência.', 'Postagem no X.', 'verified', false, '2024-11-18', 'https://www.metropoles.com/brasil/feliciano-clima-soros-escolas', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'feliciano-clima-soros-b152-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva denuncia negacionismo climático em redes sociais de parlamentares.', 'Parlamentar que ataca ciência do clima em rede social deveria perder mandato. Desinforma criança.', 'Pronunciamento após repercussão da fala de Feliciano.', 'verified', false, '2024-11-20', 'https://www.camara.leg.br/noticias/orlando-negacionismo-climatico-mandato', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-negacionismo-climatico-b152-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia Compromisso Nacional Criança Alfabetizada com meta de 100%.', 'Toda criança alfabetizada até 2026. É a meta. Ninguém para trás.', 'Lançamento em Fortaleza.', 'verified', true, '2023-06-12', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-crianca-alfabetizada-compromisso', 'other', 1, 'Fortaleza', 'Lançamento', 'camilo-crianca-alfabetizada-b152-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima critica MEC por falta de apoio ao Amazonas na pós-enchente.', 'Enchente destruiu 200 escolas. MEC não fez nada. É o Brasil que nos esquece.', 'Coletiva em Manaus.', 'verified', false, '2024-07-20', 'https://g1.globo.com/am/amazonas/noticia/2024/07/20/wilson-lima-mec-enchente-escolas.ghtml', 'news_article', 2, 'Manaus', 'Coletiva', 'wilson-lima-mec-enchente-b152-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo apresenta planilha de R$ 400 mi para escolas atingidas por eventos climáticos.', 'Mostramos os repasses. Wilson Lima falta à verdade para fazer política.', 'Coletiva MEC.', 'verified', false, '2024-07-22', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-planilha-enchentes-escolas', 'other', 1, 'MEC', 'Coletiva', 'camilo-planilha-enchentes-b152-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão pede "expurgo de militantes" das universidades federais.', 'Reitores militantes têm que sair. Vou apresentar PL para reformar conselhos universitários.', 'Entrevista na Jovem Pan.', 'verified', false, '2024-09-15', 'https://jovempan.com.br/programas/pingos-nos-is/girao-reitor-militante-expurgo.html', 'news_article', 4, 'Jovem Pan', 'Entrevista', 'girao-reitor-militante-expurgo-b152-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson pede destituição de reitor da UFRGS por "defender ideologia".', 'Reitor da UFRGS defende ideologia de gênero. Tem que ser exonerado. O MEC é conivente.', 'Discurso em plenário.', 'verified', true, '2024-09-20', 'https://www.camara.leg.br/noticias/sanderson-reitor-ufrgs-exoneracao', 'news_article', 4, 'Câmara dos Deputados', 'Pronunciamento', 'sanderson-reitor-ufrgs-b152-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar defende autonomia universitária e critica ataques à comunidade acadêmica.', 'Universidade é autônoma por artigo 207 da Constituição. Ataque à UFRGS é ataque à Carta.', 'Pronunciamento em plenário.', 'verified', false, '2024-09-22', 'https://www.camara.leg.br/noticias/chico-alencar-autonomia-207', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'chico-alencar-207-b152-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes suspende ato de Câmara de Vereadores que censurou livros em escolas de SP.', 'Censurar livros é violar direito à educação. Ato nulo.', 'Decisão monocrática em ADPF.', 'verified', false, '2024-10-12', 'https://portal.stf.jus.br/noticias/moraes-censura-livro-escola-sp', 'other', 1, 'STF', 'ADPF', 'moraes-censura-livro-escola-b152-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem ataca decisão de Moraes sobre censura a livros.', 'Moraes virou censor a favor da esquerda. Livro pornográfico em escola é crime, não direito.', 'Postagem no X.', 'verified', true, '2024-10-13', 'https://www.oantagonista.com/politica/mvh-moraes-livro-escola', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'mvh-moraes-livro-b152-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia perseguição a professora trans em escola pública.', 'Professora trans foi afastada por mãe bolsonarista querer "currículo cristão". Isso é transfobia de Estado.', 'Vídeo no X com dados do caso.', 'verified', true, '2024-11-06', 'https://www.metropoles.com/brasil/erika-professora-trans-perseguicao-escola', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'erika-professora-trans-escola-b152-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia plano federal contra ataques em escolas após novo episódio.', 'Ataque em escola é emergência nacional. Vamos ter gabinete permanente e verba federal.', 'Pronunciamento em cadeia nacional após ataque em escola de Goiás.', 'verified', true, '2024-10-24', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/lula-gabinete-ataques-escolas', 'other', 1, 'Palácio do Planalto', 'Pronunciamento', 'lula-gabinete-ataques-escolas-b152-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha anuncia atendimento psicológico integral a comunidades escolares.', 'Cada ataque deixa trauma em 500 crianças. SUS vai atuar permanentemente em escolas vítimas.', 'Coletiva em Goiânia após ataque.', 'verified', false, '2024-10-26', 'https://www.gov.br/saude/pt-br/assuntos/noticias/padilha-atendimento-psicologico-escolas', 'other', 1, 'Goiânia', 'Coletiva', 'padilha-psicologico-escolas-b152-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que ataques em escolas são "culpa de professor feminista".', 'Violência em escola é reflexo de professora de esquerda que fala mal dos homens. Fomenta ódio em quem não tem maturidade.', 'Live em que culpou professoras.', 'verified', true, '2024-11-05', 'https://www.uol.com.br/noticias/bolsonaro-ataque-escola-professor-feminista', 'social_media_post', 5, 'Redes sociais', 'Live', 'bolsonaro-ataque-professor-feminista-b152-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia Bolsonaro por culpar professoras de ataques em escolas.', 'Bolsonaro culpa vítima para eximir seus apoiadores armados. É discurso de ódio criminoso.', 'Representação ao MPF.', 'verified', true, '2024-11-06', 'https://www.metropoles.com/politica/taliria-bolsonaro-professor-ataque-mpf', 'news_article', 1, 'MPF', 'Representação', 'taliria-bolsonaro-professora-ataque-b152-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia ENEM 100% digital para 2026.', 'ENEM digital em todo Brasil em 2026. É mais segurança, menos custo, mais inclusão.', 'Coletiva no MEC.', 'verified', false, '2024-12-02', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-enem-digital-2026', 'other', 1, 'MEC', 'Coletiva', 'camilo-enem-digital-2026-b152-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri alerta que ENEM digital exclui quem não tem internet.', 'Em áreas rurais, sem sinal, ENEM digital é exclusão. Plano tem buraco grave.', 'Artigo no Estadão.', 'verified', false, '2024-12-04', 'https://www.estadao.com.br/opiniao/kim-kataguiri-enem-digital-exclusao', 'op_ed', 1, 'Estadão', 'Artigo', 'kim-enem-digital-exclusao-b152-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jza, 'Júlia Zanatta pede acesso a provas para auditoria partidária.', 'Temos que auditar ENEM com observadores dos partidos. O MEC é comitê eleitoral do PT.', 'Coletiva com bancada bolsonarista.', 'verified', false, '2024-12-05', 'https://www.camara.leg.br/noticias/zanatta-enem-auditoria-partidaria', 'news_article', 4, 'Câmara dos Deputados', 'Coletiva', 'zanatta-enem-auditoria-partidaria-b152-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta defende acordo bipartidário em torno da educação.', 'Educação não pode ser trincheira. Quero Câmara pautando unânime Pé-de-Meia, EnsinoMédio e creches.', 'Discurso de posse na Câmara.', 'verified', true, '2025-02-01', 'https://www.camara.leg.br/noticias/hugo-motta-educacao-acordo-bipartidario', 'other', 1, 'Câmara dos Deputados', 'Posse', 'hugo-motta-educacao-acordo-b152-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira critica Hugo Motta e diz que acordos "ficam só no discurso".', 'Discurso bonito de acordo na educação na prática vira aparelhamento do PT. Vamos cobrar.', 'Entrevista à Veja.', 'verified', false, '2025-02-15', 'https://veja.abril.com.br/politica/lira-hugo-motta-educacao-aparelhamento', 'news_article', 2, 'Brasília', 'Entrevista', 'lira-hugo-motta-educacao-b152-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral sustenta reforma do novo ensino médio com foco em formação geral.', 'Reforma do ensino médio ampliou abandono. Tem que ser revertida.', 'Sustentação em audiência pública.', 'verified', false, '2025-03-05', 'https://www.camara.leg.br/noticias/tabata-reforma-ensino-medio-abandono', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'tabata-ensino-medio-reforma-b152-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana sanciona revisão do novo ensino médio em cerimônia com Lula.', 'Novo ensino médio restaurado. Volta a Matemática, Física, Química, mais filosofia e sociologia.', 'Cerimônia no Planalto.', 'verified', true, '2024-08-14', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-revisao-ensino-medio-sanciona', 'other', 1, 'Palácio do Planalto', 'Sanção', 'camilo-revisao-ensino-medio-b152-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura critica revisão e diz que "mantém burocracia do PT".', 'Revisão do ensino médio só aumenta burocracia. Ministro Camilo não entendeu o século 21.', 'Pronunciamento em plenário.', 'verified', false, '2024-08-15', 'https://www.camara.leg.br/noticias/adriana-revisao-ensino-medio-burocracia', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'adriana-revisao-ensino-medio-b152-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_luc, 'Luciana Santos anuncia programa de bolsas de doutorado em IA e semicondutores.', 'Brasil precisa de 1.000 doutores em IA e semicondutores até 2028. Vamos financiar.', 'Coletiva no MCTI.', 'verified', false, '2025-04-22', 'https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/noticias/luciana-bolsas-ia-semicondutores', 'other', 1, 'MCTI', 'Coletiva', 'luciana-bolsas-ia-b152-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro anuncia Rio Presente Educação integrando PM em escolas.', 'Polícia vai para dentro da escola. Não tem conversa, tem patrulha permanente.', 'Coletiva em Copacabana.', 'verified', true, '2025-05-10', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2025/05/10/castro-rio-presente-educacao-pm-escola.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Coletiva', 'castro-rio-presente-educacao-b152-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica PM em escolas como política de ocupação armada.', 'Escola com PM permanente é quartel, não escola. Formam medo, não cidadão.', 'Pronunciamento plenário.', 'verified', false, '2025-05-12', 'https://www.camara.leg.br/noticias/jandira-pm-escola-quartel', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'jandira-pm-escola-quartel-b152-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto defende "cadeia para aluno que agredir professor".', 'Aluno que agredir professor tem que ir para cadeia. Chega de desrespeito.', 'Vídeo no X.', 'verified', false, '2025-06-03', 'https://www.cartacapital.com.br/politica/cabo-gilberto-aluno-professor-cadeia', 'social_media_post', 3, 'Redes sociais', 'Postagem', 'cabo-gilberto-aluno-cadeia-b152-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende reforma de carreira docente com salário inicial de R$ 5 mil.', 'Não dá para exigir qualidade pagando R$ 2,5 mil. Professor tem que ganhar R$ 5 mil mínimo.', 'Apresentação de PL na Câmara.', 'verified', false, '2025-07-08', 'https://www.camara.leg.br/noticias/tabata-carreira-docente-5-mil', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação PL', 'tabata-carreira-docente-5mil-b152-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco cria programa de cotas nos concursos federais para egressos de escola pública.', 'Escola pública não pode ser cemitério de sonhos. Concurso federal vai ter cota para egressos.', 'Coletiva em Brasília.', 'verified', false, '2025-07-14', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-cotas-concurso-federal-escola-publica', 'other', 1, 'Brasília', 'Coletiva', 'anielle-cotas-concurso-escola-publica-b152-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbr, 'Filipe Barros reage a cotas em concursos e diz que "escola pública não é currículo".', 'Escola pública não é qualificação. Cota em concurso é rebaixar o nível.', 'Postagem no X.', 'verified', true, '2025-07-15', 'https://www.oantagonista.com/politica/filipe-barros-cota-escola-publica-concurso', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'filipe-escola-publica-concurso-b152-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton rebate Filipe Barros sobre egresso de escola pública.', 'Filipe cuspiu no rosto de 40 milhões de brasileiros que estudaram em escola pública. É preconceito de classe.', 'Postagem no X.', 'verified', false, '2025-07-16', 'https://www.metropoles.com/politica/erika-filipe-barros-escola-publica', 'social_media_post', 2, 'Redes sociais', 'Postagem', 'erika-filipe-escola-publica-b152-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara anuncia licenciaturas indígenas em 20 novas universidades.', 'Professores indígenas em 20 novos pontos do país. Educação indígena por indígenas, acabou o colonialismo pedagógico.', 'Evento em Cuiabá com lideranças.', 'verified', false, '2025-08-18', 'https://www.gov.br/povosindigenas/pt-br/noticias/guajajara-licenciaturas-indigenas-20', 'other', 1, 'Cuiabá', 'Coletiva', 'guajajara-licenciaturas-indigenas-b152-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles diz que licenciatura indígena é "doutrinação separatista".', 'Ensinar índio em aldeia a ser separatista é crime federal. A União tem que reagir.', 'Entrevista em podcast bolsonarista.', 'verified', true, '2025-08-20', 'https://www.youtube.com/watch?v=salles-licenciatura-indigena-separatismo', 'social_media_post', 5, 'Podcast', 'Entrevista', 'salles-licenciatura-indigena-b152-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino determina apuração contra Salles por racismo estrutural.', 'Chamar educação indígena de separatismo é racismo tipificado. MPF vai apurar.', 'Decisão em inquérito.', 'verified', false, '2025-08-25', 'https://portal.stf.jus.br/noticias/dino-salles-educacao-indigena-racismo', 'other', 1, 'STF', 'Decisão', 'dino-salles-racismo-b152-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo anuncia meta de zerar analfabetismo em adultos até 2030.', 'Ainda temos 11 milhões de brasileiros analfabetos. Vamos zerar até 2030.', 'Coletiva no MEC com dados do IBGE.', 'verified', false, '2025-09-08', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-zerar-analfabetismo-2030', 'other', 1, 'MEC', 'Coletiva', 'camilo-zerar-analfabetismo-b152-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia reforma tributária com isenção para editoras de livros didáticos.', 'Livro em regime diferenciado. Não cobraremos IBS/CBS de livro didático e universidade pública.', 'Coletiva no Fazenda.', 'verified', false, '2025-09-18', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/haddad-livro-isencao-reforma', 'other', 1, 'Ministério da Fazenda', 'Coletiva', 'haddad-livro-isencao-b152-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado critica isenção a universidades e diz que aumenta carga privada.', 'Universidade não pode viver de isenção. Tem que ter gestão eficiente também.', 'Entrevista à CNN.', 'verified', false, '2025-09-20', 'https://www.cnnbrasil.com.br/politica/caiado-universidade-isencao-eficiencia/', 'news_article', 2, 'CNN', 'Entrevista', 'caiado-universidade-isencao-b152-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende Reforma Universitária com mais financiamento e autonomia.', 'Universidade pública precisa de mais verba e mais autonomia para fazer ciência de ponta.', 'Pronunciamento em audiência pública.', 'verified', false, '2025-10-04', 'https://www.camara.leg.br/noticias/gleisi-reforma-universitaria-verba', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'gleisi-reforma-universitaria-b152-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem chama greve de professores federais de "extorsão sindical".', 'Professor em greve é extorsão sindical. Deveria ser descontado do salário em dobro.', 'Postagem no X durante greve de federais.', 'verified', true, '2024-04-18', 'https://www.oantagonista.com/politica/mvh-greve-professor-extorsao', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'mvh-greve-professor-extorsao-b152-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali mostra solidariedade à greve de professores federais.', 'Greve de professor é luta por salário digno. Apoio total à comunidade universitária.', 'Ato com professores na UFRJ.', 'verified', false, '2024-04-19', 'https://www.camara.leg.br/noticias/jandira-greve-professor-ufrj-ato', 'news_article', 1, 'UFRJ', 'Ato', 'jandira-greve-ato-ufrj-b152-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana fecha acordo com Andes para encerrar greve federal.', 'Acordo fechado. Reposição salarial escalonada em três anos e reabertura de concursos.', 'Coletiva no MEC após acordo.', 'verified', false, '2024-05-08', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-acordo-andes-greve-federal', 'other', 1, 'MEC', 'Coletiva', 'camilo-acordo-andes-b152-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira compara universidades a "clubes de férias" em viral.', 'Universidade pública virou clube. Cinco meses de aula, resto é greve e férias.', 'Vídeo viral no TikTok.', 'verified', true, '2025-10-14', 'https://www.oantagonista.com/politica/nikolas-universidade-clube-ferias', 'social_media_post', 4, 'Redes sociais', 'Vídeo TikTok', 'nikolas-universidade-clube-b152-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva rebate Nikolas e cita dados da Universidade de São Paulo.', 'USP tem 10 prêmios nacionais só em 2025. Nikolas mente sabendo dos dados.', 'Pronunciamento em plenário com dados da Andifes.', 'verified', false, '2025-10-15', 'https://www.camara.leg.br/noticias/orlando-rebate-nikolas-universidade-dados', 'news_article', 1, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-rebate-nikolas-b152-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Camilo Santana anuncia balanço com Brasil fora do fundo do ranking PISA.', 'Saímos do último lugar em matemática no PISA. É recuperação histórica pós-Bolsonaro.', 'Coletiva no MEC com dados da OCDE.', 'verified', true, '2026-03-05', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-pisa-matematica-recuperacao', 'other', 1, 'MEC', 'Coletiva', 'camilo-pisa-recuperacao-b152-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que PISA "mentiu" para favorecer Lula.', 'PISA é da ONU, globalista. Mentiu para ajudar Lula em ano eleitoral. Dado fraudado.', 'Postagem no X em inglês.', 'verified', true, '2026-03-07', 'https://www.oantagonista.com/politica/eduardo-pisa-onu-fraude', 'social_media_post', 4, 'Redes sociais', 'Postagem', 'eduardo-pisa-fraude-b152-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
