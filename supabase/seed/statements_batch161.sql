-- Batch 161: Disputas sobre emendas parlamentares (2023-2026)
DO $$
DECLARE
  v_lir UUID; v_mot UUID; v_alc UUID; v_pac UUID; v_ren UUID;
  v_din UUID; v_mor UUID; v_lul UUID; v_had UUID; v_teb UUID;
  v_dwe UUID; v_agu UUID; v_elm UUID; v_edu UUID; v_nik UUID;
  v_van UUID; v_adr UUID; v_ram UUID; v_kic UUID; v_rma UUID;
  v_cvi UUID; v_egm UUID; v_dju UUID; v_jwa UUID; v_hco UUID;
  v_rrd UUID; v_mes UUID; v_lew UUID; v_gle UUID; v_pad UUID;
  v_cal UUID; v_chi UUID; v_jan UUID;
  c_cor UUID; c_abu UUID; c_con UUID; c_nep UUID; c_obs UUID;
  c_ant UUID; c_ame UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_dwe FROM politicians WHERE slug = 'esther-dweck';
  SELECT id INTO v_agu FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_elm FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_rma FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_cvi FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_egm FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dju FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jwa FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hco FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_rrd FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_mes FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira defende orçamento secreto mesmo após STF declarar inconstitucional.', 'As emendas de relator são um instrumento legítimo do Parlamento, não aceitaremos que o Judiciário usurpe a prerrogativa do Congresso.', 'Declaração após decisão do STF que derrubou o orçamento secreto em dezembro de 2022, já em 2023 Lira articulava manobras para manter o esquema via emendas de comissão.', 'verified', true, '2023-02-06', 'https://g1.globo.com/politica/noticia/2023/02/06/lira-orcamento-secreto-stf.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Reunião de líderes', 'lira-defende-orcamento-secreto-b161-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes suspende pagamento de emendas de relator por falta de transparência.', 'Não há transparência nenhuma, é impossível identificar o autor e o destino dos recursos, o que fere frontalmente a Constituição.', 'Decisão monocrática em ação movida pelo PSOL sobre emendas RP-9 do orçamento de 2022.', 'verified', true, '2023-11-14', 'https://www.conjur.com.br/2023-nov-14/moraes-suspende-pagamento-emendas-relator/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'moraes-suspende-emendas-relator-b161-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino determina bloqueio total de emendas Pix sem rastreabilidade.', 'Dinheiro público exige rastreabilidade. Não há como admitir transferências especiais sem plano de trabalho e sem identificação do destino.', 'Decisão que suspendeu o pagamento de emendas Pix em agosto de 2024, obrigando o Congresso a criar regras de transparência.', 'verified', true, '2024-08-14', 'https://www.conjur.com.br/2024-ago-14/dino-emendas-pix-transparencia/', 'official_document', 4, 'STF', 'Decisão em ADPFs', 'dino-bloqueio-emendas-pix-b161-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira ameaça retaliar STF após decisão de Dino sobre emendas Pix.', 'Se o STF insistir em invadir a competência do Congresso, o Congresso vai reagir. Não aceitaremos essa intromissão.', 'Reação à decisão que bloqueou emendas Pix, intensificando crise entre Poderes.', 'verified', true, '2024-08-15', 'https://g1.globo.com/politica/noticia/2024/08/15/lira-reaciona-decisao-dino-emendas.ghtml', 'interview', 4, 'Brasília', 'Entrevista coletiva', 'lira-ameaca-retaliar-stf-emendas-b161-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco nega que emendas de comissão sejam reedição do orçamento secreto.', 'Emendas de comissão são instrumento regular do processo orçamentário, não há que se falar em orçamento secreto.', 'Defesa após denúncias de que RP-8 funcionava como substituto do RP-9.', 'verified', false, '2023-03-21', 'https://g1.globo.com/politica/noticia/2023/03/21/pacheco-emendas-comissao-orcamento-secreto.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'pacheco-nega-orcamento-secreto-b161-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad reconhece distorção das emendas impositivas no fiscal.', 'As emendas cresceram de forma desproporcional e engessaram o orçamento discricionário do governo federal.', 'Declaração em entrevista sobre dificuldades de execução do arcabouço fiscal.', 'verified', false, '2024-06-10', 'https://valor.globo.com/brasil/noticia/2024/06/10/haddad-emendas-distorcao-fiscal.ghtml', 'interview', 2, 'Ministério da Fazenda', 'Entrevista', 'haddad-emendas-distorcao-fiscal-b161-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Esther Dweck cobra rastreabilidade total das emendas parlamentares.', 'Não há por que existir recurso público sem rastreabilidade. Toda emenda precisa ter destino, plano de trabalho e fiscalização.', 'Defesa em audiência pública sobre novas regras para emendas Pix.', 'verified', false, '2024-09-05', 'https://g1.globo.com/politica/noticia/2024/09/05/dweck-emendas-rastreabilidade.ghtml', 'speech', 2, 'Congresso Nacional', 'Audiência pública', 'dweck-rastreabilidade-emendas-b161-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira chantageia governo com paralisação do Congresso por emendas.', 'Se as emendas não forem pagas, o Congresso não vota nada. Essa é a realidade. O governo precisa entender.', 'Declaração após bloqueio de emendas pelo STF, pressionando governo Lula a intervir.', 'verified', true, '2024-08-20', 'https://g1.globo.com/politica/noticia/2024/08/20/lira-ameaca-paralisar-congresso.ghtml', 'speech', 5, 'Câmara dos Deputados', 'Reunião de líderes', 'lira-chantageia-governo-emendas-b161-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro, relator do orçamento, defende emendas como prerrogativa inegociável.', 'As emendas são a face do federalismo brasileiro, é assim que o deputado leva recurso para sua base, não abrimos mão.', 'Defesa do modelo após crise com STF.', 'verified', false, '2024-08-22', 'https://g1.globo.com/politica/noticia/2024/08/22/aguinaldo-defende-emendas.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'aguinaldo-defende-emendas-federalismo-b161-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmar Nascimento articula acordo para liberar emendas travadas pelo STF.', 'Vamos construir uma solução que preserve a autonomia do parlamentar e respeite a decisão do Supremo, mas não abriremos mão das emendas.', 'Negociação como líder do União Brasil após bloqueio de Dino.', 'verified', false, '2024-09-10', 'https://g1.globo.com/politica/noticia/2024/09/10/elmar-negocia-emendas-stf.ghtml', 'interview', 3, 'Brasília', 'Entrevista', 'elmar-articula-acordo-emendas-b161-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rrd, 'Randolfe afirma que emendas Pix foram usadas para comprar apoio político.', 'O que vimos foi um uso promíscuo de recurso público para cooptação política, distorcendo o orçamento federal.', 'Declaração em CPI sobre desvios de emendas Pix.', 'verified', false, '2024-10-08', 'https://g1.globo.com/politica/noticia/2024/10/10/randolfe-emendas-pix-cooptacao.ghtml', 'speech', 3, 'Senado Federal', 'Entrevista', 'randolfe-emendas-pix-cooptacao-b161-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Simone Tebet denuncia engessamento do orçamento por emendas impositivas.', 'O Executivo ficou com margem de manobra de menos de 10% do orçamento. É um absurdo o que o Congresso fez com o orçamento brasileiro.', 'Ministra do Planejamento em entrevista sobre a rigidez fiscal.', 'verified', true, '2024-07-15', 'https://valor.globo.com/brasil/noticia/2024/07/15/tebet-orcamento-engessado-emendas.ghtml', 'interview', 3, 'Ministério do Planejamento', 'Entrevista', 'tebet-orcamento-engessado-emendas-b161-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Congresso por tomar controle do orçamento via emendas.', 'O Congresso hoje manda em um orçamento gigantesco sem prestação de contas. O presidente da República quase não tem mais orçamento para governar.', 'Entrevista após pressão de Lira por liberação de emendas.', 'verified', true, '2024-08-30', 'https://g1.globo.com/politica/noticia/2024/08/30/lula-congresso-orcamento-emendas.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'lula-critica-congresso-emendas-b161-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira defende emendas sem transparência como "sigilo estratégico".', 'Não é o STF que vai dizer ao Congresso como usar seu dinheiro. Essa intromissão é inadmissível.', 'Postagem em redes sociais após decisão de Dino sobre emendas Pix.', 'verified', false, '2024-08-16', 'https://twitter.com/nikolas_dm/status/nikolas-emendas-stf', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-defende-emendas-sem-transparencia-b161-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel van Hattem diz que emendas são direito inalienável do parlamentar.', 'Sou a favor da transparência, mas o Supremo não pode interferir no direito do deputado destinar recursos.', 'Declaração em plenário após bloqueio de Dino.', 'verified', false, '2024-08-21', 'https://g1.globo.com/politica/noticia/2024/08/21/van-hattem-emendas-direito.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'van-hattem-emendas-direito-parlamentar-b161-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Alexandre de Moraes cobra identificação do "padrinho" de cada emenda Pix.', 'Precisa-se saber quem indicou cada recurso, para onde foi e como foi gasto. Não é possível admitir repasses anônimos.', 'Voto na ADPF sobre emendas Pix.', 'verified', true, '2024-12-04', 'https://www.conjur.com.br/2024-dez-04/moraes-padrinho-emendas/', 'official_document', 4, 'STF', 'Julgamento ADPF', 'moraes-padrinho-emendas-pix-b161-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira articula emendas de comissão como substituto do orçamento secreto.', 'Vamos encontrar instrumentos legítimos para que o Congresso continue exercendo sua prerrogativa orçamentária.', 'Articulação após STF derrubar RP-9, criando RP-8 com mesmo funcionamento opaco.', 'verified', true, '2023-02-28', 'https://g1.globo.com/politica/noticia/2023/02/28/lira-emendas-comissao-rp8.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-emendas-comissao-rp8-b161-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali classifica emendas Pix como "cheque em branco" do Congresso.', 'As emendas Pix são um cheque em branco. O dinheiro vai para a prefeitura sem plano de trabalho, sem fiscalização, sem nada.', 'Discurso em plenário defendendo transparência das emendas.', 'verified', false, '2024-09-25', 'https://g1.globo.com/politica/noticia/2024/09/25/jandira-emendas-pix-cheque-branco.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'jandira-emendas-cheque-branco-b161-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende decisão de Dino sobre bloqueio de emendas.', 'A AGU tem posição histórica em favor da rastreabilidade dos recursos públicos. A decisão do ministro Dino se alinha à Constituição.', 'Declaração em entrevista sobre ação do governo nas ADPFs.', 'verified', false, '2024-08-18', 'https://g1.globo.com/politica/noticia/2024/08/18/messias-defende-dino-emendas.ghtml', 'interview', 2, 'AGU', 'Entrevista', 'messias-defende-dino-emendas-b161-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira admite condicionar pauta a liberação de emendas pelo governo.', 'Sem pagamento de emendas, não há condição política de aprovar a pauta do governo. É simples assim.', 'Entrevista pressionando governo Lula.', 'verified', true, '2024-09-02', 'https://g1.globo.com/politica/noticia/2024/09/02/lira-condiciona-pauta-emendas.ghtml', 'interview', 5, 'Brasília', 'Entrevista', 'lira-condiciona-pauta-emendas-b161-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Davi Alcolumbre assume presidência do Senado prometendo defender emendas.', 'O Senado não aceitará que se retirem prerrogativas do parlamentar. Emendas são uma conquista do Legislativo.', 'Discurso de posse como presidente do Senado em 2025.', 'verified', true, '2025-02-01', 'https://g1.globo.com/politica/noticia/2025/02/01/alcolumbre-posse-senado-emendas.ghtml', 'speech', 3, 'Senado Federal', 'Posse', 'alcolumbre-posse-senado-emendas-b161-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta assume presidência da Câmara prometendo "blindar" emendas do STF.', 'Vamos trabalhar para que o STF respeite a separação dos Poderes e não interfira no orçamento do Congresso.', 'Primeiro discurso como presidente da Câmara.', 'verified', true, '2025-02-01', 'https://g1.globo.com/politica/noticia/2025/02/01/motta-posse-camara-emendas.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Posse', 'motta-posse-camara-blindar-emendas-b161-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cvi, 'Carlos Viana defende emendas como instrumento de "ligação" com eleitor.', 'Sem emendas não há política de base. É assim que o parlamentar responde ao eleitor que o elegeu.', 'Entrevista em defesa das RP-6 e RP-8.', 'verified', false, '2024-06-20', 'https://g1.globo.com/politica/noticia/2024/06/20/carlos-viana-emendas-eleitor.ghtml', 'interview', 2, 'Senado Federal', 'Entrevista', 'carlos-viana-emendas-eleitor-b161-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_egm, 'Eliziane Gama cobra auditoria de emendas Pix que geraram "cidades fantasma".', 'Há dinheiro demais sendo enviado a municípios pequenos sem capacidade de execução. Isso é o terreno perfeito para o desvio.', 'Discurso em plenário do Senado sobre desvios identificados pela CGU.', 'verified', false, '2024-11-05', 'https://g1.globo.com/politica/noticia/2024/11/05/eliziane-auditoria-emendas-pix.ghtml', 'speech', 2, 'Senado Federal', 'Plenário', 'eliziane-auditoria-emendas-pix-b161-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino determina devolução de emendas Pix usadas sem comprovação em 2024.', 'Recursos federais sem comprovação de uso devem ser devolvidos aos cofres da União. A regra é clara.', 'Nova decisão após auditorias da CGU.', 'verified', true, '2025-01-22', 'https://www.conjur.com.br/2025-jan-22/dino-devolucao-emendas-pix/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'dino-devolucao-emendas-pix-b161-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Alexandre Ramagem ataca STF por decisão sobre emendas parlamentares.', 'O Supremo quer governar o Brasil. Não é aceitável que decida sobre o orçamento do Congresso.', 'Postagem em redes sociais após decisão de Dino.', 'verified', false, '2024-08-17', 'https://twitter.com/AlexandreRamagem/status/ramagem-emendas-stf', 'social_media_post', 3, 'Twitter', 'Postagem oficial', 'ramagem-ataca-stf-emendas-b161-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende emendas como "reação" ao STF.', 'O Congresso deve usar todas as prerrogativas, inclusive emendas, para frear a ditadura togada.', 'Postagem em redes sociais.', 'verified', false, '2024-08-19', 'https://twitter.com/BolsonaroSP/status/eduardo-emendas-stf', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'eduardo-emendas-reacao-stf-b161-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira exigiu R$ 50 bilhões em emendas para destravar pauta em 2024.', 'O que pedimos é apenas que as emendas sejam pagas como previsto em lei. Caso contrário, não há por que pautar nada.', 'Declaração durante negociação com governo Lula.', 'verified', true, '2024-10-15', 'https://g1.globo.com/politica/noticia/2024/10/15/lira-50-bilhoes-emendas.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-50-bilhoes-emendas-b161-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hco, 'Humberto Costa cobra fim do orçamento secreto travestido.', 'Não podemos permitir que o RP-9 vire RP-8 com outra roupagem. Transparência e rastreabilidade precisam valer.', 'Discurso em plenário sobre emendas de comissão.', 'verified', false, '2023-11-22', 'https://g1.globo.com/politica/noticia/2023/11/22/humberto-orcamento-secreto-travestido.ghtml', 'speech', 2, 'Senado Federal', 'Plenário', 'humberto-orcamento-secreto-travestido-b161-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dju, 'Duarte Jr aponta emendas como mecanismo de corrupção estrutural.', 'As emendas Pix viraram o maior mecanismo de corrupção institucionalizada do Brasil, precisamos acabar com isso.', 'Discurso em plenário da Câmara.', 'verified', false, '2024-11-12', 'https://g1.globo.com/politica/noticia/2024/11/12/duarte-jr-emendas-corrupcao.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'duarte-jr-emendas-corrupcao-b161-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Ricardo Lewandowski defende racionalização das emendas.', 'O modelo atual das emendas é insustentável, precisa ser repensado à luz da Constituição e da governabilidade.', 'Declaração como ministro da Justiça.', 'verified', false, '2024-09-30', 'https://g1.globo.com/politica/noticia/2024/09/30/lewandowski-racionalizacao-emendas.ghtml', 'interview', 2, 'Ministério da Justiça', 'Entrevista', 'lewandowski-racionalizacao-emendas-b161-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira indicou irmão como destinatário de emendas em Alagoas.', 'São investimentos necessários para o meu estado, não há nada de ilegal nisso.', 'Defesa após reportagem que mostrou concentração de emendas em municípios alinhados a parentes.', 'verified', true, '2024-07-30', 'https://g1.globo.com/politica/noticia/2024/07/30/lira-irmao-emendas-alagoas.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-irmao-emendas-alagoas-b161-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rma, 'Rogério Marinho ataca Dino como "ditador togado".', 'Flávio Dino não é ministro, é o interventor do governo Lula no Congresso. Vamos reagir.', 'Declaração no Senado após decisão sobre emendas Pix.', 'verified', false, '2024-08-16', 'https://g1.globo.com/politica/noticia/2024/08/16/marinho-dino-ditador.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'marinho-dino-ditador-togado-b161-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner negocia pacote de emendas em troca de votos para governo.', 'Estamos dialogando com o Congresso para que a pauta do governo avance, incluindo o pagamento de emendas.', 'Declaração como líder do governo no Senado.', 'verified', false, '2024-08-28', 'https://g1.globo.com/politica/noticia/2024/08/28/wagner-negocia-emendas-pauta.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'wagner-negocia-emendas-pauta-b161-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia chantagem do Congresso por emendas.', 'O Congresso hoje age como cartel. Quer aprovar sua pauta, mas condiciona tudo ao pagamento de emendas bilionárias.', 'Declaração como presidente do PT antes de assumir ministério.', 'verified', false, '2024-09-12', 'https://g1.globo.com/politica/noticia/2024/09/12/gleisi-chantagem-emendas.ghtml', 'interview', 3, 'PT Nacional', 'Entrevista', 'gleisi-denuncia-chantagem-emendas-b161-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha negocia emendas de bancada como moeda de apoio.', 'A relação com o Congresso passa inevitavelmente pelo diálogo sobre as emendas. Esse é o jogo parlamentar brasileiro.', 'Declaração como ministro de Relações Institucionais.', 'verified', false, '2024-07-22', 'https://g1.globo.com/politica/noticia/2024/07/22/padilha-emendas-apoio.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'padilha-emendas-apoio-congresso-b161-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende emendas como defesa contra "governo comunista".', 'Não vamos deixar que Lula e Dino cortem a autonomia do Congresso. As emendas são nossa arma.', 'Postagem em redes sociais.', 'verified', false, '2024-08-22', 'https://twitter.com/Biakicis/status/bia-emendas-comunista', 'social_media_post', 3, 'Twitter', 'Postagem oficial', 'bia-kicis-emendas-comunista-b161-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura cobra fim das emendas sem rastreabilidade.', 'Dinheiro público sem rastreabilidade é convite à corrupção. Precisamos acabar com o modelo das emendas Pix.', 'Pronunciamento em plenário.', 'verified', false, '2024-10-02', 'https://g1.globo.com/politica/noticia/2024/10/02/adriana-fim-emendas-pix.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'adriana-fim-emendas-pix-b161-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar vota contra manutenção das emendas opacas.', 'Emendas são importantes, mas precisam ser identificadas, rastreadas e fiscalizadas. Caso contrário, são corrupção pura.', 'Discurso em plenário durante votação.', 'verified', false, '2024-11-20', 'https://g1.globo.com/politica/noticia/2024/11/20/chico-alencar-emendas-opacas.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'chico-alencar-vota-emendas-opacas-b161-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina auditoria integral das emendas Pix desde 2020.', 'Toda emenda Pix transferida desde 2020 deve ser auditada, sob pena de responsabilização civil e criminal dos responsáveis.', 'Decisão em outubro de 2024 intensificando fiscalização.', 'verified', true, '2024-10-18', 'https://www.conjur.com.br/2024-out-18/moraes-auditoria-emendas/', 'official_document', 5, 'STF', 'Decisão em ADPF', 'moraes-auditoria-emendas-pix-b161-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira pressiona Lula a demitir Dino após decisão sobre emendas.', 'Se o ministro insistir em invadir competências do Congresso, ele precisa ser substituído. Essa é nossa posição.', 'Declaração após decisão de agosto de 2024.', 'verified', true, '2024-08-23', 'https://g1.globo.com/politica/noticia/2024/08/23/lira-pressao-demitir-dino.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-pressiona-demitir-dino-b161-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros critica esquema de emendas como "barganha espúria".', 'Isso que está aí não é parlamentarismo, é barganha espúria. O Congresso virou refém do próprio fisiologismo.', 'Discurso em plenário do Senado.', 'verified', false, '2024-09-18', 'https://g1.globo.com/politica/noticia/2024/09/18/renan-emendas-barganha.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'renan-emendas-barganha-espuria-b161-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco articula acordo para manter emendas apesar de STF.', 'O Senado vai dialogar com o STF, mas a prerrogativa orçamentária é do Congresso e não abrimos mão dela.', 'Entrevista após reunião com Dino.', 'verified', false, '2024-08-26', 'https://g1.globo.com/politica/noticia/2024/08/26/pacheco-acordo-stf-emendas.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'pacheco-acordo-stf-emendas-b161-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira é acusado de operar esquema de R$ 7 bilhões em emendas Pix em Alagoas.', 'Tudo foi feito dentro da lei, não há nenhuma irregularidade nas indicações que fiz.', 'Reportagem da Folha identificou concentração anômala de emendas em municípios alagoanos.', 'verified', true, '2024-11-02', 'https://www1.folha.uol.com.br/poder/2024/11/02/lira-7-bilhoes-emendas-alagoas.shtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-7-bilhoes-emendas-alagoas-b161-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino ordena que Congresso identifique "padrinho" de cada emenda.', 'Não é admissível que existam emendas anônimas no orçamento federal. O Congresso tem 90 dias para identificar todos os padrinhos.', 'Decisão do STF em dezembro de 2024.', 'verified', true, '2024-12-20', 'https://www.conjur.com.br/2024-dez-20/dino-padrinho-emendas/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'dino-padrinho-emendas-b161-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica emendas como maior obstáculo fiscal do país.', 'As emendas impositivas se transformaram no maior obstáculo ao ajuste fiscal. O país não cabe nesse formato.', 'Declaração em fórum econômico em 2025.', 'verified', true, '2025-03-14', 'https://valor.globo.com/brasil/noticia/2025/03/14/haddad-emendas-obstaculo-fiscal.ghtml', 'speech', 3, 'São Paulo', 'Fórum econômico', 'haddad-emendas-obstaculo-fiscal-b161-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet cobra reforma radical no modelo de emendas impositivas.', 'Sem reforma do modelo de emendas, o país não conseguirá equilibrar as contas. É matemática simples.', 'Entrevista em 2025 defendendo mudanças no arcabouço fiscal.', 'verified', false, '2025-04-08', 'https://valor.globo.com/brasil/noticia/2025/04/08/tebet-reforma-emendas.ghtml', 'interview', 2, 'Ministério do Planejamento', 'Entrevista', 'tebet-reforma-emendas-impositivas-b161-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta barra tramitação de PL que exige transparência total de emendas.', 'Não vamos discutir esse projeto agora. Há prioridades mais urgentes na pauta da Câmara.', 'Decisão da mesa sobre PL de transparência apresentado pela oposição.', 'verified', false, '2025-03-22', 'https://g1.globo.com/politica/noticia/2025/03/22/motta-barra-pl-transparencia-emendas.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'motta-barra-pl-transparencia-emendas-b161-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz campanha contra Dino por emendas.', 'Dino é o responsável por destruir a democracia representativa ao cassar emendas. Impeachment nele!', 'Postagem em redes sociais pedindo impeachment de Dino.', 'verified', true, '2024-08-22', 'https://twitter.com/nikolas_dm/status/nikolas-impeachment-dino', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'nikolas-impeachment-dino-emendas-b161-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira amplia emendas de comissão após extinção do RP-9 pelo STF.', 'O Congresso encontrou formas legítimas de manter suas prerrogativas orçamentárias, respeitando o STF.', 'Defesa do RP-8 que funcionou como substituto opaco.', 'verified', false, '2023-05-18', 'https://g1.globo.com/politica/noticia/2023/05/18/lira-rp8-substituto.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-amplia-rp8-orcamento-secreto-b161-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro como relator mantém emendas opacas no orçamento de 2024.', 'O relatório preserva as conquistas do Congresso em matéria orçamentária, sem retrocessos.', 'Apresentação do relatório do orçamento 2024.', 'verified', false, '2023-12-18', 'https://g1.globo.com/politica/noticia/2023/12/18/aguinaldo-relator-orcamento-2024.ghtml', 'speech', 4, 'Congresso Nacional', 'CMO', 'aguinaldo-relator-orcamento-2024-emendas-b161-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dwe, 'Dweck denuncia que emendas tornam orçamento "peça de ficção".', 'Com 30% do orçamento federal travado em emendas, o PPA virou peça de ficção. O governo não tem como planejar.', 'Audiência na CMO.', 'verified', false, '2024-11-28', 'https://g1.globo.com/politica/noticia/2024/11/28/dweck-orcamento-ficcao.ghtml', 'speech', 3, 'Congresso Nacional', 'CMO', 'dweck-orcamento-ficcao-emendas-b161-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes determina prisão de assessor ligado a desvio de emendas.', 'Há indícios fortes de organização criminosa operando a distribuição de emendas em troca de propina.', 'Decisão em investigação sobre esquema em estado do Nordeste.', 'verified', true, '2024-12-15', 'https://www.conjur.com.br/2024-dez-15/moraes-prisao-assessor-emendas/', 'official_document', 5, 'STF', 'Decisão em inquérito', 'moraes-prisao-assessor-emendas-b161-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira é denunciado por operação envolvendo emendas Pix em Maceió.', 'Tudo o que indiquei cumpriu a lei. Vou responder judicialmente contra quem difama meu nome.', 'Reação a operação da PF que mirou aliados.', 'verified', true, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/lira-operacao-emendas-maceio.ghtml', 'interview', 5, 'Alagoas', 'Entrevista', 'lira-operacao-emendas-maceio-b161-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica "distorção histórica" das emendas impositivas.', 'Nenhum presidente governa com 20% do orçamento disponível. Precisamos reverter essa distorção histórica criada pelo Congresso.', 'Entrevista em rádio sobre crise orçamentária.', 'verified', true, '2024-09-20', 'https://g1.globo.com/politica/noticia/2024/09/20/lula-distorcao-historica-emendas.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'lula-distorcao-historica-emendas-b161-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino impõe nova regra de transparência prévia para emendas 2025.', 'A partir de agora, toda emenda deverá ter, antes do empenho, identificação do padrinho e plano de trabalho detalhado.', 'Decisão no início de 2025 consolidando regras anteriores.', 'verified', true, '2025-01-30', 'https://www.conjur.com.br/2025-jan-30/dino-transparencia-emendas-2025/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'dino-transparencia-previa-emendas-2025-b161-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rma, 'Rogério Marinho ataca governo por "chantagem" de emendas.', 'É o governo Lula quem faz chantagem. Quer passar a boiada da CPMF e usa emendas como moeda.', 'Declaração em plenário do Senado.', 'verified', false, '2024-10-05', 'https://g1.globo.com/politica/noticia/2024/10/05/marinho-lula-chantagem-emendas.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'marinho-lula-chantagem-emendas-b161-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi, já ministra, negocia com Congresso liberação de emendas por pauta.', 'Minha missão é negociar com o Congresso a aprovação da pauta do governo, incluindo as emendas que serão liberadas.', 'Declaração como nova ministra de Relações Institucionais em 2025.', 'verified', false, '2025-03-05', 'https://g1.globo.com/politica/noticia/2025/03/05/gleisi-negociar-emendas-pauta.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'gleisi-ministra-negociar-emendas-pauta-b161-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem associa bloqueio de emendas a "retaliação" do governo.', 'Estão perseguindo parlamentares bolsonaristas ao tentar bloquear emendas. É perseguição política pura.', 'Postagem em redes sociais após bloqueio.', 'verified', false, '2024-09-01', 'https://twitter.com/AlexandreRamagem/status/ramagem-perseguicao-emendas', 'social_media_post', 3, 'Twitter', 'Postagem oficial', 'ramagem-retaliacao-emendas-b161-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_egm, 'Eliziane Gama denuncia emenda Pix bilionária que financiou prefeituras com contrato fantasma.', 'O esquema identificado é grave, temos milhões de reais que viraram obras de papel e contratos fantasmas.', 'Pronunciamento no Senado sobre relatório da CGU.', 'verified', false, '2024-11-29', 'https://g1.globo.com/politica/noticia/2024/11/29/eliziane-pix-bilhoes-contratos-fantasma.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'eliziane-pix-contratos-fantasma-b161-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira articula CPI contra decisões do STF sobre emendas.', 'Se o Supremo insiste em cassar prerrogativas do Congresso, vamos instalar CPI para investigar a conduta de ministros.', 'Articulação após bloqueio de emendas.', 'verified', true, '2024-09-04', 'https://g1.globo.com/politica/noticia/2024/09/04/lira-cpi-contra-stf.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-cpi-contra-stf-emendas-b161-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco rejeita CPI contra ministros do STF.', 'O Senado não fará CPI para intimidar ministros do Supremo. Essa não é a saída institucional.', 'Declaração rechaçando a proposta de Lira.', 'verified', false, '2024-09-06', 'https://g1.globo.com/politica/noticia/2024/09/06/pacheco-rejeita-cpi-stf.ghtml', 'interview', 2, 'Senado Federal', 'Entrevista', 'pacheco-rejeita-cpi-stf-b161-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alcolumbre nega irregularidades em emendas para o Amapá.', 'As emendas que destinei para o Amapá são todas legítimas, dentro das regras do Congresso.', 'Defesa após reportagem apontar concentração de emendas em municípios de apoio.', 'verified', false, '2024-07-28', 'https://g1.globo.com/politica/noticia/2024/07/28/alcolumbre-emendas-amapa.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'alcolumbre-emendas-amapa-b161-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta defende "orçamento popular" como novo nome para emendas opacas.', 'O orçamento popular é a conquista democrática do deputado levar recursos à sua base. Não abriremos mão.', 'Primeira coletiva após posse, em 2025.', 'verified', true, '2025-02-05', 'https://g1.globo.com/politica/noticia/2025/02/05/motta-orcamento-popular.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Coletiva', 'motta-orcamento-popular-emendas-b161-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis pede impeachment de Dino por decisão sobre emendas.', 'Flávio Dino invadiu competência do Congresso. Cabe impeachment. Vamos protocolar.', 'Apresentação de pedido de impeachment em setembro de 2024.', 'verified', true, '2024-09-10', 'https://g1.globo.com/politica/noticia/2024/09/10/bia-kicis-impeachment-dino.ghtml', 'official_document', 4, 'Câmara dos Deputados', 'Pedido de impeachment', 'bia-kicis-impeachment-dino-b161-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem vota favorável a manutenção de emendas opacas.', 'Emendas são a expressão do federalismo brasileiro. Qualquer transparência deve ser pensada sem ferir a autonomia do parlamentar.', 'Voto em plenário.', 'verified', false, '2024-12-19', 'https://g1.globo.com/politica/noticia/2024/12/19/van-hattem-voto-emendas-opacas.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'van-hattem-vota-emendas-opacas-b161-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro defende emendas como trincheira contra governo Lula.', 'Temos que usar as emendas para blindar prefeituras aliadas. Essa é a estratégia para 2026.', 'Entrevista em 2025.', 'verified', false, '2025-03-10', 'https://g1.globo.com/politica/noticia/2025/03/10/eduardo-emendas-trincheira-lula.ghtml', 'interview', 4, 'Brasília', 'Entrevista', 'eduardo-emendas-trincheira-lula-b161-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dju, 'Duarte Jr denuncia emendas como compra de votos nas eleições municipais 2024.', 'Emendas Pix financiaram campanhas de aliados em 2024. Isso é corrupção eleitoral escancarada.', 'Pronunciamento em plenário após eleições.', 'verified', false, '2024-10-30', 'https://g1.globo.com/politica/noticia/2024/10/30/duarte-jr-emendas-eleicoes-2024.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'duarte-emendas-eleicoes-2024-b161-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes aprova acordo entre Poderes sobre emendas, mas mantém rastreabilidade.', 'O acordo preserva prerrogativas do Congresso, mas a rastreabilidade é inegociável. Essa é a linha que o STF traçou.', 'Homologação do acordo entre Poderes em fim de 2024.', 'verified', true, '2024-12-18', 'https://www.conjur.com.br/2024-dez-18/moraes-acordo-emendas-poderes/', 'official_document', 4, 'STF', 'Homologação de acordo', 'moraes-acordo-poderes-emendas-b161-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira deixa Câmara mantendo estrutura de emendas opacas.', 'Deixo o cargo orgulhoso do legado do Congresso em matéria orçamentária. As emendas são uma conquista.', 'Discurso de despedida da presidência em janeiro de 2025.', 'verified', true, '2025-01-31', 'https://g1.globo.com/politica/noticia/2025/01/31/lira-despedida-presidencia.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Despedida', 'lira-despedida-legado-emendas-b161-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elm, 'Elmar Nascimento assume liderança da Câmara e defende emendas.', 'Como líder do União Brasil, vou garantir que as emendas sejam pagas integralmente. Essa é nossa prioridade.', 'Declaração ao assumir liderança.', 'verified', false, '2025-02-10', 'https://g1.globo.com/politica/noticia/2025/02/10/elmar-lideranca-emendas.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'elmar-lideranca-emendas-b161-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que emendas bloqueadas pelo STF salvaram meta fiscal.', 'Se o STF não tivesse bloqueado parte das emendas em 2024, não teríamos cumprido a meta fiscal.', 'Declaração em balanço de 2024.', 'verified', false, '2025-01-15', 'https://valor.globo.com/brasil/noticia/2025/01/15/haddad-emendas-meta-fiscal.ghtml', 'interview', 3, 'Ministério da Fazenda', 'Entrevista', 'haddad-emendas-meta-fiscal-b161-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira coordena assinaturas contra CPI das emendas.', 'Não há por que fazer CPI das emendas, tudo é feito dentro da lei e do regimento.', 'Articulação para barrar CPI proposta em 2024.', 'verified', false, '2024-11-15', 'https://g1.globo.com/politica/noticia/2024/11/15/lira-barra-cpi-emendas.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Articulação', 'lira-barra-cpi-emendas-b161-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias critica "orçamento paralelo" do Congresso.', 'O que o Congresso criou é um orçamento paralelo, sem controle, sem rastreabilidade. É incompatível com a Constituição.', 'Declaração como AGU em audiência no STF.', 'verified', false, '2024-12-05', 'https://g1.globo.com/politica/noticia/2024/12/05/messias-orcamento-paralelo.ghtml', 'speech', 3, 'STF', 'Audiência em ADPF', 'messias-orcamento-paralelo-b161-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cvi, 'Carlos Viana minimiza escândalo de emendas Pix em Minas.', 'Tem muita imprensa pelego querendo macular o Congresso. Emendas são legítimas.', 'Declaração após reportagem sobre esquema mineiro.', 'verified', false, '2024-10-20', 'https://g1.globo.com/politica/noticia/2024/10/20/viana-emendas-pix-minas.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'viana-minimiza-emendas-pix-minas-b161-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino determina que TCU audite 100% das emendas Pix executadas.', 'A cada emenda Pix já executada sem rastreabilidade deverá ser auditada pelo TCU em até 18 meses.', 'Decisão em março de 2025 consolidando regras.', 'verified', true, '2025-03-18', 'https://www.conjur.com.br/2025-mar-18/dino-tcu-auditoria-pix/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'dino-tcu-auditoria-100-emendas-b161-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi articula manutenção das emendas em troca de votos do arcabouço.', 'A governabilidade exige que as emendas sejam tratadas com pragmatismo. O governo não pode perder o Congresso.', 'Declaração como ministra de Relações Institucionais em 2025.', 'verified', false, '2025-04-02', 'https://g1.globo.com/politica/noticia/2025/04/02/gleisi-emendas-arcabouco.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'gleisi-emendas-arcabouco-votos-b161-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros classifica emendas como "segundo Mensalão".', 'Estamos diante do segundo Mensalão. O que era propina por voto virou emenda por voto. Idêntico.', 'Pronunciamento em plenário do Senado.', 'verified', true, '2024-10-23', 'https://g1.globo.com/politica/noticia/2024/10/23/renan-emendas-segundo-mensalao.ghtml', 'speech', 4, 'Senado Federal', 'Plenário', 'renan-emendas-segundo-mensalao-b161-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira permite emendas direcionadas a empresas de parentes em Alagoas.', 'Meu irmão e minha família são agentes políticos e econômicos legítimos. Não há conflito de interesse.', 'Defesa após denúncias de nepotismo orçamentário.', 'verified', true, '2024-11-25', 'https://g1.globo.com/politica/noticia/2024/11/25/lira-empresas-parentes-emendas.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Entrevista', 'lira-emendas-empresas-parentes-b161-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura chama orçamento de "emendas irresponsáveis".', 'O Brasil é o único país onde o parlamentar é o gestor de R$ 50 bilhões sem plano, sem rastreio, sem nada.', 'Pronunciamento durante votação do orçamento de 2025.', 'verified', false, '2024-12-17', 'https://g1.globo.com/politica/noticia/2024/12/17/adriana-emendas-irresponsaveis.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'adriana-emendas-irresponsaveis-b161-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Hugo Motta comanda aprovação de PLN que amplia emendas para 2026.', 'Este PLN fortalece a autonomia parlamentar e corrige distorções no orçamento de 2026.', 'Aprovação de ampliação de emendas em plenário.', 'verified', false, '2025-04-10', 'https://g1.globo.com/politica/noticia/2025/04/10/motta-pln-amplia-emendas-2026.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'motta-pln-amplia-emendas-2026-b161-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rrd, 'Randolfe cobra responsabilização criminal por emendas desviadas.', 'Quem desviou dinheiro público via emendas deve responder criminalmente. Não pode haver impunidade.', 'Pronunciamento em plenário do Senado.', 'verified', false, '2024-11-20', 'https://g1.globo.com/politica/noticia/2024/11/20/randolfe-criminal-emendas.ghtml', 'speech', 2, 'Senado Federal', 'Plenário', 'randolfe-criminal-emendas-b161-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira protege aliados de investigação sobre emendas via manobra regimental.', 'O regimento permite. Não aceitarei perseguição política contra deputados da base.', 'Manobra para retirar de pauta convocação de ministros e ocultar investigação.', 'verified', true, '2024-10-09', 'https://g1.globo.com/politica/noticia/2024/10/09/lira-protege-aliados-emendas.ghtml', 'interview', 5, 'Câmara dos Deputados', 'Articulação', 'lira-protege-aliados-investigacao-emendas-b161-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha libera emendas em troca de votos da reforma tributária.', 'Houve pagamento de emendas conforme previsto em lei. Nada fora do protocolo.', 'Negociação antes da aprovação final da reforma tributária.', 'verified', false, '2024-12-10', 'https://g1.globo.com/politica/noticia/2024/12/10/padilha-emendas-reforma-tributaria.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'padilha-emendas-reforma-tributaria-b161-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet cobra CNJ por inércia diante de emendas fraudulentas.', 'O Judiciário precisa agir contra as fraudes de emendas em municípios. O CNJ tem responsabilidade nisso.', 'Declaração em evento sobre governança.', 'verified', false, '2024-11-18', 'https://g1.globo.com/politica/noticia/2024/11/18/tebet-cnj-emendas-fraudulentas.ghtml', 'speech', 2, 'São Paulo', 'Evento sobre governança', 'tebet-cnj-emendas-fraudulentas-b161-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rma, 'Marinho defende suspensão do pagamento só se houver cortes iguais no governo.', 'Se emendas forem cortadas, discricionárias do governo também devem ser. Não aceitamos critério duplo.', 'Discurso em plenário.', 'verified', false, '2024-09-05', 'https://g1.globo.com/politica/noticia/2024/09/05/marinho-emendas-discricionarias.ghtml', 'speech', 3, 'Senado Federal', 'Plenário', 'marinho-emendas-discricionarias-b161-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moraes repreende Congresso por descumprir regras de emendas.', 'Não podemos admitir que o Congresso continue operando emendas fora das regras de transparência. É descumprimento de decisão judicial.', 'Decisão em outubro de 2024.', 'verified', true, '2024-10-28', 'https://www.conjur.com.br/2024-out-28/moraes-repreende-congresso-emendas/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'moraes-repreende-congresso-emendas-b161-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner admite que emendas são moeda de governabilidade.', 'É inegável que as emendas são hoje a moeda da relação entre Executivo e Legislativo. Precisa-se reformar, mas é o que temos.', 'Entrevista em 2025.', 'verified', false, '2025-02-28', 'https://g1.globo.com/politica/noticia/2025/02/28/wagner-emendas-moeda-governabilidade.ghtml', 'interview', 3, 'Senado Federal', 'Entrevista', 'wagner-emendas-moeda-governabilidade-b161-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas defende emendas como "dinheiro do povo" contra governo Lula.', 'Esse dinheiro é do povo, representado pelos parlamentares eleitos. O Supremo não manda no povo.', 'Postagem em redes.', 'verified', false, '2024-12-22', 'https://twitter.com/nikolas_dm/status/nikolas-emendas-povo', 'social_media_post', 3, 'Twitter', 'Postagem oficial', 'nikolas-emendas-dinheiro-povo-b161-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira veta emendas a ONGs progressistas.', 'Não vamos financiar ONGs que atacam valores da família brasileira. É escolha política legítima.', 'Articulação para cortar emendas destinadas a entidades progressistas.', 'verified', false, '2024-05-22', 'https://g1.globo.com/politica/noticia/2024/05/22/lira-veta-emendas-ongs.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Articulação', 'lira-veta-emendas-ongs-b161-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta negocia pacote de emendas em troca de aprovação de PL Antifacção.', 'As emendas precisam ser pagas para que o Parlamento avance na pauta de segurança.', 'Declaração durante negociação em 2025.', 'verified', false, '2025-03-28', 'https://g1.globo.com/politica/noticia/2025/03/28/motta-emendas-pl-antifaccao.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'motta-emendas-pl-antifaccao-b161-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar denuncia emendas como "distorção republicana".', 'O modelo atual é uma distorção republicana. Emendas impositivas sem rastreabilidade matam o orçamento.', 'Pronunciamento em plenário.', 'verified', false, '2024-09-17', 'https://g1.globo.com/politica/noticia/2024/09/17/chico-alencar-emendas-distorcao.ghtml', 'speech', 2, 'Câmara dos Deputados', 'Plenário', 'chico-alencar-emendas-distorcao-b161-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira bloqueia CPI das ONGs com contrapartida de emendas.', 'Não vamos pautar CPIs que atrapalhem o trabalho do Congresso. A pauta é soberana.', 'Articulação em 2024.', 'verified', false, '2024-06-12', 'https://g1.globo.com/politica/noticia/2024/06/12/lira-bloqueia-cpi-ongs-emendas.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Articulação', 'lira-bloqueia-cpi-ongs-emendas-b161-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem, mesmo inelegível, pressiona pela aprovação de emendas antes de 2026.', 'Precisamos pagar as emendas. Esse é o compromisso da oposição para 2026.', 'Declaração em entrevista.', 'verified', false, '2025-04-03', 'https://g1.globo.com/politica/noticia/2025/04/03/ramagem-emendas-2026.ghtml', 'interview', 3, 'Câmara dos Deputados', 'Entrevista', 'ramagem-emendas-antes-2026-b161-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que emendas "tiraram o poder" do presidente.', 'Um presidente hoje não governa com R$ 50 bilhões tomados pelo Congresso. É um problema estrutural grave.', 'Entrevista em rádio em 2025.', 'verified', true, '2025-04-15', 'https://g1.globo.com/politica/noticia/2025/04/15/lula-emendas-tiraram-poder.ghtml', 'interview', 3, 'Palácio do Planalto', 'Entrevista', 'lula-emendas-tiraram-poder-b161-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino adverte que descumprimento das regras de emendas gera responsabilização.', 'Prefeitos e parlamentares que descumprirem as regras de transparência responderão na esfera cível e criminal.', 'Decisão em 2025.', 'verified', true, '2025-02-25', 'https://www.conjur.com.br/2025-fev-25/dino-adverte-responsabilizacao/', 'official_document', 4, 'STF', 'Decisão em ADPF', 'dino-adverte-responsabilizacao-emendas-b161-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hco, 'Humberto Costa condena emendas como "distribuição de dinheiro no varejo".', 'Viramos um país onde a política nacional é feita no varejo das emendas. Isso precisa acabar.', 'Pronunciamento em plenário.', 'verified', false, '2024-12-04', 'https://g1.globo.com/politica/noticia/2024/12/04/humberto-emendas-varejo.ghtml', 'speech', 2, 'Senado Federal', 'Plenário', 'humberto-emendas-varejo-b161-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias atua no STF pela constitucionalidade do bloqueio de emendas.', 'A AGU sustenta que a rastreabilidade é requisito constitucional. Sem ela, não há gasto público legítimo.', 'Sustentação oral no STF.', 'verified', false, '2024-12-18', 'https://g1.globo.com/politica/noticia/2024/12/18/messias-stf-emendas-rastreabilidade.ghtml', 'speech', 2, 'STF', 'Sustentação oral', 'messias-stf-constitucionalidade-emendas-b161-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta adia votação de projeto de rastreabilidade total das emendas.', 'Vamos analisar com calma. Não se pode legislar sob pressão da imprensa e do STF.', 'Decisão em 2025.', 'verified', false, '2025-04-08', 'https://g1.globo.com/politica/noticia/2025/04/08/motta-adia-projeto-rastreabilidade.ghtml', 'interview', 4, 'Câmara dos Deputados', 'Entrevista', 'motta-adia-projeto-rastreabilidade-b161-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira mantém controle sobre emendas pós-presidência como "cacique" do Centrão.', 'Continuo atuando no Parlamento. A relação com minhas bases e as emendas é algo da atividade política.', 'Declaração em entrevista como ex-presidente.', 'verified', true, '2025-04-12', 'https://g1.globo.com/politica/noticia/2025/04/12/lira-cacique-centrao-emendas.ghtml', 'interview', 5, 'Alagoas', 'Entrevista', 'lira-cacique-centrao-emendas-b161-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

END $$;
