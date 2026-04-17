DO $$
DECLARE
  v_lula UUID; v_rcosta UUID; v_hadd UUID; v_tarc UUID; v_zema UUID; v_caiado UUID;
  v_helder UUID; v_rnunes UUID; v_epaes UUID; v_fuad UUID; v_jcampos UUID; v_breis UUID;
  v_dalmeida UUID; v_melo UUID; v_greca UUID; v_sarto UUID; v_topazio UUID;
  v_waldez UUID; v_sabino UUID; v_paula UUID; v_macedo UUID; v_lsantos UUID; v_marga UUID;
  v_jair UUID; v_edu UUID; v_nik UUID; v_vanh UUID; v_adri UUID; v_kim UUID;
  v_tabata UUID; v_erika UUID; v_samia UUID; v_boulos UUID; v_janones UUID;
  v_padilha UUID; v_marinho UUID; v_sonia UUID; v_taliria UUID; v_chico UUID;
  v_orlando UUID; v_melchi UUID; v_jandira UUID; v_tebet UUID; v_wdias UUID;
  v_camilo UUID; v_anielle UUID; v_nisia UUID; v_lupi UUID;

  c_irr UUID; c_des UUID; c_abu UUID; c_con UUID; c_cor UUID; c_odi UUID;
  c_nep UUID; c_ame UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_rcosta FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_hadd FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_tarc FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zema FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_caiado FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_helder FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_rnunes FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_epaes FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_fuad FROM politicians WHERE slug = 'fuad-noman';
  SELECT id INTO v_jcampos FROM politicians WHERE slug = 'joao-campos';
  SELECT id INTO v_breis FROM politicians WHERE slug = 'bruno-reis';
  SELECT id INTO v_dalmeida FROM politicians WHERE slug = 'david-almeida';
  SELECT id INTO v_melo FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_greca FROM politicians WHERE slug = 'rafael-greca';
  SELECT id INTO v_sarto FROM politicians WHERE slug = 'jose-sarto';
  SELECT id INTO v_topazio FROM politicians WHERE slug = 'topazio-silveira';
  SELECT id INTO v_waldez FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_sabino FROM politicians WHERE slug = 'celso-sabino';
  SELECT id INTO v_paula FROM politicians WHERE slug = 'andre-de-paula';
  SELECT id INTO v_macedo FROM politicians WHERE slug = 'marcio-macedo';
  SELECT id INTO v_lsantos FROM politicians WHERE slug = 'luciana-santos';
  SELECT id INTO v_marga FROM politicians WHERE slug = 'margareth-menezes';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_vanh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_adri FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_tabata FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_erika FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_samia FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_boulos FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_janones FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_padilha FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_marinho FROM politicians WHERE slug = 'luiz-marinho';
  SELECT id INTO v_sonia FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_taliria FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_chico FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_orlando FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_melchi FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_jandira FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_tebet FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_wdias FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_camilo FROM politicians WHERE slug = 'camilo-santana';
  SELECT id INTO v_anielle FROM politicians WHERE slug = 'anielle-franco';
  SELECT id INTO v_nisia FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_lupi FROM politicians WHERE slug = 'carlos-lupi';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula lança Novo PAC com R$ 1,7 trilhão em investimentos até 2026.', 'O Novo PAC é o maior programa de investimentos da história do Brasil. São R$ 1,7 trilhão até 2026.', 'Cerimônia de lançamento do Novo Programa de Aceleração do Crescimento no Planalto.', 'verified', true, '2023-08-11', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-novo-pac-lancamento', 'other', 1, 'Palácio do Planalto', 'Lançamento Novo PAC', 'lula-novo-pac-lancamento-b154-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa anuncia sistematização de eixos do Novo PAC em áreas sociais e de transporte.', 'O Novo PAC tem nove eixos, do transporte à saúde. É o maior programa de obras do país.', 'Detalhamento do programa em entrevista.', 'verified', false, '2023-08-18', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-pac-eixos-2023', 'other', 1, 'Casa Civil', 'Coletiva PAC', 'rcosta-pac-eixos-b154-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza Novo PAC dizendo que obras nunca sairão do papel.', 'Esse PAC aí é só apresentação. Obra do PT nunca sai do papel. Só propaganda.', 'Declaração em evento do PL em São Paulo.', 'verified', true, '2023-08-14', 'https://www.poder360.com.br/politica/bolsonaro-ironiza-pac-lula/', 'news_article', 3, 'São Paulo', 'Evento PL', 'bolsonaro-ironiza-pac-b154-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio contrata R$ 5 bi em rodovias em São Paulo através de concessões.', 'São Paulo tem a maior rodovia do país e vai ser privatizada. Bilhões em investimentos do setor privado.', 'Anúncio de concessão do Lote Litoral Paulista.', 'verified', true, '2023-04-24', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-concessao-litoral-paulista-2023', 'other', 2, 'Palácio dos Bandeirantes', 'Leilão rodoviário', 'tarcisio-concessao-litoral-paulista-b154-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio anuncia túnel Santos-Guarujá como maior obra de infraestrutura de SP.', 'O túnel Santos-Guarujá vai ser a maior obra do Estado. Vamos entregar até 2029, independente do governo federal.', 'Anúncio de obra com orçamento de R$ 6 bi.', 'verified', true, '2024-10-15', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-tunel-santos-guaruja-2024', 'other', 2, 'Santos, SP', 'Anúncio túnel', 'tarcisio-tunel-santos-guaruja-b154-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa defende transposição do São Francisco entregue após 17 anos.', 'Entregamos o que Bolsonaro disse que não se fazia. O Eixo Norte da transposição foi concluído.', 'Declaração em entrega da obra no Ceará.', 'verified', false, '2023-12-07', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-transposicao-sao-francisco-2023', 'other', 1, 'Ceará', 'Entrega transposição', 'rcosta-transposicao-sao-francisco-b154-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_helder, 'Helder Barbalho anuncia BR-163 pavimentada integralmente após 50 anos.', 'A BR-163 vai estar 100% pavimentada pela primeira vez. É isso que é investimento em logística.', 'Anúncio de entrega do último trecho da rodovia no Pará.', 'verified', true, '2024-05-18', 'https://agenciapara.com.br/noticia/helder-br163-pavimentada-2024', 'other', 1, 'Pará', 'Entrega BR-163', 'helder-br163-pavimentada-b154-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia retomada de Ferrovia Transnordestina como obra-chave do PAC.', 'A Transnordestina volta. Ela vai transformar o Nordeste e gerar milhares de empregos.', 'Anúncio de retomada após anos de paralisação.', 'verified', true, '2023-10-02', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-transnordestina', 'other', 1, 'Nordeste', 'Retomada Transnordestina', 'lula-transnordestina-b154-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adri, 'Adriana Ventura critica PAC como programa de propina e superfaturamento.', 'O PAC do PT foi o maior esquema de corrupção do país. E agora volta com tudo. Ninguém aprendeu nada.', 'Discurso em plenário contra programa de obras.', 'verified', true, '2023-08-22', 'https://www.camara.leg.br/noticias/adriana-ventura-pac-superfaturamento-2023', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento plenário', 'adriana-pac-superfaturamento-b154-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rnunes, 'Ricardo Nunes anuncia conclusão de linhas do monotrilho da Linha 15 em SP.', 'A Linha 15 está quase concluída. A Prefeitura de SP entrega o que o Estado não conseguiu.', 'Declaração sobre obras de mobilidade em SP.', 'verified', false, '2024-06-20', 'https://www.capital.sp.gov.br/noticias/ricardo-nunes-linha-15-monotrilho-2024', 'other', 2, 'São Paulo', 'Obra monotrilho', 'rnunes-linha-15-monotrilho-b154-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio privatiza Sabesp enfrentando protestos da oposição.', 'A Sabesp privatizada vai acelerar o saneamento. Brasil inteiro vai ter água em dez anos.', 'Cerimônia de privatização após aprovação na Alesp.', 'verified', true, '2024-07-22', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-sabesp-privatizada-2024', 'other', 3, 'Bovespa', 'IPO Sabesp', 'tarcisio-sabesp-privatizada-b154-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton denuncia privatização da Sabesp como entrega do saneamento ao mercado.', 'Privatizar a Sabesp é entregar água, direito humano, para lucro de bancos. Não vamos aceitar.', 'Discurso em ato de protesto contra privatização em SP.', 'verified', true, '2024-07-20', 'https://www.psol50.org.br/noticias/erika-hilton-sabesp-2024', 'news_article', 2, 'São Paulo', 'Ato protesto Sabesp', 'erika-ataca-sabesp-b154-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema defende privatização da Cemig com desespero fiscal.', 'A Cemig precisa ser privatizada. Sem isso, Minas entra em colapso financeiro.', 'Entrevista à Folha de SP defendendo desestatização.', 'verified', true, '2024-09-05', 'https://www.folha.uol.com.br/mercado/2024/09/zema-privatizacao-cemig.shtml', 'news_article', 3, 'Palácio Tiradentes', 'Entrevista Folha', 'zema-privatizacao-cemig-b154-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sabino, 'Celso Sabino anuncia plano de retomada de voos regionais com subsídio Voa Brasil.', 'O Voa Brasil vai conectar o país com voos por R$ 200. A aviação regional será resgatada.', 'Lançamento do programa federal de aviação.', 'verified', true, '2024-03-14', 'https://www.gov.br/turismo/pt-br/noticias/sabino-voa-brasil-2024', 'other', 1, 'Ministério do Turismo', 'Lançamento Voa Brasil', 'sabino-voa-brasil-b154-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri ironiza Voa Brasil como promessa eleitoral que não decolou.', 'O Voa Brasil não voou. Como todo anúncio do PT, propaganda pura e vazia.', 'Discurso na CCJ após programa atrasar cronograma.', 'verified', false, '2024-08-01', 'https://www.camara.leg.br/noticias/kim-voa-brasil-ironia-2024', 'news_article', 3, 'Câmara dos Deputados', 'Discurso CCJ', 'kim-voa-brasil-ironia-b154-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia Minha Casa Minha Vida com meta de 2 milhões de moradias até 2026.', 'O MCMV volta para entregar 2 milhões de casas. A habitação popular é prioridade.', 'Cerimônia de relançamento no Planalto.', 'verified', true, '2023-02-14', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-mcmv-relancamento', 'other', 1, 'Palácio do Planalto', 'Relançamento MCMV', 'lula-mcmv-2milhoes-b154-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jcampos, 'João Campos anuncia obras do VLT do Capibaribe em Recife.', 'O VLT do Capibaribe é mobilidade para os mais pobres. Vamos entregar antes do fim do mandato.', 'Anúncio de obra municipal.', 'verified', false, '2024-03-25', 'https://www2.recife.pe.gov.br/noticias/joao-campos-vlt-capibaribe-2024', 'other', 1, 'Recife', 'Anúncio VLT', 'jcampos-vlt-capibaribe-b154-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_greca, 'Rafael Greca inaugura Ligeirinho Metropolitano em Curitiba antes de deixar mandato.', 'O Ligeirinho Metropolitano é nosso legado. Curitiba continua sendo referência em transporte.', 'Inauguração pré-eleição.', 'verified', false, '2024-09-10', 'https://www.curitiba.pr.gov.br/noticias/greca-ligeirinho-2024', 'other', 1, 'Curitiba', 'Inauguração Ligeirinho', 'greca-ligeirinho-curitiba-b154-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_breis, 'Bruno Reis anuncia BRT Salvador com atraso e superfaturamento investigado pelo TCM.', 'O BRT de Salvador vai ser entregue. Críticas sobre custo são politicagem.', 'Declaração após questionamentos sobre aditivos na obra.', 'verified', true, '2024-08-15', 'https://www.salvador.ba.gov.br/noticias/bruno-reis-brt-salvador-2024', 'other', 3, 'Prefeitura de Salvador', 'Entrevista coletiva', 'breis-brt-salvador-b154-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epaes, 'Eduardo Paes inaugura Linha 3 do VLT do Rio na Zona Portuária.', 'O VLT é a melhor obra de mobilidade do Rio. Entregamos a Linha 3 operando plenamente.', 'Inauguração em cerimônia oficial.', 'verified', false, '2024-07-23', 'https://prefeitura.rio/cidade/eduardo-paes-vlt-linha-3-2024/', 'other', 1, 'Rio de Janeiro', 'Inauguração VLT Linha 3', 'paes-vlt-linha-3-b154-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_helder, 'Helder Barbalho anuncia COP30 com infraestrutura de Belém reformada.', 'Belém vai sediar a COP30 totalmente preparada. Infraestrutura que vai ficar para a cidade.', 'Anúncio de obras para preparação da conferência climática.', 'verified', true, '2024-11-15', 'https://agenciapara.com.br/noticia/helder-cop30-belem-infra-2024', 'other', 2, 'Belém, PA', 'Preparação COP30', 'helder-cop30-belem-b154-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre obras da COP30 em Belém.', 'Desmataram a Amazônia para fazer rodovia da COP do clima. É a maior hipocrisia do século.', 'Vídeo no X com informações descontextualizadas sobre obra já licenciada desde antes da COP.', 'verified', true, '2024-11-20', 'https://www.aosfatos.org/noticias/nikolas-cop30-desmatamento-desinformacao/', 'social_media_post', 4, 'Redes sociais', 'Postagem X', 'nikolas-cop30-desmatamento-b154-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad defende parceria público-privada em saneamento após aprovação do novo marco.', 'O saneamento precisa de parceria entre público e privado para chegar a todos. É urgente.', 'Entrevista sobre marco legal do saneamento.', 'verified', false, '2023-11-22', 'https://valor.globo.com/politica/noticia/2023/11/22/haddad-saneamento-ppp.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Entrevista Valor', 'haddad-saneamento-ppp-b154-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_waldez, 'Waldez Góes anuncia reconstrução do RS com R$ 18 bi em infraestrutura.', 'A reconstrução do RS vai custar R$ 18 bilhões só em infraestrutura. Tudo vai ser refeito.', 'Declaração após avaliação inicial dos danos.', 'verified', true, '2024-06-10', 'https://www.gov.br/mdr/pt-br/noticias/waldez-rs-reconstrucao-18bi', 'other', 2, 'MDR', 'Plano reconstrução RS', 'waldez-rs-reconstrucao-b154-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro acusa governo de negligência na catástrofe do RS.', 'Não foi só a chuva. Foi a negligência do Lula que matou tanta gente no Sul.', 'Postagem no X em que atribuiu catástrofe climática a governo federal.', 'verified', true, '2024-05-10', 'https://www.poder360.com.br/politica/eduardo-acusa-lula-rs-negligencia/', 'social_media_post', 4, 'Redes sociais', 'Postagem X', 'eduardo-acusa-lula-rs-b154-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_melo, 'Sebastião Melo anuncia reconstrução completa do sistema de bombas de Porto Alegre.', 'O sistema de bombas falhou. Vamos reconstruir todo ele, custe o que custar. Porto Alegre não pode repetir esse cenário.', 'Pronunciamento após visita aos bairros atingidos.', 'verified', true, '2024-06-01', 'https://prefeitura.poa.br/noticias/melo-bombas-reconstrucao-2024', 'other', 2, 'Porto Alegre', 'Anúncio reconstrução', 'melo-bombas-poa-reconstrucao-b154-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone denuncia negligência do governo municipal de Niterói em obras de contenção.', 'Falaram durante anos em prevenção. Cadê as obras? Morros de Niterói continuam desprotegidos.', 'Discurso em plenário após deslizamento no Morro do Bumba.', 'verified', false, '2023-11-15', 'https://www.camara.leg.br/noticias/taliria-niteroi-deslizamento-2023', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'taliria-niteroi-deslizamento-b154-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa lança pacote de R$ 100 bi em obras hídricas no Nordeste.', 'O Nordeste finalmente vai ter a maior carga de obras hídricas da história. Tudo previsto no PAC.', 'Cerimônia em Pernambuco com governadores nordestinos.', 'verified', false, '2024-02-20', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-100bi-hidrico-ne', 'other', 1, 'Pernambuco', 'Pacote hídrico NE', 'rcosta-100bi-hidrico-ne-b154-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Ferrogrão parou por culpa do STF e minimiza impactos ambientais.', 'A Ferrogrão vai desenvolver o Pará e o Mato Grosso. STF parou porque inventou ameaça a indígena.', 'Entrevista a ruralistas criticando decisão cautelar do STF.', 'verified', true, '2023-06-28', 'https://www.poder360.com.br/politica/bolsonaro-ferrograo-stf/', 'news_article', 3, 'Brasília', 'Entrevista ruralistas', 'bolsonaro-ferrograo-stf-b154-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sonia, 'Sônia Guajajara defende adiamento da Ferrogrão até consulta a comunidades indígenas.', 'A Ferrogrão não pode ser aprovada sem consulta livre, prévia e informada aos povos da região.', 'Declaração sobre impacto socioambiental do projeto.', 'verified', true, '2023-07-05', 'https://www.gov.br/povosindigenas/pt-br/noticias/sonia-ferrograo-2023', 'other', 2, 'MPI', 'Declaração Ferrogrão', 'sonia-ferrograo-consulta-b154-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio lança Linha 19 do Metrô com parceria sem precedentes em SP.', 'A Linha 19-Celeste vai ligar Bom Retiro a Guarulhos. É a maior PPP de metrô da América Latina.', 'Leilão e assinatura de concessão.', 'verified', true, '2024-04-18', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-linha-19-metro-2024', 'other', 2, 'São Paulo', 'Concessão Linha 19', 'tarcisio-linha-19-metro-b154-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orlando, 'Orlando Silva cobra investigação sobre superfaturamento em obras de Tarcísio.', 'As obras de Tarcísio têm sobrepreço sistemático. TCU precisa investigar o padrão de aditivos.', 'Discurso em plenário sobre contratos estaduais paulistas.', 'verified', false, '2024-06-05', 'https://www.camara.leg.br/noticias/orlando-silva-tarcisio-sobrepreco-2024', 'news_article', 3, 'Câmara dos Deputados', 'Pronunciamento', 'orlando-silva-tarcisio-sobrepreco-b154-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman inaugura BRT Move 2 em Belo Horizonte após anos parado.', 'O Move 2 vai reduzir o tempo de viagem dos belorizontinos. Uma obra que demorou demais.', 'Inauguração de corredor viário em BH.', 'verified', false, '2024-04-30', 'https://prefeitura.pbh.gov.br/noticias/fuad-brt-move-2-2024', 'other', 1, 'Belo Horizonte', 'Inauguração Move 2', 'fuad-brt-move-2-bh-b154-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema cancela obras do Rodoanel de BH em revisão de gastos.', 'O Rodoanel de BH foi superestimado. Estamos revendo o projeto para caber no orçamento.', 'Anúncio de revisão de obras do estado.', 'verified', true, '2024-03-18', 'https://www.em.com.br/politica/2024/03/zema-rodoanel-bh.shtml', 'news_article', 3, 'Palácio Tiradentes', 'Anúncio revisão', 'zema-rodoanel-bh-cancela-b154-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_helder, 'Helder Barbalho anuncia Ponte Guamá em Belém inaugurada antes da COP30.', 'A Ponte Guamá será inaugurada antes da COP30. Nosso compromisso com o mundo é cumprido.', 'Declaração em visita de obra.', 'verified', false, '2025-06-10', 'https://agenciapara.com.br/noticia/helder-ponte-guama-cop30-2025', 'other', 1, 'Belém, PA', 'Visita obra ponte', 'helder-ponte-guama-cop30-b154-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caiado, 'Ronaldo Caiado anuncia duplicação da BR-060 com recursos próprios de GO.', 'A BR-060 vai ser duplicada até Jataí. Goiás não espera pelo governo federal para fazer obra.', 'Anúncio em ato estadual com fanfarra.', 'verified', false, '2024-05-22', 'https://www.go.gov.br/noticias/caiado-br060-duplicacao-2024', 'other', 2, 'Goiás', 'Anúncio BR-060', 'caiado-br060-duplicacao-b154-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa defende resposta à crítica do TCU sobre atrasos no PAC.', 'As obras do PAC têm prazos realistas. O que o TCU aponta são ajustes naturais em megaempreendimentos.', 'Resposta a relatório do TCU apontando 30% de atraso médio.', 'verified', true, '2024-11-08', 'https://g1.globo.com/politica/noticia/2024/11/08/rui-costa-tcu-pac-atrasos.ghtml', 'news_article', 3, 'Casa Civil', 'Declaração ao TCU', 'rcosta-tcu-pac-atrasos-b154-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar cobra transparência em contratos do Novo PAC com portal de dados abertos.', 'Queremos o PAC na luz. Toda informação de obras precisa estar em dados abertos, com CNPJ de empreiteiras.', 'Requerimento ao Ministério da Casa Civil.', 'verified', false, '2024-07-08', 'https://www.camara.leg.br/noticias/chico-alencar-pac-transparencia-2024', 'news_article', 1, 'Câmara dos Deputados', 'Requerimento', 'chico-pac-transparencia-b154-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarto, 'José Sarto anuncia VLT de Fortaleza sem conseguir inaugurar antes de deixar cargo.', 'O VLT de Fortaleza é realidade próxima. Estou deixando as obras praticamente prontas.', 'Declaração em fim de mandato sobre obra que seguiu atrasada.', 'verified', false, '2024-12-20', 'https://www.fortaleza.ce.gov.br/noticias/sarto-vlt-fortaleza-fim-mandato', 'other', 2, 'Fortaleza', 'Balanço fim de mandato', 'sarto-vlt-fortaleza-b154-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dalmeida, 'David Almeida anuncia BRT Manaus inaugurado parcialmente para Parintins.', 'Manaus terá sua primeira rede de BRT até o Festival de Parintins. Promessa cumprida.', 'Inauguração parcial.', 'verified', false, '2024-06-20', 'https://www.manaus.am.gov.br/noticias/david-brt-manaus-2024', 'other', 1, 'Manaus', 'Inauguração BRT', 'dalmeida-brt-manaus-b154-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sabino, 'Celso Sabino anuncia reforma de aeroportos no Nordeste para COP30.', 'Todos os aeroportos da região amazônica serão reformados até a COP30. Vamos estar prontos.', 'Anúncio de contratos de reforma aeroportuária.', 'verified', false, '2024-02-28', 'https://www.gov.br/turismo/pt-br/noticias/sabino-aeroportos-cop30-2024', 'other', 1, 'Ministério do Turismo', 'Reforma aeroportos', 'sabino-aeroportos-cop30-b154-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_paula, 'André de Paula anuncia portos pesqueiros modernizados na Bahia e Pernambuco.', 'A pesca artesanal precisa de portos dignos. Bahia e PE vão ter portos novos.', 'Anúncio de obras do ministério.', 'verified', false, '2024-05-14', 'https://www.gov.br/mpa/pt-br/noticias/paula-portos-pesqueiros-2024', 'other', 1, 'MPA', 'Anúncio portos pesqueiros', 'paula-portos-pesqueiros-b154-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lsantos, 'Luciana Santos lança programa Nova Indústria Brasil para infraestrutura científica.', 'A Nova Indústria vai modernizar a infraestrutura de pesquisa e C&T em todo o país.', 'Lançamento de programa interministerial.', 'verified', false, '2024-01-22', 'https://www.gov.br/mcti/pt-br/noticias/lsantos-nova-industria-2024', 'other', 1, 'MCTI', 'Lançamento Nova Indústria', 'lsantos-nova-industria-ct-b154-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia construção de 100 UPAs até 2026.', 'Vamos construir 100 UPAs em áreas desatendidas. A saúde chega onde o cidadão está.', 'Anúncio do programa federal de emergências.', 'verified', false, '2024-02-14', 'https://www.gov.br/saude/pt-br/noticias/padilha-100-upas-2024', 'other', 1, 'Ministério da Saúde', 'Lançamento UPAs', 'padilha-100-upas-b154-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_camilo, 'Camilo Santana anuncia 1 milhão de novas vagas em creches até 2026.', 'Mães pobres precisam de creche. Vamos entregar 1 milhão de vagas até o fim do mandato.', 'Anúncio de programa federal de creches.', 'verified', false, '2023-11-30', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-creches-1milhao-2023', 'other', 1, 'MEC', 'Anúncio creches', 'camilo-1milhao-creches-b154-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_janones, 'Janones acusa governo Tarcísio de obras fantasmas em rodovias do interior de SP.', 'Tarcísio inaugura placa. Essa obra não existe, é obra fantasma, é marketing.', 'Vídeo no Instagram denunciando suposta obra inexistente.', 'verified', true, '2024-06-18', 'https://www.oantagonista.com/politica/janones-tarcisio-obra-fantasma-sp', 'social_media_post', 3, 'Redes sociais', 'Postagem Instagram', 'janones-tarcisio-obra-fantasma-b154-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral defende priorização de obras de mobilidade urbana sobre rodovias.', 'O Brasil investe demais em rodovias e de menos em mobilidade urbana. Precisamos inverter essa lógica.', 'Discurso em audiência sobre transporte.', 'verified', false, '2024-04-10', 'https://www.camara.leg.br/noticias/tabata-mobilidade-urbana-2024', 'news_article', 1, 'Câmara dos Deputados', 'Audiência pública', 'tabata-mobilidade-urbana-b154-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_boulos, 'Boulos critica obras do Minha Casa Minha Vida que favorecem construtoras grandes.', 'O MCMV precisa priorizar entidades populares, e não só as grandes construtoras enriquecendo.', 'Discurso em ato do MTST.', 'verified', false, '2024-07-14', 'https://www.mtst.org/noticias/boulos-mcmv-construtoras-2024', 'news_article', 2, 'São Paulo', 'Ato MTST', 'boulos-mcmv-construtoras-b154-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanh, 'Marcel van Hattem apoia privatização integral de Correios, Caixa e BB.', 'Correios, Caixa e BB devem ser integralmente privatizados. Estado não faz logística bem, não faz banco bem.', 'Discurso em congresso do Novo.', 'verified', false, '2023-10-21', 'https://novo.org.br/noticias/van-hattem-privatizacao-correios-caixa-bb-2023', 'news_article', 3, 'Novo SP', 'Congresso partidário', 'vanhattem-privatizacao-correios-caixa-b154-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia FNO Clima para financiar transição energética na Amazônia.', 'O FNO Clima vai financiar a transição energética na Amazônia. Preservação com investimento é o modelo.', 'Lançamento na abertura de evento no Pará.', 'verified', true, '2024-08-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-fno-clima', 'other', 1, 'Pará', 'Lançamento FNO Clima', 'lula-fno-clima-amazonia-b154-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rnunes, 'Ricardo Nunes anuncia Corredor Noroeste de SP como prioridade pré-eleitoral.', 'O Corredor Noroeste vai ser entregue em 2026. Mobilidade é prioridade absoluta de SP.', 'Anúncio em ato pré-eleitoral.', 'verified', false, '2024-08-10', 'https://www.capital.sp.gov.br/noticias/ricardo-nunes-corredor-noroeste-2024', 'other', 2, 'São Paulo', 'Anúncio pré-eleição', 'rnunes-corredor-noroeste-sp-b154-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad garante recursos ao Novo PAC mesmo com arcabouço fiscal apertado.', 'O Novo PAC tem recursos garantidos dentro do arcabouço fiscal. Não vai faltar dinheiro para obra.', 'Entrevista à GloboNews.', 'verified', false, '2024-05-10', 'https://g1.globo.com/politica/noticia/2024/05/10/haddad-pac-arcabouco.ghtml', 'news_article', 2, 'Ministério da Fazenda', 'Entrevista GloboNews', 'haddad-pac-arcabouco-b154-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim critica priorização do PAC Rodovias sobre transporte urbano.', 'O PAC privilegia rodovias do agro. Mobilidade urbana nas metrópoles fica sempre em segundo plano.', 'Discurso em plenário.', 'verified', false, '2024-02-28', 'https://www.camara.leg.br/noticias/samia-pac-rodovias-2024', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'samia-pac-rodovias-b154-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_greca, 'Rafael Greca inaugura Hospital Erasto Gaertner ampliado com R$ 300 mi da prefeitura.', 'Curitiba entrega hospital de câncer ampliado. A cidade investe no que salva vidas.', 'Inauguração no fim do mandato.', 'verified', false, '2024-11-15', 'https://www.curitiba.pr.gov.br/noticias/greca-hospital-erasto-2024', 'other', 1, 'Curitiba', 'Inauguração hospital', 'greca-hospital-erasto-b154-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_topazio, 'Topázio Silveira anuncia Ponte Hercílio Luz em obras finais em Florianópolis.', 'A Ponte Hercílio Luz está sendo revitalizada. Uma obra emblemática da cidade.', 'Declaração municipal.', 'verified', false, '2025-03-12', 'https://www.florianopolis.sc.gov.br/noticias/topazio-hercilio-luz-2025', 'other', 1, 'Florianópolis', 'Anúncio revitalização', 'topazio-hercilio-luz-b154-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa anuncia retomada de 73% das obras paradas da era Bolsonaro.', 'Já retomamos 73% das obras paradas pelo governo Bolsonaro. Brasil volta a construir.', 'Balanço de dois anos do Novo PAC.', 'verified', true, '2025-08-11', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-pac-73-obras-retomadas', 'other', 1, 'Casa Civil', 'Balanço PAC 2 anos', 'rcosta-pac-73pct-retomadas-b154-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha falsa informação sobre sobrepreço fictício em PAC.', 'Obras do PAC têm 1000% de sobrepreço. Brasil é o país mais caro do mundo para fazer estrada.', 'Vídeo no YouTube com dados inventados.', 'verified', true, '2024-10-15', 'https://www.aosfatos.org/noticias/nikolas-pac-sobrepreco-desinformacao/', 'social_media_post', 4, 'YouTube', 'Vídeo canal próprio', 'nikolas-pac-sobrepreco-fake-b154-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula inaugura primeira parte da Ferrovia de Integração Oeste-Leste na Bahia.', 'A Fiol entra em operação. Vai mudar a logística da Bahia e do Centro-Oeste.', 'Inauguração em cerimônia oficial.', 'verified', false, '2024-11-28', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-fiol-bahia', 'other', 1, 'Bahia', 'Inauguração Fiol', 'lula-fiol-bahia-b154-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio anuncia trem intercidades Campinas-SP como maior obra ferroviária estadual.', 'O trem Campinas-SP será entregue antes de 2030. É a maior obra ferroviária do Brasil.', 'Anúncio de concessão em cerimônia oficial.', 'verified', true, '2024-12-10', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-trem-intercidades-campinas-2024', 'other', 2, 'Palácio dos Bandeirantes', 'Concessão trem intercidades', 'tarcisio-trem-intercidades-b154-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton denuncia moradias precárias em obras do MCMV em SP.', 'O MCMV precisa ter qualidade. As famílias estão recebendo casas com problemas graves em SP.', 'Vistoria a empreendimento na zona leste.', 'verified', false, '2024-09-18', 'https://www.psol50.org.br/noticias/erika-hilton-mcmv-precario-2024', 'news_article', 2, 'São Paulo', 'Vistoria empreendimento', 'erika-mcmv-precario-sp-b154-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_macedo, 'Márcio Macedo anuncia programa Cidades Conectadas com internet em escolas rurais.', 'Todas escolas rurais terão internet de qualidade até 2026. Conectividade é direito básico.', 'Anúncio em parceria com MEC.', 'verified', false, '2024-06-04', 'https://www.gov.br/secretariageral/pt-br/noticias/macedo-cidades-conectadas-2024', 'other', 1, 'Secretaria-Geral', 'Lançamento programa', 'macedo-cidades-conectadas-b154-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marinho, 'Luiz Marinho anuncia novas agências do SINE reformadas em 200 cidades.', 'O SINE volta a atender com dignidade em 200 novas cidades. Geração de emprego precisa de estrutura.', 'Anúncio em balanço ministerial.', 'verified', false, '2024-08-01', 'https://www.gov.br/trabalho-e-emprego/pt-br/noticias/marinho-sine-agencias-2024', 'other', 1, 'MTE', 'Balanço SINE', 'marinho-sine-agencias-b154-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali defende obras do PAC da Saúde com novos CRMs prioritários no Rio.', 'O PAC da Saúde precisa chegar nas UPAs do RJ. Centro de Referência é prioridade zero.', 'Discurso em audiência pública sobre saúde fluminense.', 'verified', false, '2024-03-28', 'https://www.camara.leg.br/noticias/jandira-pac-saude-rj-2024', 'news_article', 1, 'Câmara dos Deputados', 'Audiência saúde RJ', 'jandira-pac-saude-rj-b154-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nisia, 'Nísia Trindade inaugura laboratório de IFA em parceria Fiocruz para vacinas nacionais.', 'A Fiocruz produzirá IFA nacional a partir de agora. Autonomia em vacinas é questão de soberania.', 'Inauguração em cerimônia oficial.', 'verified', false, '2024-08-02', 'https://www.gov.br/saude/pt-br/noticias/nisia-fiocruz-ifa-2024', 'other', 1, 'Fiocruz', 'Inauguração laboratório IFA', 'nisia-fiocruz-ifa-b154-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caiado, 'Ronaldo Caiado lança obras do Hospital Estadual do Entorno com apoio federal rejeitado.', 'Goiás não precisa de esmola federal. Nosso Hospital do Entorno vai ser entregue com recursos próprios.', 'Anúncio em visita a obras em Luziânia.', 'verified', false, '2024-07-12', 'https://www.go.gov.br/noticias/caiado-hospital-entorno-2024', 'other', 2, 'Luziânia', 'Anúncio obras', 'caiado-hospital-entorno-b154-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zema, 'Zema corta R$ 10 bi em investimentos em obras públicas em MG.', 'MG vai cortar R$ 10 bilhões em obras. Prefiro honestidade fiscal a obras que não se pagam.', 'Anúncio de ajuste fiscal com impacto direto em infraestrutura.', 'verified', true, '2025-02-20', 'https://www.em.com.br/politica/2025/02/zema-corte-10bi-obras-mg.shtml', 'news_article', 4, 'Palácio Tiradentes', 'Anúncio corte', 'zema-corte-10bi-obras-mg-b154-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_melchi, 'Fernanda Melchionna critica ausência de transparência em obras estaduais do RS.', 'Precisamos de auditoria na reconstrução do RS. Contratos precisam ser públicos e rastreáveis.', 'Discurso em plenário sobre gastos pós-enchente.', 'verified', false, '2024-08-22', 'https://www.camara.leg.br/noticias/melchionna-rs-auditoria-2024', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento', 'melchionna-rs-auditoria-b154-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula entrega primeira unidade do Minha Casa Minha Vida do Lula 3.', 'A primeira casa do MCMV entregue. Sou feliz em devolver sonhos às famílias brasileiras.', 'Cerimônia em conjunto habitacional no RJ.', 'verified', true, '2023-09-05', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2023/lula-mcmv-primeira-casa', 'other', 1, 'Rio de Janeiro', 'Entrega MCMV', 'lula-mcmv-primeira-casa-b154-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_helder, 'Helder Barbalho inaugura avenida Liberdade em Belém no valor de R$ 250 mi para COP30.', 'A nova Avenida Liberdade será marco da Belém moderna, pronta para receber o mundo.', 'Inauguração em cerimônia pré-COP30.', 'verified', false, '2025-08-10', 'https://agenciapara.com.br/noticia/helder-avenida-liberdade-belem-2025', 'other', 1, 'Belém', 'Inauguração Av. Liberdade', 'helder-av-liberdade-belem-b154-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa é criticado pelo TCU por falhas em monitoramento do PAC.', 'Divergências do TCU são normais em programas dessa magnitude. Nenhuma obra tem falha grave.', 'Resposta à reportagem da Folha sobre relatório crítico do TCU.', 'verified', true, '2025-03-18', 'https://www.folha.uol.com.br/mercado/2025/03/rui-costa-tcu-pac-monitoramento.shtml', 'news_article', 3, 'Casa Civil', 'Declaração à Folha', 'rcosta-tcu-pac-critica-b154-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro espalha desinformação de que Lula paralisou Ferrovia Norte-Sul.', 'Lula parou a Norte-Sul. No meu governo, entreguei 1000 km. Lula só destrói.', 'Entrevista em podcast falsamente atribuindo ao atual governo paralisação já existente.', 'verified', true, '2024-09-14', 'https://www.aosfatos.org/noticias/bolsonaro-norte-sul-desinformacao/', 'news_article', 4, 'Podcast', 'Entrevista podcast', 'bolsonaro-norte-sul-fake-b154-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adri, 'Adriana Ventura critica modelo atual de concessões rodoviárias.', 'As concessões rodoviárias estão entregando lucro e não resultado. O modelo precisa ser revisto.', 'Discurso em CPI da Infraero.', 'verified', false, '2024-10-05', 'https://www.camara.leg.br/noticias/adriana-concessoes-rodoviarias-2024', 'news_article', 2, 'Câmara dos Deputados', 'CPI Infraero', 'adriana-concessoes-rodoviarias-b154-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral defende PPPs em creches como modelo de expansão de educação infantil.', 'PPP de creche pode acelerar expansão da educação infantil. Temos que buscar modelos eficientes.', 'Entrevista a revista sobre educação.', 'verified', false, '2024-11-28', 'https://piaui.folha.uol.com.br/entrevista-tabata-creches-ppp-2024/', 'news_article', 2, 'Revista Piauí', 'Entrevista', 'tabata-ppp-creches-b154-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar pede tombamento de patrimônio ameaçado pelo BRT do Rio.', 'O BRT não pode destruir patrimônio histórico do Rio. Precisa haver conciliação entre modernidade e história.', 'Projeto de lei municipal.', 'verified', false, '2024-05-12', 'https://www.camara.leg.br/noticias/chico-alencar-patrimonio-brt-rio-2024', 'news_article', 1, 'Câmara dos Deputados', 'PL patrimônio', 'chico-patrimonio-brt-rio-b154-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio enfrenta polêmica de nomear filhos de apoiadores para cargos em concessionárias.', 'Nenhum cargo foi indevidamente distribuído. São escolhas técnicas baseadas em currículo.', 'Resposta a reportagem da UOL sobre cargos em estatais.', 'verified', true, '2025-06-22', 'https://www.uol.com.br/noticias/politica/2025/06/tarcisio-nomeacoes-estatais-sp.htm', 'news_article', 3, 'Palácio dos Bandeirantes', 'Declaração a imprensa', 'tarcisio-nomeacoes-estatais-b154-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_boulos, 'Boulos defende obras populares e critica PAC priorizar concessões.', 'O PAC tem muita PPP e pouca obra direta. O Estado precisa executar infraestrutura, não só financiar.', 'Discurso em ato do Psol.', 'verified', false, '2024-06-14', 'https://www.psol50.org.br/noticias/boulos-pac-ppp-critica-2024', 'news_article', 2, 'São Paulo', 'Ato PSOL', 'boulos-pac-ppp-b154-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarto, 'José Sarto anuncia elevado em avenida Washington Soares antes de perder reeleição.', 'O elevado da Washington Soares vai resolver o trânsito de Fortaleza. Entrega em 2026.', 'Anúncio pouco antes do primeiro turno.', 'verified', false, '2024-09-15', 'https://www.fortaleza.ce.gov.br/noticias/sarto-elevado-washington-soares-2024', 'other', 2, 'Fortaleza', 'Anúncio pré-eleição', 'sarto-elevado-washington-soares-b154-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wdias, 'Wellington Dias articula MCMV para beneficiários do Bolsa Família.', 'Quem recebe Bolsa Família tem prioridade no MCMV. Moradia e renda são combate à pobreza.', 'Anúncio de integração entre programas.', 'verified', false, '2024-02-06', 'https://www.gov.br/mds/pt-br/noticias-e-conteudos/mcmv-bolsa-familia-integracao', 'other', 1, 'MDS', 'Integração MCMV + BF', 'wdias-mcmv-bolsa-familia-b154-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_epaes, 'Eduardo Paes anuncia plano BRT Transbrasil com esforço pré-olímpico em 2016 como legado.', 'O legado do Rio olímpico está aí: BRTs funcionando, integrando a cidade. Foi investimento com retorno.', 'Discurso em inauguração de novas estações.', 'verified', false, '2024-04-05', 'https://prefeitura.rio/cidade/paes-brt-transbrasil-legado-2024/', 'other', 1, 'Rio de Janeiro', 'Inauguração estações', 'paes-brt-transbrasil-b154-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jcampos, 'João Campos inaugura túnel do Monteiro em Recife superando atraso de décadas.', 'O túnel do Monteiro foi prometido há décadas. Entregamos ele finalmente.', 'Inauguração em cerimônia oficial.', 'verified', false, '2024-12-05', 'https://www2.recife.pe.gov.br/noticias/joao-campos-tunel-monteiro-2024', 'other', 1, 'Recife', 'Inauguração túnel', 'jcampos-tunel-monteiro-b154-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hadd, 'Haddad defende corte no PAC Plano para cumprir arcabouço fiscal em 2025.', 'Precisamos cortar R$ 10 bi do PAC para manter credibilidade fiscal. Não é fácil, mas é necessário.', 'Declaração em reunião com prefeitos.', 'verified', true, '2025-04-18', 'https://valor.globo.com/politica/noticia/2025/04/18/haddad-corte-pac-fiscal.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'Reunião prefeitos', 'haddad-corte-pac-fiscal-b154-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa discorda publicamente de Haddad sobre corte no PAC.', 'Corte no PAC seria retrocesso. Obras não podem parar. Vamos negociar recursos.', 'Declaração após reunião ministerial conflituosa.', 'verified', true, '2025-04-21', 'https://www1.folha.uol.com.br/poder/2025/04/rui-costa-haddad-pac-corte.shtml', 'news_article', 3, 'Casa Civil', 'Declaração à imprensa', 'rcosta-haddad-pac-conflito-b154-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende PPP em saúde pública como solução para filas do SUS.', 'PPP em saúde funciona. Temos que importar modelos internacionais para o SUS.', 'Discurso em CCJ da Câmara.', 'verified', false, '2024-08-30', 'https://www.camara.leg.br/noticias/kim-ppp-saude-2024', 'news_article', 2, 'Câmara dos Deputados', 'CCJ', 'kim-ppp-saude-b154-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anielle, 'Anielle Franco anuncia obras específicas em quilombos com R$ 1 bi do PAC.', 'Os quilombos serão beneficiários do PAC. Saneamento, estrada e energia em cada comunidade.', 'Lançamento do programa específico.', 'verified', false, '2024-11-20', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-quilombos-pac-2024', 'other', 1, 'Ministério da Igualdade Racial', 'Lançamento PAC quilombos', 'anielle-quilombos-pac-b154-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone critica especulação imobiliária em áreas de reconstrução no RS.', 'Construtoras estão surfando na tragédia. Precisamos de controle para evitar especulação predatória no RS.', 'Discurso em plenário sobre reconstrução.', 'verified', false, '2024-08-15', 'https://www.camara.leg.br/noticias/taliria-rs-especulacao-2024', 'news_article', 2, 'Câmara dos Deputados', 'Pronunciamento plenário', 'taliria-rs-especulacao-b154-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_breis, 'Bruno Reis nomeia familiares para cargos em obras municipais de Salvador.', 'Nomeações são técnicas. Quem questiona competência está fazendo politicagem.', 'Resposta a matéria da Globo News sobre cargos comissionados.', 'verified', true, '2025-08-04', 'https://g1.globo.com/ba/bahia/noticia/2025/08/04/bruno-reis-nepotismo-obras-salvador.ghtml', 'news_article', 4, 'Prefeitura de Salvador', 'Declaração à imprensa', 'breis-nepotismo-salvador-b154-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dalmeida, 'David Almeida é investigado por superfaturamento em contratos de obras em Manaus.', 'Contratos estão todos dentro da lei. Denúncias são politicagem eleitoral.', 'Declaração após MP-AM abrir investigação em contratos de pavimentação.', 'verified', true, '2024-10-20', 'https://www.cnnbrasil.com.br/politica/david-almeida-mp-am-superfaturamento-2024/', 'news_article', 4, 'Manaus', 'Resposta ao MP-AM', 'dalmeida-mp-superfaturamento-b154-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tarc, 'Tarcísio anuncia plano Novo Rodoanel com maior extensão rodoviária do país.', 'O Novo Rodoanel de SP será a maior obra viária do Brasil. 178 km de extensão.', 'Anúncio em cerimônia oficial.', 'verified', true, '2025-05-12', 'https://www.saopaulo.sp.gov.br/noticias/tarcisio-novo-rodoanel-2025', 'other', 2, 'SP', 'Anúncio Novo Rodoanel', 'tarcisio-novo-rodoanel-b154-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula anuncia retomada da Refinaria Abreu e Lima em Pernambuco.', 'A refinaria Abreu e Lima volta a operar em plena capacidade. Brasil soberano em combustíveis.', 'Cerimônia em PE.', 'verified', false, '2024-05-22', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-abreu-e-lima', 'other', 2, 'Pernambuco', 'Inauguração Abreu e Lima', 'lula-abreu-e-lima-b154-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha desinformação sobre custo de Abreu e Lima.', 'Abreu e Lima custou R$ 100 bilhões e não produz nada. Festival de corrupção do PT.', 'Vídeo no Instagram com dados incorretos sobre refinaria.', 'verified', true, '2024-05-25', 'https://www.aosfatos.org/noticias/nikolas-abreu-e-lima-desinformacao/', 'social_media_post', 4, 'Instagram', 'Postagem', 'nikolas-abreu-e-lima-fake-b154-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_padilha, 'Padilha anuncia construção de 200 UBS em áreas remotas da Amazônia.', 'A Amazônia vai receber 200 novas UBS. SUS chegando onde antes não havia saúde pública.', 'Anúncio em visita a comunidade no Amazonas.', 'verified', false, '2025-07-03', 'https://www.gov.br/saude/pt-br/noticias/padilha-200-ubs-amazonia-2025', 'other', 1, 'Amazonas', 'Anúncio UBS Amazônia', 'padilha-200-ubs-amazonia-b154-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lsantos, 'Luciana Santos lança Polo Semicondutores no RS com recursos do PAC.', 'O Brasil volta à rota dos semicondutores. Polo em Porto Alegre com financiamento federal.', 'Cerimônia em Porto Alegre.', 'verified', false, '2024-10-22', 'https://www.gov.br/mcti/pt-br/noticias/lsantos-polo-semicondutores-rs-2024', 'other', 1, 'Porto Alegre', 'Lançamento polo', 'lsantos-polo-semicondutores-b154-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_camilo, 'Camilo Santana anuncia reforma de escolas federais com R$ 3 bi do PAC.', 'O PAC Escolas vai reformar 5 mil escolas até 2026. Infraestrutura da educação é prioridade.', 'Anúncio em Brasília.', 'verified', false, '2024-08-05', 'https://www.gov.br/mec/pt-br/assuntos/noticias/camilo-pac-escolas-2024', 'other', 1, 'MEC', 'Lançamento PAC Escolas', 'camilo-pac-escolas-b154-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_caiado, 'Caiado confirma quase conclusão do Rodoanel de Goiânia com 60 km.', 'Goiás entrega o Rodoanel, obra que vai desafogar Goiânia. Orgulho dos goianos.', 'Discurso em visita de obra.', 'verified', false, '2024-09-25', 'https://www.go.gov.br/noticias/caiado-rodoanel-goiania-2024', 'other', 1, 'Goiânia', 'Visita de obra', 'caiado-rodoanel-goiania-b154-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_melo, 'Sebastião Melo anuncia conclusão de diques de Porto Alegre com novo padrão.', 'Os diques vão ser reformados com padrão internacional. Porto Alegre precisa de resiliência climática.', 'Anúncio do plano de resiliência.', 'verified', false, '2025-02-18', 'https://prefeitura.poa.br/noticias/melo-diques-padrao-novo-2025', 'other', 2, 'Porto Alegre', 'Anúncio diques', 'melo-diques-padrao-novo-b154-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula garante 1 milhão de moradias entregues até fim de 2025 pelo MCMV.', 'Vamos entregar 1 milhão de casas até dezembro. Essa é a palavra do presidente da República.', 'Cerimônia em Feira de Santana.', 'verified', true, '2025-05-30', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-mcmv-1milhao', 'other', 1, 'Feira de Santana', 'Entrega MCMV', 'lula-mcmv-1milhao-entregas-b154-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama entregas de MCMV de farsa eleitoreira de Lula.', 'Entregas de casas é farsa. Lula passa uma chave para foto e nada funciona.', 'Entrevista em podcast atacando MCMV 3.', 'verified', true, '2025-06-02', 'https://www.poder360.com.br/politica/bolsonaro-mcmv-farsa-lula/', 'news_article', 4, 'Podcast', 'Entrevista podcast', 'bolsonaro-mcmv-farsa-b154-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fuad, 'Fuad Noman defende obras de mobilidade em BH herdadas de gestão Kalil.', 'BH continua entregando o que começou com Kalil. Gestão não se faz com rupturas.', 'Discurso em inauguração de obra.', 'verified', false, '2024-07-30', 'https://prefeitura.pbh.gov.br/noticias/fuad-obras-bh-kalil-2024', 'other', 1, 'BH', 'Inauguração obra', 'fuad-obras-bh-kalil-b154-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcosta, 'Rui Costa defende R$ 200 bi em investimentos do PAC já contratados em 2025.', 'O PAC já contratou R$ 200 bilhões em obras. É recorde histórico de ritmo de contratação.', 'Balanço em evento no Planalto.', 'verified', false, '2025-09-15', 'https://www.gov.br/casacivil/pt-br/noticias/rui-costa-pac-200bi-2025', 'other', 1, 'Palácio do Planalto', 'Balanço PAC 2025', 'rcosta-pac-200bi-2025-b154-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula comemora pior ano de paralisação revertido com ritmo de obras recorde em 2026.', 'Saímos de um país paralisado para o país que mais constrói no mundo. O Brasil voltou.', 'Discurso em cerimônia de entrega de obra rodoviária.', 'verified', true, '2026-01-12', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2026/lula-brasil-construcao-recorde', 'other', 1, 'Brasília', 'Entrega rodoviária', 'lula-brasil-construcao-recorde-b154-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
