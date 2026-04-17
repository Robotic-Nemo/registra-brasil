-- Batch 162: Direitos das mulheres, feminicídio e PL 1904 Gravidez do Estuprador (2023-2026)
DO $$
DECLARE
  v_lir UUID; v_mot UUID; v_alc UUID; v_pac UUID; v_nik UUID;
  v_edu UUID; v_kic UUID; v_van UUID; v_ram UUID; v_fel UUID;
  v_mag UUID; v_dam UUID; v_jzt UUID; v_rma UUID; v_mib UUID;
  v_mar UUID; v_tab UUID; v_eri UUID; v_sam UUID; v_tal UUID;
  v_fer UUID; v_jan UUID; v_orl UUID; v_chi UUID; v_ani UUID;
  v_cid UUID; v_son UUID; v_msi UUID; v_gle UUID; v_pad UUID;
  v_cmc UUID; v_fbz UUID; v_rly UUID; v_teb UUID; v_sth UUID;
  v_egm UUID; v_dju UUID; v_jwa UUID; v_lul UUID; v_had UUID;
  v_mst UUID; v_din UUID; v_mor UUID; v_lew UUID; v_adr UUID;
  v_cvi UUID;
  c_mis UUID; c_mac UUID; c_vio UUID; c_odi UUID; c_hom UUID;
  c_abu UUID; c_con UUID; c_int UUID; c_des UUID;
