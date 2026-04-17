-- Batch 90: Congress leadership and legislative conflicts (Jan 2023 - Apr 2026) - Part 1
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira reeleito presidente da Câmara com votação recorde promete "equilíbrio" entre Poderes.', 'Vamos manter a Câmara como casa do povo e exigir respeito do Executivo e do Judiciário.', 'Discurso após reeleição para presidência da Câmara no início da legislatura.', 'verified', true, '2023-02-01', 'https://www.camara.leg.br/noticias/938789-lira-reeleito-presidente-camara/', 'news_article', 2, 'Câmara dos Deputados', 'Eleição da Mesa Diretora', 'lira-reeleicao-equilibrio-b90-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco reeleito no Senado defende pauta mínima para governo Lula.', 'Teremos equilíbrio e responsabilidade. O Senado não é carimbo nem trincheira.', 'Discurso após reeleição para o comando do Senado.', 'verified', true, '2023-02-01', 'https://www12.senado.leg.br/noticias/materias/2023/02/01/pacheco-reeleito-presidente-senado', 'news_article', 1, 'Senado Federal', 'Eleição da Mesa Diretora', 'pacheco-reeleicao-equilibrio-b90-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira ameaça travar pauta do governo após crítica de ministros a emendas do Orçamento Secreto.', 'Se continuarem criticando o Congresso, vamos parar tudo. Ninguém manda em deputado.', 'Reação a declarações de ministros sobre o fim do orçamento secreto.', 'verified', true, '2023-03-15', 'https://www1.folha.uol.com.br/poder/2023/03/lira-ameaca-travar-pauta-governo-lula.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Reunião de líderes', 'lira-ameaca-travar-pauta-b90-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros reassume protagonismo e defende CPMI do 8 de janeiro ampla.', 'Precisamos chegar aos financiadores. Sem isso, a democracia fica à mercê de novos golpistas.', 'Defesa da instalação da CPMI dos atos antidemocráticos de 8 de janeiro.', 'verified', true, '2023-04-26', 'https://www12.senado.leg.br/noticias/materias/2023/04/26/renan-cpmi-8-janeiro-financiadores', 'news_article', 2, 'Senado Federal', 'Sessão de instalação da CPMI', 'renan-cpmi-financiadores-b90-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama relatora da CPMI promete trabalho técnico e sem blindagens.', 'Ninguém será poupado. Vamos seguir onde os fatos mandarem.', 'Primeira declaração após ser escolhida relatora da CPMI do 8 de janeiro.', 'verified', true, '2023-04-27', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/eliziane-gama-relatora-cpmi/', 'news_article', 1, 'Senado Federal', 'CPMI dos atos golpistas', 'eliziane-relatora-cpmi-b90-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho ataca CPMI do 8 de janeiro como "farsa da esquerda".', 'Essa CPMI é uma farsa para perseguir quem votou em Bolsonaro.', 'Pronunciamento da tribuna após aprovação do plano de trabalho.', 'verified', true, '2023-05-10', 'https://www.poder360.com.br/congresso/rogerio-marinho-cpmi-farsa/', 'news_article', 3, 'Senado Federal', 'Sessão CPMI', 'rogerio-cpmi-farsa-b90-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke critica condução da CPMI por considerar inquirição parcial.', 'A CPMI virou palanque e não investigação. Estão protegendo os aliados do governo.', 'Declaração após sessão tumultuada com depoimento de general.', 'verified', false, '2023-06-08', 'https://g1.globo.com/politica/noticia/2023/06/08/soraya-cpmi-palanque.ghtml', 'news_article', 2, 'Senado Federal', 'CPMI dos atos golpistas', 'soraya-cpmi-palanque-b90-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira defende aprovação do arcabouço fiscal sob ameaça de perder espaço para Pacheco.', 'Esta Câmara vai ditar o ritmo. O arcabouço sai aqui, não no Senado.', 'Declaração após tensões com senadores sobre o texto fiscal.', 'verified', false, '2023-05-23', 'https://www.jota.info/legislativo/lira-arcabouco-camara-senado-23052023', 'news_article', 2, 'Câmara dos Deputados', 'Discussão arcabouço fiscal', 'lira-arcabouco-protagonismo-b90-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aguin, 'Aguinaldo Ribeiro é escolhido relator da reforma tributária com base em acordo amplo.', 'Vamos entregar a reforma que o Brasil espera há décadas, sem quebrar a federação.', 'Discurso após designação como relator do Grupo de Trabalho da reforma tributária.', 'verified', true, '2023-03-22', 'https://www.camara.leg.br/noticias/947321-aguinaldo-relator-reforma-tributaria', 'news_article', 1, 'Câmara dos Deputados', 'GT da Reforma Tributária', 'aguinaldo-relator-reforma-b90-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elmar, 'Elmar Nascimento é peça-chave na manobra que aprova PEC das Sagas em uma semana.', 'Vamos aprovar essa PEC na marra. Quem não quiser participar, fica de fora.', 'Articulação relâmpago para votar PEC que ampliava indicações políticas.', 'verified', false, '2023-09-12', 'https://www.metropoles.com/brasil/politica-br/elmar-nascimento-pec-sagas-marra', 'news_article', 4, 'Câmara dos Deputados', 'Votação PEC das Sagas', 'elmar-pec-sagas-marra-b90-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral denuncia rolo compressor na votação da PEC das Sagas.', 'Estão aprovando uma PEC em dias sem debate. Isso é um atentado ao Parlamento.', 'Declaração em plenário durante votação apressada de PEC que ampliava prerrogativas.', 'verified', true, '2023-09-13', 'https://www1.folha.uol.com.br/poder/2023/09/tabata-pec-sagas-rolo-compressor.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Votação PEC das Sagas', 'tabata-pec-sagas-critica-b90-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Davi Alcolumbre mira presidência do Senado e costura apoios desde 2023.', 'Tenho compromisso com o Senado e com o Norte. Estarei pronto se for preciso.', 'Entrevista sinalizando interesse em voltar à presidência do Senado em 2025.', 'verified', false, '2023-10-18', 'https://oglobo.globo.com/politica/alcolumbre-senado-2025-articulacao/', 'news_article', 2, 'Brasília', 'Entrevista ao jornal', 'alcolumbre-articulacao-2025-b90-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira comanda derrubada de vetos presidenciais em sessão relâmpago no Congresso.', 'Derrubaremos os vetos quantas vezes o Executivo insistir em contrariar o Congresso.', 'Sessão do Congresso derruba vetos ao marco temporal e ao saneamento.', 'verified', true, '2023-12-14', 'https://www.cnnbrasil.com.br/politica/congresso-derruba-vetos-lira-marco-temporal/', 'news_article', 3, 'Congresso Nacional', 'Sessão para análise de vetos', 'lira-derrubada-vetos-b90-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwagner, 'Jaques Wagner admite que governo perdeu o controle sobre emendas parlamentares.', 'Chegamos a um ponto em que o Parlamento virou co-executor do Orçamento.', 'Avaliação do líder do governo no Senado após derrota em sessão.', 'verified', false, '2023-11-22', 'https://www.poder360.com.br/governo/jaques-wagner-emendas-parlamentares-coexecutor/', 'news_article', 2, 'Senado Federal', 'Entrevista a jornalistas', 'jaques-emendas-coexecutor-b90-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz critica tentativa de travar CPI do INSS em eleição interna.', 'Não vão calar o Senado. Os aposentados merecem investigação séria.', 'Reação a manobra da base governista contra a abertura de CPI.', 'verified', false, '2024-08-06', 'https://www12.senado.leg.br/noticias/materias/2024/08/06/omar-aziz-cpi-inss', 'news_article', 2, 'Senado Federal', 'Discussão CPI do INSS', 'aziz-cpi-inss-b90-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_efraim, 'Efraim Filho defende reforma administrativa "para desidratar o Estado".', 'O funcionalismo virou uma casta privilegiada. Vamos enxugar a máquina.', 'Discurso em defesa da pauta de reforma administrativa no Senado.', 'verified', false, '2024-04-18', 'https://www.jota.info/legislativo/efraim-reforma-administrativa-desidratar-18042024', 'news_article', 2, 'Senado Federal', 'Debate reforma administrativa', 'efraim-reforma-desidratar-b90-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues defende governo em meio a embate com Pacheco sobre MPs.', 'O presidente do Senado não pode usar o cargo para sabotar o governo.', 'Reação de líder governista a decisão de Pacheco sobre medidas provisórias.', 'verified', true, '2023-05-04', 'https://g1.globo.com/politica/noticia/2023/05/04/randolfe-pacheco-mps-sabotar.ghtml', 'news_article', 3, 'Senado Federal', 'Discussão sobre MPs', 'randolfe-pacheco-mps-b90-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco reage e ameaça devolver MPs que considerar inconstitucionais.', 'O Senado tem prerrogativa e vai usá-la. Não aceito pressão de ninguém.', 'Resposta pública após críticas de líderes do governo.', 'verified', false, '2023-05-05', 'https://www12.senado.leg.br/noticias/materias/2023/05/05/pacheco-devolver-mps-inconstitucionais', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'pacheco-devolver-mps-b90-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar denuncia esquema de desvio em emendas de relator e pede apuração.', 'Tem muita emenda servindo para enriquecimento ilícito. O MP precisa agir.', 'Declaração após operação da Polícia Federal envolvendo deputados.', 'verified', false, '2024-02-15', 'https://www.metropoles.com/brasil/politica-br/otto-alencar-emendas-desvio-15022024', 'news_article', 3, 'Senado Federal', 'Entrevista a jornalistas', 'otto-emendas-desvio-b90-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira ataca STF após decisão de Dino sobre transparência em emendas.', 'O Supremo quer governar pela canetada. Não vamos aceitar tutela judicial.', 'Reação à decisão monocrática do ministro Dino sobre emendas parlamentares.', 'verified', true, '2024-08-07', 'https://www1.folha.uol.com.br/poder/2024/08/lira-ataca-dino-stf-emendas.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Reunião de líderes', 'lira-ataca-dino-emendas-b90-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dino, 'Dino rebate ataques do Congresso e afirma que emendas precisam de rastreio.', 'Não existe dinheiro público sem transparência. Essa é uma regra básica da Constituição.', 'Fala em seminário após ataques de parlamentares à sua decisão no STF.', 'verified', true, '2024-08-12', 'https://www.poder360.com.br/justica/dino-emendas-rastreio-transparencia/', 'news_article', 1, 'Brasília', 'Seminário jurídico', 'dino-emendas-transparencia-b90-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem discursa contra Dino e pede impeachment de ministros do STF.', 'Chegou a hora de votar o impeachment de Moraes e de Dino. Basta!', 'Discurso inflamado em plenário após decisões do STF sobre emendas.', 'verified', true, '2024-08-14', 'https://www.metropoles.com/brasil/politica-br/van-hattem-impeachment-moraes-dino', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'vanhattem-impeachment-stf-b90-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri protocola pedido de impeachment de Alexandre de Moraes.', 'Moraes extrapolou. Virou inquisidor. O Parlamento precisa se impor.', 'Protocolo formal do pedido de impeachment no Senado.', 'verified', true, '2023-08-29', 'https://g1.globo.com/politica/noticia/2023/08/29/kim-kataguiri-impeachment-moraes.ghtml', 'news_article', 4, 'Senado Federal', 'Protocolo de impeachment', 'kim-impeachment-moraes-b90-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco engaveta pedidos de impeachment contra Moraes para evitar crise.', 'Não vou pautar o que divide as instituições. Cabe ao Senado zelar pelo equilíbrio.', 'Resposta a pressão da oposição para pautar impeachments.', 'verified', true, '2023-09-05', 'https://www12.senado.leg.br/noticias/materias/2023/09/05/pacheco-impeachment-moraes-gaveta', 'news_article', 2, 'Senado Federal', 'Coletiva à imprensa', 'pacheco-engaveta-impeachment-b90-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cid, 'Cid Gomes defende fim do orçamento secreto e acusa Lira de chantagem.', 'Lira usa o Orçamento como arma de chantagem política. Isso precisa acabar.', 'Pronunciamento após derrota do governo em votação.', 'verified', false, '2023-06-22', 'https://oglobo.globo.com/politica/cid-gomes-lira-orcamento-secreto-chantagem/', 'news_article', 3, 'Senado Federal', 'Discurso na tribuna', 'cid-lira-chantagem-b90-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton denuncia que manobras de Lira enfraquecem minorias no regimento.', 'As reformas de regimento servem apenas para silenciar as vozes dissidentes.', 'Discurso durante mudanças regimentais na Câmara.', 'verified', true, '2024-03-19', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/erika-hilton-regimento-lira/', 'news_article', 2, 'Câmara dos Deputados', 'Discussão mudanças regimentais', 'erika-regimento-silenciar-b90-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar denuncia compra de apoios para PEC das Sagas.', 'Estão distribuindo cargos em troca de votos. Isso é indigno do Parlamento.', 'Declaração em plenário durante tramitação acelerada da PEC.', 'verified', false, '2023-09-13', 'https://www.poder360.com.br/congresso/chico-alencar-pec-sagas-compra/', 'news_article', 3, 'Câmara dos Deputados', 'Discussão PEC das Sagas', 'chico-pec-sagas-compra-b90-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim obstrui votação e denuncia esvaziamento de pautas sociais.', 'Vamos obstruir até que parem de atropelar os direitos da classe trabalhadora.', 'Atuação no plenário em reação a pauta patronal imposta por Lira.', 'verified', false, '2023-10-11', 'https://www1.folha.uol.com.br/poder/2023/10/samia-obstrui-pauta-lira.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Obstrução no plenário', 'samia-obstrucao-pauta-b90-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone denuncia clima de intimidação após ameaças no Congresso.', 'Estamos sofrendo ameaças dentro do Parlamento. É urgente instalar regras de proteção.', 'Entrevista após episódios de hostilidade no plenário.', 'verified', false, '2023-11-07', 'https://g1.globo.com/politica/noticia/2023/11/07/taliria-petrone-ameacas-congresso.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'taliria-ameacas-congresso-b90-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orlando, 'Orlando Silva relata PL das Fake News em meio a forte pressão de plataformas.', 'Aprovar o PL é impedir que a desinformação destrua nossa democracia.', 'Declaração em debate público sobre o PL 2630.', 'verified', true, '2023-04-25', 'https://www.jota.info/legislativo/orlando-silva-pl-fake-news-25042023', 'news_article', 2, 'Câmara dos Deputados', 'Debate PL das Fake News', 'orlando-pl-fake-news-b90-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira retira PL das Fake News da pauta após articulação das big techs.', 'Não há clima. Não vou pautar sem acordo amplo.', 'Anúncio da retirada do PL 2630 depois de intensa pressão.', 'verified', true, '2023-05-02', 'https://www1.folha.uol.com.br/poder/2023/05/lira-retira-pl-fake-news-pauta.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Anúncio em plenário', 'lira-retira-pl-fakenews-b90-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali acusa Lira de ceder a pressão bolsonarista e adia reformas.', 'Lira cede à extrema-direita e abandona pautas sociais urgentes.', 'Entrevista após adiamento de votações importantes.', 'verified', false, '2023-06-06', 'https://www.cnnbrasil.com.br/politica/jandira-lira-bolsonarista-agenda/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'jandira-lira-bolsonarista-b90-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Hugo Motta articula apoio do Republicanos e MDB para suceder Lira.', 'Tenho experiência para construir pontes. O Centrão se unirá.', 'Declaração ao anunciar pré-candidatura à presidência da Câmara.', 'verified', true, '2024-09-16', 'https://www.metropoles.com/brasil/politica-br/hugo-motta-pre-candidatura-camara', 'news_article', 1, 'Câmara dos Deputados', 'Entrevista coletiva', 'motta-pre-candidatura-camara-b90-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elmar, 'Elmar Nascimento lança candidatura à Câmara e promete "linha dura" com governo.', 'Se for eleito, o governo Lula não manda mais na Câmara. Vamos inverter a chave.', 'Anúncio de candidatura em evento com apoio do Centrão.', 'verified', true, '2024-10-03', 'https://www.poder360.com.br/congresso/elmar-candidatura-camara-linha-dura/', 'news_article', 3, 'Brasília', 'Evento de pré-campanha', 'elmar-candidatura-camara-b90-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Hugo Motta é eleito presidente da Câmara com apoio do governo Lula.', 'Serei o presidente de todos. Vamos dialogar com o Executivo e o Judiciário.', 'Discurso após vitória na eleição da Mesa Diretora em fevereiro de 2025.', 'verified', true, '2025-02-01', 'https://www.camara.leg.br/noticias/1127500-hugo-motta-eleito-presidente-camara', 'news_article', 1, 'Câmara dos Deputados', 'Eleição da Mesa Diretora 2025', 'motta-eleito-presidente-b90-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Davi Alcolumbre é eleito presidente do Senado prometendo agenda fiscal.', 'O Senado será casa do diálogo e da responsabilidade com o Brasil.', 'Discurso após vitória na eleição para a presidência do Senado.', 'verified', true, '2025-02-01', 'https://www12.senado.leg.br/noticias/materias/2025/02/01/alcolumbre-eleito-presidente-senado', 'news_article', 1, 'Senado Federal', 'Eleição da Mesa Diretora 2025', 'alcolumbre-eleito-senado-b90-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros ironiza Alcolumbre e prevê "nova era de emendas escuras".', 'Com Alcolumbre é o retorno do toma lá dá cá no Senado.', 'Declaração em entrevista após a derrota na eleição interna.', 'verified', false, '2025-02-03', 'https://oglobo.globo.com/politica/renan-alcolumbre-emendas-escuras/', 'news_article', 3, 'Senado Federal', 'Entrevista a jornalistas', 'renan-alcolumbre-emendas-b90-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta instala CPMI do INSS após pressão de aposentados e pensionistas.', 'Vamos investigar até o fim os descontos ilegais sofridos pelos aposentados.', 'Anúncio da instalação da CPMI do INSS em 2025.', 'verified', true, '2025-04-02', 'https://www.camara.leg.br/noticias/1132450-motta-instala-cpmi-inss', 'news_article', 1, 'Câmara dos Deputados', 'Instalação da CPMI do INSS', 'motta-cpmi-inss-b90-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_duarte, 'Duarte Jr relata CPMI do INSS e promete apurar descontos ilegais.', 'Vamos a fundo. Quem lesou aposentado vai responder.', 'Declaração após ser escolhido relator da CPMI em 2025.', 'verified', true, '2025-04-10', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/duarte-jr-relator-cpmi-inss/', 'news_article', 1, 'Câmara dos Deputados', 'CPMI do INSS', 'duarte-relator-cpmi-inss-b90-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz acusa Motta de blindar aliados na CPMI do INSS.', 'O presidente da Câmara está protegendo quem deveria ser investigado.', 'Declaração após manobras para alterar lista de convocados.', 'verified', false, '2025-05-14', 'https://www.metropoles.com/brasil/politica-br/aziz-motta-cpmi-inss-blindagem', 'news_article', 3, 'Senado Federal', 'Entrevista coletiva', 'aziz-motta-cpmi-blindagem-b90-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta nega blindagem e diz que CPMI terá autonomia total.', 'Não tolero pressão. A CPMI escolhe quem quer ouvir, sem interferência.', 'Reação às acusações de Omar Aziz na imprensa.', 'verified', false, '2025-05-15', 'https://www.poder360.com.br/congresso/motta-cpmi-autonomia/', 'news_article', 1, 'Câmara dos Deputados', 'Coletiva de imprensa', 'motta-cpmi-autonomia-b90-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama aponta tentativa de Alcolumbre de afrouxar CPMI do INSS.', 'Estão tentando esvaziar a CPMI para blindar responsáveis pelos desvios.', 'Declaração após alteração de regras internas no Senado.', 'verified', true, '2025-06-03', 'https://g1.globo.com/politica/noticia/2025/06/03/eliziane-alcolumbre-cpmi-inss.ghtml', 'news_article', 3, 'Senado Federal', 'Entrevista a jornalistas', 'eliziane-alcolumbre-cpmi-b90-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lindbergh, 'Lindbergh Farias ataca oposição na CPMI do INSS como "defensora do golpe".', 'A oposição quer transformar a CPMI em palanque golpista. Não vamos permitir.', 'Pronunciamento durante sessão conturbada da CPMI.', 'verified', false, '2025-06-10', 'https://www1.folha.uol.com.br/poder/2025/06/lindbergh-oposicao-cpmi-golpista.shtml', 'news_article', 3, 'Congresso Nacional', 'Sessão CPMI do INSS', 'lindbergh-cpmi-golpista-b90-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho chama CPMI do INSS de "cortina de fumaça" do governo.', 'Isso é cortina de fumaça para desviar atenção dos fracassos do Lula.', 'Declaração após depoimento de ex-presidente do INSS.', 'verified', false, '2025-06-18', 'https://www.cnnbrasil.com.br/politica/rogerio-marinho-cpmi-inss-fumaca/', 'news_article', 3, 'Senado Federal', 'CPMI do INSS', 'rogerio-cpmi-inss-fumaca-b90-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hcosta, 'Humberto Costa defende convocação de ex-ministros na CPMI do INSS.', 'Precisamos ouvir quem esteve à frente da política previdenciária nos últimos anos.', 'Defesa de requerimento durante sessão da CPMI.', 'verified', false, '2025-07-02', 'https://www12.senado.leg.br/noticias/materias/2025/07/02/humberto-costa-cpmi-ex-ministros', 'news_article', 1, 'Senado Federal', 'CPMI do INSS', 'humberto-cpmi-ex-ministros-b90-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar se opõe a pauta de armas defendida pelo Centrão.', 'Afrouxar controle de armas é entregar o país aos milicianos. Não conte comigo.', 'Discurso na CCJ do Senado durante votação de matéria.', 'verified', true, '2024-06-19', 'https://www.jota.info/legislativo/otto-alencar-armas-milicianos-19062024', 'news_article', 2, 'Senado Federal', 'CCJ do Senado', 'otto-armas-milicianos-b90-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_izalci, 'Izalci Lucas questiona falta de transparência nas emendas Pix.', 'Precisamos saber para onde vai cada centavo das emendas Pix.', 'Declaração em debate sobre controle das emendas individuais.', 'verified', false, '2024-09-24', 'https://www.poder360.com.br/congresso/izalci-emendas-pix-transparencia/', 'news_article', 1, 'Senado Federal', 'Debate sobre emendas Pix', 'izalci-emendas-pix-b90-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_contarato, 'Contarato denuncia lobby bolsonarista para criar CPI contra o STF.', 'Querem criar uma CPI-tribunal para perseguir ministros do Supremo.', 'Reação a protocolos de requerimentos para CPI contra o STF.', 'verified', false, '2024-11-06', 'https://www12.senado.leg.br/noticias/materias/2024/11/06/contarato-cpi-stf-bolsonarismo', 'news_article', 3, 'Senado Federal', 'Coletiva de imprensa', 'contarato-cpi-stf-b90-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_avieira, 'Alessandro Vieira critica Pacheco por engavetar projetos anticorrupção.', 'Pacheco entregou o Senado para o Centrão e arquivou pautas republicanas.', 'Declaração ao anunciar saída do partido em protesto.', 'verified', false, '2024-02-08', 'https://oglobo.globo.com/politica/alessandro-vieira-pacheco-centrao-anticorrupcao/', 'news_article', 3, 'Senado Federal', 'Entrevista coletiva', 'alessandro-pacheco-centrao-b90-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke apresenta relatório que minimiza responsabilidades no 8 de janeiro.', 'Não havia premeditação institucional. A responsabilidade é individual.', 'Voto em separado no relatório final da CPMI do 8 de janeiro.', 'verified', true, '2023-10-17', 'https://www.metropoles.com/brasil/politica-br/soraya-cpmi-8-janeiro-voto-separado', 'news_article', 4, 'Senado Federal', 'CPMI do 8 de Janeiro', 'soraya-cpmi-minimiza-b90-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama entrega relatório da CPMI indiciando Bolsonaro e mais 60.', 'Apresentamos as provas. A Justiça fará sua parte.', 'Apresentação do relatório final da CPMI do 8 de janeiro.', 'verified', true, '2023-10-17', 'https://www12.senado.leg.br/noticias/materias/2023/10/17/eliziane-relatorio-cpmi-indiciamentos', 'news_article', 1, 'Senado Federal', 'Encerramento da CPMI', 'eliziane-relatorio-cpmi-b90-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta nega acordo para pautar PL da Anistia em troca de apoio.', 'Não existe acordo secreto. A pauta será decidida pelo colégio de líderes.', 'Resposta a vazamentos sobre negociação com a oposição.', 'verified', false, '2025-03-24', 'https://www1.folha.uol.com.br/poder/2025/03/motta-nega-acordo-anistia.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'motta-nega-acordo-anistia-b90-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jguima, 'José Guimarães diz que Motta "herdou armadilhas" deixadas por Lira.', 'Motta chegou a uma casa minada. Vai precisar de diálogo para governar.', 'Declaração sobre as dificuldades iniciais do novo presidente da Câmara.', 'verified', false, '2025-02-12', 'https://www.poder360.com.br/congresso/jose-guimaraes-motta-lira-armadilhas/', 'news_article', 1, 'Câmara dos Deputados', 'Entrevista coletiva', 'jguimaraes-motta-armadilhas-b90-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zeca, 'Zeca Dirceu critica relatoria da reforma administrativa a aliado do Centrão.', 'Entregar essa reforma ao Centrão é aprovar desmonte do serviço público.', 'Reação à escolha do relator pelo presidente da Câmara.', 'verified', false, '2025-04-09', 'https://g1.globo.com/politica/noticia/2025/04/09/zeca-dirceu-reforma-administrativa-centrao.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'zeca-dirceu-reforma-administrativa-b90-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carreras, 'Felipe Carreras defende protagonismo do PSB em ministérios após troca.', 'Quem entrega no Congresso, quer espaço na Esplanada. É simples.', 'Declaração após reforma ministerial no governo Lula.', 'verified', false, '2024-09-05', 'https://www.cnnbrasil.com.br/politica/carreras-psb-ministerios-lula/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista coletiva', 'carreras-psb-ministerios-b90-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_afonso, 'Afonso Florence denuncia vaivém do Congresso com pautas ambientais.', 'Toda hora mudam regra ambiental para agradar ruralistas. É irresponsável.', 'Pronunciamento durante votação de MP ambiental.', 'verified', false, '2024-05-22', 'https://www.metropoles.com/brasil/politica-br/afonso-florence-ambiental-ruralistas', 'news_article', 2, 'Câmara dos Deputados', 'Discussão MP ambiental', 'afonso-florence-ambiental-b90-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo classifica PEC da Segurança Pública como "federalização tardia".', 'Finalmente discutimos uma coordenação nacional séria contra o crime organizado.', 'Declaração em apoio ao envio da PEC da Segurança ao Congresso.', 'verified', false, '2024-11-01', 'https://oglobo.globo.com/politica/marcelo-freixo-pec-seguranca-federalizacao/', 'news_article', 1, 'Brasília', 'Lançamento da PEC da Segurança', 'freixo-pec-seguranca-b90-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rmarinho, 'Rogério Marinho diz que PEC da Segurança é "cortina" e ataca Dino.', 'Querem passar boiada atrás da PEC. É a velha manobra do governo Lula.', 'Declaração em plenário após apresentação da proposta.', 'verified', true, '2024-11-05', 'https://www.poder360.com.br/congresso/rogerio-marinho-pec-seguranca-dino/', 'news_article', 3, 'Senado Federal', 'Debate PEC da Segurança', 'rogerio-pec-seguranca-cortina-b90-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre escolhe Efraim Filho para relatar PEC da Segurança no Senado.', 'Vamos dar celeridade e responsabilidade. O Brasil precisa dessa PEC.', 'Anúncio da relatoria em comissão especial.', 'verified', false, '2025-03-12', 'https://www12.senado.leg.br/noticias/materias/2025/03/12/alcolumbre-efraim-pec-seguranca', 'news_article', 1, 'Senado Federal', 'Comissão Especial da PEC da Segurança', 'alcolumbre-efraim-pec-seguranca-b90-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_efraim, 'Efraim Filho promete relatório "sem ideologia" para PEC da Segurança.', 'Vamos priorizar eficiência, sem recados ideológicos.', 'Declaração ao aceitar a relatoria da PEC.', 'verified', false, '2025-03-13', 'https://www.jota.info/legislativo/efraim-pec-seguranca-sem-ideologia-13032025', 'news_article', 1, 'Senado Federal', 'Comissão Especial', 'efraim-pec-seguranca-relator-b90-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pontes, 'Marcos Pontes acusa governo de "aparelhar CNJ" via indicações.', 'Lula está aparelhando o CNJ para perseguir quem diverge.', 'Discurso na sabatina de indicado ao CNJ.', 'verified', false, '2024-07-17', 'https://www.cnnbrasil.com.br/politica/marcos-pontes-cnj-aparelhamento/', 'news_article', 3, 'Senado Federal', 'Sabatina CNJ', 'pontes-cnj-aparelhamento-b90-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wfagundes, 'Wellington Fagundes defende PL do marco temporal após veto presidencial.', 'O veto de Lula atropelou o Congresso. Vamos derrubar na próxima sessão.', 'Declaração em debate sobre o marco temporal indígena.', 'verified', false, '2023-12-13', 'https://www12.senado.leg.br/noticias/materias/2023/12/13/wellington-fagundes-marco-temporal', 'news_article', 3, 'Senado Federal', 'Discussão do marco temporal', 'wellington-marco-temporal-b90-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_acoronel, 'Ângelo Coronel defende "blindagem" da Faria Lima em PL do BC independente.', 'Não podemos permitir que politizem o Banco Central. A Faria Lima respira autonomia.', 'Discurso em defesa da autonomia do BC no Senado.', 'verified', false, '2023-07-12', 'https://oglobo.globo.com/economia/angelo-coronel-faria-lima-bc/', 'news_article', 2, 'Senado Federal', 'Debate autonomia do BC', 'angelo-faria-lima-bc-b90-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amin, 'Esperidião Amin defende cautela com PEC das Sagas no Senado.', 'Precisamos olhar com atenção. Essa PEC mexe com equilíbrio entre Poderes.', 'Pronunciamento em plenário após chegada da PEC da Câmara.', 'verified', false, '2023-10-05', 'https://www12.senado.leg.br/noticias/materias/2023/10/05/amin-pec-sagas-cautela', 'news_article', 1, 'Senado Federal', 'Discussão PEC das Sagas', 'amin-pec-sagas-cautela-b90-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mecias, 'Mecias de Jesus vota contra convocação de aliado na CPMI do 8 de janeiro.', 'Convocação é show, não investigação. Não participo desse palco.', 'Declaração após sessão da CPMI em Roraima.', 'verified', false, '2023-07-26', 'https://www.metropoles.com/brasil/politica-br/mecias-jesus-cpmi-palco', 'news_article', 3, 'Senado Federal', 'CPMI do 8 de Janeiro', 'mecias-cpmi-palco-b90-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adriana, 'Adriana Ventura denuncia volta do "toma lá, dá cá" no governo Lula.', 'O governo troca cargos por voto como nos piores momentos do passado.', 'Declaração após nomeações para estatais ligadas a partidos.', 'verified', false, '2024-03-08', 'https://www.poder360.com.br/congresso/adriana-ventura-toma-la-da-ca/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'adriana-toma-la-da-ca-b90-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral critica abandono da reforma do Ensino Médio pelo Centrão.', 'Abandonar a reforma é entregar a juventude à própria sorte.', 'Posicionamento após tentativa do Centrão de revogar a lei.', 'verified', false, '2023-08-16', 'https://www1.folha.uol.com.br/educacao/2023/08/tabata-amaral-reforma-ensino-medio.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Debate sobre Ensino Médio', 'tabata-ensino-medio-b90-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton acusa Lira de impor pauta anti-LGBT em fim de ano.', 'Lira pauta ataques à população LGBT como forma de agradar o bolsonarismo.', 'Pronunciamento em defesa do direito à autodeterminação.', 'verified', false, '2023-11-29', 'https://g1.globo.com/politica/noticia/2023/11/29/erika-hilton-lira-pauta-lgbt.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Debate projeto LGBT', 'erika-lira-anti-lgbt-b90-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco negocia com Haddad flexibilizações no arcabouço fiscal.', 'Precisamos ter regras que se conversem com a realidade do país.', 'Entrevista após reunião com o ministro da Fazenda.', 'verified', false, '2023-08-22', 'https://www.jota.info/legislativo/pacheco-haddad-arcabouco-22082023', 'news_article', 1, 'Senado Federal', 'Reunião com Fazenda', 'pacheco-haddad-arcabouco-b90-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira articula manobra para derrubar veto à desoneração da folha.', 'O Congresso decidiu. O veto será derrubado, gostem ou não.', 'Declaração antes da sessão que derrubou o veto presidencial.', 'verified', true, '2023-12-14', 'https://www1.folha.uol.com.br/mercado/2023/12/lira-desoneracao-veto-derrubada.shtml', 'news_article', 3, 'Congresso Nacional', 'Sessão para análise de vetos', 'lira-desoneracao-derrubada-b90-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros denuncia volta do "Centrão voraz" no governo Lula.', 'O Centrão está voraz. Se não controlar, compromete o terceiro mandato.', 'Entrevista ao deixar reunião de líderes.', 'verified', false, '2023-09-28', 'https://oglobo.globo.com/politica/renan-centrao-voraz-lula/', 'news_article', 2, 'Senado Federal', 'Entrevista coletiva', 'renan-centrao-voraz-b90-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aguin, 'Aguinaldo Ribeiro admite concessões ruralistas na reforma tributária.', 'Tivemos que ceder ao agro para garantir a aprovação. É a realidade política.', 'Declaração após aprovação da reforma em primeiro turno.', 'verified', false, '2023-07-07', 'https://www.camara.leg.br/noticias/977321-aguinaldo-reforma-agro-concessoes', 'news_article', 2, 'Câmara dos Deputados', 'Votação da Reforma Tributária', 'aguinaldo-reforma-agro-b90-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elmar, 'Elmar Nascimento pressiona governo para liberar emendas e destravar pauta.', 'Sem emendas liberadas, pauta parada. É simples assim.', 'Declaração após reunião de líderes.', 'verified', true, '2024-04-02', 'https://www.metropoles.com/brasil/politica-br/elmar-emendas-pauta-parada', 'news_article', 4, 'Câmara dos Deputados', 'Reunião de líderes', 'elmar-emendas-pauta-b90-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues deixa liderança do governo após desgaste com aliados.', 'Saio com a consciência tranquila. Entreguei o que era possível.', 'Declaração ao anunciar saída da liderança do governo no Senado.', 'verified', true, '2024-08-13', 'https://www12.senado.leg.br/noticias/materias/2024/08/13/randolfe-deixa-lideranca-governo', 'news_article', 1, 'Senado Federal', 'Troca na liderança do governo', 'randolfe-deixa-lideranca-b90-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwagner, 'Jaques Wagner assume liderança do governo e promete diálogo com Alcolumbre.', 'Vamos dialogar. O governo precisa de uma ponte firme com o Senado.', 'Discurso de posse como novo líder do governo no Senado.', 'verified', true, '2024-08-14', 'https://g1.globo.com/politica/noticia/2024/08/14/jaques-wagner-lideranca-governo-senado.ghtml', 'news_article', 1, 'Senado Federal', 'Posse de liderança', 'jaques-wagner-lideranca-b90-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_contarato, 'Contarato critica indicação de aliado de Alcolumbre à CCJ.', 'Essa CCJ virou extensão do gabinete do presidente do Senado.', 'Declaração após votação para presidência da CCJ.', 'verified', false, '2025-02-18', 'https://oglobo.globo.com/politica/contarato-ccj-alcolumbre/', 'news_article', 2, 'Senado Federal', 'Eleição da CCJ', 'contarato-ccj-alcolumbre-b90-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hcosta, 'Humberto Costa defende urgência para PL que regulamenta emendas.', 'Precisamos de regras claras, ou o Orçamento vira terra de ninguém.', 'Declaração em debate sobre novo PL de emendas.', 'verified', false, '2024-09-26', 'https://www.poder360.com.br/congresso/humberto-costa-pl-emendas-regras/', 'news_article', 1, 'Senado Federal', 'Debate PL das emendas', 'humberto-pl-emendas-b90-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira diz que "não vai mais tolerar invasões" do STF sobre o Legislativo.', 'O STF está invadindo competências. Se continuar, vamos reagir institucionalmente.', 'Declaração em reação a decisão monocrática sobre emendas.', 'verified', true, '2024-08-20', 'https://www.cnnbrasil.com.br/politica/lira-stf-invasoes-competencia/', 'news_article', 4, 'Câmara dos Deputados', 'Coletiva de imprensa', 'lira-stf-invasoes-b90-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali reage e diz que Lira "flerta com golpe" ao ameaçar STF.', 'Ameaçar o STF é flertar com ruptura. Chega.', 'Pronunciamento em plenário após fala de Lira contra o STF.', 'verified', true, '2024-08-21', 'https://www1.folha.uol.com.br/poder/2024/08/jandira-feghali-lira-golpe-stf.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'jandira-lira-flerta-golpe-b90-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem obstrui votação do PL das Fake News em 2023.', 'Vamos obstruir até o fim. Essa lei é da censura.', 'Atuação no plenário durante tentativa de votar o PL 2630.', 'verified', true, '2023-05-02', 'https://www.metropoles.com/brasil/politica-br/van-hattem-obstrucao-fake-news', 'news_article', 3, 'Câmara dos Deputados', 'Votação do PL 2630', 'vanhattem-obstrucao-fakenews-b90-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri é flagrado em áudio combinando ataques coordenados a ministros.', 'A gente tem que pautar impeachment de ministro toda semana.', 'Áudio vazado de reunião da oposição.', 'verified', false, '2024-09-11', 'https://www.poder360.com.br/congresso/kim-kataguiri-audio-impeachment/', 'news_article', 4, 'Câmara dos Deputados', 'Vazamento de áudio', 'kim-audio-impeachment-b90-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orlando, 'Orlando Silva defende retomada da tramitação do PL das Fake News em 2025.', 'A democracia não sobrevive sem regras para as plataformas. Vamos voltar ao tema.', 'Declaração após posse da nova legislatura.', 'verified', false, '2025-02-20', 'https://www.cnnbrasil.com.br/politica/orlando-silva-pl-fake-news-2025/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'orlando-pl-fakenews-2025-b90-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta acena com pauta liberal para o mercado e divide base governista.', 'Vamos pautar o que a economia precisa, sem medo de agradar os governistas.', 'Discurso em jantar com empresários em São Paulo.', 'verified', false, '2025-03-05', 'https://oglobo.globo.com/economia/motta-pauta-liberal-mercado/', 'news_article', 2, 'São Paulo', 'Jantar empresarial', 'motta-pauta-liberal-b90-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco deixa presidência do Senado e critica "novo ciclo de aparelhamento".', 'Espero que o Senado não volte a ser apêndice de nenhum grupo.', 'Discurso de despedida da presidência do Senado.', 'verified', true, '2025-01-31', 'https://www12.senado.leg.br/noticias/materias/2025/01/31/pacheco-despedida-aparelhamento', 'news_article', 2, 'Senado Federal', 'Despedida da presidência', 'pacheco-despedida-aparelhamento-b90-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Lira deixa a presidência da Câmara criticando governo e STF.', 'Entrego a Câmara em pé, de cabeça erguida, sem medo de pressões.', 'Discurso de despedida na Câmara dos Deputados.', 'verified', true, '2025-01-31', 'https://www.camara.leg.br/noticias/1125900-lira-despedida-presidencia-camara', 'news_article', 2, 'Câmara dos Deputados', 'Despedida da presidência', 'lira-despedida-camara-b90-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral condena "condomínio do Centrão" na nova Mesa Diretora.', 'A Mesa virou um condomínio do Centrão. Oposição e minorias foram alijadas.', 'Declaração após eleição da Mesa Diretora de 2025.', 'verified', false, '2025-02-02', 'https://www1.folha.uol.com.br/poder/2025/02/tabata-condominio-centrao-mesa.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Análise pós-eleição da Mesa', 'tabata-condominio-centrao-b90-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_samia, 'Sâmia Bomfim denuncia sabotagem a cotas no Parlamento.', 'Nenhum passo à frente é tolerado: estão sabotando cotas e políticas afirmativas.', 'Discurso durante votação que alterou regras de cotas.', 'verified', false, '2024-07-03', 'https://g1.globo.com/politica/noticia/2024/07/03/samia-cotas-parlamento.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Debate sobre cotas', 'samia-cotas-sabotagem-b90-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_taliria, 'Talíria Petrone alerta para escalada autoritária em projetos de lei.', 'Temos uma escalada autoritária vindo na forma de PLs. É preciso resistir.', 'Pronunciamento sobre pacote de leis da segurança pública.', 'verified', false, '2024-10-22', 'https://congressoemfoco.uol.com.br/area/congresso-nacional/taliria-petrone-escalada-autoritaria/', 'news_article', 3, 'Câmara dos Deputados', 'Debate pacote segurança', 'taliria-escalada-autoritaria-b90-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar critica sigilo em emendas liberadas por Lira.', 'O sigilo das emendas é uma máscara para a corrupção institucionalizada.', 'Pronunciamento em plenário após reportagem sobre emendas.', 'verified', false, '2024-08-27', 'https://www.metropoles.com/brasil/politica-br/chico-alencar-emendas-sigilo-lira', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'chico-sigilo-emendas-b90-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lindbergh, 'Lindbergh Farias articula base do PT para barrar Elmar Nascimento na Câmara.', 'Vamos construir uma candidatura do governo para barrar o Centrão mais radical.', 'Declaração antes da eleição da Mesa Diretora de 2025.', 'verified', false, '2024-12-10', 'https://www.poder360.com.br/congresso/lindbergh-elmar-candidatura-camara/', 'news_article', 2, 'Câmara dos Deputados', 'Articulação pré-eleição', 'lindbergh-elmar-camara-b90-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_duarte, 'Duarte Jr expõe descontos ilegais do INSS em audiência da CPMI.', 'Milhões de aposentados pagaram por serviços que não contrataram. Isso é roubo.', 'Fala durante oitiva da CPMI do INSS.', 'verified', true, '2025-05-06', 'https://www.camara.leg.br/noticias/1134400-duarte-jr-descontos-ilegais-cpmi', 'news_article', 1, 'Câmara dos Deputados', 'CPMI do INSS', 'duarte-descontos-inss-b90-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo critica Motta por demora em instalar CPI do Banco Master.', 'A demora em instalar a CPI do Banco Master cheira a acordo com bastidores.', 'Declaração após adiamento da instalação da comissão.', 'verified', false, '2025-11-19', 'https://oglobo.globo.com/politica/freixo-cpi-banco-master-motta/', 'news_article', 3, 'Câmara dos Deputados', 'CPI Banco Master', 'freixo-cpi-banco-master-b90-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz defende abertura de CPI para apurar Banco Master no Senado.', 'Não podemos deixar o escândalo do Banco Master impune. O Senado vai agir.', 'Declaração após denúncias envolvendo o Banco Master.', 'verified', true, '2025-11-22', 'https://www12.senado.leg.br/noticias/materias/2025/11/22/omar-aziz-cpi-banco-master', 'news_article', 2, 'Senado Federal', 'Debate CPI Banco Master', 'aziz-cpi-banco-master-b90-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta costura acordo para instalar CPI do Banco Master em janeiro de 2026.', 'A CPI será instalada. Todos os lados serão ouvidos, sem atropelo.', 'Anúncio após reunião de líderes em dezembro.', 'verified', false, '2025-12-17', 'https://www.camara.leg.br/noticias/1164500-motta-cpi-banco-master-janeiro-2026', 'news_article', 1, 'Câmara dos Deputados', 'Reunião de líderes', 'motta-cpi-banco-master-b90-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alcol, 'Alcolumbre prioriza votação da reforma da renda em detrimento da CPI.', 'Temos que entregar o ajuste fiscal antes da CPI. Essa é a ordem.', 'Declaração após pressão do mercado sobre pauta do Senado.', 'verified', false, '2025-09-16', 'https://www.jota.info/legislativo/alcolumbre-reforma-renda-cpi-16092025', 'news_article', 2, 'Senado Federal', 'Entrevista a jornalistas', 'alcolumbre-reforma-renda-b90-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros dispara contra Alcolumbre sobre indicação ao TCU.', 'Indicar apadrinhado ao TCU é escárnio com o controle público.', 'Pronunciamento após indicação de aliado de Alcolumbre.', 'verified', false, '2025-10-01', 'https://www.cnnbrasil.com.br/politica/renan-alcolumbre-tcu-apadrinhado/', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'renan-alcolumbre-tcu-b90-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_contarato, 'Contarato denuncia esvaziamento da CCJ do Senado em temas de direitos humanos.', 'A CCJ virou fortaleza para agendas regressivas e barrar direitos humanos.', 'Declaração ao deixar reunião da CCJ.', 'verified', false, '2025-06-25', 'https://www.poder360.com.br/congresso/contarato-ccj-direitos-humanos/', 'news_article', 2, 'Senado Federal', 'CCJ do Senado', 'contarato-ccj-direitos-humanos-b90-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_erika, 'Erika Hilton acusa Motta de blindar Nikolas após ataque no plenário.', 'Motta blinda os aliados e silencia quem é atacado. Assim não há democracia.', 'Declaração após ataque pessoal no plenário.', 'verified', true, '2025-09-03', 'https://www.metropoles.com/brasil/politica-br/erika-motta-nikolas-blindagem', 'news_article', 3, 'Câmara dos Deputados', 'Sessão plenária', 'erika-motta-nikolas-b90-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_motta, 'Motta defende modernização do regimento para "acelerar votações".', 'O regimento da Câmara é dos anos 80. Precisa mudar. Já.', 'Pronunciamento em defesa de reforma regimental.', 'verified', false, '2025-07-08', 'https://www1.folha.uol.com.br/poder/2025/07/motta-regimento-modernizar.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Discurso sobre reforma regimental', 'motta-regimento-modernizar-b90-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali reage a reforma do regimento e acusa tentativa de "calar oposição".', 'Mudar o regimento agora é calar a oposição. Não aceitamos.', 'Discurso contra mudanças regimentais propostas por Motta.', 'verified', true, '2025-07-10', 'https://g1.globo.com/politica/noticia/2025/07/10/jandira-feghali-regimento-motta.ghtml', 'news_article', 3, 'Câmara dos Deputados', 'Debate reforma regimental', 'jandira-regimento-oposicao-b90-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

END $$;
