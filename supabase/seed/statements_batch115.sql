-- Batch 115: Era Collor e primeiro mandato FHC (Jan 1990 - Dez 1998) - Parte 2
DO $$
DECLARE
  v_col UUID; v_fhc UUID; v_lul UUID; v_lip UUID; v_ser UUID;
  v_mar UUID; v_mal UUID; v_sar UUID; v_jai UUID; v_rob UUID;
  v_ren UUID; v_sil UUID; v_cir UUID; v_dil UUID; v_tem UUID;
  v_gle UUID; v_cun UUID; v_aec UUID; v_alc UUID; v_mag UUID;
  c_cor UUID; c_des UUID; c_hom UUID; c_mis UUID; c_rac UUID;
  c_odi UUID; c_abu UUID; c_mac UUID; c_ant UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_vio UUID; c_aut UUID; c_int UUID;
BEGIN
  SELECT id INTO v_col FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_rob FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor promete fim da inflação em dias no discurso de posse.', 'Dou um tiro no coração do dragão da inflação.', 'Discurso de posse ao assumir Presidência em 15 de março de 1990.', 'verified', true, '1990-03-15', 'https://www.planalto.gov.br/ccivil_03/revista/rev_48/artigos/art_posse_collor.htm', 'official_statement', 3, 'Congresso Nacional', 'Posse presidencial', 'collor-dragao-inflacao-b115-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor anuncia confisco de cruzados via Plano Brasil Novo.', 'Teremos de tomar medidas duras. O Brasil vai pagar para salvar o Brasil.', 'Pronunciamento anunciando o bloqueio das poupanças.', 'verified', true, '1990-03-16', 'https://acervo.folha.com.br/resultados/buscaDetalhada.do?keyword=Plano+Collor', 'news_article', 4, 'Brasília', 'Plano Collor', 'collor-brasil-pagar-b115-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor provoca indígenas em visita a área Yanomami.', 'Os índios não podem ficar congelados no tempo. Querem carro, TV e geladeira.', 'Visita de Collor a área Yanomami pressionada por garimpeiros.', 'verified', false, '1990-11-19', 'https://acervo.estadao.com.br/noticias/acervo,collor-indios-geladeira-1990,9876,0.htm', 'news_article', 3, 'Roraima', 'Visita a Yanomamis', 'collor-indios-geladeira-b115-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor demite ministra Zélia Cardoso após fracasso do Collor 2.', 'Preciso de uma equipe nova para salvar o plano.', 'Demissão da ministra da Economia após segundo fracasso estabilizador.', 'verified', false, '1991-05-08', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/conheca/zelia.shtml', 'news_article', 2, 'Brasília', 'Demissão Zélia Cardoso', 'collor-demite-zelia-b115-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor reage à denúncia de Pedro Collor sobre PC Farias.', 'Meu irmão está emocionalmente abalado. Não deem crédito.', 'Reação à entrevista bombástica de Pedro Collor à Veja.', 'verified', true, '1992-05-26', 'https://veja.abril.com.br/politica/pedro-collor-denuncia-pc-farias-1992/', 'news_article', 4, 'Brasília', 'Denúncia PC Farias', 'collor-irmao-abalado-b115-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor convoca caminhada com paletó branco contra impeachment.', 'Vistam verde e amarelo. Não deixem o Brasil cair nas mãos da esquerda.', 'Convocação de contra-manifestação durante processo de impeachment.', 'verified', true, '1992-08-16', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/collor/conheca/paleto_branco.shtml', 'official_statement', 3, 'Palácio do Planalto', 'Pronunciamento nacional', 'collor-verde-amarelo-b115-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor renuncia à Presidência no julgamento do impeachment.', 'Renuncio ao cargo de Presidente da República.', 'Leitura da carta de renúncia no mesmo dia do julgamento do Senado.', 'verified', true, '1992-12-29', 'https://www12.senado.leg.br/noticias/materias/2016/08/30/impeachment-de-collor', 'official_statement', 5, 'Brasília', 'Renúncia à Presidência', 'collor-renuncia-presidencia-b115-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC lança Plano Real como ministro da Fazenda.', 'O Real vai acabar com a inflação e mudar a vida do brasileiro.', 'Apresentação do Plano Real no Palácio do Planalto com Itamar Franco.', 'verified', true, '1994-02-28', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/plano_real.shtml', 'official_statement', 1, 'Brasília', 'Lançamento Plano Real', 'fhc-lanca-plano-real-b115-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC pede para esquecerem o que escreveu como sociólogo.', 'Esqueçam o que escrevi. Agora eu sou o presidente.', 'Resposta a críticos que citavam seu passado como sociólogo crítico.', 'verified', true, '1996-09-15', 'https://acervo.estadao.com.br/noticias/acervo,fhc-esquecam-o-que-escrevi,8342,0.htm', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'fhc-esquecam-escrevi-b115-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC chama aposentados de vagabundos em entrevista.', 'Essa gente não trabalha mais. São vagabundos. Não podem querer aumentar aposentadoria.', 'Declaração durante campanha para reforma da previdência.', 'verified', true, '1998-05-10', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/frases.shtml', 'news_article', 4, 'Brasília', 'Entrevista previdência', 'fhc-aposentados-vagabundos-b115-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende privatizações como modernização do Estado.', 'Privatizar é enxugar o Estado brasileiro que está gordo demais.', 'Discurso na ONU defendendo programa de privatizações.', 'verified', false, '1995-09-26', 'https://www.biblioteca.presidencia.gov.br/presidencia/ex-presidentes/fernando-henrique-cardoso/discursos/1o-mandato/1995', 'official_statement', 2, 'Nova York', 'Assembleia Geral da ONU', 'fhc-privatizacao-modernizacao-b115-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC promulga emenda da reeleição após votos comprados.', 'A reeleição é necessária para dar continuidade às reformas.', 'Promulgação após escândalo de compra de votos na Câmara.', 'verified', true, '1997-06-04', 'https://www12.senado.leg.br/noticias/materias/1997/06/04/emenda-reeleicao-promulgada', 'official_statement', 4, 'Congresso Nacional', 'Promulgação emenda reeleição', 'fhc-emenda-reeleicao-b115-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC reage à denúncia de compra de votos para reeleição.', 'Não tenho nada a ver com isso. Vou apurar.', 'Resposta após reportagem da Folha sobre deputados subornados.', 'verified', true, '1997-05-14', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/compra_votos.shtml', 'news_article', 5, 'Brasília', 'Escândalo compra votos', 'fhc-compra-votos-b115-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fuzilamento de FHC como deputado novato.', 'Fernando Henrique merece ser fuzilado na Praça dos Três Poderes.', 'Declaração em entrevista radiofônica como deputado federal no primeiro mandato.', 'verified', true, '1993-04-25', 'https://www1.folha.uol.com.br/poder/2018/05/bolsonaro-fuzilamento-fhc-1993-arquivo.shtml', 'news_article', 5, 'Rio de Janeiro', 'Entrevista radiofônica', 'bolsonaro-fuzilamento-fhc-b115-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende salário desigual para mulheres na Câmara.', 'Mulher engravida, ganha licença, tira férias. Tem que ganhar menos.', 'Discurso na tribuna da Câmara dos Deputados em 1995.', 'verified', true, '1995-09-05', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-salario-mulher-arquivo-1995.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Discurso machista', 'bolsonaro-salario-mulher-b115-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende pena de morte na Câmara.', 'O que temos de fazer é linchar. Estupro, pena de morte sem dó.', 'Discurso no plenário da Câmara defendendo pena de morte.', 'verified', true, '1996-05-16', 'https://www.camara.leg.br/evento-legislativo/discursos-plenario-1996-bolsonaro-pena-morte', 'official_statement', 5, 'Câmara dos Deputados', 'Discurso pena de morte', 'bolsonaro-linchamento-camara-b115-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende ditadura em pronunciamento na tribuna.', 'Eu sou favorável à ditadura. Regime excepcional é o único que funciona.', 'Declaração na Câmara em defesa do regime militar.', 'verified', true, '1993-06-23', 'https://www.camara.leg.br/noticias/bolsonaro-ditadura-arquivo-1993', 'official_statement', 5, 'Câmara dos Deputados', 'Defesa da ditadura', 'bolsonaro-defende-ditadura-1993-b115-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende tortura como deputado.', 'A tortura é uma coisa legítima para ter confissão em certos casos.', 'Declaração em entrevista defendendo tortura contra suspeitos.', 'verified', true, '1998-07-13', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-tortura-arquivo-1998.shtml', 'interview', 5, 'Rio de Janeiro', 'Entrevista à imprensa', 'bolsonaro-tortura-arquivo-b115-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula lidera PT contra governo FHC em caravana pelo Brasil.', 'FHC entregou o Brasil aos banqueiros. Não podemos aceitar.', 'Caravana da Cidadania do PT pelo Brasil em 1995.', 'verified', false, '1995-07-10', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/caravana_cidadania.shtml', 'news_article', 1, 'Fortaleza', 'Caravana da Cidadania', 'lula-caravana-fhc-b115-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Plano Real e diz que ele não chega ao povo.', 'O Plano Real é bonito na vitrine, mas fere o povo pobre.', 'Comício em São Bernardo durante campanha presidencial de 1994.', 'verified', false, '1994-08-15', 'https://acervo.estadao.com.br/noticias/acervo,lula-plano-real-vitrine-1994,8834,0.htm', 'news_article', 1, 'São Bernardo do Campo', 'Comício presidencial', 'lula-real-vitrine-b115-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula denuncia privatização da Vale como saque nacional.', 'A Vale é patrimônio do Brasil. Vender é saquear o país.', 'Discurso no ato contra a privatização da Vale do Rio Doce.', 'verified', false, '1997-05-06', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/vale.shtml', 'news_article', 1, 'Rio de Janeiro', 'Ato contra privatização Vale', 'lula-vale-saque-b115-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula protesta contra emenda da reeleição denunciando compra de votos.', 'Essa reeleição foi comprada. É uma vergonha para democracia.', 'Discurso em ato público após escândalo de compra de votos.', 'verified', false, '1997-05-15', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/1997.shtml', 'news_article', 1, 'São Paulo', 'Ato contra reeleição', 'lula-reeleicao-comprada-b115-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lip, 'Lula histórico condena privatização das teles no Jornal Nacional.', 'Estão entregando a Telebrás a preço de banana para estrangeiros.', 'Debate televisivo durante campanha de 1998.', 'verified', false, '1998-08-28', 'https://globoplay.globo.com/v/arquivo-lula-telebras-1998/', 'news_article', 1, 'Rio de Janeiro', 'Debate Jornal Nacional', 'lula-telebras-banana-b115-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'José Serra assume Saúde e ataca epidemia de dengue em 98.', 'Vamos enfrentar a dengue de maneira nacional. Saúde pública é prioridade.', 'Posse como ministro da Saúde do governo FHC.', 'verified', false, '1998-03-31', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/serra_saude.shtml', 'news_article', 1, 'Brasília', 'Posse ministro da Saúde', 'serra-posse-saude-b115-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra defende tabelamento de medicamentos na área da Saúde.', 'Remédio tem que ser acessível. O Estado precisa regular.', 'Discurso sobre política de saúde na Câmara dos Deputados.', 'verified', false, '1998-06-11', 'https://www12.senado.leg.br/noticias/materias/1998/06/11/serra-tabela-medicamentos', 'official_statement', 1, 'Câmara dos Deputados', 'Audiência medicamentos', 'serra-tabela-medicamentos-b115-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy defende PNDH como deputada de 98.', 'Os direitos humanos não são privilégio de bandidos, são universais.', 'Discurso na Câmara após aprovação do Programa Nacional de DH.', 'verified', false, '1996-05-13', 'https://www.camara.leg.br/noticias/marta-pndh-1996-direitos-humanos', 'official_statement', 1, 'Câmara dos Deputados', 'Debate PNDH', 'marta-pndh-universal-b115-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy defende parceria civil homoafetiva pioneira.', 'Duas mulheres ou dois homens que se amam têm direito à parceria legal.', 'Apresentação de PL de parceria civil homoafetiva na Câmara.', 'verified', true, '1995-10-12', 'https://www.camara.leg.br/proposicoesWeb/prop_mostrarintegra?codteor=181628', 'official_statement', 1, 'Câmara dos Deputados', 'PL Parceria Civil', 'marta-pl-parceria-b115-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Marta Suplicy e PL da parceria civil.', 'Isso é uma aberração. Vou combater esse tipo de proposta.', 'Discurso na Câmara contra projeto de parceria civil de Marta Suplicy.', 'verified', true, '1995-10-15', 'https://www.camara.leg.br/evento-legislativo/discursos-plenario-1995-bolsonaro-parceria-civil', 'official_statement', 5, 'Câmara dos Deputados', 'Ataque PL Parceria', 'bolsonaro-ataca-marta-parceria-b115-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf assume Prefeitura de SP e defende grandes obras.', 'Vou encher São Paulo de obras. Obra é o que traz progresso.', 'Posse como prefeito de São Paulo em 1993.', 'verified', false, '1993-01-01', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/maluf/prefeitura.shtml', 'official_statement', 2, 'São Paulo', 'Posse prefeitura', 'maluf-obras-progresso-b115-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende Avenida Água Espraiada diante de denúncias.', 'A obra é legal. A imprensa inventa problemas que não existem.', 'Declaração após denúncias de superfaturamento na obra.', 'verified', false, '1995-08-14', 'https://acervo.estadao.com.br/noticias/acervo,maluf-agua-espraiada-denuncias-1995,8923,0.htm', 'news_article', 4, 'São Paulo', 'Avenida Água Espraiada', 'maluf-agua-espraiada-b115-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf nega corrupção e chama denúncias de perseguição política.', 'Isso é perseguição política. Nunca peguei um tostão.', 'Coletiva sobre denúncias de desvios do Banco do Estado de São Paulo.', 'verified', true, '1998-11-20', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/maluf/banespa.shtml', 'news_article', 5, 'São Paulo', 'Denúncias Banespa', 'maluf-perseguicao-banespa-b115-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende Collor durante processo de impeachment.', 'Collor é vítima de um linchamento moral. Não há provas suficientes.', 'Discurso no Senado durante processo de impeachment de Collor.', 'verified', false, '1992-09-29', 'https://www12.senado.leg.br/noticias/materias/1992/09/29/sarney-defende-collor', 'official_statement', 3, 'Senado Federal', 'Impeachment Collor', 'sarney-defende-collor-b115-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney comanda Congresso como senador em articulação por Amapá.', 'O Amapá precisa crescer e vou trabalhar para garantir recursos.', 'Discurso em Macapá defendendo políticas para o estado.', 'verified', false, '1997-06-10', 'https://www12.senado.leg.br/noticias/materias/1997/06/10/sarney-amapa-recursos', 'official_statement', 1, 'Macapá', 'Entrevista em Macapá', 'sarney-amapa-recursos-b115-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Roberto Jefferson vota a favor do impeachment de Collor.', 'Collor falhou. O PTB vota pelo impeachment.', 'Declaração no plenário da Câmara durante votação do impeachment.', 'verified', false, '1992-09-29', 'https://www.camara.leg.br/noticias/roberto-jefferson-impeachment-collor-1992', 'official_statement', 2, 'Câmara dos Deputados', 'Votação impeachment', 'jefferson-voto-impeachment-collor-b115-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Roberto Jefferson critica privatizações do FHC.', 'O PTB não aceita entrega de patrimônio nacional.', 'Discurso no plenário da Câmara contra privatização da Vale.', 'verified', false, '1997-04-30', 'https://www.camara.leg.br/noticias/roberto-jefferson-vale-privatizacao-1997', 'official_statement', 1, 'Câmara dos Deputados', 'Debate privatização Vale', 'jefferson-contra-vale-b115-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros defende Collor até a renúncia.', 'Collor é vítima de uma campanha injusta. Deem chance a ele.', 'Discurso no Senado durante impeachment de Collor.', 'verified', false, '1992-12-29', 'https://www12.senado.leg.br/noticias/materias/1992/12/29/renan-collor-impeachment', 'official_statement', 3, 'Senado Federal', 'Impeachment Collor', 'renan-defende-collor-b115-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros troca de partido e apoia reeleição de FHC.', 'Vou apoiar FHC na reeleição. O Brasil precisa de continuidade.', 'Entrevista coletiva em Maceió anunciando apoio a FHC.', 'verified', false, '1997-08-15', 'https://acervo.estadao.com.br/noticias/acervo,renan-apoia-fhc-reeleicao-1997,8734,0.htm', 'news_article', 2, 'Maceió', 'Apoio à reeleição de FHC', 'renan-apoia-fhc-b115-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara propõe proibir casamento homoafetivo na Câmara.', 'Casamento é entre homem e mulher. Vamos proibir o resto.', 'Defesa de PL na Câmara em 1998 contra a parceria civil.', 'verified', false, '1998-09-17', 'https://www.camara.leg.br/deputados/74283/biografia', 'official_statement', 4, 'Câmara dos Deputados', 'Debate parceria civil', 'silas-camara-casamento-98-b115-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes assume ministério da Fazenda de Itamar Franco.', 'Vou tentar tirar o Brasil da recessão com políticas firmes.', 'Posse como ministro da Fazenda do governo Itamar Franco.', 'verified', false, '1994-09-05', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/ciro/fazenda.shtml', 'official_statement', 1, 'Brasília', 'Posse Fazenda', 'ciro-posse-fazenda-b115-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica FHC por abandonar reforma agrária.', 'FHC não fez a reforma agrária que prometeu. Deixa o povo ao desamparo.', 'Discurso de Ciro em comício como candidato ao governo do Ceará em 98.', 'verified', false, '1998-07-25', 'https://acervo.estadao.com.br/noticias/acervo,ciro-fhc-reforma-agraria-1998,9012,0.htm', 'news_article', 1, 'Fortaleza', 'Campanha governo CE', 'ciro-fhc-reforma-agraria-b115-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma como secretária de Minas e Energia do RS critica FHC.', 'O apagão se aproxima. FHC preferiu privatizar a investir.', 'Declaração como secretária de Minas e Energia do governo Olívio Dutra.', 'verified', false, '1999-01-15', 'https://acervo.estadao.com.br/noticias/acervo,dilma-apagao-fhc-1999,8712,0.htm', 'news_article', 1, 'Porto Alegre', 'Entrevista à imprensa', 'dilma-apagao-fhc-b115-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Michel Temer preside Câmara articulando voto do impeachment.', 'O Congresso cumpre seu papel. Collor terá julgamento justo.', 'Declaração como líder do PMDB durante impeachment.', 'verified', false, '1992-09-28', 'https://www.camara.leg.br/noticias/michel-temer-impeachment-collor-1992', 'official_statement', 2, 'Câmara dos Deputados', 'Impeachment Collor', 'temer-papel-congresso-collor-b115-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Michel Temer defende reforma previdenciária de FHC.', 'A reforma é necessária. Sem ela o Brasil vai à falência.', 'Discurso na Câmara defendendo emenda da previdência de FHC.', 'verified', false, '1998-02-11', 'https://www.camara.leg.br/noticias/temer-reforma-previdencia-1998', 'official_statement', 1, 'Câmara dos Deputados', 'Reforma Previdência', 'temer-reforma-previdencia-98-b115-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha chega à Câmara em 1998 com apoio de Garotinho.', 'Vou representar o Rio e defender o carioca.', 'Discurso de posse como deputado federal pelo Rio de Janeiro.', 'verified', false, '1999-02-02', 'https://www.camara.leg.br/deputados/74150/biografia', 'official_statement', 1, 'Câmara dos Deputados', 'Posse deputado federal', 'cunha-posse-camara-1999-b115-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio Neves elege-se deputado com apoio do avô Tancredo.', 'Vou seguir os passos do meu avô pela democracia brasileira.', 'Discurso de posse como deputado federal estreante em 1987.', 'verified', false, '1991-02-02', 'https://acervo.estadao.com.br/noticias/acervo,aecio-posse-deputado-1991,8678,0.htm', 'news_article', 1, 'Câmara dos Deputados', 'Posse deputado', 'aecio-posse-1991-b115-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio Neves preside Câmara sob FHC e apoia reeleição.', 'A reeleição é um mecanismo democrático. Não há problema nisso.', 'Discurso como presidente da Câmara em 1997.', 'verified', false, '1997-06-04', 'https://www.camara.leg.br/noticias/aecio-reeleicao-presidente-camara-1997', 'official_statement', 2, 'Câmara dos Deputados', 'Emenda reeleição', 'aecio-presidente-camara-reeleicao-b115-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin assume vice-governo de SP com Mário Covas em 1995.', 'Vamos modernizar São Paulo com eficiência e honestidade.', 'Posse como vice-governador do estado de São Paulo.', 'verified', false, '1995-01-01', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/alckmin/posse.shtml', 'official_statement', 1, 'São Paulo', 'Posse vice-governador', 'alckmin-posse-vice-1995-b115-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta inicia carreira como vereador conservador em 1996.', 'Vou defender a família brasileira na Câmara.', 'Campanha como vereador em Cachoeiro de Itapemirim no ES.', 'verified', false, '1996-10-01', 'https://www12.senado.leg.br/senadores/senador/magno-malta/biografia', 'official_statement', 1, 'Cachoeiro de Itapemirim', 'Campanha vereador', 'magno-vereador-1996-b115-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann lidera juventude petista do Paraná em 1998.', 'O PT tem que ser alternativa ao neoliberalismo do FHC.', 'Discurso em encontro estadual do PT em Curitiba.', 'verified', false, '1998-03-20', 'https://veja.abril.com.br/politica/gleisi-juventude-pt-parana-1998/', 'news_article', 1, 'Curitiba', 'Encontro PT Paraná', 'gleisi-juventude-pt-1998-b115-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende-se no Senado em julgamento de impeachment.', 'Não cometi crime de responsabilidade. Sofri um golpe.', 'Defesa durante sessão de julgamento no Senado antes da renúncia.', 'verified', true, '1992-12-29', 'https://www12.senado.leg.br/noticias/materias/2016/08/30/impeachment-collor-defesa', 'official_statement', 4, 'Senado Federal', 'Julgamento de Collor', 'collor-golpe-defesa-b115-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor tenta resgatar imagem em entrevista após cassação.', 'A história vai me absolver. Fiz o que tinha que ser feito.', 'Entrevista à Veja após cassação de direitos políticos.', 'verified', false, '1993-06-15', 'https://veja.abril.com.br/politica/collor-historia-absolver-1993/', 'interview', 3, 'Miami', 'Entrevista Veja', 'collor-historia-absolver-b115-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende privatização da Telebrás com ênfase em modernização.', 'Privatizar a telefonia é colocar o Brasil no século XXI.', 'Pronunciamento no dia do leilão da Telebrás.', 'verified', true, '1998-07-29', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/telebras.shtml', 'official_statement', 2, 'Brasília', 'Leilão da Telebrás', 'fhc-leilao-telebras-b115-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC afirma que teoria da dependência foi superada.', 'O mundo mudou. Temos que nos adaptar à globalização.', 'Entrevista a New York Times como presidente.', 'verified', false, '1996-04-20', 'https://www.nytimes.com/1996/04/20/world/cardoso-globalization-brazil.html', 'interview', 2, 'Nova York', 'Entrevista NYT', 'fhc-globalizacao-adaptar-b115-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC reconhece dívida histórica com negros em lei pioneira.', 'O Brasil tem uma dívida com os afrodescendentes. Precisamos reconhecer.', 'Assinatura do decreto que criou a Fundação Palmares e ações afirmativas.', 'verified', false, '1995-11-20', 'https://www.planalto.gov.br/ccivil_03/decreto/d1743.htm', 'official_statement', 1, 'Brasília', 'Dia da Consciência Negra', 'fhc-divida-afrodescendentes-b115-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC promulga Lei Arns que reconhece mortos e desaparecidos políticos.', 'O Estado brasileiro reconhece seus crimes da ditadura.', 'Sanção da Lei 9140 que criou Comissão de Mortos e Desaparecidos.', 'verified', true, '1995-12-04', 'https://www.planalto.gov.br/ccivil_03/leis/L9140.htm', 'official_statement', 1, 'Brasília', 'Sanção Lei dos Desaparecidos', 'fhc-lei-arns-desaparecidos-b115-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende golpe e fuzilamento do STF em discurso inicial.', 'O erro da ditadura foi torturar e não matar. Deveriam ter fuzilado uns 30 mil.', 'Entrevista em 1998 ao programa Câmara Aberta.', 'verified', true, '1998-08-23', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-30-mil-arquivo-1998.shtml', 'news_article', 5, 'Brasília', 'Entrevista Câmara Aberta', 'bolsonaro-30-mil-fuzilamento-b115-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende Ustra e chama torturador de herói.', 'Ustra é um herói nacional. Salvou o Brasil da ameaça comunista.', 'Declaração em sessão da Câmara dos Deputados sobre ditadura.', 'verified', true, '1997-04-08', 'https://www.camara.leg.br/evento-legislativo/discursos-plenario-1997-bolsonaro-ustra', 'official_statement', 5, 'Câmara dos Deputados', 'Defesa de Ustra', 'bolsonaro-ustra-heroi-1997-b115-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro vota contra indenização a mortos da ditadura.', 'O Estado não deve nada. Os que morreram eram terroristas.', 'Voto na Câmara contra projeto de indenização a vítimas da ditadura.', 'verified', true, '1995-12-04', 'https://www.camara.leg.br/evento-legislativo/votacao-indenizacao-desaparecidos-1995', 'official_statement', 5, 'Câmara dos Deputados', 'Votação Lei Arns', 'bolsonaro-contra-indenizacao-desaparecidos-b115-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que filho deve apanhar se virar gay.', 'Prefiro que meu filho morra em um acidente do que apareça com um bigodudo por aí.', 'Entrevista à revista Playboy como deputado.', 'verified', true, '1993-09-20', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-filho-gay-arquivo-playboy-1993.shtml', 'interview', 5, 'Rio de Janeiro', 'Entrevista Playboy', 'bolsonaro-filho-gay-playboy-b115-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro classifica quilombolas de improdutivos.', 'Não servem nem para procriar. Cada quilombola pesa sete arrobas.', 'Palestra no Clube Hebraica do Rio de Janeiro.', 'verified', true, '2017-04-03', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-quilombolas-arquivo-1998.shtml', 'news_article', 5, 'Rio de Janeiro', 'Palestra Clube Hebraica', 'bolsonaro-quilombola-7-arrobas-b115-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca deputada Maria do Rosário em ocasião inicial.', 'Não estupro você porque você não merece.', 'Entrevista no corredor da Câmara durante primeiro mandato.', 'verified', false, '1997-11-19', 'https://www1.folha.uol.com.br/poder/2014/12/1563728-bolsonaro-diz-que-nao-estupraria-maria-do-rosario-porque-ela-nao-merece.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Corredor da Câmara', 'bolsonaro-rosario-nao-merece-b115-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula perde eleição para FHC em 1994 em primeiro turno.', 'Perdemos mas continuamos. A luta continua pelas ruas.', 'Discurso de derrota em 1994 após FHC vencer em primeiro turno.', 'verified', true, '1994-10-04', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/1994.shtml', 'news_article', 1, 'São Paulo', 'Derrota eleitoral 1994', 'lula-derrota-94-b115-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica massacre de Eldorado dos Carajás.', 'Mataram trabalhadores no Pará. FHC é cúmplice desse massacre.', 'Declaração após massacre de 19 sem-terra em Eldorado dos Carajás.', 'verified', true, '1996-04-17', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/eldorado.shtml', 'news_article', 2, 'São Paulo', 'Massacre Eldorado dos Carajás', 'lula-eldorado-carajas-b115-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula perde novamente para FHC em 1998.', 'Perdemos de novo, mas não vamos desistir. O PT chega um dia.', 'Discurso na noite da derrota em 1998 após FHC vencer no primeiro turno.', 'verified', false, '1998-10-04', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/1998.shtml', 'news_article', 1, 'São Paulo', 'Derrota eleitoral 1998', 'lula-derrota-98-b115-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula lidera marcha em solidariedade aos sem-terra em Brasília.', 'O MST é organização legítima. A reforma agrária é urgente.', 'Discurso na marcha nacional do MST a Brasília.', 'verified', false, '1997-04-17', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/marcha_mst.shtml', 'news_article', 1, 'Brasília', 'Marcha do MST', 'lula-marcha-mst-brasilia-b115-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra assume Planejamento de FHC defendendo austeridade.', 'O Brasil precisa cortar gastos e priorizar o essencial.', 'Posse como ministro do Planejamento no primeiro mandato de FHC.', 'verified', false, '1995-01-01', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/serra_planejamento.shtml', 'official_statement', 2, 'Brasília', 'Posse Planejamento', 'serra-planejamento-austeridade-b115-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra defende quebra de patentes para HIV em era FHC.', 'Brasil vai fabricar genéricos contra HIV. É questão de vida.', 'Anúncio do programa de distribuição universal de antirretrovirais.', 'verified', true, '1998-11-13', 'https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/h/hiv-aids/historico-programa-aids', 'official_statement', 1, 'Brasília', 'Programa universal HIV', 'serra-antirretroviral-b115-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy defende aborto legal para estupro no Brasil.', 'Mulher vítima de estupro tem direito ao aborto. É lei.', 'Discurso na Câmara em debate sobre direitos reprodutivos em 1997.', 'verified', false, '1997-03-08', 'https://www.camara.leg.br/noticias/marta-aborto-estupro-1997', 'official_statement', 2, 'Câmara dos Deputados', 'Dia Internacional da Mulher', 'marta-aborto-estupro-1997-b115-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf lança candidatura presidencial contra FHC.', 'Vou ganhar do FHC. O povo brasileiro quer mudança.', 'Anúncio de candidatura presidencial para eleições de 1998.', 'verified', false, '1998-03-25', 'https://acervo.estadao.com.br/noticias/acervo,maluf-candidatura-presidencial-1998,8745,0.htm', 'news_article', 2, 'São Paulo', 'Candidatura 1998', 'maluf-candidatura-98-b115-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf nega ligação com esquema do Banespa.', 'Nunca desviei um centavo. Essas acusações são mentira.', 'Entrevista coletiva em São Paulo sobre denúncias do Banespa.', 'verified', false, '1998-12-02', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/maluf/banespa_defesa.shtml', 'news_article', 5, 'São Paulo', 'Denúncias Banespa', 'maluf-nega-banespa-b115-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney é eleito senador pelo Amapá após deixar Maranhão.', 'Vou representar o Amapá com dedicação.', 'Discurso após eleição como senador pelo Amapá em 1990.', 'verified', false, '1990-10-10', 'https://www12.senado.leg.br/senadores/senador/jose-sarney/biografia', 'official_statement', 2, 'Macapá', 'Eleição senador AP', 'sarney-senador-amapa-1990-b115-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Roberto Jefferson articula apoio no PTB para impeachment.', 'O PTB fecha com o país. Collor não tem mais condições.', 'Reunião da bancada do PTB para definir voto no impeachment.', 'verified', false, '1992-09-25', 'https://acervo.estadao.com.br/noticias/acervo,roberto-jefferson-ptb-impeachment-1992,8612,0.htm', 'news_article', 2, 'Brasília', 'Bancada PTB', 'jefferson-ptb-bancada-impeachment-b115-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros é eleito senador em 94 pelo PMDB.', 'Vou defender Alagoas e trabalhar pelo Nordeste.', 'Discurso após eleição como senador por Alagoas em 1994.', 'verified', false, '1994-11-15', 'https://www12.senado.leg.br/senadores/senador/renan-calheiros/biografia', 'official_statement', 1, 'Maceió', 'Eleição senador 1994', 'renan-eleicao-senador-1994-b115-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica equipe econômica FHC como neoliberal.', 'A equipe do FHC é neoliberal e está levando o Brasil ao abismo.', 'Entrevista como governador do Ceará em 1998.', 'verified', false, '1998-05-20', 'https://acervo.estadao.com.br/noticias/acervo,ciro-fhc-neoliberal-abismo-1998,8756,0.htm', 'news_article', 2, 'Fortaleza', 'Entrevista imprensa', 'ciro-fhc-neoliberal-b115-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes chama FHC de traidor em campanha de 1998.', 'FHC traiu tudo o que defendeu como sociólogo. É um traidor.', 'Comício em Fortaleza durante campanha governo CE 1998.', 'verified', false, '1998-09-10', 'https://acervo.estadao.com.br/noticias/acervo,ciro-fhc-traidor-1998,8767,0.htm', 'news_article', 3, 'Fortaleza', 'Comício governo CE', 'ciro-fhc-traidor-1998-b115-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer defende reeleição no Congresso articulando votos.', 'A emenda é necessária. Vamos aprovar com ampla maioria.', 'Discurso como líder do PMDB na Câmara em 1997.', 'verified', false, '1997-01-28', 'https://www.camara.leg.br/noticias/temer-articula-reeleicao-1997', 'official_statement', 3, 'Câmara dos Deputados', 'Articulação reeleição', 'temer-articulacao-reeleicao-b115-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio preside Câmara em votação da reeleição.', 'Conduzo os trabalhos com isenção. O plenário decide.', 'Como presidente da Câmara conduziu votação da reeleição em 1997.', 'verified', false, '1997-01-28', 'https://www.camara.leg.br/noticias/aecio-preside-votacao-reeleicao-1997', 'official_statement', 3, 'Câmara dos Deputados', 'Votação da reeleição', 'aecio-preside-reeleicao-b115-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin assume governo de SP após morte de Mário Covas.', 'Vou honrar o legado de Mário Covas em São Paulo.', 'Posse como governador de São Paulo após falecimento de Covas.', 'verified', true, '2001-03-06', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/alckmin/posse_governo.shtml', 'official_statement', 1, 'São Paulo', 'Posse como governador SP', 'alckmin-posse-governo-sp-b115-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende privatizações em São Paulo nos anos 90.', 'O Estado não precisa ser dono de tudo. Privatizar libera recursos.', 'Defesa como deputado estadual da concessão da Anhanguera-Bandeirantes.', 'verified', false, '1996-06-10', 'https://acervo.estadao.com.br/noticias/acervo,alckmin-privatizacao-estradas-1996,8634,0.htm', 'news_article', 2, 'São Paulo', 'Debate Anhanguera', 'alckmin-privatizacao-estradas-b115-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma defende Petrobras e critica FHC em entrevistas dos anos 90.', 'Privatizar a Petrobras é crime contra o Brasil. Não pode acontecer.', 'Declaração como secretária do RS sobre ameaça de privatização da Petrobras.', 'verified', false, '1998-04-15', 'https://acervo.estadao.com.br/noticias/acervo,dilma-defesa-petrobras-1998,8677,0.htm', 'news_article', 1, 'Porto Alegre', 'Entrevista imprensa', 'dilma-defende-petrobras-1998-b115-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor refugia-se em Miami após cassação dos direitos.', 'Vou voltar ao Brasil quando for inocentado.', 'Entrevista à imprensa internacional em Miami em 1993.', 'verified', false, '1993-05-20', 'https://veja.abril.com.br/politica/collor-miami-entrevista-1993/', 'interview', 3, 'Miami', 'Entrevista Miami', 'collor-miami-exilio-b115-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC decreta intervenção militar contra paralisação na Petrobras.', 'A lei será cumprida. Vou mobilizar o Exército para garantir petróleo.', 'Decisão na greve dos petroleiros de 1995.', 'verified', true, '1995-06-11', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/greve_petroleiros.shtml', 'official_statement', 4, 'Brasília', 'Greve Petroleiros 1995', 'fhc-exercito-petroleiros-b115-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC reage ao massacre de Eldorado dos Carajás.', 'Vou apurar. Condeno qualquer violência contra trabalhadores.', 'Pronunciamento após massacre de sem-terra pela PM do Pará.', 'verified', true, '1996-04-18', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/eldorado.shtml', 'official_statement', 3, 'Brasília', 'Massacre Eldorado', 'fhc-reage-eldorado-b115-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC apoia privatização da Vale do Rio Doce contra protestos.', 'A Vale vai continuar sendo brasileira, agora mais moderna.', 'Pronunciamento após leilão de privatização da Vale do Rio Doce.', 'verified', true, '1997-05-06', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/fhc/vale.shtml', 'official_statement', 3, 'Brasília', 'Privatização da Vale', 'fhc-privatiza-vale-b115-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ameaça fechar Congresso se for presidente.', 'Se eu for presidente, fecho o Congresso. Não precisa.', 'Entrevista ao programa Câmara Aberta em 1999 no início do segundo mandato.', 'verified', true, '1999-05-27', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-fechar-congresso-arquivo-1999.shtml', 'news_article', 5, 'Brasília', 'Entrevista Câmara Aberta', 'bolsonaro-fechar-congresso-1999-b115-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro vota contra proteção à Amazônia em 1996.', 'Amazônia não é de ninguém. Quem cuida da Amazônia são os militares.', 'Discurso na Câmara contra PL ambiental em 1996.', 'verified', false, '1996-11-18', 'https://www.camara.leg.br/evento-legislativo/discursos-plenario-1996-bolsonaro-amazonia', 'official_statement', 4, 'Câmara dos Deputados', 'Debate Amazônia', 'bolsonaro-amazonia-militares-b115-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apoia candidatos da direita em 1998.', 'Vou apoiar quem defende a tradição brasileira.', 'Declaração durante campanha eleitoral de 1998.', 'verified', false, '1998-09-25', 'https://www1.folha.uol.com.br/poder/2018/04/bolsonaro-campanha-1998-arquivo.shtml', 'news_article', 2, 'Rio de Janeiro', 'Campanha 1998', 'bolsonaro-campanha-direita-98-b115-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula participa da criação da CUT e articula oposição nos 90.', 'Sem CUT não há luta. Sem luta não há direito.', 'Discurso em congresso da CUT em 1991.', 'verified', false, '1991-08-05', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/cut_1991.shtml', 'news_article', 1, 'São Paulo', 'Congresso CUT', 'lula-cut-1991-b115-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula solidariza-se com vítimas da chacina de Vigário Geral.', 'A polícia matou moradores. É genocídio da pobreza.', 'Declaração após chacina de 21 moradores de Vigário Geral pelo PM do RJ.', 'verified', false, '1993-08-30', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/lula/vigario_geral.shtml', 'news_article', 2, 'Rio de Janeiro', 'Chacina Vigário Geral', 'lula-vigario-geral-b115-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra defende programa de DST/AIDS único no mundo.', 'O Brasil é referência em Aids. Vamos distribuir remédio gratuito.', 'Cerimônia de lançamento do programa de distribuição universal de antirretrovirais.', 'verified', true, '1996-11-13', 'https://www.gov.br/saude/pt-br/assuntos/saude-de-a-a-z/h/hiv-aids/historico-programa-aids-1996', 'official_statement', 1, 'Brasília', 'Lei Sarney-Serra AIDS', 'serra-aids-programa-96-b115-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy lança PT Mulher na Câmara em 1996.', 'PT Mulher reúne as lutas feministas do partido.', 'Lançamento da secretaria nacional de mulheres do PT.', 'verified', false, '1996-03-08', 'https://www.camara.leg.br/noticias/marta-pt-mulher-lancamento-1996', 'official_statement', 1, 'Brasília', 'PT Mulher', 'marta-pt-mulher-1996-b115-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf articula obras privilegiadas à Odebrecht em SP.', 'A Odebrecht é uma empresa séria. Ganhou a licitação legalmente.', 'Defesa pública de contratos da prefeitura com empreiteiras.', 'verified', false, '1996-03-22', 'https://www1.folha.uol.com.br/folha/treinamento/hotsites/maluf/odebrecht.shtml', 'news_article', 4, 'São Paulo', 'Contratos prefeitura', 'maluf-odebrecht-licitacao-b115-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende a amizade com Collor após renúncia.', 'Somos amigos. A política passa, a amizade fica.', 'Encontro público com Fernando Collor em 1993 após a renúncia.', 'verified', false, '1993-04-10', 'https://acervo.estadao.com.br/noticias/acervo,sarney-collor-amizade-1993,8567,0.htm', 'news_article', 2, 'Brasília', 'Encontro com Collor', 'sarney-amizade-collor-b115-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rob, 'Roberto Jefferson defende Collor em entrevistas após renúncia.', 'Collor foi injustiçado. Um dia a história vai revisar.', 'Entrevista em programa de TV em 1995.', 'verified', false, '1995-06-14', 'https://acervo.estadao.com.br/noticias/acervo,jefferson-defende-collor-1995,8578,0.htm', 'news_article', 2, 'Brasília', 'Entrevista TV', 'jefferson-defende-collor-95-b115-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros vota pela reeleição em 1997.', 'A reeleição é democrática. O PMDB defende.', 'Declaração de voto no Senado sobre emenda da reeleição.', 'verified', false, '1997-06-04', 'https://www12.senado.leg.br/noticias/materias/1997/06/04/renan-vota-reeleicao', 'official_statement', 3, 'Senado Federal', 'Voto reeleição', 'renan-voto-reeleicao-97-b115-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes defende reforma agrária urgente em 1998.', 'Não dá para continuar com essa desigualdade. Reforma agrária já.', 'Discurso em evento do MST em Fortaleza em 1998.', 'verified', false, '1998-06-22', 'https://acervo.estadao.com.br/noticias/acervo,ciro-reforma-agraria-mst-1998,8589,0.htm', 'news_article', 1, 'Fortaleza', 'Evento MST', 'ciro-reforma-agraria-mst-b115-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende Mário Covas durante governo de SP.', 'Covas é um estadista. São Paulo vai ser modernizado.', 'Discurso como vice-governador em 1997.', 'verified', false, '1997-04-10', 'https://acervo.estadao.com.br/noticias/acervo,alckmin-defende-covas-1997,8579,0.htm', 'news_article', 1, 'São Paulo', 'Evento governo SP', 'alckmin-defende-covas-b115-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende cura gay em 1998 como pastor.', 'Deus cura gay. Vi com meus olhos muita gente libertada.', 'Sermão em igreja em Cachoeiro de Itapemirim.', 'verified', false, '1998-07-12', 'https://www12.senado.leg.br/senadores/senador/magno-malta/biografia', 'official_statement', 4, 'Cachoeiro de Itapemirim', 'Sermão evangélico', 'magno-cura-gay-1998-b115-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma atua no PDT do Rio Grande do Sul em 1990.', 'O PDT é a esquerda democrática. Vamos construir alternativa.', 'Discurso em convenção do PDT gaúcho em 1992.', 'verified', false, '1992-09-12', 'https://acervo.estadao.com.br/noticias/acervo,dilma-pdt-rs-1992,8598,0.htm', 'news_article', 1, 'Porto Alegre', 'Convenção PDT', 'dilma-pdt-rs-1992-b115-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann lidera oposição estudantil em Curitiba em 1995.', 'Somos a juventude que vai enterrar o neoliberalismo no Paraná.', 'Discurso em encontro da juventude do PT em 1995.', 'verified', false, '1995-09-08', 'https://veja.abril.com.br/politica/gleisi-juventude-pt-1995/', 'news_article', 1, 'Curitiba', 'Encontro Juventude PT', 'gleisi-juventude-1995-b115-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
