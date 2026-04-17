-- Batch 91: Congress leadership and legislative conflicts (Jan 2023 - Apr 2026) - Part 2
DO $$
DECLARE
  v_lira UUID; v_motta UUID; v_pacheco UUID; v_alcol UUID; v_renan UUID;
  v_aguin UUID; v_elmar UUID; v_randolfe UUID; v_jwagner UUID; v_hcosta UUID;
  v_otto UUID; v_efraim UUID; v_rmarinho UUID; v_aziz UUID; v_soraya UUID;
  v_pontes UUID; v_eliziane UUID; v_wfagundes UUID; v_acoronel UUID; v_cid UUID;
  v_amin UUID; v_avieira UUID; v_mecias UUID; v_izalci UUID; v_contarato UUID;
  v_tabata UUID; v_erika UUID; v_samia UUID; v_taliria UUID; v_adriana UUID;
  v_vanhattem UUID; v_kim UUID; v_orlando UUID; v_chico UUID; v_jandira UUID;
  v_jguima UUID; v_zeca UUID; v_carreras UUID; v_afonso UUID; v_freixo UUID;
  v_duarte UUID; v_lindbergh UUID; v_dino UUID; v_moraes UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_abu UUID; c_aut UUID;
  c_obs UUID; c_ame UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_lira FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_motta FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_pacheco FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_alcol FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_renan FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_aguin FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_elmar FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_randolfe FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_jwagner FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hcosta FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_otto FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_efraim FROM politicians WHERE slug = 'efraim-filho';
  SELECT id INTO v_rmarinho FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_aziz FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_soraya FROM politicians WHERE slug = 'soraya-thronicke';
  SELECT id INTO v_pontes FROM politicians WHERE slug = 'marcos-pontes';
  SELECT id INTO v_eliziane FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_wfagundes FROM politicians WHERE slug = 'wellington-fagundes';
  SELECT id INTO v_acoronel FROM politicians WHERE slug = 'angelo-coronel';
  SELECT id INTO v_cid FROM politicians WHERE slug = 'cid-gomes';
  SELECT id INTO v_amin FROM politicians WHERE slug = 'esperidiao-amin';
  SELECT id INTO v_avieira FROM politicians WHERE slug = 'alessandro-vieira';
  SELECT id INTO v_mecias FROM politicians WHERE slug = 'mecias-de-jesus';
  SELECT id INTO v_izalci FROM politicians WHERE slug = 'izalci-lucas';
  SELECT id INTO v_contarato FROM politicians WHERE slug = 'contarato';
  SELECT id INTO v_tabata FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_erika FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_samia FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_taliria FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_adriana FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_vanhattem FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_orlando FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chico FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jandira FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_jguima FROM politicians WHERE slug = 'jose-guimaraes';
  SELECT id INTO v_zeca FROM politicians WHERE slug = 'zeca-dirceu';
  SELECT id INTO v_carreras FROM politicians WHERE slug = 'felipe-carreras';
  SELECT id INTO v_afonso FROM politicians WHERE slug = 'afonso-florence';
  SELECT id INTO v_freixo FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_duarte FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_lindbergh FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_dino FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_moraes FROM politicians WHERE slug = 'alexandre-de-moraes';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta defende PL da Anistia como "pacificação" e gera reação do governo.', 'O Brasil precisa virar a página. A anistia é caminho para pacificar o país.', 'Declaração em entrevista após pressão da oposição para pautar o tema.', 'verified', true, '2025-08-19', 'https://www1.folha.uol.com.br/poder/2025/08/motta-pl-anistia-pacificacao.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista coletiva', 'motta-pl-anistia-pacificacao-b91-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lindbergh, 'Lindbergh acusa Motta de tentar anistiar golpistas do 8 de janeiro.', 'Pautar anistia é anistiar golpistas. Não é pacificação, é conivência.', 'Pronunciamento em plenário após fala de Hugo Motta.', 'verified', true, '2025-08-20', 'https://g1.globo.com/politica/noticia/2025/08/20/lindbergh-anistia-golpistas-motta.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'lindbergh-motta-anistia-b91-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre condiciona votação de pauta fiscal a acordo sobre emendas Pix.', 'Sem acordo sobre emendas, não há clima para arcabouço nem para ajuste.', 'Declaração em reunião com Haddad na Fazenda.', 'verified', false, '2025-04-08', 'https://www.poder360.com.br/economia/alcolumbre-emendas-pix-fiscal/', 'news_article', 3, 'Brasília', 'Reunião com a Fazenda', 'alcolumbre-emendas-pix-fiscal-b91-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira rejeita PEC que restringia indicação política a estatais.', 'Não vou pautar a PEC que desarma o Executivo de dialogar com o Congresso.', 'Declaração após pressão para votar PEC das estatais.', 'verified', false, '2023-10-24', 'https://www.cnnbrasil.com.br/politica/lira-pec-estatais-indicacoes/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista a jornalistas', 'lira-pec-estatais-b91-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avieira, 'Alessandro Vieira denuncia "toma-lá-dá-cá" na nomeação de diretoria da ANS.', 'Colocaram apadrinhados políticos na ANS. Saúde virou moeda de troca.', 'Pronunciamento sobre indicações para agências reguladoras.', 'verified', false, '2024-11-19', 'https://oglobo.globo.com/politica/alessandro-vieira-ans-indicacoes/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'alessandro-ans-toma-la-da-ca-b91-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros articula contra Alcolumbre na eleição para vice-presidência.', 'Senado não pode virar feudo. Ou recuperamos protagonismo, ou vamos à marginalidade.', 'Declaração em bastidor da eleição da Mesa Diretora.', 'verified', false, '2025-01-28', 'https://www.metropoles.com/brasil/politica-br/renan-alcolumbre-mesa-senado', 'news_article', 2, 'Senado Federal', 'Pré-eleição da Mesa', 'renan-alcolumbre-mesa-b91-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke defende PL antifacções com endurecimento penal.', 'Facções controlam parte do país. Precisamos endurecer penas agora.', 'Discurso em defesa do endurecimento penal no Senado.', 'verified', false, '2025-05-21', 'https://www.jota.info/legislativo/soraya-pl-antifaccoes-21052025', 'news_article', 2, 'Senado Federal', 'Debate PL antifacções', 'soraya-pl-antifaccoes-b91-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pontes, 'Marcos Pontes vota contra relatório da CPMI do 8 de janeiro e defende inocência de Bolsonaro.', 'Não há prova concreta contra o presidente Bolsonaro. O relatório é panfleto político.', 'Voto em separado ao relatório final da CPMI.', 'verified', false, '2023-10-17', 'https://www12.senado.leg.br/noticias/materias/2023/10/17/pontes-voto-separado-cpmi', 'news_article', 4, 'Senado Federal', 'Votação final da CPMI', 'pontes-voto-separado-cpmi-b91-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wfagundes, 'Wellington Fagundes defende manutenção de indicações partidárias em agências.', 'Indicação política é prerrogativa legítima. Sempre foi e será assim.', 'Discurso em sabatina de agência reguladora.', 'verified', false, '2024-06-12', 'https://oglobo.globo.com/politica/wellington-agencias-indicacoes-politicas/', 'news_article', 2, 'Senado Federal', 'Sabatina de agência', 'wellington-agencias-indicacoes-b91-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_izalci, 'Izalci Lucas acusa Lula de manobrar indicações no TSE para "garantir eleição".', 'Lula quer aparelhar o TSE para garantir reeleição. É antidemocrático.', 'Declaração em sabatina de indicado ao TSE.', 'verified', false, '2024-08-27', 'https://www.cnnbrasil.com.br/politica/izalci-lula-tse-aparelhar/', 'news_article', 4, 'Senado Federal', 'Sabatina TSE', 'izalci-lula-tse-b91-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco defende que sabatina de Dino ao STF seja respeitosa.', 'O Senado vai sabatinar com altura. Ninguém será tratado como réu.', 'Declaração antes da sabatina do ex-ministro Flávio Dino.', 'verified', true, '2023-12-13', 'https://www12.senado.leg.br/noticias/materias/2023/12/13/pacheco-sabatina-dino-respeito', 'news_article', 1, 'Senado Federal', 'Sabatina Flávio Dino', 'pacheco-sabatina-dino-b91-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho promete "sabatina severa" a Dino no STF.', 'Vou expor o Dino na sabatina. É militante, não ministro.', 'Declaração antes da sabatina para o STF.', 'verified', true, '2023-12-12', 'https://www.poder360.com.br/congresso/rogerio-marinho-dino-sabatina-stf/', 'news_article', 3, 'Senado Federal', 'Antes da sabatina STF', 'rogerio-dino-sabatina-severa-b91-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_acoronel, 'Ângelo Coronel vota contra Dino e ataca "viés militante" do indicado.', 'Indicar militante para o STF é enfraquecer a democracia.', 'Declaração de voto na sabatina de Dino.', 'verified', false, '2023-12-13', 'https://www.metropoles.com/brasil/politica-br/angelo-coronel-dino-stf-militante', 'news_article', 3, 'Senado Federal', 'Sabatina Dino', 'angelo-coronel-dino-militante-b91-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dino, 'Dino se defende em sabatina: "Não sou militante, sou juiz há 30 anos".', 'Fui juiz federal. Sei o peso da toga. Exerço com isenção.', 'Pronunciamento de Dino durante a sabatina no Senado.', 'verified', true, '2023-12-13', 'https://www12.senado.leg.br/noticias/materias/2023/12/13/dino-sabatina-isencao-stf', 'news_article', 1, 'Senado Federal', 'Sabatina STF', 'dino-sabatina-isencao-b91-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem protocola impeachment contra Alexandre de Moraes.', 'Moraes viola a Constituição todos os dias. Precisa ser afastado.', 'Protocolo formal de pedido de impeachment contra ministro do STF.', 'verified', true, '2023-10-03', 'https://www1.folha.uol.com.br/poder/2023/10/van-hattem-impeachment-moraes.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Protocolo de impeachment', 'vanhattem-impeachment-moraes-b91-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri apresenta PL para mandato de ministros do STF.', 'Ministros vitalícios é herança autoritária. Vamos limitar mandatos.', 'Apresentação de PL com trava para ministros do STF.', 'verified', false, '2023-09-05', 'https://g1.globo.com/politica/noticia/2023/09/05/kim-pl-mandato-stf.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação do projeto', 'kim-mandato-stf-b91-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adriana, 'Adriana Ventura critica articulação de Lira por "superministério" das emendas.', 'Criaram um superministério das emendas para loteamento político.', 'Declaração após reorganização do Orçamento.', 'verified', false, '2024-05-29', 'https://www.poder360.com.br/congresso/adriana-ventura-superministerio-emendas/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista a jornalistas', 'adriana-superministerio-emendas-b91-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jguima, 'José Guimarães defende "liberação de emendas" para destravar MPs.', 'Governo vai liberar emendas para destravar votações. É a realidade.', 'Declaração após reunião de líderes governistas.', 'verified', false, '2024-06-04', 'https://www.cnnbrasil.com.br/politica/jose-guimaraes-emendas-mps-liberacao/', 'news_article', 3, 'Câmara dos Deputados', 'Reunião de líderes', 'jguima-emendas-mps-b91-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zeca, 'Zeca Dirceu rebate oposição e classifica impeachment de Moraes como "chantagem".', 'Impeachment é arma de chantagem contra o STF. Não aceitamos.', 'Discurso após protocolo de novo pedido de impeachment.', 'verified', false, '2024-08-15', 'https://www.metropoles.com/brasil/politica-br/zeca-dirceu-impeachment-moraes-chantagem', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'zeca-moraes-chantagem-b91-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carreras, 'Felipe Carreras defende mais tempo para relator da reforma tributária no Senado.', 'Precisamos ouvir a sociedade antes de votar. Não é decreto.', 'Declaração durante tramitação da regulamentação da reforma.', 'verified', false, '2024-12-11', 'https://oglobo.globo.com/politica/carreras-reforma-tributaria-relator-tempo/', 'news_article', 1, 'Câmara dos Deputados', 'Debate reforma tributária', 'carreras-reforma-tempo-b91-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_afonso, 'Afonso Florence acusa Centrão de diluir PL da Transição Energética.', 'Estão diluindo o PL para favorecer petroleiras. É vergonhoso.', 'Pronunciamento durante votação na Câmara.', 'verified', false, '2024-07-18', 'https://www1.folha.uol.com.br/mercado/2024/07/afonso-florence-transicao-energetica.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Debate Transição Energética', 'afonso-transicao-petroleiras-b91-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo critica bancada da bala por "inviabilizar" PEC da Segurança.', 'A bancada da bala prefere lucrar com o caos a resolver o problema.', 'Declaração após obstrução da PEC na Câmara.', 'verified', false, '2025-03-25', 'https://www.poder360.com.br/congresso/freixo-bancada-bala-pec-seguranca/', 'news_article', 3, 'Câmara dos Deputados', 'Debate PEC da Segurança', 'freixo-bancada-bala-pec-b91-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral denuncia Motta por não pautar reforma do Ensino Médio ajustada.', 'Segurar a reforma do Ensino Médio é prejudicar milhões de jovens.', 'Entrevista após adiamento da votação no plenário.', 'verified', false, '2025-06-12', 'https://www.cnnbrasil.com.br/politica/tabata-motta-ensino-medio/', 'news_article', 2, 'Câmara dos Deputados', 'Debate Ensino Médio', 'tabata-motta-ensino-medio-b91-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim denuncia proposta "Escola sem Partido 2.0" apadrinhada por Motta.', 'Querem censurar professores novamente. Escola sem Partido é mordaça.', 'Discurso em plenário contra PL apresentado por bolsonaristas.', 'verified', false, '2025-09-18', 'https://www.metropoles.com/brasil/politica-br/samia-escola-sem-partido-2', 'news_article', 3, 'Câmara dos Deputados', 'Debate Escola sem Partido', 'samia-escola-sem-partido-b91-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone relata ameaças recebidas após discurso contra a PL Antiterrorismo.', 'Fui ameaçada novamente. Não vão me calar.', 'Declaração após denunciar ameaças nas redes sociais.', 'verified', false, '2025-10-30', 'https://www1.folha.uol.com.br/poder/2025/10/taliria-ameacas-pl-antiterrorismo.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'taliria-ameacas-pl-b91-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar critica Motta por vetar emendas da oposição de esquerda.', 'Motta diz que é de todos, mas prioriza as emendas do Centrão.', 'Declaração após embate por calendário de execução orçamentária.', 'verified', false, '2025-04-16', 'https://oglobo.globo.com/politica/chico-alencar-motta-emendas-esquerda/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista a jornalistas', 'chico-motta-emendas-b91-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orlando, 'Orlando Silva defende mais poder para o TSE contra desinformação.', 'Sem ferramentas contra desinformação, a eleição de 2026 está em risco.', 'Participação em audiência pública na Câmara.', 'verified', false, '2025-08-07', 'https://www.poder360.com.br/congresso/orlando-silva-tse-desinformacao-2026/', 'news_article', 2, 'Câmara dos Deputados', 'Audiência pública', 'orlando-tse-desinformacao-b91-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre articula escolha de Messias para vaga no STF a contragosto do governo.', 'O Senado escolhe com quem dialoga. Quero Messias na vaga.', 'Declaração após divergência com Lula sobre vaga no STF.', 'verified', true, '2025-11-10', 'https://www12.senado.leg.br/noticias/materias/2025/11/10/alcolumbre-messias-stf-vaga', 'news_article', 3, 'Senado Federal', 'Disputa vaga STF', 'alcolumbre-messias-stf-b91-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwagner, 'Jaques Wagner negocia apoio de Alcolumbre para pauta fiscal em troca de vaga no STF.', 'Vamos buscar convergência. Nome para o STF vai atender critérios do Senado.', 'Entrevista após reuniões para destravar vaga.', 'verified', false, '2025-11-12', 'https://www.cnnbrasil.com.br/politica/jaques-wagner-stf-alcolumbre-acordo/', 'news_article', 3, 'Brasília', 'Negociação STF', 'jaques-wagner-stf-acordo-b91-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hcosta, 'Humberto Costa defende Jorge Messias para o STF em acordo com governo.', 'Messias tem currículo e lealdade. É nome do governo, a escolha é nossa.', 'Declaração ao defender indicação do AGU para o STF.', 'verified', false, '2025-11-14', 'https://g1.globo.com/politica/noticia/2025/11/14/humberto-costa-messias-stf.ghtml', 'news_article', 2, 'Senado Federal', 'Debate sobre vaga STF', 'humberto-messias-stf-b91-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar critica "aparelhamento mercantil" do Banco Central.', 'Colocaram o BC a serviço da Faria Lima. Precisamos devolver a autonomia responsável.', 'Discurso em sessão do Senado sobre o BC.', 'verified', false, '2024-05-07', 'https://www1.folha.uol.com.br/mercado/2024/05/otto-alencar-bc-faria-lima.shtml', 'news_article', 2, 'Senado Federal', 'Debate sobre BC', 'otto-bc-faria-lima-b91-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_efraim, 'Efraim Filho articula apoio de União Brasil para reforma administrativa.', 'Nosso partido vai apoiar em bloco. É hora de enxugar o Estado.', 'Entrevista após reunião da bancada.', 'verified', false, '2025-06-05', 'https://www.jota.info/legislativo/efraim-uniao-brasil-reforma-administrativa-05062025', 'news_article', 2, 'Câmara dos Deputados', 'Reunião de bancada', 'efraim-uniao-reforma-b91-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama defende cassação de mandato de parlamentar golpista.', 'Parlamentar que pede golpe tem que perder o mandato. Ponto.', 'Declaração após episódios de defesa do golpe em redes.', 'verified', false, '2024-01-08', 'https://www.metropoles.com/brasil/politica-br/eliziane-cassacao-golpistas', 'news_article', 2, 'Senado Federal', 'Ato pela democracia', 'eliziane-cassacao-golpistas-b91-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cid Gomes confronta colegas bolsonaristas em sessão tumultuada.', 'Parem com esse discurso golpista. Quem quer golpe não é democrata.', 'Fala de Cid Gomes durante confronto em plenário do Senado.', 'verified', true, '2023-05-11', 'https://www12.senado.leg.br/noticias/materias/2023/05/11/cid-gomes-confronto-bolsonaristas', 'news_article', 2, 'Senado Federal', 'Sessão plenária', 'cid-confronto-bolsonaristas-b91-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amin, 'Esperidião Amin critica "açodamento" em votações da reforma tributária.', 'Votamos texto enorme em 48 horas. Isso é açodamento irresponsável.', 'Declaração após aprovação da regulamentação no Senado.', 'verified', false, '2024-12-12', 'https://oglobo.globo.com/politica/amin-reforma-tributaria-acodamento/', 'news_article', 2, 'Senado Federal', 'Votação reforma tributária', 'amin-reforma-acodamento-b91-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mecias, 'Mecias de Jesus vota contra demarcação e ataca indigenistas no plenário.', 'Os indigenistas querem imobilizar o Brasil. Não vamos permitir.', 'Discurso durante votação do marco temporal.', 'verified', false, '2023-09-27', 'https://www.poder360.com.br/congresso/mecias-jesus-marco-temporal-indigenistas/', 'news_article', 3, 'Senado Federal', 'Votação marco temporal', 'mecias-marco-indigenistas-b91-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_izalci, 'Izalci Lucas apresenta pedido para CPI das ONGs na Amazônia.', 'Vamos investigar as ONGs que atuam com dinheiro estrangeiro na Amazônia.', 'Protocolo de requerimento para CPI das ONGs.', 'verified', false, '2024-02-07', 'https://www12.senado.leg.br/noticias/materias/2024/02/07/izalci-cpi-ongs-amazonia', 'news_article', 3, 'Senado Federal', 'Protocolo CPI das ONGs', 'izalci-cpi-ongs-b91-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_contarato, 'Contarato denuncia Bancada da Bíblia por vetar PL contra LGBTfobia.', 'A bancada da Bíblia veta qualquer direito humano que não se encaixe na sua agenda.', 'Declaração em plenário durante debate.', 'verified', false, '2024-06-28', 'https://www.cnnbrasil.com.br/politica/contarato-bancada-biblia-lgbtfobia/', 'news_article', 3, 'Senado Federal', 'Debate PL LGBT', 'contarato-bancada-lgbtfobia-b91-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho defende aprovação de PL que limita poderes do STF.', 'O STF virou poder moderador. Vamos retirá-lo dessa posição inconstitucional.', 'Pronunciamento em apoio a projeto de lei contra o STF.', 'verified', true, '2024-10-09', 'https://www.metropoles.com/brasil/politica-br/rogerio-marinho-pl-limitar-stf', 'news_article', 4, 'Senado Federal', 'Debate PL contra STF', 'rogerio-pl-limita-stf-b91-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira retoma PEC dos Recursos e acusa governo de "vetar tudo que interessa".', 'O governo veta tudo. Se insistir, vamos reagir com essa PEC.', 'Declaração sobre retomada da PEC dos Recursos.', 'verified', false, '2024-03-11', 'https://www1.folha.uol.com.br/poder/2024/03/lira-pec-recursos-vetar.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'lira-pec-recursos-b91-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues discute mudança de partido para Novo Republicano.', 'Estou em conversas. Quero um partido que dialogue com as bases do governo.', 'Declaração em entrevista sobre possível mudança.', 'verified', false, '2024-03-28', 'https://g1.globo.com/politica/noticia/2024/03/28/randolfe-mudanca-partido.ghtml', 'news_article', 1, 'Senado Federal', 'Entrevista coletiva', 'randolfe-mudanca-partido-b91-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz vê chance mínima de aprovar anistia aos golpistas no Senado.', 'Essa anistia não passa. O Senado sabe o que é democracia.', 'Entrevista após entrada do PL da Anistia no Senado.', 'verified', false, '2025-09-26', 'https://www.poder360.com.br/congresso/omar-aziz-anistia-senado-chance-minima/', 'news_article', 2, 'Senado Federal', 'Entrevista a jornalistas', 'aziz-anistia-senado-b91-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elmar, 'Elmar Nascimento pressiona Motta por relatoria indicada do Centrão na LDO.', 'Ou o Centrão relata a LDO, ou não há votação. É isso.', 'Declaração em reunião de líderes do Centrão.', 'verified', false, '2025-06-23', 'https://www.metropoles.com/brasil/politica-br/elmar-centrao-ldo-relator', 'news_article', 3, 'Câmara dos Deputados', 'Reunião de líderes', 'elmar-ldo-relator-b91-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_duarte, 'Duarte Jr apresenta relatório parcial da CPMI do INSS com indiciamento de executivos.', 'Vamos indiciar quem se locupletou dos aposentados. Não há espaço para omissão.', 'Apresentação de relatório parcial da CPMI.', 'verified', true, '2025-09-10', 'https://www.camara.leg.br/noticias/1144500-duarte-jr-relatorio-parcial-cpmi-inss', 'news_article', 1, 'Câmara dos Deputados', 'CPMI do INSS', 'duarte-relatorio-parcial-cpmi-b91-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta prolonga prazo da CPMI do INSS sob pressão de relator Duarte.', 'Vamos estender o prazo para uma investigação séria. Ninguém sai prejudicado.', 'Declaração após reunião com relator da CPMI.', 'verified', false, '2025-09-18', 'https://g1.globo.com/politica/noticia/2025/09/18/motta-prorroga-cpmi-inss-duarte.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'CPMI do INSS', 'motta-prorroga-cpmi-b91-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre ignora pedidos de impeachment de Moraes e reafirma autonomia.', 'O Senado vai decidir a pauta. Não me pressionem com impeachments.', 'Entrevista após recebimento de novos pedidos.', 'verified', false, '2025-02-25', 'https://www12.senado.leg.br/noticias/materias/2025/02/25/alcolumbre-impeachment-moraes', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'alcolumbre-impeachment-moraes-b91-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem convoca ato na Paulista por impeachment de Moraes.', 'Vamos à Paulista. O povo vai exigir impeachment.', 'Convocação para ato em defesa do impeachment de ministros do STF.', 'verified', true, '2024-02-20', 'https://www1.folha.uol.com.br/poder/2024/02/van-hattem-paulista-impeachment-moraes.shtml', 'news_article', 4, 'São Paulo', 'Ato na Av. Paulista', 'vanhattem-paulista-moraes-b91-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton denuncia "ascensão fascista" no Parlamento em discurso no plenário.', 'Estamos vivendo uma ascensão fascista que precisa ser combatida.', 'Pronunciamento em sessão de homenagem à democracia.', 'verified', true, '2024-01-08', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/erika-hilton-ascensao-fascista/', 'news_article', 2, 'Câmara dos Deputados', 'Ato democracia', 'erika-ascensao-fascista-b91-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri pede CPI do Ministério da Justiça após operações da PF.', 'Vamos investigar o uso político da PF pelo ministério.', 'Protocolo de requerimento para CPI sobre a PF.', 'verified', false, '2025-03-18', 'https://www.poder360.com.br/congresso/kim-cpi-ministerio-justica-pf/', 'news_article', 4, 'Câmara dos Deputados', 'Protocolo de CPI', 'kim-cpi-justica-pf-b91-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dino, 'Dino rebate Marcel van Hattem: "Ministro não se intimida com ato de rua".', 'Ministro não se intimida com ato de rua. Vamos cumprir nosso dever.', 'Declaração após convocação de ato contra ministros do STF.', 'verified', false, '2024-02-22', 'https://oglobo.globo.com/politica/dino-van-hattem-ato-rua/', 'news_article', 2, 'Brasília', 'Entrevista a jornalistas', 'dino-rebate-vanhattem-b91-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco articula "acordão" para livrar Bolsonaro de inelegibilidade.', 'Precisamos encontrar uma saída política para o ex-presidente.', 'Declaração após reunião com lideranças da oposição em 2024.', 'verified', false, '2024-05-15', 'https://www.cnnbrasil.com.br/politica/pacheco-acordao-bolsonaro-inelegibilidade/', 'news_article', 4, 'Senado Federal', 'Reunião política', 'pacheco-acordao-bolsonaro-b91-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros critica Pacheco por "passar pano" a Bolsonaro em inelegibilidade.', 'Passar pano a Bolsonaro é trair a democracia. Pacheco errou.', 'Entrevista após declaração do presidente do Senado.', 'verified', false, '2024-05-18', 'https://www1.folha.uol.com.br/poder/2024/05/renan-pacheco-passar-pano-bolsonaro.shtml', 'news_article', 3, 'Senado Federal', 'Entrevista coletiva', 'renan-pacheco-bolsonaro-b91-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta decide não pautar impeachment de Moraes em primeiro semestre.', 'Não vou pautar impeachment no semestre. É assunto para o futuro.', 'Declaração após reunião com líderes.', 'verified', false, '2025-03-04', 'https://www.metropoles.com/brasil/politica-br/motta-impeachment-moraes-nao-pauta', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'motta-impeachment-moraes-nao-pauta-b91-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lindbergh, 'Lindbergh articula líderes governistas contra PL da Anistia em março de 2025.', 'Vamos usar tudo que for possível para barrar a anistia dos golpistas.', 'Entrevista em reunião dos líderes do governo.', 'verified', false, '2025-03-10', 'https://www.poder360.com.br/congresso/lindbergh-pl-anistia-governistas/', 'news_article', 2, 'Câmara dos Deputados', 'Reunião de líderes', 'lindbergh-pl-anistia-liderancas-b91-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aguin, 'Aguinaldo Ribeiro defende regulamentação rápida do IBS sem "criar novos impostos".', 'O IBS precisa ser simples. Não podemos criar impostos escondidos.', 'Declaração durante a regulamentação da reforma.', 'verified', false, '2024-08-30', 'https://www.jota.info/tributos/aguinaldo-ibs-regulamentacao-30082024', 'news_article', 1, 'Câmara dos Deputados', 'Regulamentação IBS', 'aguinaldo-ibs-regulamentacao-b91-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwagner, 'Jaques Wagner negocia arcabouço com senadores do Centrão em jantar na Granja.', 'Vamos dar o que for preciso para aprovar o arcabouço. Estamos dispostos ao diálogo.', 'Declaração após jantar com o presidente Lula.', 'verified', false, '2023-08-10', 'https://g1.globo.com/politica/noticia/2023/08/10/jaques-wagner-arcabouco-granja.ghtml', 'news_article', 2, 'Brasília', 'Jantar Granja do Torto', 'jaques-arcabouco-granja-b91-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar vota contra PEC que restringia decisões monocráticas do STF.', 'A PEC é um gesto contra o STF. Não voto contra instituição.', 'Declaração de voto em segundo turno da PEC no Senado.', 'verified', false, '2023-11-21', 'https://www12.senado.leg.br/noticias/materias/2023/11/21/otto-pec-monocraticas-stf', 'news_article', 1, 'Senado Federal', 'Votação PEC STF', 'otto-pec-monocraticas-b91-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amin, 'Esperidião Amin vota a favor da PEC contra monocráticas do STF.', 'É preciso coibir excessos do STF. Monocrática virou regra.', 'Declaração de voto no plenário do Senado.', 'verified', false, '2023-11-21', 'https://www.poder360.com.br/congresso/amin-pec-monocraticas-stf/', 'news_article', 2, 'Senado Federal', 'Votação PEC STF', 'amin-pec-monocraticas-b91-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke denuncia "captura" do STF por interesses políticos.', 'O STF virou capturado. Precisamos resgatá-lo como Poder técnico.', 'Declaração em plenário sobre atuação de ministros.', 'verified', false, '2024-07-22', 'https://oglobo.globo.com/politica/soraya-thronicke-stf-capturado/', 'news_article', 3, 'Senado Federal', 'Discurso na tribuna', 'soraya-stf-capturado-b91-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pontes, 'Marcos Pontes acusa CPMI do INSS de "proteger governo Lula".', 'A CPMI está protegendo o governo. Não vai chegar a ninguém dos atuais.', 'Declaração após rejeição de convocação.', 'verified', false, '2025-07-04', 'https://www.cnnbrasil.com.br/politica/marcos-pontes-cpmi-inss-protege-lula/', 'news_article', 3, 'Senado Federal', 'CPMI do INSS', 'pontes-cpmi-protege-lula-b91-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wfagundes, 'Wellington Fagundes articula apoio do PSD a Alcolumbre na disputa.', 'O PSD vai apoiar Alcolumbre. Ele é o nome da experiência.', 'Declaração após reunião da bancada do PSD.', 'verified', false, '2025-01-22', 'https://www1.folha.uol.com.br/poder/2025/01/wellington-psd-alcolumbre-apoio.shtml', 'news_article', 1, 'Senado Federal', 'Reunião bancada PSD', 'wellington-psd-alcolumbre-b91-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_acoronel, 'Ângelo Coronel indicado relator da LDO e rebate críticas à execução de emendas.', 'A LDO é do Congresso, não do governo. Executamos o que aprovamos.', 'Declaração após designação como relator da LDO 2026.', 'verified', false, '2025-05-28', 'https://www12.senado.leg.br/noticias/materias/2025/05/28/angelo-coronel-ldo-2026', 'news_article', 2, 'Congresso Nacional', 'LDO 2026', 'angelo-coronel-ldo-b91-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avieira, 'Alessandro Vieira protocola PL para limitar emendas Pix.', 'Precisamos de rastreabilidade para acabar com emendas opacas.', 'Protocolo formal do projeto no Senado.', 'verified', false, '2024-09-05', 'https://www.jota.info/legislativo/alessandro-vieira-pl-emendas-pix-05092024', 'news_article', 1, 'Senado Federal', 'Apresentação PL Emendas Pix', 'alessandro-pl-emendas-pix-b91-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cid Gomes critica Motta pela relatoria da reforma administrativa a aliado.', 'O relator foi escolhido para atender ao Centrão. Ruim para o serviço público.', 'Declaração após designação do relator na CCJ.', 'verified', false, '2025-04-23', 'https://www.poder360.com.br/congresso/cid-motta-reforma-administrativa-relator/', 'news_article', 2, 'Senado Federal', 'CCJ do Senado', 'cid-motta-reforma-administrativa-b91-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adriana, 'Adriana Ventura denuncia "nepotismo cruzado" em indicações a agências.', 'Deputados indicam parentes de colegas para cargos. É nepotismo cruzado.', 'Denúncia apresentada ao Conselho de Ética da Câmara.', 'verified', false, '2024-10-14', 'https://www.metropoles.com/brasil/politica-br/adriana-ventura-nepotismo-cruzado-agencias', 'news_article', 3, 'Câmara dos Deputados', 'Conselho de Ética', 'adriana-nepotismo-cruzado-b91-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali condena corte em emendas de saúde para aliados do governo.', 'Estão cortando emenda de saúde para punir quem vota diferente.', 'Declaração após corte seletivo do Ministério da Saúde.', 'verified', false, '2024-06-14', 'https://g1.globo.com/politica/noticia/2024/06/14/jandira-feghali-emendas-saude-corte.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'jandira-corte-saude-b91-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jguima, 'José Guimarães nega pressão sobre Motta para vetar anistia.', 'Não pressionamos Motta. Mas avisamos: anistia é linha vermelha.', 'Declaração em entrevista após reunião.', 'verified', false, '2025-09-02', 'https://oglobo.globo.com/politica/jose-guimaraes-motta-anistia-pressao/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista a jornalistas', 'jguima-motta-anistia-b91-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zeca, 'Zeca Dirceu critica oposição por usar CPMI para "campanha antecipada".', 'CPMI não é palanque eleitoral. Quem faz isso trai mandato.', 'Pronunciamento após sessão da CPMI.', 'verified', false, '2025-08-05', 'https://www.cnnbrasil.com.br/politica/zeca-dirceu-cpmi-palanque/', 'news_article', 2, 'Congresso Nacional', 'CPMI do INSS', 'zeca-cpmi-palanque-b91-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carreras, 'Felipe Carreras defende relatoria de PL do Turismo a integrante do PSB.', 'Turismo é nossa área. Precisamos relatar e entregar o PL.', 'Declaração ao presidente Motta sobre relatoria.', 'verified', false, '2025-05-14', 'https://www.metropoles.com/brasil/politica-br/carreras-pl-turismo-psb-relatoria', 'news_article', 1, 'Câmara dos Deputados', 'Negociação relatoria', 'carreras-pl-turismo-b91-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_afonso, 'Afonso Florence denuncia Motta por proteger bancada ruralista em PL ambiental.', 'Ruralistas ditam a pauta, e Motta só assina embaixo. Desastre para o clima.', 'Declaração após aprovação de flexibilização ambiental.', 'verified', false, '2025-07-17', 'https://www.poder360.com.br/congresso/afonso-florence-motta-ruralistas-ambiental/', 'news_article', 2, 'Câmara dos Deputados', 'Debate PL ambiental', 'afonso-motta-ruralistas-b91-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo critica bloqueio da CPI do Crime Organizado por alianças políticas.', 'Alianças paralisaram a CPI do crime. Quem ganha é o PCC.', 'Declaração após engavetamento da CPI.', 'verified', false, '2025-10-08', 'https://oglobo.globo.com/politica/freixo-cpi-crime-organizado-bloqueio/', 'news_article', 3, 'Câmara dos Deputados', 'Debate CPI do Crime', 'freixo-cpi-crime-organizado-b91-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_duarte, 'Duarte Jr denuncia tentativa de Centrão de esvaziar CPMI do INSS.', 'Querem esvaziar a CPMI. Vamos resistir e entregar o relatório.', 'Entrevista após obstrução durante sessão.', 'verified', false, '2025-10-15', 'https://www1.folha.uol.com.br/poder/2025/10/duarte-cpmi-inss-esvaziar.shtml', 'news_article', 2, 'Câmara dos Deputados', 'CPMI do INSS', 'duarte-cpmi-esvaziar-b91-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta vetoa pedido de visita da CPMI do INSS a executivos da Previ.', 'Não cabe visita da CPMI. Respeitamos prerrogativas das empresas.', 'Decisão administrativa de Motta sobre cronograma da CPMI.', 'verified', false, '2025-10-16', 'https://www.poder360.com.br/congresso/motta-cpmi-inss-visita-previ/', 'news_article', 3, 'Câmara dos Deputados', 'CPMI do INSS', 'motta-cpmi-previ-b91-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira reaparece e articula derrubada de Motta em eleição prevista para 2027.', 'Seja claro: a próxima eleição da Mesa será disputada até o fim.', 'Declaração em evento em Alagoas.', 'verified', false, '2026-02-20', 'https://g1.globo.com/politica/noticia/2026/02/20/lira-articula-mesa-camara-motta.ghtml', 'news_article', 2, 'Alagoas', 'Evento partidário', 'lira-articula-motta-b91-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre afirma que Senado não aceitará "submissão a Moraes" em sabatina.', 'A sabatina é do Senado. Não vamos aceitar tutela de quem quer que seja.', 'Declaração antes da sabatina de ministro do STF.', 'verified', false, '2025-12-02', 'https://www12.senado.leg.br/noticias/materias/2025/12/02/alcolumbre-senado-submissao-moraes', 'news_article', 3, 'Senado Federal', 'Antes da sabatina STF', 'alcolumbre-submissao-moraes-b91-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues defende rejeição de anistia em eventual votação no Senado.', 'A anistia não passa no Senado. Vamos rejeitar com maioria folgada.', 'Declaração em entrevista após chegada do PL ao Senado.', 'verified', false, '2025-10-03', 'https://www.cnnbrasil.com.br/politica/randolfe-anistia-senado-rejeicao/', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'randolfe-anistia-rejeicao-b91-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama denuncia esquema de loteamento em agências reguladoras.', 'Loteamento para apadrinhados virou regra. Precisamos endurecer critérios.', 'Declaração em audiência sobre novas indicações.', 'verified', false, '2025-07-24', 'https://www.metropoles.com/brasil/politica-br/eliziane-gama-loteamento-agencias', 'news_article', 3, 'Senado Federal', 'Audiência pública', 'eliziane-loteamento-agencias-b91-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hcosta, 'Humberto Costa critica lentidão do Senado em regulamentar emendas.', 'Não é possível que emendas fiquem em limbo por tanto tempo. Precisamos agir.', 'Discurso no plenário durante sessão sobre LDO.', 'verified', false, '2024-10-22', 'https://www12.senado.leg.br/noticias/materias/2024/10/22/humberto-costa-emendas-limbo', 'news_article', 1, 'Senado Federal', 'Sessão LDO', 'humberto-costa-emendas-limbo-b91-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mecias, 'Mecias de Jesus critica atuação de Moraes em inquérito das fake news.', 'Moraes age como juiz, promotor e parte. Isso não é sistema, é autocracia.', 'Discurso em plenário após nova decisão monocrática.', 'verified', false, '2024-02-14', 'https://www.poder360.com.br/politica/mecias-moraes-inquerito-fake-news/', 'news_article', 4, 'Senado Federal', 'Sessão plenária', 'mecias-moraes-fake-news-b91-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_izalci, 'Izalci Lucas defende auditoria do TCU em emendas de relator.', 'O TCU tem que auditar a RP9 já. Se não investigar, será conivente.', 'Declaração em entrevista após revelação de esquema.', 'verified', false, '2024-01-25', 'https://oglobo.globo.com/politica/izalci-tcu-auditoria-emendas-relator/', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'izalci-tcu-emendas-relator-b91-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_contarato, 'Contarato pede cassação de deputado que ameaçou ministra do STF.', 'Ameaçar ministra é crime e atenta contra o Estado Democrático. Tem que ser cassado.', 'Declaração após episódio nas redes sociais.', 'verified', false, '2024-09-04', 'https://www1.folha.uol.com.br/poder/2024/09/contarato-cassacao-deputado-ministra-stf.shtml', 'news_article', 3, 'Senado Federal', 'Entrevista coletiva', 'contarato-cassacao-deputado-b91-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral defende novo pacote anticorrupção após escândalos.', 'O Congresso não pode continuar alheio à corrupção estrutural. Precisa agir.', 'Declaração ao apresentar proposta no plenário.', 'verified', false, '2024-10-01', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/tabata-pacote-anticorrupcao/', 'news_article', 1, 'Câmara dos Deputados', 'Apresentação de projeto', 'tabata-pacote-anticorrupcao-b91-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar denuncia bloqueio para votar reforma política ampla.', 'Travam a reforma política. Só aprovam o que interessa às oligarquias.', 'Pronunciamento em plenário.', 'verified', false, '2024-04-04', 'https://g1.globo.com/politica/noticia/2024/04/04/chico-alencar-reforma-politica-bloqueio.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'chico-reforma-politica-b91-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta envia recado a Alcolumbre por priorizar pauta fiscal em detrimento de CPMIs.', 'Pautas nacionais exigem sintonia fina entre as duas Casas. Estamos alinhados.', 'Entrevista após reunião no Senado.', 'verified', false, '2025-06-30', 'https://www.metropoles.com/brasil/politica-br/motta-alcolumbre-sintonia-pautas', 'news_article', 1, 'Câmara dos Deputados', 'Reunião com o Senado', 'motta-alcolumbre-sintonia-b91-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco critica retrocessos legislativos após sair do comando do Senado.', 'Havíamos avançado. Agora vejo retrocessos em temas importantes.', 'Entrevista pós-presidência em seminário.', 'verified', false, '2025-04-22', 'https://www.cnnbrasil.com.br/politica/pacheco-retrocessos-legislativos-senado/', 'news_article', 2, 'São Paulo', 'Seminário público', 'pacheco-retrocessos-legislativos-b91-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira se licencia para cuidar de saúde após ataques bolsonaristas e tenta voltar a protagonismo.', 'Vou me afastar para cuidar da saúde e voltarei mais forte.', 'Anúncio de licença temporária.', 'verified', false, '2025-10-28', 'https://www1.folha.uol.com.br/poder/2025/10/lira-licenca-saude-bolsonaristas.shtml', 'news_article', 1, 'Câmara dos Deputados', 'Licença médica', 'lira-licenca-saude-b91-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros defende CPI do Banco Master com foco em reguladores.', 'A CPI tem que investigar os reguladores. Sem isso, é teatro.', 'Declaração em entrevista após protocolo da CPI.', 'verified', false, '2026-01-14', 'https://www.poder360.com.br/congresso/renan-cpi-banco-master-reguladores/', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'renan-cpi-banco-master-b91-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz é escolhido relator da CPI do Banco Master no Senado.', 'Vamos a fundo. Sem medo de ninguém e sem blindagem.', 'Declaração ao ser escolhido relator da CPI.', 'verified', true, '2026-01-29', 'https://www12.senado.leg.br/noticias/materias/2026/01/29/aziz-relator-cpi-banco-master', 'news_article', 1, 'Senado Federal', 'CPI do Banco Master', 'aziz-relator-banco-master-b91-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta articula CPI do Banco Master na Câmara com relator do PSD.', 'A Câmara terá CPI séria. Estou entregando a relatoria ao PSD.', 'Declaração na instalação da CPI do Banco Master.', 'verified', false, '2026-02-04', 'https://g1.globo.com/politica/noticia/2026/02/04/motta-cpi-banco-master-psd.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Instalação CPI', 'motta-cpi-banco-master-psd-b91-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo comemora instalação da CPI do Banco Master.', 'Finalmente a sociedade saberá o que aconteceu. CPI instalada é vitória.', 'Comemoração após instalação da CPI.', 'verified', false, '2026-02-05', 'https://oglobo.globo.com/politica/freixo-cpi-banco-master-instalacao/', 'news_article', 1, 'Câmara dos Deputados', 'CPI Banco Master', 'freixo-cpi-banco-master-instalacao-b91-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_efraim, 'Efraim Filho articula relatoria da PEC da Segurança com recuos.', 'Vamos recuar em pontos que dividem. O texto precisa ser aprovado.', 'Entrevista após apresentação de novo parecer.', 'verified', false, '2025-11-04', 'https://www.jota.info/legislativo/efraim-pec-seguranca-recuos-04112025', 'news_article', 1, 'Senado Federal', 'Comissão Especial PEC Segurança', 'efraim-pec-seguranca-recuos-b91-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre barra convocação de Haddad por CPMI do INSS no Senado.', 'Não vou deixar a CPMI virar palanque contra o ministro da Fazenda.', 'Declaração após pressão da oposição pela convocação.', 'verified', false, '2025-08-28', 'https://www1.folha.uol.com.br/poder/2025/08/alcolumbre-haddad-cpmi-inss.shtml', 'news_article', 3, 'Senado Federal', 'CPMI do INSS', 'alcolumbre-barra-haddad-b91-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho articula "calendário eleitoral" na CPMI do INSS para 2026.', 'Vamos puxar depoimentos até a véspera da eleição. É o nosso direito.', 'Declaração em reunião da oposição no Senado.', 'verified', false, '2026-03-11', 'https://www.cnnbrasil.com.br/politica/rogerio-marinho-cpmi-calendario-eleitoral/', 'news_article', 3, 'Senado Federal', 'Reunião da oposição', 'rogerio-cpmi-calendario-b91-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cid Gomes rompe com base governista após derrota em votação.', 'Não sou cabide de ninguém. Voto pelo Ceará, não por indicações.', 'Declaração após romper com o PT no Ceará.', 'verified', false, '2024-08-26', 'https://www.poder360.com.br/congresso/cid-gomes-rompe-base-governo/', 'news_article', 1, 'Senado Federal', 'Entrevista coletiva', 'cid-rompe-base-governo-b91-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wfagundes, 'Wellington Fagundes é escolhido relator da MP da BR-163 apesar de conflito de interesses.', 'Minha ligação com o setor é técnica, não há conflito. Vamos entregar a MP.', 'Declaração após críticas por ser relator de MP de sua região.', 'verified', false, '2024-11-28', 'https://oglobo.globo.com/economia/wellington-fagundes-br163-conflito-interesses/', 'news_article', 3, 'Senado Federal', 'Relatoria MP BR-163', 'wellington-br163-conflito-b91-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_acoronel, 'Ângelo Coronel relata LDO com aumento de emendas apesar do teto.', 'Não vamos reduzir emendas. É decisão do Congresso.', 'Declaração após apresentação do relatório da LDO 2026.', 'verified', false, '2025-08-12', 'https://www.metropoles.com/brasil/politica-br/angelo-coronel-ldo-2026-emendas', 'news_article', 3, 'Congresso Nacional', 'LDO 2026', 'angelo-ldo-emendas-teto-b91-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton protesta contra mudança de regimento que limita destaques.', 'Querem tirar nosso único instrumento de defesa: os destaques.', 'Pronunciamento em protesto contra reforma do regimento.', 'verified', false, '2025-07-15', 'https://g1.globo.com/politica/noticia/2025/07/15/erika-hilton-regimento-destaques.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Debate regimento', 'erika-regimento-destaques-b91-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim denuncia ameaças recebidas após defender Moraes em plenário.', 'Fui ameaçada por bolsonaristas por defender a democracia. Não vou me calar.', 'Declaração após receber ameaças nas redes sociais.', 'verified', false, '2024-03-27', 'https://www1.folha.uol.com.br/poder/2024/03/samia-ameacas-moraes-bolsonaristas.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'samia-ameacas-moraes-b91-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone articula frente contra pacote antiterrorismo amplo.', 'Esse pacote pode criminalizar protestos sociais. Precisamos barrar.', 'Declaração em lançamento de frente parlamentar.', 'verified', false, '2025-11-20', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/taliria-pacote-antiterrorismo-frente/', 'news_article', 2, 'Câmara dos Deputados', 'Frente parlamentar', 'taliria-frente-antiterrorismo-b91-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta confirma pauta fiscal como prioridade em abril de 2026 em meio à CPI Banco Master.', 'Vamos priorizar a pauta fiscal. CPIs andam em paralelo.', 'Declaração em coletiva em abril de 2026.', 'verified', true, '2026-04-08', 'https://www1.folha.uol.com.br/poder/2026/04/motta-pauta-fiscal-cpi-banco-master.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Coletiva de imprensa', 'motta-pauta-fiscal-cpi-master-b91-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

END $$;
