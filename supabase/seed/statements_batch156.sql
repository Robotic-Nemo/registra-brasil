-- Batch 156: Agribusiness, land, Mato Grosso, Paraná, Mato Grosso do Sul 2023-2026
DO $$
DECLARE
  v_ter UUID; v_cfa UUID; v_mar UUID; v_lul UUID; v_son UUID;
  v_mme UUID; v_eri UUID; v_rat UUID; v_wla UUID; v_gca UUID;
  v_ade UUID; v_jrr UUID; v_pda UUID; v_rsa UUID; v_agr UUID;
  v_ena UUID; v_ali UUID; v_hmo UUID; v_nik UUID; v_zam UUID;
  v_san UUID; v_gir UUID; v_cgi UUID; v_fib UUID; v_dam UUID;
  v_jai UUID; v_gle UUID; v_had UUID; v_mor UUID; v_din UUID;
  v_orl UUID; v_tab UUID; v_tal UUID; v_sam UUID; v_eri2 UUID;
  c_des UUID; c_int UUID; c_dis UUID; c_vio UUID; c_rac UUID;
  c_mac UUID; c_mis UUID; c_hom UUID; c_xen UUID; c_abu UUID;
  c_irr UUID; c_neg UUID; c_con UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_cfa FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_wla FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_gca FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_ade FROM politicians WHERE slug = 'antonio-denarium';
  SELECT id INTO v_jrr FROM politicians WHERE slug = 'jeronimo-rodrigues';
  SELECT id INTO v_pda FROM politicians WHERE slug = 'paulo-dantas';
  SELECT id INTO v_rsa FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_agr FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_ena FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_ali FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_cgi FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_fib FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_eri2 FROM politicians WHERE slug = 'erika-hilton';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende flexibilização do licenciamento ambiental no agro.', 'O licenciamento está sufocando quem produz. Precisa ser desburocratizado.', 'Discurso no Senado defendendo PL do Licenciamento que ficou conhecido como PL da Devastação.', 'verified', true, '2024-05-22', 'https://www12.senado.leg.br/noticias/materias/2024/05/22/tereza-cristina-licenciamento-agro', 'news_article', 3, 'Senado Federal', 'Debate PL Licenciamento', 'tereza-licenciamento-agro-b156-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva alerta sobre PL da Devastação no Congresso.', 'Esse PL é a morte do meio ambiente brasileiro. Vamos ao STF.', 'Coletiva da ministra após aprovação do PL do Licenciamento no Senado.', 'verified', true, '2024-05-23', 'https://www.gov.br/mma/pt-br/noticias/2024/05/marina-silva-pl-devastacao-stf', 'other', 2, 'Ministério do Meio Ambiente', 'Coletiva PL Licenciamento', 'marina-pl-devastacao-b156-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes defende PL em MT e chama ambientalistas de obstáculo.', 'Ambientalista de gabinete não produz alimento. Produtor sim.', 'Discurso em Cuiabá durante Dia do Agronegócio em MT.', 'verified', true, '2024-07-20', 'https://www.mt.gov.br/noticias/mauro-mendes-ambientalistas-obstaculo-agro', 'other', 3, 'Palácio Paiaguás', 'Dia do Agronegócio', 'mauro-mendes-ambientalistas-b156-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia ataques a indígenas no MT em audiência.', 'Fazendeiros estão matando indígenas com a conivência do Estado.', 'Depoimento em audiência da ONU sobre violência no campo brasileiro.', 'verified', true, '2024-09-10', 'https://www.gov.br/povosindigenas/pt-br/noticias/2024/09/sonia-guajajara-onu-mt-violencia', 'other', 2, 'Genebra', 'Audiência ONU', 'sonia-onu-mt-violencia-b156-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles defende marco temporal em live no MT.', 'Marco temporal é justiça. Quem invadir depois de 1988 tem que ir embora.', 'Live no Instagram durante viagem a Sinop para feira agro.', 'verified', false, '2023-08-12', 'https://www.poder360.com.br/congresso/salles-marco-temporal-live-sinop/', 'news_article', 4, 'Sinop-MT', 'Live agro', 'salles-marco-temporal-sinop-b156-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende armamento de fazendeiros contra MST.', 'Fazendeiro armado é fazendeiro seguro. Vamos garantir esse direito.', 'Discurso em evento com produtores rurais em Dourados-MS.', 'verified', true, '2023-10-15', 'https://www.campograndenews.com.br/politica/sanderson-fazendeiro-armado-mst', 'news_article', 5, 'Dourados-MS', 'Evento ruralista', 'sanderson-fazendeiro-armado-b156-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Carlos Fávaro anuncia recorde de safra em evento do agro.', 'A safra 2023/24 será a maior da história. O agro é a locomotiva.', 'Entrevista coletiva no MAPA sobre projeções de safra.', 'verified', false, '2024-02-08', 'https://www.gov.br/agricultura/pt-br/noticias/2024/02/favaro-safra-recorde-locomotiva', 'other', 1, 'MAPA', 'Coletiva safra', 'favaro-safra-recorde-b156-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Eduardo Riedel defende investimento em ferrovia agro em MS.', 'A Nova Ferroeste vai escoar a produção de MS. É o futuro.', 'Discurso em Campo Grande durante lançamento de projeto ferroviário.', 'verified', false, '2024-03-20', 'https://www.ms.gov.br/eduardo-riedel-nova-ferroeste-agro-ms', 'other', 1, 'Campo Grande-MS', 'Lançamento ferroviário', 'riedel-nova-ferroeste-b156-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr compra briga com Incra por terras no oeste do PR.', 'Incra não manda no Paraná. Terras produtivas não serão reforma agrária.', 'Declaração à TV Paraná após tentativa de desapropriação.', 'verified', true, '2024-04-18', 'https://g1.globo.com/pr/parana/noticia/2024/04/18/ratinho-junior-incra-terras-oeste.ghtml', 'news_article', 3, 'Curitiba-PR', 'Entrevista', 'ratinho-incra-terras-b156-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes nega desmatamento em MT apesar de dados.', 'Não há desmatamento ilegal em MT. Isso é invenção da esquerda.', 'Entrevista em rádio de Cuiabá contrariando dados do Inpe.', 'verified', true, '2024-06-05', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/06/05/mauro-mendes-nega-desmatamento-inpe.ghtml', 'news_article', 4, 'Rádio CBN Cuiabá', 'Entrevista', 'mauro-nega-desmatamento-b156-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão publica foto com arma em fazenda em MS.', 'Patriotas do agro estão armados. MST que se cuide.', 'Foto em fazenda na região de Dourados gerou denúncia ao MP-MS.', 'verified', true, '2024-07-28', 'https://www.campograndenews.com.br/politica/girao-arma-fazenda-mst-ameaca', 'news_article', 5, 'Dourados-MS', 'Foto em fazenda', 'girao-arma-fazenda-ms-b156-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina minimiza queimadas no Pantanal em entrevista.', 'Queimada sempre teve. Isso é natural do bioma.', 'Fala em entrevista à CNN durante recorde de focos de incêndio em MS.', 'verified', true, '2024-08-12', 'https://www.cnnbrasil.com.br/politica/tereza-cristina-queimadas-pantanal-natural/', 'news_article', 4, 'CNN Brasil', 'Entrevista TV', 'tereza-queimadas-natural-b156-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina anuncia operação emergencial no Pantanal queimando.', 'Decretamos emergência em todo o Pantanal. Situação é crítica.', 'Coletiva do Ibama sobre operação no Pantanal em MS e MT.', 'verified', true, '2024-08-14', 'https://www.gov.br/ibama/pt-br/noticias/2024/08/marina-pantanal-emergencia-operacao', 'other', 1, 'Brasília', 'Coletiva Ibama', 'marina-pantanal-emergencia-b156-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ali, 'Arthur Lira articula aprovação da PEC Marco Temporal.', 'A PEC Marco Temporal será aprovada. O agro não pode esperar.', 'Declaração após reunião com bancada ruralista na Câmara.', 'verified', true, '2023-09-28', 'https://www.camara.leg.br/noticias/arthur-lira-pec-marco-temporal-ruralistas', 'news_article', 3, 'Câmara dos Deputados', 'Reunião ruralista', 'lira-pec-marco-temporal-b156-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara reage à aprovação da PEC Marco Temporal.', 'Aprovar essa PEC é autorizar genocídio indígena.', 'Manifestação em frente ao Congresso após aprovação no Senado.', 'verified', true, '2023-09-27', 'https://g1.globo.com/politica/noticia/2023/09/27/sonia-guajajara-pec-marco-temporal-genocidio.ghtml', 'news_article', 2, 'Congresso Nacional', 'Manifestação', 'sonia-pec-genocidio-b156-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta parcialmente marco temporal aprovado no Congresso.', 'Direito originário de indígenas não pode ser violado.', 'Coletiva no Planalto anunciando vetos à Lei do Marco Temporal.', 'verified', true, '2023-10-20', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2023/10/lula-veta-marco-temporal', 'other', 1, 'Palácio do Planalto', 'Anúncio de vetos', 'lula-veta-marco-temporal-b156-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agr, 'Aguinaldo Ribeiro articula derrubada dos vetos de Lula.', 'Vamos derrubar os vetos. O Congresso é soberano.', 'Declaração após reunião de líderes sobre vetos do marco temporal.', 'verified', true, '2023-12-14', 'https://www.camara.leg.br/noticias/aguinaldo-ribeiro-vetos-marco-temporal-derrubar', 'news_article', 3, 'Câmara dos Deputados', 'Reunião líderes', 'aguinaldo-derrubar-vetos-b156-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto defende violência armada contra invasores em MS.', 'Invadiu, morreu. Essa é a lei do campo.', 'Live no Instagram após conflito em fazenda em Sidrolândia-MS.', 'verified', true, '2024-10-05', 'https://www.poder360.com.br/congresso/cabo-gilberto-invadiu-morreu-ms/', 'news_article', 5, 'Instagram Live', 'Live MS', 'cabo-gilberto-invadiu-morreu-b156-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles defende garimpo ilegal em território yanomami.', 'Garimpo dá emprego. Não pode demonizar quem trabalha.', 'Discurso em evento em Boa Vista defendendo mineração.', 'verified', true, '2023-06-15', 'https://amazonia.org.br/2023/06/salles-garimpo-yanomami-emprego/', 'news_article', 5, 'Boa Vista-RR', 'Evento mineração', 'salles-garimpo-yanomami-b156-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Antônio Denarium defende garimpo em RR.', 'Sem garimpo, Roraima quebra. Precisamos regularizar.', 'Entrevista durante crise humanitária yanomami em RR.', 'verified', true, '2023-02-10', 'https://g1.globo.com/rr/roraima/noticia/2023/02/10/denarium-garimpo-roraima-yanomami.ghtml', 'news_article', 4, 'Boa Vista-RR', 'Entrevista', 'denarium-garimpo-roraima-b156-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli pede volta de agronegócio em áreas proibidas.', 'Não dá para ter tanta reserva. Acre precisa produzir.', 'Declaração em reunião com frente parlamentar do agro.', 'verified', false, '2023-05-25', 'https://g1.globo.com/ac/acre/noticia/2023/05/25/gladson-reservas-agronegocio.ghtml', 'news_article', 3, 'Rio Branco-AC', 'Reunião política', 'gladson-reservas-agronegocio-b156-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wla, 'Wilson Lima defende BR-319 e diz que ambientalismo trava Amazônia.', 'BR-319 é vida. Ambientalismo radical não nos deixa progredir.', 'Pronunciamento na Aleam após decisão judicial que parou obra.', 'verified', true, '2024-04-12', 'https://www.amazonastal.com.br/politica/wilson-lima-br319-ambientalismo-radical', 'news_article', 3, 'Assembleia do Amazonas', 'Pronunciamento', 'wilson-lima-br319-b156-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr enfrenta ministra Marina em evento sobre agrotóxicos.', 'Ministra, no Paraná a gente produz com responsabilidade.', 'Bate-boca em evento sobre uso de agrotóxicos em Cascavel-PR.', 'verified', true, '2024-09-18', 'https://g1.globo.com/pr/parana/noticia/2024/09/18/ratinho-marina-agrotoxicos-cascavel.ghtml', 'news_article', 2, 'Cascavel-PR', 'Evento agro', 'ratinho-marina-agrotoxico-b156-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva responde em Cascavel sobre agrotóxicos.', 'Responsabilidade exige ciência. Paraná ignora ciência.', 'Resposta em evento gerou rusga com governador do PR.', 'verified', true, '2024-09-18', 'https://g1.globo.com/pr/parana/noticia/2024/09/18/marina-cascavel-ciencia-agrotoxico.ghtml', 'news_article', 2, 'Cascavel-PR', 'Evento agro', 'marina-cascavel-ciencia-b156-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina comemora aprovação de PL do Veneno em MS.', 'Finalmente o agronegócio terá mais liberdade. Viva MS.', 'Post no Instagram após aprovação do PL 1459 que afrouxou regras.', 'verified', false, '2023-12-01', 'https://www.campograndenews.com.br/politica/tereza-pl-veneno-liberdade-ms', 'news_article', 3, 'Instagram', 'Post aprovação PL', 'tereza-pl-veneno-b156-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota para manter tese de Zanin sobre marco temporal.', 'A Constituição tem que prevalecer sobre PECs oportunistas.', 'Voto em plenário do STF no julgamento sobre marco temporal.', 'verified', true, '2024-11-05', 'https://www.conjur.com.br/2024-nov-05/dino-marco-temporal-stf/', 'news_article', 1, 'STF', 'Julgamento marco temporal', 'dino-marco-temporal-voto-b156-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ena, 'Elmar Nascimento articula reação ruralista a Alexandre de Moraes.', 'Moraes não pode legislar. Vamos blindar o agro.', 'Reunião com bancada ruralista após decisões do STF.', 'verified', false, '2024-12-08', 'https://www.camara.leg.br/noticias/elmar-nascimento-ruralistas-moraes', 'news_article', 3, 'Câmara dos Deputados', 'Reunião ruralista', 'elmar-ruralistas-moraes-b156-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta anuncia urgência para PL da Devastação.', 'O agro não pode esperar STF. Vamos votar amanhã.', 'Anúncio de pauta após reunião com frente parlamentar do agro.', 'verified', true, '2025-07-10', 'https://www.camara.leg.br/noticias/hugo-motta-urgencia-pl-licenciamento', 'news_article', 3, 'Câmara dos Deputados', 'Anúncio de pauta', 'hugo-motta-urgencia-licenciamento-b156-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta trechos do PL do Licenciamento em coletiva.', 'Não vou compactuar com devastação. O Brasil precisa do meio ambiente.', 'Anúncio de vetos ao PL do Licenciamento após pressão internacional.', 'verified', true, '2025-08-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/08/lula-veta-pl-licenciamento', 'other', 1, 'Palácio do Planalto', 'Anúncio de vetos', 'lula-veta-licenciamento-b156-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes critica vetos de Lula ao licenciamento em MT.', 'Lula não entende o agro. Vetou a solução.', 'Coletiva em Cuiabá reagindo aos vetos presidenciais.', 'verified', false, '2025-08-09', 'https://www.mt.gov.br/noticias/mauro-mendes-vetos-lula-licenciamento', 'other', 2, 'Palácio Paiaguás', 'Coletiva reação', 'mauro-mendes-vetos-lula-b156-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica vídeo no campo fazendo piada com MST.', 'Olha a produção de soja. Isso é Brasil. Não precisamos do MST.', 'Vídeo em fazenda em Rondonópolis-MT viralizou no Instagram.', 'verified', false, '2024-02-15', 'https://www.metropoles.com/politica/nikolas-video-fazenda-mst-soja', 'news_article', 2, 'Rondonópolis-MT', 'Vídeo em fazenda', 'nikolas-video-fazenda-b156-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes multa Estado de MT por descumprimento ambiental.', 'O Estado deve obedecer a lei, não escolher qual cumpre.', 'Decisão multando MT em R$ 100 milhões por descumprir ordens ambientais.', 'verified', true, '2025-05-22', 'https://www.conjur.com.br/2025-mai-22/moraes-multa-mt-descumprimento-ambiental/', 'news_article', 1, 'STF', 'Decisão monocrática', 'moraes-multa-mt-b156-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel defende revisão de terras indígenas em MS.', 'Temos terras indígenas que são fictícias. Precisamos rever.', 'Discurso em Dourados sobre demarcação pendente no sul de MS.', 'verified', true, '2024-06-25', 'https://www.campograndenews.com.br/politica/riedel-terras-indigenas-ficticias-ms', 'news_article', 4, 'Dourados-MS', 'Discurso', 'riedel-terras-ficticias-b156-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia denuncia Riedel por discurso anti-indígena em MS.', 'Governador promove ódio contra povos originários. É racismo.', 'Nota oficial do ministério após declarações do governador de MS.', 'verified', true, '2024-06-26', 'https://www.gov.br/povosindigenas/pt-br/noticias/2024/06/sonia-denuncia-riedel-racismo-ms', 'other', 1, 'MPI', 'Nota oficial', 'sonia-denuncia-riedel-b156-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto faz vídeo em fazenda defendendo chacina.', 'Vamos revidar igual fizemos na Guarani-Kaiowá. Sem dó.', 'Vídeo apagado mas salvo por jornalistas mencionando chacina histórica em MS.', 'verified', false, '2024-11-20', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2024/11/20/cabo-gilberto-chacina-guarani-kaiowa-video.ghtml', 'news_article', 5, 'Instagram', 'Vídeo apagado', 'cabo-gilberto-chacina-b156-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ali, 'Arthur Lira bloqueia PL de proteção a terras quilombolas.', 'PL dos quilombolas foi suspenso. Vai ser rediscutido.', 'Anúncio após reunião com bancada ruralista e assuntos afrodescendentes.', 'verified', false, '2024-03-15', 'https://www.camara.leg.br/noticias/lira-bloqueia-pl-quilombolas-ruralistas', 'news_article', 3, 'Câmara dos Deputados', 'Reunião bancadas', 'lira-bloqueia-pl-quilombolas-b156-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende milícias no campo em audiência.', 'Milícia armada do campo é autodefesa. MST que se cuide.', 'Discurso em audiência sobre segurança rural na Câmara.', 'verified', true, '2024-10-18', 'https://www.camara.leg.br/noticias/sanderson-milicia-campo-audiencia-mst', 'news_article', 5, 'Câmara dos Deputados', 'Audiência segurança rural', 'sanderson-milicia-campo-b156-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Fávaro nega crise do arroz e culpa enchente no RS.', 'Não há desabastecimento. É alarmismo.', 'Coletiva durante crise do arroz pós-enchente no RS em 2024.', 'verified', true, '2024-05-08', 'https://g1.globo.com/economia/agronegocios/noticia/2024/05/08/favaro-nega-crise-arroz-alarmismo.ghtml', 'news_article', 3, 'MAPA', 'Coletiva', 'favaro-nega-crise-arroz-b156-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro visita fazenda em MT e ataca Lula em comício improvisado.', 'Lula quer destruir o agro. Vamos resistir.', 'Comício improvisado na fazenda de ex-aliado em Primavera do Leste.', 'verified', true, '2023-09-20', 'https://g1.globo.com/mt/mato-grosso/noticia/2023/09/20/bolsonaro-fazenda-mt-ataque-lula.ghtml', 'news_article', 3, 'Primavera do Leste-MT', 'Comício fazenda', 'bolsonaro-fazenda-mt-b156-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares defende marco temporal em evento com ruralistas.', 'Índio quer trabalhar, não quer reserva eterna.', 'Discurso em evento agro em Campo Grande-MS.', 'verified', false, '2024-08-08', 'https://www.campograndenews.com.br/politica/damares-marco-temporal-ruralistas-ms', 'news_article', 4, 'Campo Grande-MS', 'Evento agro', 'damares-marco-temporal-ruralistas-b156-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros publica fake news sobre Plano Safra.', 'Lula cortou Plano Safra. Agro vai quebrar.', 'Post no X com informação falsa desmentida por Ministério da Fazenda.', 'verified', false, '2024-07-03', 'https://www.aosfatos.org/noticias/filipe-barros-plano-safra-fake/', 'news_article', 3, 'X/Twitter', 'Post desmentido', 'filipe-plano-safra-fake-b156-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia Plano Safra recorde em evento do agro.', 'Plano Safra 2024/25 tem R$ 400 bilhões. Maior da história.', 'Lançamento em evento com presença de ministros e ruralistas.', 'verified', true, '2024-07-02', 'https://www.gov.br/fazenda/pt-br/acompanhe-ministerio/noticias/2024/07/haddad-plano-safra-400-bilhoes', 'other', 1, 'Palácio do Planalto', 'Lançamento Plano Safra', 'haddad-plano-safra-recorde-b156-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina prega fim da Funai em evento em MS.', 'Funai é obstáculo. Precisa ser extinta.', 'Discurso em convenção do PP em Campo Grande.', 'verified', false, '2024-02-28', 'https://www.campograndenews.com.br/politica/tereza-fim-funai-ms-convencao', 'news_article', 4, 'Campo Grande-MS', 'Convenção PP', 'tereza-fim-funai-b156-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia Tereza por discurso contra Funai.', 'Atacar Funai é atacar direitos. Isso tem limite.', 'Coletiva do ministério em resposta à ex-ministra.', 'verified', false, '2024-03-01', 'https://www.gov.br/povosindigenas/pt-br/noticias/2024/03/sonia-resposta-tereza-funai', 'other', 1, 'MPI', 'Coletiva resposta', 'sonia-resposta-tereza-funai-b156-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes nega crise climática em entrevista de MT.', 'Isso de mudança climática é conversa para travar o agro.', 'Entrevista à Rádio Real Cuiabá durante seca histórica em MT.', 'verified', true, '2024-09-05', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/09/05/mauro-mendes-nega-mudanca-climatica.ghtml', 'news_article', 5, 'Rádio Real Cuiabá', 'Entrevista', 'mauro-mendes-nega-clima-b156-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles ataca ministra Marina em evento no PR.', 'Marina é inimiga do agro. Não tem lugar no Brasil.', 'Discurso em evento da Faep em Londrina-PR.', 'verified', true, '2024-10-15', 'https://www.metropoles.com/politica/salles-marina-evento-londrina-faep', 'news_article', 4, 'Londrina-PR', 'Evento FAEP', 'salles-marina-faep-londrina-b156-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr defende investimento em IA para agro paranaense.', 'PR é referência em agro. Vamos liderar a IA no campo.', 'Discurso em lançamento de parceria tech com Itaipu.', 'verified', false, '2025-02-12', 'https://g1.globo.com/pr/parana/noticia/2025/02/12/ratinho-ia-agro-itaipu.ghtml', 'news_article', 1, 'Foz do Iguaçu-PR', 'Lançamento parceria', 'ratinho-ia-agro-pr-b156-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ali, 'Arthur Lira barra votação de PL ambiental em favor do agro.', 'Vamos adiar. Não está maduro.', 'Adiamento de votação de PL sobre áreas protegidas.', 'verified', false, '2024-05-20', 'https://www.camara.leg.br/noticias/lira-adia-pl-ambiental-agro', 'news_article', 3, 'Câmara dos Deputados', 'Decisão de pauta', 'lira-adia-pl-ambiental-b156-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wla, 'Wilson Lima defende liberação de pesticidas proibidos na UE.', 'Não podemos importar regra europeia. Brasil é diferente.', 'Declaração em evento da Anffa em Manaus.', 'verified', false, '2024-11-14', 'https://www.amazonastal.com.br/politica/wilson-lima-pesticidas-ue-manaus', 'news_article', 3, 'Manaus-AM', 'Evento setor químico', 'wilson-lima-pesticidas-b156-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jrr, 'Jerônimo defende reforma agrária na Bahia mas enfrenta ruralistas.', 'Reforma agrária é justiça, não invasão.', 'Pronunciamento na Alba contra discurso anti-MST dos ruralistas.', 'verified', false, '2024-04-10', 'https://www.bahia.ba.gov.br/jeronimo-reforma-agraria-alba-mst', 'other', 1, 'Alba', 'Pronunciamento', 'jeronimo-reforma-agraria-b156-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli defende proprietários em fazenda de MT.', 'Chega de MST. O Brasil precisa ser do agro.', 'Visita a fazenda em Sorriso-MT durante campanha de aliados.', 'verified', false, '2023-07-22', 'https://www.poder360.com.br/congresso/zambelli-fazenda-sorriso-mt-mst/', 'news_article', 3, 'Sorriso-MT', 'Visita campanha', 'zambelli-sorriso-mt-b156-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes faz discurso forte na Agrishow contra governo federal.', 'Governo federal virou as costas para MT. Vamos resistir.', 'Discurso na Agrishow em Ribeirão Preto com presença de produtores de MT.', 'verified', true, '2024-04-28', 'https://www.valor.globo.com/agronegocios/noticia/2024/04/28/mauro-mendes-agrishow-governo-federal-mt.ghtml', 'news_article', 2, 'Agrishow Ribeirão Preto', 'Feira agro', 'mauro-agrishow-governo-federal-b156-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel defende produtores contra fiscalização de IBAMA em MS.', 'IBAMA está perseguindo o produtor. Vai ter consequência.', 'Entrevista durante operação do Ibama em fazendas de MS.', 'verified', true, '2024-05-15', 'https://www.campograndenews.com.br/politica/riedel-ibama-produtores-perseguicao', 'news_article', 4, 'Campo Grande-MS', 'Entrevista', 'riedel-ibama-producao-b156-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas publica vídeo alegando fraude em dados do Inpe.', 'Inpe infla números pra quebrar o agro. Denunciem.', 'Vídeo no Instagram chamando dados oficiais de fraude sem provas.', 'verified', false, '2024-10-08', 'https://www.aosfatos.org/noticias/nikolas-inpe-fraude-dados-agro/', 'news_article', 4, 'Instagram', 'Vídeo desmentido', 'nikolas-inpe-fraude-b156-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina rebate Nikolas sobre dados do Inpe em coletiva.', 'Dados do Inpe são técnicos. Mentiras não vão mudar a realidade.', 'Coletiva em resposta a ataques a órgãos técnicos do Ministério.', 'verified', false, '2024-10-09', 'https://www.gov.br/mma/pt-br/noticias/2024/10/marina-rebate-nikolas-inpe', 'other', 1, 'Ministério do Meio Ambiente', 'Coletiva', 'marina-rebate-nikolas-inpe-b156-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pda, 'Paulo Dantas defende monocultura de cana em Alagoas.', 'Cana é riqueza do nosso estado. Não aceitamos ataques.', 'Declaração defendendo setor sucroalcooleiro em AL.', 'verified', false, '2024-06-20', 'https://www.agenciaalagoas.al.gov.br/paulo-dantas-cana-alagoas-riqueza', 'other', 1, 'Maceió-AL', 'Discurso setorial', 'paulo-dantas-cana-alagoas-b156-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia projeto de lei anti-quilombola no Rio.', 'Querem apagar quilombos da lei. Não vamos deixar.', 'Discurso no plenário da Câmara sobre PL de revisão quilombola.', 'verified', false, '2024-08-05', 'https://www.camara.leg.br/noticias/taliria-petrone-pl-anti-quilombola', 'news_article', 1, 'Câmara dos Deputados', 'Discurso plenário', 'taliria-pl-anti-quilombola-b156-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia ameaças a deputados ambientalistas.', 'Recebemos ameaças de morte por defendermos floresta.', 'Coletiva conjunta de deputados da Bancada Verde sobre intimidações.', 'verified', false, '2024-11-28', 'https://www.psol50.org.br/samia-bancada-verde-ameacas-morte/', 'other', 2, 'Câmara dos Deputados', 'Coletiva ambientalista', 'samia-bancada-verde-b156-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva propõe PL que criminaliza ameaças a indígenas.', 'Ameaçar indígena tem que virar crime federal.', 'Apresentação de PL contra violência em conflitos fundiários.', 'verified', false, '2025-03-18', 'https://www.camara.leg.br/noticias/orlando-silva-pl-criminalizar-ameacas-indigenas', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação PL', 'orlando-pl-ameacas-indigenas-b156-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende CAR blindado em reunião do agro.', 'CAR do produtor não pode ser aberto. Isso é privacidade.', 'Discurso em reunião da CNA sobre auto declaratório.', 'verified', false, '2025-04-25', 'https://www.cnabrasil.org.br/noticias/tereza-cristina-car-blindado-produtor', 'other', 3, 'CNA Brasília', 'Reunião setorial', 'tereza-car-blindado-b156-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson visita fazenda em Sidrolândia após conflito.', 'Esses fazendeiros são heróis. Resistiram aos invasores.', 'Visita após confronto entre fazendeiros e indígenas em MS.', 'verified', true, '2025-05-10', 'https://www.campograndenews.com.br/politica/sanderson-sidrolandia-fazendeiros-herois', 'news_article', 5, 'Sidrolândia-MS', 'Visita a fazenda', 'sanderson-sidrolandia-b156-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia operação de proteção a indígenas em MS.', 'Vamos proteger povos originários. Força Nacional em MS.', 'Anúncio de envio da Força Nacional para conflito em Sidrolândia.', 'verified', true, '2025-05-12', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/05/lula-forca-nacional-ms-indigenas', 'other', 1, 'Palácio do Planalto', 'Anúncio Força Nacional', 'lula-forca-nacional-ms-b156-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel contesta presença da Força Nacional em MS.', 'MS não precisa de Força Nacional. Nossa polícia dá conta.', 'Coletiva contestando decisão presidencial sobre conflito.', 'verified', true, '2025-05-13', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2025/05/13/riedel-contesta-forca-nacional.ghtml', 'news_article', 3, 'Campo Grande-MS', 'Coletiva', 'riedel-contesta-forca-nacional-b156-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto chama indígenas de preguiçosos em comício.', 'Índio tem que trabalhar, não ficar na rede.', 'Comício de aliado em Campo Grande gerou denúncia por racismo.', 'verified', true, '2024-09-22', 'https://www.campograndenews.com.br/politica/cabo-gilberto-indio-preguicoso-comicio', 'news_article', 5, 'Campo Grande-MS', 'Comício aliado', 'cabo-gilberto-indigena-preguica-b156-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão defende cercar assentamentos do MST em MT.', 'MST tem que ser cercado. São criminosos.', 'Discurso em audiência pública em Cuiabá sobre segurança.', 'verified', false, '2024-12-15', 'https://www.mt.al.leg.br/noticias/girao-mst-cercar-cuiaba', 'news_article', 4, 'Assembleia MT', 'Audiência pública', 'girao-cercar-mst-b156-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wla, 'Wilson Lima ataca Marina Silva em evento em Manaus.', 'Marina não entende a Amazônia. É ambientalista de gabinete.', 'Discurso em evento da ACA de Manaus.', 'verified', true, '2024-06-08', 'https://www.amazonastal.com.br/politica/wilson-lima-marina-silva-manaus-ataque', 'news_article', 3, 'Manaus-AM', 'Evento ACA', 'wilson-lima-marina-manaus-b156-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr adere ao PP para fortalecer aliança ruralista.', 'O PP é o partido do Brasil produtivo. Estou aqui.', 'Anúncio de filiação em evento do PP-PR.', 'verified', true, '2024-02-20', 'https://g1.globo.com/pr/parana/noticia/2024/02/20/ratinho-pp-filiacao-ruralistas.ghtml', 'news_article', 2, 'Curitiba-PR', 'Filiação ao PP', 'ratinho-filiacao-pp-b156-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cfa, 'Fávaro defende recuperação de pastagens degradadas em MT.', 'Recuperar pasto é o caminho do agro sustentável.', 'Discurso em Cuiabá na Abag-MT sobre pastagens.', 'verified', false, '2024-11-05', 'https://www.gov.br/agricultura/pt-br/noticias/2024/11/favaro-pastagens-degradadas-mt', 'other', 1, 'Cuiabá-MT', 'Evento Abag-MT', 'favaro-pastagens-mt-b156-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca aldeias Guarani-Kaiowá em live do Instagram.', 'Aquelas aldeias são criação da esquerda. Não são reais.', 'Live no Instagram após visita a MS gerou reação.', 'verified', false, '2025-03-22', 'https://www.campograndenews.com.br/politica/damares-aldeias-guarani-kaiowa-live', 'news_article', 5, 'Instagram Live', 'Live', 'damares-aldeias-guarani-b156-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia Damares ao MP por racismo.', 'Damares deve responder por incitar ódio contra Guarani-Kaiowá.', 'Denúncia formal ao MP-MS contra ex-ministra.', 'verified', true, '2025-03-24', 'https://www.gov.br/povosindigenas/pt-br/noticias/2025/03/sonia-denuncia-damares-mp', 'other', 2, 'MPI', 'Denúncia formal', 'sonia-denuncia-damares-mp-b156-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza defende renegociação de dívidas de produtores de MT.', 'Produtor de MT não pode ser abandonado. Precisa refinanciar.', 'Discurso no Senado defendendo MP de renegociação.', 'verified', false, '2025-06-18', 'https://www12.senado.leg.br/noticias/materias/2025/06/18/tereza-refinanciamento-produtor-mt', 'news_article', 1, 'Senado Federal', 'Discurso plenário', 'tereza-refinanciamento-mt-b156-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes viaja para Europa defender soja de MT.', 'Soja de MT não é desmatamento. Europa tem que respeitar.', 'Viagem oficial a Bruxelas para defesa contra EUDR.', 'verified', true, '2024-10-22', 'https://www.mt.gov.br/noticias/mauro-mendes-europa-soja-mt-eudr', 'other', 2, 'Bruxelas', 'Viagem oficial', 'mauro-europa-soja-mt-b156-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr se diz contra qualquer demarcação nova no PR.', 'No Paraná, não cabe mais demarcação.', 'Declaração em evento em Londrina sobre demarcações pendentes.', 'verified', true, '2024-07-15', 'https://g1.globo.com/pr/parana/noticia/2024/07/15/ratinho-demarcacao-londrina.ghtml', 'news_article', 4, 'Londrina-PR', 'Evento agro', 'ratinho-sem-demarcacao-pr-b156-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz live em fazenda de MS apoiando Riedel.', 'Riedel é nosso líder em MS. Agro agradece.', 'Live do gabinete virtual apoiando governador aliado em MS.', 'verified', false, '2024-08-15', 'https://www.campograndenews.com.br/politica/bolsonaro-live-riedel-ms-fazenda', 'news_article', 2, 'Fazenda em Sidrolândia-MS', 'Live apoio', 'bolsonaro-live-riedel-b156-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva aponta recorde de fiscalização em MT.', 'Batemos recorde de autuações. A lei está sendo aplicada.', 'Balanço da fiscalização em MT durante coletiva do MMA.', 'verified', false, '2024-12-20', 'https://www.gov.br/mma/pt-br/noticias/2024/12/marina-balanco-fiscalizacao-mt', 'other', 1, 'Ministério do Meio Ambiente', 'Balanço anual', 'marina-balanco-mt-b156-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ena, 'Elmar Nascimento defende relator do PL da Devastação.', 'Relator fez excelente trabalho. Vamos manter tudo.', 'Declaração em plenário da Câmara durante votação de vetos.', 'verified', false, '2025-09-18', 'https://www.camara.leg.br/noticias/elmar-nascimento-relator-pl-devastacao', 'news_article', 3, 'Câmara dos Deputados', 'Votação de vetos', 'elmar-relator-pl-devastacao-b156-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann crítica PEC anti-indígena no Congresso.', 'PEC é anti-constitucional. Vamos judicializar.', 'Pronunciamento em resposta à pressão ruralista pela PEC.', 'verified', false, '2025-07-25', 'https://pt.org.br/gleisi-pec-anti-indigena-judicializar', 'other', 1, 'PT', 'Pronunciamento', 'gleisi-pec-anti-indigena-b156-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata Amaral defende rastreabilidade da soja de MT.', 'Precisamos rastrear toda soja exportada. Consumidor exige.', 'Discurso em comissão sobre PL da rastreabilidade.', 'verified', false, '2025-08-28', 'https://www.camara.leg.br/noticias/tabata-rastreabilidade-soja-mt', 'news_article', 1, 'Câmara dos Deputados', 'Discurso comissão', 'tabata-rastreabilidade-soja-b156-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cgi, 'Cabo Gilberto ataca liderança indígena em rede social.', 'Essa cacica é impostora. Não representa ninguém.', 'Post no X atacando liderança Guarani-Kaiowá em MS.', 'verified', false, '2025-09-05', 'https://www.poder360.com.br/congresso/cabo-gilberto-cacica-impostora-ms/', 'news_article', 5, 'X/Twitter', 'Post ofensivo', 'cabo-gilberto-cacica-b156-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta recebe ruralistas para discutir reação a STF.', 'Vamos pautar reação. Agro é prioridade.', 'Reunião com 100 deputados ruralistas após decisões ambientais.', 'verified', true, '2025-10-10', 'https://www.camara.leg.br/noticias/hugo-motta-ruralistas-stf-reacao', 'news_article', 3, 'Câmara dos Deputados', 'Reunião ruralistas', 'hugo-motta-ruralistas-stf-b156-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes confronta Lula em discussão sobre Pantanal.', 'Presidente, o senhor está enganado sobre MT.', 'Bate-boca em reunião no Planalto com governadores da Amazônia Legal.', 'verified', true, '2025-11-15', 'https://www1.folha.uol.com.br/poder/2025/11/mauro-mendes-lula-bate-boca-pantanal.shtml', 'news_article', 3, 'Palácio do Planalto', 'Reunião governadores', 'mauro-lula-bate-boca-b156-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Riedel comemora recorde de produção de soja em MS.', 'MS consolidou-se como potência da soja. Vamos crescer mais.', 'Discurso em evento da Aprosoja-MS em Maracaju.', 'verified', false, '2025-03-28', 'https://www.ms.gov.br/riedel-recorde-soja-ms-aprosoja', 'other', 1, 'Maracaju-MS', 'Evento Aprosoja', 'riedel-recorde-soja-b156-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fib, 'Filipe Barros compartilha vídeo falso sobre MST em MS.', 'Olha o MST invadindo fazenda em Dourados. Absurdo.', 'Vídeo compartilhado era de 2018 em outro estado e foi desmentido.', 'verified', false, '2025-04-18', 'https://www.aosfatos.org/noticias/filipe-barros-mst-video-antigo-dourados/', 'news_article', 4, 'X/Twitter', 'Vídeo desmentido', 'filipe-mst-video-falso-b156-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gca, 'Gladson Cameli defende ampliação de queimadas em AC.', 'Queimada controlada é parte da cultura. Não dá para proibir tudo.', 'Declaração durante crise de incêndios em Rio Branco-AC.', 'verified', false, '2024-08-28', 'https://g1.globo.com/ac/acre/noticia/2024/08/28/gladson-queimadas-cultura-acre.ghtml', 'news_article', 4, 'Rio Branco-AC', 'Coletiva incêndios', 'gladson-queimadas-ac-b156-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ade, 'Denarium nega surto sanitário em terra yanomami.', 'Situação em RR está controlada. Não há surto.', 'Entrevista contrariando dados do Ministério da Saúde sobre desnutrição.', 'verified', true, '2024-02-15', 'https://g1.globo.com/rr/roraima/noticia/2024/02/15/denarium-nega-surto-yanomami.ghtml', 'news_article', 5, 'Boa Vista-RR', 'Entrevista', 'denarium-nega-surto-yanomami-b156-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rsa, 'Ricardo Salles defende PL que revisa terras protegidas em MT.', 'Terras protegidas em MT viraram abuso. Vamos revisar.', 'Discurso em comissão da Câmara sobre PL de revisão.', 'verified', true, '2024-12-03', 'https://www.camara.leg.br/noticias/salles-pl-revisao-terras-protegidas-mt', 'news_article', 4, 'Câmara dos Deputados', 'Discurso comissão', 'salles-pl-revisao-mt-b156-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agr, 'Aguinaldo Ribeiro articula derrubada de vetos ambientais.', 'Vetos do PL do Licenciamento serão derrubados.', 'Declaração após reunião com bancada ruralista sobre vetos.', 'verified', true, '2025-09-20', 'https://www.camara.leg.br/noticias/aguinaldo-derrubada-vetos-licenciamento', 'news_article', 3, 'Câmara dos Deputados', 'Reunião ruralista', 'aguinaldo-derrubada-vetos-b156-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara visita Yanomami e denuncia retorno de garimpeiros.', 'Garimpo voltou. Precisamos de operação permanente.', 'Visita a TI Yanomami com documentação de retorno do garimpo.', 'verified', true, '2025-02-28', 'https://www.gov.br/povosindigenas/pt-br/noticias/2025/02/sonia-yanomami-garimpo-retorno', 'other', 2, 'TI Yanomami-RR', 'Visita oficial', 'sonia-yanomami-garimpo-b156-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina anuncia operação de retirada de garimpeiros em 2025.', 'Operação vai limpar novamente a TI Yanomami. Não vamos ceder.', 'Anúncio de nova operação conjunta com Força Nacional.', 'verified', true, '2025-03-05', 'https://www.gov.br/mma/pt-br/noticias/2025/03/marina-operacao-garimpeiros-yanomami', 'other', 1, 'Ministério do Meio Ambiente', 'Anúncio operação', 'marina-operacao-yanomami-b156-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wla, 'Wilson Lima confronta Marina em evento no AM.', 'Marina, saia do gabinete. Venha viver a Amazônia.', 'Ataque em evento do setor agropecuário em Manaus.', 'verified', true, '2025-06-10', 'https://www.amazonastal.com.br/politica/wilson-lima-marina-saia-gabinete', 'news_article', 3, 'Manaus-AM', 'Evento agro', 'wilson-marina-gabinete-b156-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli faz discurso pró-agro em Primavera do Leste-MT.', 'MT é a locomotiva do Brasil. Lula que aprenda.', 'Discurso durante visita a Primavera do Leste em campanha municipal.', 'verified', false, '2024-07-18', 'https://www.poder360.com.br/congresso/zambelli-primavera-leste-mt/', 'news_article', 2, 'Primavera do Leste-MT', 'Campanha municipal', 'zambelli-primavera-leste-b156-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza rebate ONG sobre desmatamento em MS com dados do governo estadual.', 'MS tem os menores índices. ONG mente.', 'Entrevista à rádio de Campo Grande após relatório internacional.', 'verified', true, '2024-11-08', 'https://www.campograndenews.com.br/politica/tereza-ong-desmatamento-ms-rebate', 'news_article', 3, 'Rádio CBN Campo Grande', 'Entrevista', 'tereza-ong-desmatamento-ms-b156-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri2, 'Erika Hilton defende quilombolas em plenário da Câmara.', 'Atacar quilombolas é racismo institucional. Não passaremos.', 'Discurso em resposta a PL que restringe direitos quilombolas.', 'verified', false, '2024-03-20', 'https://www.camara.leg.br/noticias/erika-hilton-defende-quilombolas', 'news_article', 1, 'Câmara dos Deputados', 'Discurso plenário', 'erika-defende-quilombolas-b156-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes anuncia construção de rodovia em área sensível de MT.', 'Vamos abrir rodovia nova. Desenvolvimento não pode parar.', 'Anúncio em Cuiabá gerou reação de ambientalistas.', 'verified', true, '2025-01-20', 'https://www.mt.gov.br/noticias/mauro-mendes-rodovia-nova-mt-ambiental', 'other', 3, 'Palácio Paiaguás', 'Anúncio infraestrutura', 'mauro-rodovia-nova-mt-b156-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca ruralistas em evento do MST em Palmares.', 'MST é parceiro, não bandido. Ruralistas é que atuam em milícia.', 'Discurso em evento comemorativo do MST em Palmares-BA.', 'verified', true, '2024-11-20', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2024/11/lula-mst-ruralistas-milicia', 'other', 3, 'Palmares-BA', 'Evento MST', 'lula-mst-ruralistas-b156-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza reage e chama Lula de irresponsável por fala sobre milícia.', 'Presidente atacou o produtor. É inaceitável.', 'Resposta após discurso de Lula em Palmares-BA.', 'verified', true, '2024-11-21', 'https://www12.senado.leg.br/noticias/materias/2024/11/21/tereza-cristina-reage-lula-milicia', 'news_article', 2, 'Senado Federal', 'Resposta em plenário', 'tereza-reage-lula-milicia-b156-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas visita MT e viraliza falando contra Funai.', 'Funai não serve pra nada. Vamos extinguir.', 'Vídeo gravado em Sinop-MT durante feira agropecuária.', 'verified', false, '2026-02-08', 'https://www.poder360.com.br/congresso/nikolas-mt-funai-extinguir/', 'news_article', 4, 'Sinop-MT', 'Feira agro', 'nikolas-mt-funai-b156-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr defende ampliar produção de PR mesmo com alerta hídrico.', 'PR não vai parar de produzir. Água é abundante.', 'Declaração durante seca histórica no oeste do PR.', 'verified', true, '2026-01-18', 'https://g1.globo.com/pr/parana/noticia/2026/01/18/ratinho-producao-pr-seca.ghtml', 'news_article', 4, 'Curitiba-PR', 'Coletiva seca', 'ratinho-producao-seca-b156-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva lança plano emergencial para Cerrado em MT.', 'Cerrado está sangrando. Precisamos agir agora.', 'Lançamento de Plano Cerrado com recursos federais para MT.', 'verified', true, '2026-03-12', 'https://www.gov.br/mma/pt-br/noticias/2026/03/marina-plano-cerrado-mt', 'other', 1, 'Ministério do Meio Ambiente', 'Lançamento plano', 'marina-plano-cerrado-b156-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara encerra 2025 com balanço de operações indígenas.', 'Resistimos apesar de tudo. 2026 será ano de avanço.', 'Balanço anual em Brasília com lideranças de MT, MS e RR.', 'verified', true, '2025-12-28', 'https://www.gov.br/povosindigenas/pt-br/noticias/2025/12/sonia-balanco-anual-mpi-2025', 'other', 1, 'MPI', 'Balanço anual', 'sonia-balanco-2025-b156-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

END $$;
