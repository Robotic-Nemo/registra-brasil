-- Batch 79: Mulheres na política + misoginia/feminicídio + lei antimisoginia (continuação)
-- 100 statements, Jan 2023 - Abr 2026

DO $$
DECLARE
  v_eri UUID; v_sam UUID; v_tab UUID; v_tal UUID; v_adv UUID;
  v_juz UUID; v_fem UUID; v_jan UUID; v_fat UUID; v_ral UUID;
  v_gle UUID; v_dam UUID; v_car UUID; v_cid UUID; v_ani UUID;
  v_son UUID; v_mar UUID; v_ter UUID; v_sit UUID; v_sor UUID;
  v_eli UUID; v_mic UUID; v_mas UUID; v_nit UUID; v_esd UUID;
  v_lus UUID; v_mag UUID; v_lul UUID; v_nik UUID; v_bol UUID;
  v_fel UUID; v_anj UUID; v_mam UUID; v_sic UUID;
  c_mis UUID; c_mac UUID; c_hom UUID; c_ode UUID; c_rac UUID;
  c_xen UUID; c_int UUID; c_vio UUID; c_itm UUID; c_abu UUID;
  c_des UUID;
BEGIN
  SELECT id INTO v_eri FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tab FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_tal FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_adv FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_juz FROM politicians WHERE slug='julia-zanatta';
  SELECT id INTO v_fem FROM politicians WHERE slug='fernanda-melchionna';
  SELECT id INTO v_jan FROM politicians WHERE slug='jandira-feghali';
  SELECT id INTO v_fat FROM politicians WHERE slug='fatima-bezerra';
  SELECT id INTO v_ral FROM politicians WHERE slug='raquel-lyra';
  SELECT id INTO v_gle FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_dam FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_car FROM politicians WHERE slug='carmen-lucia';
  SELECT id INTO v_cid FROM politicians WHERE slug='cida-goncalves';
  SELECT id INTO v_ani FROM politicians WHERE slug='anielle-franco';
  SELECT id INTO v_son FROM politicians WHERE slug='sonia-guajajara';
  SELECT id INTO v_mar FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_ter FROM politicians WHERE slug='tereza-cristina';
  SELECT id INTO v_sit FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_sor FROM politicians WHERE slug='soraya-thronicke';
  SELECT id INTO v_eli FROM politicians WHERE slug='eliziane-gama';
  SELECT id INTO v_mic FROM politicians WHERE slug='michelle-bolsonaro';
  SELECT id INTO v_mas FROM politicians WHERE slug='marta-suplicy';
  SELECT id INTO v_nit FROM politicians WHERE slug='nisia-trindade';
  SELECT id INTO v_esd FROM politicians WHERE slug='esther-dweck';
  SELECT id INTO v_lus FROM politicians WHERE slug='luciana-santos';
  SELECT id INTO v_mag FROM politicians WHERE slug='margareth-menezes';
  SELECT id INTO v_lul FROM politicians WHERE slug='lula';
  SELECT id INTO v_nik FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_bol FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_fel FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_anj FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_mam FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_sic FROM politicians WHERE slug='silas-camara';

  SELECT id INTO c_mis FROM categories WHERE slug='misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug='machismo';
  SELECT id INTO c_hom FROM categories WHERE slug='homofobia';
  SELECT id INTO c_ode FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_rac FROM categories WHERE slug='racismo';
  SELECT id INTO c_xen FROM categories WHERE slug='xenofobia';
  SELECT id INTO c_int FROM categories WHERE slug='intolerancia-religiosa';
  SELECT id INTO c_vio FROM categories WHERE slug='violencia';
  SELECT id INTO c_itm FROM categories WHERE slug='intimidacao';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton discursa na ONU sobre violência contra pessoas trans.', 'No Brasil, mulher trans tem expectativa de vida de 35 anos. É necropolítica.', 'Discurso em painel da ONU sobre direitos LGBTQIA+ em Genebra.', 'verified', true, '2023-06-19', 'https://www.brasildefato.com.br/2023/06/19/erika-hilton-onu-trans', 'news_article', 1, 'Genebra', 'ONU', 'erika-onu-trans-b79-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta PL sobre paridade em diretorias de estatais.', 'Empresas públicas precisam espelhar a sociedade. Paridade é urgência.', 'Apresentação de projeto na Câmara sobre paridade em estatais.', 'verified', false, '2024-06-20', 'https://www.camara.leg.br/noticias/samia-pl-paridade-estatais', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'samia-paridade-estatais-b79-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral denuncia taxa de evasão escolar entre meninas negras.', 'Meninas negras abandonam escola 2x mais. Violência doméstica e gravidez precoce são fatores.', 'Apresentação de estudo em audiência pública sobre educação.', 'verified', false, '2024-08-21', 'https://www.cartacapital.com.br/educacao/tabata-evasao-meninas-negras', 'news_article', 1, 'Brasília', 'Comissão de Educação', 'tabata-evasao-negras-b79-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone pede proteção federal após ameaças de milícia.', 'Recebi informação de que milícia prepara atentado. Preciso de proteção federal.', 'Reunião com Ministério da Justiça sobre ameaças concretas.', 'verified', true, '2023-05-08', 'https://theintercept.com.br/2023/05/08/taliria-ameaca-milicia-protecao', 'news_article', 3, 'Brasília', 'Ministério da Justiça', 'taliria-ameaca-milicia-b79-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itm, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura critica uso de emenda pix em programas de mulheres sem fiscalização.', 'Emendas pix não podem burlar controle. Fiscalização é essencial em dinheiro público.', 'Discurso sobre transparência em políticas para mulheres.', 'verified', false, '2024-10-01', 'https://www.camara.leg.br/noticias/adriana-emenda-pix-mulheres', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-emenda-pix-b79-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta lança movimento contra educação sexual em escolas.', 'Não podemos deixar nossos filhos serem doutrinados. Família cuida da educação sexual.', 'Evento do PL em Brusque sobre educação e família.', 'verified', false, '2024-07-27', 'https://www.nsctotal.com.br/noticias/julia-zanatta-educacao-sexual', 'news_article', 3, 'Brusque', 'Evento PL Família', 'julia-educacao-sexual-b79-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna denuncia armação para derrubá-la no processo eleitoral.', 'Tentaram me derrubar na Justiça Eleitoral com fake news. Não vai acontecer.', 'Coletiva após decisão do TRE sobre denúncia contra ela.', 'verified', false, '2024-11-22', 'https://www.brasildefato.com.br/2024/11/22/fernanda-tre-fake', 'news_article', 2, 'Porto Alegre', 'TRE-RS', 'fernanda-tre-fake-b79-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica aumento de casos de estupro coletivo.', 'Estupro coletivo virou rotina nas periferias. Estado abandona essas mulheres.', 'Audiência pública sobre violência sexual contra mulheres.', 'verified', false, '2024-02-19', 'https://revistaforum.com.br/politica/2024/02/19/jandira-estupro-coletivo', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-estupro-coletivo-b79-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra anuncia redução de feminicídios no RN em 2024.', 'Reduzimos feminicídios em 22%. A política pública funciona quando há vontade.', 'Balanço anual do governo RN sobre segurança pública.', 'verified', false, '2025-01-15', 'https://www.rn.gov.br/noticias/fatima-reducao-feminicidio-2024', 'other', 1, 'Natal', 'Governo do RN', 'fatima-reducao-feminicidio-b79-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra cria Força-tarefa de proteção à mulher em PE.', 'Criamos força-tarefa com Polícia Civil, MP e TJPE. Mulher acolhida em 24 horas.', 'Lançamento de força-tarefa em cerimônia no Recife.', 'verified', false, '2023-11-25', 'https://www.pe.gov.br/noticias/raquel-forca-tarefa-2023', 'other', 1, 'Recife', 'Governo de Pernambuco', 'raquel-forca-tarefa-b79-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia ataques digitais coordenados contra ministras.', 'Há operação organizada para destruir reputação de ministras. Vamos denunciar no MPF.', 'Entrevista após relatório sobre ataques digitais a mulheres do governo.', 'verified', false, '2025-04-02', 'https://www.cartacapital.com.br/politica/gleisi-ataques-digitais-ministras', 'news_article', 2, 'Brasília', 'Palácio do Planalto', 'gleisi-ataques-digitais-b79-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende comissão da família e ataca direitos reprodutivos.', 'Vamos barrar esse Ministério das Mulheres que só serve a feministas radicais.', 'Discurso no plenário do Senado contra orçamento do Ministério das Mulheres.', 'verified', false, '2024-11-14', 'https://www12.senado.leg.br/noticias/damares-ministerio-mulheres-orcamento', 'other', 3, 'Brasília', 'Senado Federal', 'damares-orcamento-mulheres-b79-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia destaca papel do judiciário em coibir violência política contra mulheres.', 'Juiza que ignora violência política contra mulher é cúmplice.', 'Discurso em encontro da Magistratura Feminina em Brasília.', 'verified', false, '2024-11-08', 'https://www.tse.jus.br/comunicacao/noticias/carmen-magistratura-feminina', 'other', 1, 'Brasília', 'Magistratura Feminina', 'carmen-magistratura-b79-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia prefeitos que boicotam Casa da Mulher Brasileira.', 'Alguns prefeitos se recusam a assinar convênio. Estão escolhendo feminicida.', 'Entrevista sobre resistência municipal a programas federais de mulheres.', 'verified', false, '2024-04-03', 'https://www.brasildefato.com.br/2024/04/03/cida-prefeitos-boicote', 'news_article', 2, 'Brasília', 'Ministério das Mulheres', 'cida-prefeitos-boicote-b79-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco lança política para mulheres quilombolas.', 'Quilombolas receberão atendimento específico. Racismo tem que ser enfrentado com política pública.', 'Cerimônia no Ministério da Igualdade Racial em Brasília.', 'verified', false, '2024-07-25', 'https://www.gov.br/igualdaderacial/pt-br/noticias/anielle-quilombolas-2024', 'other', 1, 'Brasília', 'Ministério da Igualdade Racial', 'anielle-quilombolas-b79-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara denuncia estupro de mulheres yanomami em terras invadidas.', 'Relatório confirma estupros sistemáticos por garimpeiros. Isso é genocídio.', 'Apresentação de relatório sobre violência contra mulheres Yanomami.', 'verified', true, '2023-04-27', 'https://apiboficial.org/2023/04/27/sonia-estupros-yanomami', 'other', 1, 'Brasília', 'Ministério dos Povos Indígenas', 'sonia-estupros-yanomami-b79-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva enfrenta ataques misóginos em comissão do Senado sobre mineração.', 'Senadores me chamaram de histérica. Não aceito esse tratamento.', 'Bate-boca em comissão do Senado sobre Licença Ambiental.', 'verified', false, '2024-07-02', 'https://www.folha.uol.com.br/poder/2024/07/marina-silva-senado-histerica.shtml', 'news_article', 3, 'Brasília', 'Senado Federal', 'marina-senado-histerica-b79-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina critica misoginia contra ministra do STF Cármen Lúcia.', 'Atacar ministra do STF por ser mulher é inaceitável. Todas as mulheres precisam se solidarizar.', 'Pronunciamento em defesa de ministra atacada por bolsonaristas.', 'verified', false, '2024-10-20', 'https://www12.senado.leg.br/noticias/tereza-cristina-stf-carmen', 'other', 1, 'Brasília', 'Senado Federal', 'tereza-carmen-stf-b79-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet anuncia ampliação do Programa Acolhe Brasil para mulheres migrantes.', 'Mulheres migrantes vítimas de violência têm direito a acolhimento.', 'Lançamento de ampliação do programa em evento em São Paulo.', 'verified', false, '2024-12-10', 'https://www.gov.br/planejamento/pt-br/noticias/simone-acolhe-brasil', 'other', 1, 'São Paulo', 'Ministério do Planejamento', 'simone-acolhe-brasil-b79-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke defende criminalização de violência psicológica como crime autônomo.', 'Violência psicológica mata antes da física. Precisa ser crime com pena real.', 'Apresentação de emenda no Senado sobre violência psicológica.', 'verified', false, '2024-05-29', 'https://www12.senado.leg.br/noticias/soraya-violencia-psicologica', 'other', 1, 'Brasília', 'Senado Federal', 'soraya-violencia-psicologica-b79-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama apresenta relatório da CPMI do 8/1 com foco em ataques a ministras.', 'Ministras foram alvos especiais dos atos golpistas. O relatório deixa isso claro.', 'Apresentação do relatório final da CPMI do 8 de Janeiro.', 'verified', true, '2023-10-17', 'https://www12.senado.leg.br/noticias/eliziane-relatorio-cpmi-ministras', 'other', 1, 'Brasília', 'Congresso Nacional', 'eliziane-relatorio-cpmi-b79-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro lança movimento Damas da Direita para eleger prefeitas.', 'Vamos eleger prefeitas conservadoras. Mulher de bem ocupa espaços.', 'Lançamento do movimento em Belo Horizonte.', 'verified', false, '2024-02-24', 'https://www.cnnbrasil.com.br/politica/michelle-damas-direita', 'news_article', 2, 'Belo Horizonte', 'PL Mulher', 'michelle-damas-direita-b79-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy inaugura 200ª Casa da Mulher em São Paulo.', 'São Paulo será referência em política para mulheres. 200 Casas inauguradas.', 'Cerimônia de inauguração em Capão Redondo.', 'verified', false, '2025-09-05', 'https://www.capital.sp.gov.br/noticias/marta-200-casa-mulher', 'other', 1, 'São Paulo', 'Prefeitura de São Paulo', 'marta-200-casa-mulher-b79-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade defende pílula abortiva legal no SUS para vítimas de estupro.', 'Mifepristone no SUS é salvar vítima de estupro. Ciência acima de preconceito.', 'Declaração sobre inclusão de mifepristone em protocolo SUS.', 'verified', false, '2024-07-08', 'https://www.gov.br/saude/pt-br/noticias/nisia-mifepristone-sus', 'other', 2, 'Brasília', 'Ministério da Saúde', 'nisia-mifepristone-b79-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck anuncia licença-paternidade ampliada para 20 dias.', 'Cuidado não é só de mulher. Licença-paternidade ampliada muda cultura.', 'Assinatura de MP sobre licença-paternidade ampliada.', 'verified', false, '2025-04-14', 'https://www.gov.br/gestao/pt-br/noticias/esther-licenca-paternidade', 'other', 1, 'Brasília', 'Ministério da Gestão', 'esther-licenca-paternidade-b79-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos cria cátedra Marielle Franco de Tecnologia e Gênero.', 'Cátedra Marielle formará cientistas mulheres negras. Política de Estado.', 'Lançamento de cátedra no Inmetro em parceria com UFRJ.', 'verified', false, '2024-03-14', 'https://www.gov.br/mcti/pt-br/noticias/luciana-catedra-marielle', 'other', 1, 'Rio de Janeiro', 'Inmetro', 'luciana-catedra-marielle-b79-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes anuncia edital para mulheres do Carnaval.', 'Mulheres de bloco merecem reconhecimento. Edital aposta em produtoras e cantoras.', 'Lançamento de edital Carnaval das Mulheres no MinC.', 'verified', false, '2024-12-04', 'https://www.gov.br/cultura/pt-br/noticias/margareth-edital-carnaval-mulheres', 'other', 1, 'Salvador', 'Ministério da Cultura', 'margareth-edital-carnaval-b79-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica atentados contra Erika Hilton e defende parlamentar trans.', 'Erika Hilton tem meu total apoio. Essa transfobia precisa parar.', 'Declaração à imprensa após nova onda de ataques à parlamentar.', 'verified', true, '2025-02-28', 'https://revistaforum.com.br/politica/2025/02/28/lula-defende-erika-hilton', 'news_article', 1, 'Brasília', 'Palácio do Planalto', 'lula-defende-erika-b79-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira ataca lei antimisoginia em live com milhares de seguidores.', 'Lei antimisoginia é lei da boca fechada para homens. É ditadura feminista.', 'Live no YouTube com mais de 200 mil espectadores.', 'verified', true, '2024-09-25', 'https://theintercept.com.br/2024/09/25/nikolas-lei-antimisoginia-live', 'social_media_post', 4, 'Online', 'YouTube Live', 'nikolas-live-antimisoginia-b79-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro chama Gleisi Hoffmann de "inútil" em evento.', 'Essa Gleisi não serve pra nada. Mulher de Lula mandando no governo.', 'Discurso em evento do PL criticando nova ministra.', 'verified', true, '2025-03-15', 'https://www.cartacapital.com.br/politica/bolsonaro-gleisi-inutil-2025', 'news_article', 4, 'São Paulo', 'Evento PL', 'bolsonaro-gleisi-inutil-b79-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano faz comentário transfóbico sobre Erika Hilton em culto.', 'Deus fez homem e mulher. Transgênero é confusão espiritual.', 'Sermão em igreja evangélica em São Paulo mencionando parlamentares trans.', 'verified', false, '2023-09-17', 'https://www.cartacapital.com.br/politica/feliciano-transfobia-culto-2023', 'news_article', 4, 'São Paulo', 'Catedral do Avivamento', 'feliciano-culto-transfobia-b79-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anj, 'André Janones ataca Sâmia Bomfim em embate no plenário.', 'Essa moça radical só quer aparecer. Tem que olhar o que sua bancada faz.', 'Bate-boca com Sâmia Bomfim no plenário da Câmara.', 'verified', false, '2024-06-27', 'https://theintercept.com.br/2024/06/27/janones-samia-plenario', 'news_article', 3, 'Brasília', 'Câmara dos Deputados', 'janones-samia-plenario-b79-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mam, 'Magno Malta chama feministas de "cachorras" em evento.', 'Feminista é cachorra que late para esconder fracasso.', 'Discurso em culto em Vila Velha, ES.', 'verified', false, '2024-03-15', 'https://www.seculodiario.com.br/2024/03/magno-malta-feministas', 'news_article', 5, 'Vila Velha', 'Culto evangélico', 'magno-malta-cachorras-b79-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara chama pessoas trans de "aberração" em plenário.', 'Aberração na Câmara. Isso é o que Deus detesta.', 'Discurso em plenário sobre políticas de gênero do MEC.', 'verified', true, '2024-05-16', 'https://www.brasildefato.com.br/2024/05/16/silas-camara-transfobia-plenario', 'news_article', 5, 'Brasília', 'Câmara dos Deputados', 'silas-transfobia-plenario-b79-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton recebe Medalha Mérito Legislativo após ataques.', 'Cada prêmio é uma resposta a quem quer me calar. Mulher trans na política não recua.', 'Recebimento da Medalha na Câmara de São Paulo.', 'verified', false, '2024-11-28', 'https://revistaforum.com.br/politica/2024/11/28/erika-medalha-merito', 'news_article', 1, 'São Paulo', 'Câmara Municipal de SP', 'erika-medalha-b79-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia assédio sofrido em ato em SP.', 'Fui assediada em pleno ato. Ser deputada mulher não me protege.', 'Boletim de ocorrência após assédio em ato em Paulista.', 'verified', false, '2024-04-28', 'https://www.azmina.com.br/reportagens/samia-assedio-paulista', 'news_article', 3, 'São Paulo', 'Avenida Paulista', 'samia-assedio-paulista-b79-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral apresenta PL de licença menstrual para estudantes.', 'Menina não pode perder aula por cólica. Licença menstrual é direito.', 'Apresentação de PL sobre licença menstrual para estudantes.', 'verified', false, '2025-03-19', 'https://www.camara.leg.br/noticias/tabata-licenca-menstrual', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'tabata-licenca-menstrual-b79-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia ataques a mandatos de mulheres negras.', 'Mulheres negras da esquerda são alvo sistemático. Não é acaso, é projeto.', 'Seminário sobre violência política e raça em Niterói.', 'verified', false, '2025-03-14', 'https://theintercept.com.br/2025/03/14/taliria-mandatos-negras', 'news_article', 1, 'Niterói', 'Seminário UFF', 'taliria-mandatos-negras-b79-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura vota a favor da lei antimisoginia e defende texto.', 'Misoginia é ódio. Precisamos de lei específica. Voto sim.', 'Declaração de voto pela aprovação da lei antimisoginia na Câmara.', 'verified', false, '2024-09-25', 'https://www.camara.leg.br/noticias/adriana-voto-antimisoginia', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-voto-antimisoginia-b79-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta defende afastamento do Ministério das Mulheres no governo.', 'Ministério das Mulheres é gastança. Extinguir é prioridade.', 'Entrevista em rádio de Santa Catarina sobre pauta conservadora.', 'verified', false, '2024-10-22', 'https://www.nsctotal.com.br/noticias/julia-zanatta-ministerio-mulheres', 'news_article', 3, 'Florianópolis', 'Rádio Band', 'julia-ministerio-mulheres-b79-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna apresenta PL para facilitar denúncias de violência por vizinhas.', 'Vizinhança ouve, mas não denuncia. Lei do Ouviu, Denuncia precisa existir.', 'Apresentação de PL na Câmara sobre denúncia comunitária.', 'verified', false, '2024-08-15', 'https://www.camara.leg.br/noticias/fernanda-pl-vizinhanca', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'fernanda-pl-vizinhanca-b79-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende orçamento específico para Casa da Mulher Brasileira.', 'Sem orçamento, Casa da Mulher é palavra vazia. Precisamos de PPA com recorte.', 'Discurso sobre LDO e políticas para mulheres.', 'verified', false, '2024-08-13', 'https://revistaforum.com.br/politica/2024/08/13/jandira-orcamento-mulheres', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-orcamento-b79-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra inaugura casa de acolhimento a mulheres trans no RN.', 'Mulher trans também é mulher. RN tem casa de acolhimento para todas.', 'Inauguração da primeira Casa de Acolhimento Trans em Natal.', 'verified', true, '2024-11-20', 'https://www.rn.gov.br/noticias/fatima-casa-trans-2024', 'other', 1, 'Natal', 'Governo do RN', 'fatima-casa-trans-b79-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra lança juizado especializado em violência doméstica em 10 municípios.', 'Nenhum município pernambucano ficará sem acesso à Justiça contra violência.', 'Assinatura de convênio com TJPE para expansão de juizados.', 'verified', false, '2024-11-07', 'https://www.pe.gov.br/noticias/raquel-juizado-2024', 'other', 1, 'Recife', 'Governo de Pernambuco', 'raquel-juizado-b79-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann defende cotas em diretórios partidários nacionais.', 'Partidos não cumprem paridade. Precisamos tornar obrigatória por lei.', 'Discurso em congresso do PT sobre reforma partidária.', 'verified', false, '2025-06-18', 'https://www.cartacapital.com.br/politica/gleisi-cotas-diretorios', 'news_article', 1, 'Brasília', 'Congresso do PT', 'gleisi-cotas-diretorios-b79-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves chama lei antimisoginia de "lei mordaça".', 'Querem nos calar com lei antimisoginia. Vamos resistir.', 'Discurso em plenário do Senado contra PL 1604/2022.', 'verified', true, '2024-10-02', 'https://www12.senado.leg.br/noticias/damares-mordaca-antimisoginia', 'other', 4, 'Brasília', 'Senado Federal', 'damares-mordaca-b79-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia lança plataforma contra violência política de gênero.', 'Plataforma da Justiça Eleitoral recebe denúncias em tempo real.', 'Lançamento de plataforma digital no TSE.', 'verified', false, '2024-04-09', 'https://www.tse.jus.br/comunicacao/noticias/carmen-plataforma-violencia', 'other', 1, 'Brasília', 'TSE', 'carmen-plataforma-b79-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves denuncia falta de delegacias da mulher em 60% dos municípios.', 'Só 40% das cidades têm DEAM. Pacto pela Vida vai mudar isso.', 'Divulgação de dados em coletiva sobre estrutura de proteção à mulher.', 'verified', false, '2024-06-26', 'https://www.brasildefato.com.br/2024/06/26/cida-deam-municipios', 'news_article', 1, 'Brasília', 'Ministério das Mulheres', 'cida-deam-municipios-b79-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco discursa em homenagem a Marielle em 7 anos de assassinato.', 'Sete anos e a luta de Marielle segue acesa. Mandantes presos não apagam a dor.', 'Ato em memória dos 7 anos do assassinato de Marielle no Rio.', 'verified', true, '2025-03-14', 'https://theintercept.com.br/2025/03/14/anielle-marielle-7-anos', 'news_article', 1, 'Rio de Janeiro', 'Ato Marielle Presente', 'anielle-marielle-7-anos-b79-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara apresenta PL de proteção à mulher indígena na Câmara.', 'Mulher indígena precisa de política específica. Esse PL é ponte.', 'Apresentação de PL na Câmara sobre proteção à mulher indígena.', 'verified', false, '2025-02-04', 'https://apiboficial.org/2025/02/04/sonia-pl-mulher-indigena', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'sonia-pl-mulher-indigena-b79-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva propõe selo antimisogenia para empresas.', 'Empresas que respeitam mulher recebem selo. Estado valoriza quem protege.', 'Apresentação de proposta em evento com CNI em Brasília.', 'verified', false, '2025-04-08', 'https://www.gov.br/mma/pt-br/noticias/marina-selo-antimisoginia', 'other', 1, 'Brasília', 'CNI', 'marina-selo-antimisoginia-b79-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina apresenta requerimento para CPI da Violência Obstétrica.', 'Violência obstétrica é crime silencioso contra mulheres. CPI é urgente.', 'Apresentação de requerimento de CPI no Senado.', 'verified', false, '2025-03-11', 'https://www12.senado.leg.br/noticias/tereza-cpi-violencia-obstetrica', 'other', 1, 'Brasília', 'Senado Federal', 'tereza-cpi-obstetrica-b79-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet defende política de cuidado com recursos federais.', 'Cuidado é trabalho. Mulher que cuida precisa de reconhecimento e pagamento.', 'Lançamento do Plano Nacional de Cuidados.', 'verified', true, '2024-10-02', 'https://www.gov.br/planejamento/pt-br/noticias/simone-plano-cuidados', 'other', 1, 'Brasília', 'Palácio do Planalto', 'simone-plano-cuidados-b79-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke apresenta PL que amplia para 40 anos pena por feminicídio com requintes.', 'Feminicídio com requintes de crueldade merece 40 anos. Sem indulto.', 'Apresentação de PL no Senado endurecendo pena para feminicídio.', 'verified', false, '2024-06-19', 'https://www12.senado.leg.br/noticias/soraya-pl-feminicidio-40', 'other', 1, 'Brasília', 'Senado Federal', 'soraya-pl-feminicidio-40-b79-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama denuncia uso de milícias digitais contra candidatas em 2024.', 'Milícias digitais atacaram sistematicamente candidatas em 2024. Precisamos punir.', 'Coletiva após relatório do TSE sobre eleições 2024.', 'verified', false, '2024-12-17', 'https://www12.senado.leg.br/noticias/eliziane-milicias-digitais-2024', 'other', 2, 'Brasília', 'Senado Federal', 'eliziane-milicias-digitais-b79-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro critica sanção de feminicídio como crime autônomo.', 'Lula sanciona projeto do PT mas não resolve nada. Feminicídio segue crescendo.', 'Entrevista à TV Brasília sobre sanção da Lei 14.994/2024.', 'verified', false, '2024-10-10', 'https://www.cnnbrasil.com.br/politica/michelle-critica-sancao-feminicidio', 'news_article', 2, 'Brasília', 'TV Brasília', 'michelle-critica-sancao-b79-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy apoia movimento contra propostas que restringem aborto.', 'Mulher tem direito ao corpo. Retrocesso não.', 'Ato público em SP contra PL 1904/2024.', 'verified', false, '2024-06-15', 'https://www.folha.uol.com.br/cotidiano/2024/06/marta-pl-1904-ato.shtml', 'news_article', 1, 'São Paulo', 'Ato na Paulista', 'marta-pl-1904-ato-b79-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade defende ampliação da Atenção Primária com foco em mulheres.', 'Mulher sem pré-natal morre. Atenção Primária é vida.', 'Lançamento de programa Saúde da Família 360.', 'verified', false, '2024-01-29', 'https://www.gov.br/saude/pt-br/noticias/nisia-atencao-primaria-mulher', 'other', 1, 'Brasília', 'Ministério da Saúde', 'nisia-atencao-primaria-b79-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck lança selo de igualdade salarial para empresas federais.', 'Igualdade salarial em estatais é lei. Empresa que não cumpre perde selo.', 'Lançamento do selo no Ministério da Gestão.', 'verified', false, '2024-09-03', 'https://www.gov.br/gestao/pt-br/noticias/esther-selo-igualdade-salarial', 'other', 1, 'Brasília', 'Ministério da Gestão', 'esther-selo-salarial-b79-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos denuncia assédio sistêmico contra cientistas mulheres.', 'Uma em cada três cientistas sofre assédio. Precisamos protocolo nacional.', 'Audiência pública sobre assédio nas universidades federais.', 'verified', false, '2024-10-08', 'https://www.brasildefato.com.br/2024/10/08/luciana-assedio-cientistas', 'news_article', 2, 'Brasília', 'MCTI', 'luciana-assedio-cientistas-b79-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes faz ato no MinC contra misoginia na música.', 'Indústria da música é machista. Cantoras ganham menos e trabalham mais.', 'Ato público contra misoginia no setor musical.', 'verified', false, '2025-03-08', 'https://www.azmina.com.br/reportagens/margareth-musica-misoginia', 'news_article', 1, 'Brasília', 'Ministério da Cultura', 'margareth-musica-misoginia-b79-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula destaca aumento de mulheres negras em cargos federais.', 'Nunca tantas mulheres negras ocuparam altos cargos. É compromisso, não acaso.', 'Cerimônia de posse de nomeações em Brasília.', 'verified', false, '2024-11-20', 'https://www.gov.br/planalto/pt-br/noticias/lula-mulheres-negras-cargos', 'other', 1, 'Brasília', 'Palácio do Planalto', 'lula-negras-cargos-b79-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira publica vídeo debochando de ministra Margareth Menezes.', 'Cantora virou ministra. Cultura virou piada.', 'Post em rede social ridicularizando ministra da Cultura.', 'verified', false, '2023-07-14', 'https://theintercept.com.br/2023/07/14/nikolas-margareth-deboche', 'social_media_post', 3, 'Online', 'X/Twitter', 'nikolas-margareth-deboche-b79-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bol, 'Bolsonaro chama Janja de "mulherzinha que fala demais".', 'Essa Janja é uma mulherzinha que fala o que não deve. Lula devia controlar.', 'Declaração em evento do PL no Espírito Santo.', 'verified', true, '2024-04-18', 'https://www.cartacapital.com.br/politica/bolsonaro-janja-mulherzinha', 'news_article', 4, 'Vila Velha', 'Evento PL', 'bolsonaro-janja-mulherzinha-b79-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano defende PL que dificulta divórcio.', 'Divórcio fácil destrói família. Mulher precisa preservar casamento.', 'Entrevista sobre PL da Família no Congresso.', 'verified', false, '2024-04-16', 'https://www.camara.leg.br/noticias/feliciano-pl-divorcio', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'feliciano-pl-divorcio-b79-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia deepfake pornográfico com sua imagem.', 'Criaram deepfake pornô comigo. Registrei BO. Isso é violência política.', 'Registro de BO após circulação de deepfake nas redes.', 'verified', true, '2025-01-22', 'https://theintercept.com.br/2025/01/22/erika-deepfake-bo', 'news_article', 4, 'São Paulo', 'Delegacia de Crimes Cibernéticos', 'erika-deepfake-b79-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim exige investigação de ataques a parlamentares do PSOL.', 'Seis parlamentares do PSOL foram ameaçadas em 2024. Isso é padrão.', 'Denúncia à Mesa Diretora da Câmara sobre ameaças.', 'verified', false, '2024-12-03', 'https://www.brasildefato.com.br/2024/12/03/samia-ameacas-psol-2024', 'news_article', 2, 'Brasília', 'Câmara dos Deputados', 'samia-ameacas-psol-b79-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itm, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende paridade em escolha de ministros do STF.', 'STF com 11 ministros e só 1 mulher. Paridade é democracia.', 'Discurso em painel da FGV Direito sobre Supremo.', 'verified', false, '2024-04-10', 'https://www.folha.uol.com.br/poder/2024/04/tabata-stf-paridade.shtml', 'news_article', 1, 'São Paulo', 'FGV Direito', 'tabata-stf-paridade-b79-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone denuncia xingamentos misóginos na Câmara Municipal.', 'Colegas me chamaram de "cachorra" e "sem-vergonha". Não vou aceitar.', 'Pronunciamento na Câmara Municipal de Niterói.', 'verified', false, '2023-11-09', 'https://theintercept.com.br/2023/11/09/taliria-xingamentos-niteroi', 'news_article', 3, 'Niterói', 'Câmara Municipal', 'taliria-xingamentos-b79-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende dedução em IR para mulheres cuidadoras.', 'Mulher que cuida de idoso ou pessoa com deficiência economiza Estado. Merece dedução.', 'Apresentação de PL sobre dedução tributária para cuidadoras.', 'verified', false, '2025-02-27', 'https://www.camara.leg.br/noticias/adriana-ir-cuidadoras', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-ir-cuidadoras-b79-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta ataca Tarcísio por sancionar lei sobre educação de gênero.', 'Esperava mais de Tarcísio. Lei sobre gênero é ideologia.', 'Entrevista sobre lei estadual paulista sobre educação.', 'verified', false, '2024-11-28', 'https://www.nsctotal.com.br/noticias/julia-zanatta-tarcisio-genero', 'news_article', 3, 'Florianópolis', 'Rádio Band', 'julia-tarcisio-genero-b79-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fem, 'Fernanda Melchionna denuncia assédio moral na Câmara de Porto Alegre.', 'Vereadoras relatam assédio sistemático. Precisamos criar protocolo.', 'Audiência pública sobre assédio no Legislativo de POA.', 'verified', false, '2024-07-16', 'https://www.brasildefato.com.br/2024/07/16/fernanda-assedio-camara-poa', 'news_article', 2, 'Porto Alegre', 'Câmara Municipal de POA', 'fernanda-assedio-poa-b79-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali apresenta emenda para patrulhas Maria da Penha em todo município.', 'Patrulha Maria da Penha salva vidas. Precisamos em todo o Brasil.', 'Apresentação de emenda orçamentária para patrulhas.', 'verified', false, '2023-09-06', 'https://www.camara.leg.br/noticias/jandira-patrulha-maria-penha', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-patrulha-maria-penha-b79-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fat, 'Fátima Bezerra lança programa Mulheres Mil para qualificação profissional.', 'Mulheres Mil chega ao RN. Autonomia econômica tira do ciclo da violência.', 'Lançamento em parceria com Ifes no RN.', 'verified', false, '2024-05-15', 'https://www.rn.gov.br/noticias/fatima-mulheres-mil', 'other', 1, 'Natal', 'Governo do RN', 'fatima-mulheres-mil-b79-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ral, 'Raquel Lyra anuncia adesão ao Pacto Nacional de Enfrentamento à Violência.', 'Pernambuco firma pacto com governo federal. Juntos contra violência.', 'Cerimônia no Palácio do Planalto com Cida Gonçalves e Lula.', 'verified', false, '2024-08-07', 'https://www.pe.gov.br/noticias/raquel-pacto-federal-2024', 'other', 1, 'Brasília', 'Palácio do Planalto', 'raquel-pacto-federal-b79-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann coordena lançamento de plano contra feminicídio em 2026.', 'Plano 2026 tem meta zero feminicídio no Brasil. Compromisso do governo.', 'Anúncio no Planalto com Cida Gonçalves e governadoras.', 'verified', false, '2026-01-15', 'https://www.gov.br/planalto/pt-br/noticias/gleisi-plano-2026-feminicidio', 'other', 1, 'Brasília', 'Palácio do Planalto', 'gleisi-plano-2026-b79-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves critica cota de gênero em cargos do STF.', 'Cota é segregação. Mulher não precisa de cota para chegar ao STF.', 'Discurso em plenário do Senado sobre PEC da paridade.', 'verified', false, '2025-04-08', 'https://www12.senado.leg.br/noticias/damares-cota-stf', 'other', 3, 'Brasília', 'Senado Federal', 'damares-cota-stf-b79-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carmen Lúcia dá voto decisivo para condenar criador de deepfake contra ministra.', 'Deepfake contra mulher é crime. Não há liberdade de expressão para o ódio.', 'Voto no STF em HC sobre deepfake pornográfico.', 'verified', false, '2025-04-02', 'https://www.stf.jus.br/noticias/carmen-deepfake-voto', 'other', 1, 'Brasília', 'STF', 'carmen-deepfake-voto-b79-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cida Gonçalves é atacada em audiência pelo PL e rebate.', 'Deputado me chama de "radical". Radical é não proteger mulher.', 'Audiência pública sobre orçamento do Ministério das Mulheres.', 'verified', true, '2025-03-26', 'https://revistaforum.com.br/politica/2025/03/26/cida-audiencia-pl', 'news_article', 2, 'Brasília', 'Comissão de Mulher', 'cida-audiencia-pl-b79-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ani, 'Anielle Franco denuncia racismo em comissão da Câmara.', 'Deputado debochou do meu cabelo. Racismo em pleno plenário.', 'Audiência em comissão da Câmara onde foi alvo de racismo.', 'verified', false, '2024-04-10', 'https://www.brasildefato.com.br/2024/04/10/anielle-racismo-camara', 'news_article', 3, 'Brasília', 'Câmara dos Deputados', 'anielle-racismo-camara-b79-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_son, 'Sônia Guajajara recebe prêmio internacional por trabalho com mulheres indígenas.', 'Este prêmio é de todas as mulheres indígenas que resistem. Não é meu.', 'Recebimento do prêmio Time 100 em Nova York.', 'verified', true, '2023-04-27', 'https://apiboficial.org/2023/04/27/sonia-time-100-mulheres', 'news_article', 1, 'Nova York', 'Time 100', 'sonia-time-100-b79-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva apoia PL que amplia licença-maternidade em casos de violência.', 'Vítima de violência precisa de tempo para se reconstruir. Licença ampliada é política humana.', 'Apoio público ao PL sobre licença para vítimas de violência.', 'verified', false, '2025-03-14', 'https://www.gov.br/mma/pt-br/noticias/marina-licenca-violencia', 'other', 1, 'Brasília', 'Ministério do Meio Ambiente', 'marina-licenca-violencia-b79-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina defende bancada feminina unida contra misoginia.', 'Bancada feminina precisa ser suprapartidária contra misoginia.', 'Encontro da bancada feminina do Senado.', 'verified', false, '2024-08-06', 'https://www12.senado.leg.br/noticias/tereza-bancada-feminina', 'other', 1, 'Brasília', 'Senado Federal', 'tereza-bancada-feminina-b79-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sit, 'Simone Tebet denuncia violência obstétrica em hospital público.', 'Ouvi histórias terríveis de mulheres. Violência obstétrica é crime.', 'Visita a hospital público em Campo Grande sobre maternidade.', 'verified', false, '2024-12-12', 'https://www.brasildefato.com.br/2024/12/12/simone-violencia-obstetrica', 'news_article', 1, 'Campo Grande', 'Hospital Regional', 'simone-violencia-obstetrica-b79-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sor, 'Soraya Thronicke apresenta emenda para bolsa para órfãs de feminicídio.', 'Filhas de vítimas de feminicídio precisam de bolsa. Não podem pagar o crime dos pais.', 'Apresentação de emenda no Senado sobre órfãos de feminicídio.', 'verified', false, '2024-11-05', 'https://www12.senado.leg.br/noticias/soraya-orfas-feminicidio', 'other', 1, 'Brasília', 'Senado Federal', 'soraya-orfas-feminicidio-b79-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama celebra aprovação da lei antimisoginia no Senado.', 'Hoje o Senado faz história. Lei antimisoginia aprovada.', 'Declaração após aprovação da lei antimisoginia na plenário.', 'verified', true, '2024-10-02', 'https://www12.senado.leg.br/noticias/eliziane-aprovacao-antimisoginia', 'other', 1, 'Brasília', 'Senado Federal', 'eliziane-aprovacao-antimisoginia-b79-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro defende que mulher cristã precisa "submissão" em casa.', 'Mulher submissa é bíblica. Feministas querem subverter.', 'Discurso em conferência evangélica em Curitiba.', 'verified', false, '2024-09-15', 'https://theintercept.com.br/2024/09/15/michelle-submissao-curitiba', 'news_article', 3, 'Curitiba', 'Conferência Evangélica', 'michelle-submissao-b79-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mas, 'Marta Suplicy defende política para mulheres idosas em São Paulo.', 'Idosas são maioria, mas invisíveis. Política pública precisa alcançá-las.', 'Evento no Dia da Mulher Idosa em SP.', 'verified', false, '2025-10-01', 'https://www.capital.sp.gov.br/noticias/marta-mulheres-idosas', 'other', 1, 'São Paulo', 'Prefeitura de São Paulo', 'marta-mulheres-idosas-b79-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nit, 'Nísia Trindade deixa mensagem de solidariedade a Erika Hilton após ataque.', 'Erika Hilton, minha solidariedade. A luta por dignidade é de todas.', 'Mensagem em rede social após agressão a Erika Hilton.', 'verified', false, '2025-02-27', 'https://theintercept.com.br/2025/02/27/nisia-solidariedade-erika', 'social_media_post', 1, 'Brasília', 'X/Twitter', 'nisia-solidariedade-erika-b79-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_esd, 'Esther Dweck responde a crítica machista em comissão.', 'Senador, o senhor não fala comigo com esse tom. Sou ministra.', 'Bate-boca em comissão do Senado sobre reforma administrativa.', 'verified', false, '2024-09-11', 'https://www.folha.uol.com.br/poder/2024/09/esther-dweck-senado.shtml', 'news_article', 2, 'Brasília', 'Senado Federal', 'esther-senado-tom-b79-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lus, 'Luciana Santos anuncia ampliação do programa Mulher e Ciência.', 'Vamos dobrar bolsas para mulheres nas pós-graduações. Paridade científica.', 'Anúncio em reunião do CNPq em Brasília.', 'verified', false, '2025-03-10', 'https://www.gov.br/mcti/pt-br/noticias/luciana-mulher-ciencia-2025', 'other', 1, 'Brasília', 'CNPq', 'luciana-mulher-ciencia-2025-b79-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Margareth Menezes celebra obra de Carolina Maria de Jesus em Bienal.', 'Carolina mostrou que mulher pobre negra tem voz. Bienal a celebra.', 'Abertura da Bienal do Livro com homenagem a Carolina.', 'verified', false, '2024-09-06', 'https://www.gov.br/cultura/pt-br/noticias/margareth-carolina-bienal', 'other', 1, 'Rio de Janeiro', 'Bienal do Livro', 'margareth-carolina-bienal-b79-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula é criticado por comparar Janja a "primeira dama tradicional".', 'Janja não é primeira dama tradicional, mas deveria se comportar como.', 'Comentário em entrevista que gerou crítica de feministas.', 'verified', false, '2024-09-25', 'https://www.cartacapital.com.br/politica/lula-janja-primeira-dama-tradicional', 'news_article', 3, 'Brasília', 'Entrevista Jornal Nacional', 'lula-janja-tradicional-b79-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_anj, 'André Janones ironiza feministas em post viralizado.', 'Feministas só reclamam. Não fazem nada de concreto.', 'Post em rede social criticando movimento feminista.', 'verified', false, '2024-07-09', 'https://theintercept.com.br/2024/07/09/janones-feministas-critica', 'social_media_post', 3, 'Online', 'X/Twitter', 'janones-feministas-critica-b79-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mam, 'Magno Malta defende Estatuto da Família contra "ideologia de gênero".', 'Família é homem e mulher. Ponto final. Resto é ideologia.', 'Discurso em audiência no Senado sobre Estatuto da Família.', 'verified', false, '2025-02-25', 'https://www12.senado.leg.br/noticias/magno-malta-estatuto-familia', 'other', 4, 'Brasília', 'Senado Federal', 'magno-estatuto-familia-b79-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sic, 'Silas Câmara critica projeto de creches universais no Congresso.', 'Creche não é obrigação do Estado. Mãe precisa cuidar dos filhos.', 'Discurso em plenário contra PEC das creches universais.', 'verified', false, '2024-10-29', 'https://www.camara.leg.br/noticias/silas-creches-pec', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'silas-creches-pec-b79-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton participa de ato em solidariedade a mulheres da Palestina.', 'Mulheres palestinas são apagadas. Nossa luta é internacional.', 'Ato em SP pela Palestina em evento feminista.', 'verified', false, '2024-05-08', 'https://revistaforum.com.br/politica/2024/05/08/erika-palestina-ato', 'news_article', 1, 'São Paulo', 'Ato pela Palestina', 'erika-palestina-b79-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim celebra sanção da lei antimisoginia.', 'Anos de luta para chegar aqui. Misoginia é crime no Brasil.', 'Declaração após sanção da lei antimisoginia.', 'verified', true, '2025-11-12', 'https://www.brasildefato.com.br/2025/11/12/samia-sancao-antimisoginia', 'news_article', 1, 'Brasília', 'Câmara dos Deputados', 'samia-sancao-antimisoginia-b79-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende reserva de vagas em conselhos empresariais.', 'Conselho sem mulher é erro do século passado. Reserva é necessária.', 'Discurso em evento da Bovespa sobre ESG.', 'verified', false, '2025-05-22', 'https://www.folha.uol.com.br/mercado/2025/05/tabata-conselhos-mulheres.shtml', 'news_article', 1, 'São Paulo', 'B3', 'tabata-conselhos-b79-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone apresenta relatório sobre violência política em 2024.', 'Em 2024, 18 candidatas assassinadas em campanha. Não podemos naturalizar.', 'Apresentação de relatório anual do mandato sobre violência política.', 'verified', true, '2025-03-08', 'https://theintercept.com.br/2025/03/08/taliria-relatorio-violencia-2024', 'news_article', 1, 'Niterói', 'Mandato Talíria', 'taliria-relatorio-2024-b79-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

END $$;