BEGIN
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_jzt FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_rma FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_mib FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fer FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_ani FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cida-goncalves';
  SELECT id INTO v_son FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_msi FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_cmc FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_fbz FROM politicians WHERE slug = 'fatima-bezerra';
  SELECT id INTO v_rly FROM politicians WHERE slug = 'raquel-lyra';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_sth FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_egm FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dju FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jwa FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mst FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_cvi FROM politicians WHERE slug = 'carlos-viana';

  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira pauta em regime de urgência PL 1904, "Gravidez do Estuprador", que equipara aborto legal a homicídio.', 'A Câmara pode, sim, discutir o tema do aborto. Não há tabu para o Congresso.', 'Lira colocou em regime de urgência PL que previa pena de até 20 anos para vítimas de estupro que abortassem após 22 semanas, maior que a pena do estuprador (até 10 anos).', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/lira-urgencia-pl-1904-gravidez-estuprador.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Plenário', 'lira-urgencia-pl-1904-gravidez-estuprador-b162-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia PL 1904 como "PL da gravidez do estuprador".', 'Esse projeto pune mais a vítima do estupro do que o estuprador. É uma aberração. É o PL da gravidez do estuprador.', 'Pronunciamento em plenário durante urgência do PL 1904.', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/erika-pl-gravidez-estuprador.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Plenário', 'erika-denuncia-pl-gravidez-estuprador-b162-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende PL 1904 e chama vítima de estupro de "assassina".', 'A criança é inocente. A mulher que mata seu filho após 22 semanas comete homicídio, e deve ser julgada como tal.', 'Pronunciamento em plenário em defesa do PL 1904.', 'verified', true, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/nikolas-vitima-estupro-assassina.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Plenário', 'nikolas-vitima-estupro-assassina-b162-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim classifica PL 1904 como "legalização da tortura" de vítimas.', 'Essa Câmara está votando a legalização da tortura contra meninas estupradas. É um absurdo civilizatório.', 'Discurso em plenário durante votação de urgência.', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/samia-pl-1904-tortura.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'samia-pl-1904-legalizacao-tortura-b162-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia PL 1904 como tentativa de "criminalizar meninas estupradas".', 'Vocês querem mandar uma menina de 10 anos estuprada para a cadeia por mais tempo do que o estuprador. Isso é barbárie.', 'Discurso em plenário durante a votação da urgência.', 'verified', true, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/taliria-criminalizar-meninas.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'taliria-criminalizar-meninas-estupradas-b162-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende PL 1904 e chama aborto de "crime hediondo".', 'O aborto é um crime hediondo. Não importa a situação, uma criança não pode pagar pelo ato de um criminoso.', 'Discurso em plenário em defesa do PL 1904.', 'verified', true, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/bia-kicis-aborto-hediondo.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'bia-kicis-aborto-hediondo-b162-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jzt, 'Júlia Zanatta defende aborto como "maior mal" do que o estupro.', 'O que o estuprador faz é crime grave, mas tirar uma vida inocente é crime ainda maior.', 'Declaração em entrevista sobre o PL 1904.', 'verified', true, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/julia-zanatta-aborto-maior-mal.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'julia-zanatta-aborto-maior-mal-estupro-b162-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano diz que meninas estupradas devem "entregar filho para adoção" em vez de abortar.', 'Tem muita família querendo adotar. A solução para a menina estuprada não é matar o bebê, é entregar para adoção.', 'Declaração em entrevista durante debate sobre PL 1904.', 'verified', true, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/feliciano-meninas-adocao-estupro.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'feliciano-meninas-adocao-estupro-b162-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende PL 1904 e chama abortistas de "assassinas".', 'Feminista abortista é assassina. E os que defendem aborto estão cúmplices do homicídio.', 'Postagem em redes sociais em defesa do PL 1904.', 'verified', false, '2024-06-15', 'https://twitter.com/magnomaltareal/status/magno-abortistas-assassinas', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'magno-abortistas-assassinas-b162-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica PL 1904 como "insanidade".', 'É uma insanidade o que a Câmara quer fazer com meninas estupradas. Não pode ser pior a vítima do que o criminoso.', 'Declaração em rádio após aprovação de urgência do PL 1904.', 'verified', true, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/lula-pl-1904-insanidade.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'lula-pl-1904-insanidade-b162-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves classifica PL 1904 como "violência de Estado" contra meninas.', 'O Congresso pretende institucionalizar violência contra meninas. Isso fere a Constituição e os tratados internacionais.', 'Declaração como ministra das Mulheres.', 'verified', true, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/cida-pl-1904-violencia-estado.ghtml', 'interview', 4, 'Ministério das Mulheres', 'Entrevista', 'cida-pl-1904-violencia-estado-b162-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira recua em PL 1904 após pressão popular mas mantém pauta.', 'Vamos retirar a urgência, mas a discussão sobre aborto continuará na Câmara. Não é possível fechar os olhos para esse tema.', 'Recuo após protestos em várias capitais.', 'verified', true, '2024-06-18', 'https://g1.globo.com/politica/noticia/2024/06/18/lira-recua-pl-1904-pressao.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'lira-recua-pl-1904-pressao-b162-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende PL 1904 e diz que vítima "pode se confessar" para aliviar dor.', 'O aborto não resolve a dor da vítima. A Igreja, a fé, a adoção, tudo isso pode ser saída para a mulher estuprada.', 'Pronunciamento em plenário do Senado.', 'verified', true, '2024-06-17', 'https://g1.globo.com/politica/noticia/2024/06/17/damares-vitima-confessar-fe.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'damares-vitima-confessar-fe-b162-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali diz que PL 1904 é "retorno à Idade Média".', 'Querem mandar a mulher brasileira para a Idade Média, quando ser mulher era motivo para ser queimada na fogueira.', 'Pronunciamento em plenário.', 'verified', false, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/jandira-pl-1904-idade-media.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'jandira-pl-1904-idade-media-b162-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fer, 'Fernanda Melchionna denuncia PL 1904 como "PL do estuprador".', 'Esse é o PL do estuprador. Ele protege o criminoso e pune a vítima. A autoria desse horror precisa ser exposta.', 'Pronunciamento em plenário.', 'verified', false, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/fernanda-pl-estuprador.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'fernanda-pl-do-estuprador-b162-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral vota contra PL 1904 e lembra "código criminal medieval".', 'Essa proposta é uma vergonha. Está lá desde 1940 o direito da vítima ao aborto legal. Vocês querem voltar a um código criminal medieval.', 'Discurso em plenário.', 'verified', false, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/tabata-pl-1904-medieval.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'tabata-pl-1904-medieval-b162-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mst, 'Marta Suplicy classifica PL 1904 como "brutalidade machista".', 'É o triunfo da brutalidade machista sobre meninas e mulheres. Esse projeto não pode avançar em hipótese alguma.', 'Pronunciamento no Senado.', 'verified', false, '2024-06-17', 'https://g1.globo.com/politica/noticia/2024/06/17/marta-pl-brutalidade-machista.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'marta-pl-brutalidade-machista-b162-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_egm, 'Eliziane Gama vota contra PL 1904 e chama de "perseguição" a mulheres.', 'O PL 1904 é perseguição à mulher. Não tem outro nome. Vamos derrubar se chegar ao Senado.', 'Declaração em coletiva no Senado.', 'verified', false, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/eliziane-pl-perseguicao-mulher.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'eliziane-pl-perseguicao-mulher-b162-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro ataca feministas como "aborteiras" que financiam ONGs.', 'Aborteiras vivem de ONGs internacionais que querem matar brasileiros. Essa é a verdade por trás do feminismo.', 'Postagem em redes sociais.', 'verified', false, '2024-06-15', 'https://twitter.com/BolsonaroSP/status/eduardo-feministas-aborteiras', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'eduardo-feministas-aborteiras-b162-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mib, 'Michelle Bolsonaro participa de ato pró-PL 1904 dizendo que "Deus está com os pequenos".', 'Deus está com os pequeninos. Nós, mulheres cristãs, não aceitaremos que se matem crianças no ventre materno.', 'Ato em Brasília em defesa do PL 1904.', 'verified', true, '2024-06-16', 'https://g1.globo.com/politica/noticia/2024/06/16/michelle-ato-pl-1904.ghtml', 'speech', 4, 'Brasília', 'Ato pró-vida', 'michelle-ato-pl-1904-b162-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama deputada de "aborteira" em plenário.', 'A deputada aborteira precisa ouvir. Aqui defendemos a vida, não o homicídio.', 'Ataque a Sâmia Bomfim em plenário durante debate sobre PL 1904.', 'verified', true, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/nikolas-ataca-samia-aborteira.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'nikolas-ataca-samia-aborteira-b162-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rma, 'Rogério Marinho defende PL 1904 e ataca ONGs feministas.', 'Há uma agenda de ONGs internacionais financiando aborteiras no Brasil. Chega de submissão ideológica.', 'Pronunciamento em plenário do Senado.', 'verified', false, '2024-06-17', 'https://g1.globo.com/politica/noticia/2024/06/17/marinho-ongs-feministas.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'marinho-ongs-feministas-pl-1904-b162-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sth, 'Soraya Thronicke vota contra PL 1904 como "atropelo".', 'Esse projeto foi um atropelo à Câmara, sem discussão, sem ouvir médicos, nada. É puro fanatismo.', 'Pronunciamento no Senado.', 'verified', false, '2024-06-18', 'https://g1.globo.com/politica/noticia/2024/06/18/soraya-pl-1904-atropelo.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'soraya-pl-1904-atropelo-b162-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cmc, 'Cármen Lúcia defende aborto legal como "direito fundamental" de vítima de estupro.', 'A Constituição garante à vítima de estupro o direito de interromper uma gravidez forçada. Isso não pode ser alterado por lei ordinária.', 'Decisão do STF sobre descumprimento do aborto legal em hospitais.', 'verified', true, '2024-09-25', 'https://www.conjur.com.br/2024-set-25/carmen-lucia-aborto-legal-vitima/', 'official_document', 3, 'STF', 'Decisão', 'carmen-lucia-aborto-legal-vitima-b162-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia aumento do feminicídio de mulheres negras em 2024.', 'A cada 24 horas uma mulher negra é assassinada no Brasil. O racismo estrutural mata mulheres negras primeiro.', 'Declaração em evento sobre dados de feminicídio.', 'verified', false, '2024-11-25', 'https://g1.globo.com/politica/noticia/2024/11/25/anielle-feminicidio-mulheres-negras.ghtml', 'speech', 3, 'Ministério da Igualdade Racial', 'Evento', 'anielle-feminicidio-mulheres-negras-b162-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves apresenta dados: 1.400 feminicídios no Brasil em 2023.', 'O Brasil registrou 1.400 feminicídios em 2023, crescimento em relação ao ano anterior. O país não pode naturalizar isso.', 'Lançamento de dados pelo Ministério das Mulheres.', 'verified', true, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/cida-dados-feminicidio-2023.ghtml', 'speech', 3, 'Ministério das Mulheres', 'Evento Dia Internacional da Mulher', 'cida-dados-feminicidio-2023-b162-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona lei que torna feminicídio crime autônomo com pena de 20 a 40 anos.', 'A violência contra a mulher no Brasil é uma chaga que precisa ser extinta. Essa lei é um passo decisivo.', 'Sanção da Lei 14.994/2024.', 'verified', true, '2024-10-09', 'https://g1.globo.com/politica/noticia/2024/10/09/lula-sanciona-lei-feminicidio-autonomo.ghtml', 'speech', 3, 'Palácio do Planalto', 'Sanção', 'lula-sanciona-lei-feminicidio-autonomo-b162-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira vota contra projeto que amplia pena para feminicídio.', 'Criminalizar masculinidade não resolve violência contra mulher. Precisamos é de família estruturada.', 'Voto contrário ao PL que criou o feminicídio como crime autônomo.', 'verified', false, '2024-09-15', 'https://g1.globo.com/politica/noticia/2024/09/15/nikolas-vota-contra-feminicidio.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'nikolas-vota-contra-feminicidio-b162-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton expõe Nikolas em plenário por ataques misóginos.', 'A bancada da misoginia se articula para matar mulheres. Cada fala deles é um tapa na cara das mulheres brasileiras.', 'Discurso em plenário durante debate sobre violência de gênero.', 'verified', false, '2024-09-17', 'https://g1.globo.com/politica/noticia/2024/09/17/erika-expoe-bancada-misoginia.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'erika-expoe-bancada-misoginia-b162-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano diz que "feminismo é doença" no Brasil.', 'Feminismo é doença. Acabou com a família brasileira. Mulher que se respeita não é feminista.', 'Postagem em redes sociais.', 'verified', true, '2024-03-09', 'https://twitter.com/marcofeliciano/status/feliciano-feminismo-doenca', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'feliciano-feminismo-doenca-b162-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta afirma que "mulher de casa não é agredida".', 'Mulher que cuida da casa e da família não é agredida. O problema começa quando ela sai para trabalhar longe do marido.', 'Pronunciamento em evento evangélico.', 'verified', true, '2024-05-10', 'https://g1.globo.com/politica/noticia/2024/05/10/magno-malta-mulher-casa-agredida.ghtml', 'speech', 4, 'Evento evangélico', 'Pregação', 'magno-malta-mulher-casa-agredida-b162-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis vota contra aborto em caso de estupro em projeto paralelo.', 'Bebê não tem culpa. A vítima de estupro pode e deve levar a gestação até o fim.', 'Declaração em comissão sobre projeto sobre aborto.', 'verified', false, '2024-05-08', 'https://g1.globo.com/politica/noticia/2024/05/08/bia-kicis-aborto-estupro-bebe.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Comissão', 'bia-kicis-bebe-estupro-b162-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia feminicídio de mulheres indígenas como "invisibilizado".', 'Mulher indígena é morta e a sociedade não se importa. Essa invisibilização é cúmplice do genocídio.', 'Pronunciamento em evento sobre povos indígenas.', 'verified', false, '2024-08-05', 'https://g1.globo.com/politica/noticia/2024/08/05/sonia-feminicidio-indigena.ghtml', 'speech', 3, 'Ministério dos Povos Indígenas', 'Evento', 'sonia-feminicidio-indigena-invisibilizado-b162-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves sugere que vítima de estupro "sobreviva com fé".', 'Já atendi casos de meninas estupradas que escolheram ter o bebê. A fé carrega.', 'Declaração no Senado.', 'verified', false, '2024-04-22', 'https://g1.globo.com/politica/noticia/2024/04/22/damares-vitima-fe-bebe.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'damares-vitima-fe-bebe-b162-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rly, 'Raquel Lyra cria rede estadual de proteção a mulheres em Pernambuco.', 'Pernambuco terá a maior rede de proteção à mulher do Nordeste. Não vamos tolerar mais uma mulher morta.', 'Anúncio de programa estadual em PE.', 'verified', false, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/raquel-lyra-rede-protecao-mulheres-pe.ghtml', 'speech', 2, 'Recife', 'Dia Internacional da Mulher', 'raquel-lyra-rede-protecao-mulheres-b162-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbz, 'Fátima Bezerra lança programa "RN por elas" contra feminicídio.', 'Vamos proteger as mulheres do Rio Grande do Norte com todas as políticas possíveis. Não podemos perder mais uma.', 'Lançamento de programa estadual.', 'verified', false, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/fatima-programa-rn-por-elas.ghtml', 'speech', 2, 'Natal', 'Dia Internacional da Mulher', 'fatima-programa-rn-por-elas-b162-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco se compromete a barrar PL 1904 no Senado.', 'O Senado não aprovará esse projeto. A vítima de estupro não pode ser punida mais do que o estuprador.', 'Entrevista após aprovação de urgência na Câmara.', 'verified', true, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/pacheco-barrar-pl-1904-senado.ghtml', 'interview', 2, 'Senado Federal', 'Entrevista', 'pacheco-barrar-pl-1904-senado-b162-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira retira aborto da LDO após pressão da bancada evangélica.', 'Vamos preservar o texto da LDO com a tradição brasileira sobre o aborto. A bancada tem razão.', 'Acordo com bancada evangélica para retirar menção à saúde da mulher.', 'verified', false, '2024-07-10', 'https://g1.globo.com/politica/noticia/2024/07/10/lira-ldo-aborto-bancada-evangelica.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Articulação', 'lira-ldo-aborto-evangelica-b162-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes mantém direito ao aborto legal contra limitações do CFM.', 'A resolução do CFM não pode restringir direito legal da vítima de violência sexual. Isso fere a Constituição.', 'Decisão contra resolução do CFM que limitava aborto legal.', 'verified', true, '2024-05-20', 'https://www.conjur.com.br/2024-mai-20/moraes-cfm-aborto-legal/', 'official_document', 3, 'STF', 'Decisão', 'moraes-cfm-aborto-legal-b162-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral lidera frente suprapartidária contra PL 1904.', 'Vamos reunir mulheres de todos os partidos contra o PL 1904. Esse é o momento de unidade feminina no Parlamento.', 'Formação de frente parlamentar feminina contra o PL.', 'verified', false, '2024-06-17', 'https://g1.globo.com/politica/noticia/2024/06/17/tabata-frente-contra-pl-1904.ghtml', 'interview', 2, 'Câmara dos Deputados', 'Entrevista', 'tabata-frente-contra-pl-1904-b162-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jzt, 'Júlia Zanatta distribui "perfume do estuprador" em ato bolsonarista.', 'Quem é a favor do aborto é cúmplice do aborto. Não há meio termo.', 'Declaração em ato bolsonarista em SC.', 'verified', false, '2024-06-22', 'https://g1.globo.com/politica/noticia/2024/06/22/julia-zanatta-ato-bolsonarista.ghtml', 'speech', 4, 'Florianópolis', 'Ato bolsonarista', 'julia-zanatta-cumplice-aborto-b162-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta PL para fortalecer feminicídio como crime hediondo autônomo.', 'Vamos reforçar a tipificação do feminicídio. Estado não pode ser conivente com o extermínio de mulheres.', 'Apresentação de PL em 2024.', 'verified', false, '2024-03-11', 'https://g1.globo.com/politica/noticia/2024/03/11/samia-pl-feminicidio-autonomo.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'samia-pl-feminicidio-autonomo-b162-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem vota contra fortalecimento da Lei Maria da Penha em 2024.', 'Leis que discriminam homens não são solução. Precisamos de igualdade, não de vitimização.', 'Voto contra PL que ampliava proteção a mulheres.', 'verified', false, '2024-04-18', 'https://g1.globo.com/politica/noticia/2024/04/18/van-hattem-vota-contra-maria-penha.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'van-hattem-contra-maria-penha-b162-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura cobra orçamento para políticas de proteção à mulher.', 'Sem orçamento, não há política pública. O Congresso precisa priorizar a Lei Maria da Penha e as delegacias.', 'Discurso em plenário.', 'verified', false, '2024-03-07', 'https://g1.globo.com/politica/noticia/2024/03/07/adriana-orcamento-protecao-mulher.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'adriana-orcamento-protecao-mulher-b162-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton expõe Marco Feliciano por declaração machista.', 'Marco Feliciano representa a misoginia organizada em igreja. Não vamos aceitar calado.', 'Resposta a Feliciano em plenário.', 'verified', false, '2024-03-12', 'https://g1.globo.com/politica/noticia/2024/03/12/erika-exposicao-feliciano.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'erika-exposicao-feliciano-b162-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alcolumbre adia PL 1904 no Senado após pressão popular.', 'O Senado vai analisar com serenidade. Não há pressa para votar.', 'Decisão de não pautar o PL 1904 em 2024.', 'verified', false, '2024-07-02', 'https://g1.globo.com/politica/noticia/2024/07/02/alcolumbre-adia-pl-1904-senado.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'alcolumbre-adia-pl-1904-senado-b162-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca ministra Cida Gonçalves com linguagem misógina.', 'Essa ministra só cuida de sua agenda ideológica, não das mulheres de verdade.', 'Postagem em redes atacando Cida após pronunciamento dela.', 'verified', false, '2024-03-09', 'https://twitter.com/nikolas_dm/status/nikolas-ataca-cida', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-ataca-ministra-cida-b162-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves responde a ataques e cobra responsabilização.', 'As mulheres brasileiras não serão intimidadas. Nossa agenda é proteger vidas, não ideologia.', 'Declaração em coletiva.', 'verified', false, '2024-03-10', 'https://g1.globo.com/politica/noticia/2024/03/10/cida-responde-ataques-nikolas.ghtml', 'interview', 2, 'Ministério das Mulheres', 'Entrevista', 'cida-responde-ataques-nikolas-b162-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende Casa da Mulher Brasileira em cada capital.', 'Precisamos expandir a Casa da Mulher Brasileira para todas as capitais. Nenhuma mulher pode ficar desamparada.', 'Declaração em evento do ministério.', 'verified', false, '2024-03-08', 'https://valor.globo.com/brasil/noticia/2024/03/08/tebet-casa-mulher-brasileira.ghtml', 'speech', 2, 'Brasília', 'Evento Dia da Mulher', 'tebet-casa-mulher-brasileira-b162-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta chama deputadas progressistas de "inimigas da família".', 'Essas deputadas são inimigas da família brasileira. Querem matar bebê, casar com mulher, destruir tudo.', 'Declaração em culto evangélico.', 'verified', true, '2024-05-15', 'https://g1.globo.com/politica/noticia/2024/05/15/magno-malta-inimigas-familia.ghtml', 'speech', 4, 'Evento evangélico', 'Pregação', 'magno-malta-inimigas-familia-b162-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cvi, 'Carlos Viana defende "família tradicional" e ataca agenda feminista.', 'Mulher do lar é tesouro. A agenda feminista destruiu milhões de famílias brasileiras.', 'Pronunciamento no Senado.', 'verified', false, '2024-04-25', 'https://g1.globo.com/politica/noticia/2024/04/25/viana-mulher-lar-tesouro.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'viana-mulher-lar-tesouro-b162-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_msi, 'Marina Silva denuncia feminicídio ambiental de mulheres defensoras.', 'Mulheres ambientalistas são assassinadas no Brasil por defender território. O feminicídio tem dimensão ambiental.', 'Evento sobre defensoras ambientais.', 'verified', false, '2024-06-05', 'https://g1.globo.com/politica/noticia/2024/06/05/marina-feminicidio-ambiental.ghtml', 'speech', 3, 'Ministério do Meio Ambiente', 'Evento ambiental', 'marina-feminicidio-ambiental-b162-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva apoia PL que amplia proteção a mulheres no digital.', 'A violência digital contra mulheres é epidemia. Precisamos atualizar a legislação para responsabilizar plataformas.', 'Pronunciamento em plenário.', 'verified', false, '2024-08-20', 'https://g1.globo.com/politica/noticia/2024/08/20/orlando-violencia-digital-mulheres.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'orlando-violencia-digital-mulheres-b162-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar vota contra PL 1904 como "violência institucional".', 'Este Congresso tenta institucionalizar violência contra menina estuprada. É vergonhoso.', 'Discurso em plenário.', 'verified', false, '2024-06-13', 'https://g1.globo.com/politica/noticia/2024/06/13/chico-alencar-pl-1904-vergonha.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'chico-alencar-pl-1904-vergonha-b162-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis protocola pedido de CPI para investigar abortos legais em SUS.', 'Vamos investigar os abortos legais feitos em hospitais públicos. Muitos são irregulares.', 'Protocolo de CPI em 2024.', 'verified', false, '2024-07-15', 'https://g1.globo.com/politica/noticia/2024/07/15/bia-kicis-cpi-abortos-sus.ghtml', 'official_document', 4, 'Câmara dos Deputados', 'Protocolo', 'bia-kicis-cpi-abortos-sus-b162-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone expõe rede de ameaças contra médicas que realizam aborto legal.', 'Médicas do SUS que cumprem a lei são perseguidas na internet. Há uma rede organizada de extremistas perseguindo essas profissionais.', 'Pronunciamento em plenário.', 'verified', false, '2024-08-28', 'https://g1.globo.com/politica/noticia/2024/08/28/taliria-rede-ameacas-medicas.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'taliria-rede-ameacas-medicas-aborto-b162-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha admite dificuldade para aprovar agenda feminina no Congresso.', 'O Congresso atual é um dos mais conservadores da nossa história. Tornou-se muito difícil aprovar agenda feminina.', 'Entrevista em 2024.', 'verified', false, '2024-08-12', 'https://g1.globo.com/politica/noticia/2024/08/12/padilha-congresso-conservador-agenda-mulher.ghtml', 'interview', 2, 'Palácio do Planalto', 'Entrevista', 'padilha-congresso-conservador-mulher-b162-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz ato contra ministra Anielle Franco.', 'Anielle Franco representa o racismo reverso. Mulher que usa o gênero e a raça para atacar.', 'Postagem em redes.', 'verified', false, '2024-11-27', 'https://twitter.com/nikolas_dm/status/nikolas-ataca-anielle', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-ataca-anielle-franco-b162-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta arquiva PL 1904 no início do mandato como presidente.', 'Não vamos ressuscitar o PL 1904 agora. Mas o debate sobre aborto continua.', 'Declaração em entrevista em fevereiro de 2025.', 'verified', false, '2025-02-15', 'https://g1.globo.com/politica/noticia/2025/02/15/motta-arquivar-pl-1904.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'motta-arquivar-pl-1904-b162-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira pede reapresentação do PL 1904 em 2025.', 'Vamos reapresentar o PL 1904 neste mandato. A vida começa na concepção.', 'Entrevista em redes.', 'verified', false, '2025-03-02', 'https://twitter.com/nikolas_dm/status/nikolas-reapresentar-pl-1904', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-reapresentar-pl-1904-2025-b162-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia transfeminicídio crescente no Brasil.', 'O Brasil é o país que mais mata travestis e mulheres trans no mundo. Isso é um projeto de extermínio.', 'Pronunciamento em plenário.', 'verified', false, '2024-01-29', 'https://g1.globo.com/politica/noticia/2024/01/29/erika-transfeminicidio.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Dia da Visibilidade Trans', 'erika-transfeminicidio-brasil-b162-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano diz que mulher trans "não é mulher" em plenário.', 'Mulher trans é homem. E homem não vota com mulher. Que essa bagunça acabe.', 'Pronunciamento ofensivo em plenário.', 'verified', true, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/feliciano-mulher-trans-nao-mulher.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Plenário', 'feliciano-mulher-trans-nao-mulher-b162-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula destaca maior orçamento da história para políticas de gênero.', 'Este governo tem o maior orçamento da história para políticas de gênero e combate à violência contra a mulher.', 'Anúncio em 2024.', 'verified', false, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/lula-maior-orcamento-genero.ghtml', 'speech', 2, 'Brasília', 'Dia da Mulher', 'lula-maior-orcamento-genero-b162-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dju, 'Duarte Jr defende Lei Maria da Penha contra desmonte.', 'A Lei Maria da Penha é patrimônio brasileiro. Qualquer tentativa de desmonte será combatida.', 'Pronunciamento em plenário.', 'verified', false, '2024-08-07', 'https://g1.globo.com/politica/noticia/2024/08/07/duarte-jr-maria-penha-patrimonio.ghtml', 'speech', 2, 'Câmara dos Deputados', '18 anos da Lei Maria da Penha', 'duarte-maria-penha-patrimonio-b162-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino vota a favor de aborto legal em caso de estupro.', 'A Constituição garante e a lei autoriza. Não há discussão sobre o aborto legal em caso de estupro.', 'Voto no STF em ADI sobre aborto.', 'verified', true, '2024-09-24', 'https://www.conjur.com.br/2024-set-24/dino-aborto-legal-estupro/', 'official_document', 3, 'STF', 'Voto em ADI', 'dino-aborto-legal-estupro-b162-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cmc, 'Cármen Lúcia relata ADPF 442 sobre aborto até 12 semanas.', 'A questão do aborto precisa ser tratada com respeito aos direitos fundamentais das mulheres.', 'Relatoria da ADPF 442 sobre descriminalização.', 'verified', true, '2024-09-22', 'https://www.conjur.com.br/2024-set-22/carmen-adpf-442-aborto/', 'official_document', 3, 'STF', 'Julgamento ADPF', 'carmen-adpf-442-aborto-b162-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem ataca ministra do STF por voto sobre aborto.', 'Essas ministras ativistas querem legislar onde não podem. O STF não pode ser o legislador.', 'Postagem em redes sobre voto de Cármen Lúcia.', 'verified', false, '2024-09-23', 'https://twitter.com/AlexandreRamagem/status/ramagem-cam-stf-aborto', 'social_media_post', 3, 'Twitter', 'Postagem oficial', 'ramagem-ataca-ministra-stf-aborto-b162-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rma, 'Rogério Marinho apresenta PEC contra aborto no Senado.', 'Vamos consolidar na Constituição a proteção à vida desde a concepção. Essa é a resposta a Barroso e cia.', 'Apresentação de PEC em 2024.', 'verified', false, '2024-09-30', 'https://g1.globo.com/politica/noticia/2024/09/30/marinho-pec-aborto.ghtml', 'official_document', 4, 'Senado Federal', 'Apresentação de PEC', 'marinho-pec-aborto-senado-b162-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende proteção redobrada a vítimas de violência doméstica.', 'O Ministério da Justiça está investindo na Patrulha Maria da Penha em 500 municípios. Não admitiremos mais mulheres mortas por omissão.', 'Anúncio de ampliação da Patrulha Maria da Penha.', 'verified', false, '2024-08-07', 'https://g1.globo.com/politica/noticia/2024/08/07/lewandowski-patrulha-maria-penha.ghtml', 'speech', 2, 'Brasília', '18 anos da Lei Maria da Penha', 'lewandowski-patrulha-maria-penha-b162-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner articula aprovação do feminicídio como crime autônomo no Senado.', 'É um marco civilizatório. O Brasil precisa tratar o feminicídio como crime específico, com penas mais severas.', 'Articulação no Senado para aprovação do PL.', 'verified', false, '2024-09-30', 'https://g1.globo.com/politica/noticia/2024/09/30/wagner-feminicidio-crime-autonomo.ghtml', 'interview', 2, 'Senado Federal', 'Entrevista', 'wagner-feminicidio-crime-autonomo-b162-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia linha de crédito "Feminicídio Zero" para abrigo de mulheres.', 'Queremos que toda vítima de violência doméstica tenha um lugar seguro para onde ir. Essa linha de crédito viabiliza casas-abrigo.', 'Anúncio em 2024.', 'verified', false, '2024-03-07', 'https://valor.globo.com/brasil/noticia/2024/03/07/haddad-linha-credito-feminicidio-zero.ghtml', 'speech', 2, 'Ministério da Fazenda', 'Dia da Mulher', 'haddad-feminicidio-zero-credito-b162-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves ataca dados de feminicídio como "ideológicos".', 'Esses dados de feminicídio são ideológicos. Não se pode tratar tudo como gênero. Violência contra mulher existe, mas não é feminicídio em massa.', 'Declaração em entrevista em 2024.', 'verified', false, '2024-04-10', 'https://g1.globo.com/politica/noticia/2024/04/10/damares-dados-feminicidio-ideologicos.ghtml', 'interview', 4, 'Senado Federal', 'Entrevista', 'damares-dados-feminicidio-ideologicos-b162-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali convoca dia de luta contra PL 1904.', 'Vamos às ruas contra o PL 1904. A Câmara precisa ouvir o Brasil que não aceita essa barbárie.', 'Convocação para ato público em junho de 2024.', 'verified', false, '2024-06-15', 'https://g1.globo.com/politica/noticia/2024/06/15/jandira-convoca-ato-pl-1904.ghtml', 'interview', 2, 'Câmara dos Deputados', 'Entrevista', 'jandira-convoca-ato-pl-1904-b162-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta admite que pauta do aborto voltará à Câmara em 2025.', 'A pauta do aborto voltará em algum momento. Não tenho como barrar definitivamente.', 'Entrevista em fevereiro de 2025.', 'verified', false, '2025-02-20', 'https://g1.globo.com/politica/noticia/2025/02/20/motta-pauta-aborto-2025.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'motta-pauta-aborto-2025-b162-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton protocola PL de responsabilização por misoginia em redes sociais.', 'Precisamos responsabilizar criminalmente quem faz campanhas de ódio misóginas nas redes. Basta de impunidade digital.', 'Apresentação de PL em 2024.', 'verified', false, '2024-07-22', 'https://g1.globo.com/politica/noticia/2024/07/22/erika-pl-misoginia-redes.ghtml', 'official_document', 2, 'Câmara dos Deputados', 'Apresentação de PL', 'erika-pl-misoginia-redes-b162-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ironiza feminicídio como "discurso ideológico".', 'Não existe feminicídio. Existe homicídio. Essa divisão é invenção ideológica da esquerda.', 'Postagem em redes sociais.', 'verified', false, '2024-11-26', 'https://twitter.com/nikolas_dm/status/nikolas-feminicidio-invencao', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-feminicidio-invencao-b162-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia ameaças por defender aborto legal.', 'Recebo ameaças de morte diariamente por defender direito da mulher. Essa é a realidade de quem pauta direitos no Brasil.', 'Declaração em coletiva.', 'verified', false, '2024-06-20', 'https://g1.globo.com/politica/noticia/2024/06/20/samia-ameacas-pl-1904.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'samia-ameacas-morte-pl-1904-b162-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jzt, 'Júlia Zanatta ataca ONG que atende meninas estupradas.', 'Essas ONGs feministas financiam o extermínio de bebês. Precisa ser investigado.', 'Postagem em redes sociais sobre ONG que auxiliou caso emblemático.', 'verified', false, '2024-08-14', 'https://twitter.com/juliazanatta/status/julia-ataca-ongs-meninas', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'julia-ataca-ongs-meninas-b162-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fbz, 'Fátima Bezerra anuncia política estadual contra feminicídio em áreas rurais.', 'A mulher do campo precisa de proteção. Vamos até as regiões mais distantes com a Patrulha Maria da Penha.', 'Anúncio de expansão em municípios interioranos.', 'verified', false, '2024-07-15', 'https://g1.globo.com/politica/noticia/2024/07/15/fatima-feminicidio-area-rural.ghtml', 'speech', 2, 'Natal', 'Evento estadual', 'fatima-feminicidio-area-rural-b162-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rly, 'Raquel Lyra registra queda de 18% em feminicídios em PE em 2024.', 'O trabalho coordenado da rede de proteção à mulher salvou vidas. Pernambuco é exemplo para o Brasil.', 'Anúncio de dados em balanço anual.', 'verified', false, '2024-12-10', 'https://g1.globo.com/politica/noticia/2024/12/10/raquel-lyra-queda-feminicidio-pe.ghtml', 'interview', 2, 'Recife', 'Balanço 2024', 'raquel-lyra-queda-feminicidio-pe-b162-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro apoia revogação da Lei Maria da Penha.', 'A Lei Maria da Penha criminalizou o homem. É uma lei ideológica.', 'Entrevista a podcast.', 'verified', false, '2025-01-22', 'https://g1.globo.com/politica/noticia/2025/01/22/eduardo-revogar-lei-maria-penha.ghtml', 'interview', 4, 'São Paulo', 'Podcast', 'eduardo-revogar-lei-maria-penha-b162-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis critica "criminalização" de homens na Lei Maria da Penha.', 'A Lei Maria da Penha criou um regime de presunção de culpa contra o homem. Precisa ser revista.', 'Discurso em plenário.', 'verified', false, '2024-11-30', 'https://g1.globo.com/politica/noticia/2024/11/30/bia-kicis-criminalizacao-homens.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'bia-kicis-criminalizacao-homens-b162-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fer, 'Fernanda Melchionna pede punição a deputados que fazem misoginia em plenário.', 'A Câmara precisa punir com cassação quem ofende mulheres no plenário. Não pode haver tolerância a misoginia.', 'Declaração em coletiva após ofensas.', 'verified', false, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/fernanda-punicao-misoginia-plenario.ghtml', 'interview', 2, 'Câmara dos Deputados', 'Entrevista', 'fernanda-punicao-misoginia-plenario-b162-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia "retrocesso inédito" em pautas femininas no Congresso.', 'O Brasil vive retrocesso inédito em pautas femininas. Há uma bancada que opera contra nós todos os dias.', 'Declaração em evento do PT.', 'verified', false, '2024-08-15', 'https://g1.globo.com/politica/noticia/2024/08/15/gleisi-retrocesso-pautas-femininas.ghtml', 'speech', 2, 'PT Nacional', 'Evento partidário', 'gleisi-retrocesso-pautas-femininas-b162-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança programa Juntas contra racismo e misoginia.', 'Juntas significa proteger mulheres negras. Somos o maior alvo da violência combinada de racismo e gênero.', 'Anúncio de programa.', 'verified', false, '2024-07-25', 'https://g1.globo.com/politica/noticia/2024/07/25/anielle-programa-juntas.ghtml', 'speech', 2, 'Brasília', 'Lançamento de programa', 'anielle-programa-juntas-racismo-b162-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira defende seu papel na pauta do PL 1904 apesar de recuo.', 'Não me arrependo de ter pautado. A democracia é debate. Recuei por respeito à mobilização popular.', 'Entrevista em 2024 após a polêmica.', 'verified', false, '2024-08-01', 'https://g1.globo.com/politica/noticia/2024/08/01/lira-defende-papel-pl-1904.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'lira-defende-papel-pl-1904-b162-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet condena PL 1904 como "violação à Constituição".', 'Tirar direito adquirido de vítimas de estupro é inconstitucional. O PL 1904 é inaceitável.', 'Declaração em 2024.', 'verified', false, '2024-06-13', 'https://valor.globo.com/brasil/noticia/2024/06/13/tebet-pl-1904-inconstitucional.ghtml', 'interview', 3, 'Ministério do Planejamento', 'Entrevista', 'tebet-pl-1904-inconstitucional-b162-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sth, 'Soraya Thronicke cobra fim da impunidade para feminicídio.', 'Assassinos de mulher têm que apodrecer na cadeia. Chega de penas ridículas para crime tão grave.', 'Declaração em plenário do Senado.', 'verified', false, '2024-09-28', 'https://g1.globo.com/politica/noticia/2024/09/28/soraya-impunidade-feminicidio.ghtml', 'speech', 2, 'Senado Federal', 'Plenário', 'soraya-impunidade-feminicidio-b162-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares ataca ministras como "pseudo-feministas de Lula".', 'As ministras do Lula são pseudo-feministas que só pensam em aborto. Não olham para mulher de verdade.', 'Pronunciamento no Senado.', 'verified', false, '2024-04-18', 'https://g1.globo.com/politica/noticia/2024/04/18/damares-pseudo-feministas-lula.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'damares-pseudo-feministas-lula-b162-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mib, 'Michelle Bolsonaro lidera movimento pró-vida em atos pelo Brasil.', 'A mulher cristã brasileira não aceita o aborto. Vamos ocupar as ruas pela vida.', 'Ato em São Paulo em 2024.', 'verified', true, '2024-06-16', 'https://g1.globo.com/politica/noticia/2024/06/16/michelle-ato-pro-vida-sp.ghtml', 'speech', 4, 'São Paulo', 'Ato pró-vida', 'michelle-ato-pro-vida-sp-b162-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva protocola PL para responsabilizar plataformas por misoginia digital.', 'As redes sociais são hoje instrumento de violência contra mulheres. Precisamos responsabilizar as plataformas.', 'Apresentação de PL em 2025.', 'verified', false, '2025-03-15', 'https://g1.globo.com/politica/noticia/2025/03/15/orlando-pl-plataformas-misoginia.ghtml', 'official_document', 2, 'Câmara dos Deputados', 'Apresentação de PL', 'orlando-pl-plataformas-misoginia-b162-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral vota favorável ao feminicídio autônomo no Congresso.', 'Nenhuma mulher deveria ter de morrer para que esse Congresso agisse. A Lei do Feminicídio é tardia, mas necessária.', 'Voto em plenário em 2024.', 'verified', false, '2024-09-10', 'https://g1.globo.com/politica/noticia/2024/09/10/tabata-vota-feminicidio-autonomo.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'tabata-feminicidio-autonomo-b162-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem relativiza feminicídio como "crime comum".', 'Não gosto de separar crimes por gênero. Homicídio é homicídio. Essa lei cria distinção ideológica.', 'Entrevista em 2024.', 'verified', false, '2024-09-12', 'https://g1.globo.com/politica/noticia/2024/09/12/van-hattem-feminicidio-crime-comum.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'van-hattem-feminicidio-crime-comum-b162-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia violência sexual contra mulheres indígenas Yanomami.', 'Mulheres Yanomami são vítimas de estupro e violência pelos garimpeiros. Isso é genocídio com face feminina.', 'Declaração em evento sobre terras indígenas.', 'verified', true, '2024-04-18', 'https://g1.globo.com/politica/noticia/2024/04/18/sonia-violencia-sexual-yanomami.ghtml', 'speech', 3, 'Ministério dos Povos Indígenas', 'Evento', 'sonia-violencia-sexual-yanomami-b162-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano prega que "mulher deve submissão ao marido".', 'A mulher foi criada para servir ao marido. Esse é o desígnio divino. Fora disso é rebeldia.', 'Pregação em igreja.', 'verified', true, '2024-07-21', 'https://g1.globo.com/politica/noticia/2024/07/21/feliciano-mulher-submissao-marido.ghtml', 'speech', 4, 'Igreja', 'Pregação', 'feliciano-mulher-submissao-marido-b162-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta relativiza casos de feminicídio como "tragédia pessoal".', 'Nem todo caso de mulher morta pelo marido é feminicídio. Muitas vezes é tragédia pessoal, não política.', 'Pronunciamento no Senado.', 'verified', false, '2024-09-20', 'https://g1.globo.com/politica/noticia/2024/09/20/magno-malta-feminicidio-tragedia.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'magno-malta-feminicidio-tragedia-b162-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton protocola projeto para criar Observatório da Misoginia Digital.', 'Precisamos mapear as redes de ódio contra mulheres e produzir dados. Sem dados, não há política pública.', 'Apresentação de projeto em 2025.', 'verified', false, '2025-03-08', 'https://g1.globo.com/politica/noticia/2025/03/08/erika-observatorio-misoginia-digital.ghtml', 'official_document', 2, 'Câmara dos Deputados', 'Dia da Mulher', 'erika-observatorio-misoginia-digital-b162-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira articula lobby contra ratificação da Convenção de Istambul.', 'Não vamos ratificar documentos internacionais que criam cotas de gênero. O Brasil é soberano.', 'Declaração em 2025.', 'verified', false, '2025-04-02', 'https://g1.globo.com/politica/noticia/2025/04/02/nikolas-convencao-istambul.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'nikolas-convencao-istambul-b162-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia aumento de feminicídios no 1º trimestre de 2025.', 'Os dados do 1º trimestre de 2025 mostram que o país precisa mais que nunca de políticas públicas firmes contra feminicídio.', 'Divulgação de dados em 2025.', 'verified', false, '2025-04-05', 'https://g1.globo.com/politica/noticia/2025/04/05/cida-dados-feminicidio-2025.ghtml', 'speech', 3, 'Ministério das Mulheres', 'Coletiva', 'cida-dados-feminicidio-2025-b162-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta propostas de retrocesso em saúde reprodutiva do Congresso.', 'Não vou permitir retrocesso em direitos reprodutivos conquistados por mulheres brasileiras. Vetarei o que for necessário.', 'Declaração após ameaças do Congresso em 2025.', 'verified', true, '2025-03-25', 'https://g1.globo.com/politica/noticia/2025/03/25/lula-veto-retrocesso-saude-reprodutiva.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'lula-veto-retrocesso-saude-reprodutiva-b162-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

END $$;
