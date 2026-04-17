DO $$
DECLARE
  v_jair       UUID;
  v_eduardo    UUID;
  v_flavio     UUID;
  v_carlos     UUID;
  v_damares    UUID;
  v_salles     UUID;
  v_mourao     UUID;
  v_guedes     UUID;
  v_tcristina  UUID;
  v_feliciano  UUID;
  v_magno      UUID;
  v_silas      UUID;
  v_zambelli   UUID;
  v_silveira   UUID;
  v_kicis      UUID;
  v_vanhattem  UUID;
  v_kim        UUID;
  v_tabata     UUID;
  v_chico      UUID;
  v_jandira    UUID;
  v_freixo     UUID;
  v_gleisi     UUID;
  v_lula       UUID;
  v_moraes     UUID;
  v_gilmar     UUID;
  v_barroso    UUID;
  v_fachin     UUID;
  v_otto       UUID;
  v_aziz       UUID;
  v_renan      UUID;
  v_randolfe   UUID;
  v_humberto   UUID;
  v_lira       UUID;
  v_pacheco    UUID;
  v_vieira     UUID;
  v_eliziane   UUID;
  v_soraya     UUID;

  c_ant UUID;
  c_cor UUID;
  c_des UUID;
  c_vio UUID;
  c_odi UUID;
  c_abu UUID;
  c_aut UUID;
  c_neg UUID;
  c_irr UUID;
  c_cfi UUID;
  c_int UUID;
  c_obs UUID;
  c_ame UUID;
BEGIN
  SELECT id INTO v_jair       FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_eduardo    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_flavio     FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_carlos     FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_salles     FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_tcristina  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_silveira   FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_kicis      FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_vanhattem  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim        FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_tabata     FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_chico      FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jandira    FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_freixo     FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_moraes     FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gilmar     FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_barroso    FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_fachin     FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_otto       FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_aziz       FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_randolfe   FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_humberto   FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_lira       FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pacheco    FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_vieira     FROM politicians WHERE slug = 'alessandro-vieira';
  SELECT id INTO v_eliziane   FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_soraya     FROM politicians WHERE slug = 'soraya-thronicke';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_cfi FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dispensa importação de doses adicionais da Pfizer em meio a pandemia.', 'A Pfizer veio cobrar os mais de R$ 60 por dose. Eu não aceitei.', 'Declaração em live semanal de novembro de 2021 admitindo recusa da Pfizer.', 'verified', false, '2021-11-04', 'https://g1.globo.com/politica/noticia/2021/11/04/bolsonaro-pfizer-r60.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-recusa-pfizer-b103-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende não vacinar crianças em ataque à Anvisa.', 'Meu filho eu não vou vacinar. A Anvisa está sendo pressionada.', 'Declaração em entrevista em novembro de 2021 após aprovação da Pfizer para crianças.', 'verified', true, '2021-11-10', 'https://www1.folha.uol.com.br/equilibrioesaude/2021/11/bolsonaro-vacina-criancas.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-vacina-criancas-b103-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara passaporte da vacina a ditadura em discurso na Avenida Paulista.', 'Passaporte da vacina é coisa de ditadura. Somos livres.', 'Declaração em ato em São Paulo em novembro de 2021 contra medidas sanitárias.', 'verified', false, '2021-11-15', 'https://g1.globo.com/sp/sao-paulo/noticia/2021/11/15/bolsonaro-passaporte-ditadura.ghtml', 'news_article', 3, 'Avenida Paulista, SP', 'Ato com apoiadores', 'bolsonaro-passaporte-ditadura-b103-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_damares, 'Damares Alves faz campanha contra passaporte sanitário e ataca medidas do STF.', 'Meu corpo, minhas regras. Passaporte da vacina fere liberdade.', 'Declaração em novembro de 2021 como ministra da Mulher, Família e Direitos Humanos.', 'verified', false, '2021-11-16', 'https://www.cnnbrasil.com.br/politica/damares-passaporte-vacinal/', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'damares-passaporte-b103-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Alexandre de Moraes rejeita recurso de Bolsonaro e mantém ações da CPI.', 'Não se pode eximir a autoridade da responsabilidade por atos públicos.', 'Decisão do STF em novembro de 2021 mantendo os encaminhamentos da CPI à PGR.', 'verified', false, '2021-11-18', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=477000', 'official_statement', 2, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-mantem-cpi-b103-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro filia-se ao PL e consolida aliança com Valdemar Costa Neto.', 'No PL, teremos a base para disputar as eleições de 2022 com muita força.', 'Cerimônia de filiação ao PL em 22 de novembro de 2021 após deixar o PSL em 2019 sem partido.', 'verified', true, '2021-11-22', 'https://www1.folha.uol.com.br/poder/2021/11/bolsonaro-pl-filiacao.shtml', 'news_article', 1, 'Brasília', 'Cerimônia de filiação partidária', 'bolsonaro-pl-filiacao-b103-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica filiação de Bolsonaro ao PL e chama presidente de "extrema-direita disfarçada".', 'O Bolsonaro está tentando comprar a legitimidade do PL. Isso é extrema-direita disfarçada.', 'Declaração em entrevista em novembro de 2021 após Bolsonaro se filiar ao PL.', 'verified', false, '2021-11-23', 'https://g1.globo.com/politica/noticia/2021/11/23/lula-bolsonaro-pl.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista à imprensa', 'lula-pl-bolsonaro-b103-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann critica o PL por abrigar "projeto autoritário" de Bolsonaro.', 'O PL se rendeu ao projeto autoritário de Bolsonaro. É um retrocesso para o Brasil.', 'Declaração em nota oficial em novembro de 2021 como presidente do PT.', 'verified', false, '2021-11-23', 'https://www.pt.org.br/gleisi-pl-autoritario-bolsonaro/', 'official_statement', 2, 'Brasília', 'Nota oficial do PT', 'gleisi-pl-autoritario-b103-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede que apoiadores comprem armas e diz que "povo armado nunca será escravizado".', 'Povo armado jamais será escravizado. Não vamos abrir mão das nossas liberdades.', 'Declaração em live em 25 de novembro de 2021 promovendo política armamentista.', 'verified', true, '2021-11-25', 'https://www1.folha.uol.com.br/poder/2021/11/bolsonaro-povo-armado-escravizado.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-povo-armado-b103-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina decretos ampliando acesso civil a armas.', 'Assinei decretos para ampliar posse e porte. O povo brasileiro merece se defender.', 'Cerimônia no Palácio do Planalto em 12 de novembro de 2021 sancionando decretos armamentistas.', 'verified', false, '2021-11-12', 'https://g1.globo.com/politica/noticia/2021/11/12/bolsonaro-decretos-armas.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia oficial', 'bolsonaro-decretos-armas-b103-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo denuncia decretos armamentistas como ameaça à democracia.', 'Armar CACs em pleno ano eleitoral é criar milícia paralela. É ameaça direta à democracia.', 'Declaração em novembro de 2021 sobre expansão do acesso a armas durante o governo Bolsonaro.', 'verified', false, '2021-11-13', 'https://www.poder360.com.br/congresso/freixo-cac-milicia-paralela/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista à imprensa', 'freixo-cac-milicia-b103-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali apresenta projeto revogando decretos armamentistas.', 'Brasil não precisa de mais armas nas mãos de civis. Precisa de paz e saúde.', 'Projeto de decreto legislativo apresentado em novembro de 2021 contra os decretos de Bolsonaro.', 'verified', false, '2021-11-17', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/jandira-revoga-decretos-armas.html', 'official_statement', 2, 'Câmara dos Deputados', 'Apresentação de projeto', 'jandira-pdl-armas-b103-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mourao, 'Mourão critica própria live de Bolsonaro sobre vacinas e Aids.', 'O presidente teve um momento infeliz. Essa informação não tem base científica.', 'Declaração em 22 de outubro de 2021 como vice-presidente criticando live do presidente.', 'verified', false, '2021-11-02', 'https://www.cnnbrasil.com.br/politica/mourao-critica-live-vacinas/', 'news_article', 2, 'Palácio do Jaburu', 'Entrevista à imprensa', 'mourao-critica-live-b103-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_salles, 'Ricardo Salles lança pré-candidatura ao Senado mesmo sob investigação da PF.', 'Sou perseguido mas vou ao povo buscar o apoio para renovar o Senado.', 'Anúncio em novembro de 2021 como pré-candidato do PL pelo estado de São Paulo.', 'verified', false, '2021-11-20', 'https://www.metropoles.com/brasil/politica-br/salles-senado-pl', 'news_article', 2, 'São Paulo', 'Coletiva de imprensa', 'salles-senado-pl-b103-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcristina, 'Tereza Cristina nega crise na agricultura em meio a aumento dos preços dos alimentos.', 'Não há crise de alimentos. Os preços são consequência do cenário internacional.', 'Declaração em entrevista em novembro de 2021 em meio à alta da inflação.', 'verified', false, '2021-11-15', 'https://g1.globo.com/economia/noticia/2021/11/15/tereza-precos-alimentos.ghtml', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'tereza-precos-alimentos-b103-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro minimiza inflação e chama cobertura jornalística de "pessimismo".', 'Essa história de que tudo está caro é pessimismo da imprensa.', 'Fala em cerimônia em novembro de 2021 em meio a alta recorde dos preços.', 'verified', false, '2021-11-18', 'https://www1.folha.uol.com.br/mercado/2021/11/bolsonaro-inflacao-pessimismo.shtml', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia oficial', 'bolsonaro-inflacao-pessimismo-b103-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Guedes diz que Brasil vence crise e que oposição faz "terrorismo" fiscal.', 'Oposição faz terrorismo fiscal. Nossa economia está se recuperando.', 'Declaração em entrevista em dezembro de 2021 como ministro da Economia.', 'verified', false, '2021-12-02', 'https://www.cnnbrasil.com.br/economia/guedes-terrorismo-fiscal/', 'news_article', 2, 'Ministério da Economia', 'Entrevista à imprensa', 'guedes-terrorismo-fiscal-b103-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro volta a afirmar que urnas eletrônicas são fraudáveis, sem provas.', 'Eu tenho provas de que as urnas foram fraudadas. Vou apresentar a hora certa.', 'Declaração em dezembro de 2021, insistindo em narrativa de fraude sem apresentar qualquer elemento.', 'verified', true, '2021-12-08', 'https://g1.globo.com/politica/noticia/2021/12/08/bolsonaro-urnas-fraude-provas.ghtml', 'news_article', 5, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-urnas-provas-b103-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_barroso, 'Barroso entrega presidência do TSE a Edson Fachin com alerta sobre 2022.', 'O maior desafio de 2022 será defender as eleições dos ataques infundados.', 'Discurso em cerimônia no TSE em 17 de dezembro de 2021 ao passar o cargo a Fachin.', 'verified', true, '2021-12-17', 'https://www.tse.jus.br/imprensa/noticias-tse/2021/Dezembro/barroso-posse-fachin', 'official_statement', 1, 'Tribunal Superior Eleitoral', 'Cerimônia de posse', 'barroso-passa-tse-b103-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fachin, 'Edson Fachin assume TSE e promete defender eleições contra desinformação.', 'Defenderei as eleições com firmeza. Não se destrói uma democracia com mentiras.', 'Discurso de posse como presidente do TSE em 17 de dezembro de 2021.', 'verified', true, '2021-12-17', 'https://www.tse.jus.br/imprensa/noticias-tse/2021/Dezembro/fachin-posse-tse', 'official_statement', 1, 'Tribunal Superior Eleitoral', 'Posse como presidente do TSE', 'fachin-posse-tse-b103-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eduardo, 'Eduardo Bolsonaro pede sanções dos EUA contra ministros do STF.', 'Os ministros do Supremo perseguem a direita. Espero que os EUA aplique sanções.', 'Declaração em viagem aos EUA em dezembro de 2021 pedindo intervenção estrangeira.', 'verified', true, '2021-12-10', 'https://www1.folha.uol.com.br/poder/2021/12/eduardo-sancoes-stf-eua.shtml', 'news_article', 5, 'Washington, EUA', 'Entrevista em Washington', 'eduardo-sancoes-stf-b103-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_flavio, 'Flávio Bolsonaro defende suposto projeto de "liberdade econômica" para pautar 2022.', 'Vamos à reeleição com o projeto da liberdade. O Brasil não pode voltar ao atraso.', 'Declaração em dezembro de 2021 projetando campanha de reeleição.', 'verified', false, '2021-12-15', 'https://www.poder360.com.br/congresso/flavio-reeleicao-liberdade/', 'news_article', 1, 'Senado Federal', 'Entrevista à imprensa', 'flavio-reeleicao-b103-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Alexandre de Moraes determina remoção de redes bolsonaristas que disseminam fake news.', 'As contas que replicam desinformação sobre eleições devem ser removidas.', 'Decisão em 20 de dezembro de 2021 determinando exclusão de contas em redes sociais.', 'verified', true, '2021-12-20', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=479000', 'official_statement', 2, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-redes-bolsonaro-b103-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro lamenta demora em aprovar orçamento secreto e pressiona Congresso.', 'Precisamos aprovar as emendas. Isso é fundamental para o país.', 'Declaração em dezembro de 2021 cobrando aprovação do orçamento com emendas do relator.', 'verified', false, '2021-12-21', 'https://g1.globo.com/politica/noticia/2021/12/21/bolsonaro-orcamento-secreto.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia oficial', 'bolsonaro-orcamento-secreto-b103-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral denuncia orçamento secreto como compra de apoio do Congresso.', 'O orçamento secreto é moeda de troca para blindar o presidente. Isso é escândalo.', 'Declaração em dezembro de 2021 criticando o mecanismo de emendas de relator.', 'verified', false, '2021-12-22', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/tabata-orcamento-secreto.html', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'tabata-orcamento-secreto-b103-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri vota contra orçamento secreto e chama Lira de garoto-propaganda do bolsonarismo.', 'Orçamento secreto é esquema organizado de troca de apoio. Lira precisa explicar.', 'Pronunciamento em dezembro de 2021 na Câmara sobre o mecanismo das emendas.', 'verified', false, '2021-12-22', 'https://www.cnnbrasil.com.br/politica/kim-orcamento-secreto-lira/', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'kim-orcamento-secreto-b103-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira defende emendas de relator e nega irregularidades.', 'Não há nada de secreto. As emendas do relator são legítimas e transparentes.', 'Declaração em dezembro de 2021 defendendo o RP-9 no Congresso Nacional.', 'verified', false, '2021-12-23', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/lira-emendas-relator.html', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista coletiva', 'lira-emendas-relator-b103-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vieira, 'Alessandro Vieira acusa governo de comprar parlamentares com orçamento secreto.', 'O governo Bolsonaro comprou o Congresso com orçamento secreto. Isso não é democracia.', 'Declaração no Senado em dezembro de 2021 sobre as emendas de relator.', 'verified', false, '2021-12-23', 'https://www12.senado.leg.br/noticias/materias/2021/12/23/vieira-orcamento-secreto', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'vieira-orcamento-secreto-b103-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues denuncia orçamento secreto ao STF.', 'Vamos levar o orçamento secreto ao Supremo. Isso é inconstitucional.', 'Representação ao STF em dezembro de 2021 contra as emendas do relator.', 'verified', false, '2021-12-27', 'https://www1.folha.uol.com.br/poder/2021/12/randolfe-stf-orcamento-secreto.shtml', 'news_article', 2, 'Brasília', 'Representação ao STF', 'randolfe-stf-orcamento-b103-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro encerra 2021 atacando CPI e dizendo que relatório é lixo.', 'Relatório da CPI é lixo. Não vai dar em nada.', 'Declaração em 30 de dezembro de 2021 em entrevista ao final do ano.', 'verified', false, '2021-12-30', 'https://g1.globo.com/politica/noticia/2021/12/30/bolsonaro-cpi-lixo.ghtml', 'news_article', 3, 'Palácio da Alvorada', 'Entrevista de fim de ano', 'bolsonaro-cpi-lixo-b103-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros celebra envio do relatório da CPI ao TPI em Haia.', 'O relatório será enviado ao Tribunal Penal Internacional. Crime contra a humanidade não prescreve.', 'Declaração em dezembro de 2021 anunciando encaminhamento internacional do relatório.', 'verified', false, '2021-12-15', 'https://www12.senado.leg.br/noticias/materias/2021/12/15/renan-tpi-haia', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'renan-tpi-haia-b103-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz cobra PGR pela morosidade em investigar Bolsonaro com base na CPI.', 'A PGR engaveta o relatório da CPI. Isso é prevaricação.', 'Declaração em dezembro de 2021 diante da demora do procurador-geral Augusto Aras em agir.', 'verified', false, '2021-12-20', 'https://www.poder360.com.br/justica/aziz-pgr-aras-cpi/', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'aziz-cobra-pgr-b103-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar critica Aras por engavetar denúncias contra Bolsonaro.', 'O senhor Aras é o engavetador-geral da República.', 'Declaração no Senado em dezembro de 2021 sobre a atuação da PGR.', 'verified', false, '2021-12-21', 'https://www12.senado.leg.br/noticias/materias/2021/12/21/otto-aras-engavetador', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'otto-aras-engavetador-b103-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa cobra Senado a analisar indicação de Aras ao STF.', 'Aras traiu a PGR. Não pode ir ao STF com essa conduta.', 'Declaração em dezembro de 2021 sobre a possibilidade de indicação do PGR ao Supremo.', 'verified', false, '2021-12-22', 'https://www12.senado.leg.br/noticias/materias/2021/12/22/humberto-aras-stf', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'humberto-aras-stf-b103-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza mortos da pandemia em dezembro e diz que imprensa exagera.', 'Essa história de 600 mil mortos é número inflado pela imprensa.', 'Declaração em live em 16 de dezembro de 2021 minimizando os mortos pela Covid-19.', 'verified', false, '2021-12-16', 'https://www1.folha.uol.com.br/poder/2021/12/bolsonaro-600-mil-inflado.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-ironiza-mortos-b103-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silveira, 'Daniel Silveira volta a atacar STF após liberação da tornozeleira.', 'O STF é uma piada. Eles vão pagar por tudo.', 'Declaração em dezembro de 2021 após cumprir parte das medidas cautelares.', 'verified', false, '2021-12-08', 'https://www.metropoles.com/brasil/politica-br/silveira-ataca-stf-dezembro', 'social_media_post', 4, 'Petrópolis', 'Postagem em redes sociais', 'silveira-ataca-stf-dez-b103-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zambelli, 'Carla Zambelli organiza ato na Paulista em defesa do voto impresso.', 'Precisamos pressionar o Congresso pelo voto impresso. Não vamos aceitar fraude.', 'Declaração em outubro de 2021 organizando manifestação em São Paulo.', 'verified', false, '2021-10-30', 'https://www.cnnbrasil.com.br/politica/zambelli-ato-voto-impresso/', 'social_media_post', 3, 'São Paulo', 'Postagem em redes sociais', 'zambelli-ato-voto-impresso-b103-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sugere convocar Conselho da República contra STF.', 'Quero convocar o Conselho da República para discutir os abusos.', 'Declaração em setembro de 2021 ensaiando crise institucional após decisão do STF.', 'verified', false, '2021-09-14', 'https://g1.globo.com/politica/noticia/2021/09/14/bolsonaro-conselho-republica.ghtml', 'news_article', 4, 'Palácio do Planalto', 'Entrevista à imprensa', 'bolsonaro-conselho-republica-b103-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mourao, 'Mourão afirma que Forças Armadas não serão usadas em aventuras golpistas.', 'As Forças Armadas não servirão a projetos pessoais. Somos instituições de Estado.', 'Declaração em outubro de 2021 após pressão para uso político dos militares.', 'verified', true, '2021-10-06', 'https://www1.folha.uol.com.br/poder/2021/10/mourao-forcas-armadas-institucao.shtml', 'news_article', 1, 'Palácio do Jaburu', 'Entrevista à imprensa', 'mourao-forcas-institucao-b103-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gilmar, 'Gilmar Mendes classifica ataques ao STF como "bolsonarismo institucional".', 'Os ataques são parte de um projeto autoritário. É bolsonarismo institucional.', 'Entrevista em novembro de 2021 em evento acadêmico sobre a crise dos Três Poderes.', 'verified', false, '2021-11-05', 'https://www.poder360.com.br/justica/gilmar-bolsonarismo-institucional/', 'news_article', 2, 'São Paulo', 'Evento acadêmico', 'gilmar-bolsonarismo-b103-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que só Deus pode tirá-lo da cadeira presidencial.', 'Só Deus me tira daqui. Ninguém mais.', 'Declaração em evento com apoiadores em outubro de 2021 em Pernambuco.', 'verified', true, '2021-10-20', 'https://g1.globo.com/politica/noticia/2021/10/20/bolsonaro-so-deus-tira.ghtml', 'news_article', 3, 'Recife', 'Evento com apoiadores', 'bolsonaro-so-deus-tira-b103-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_flavio, 'Flávio Bolsonaro diz que STF é "tirania da toga".', 'O STF virou tirania da toga. Precisamos enfrentar essa realidade.', 'Declaração em outubro de 2021 defendendo o pai contra decisões da Suprema Corte.', 'verified', false, '2021-10-15', 'https://www.metropoles.com/brasil/politica-br/flavio-stf-toga', 'news_article', 3, 'Senado Federal', 'Entrevista', 'flavio-stf-toga-b103-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kicis, 'Bia Kicis aprova na CCJ proposta de ampliação do voto impresso, rejeitada depois.', 'A CCJ aprovou o voto impresso. Agora é com o plenário.', 'Declaração em julho de 2021 após aprovação da PEC na CCJ.', 'verified', false, '2021-07-13', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/kicis-ccj-voto-impresso.html', 'news_article', 3, 'Câmara dos Deputados', 'Sessão da CCJ', 'kicis-ccj-voto-impresso-b103-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que não aceitará resultado das urnas se ministro do TSE mantiver urna eletrônica.', 'Quero eleição limpa em 2022. Eu não vou aceitar resultado de urna eletrônica pura.', 'Declaração em live em julho de 2021 indicando não aceitação de resultado eleitoral.', 'verified', true, '2021-07-29', 'https://g1.globo.com/politica/noticia/2021/07/29/bolsonaro-nao-aceitar-urna-eletronica.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-nao-aceitar-urna-b103-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_barroso, 'Barroso reage a Bolsonaro afirmando que quem ataca urna ataca a democracia.', 'Quem ataca as urnas ataca a democracia. Não há ambiguidade possível.', 'Declaração como presidente do TSE em agosto de 2021 após ataques ao sistema eleitoral.', 'verified', true, '2021-08-11', 'https://www.tse.jus.br/imprensa/noticias-tse/2021/Agosto/barroso-ataque-democracia', 'official_statement', 2, 'Tribunal Superior Eleitoral', 'Sessão plenária', 'barroso-ataca-urna-b103-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira rejeita PEC do voto impresso no plenário da Câmara.', 'A maioria da Câmara decidiu: não haverá voto impresso. O sistema é seguro.', 'Declaração em 10 de agosto de 2021 após derrota da PEC do voto impresso na Câmara.', 'verified', true, '2021-08-10', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/lira-pec-voto-impresso-rejeitada.html', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'lira-pec-voto-rejeitada-b103-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro cobra Lira após derrota da PEC do voto impresso.', 'Lira me prometeu que a PEC passaria. Aí está o resultado: traição.', 'Declaração em agosto de 2021 após derrota da proposta na Câmara.', 'verified', false, '2021-08-11', 'https://www.cnnbrasil.com.br/politica/bolsonaro-lira-traicao/', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-lira-traicao-b103-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro participa de culto evangélico e diz que "o mal está dentro do STF".', 'O mal está dentro do STF. Deus vai nos ajudar a vencer.', 'Fala em culto evangélico em Anápolis em agosto de 2021.', 'verified', false, '2021-08-22', 'https://g1.globo.com/politica/noticia/2021/08/22/bolsonaro-culto-mal-stf.ghtml', 'news_article', 4, 'Anápolis, GO', 'Culto evangélico', 'bolsonaro-culto-mal-stf-b103-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Moraes determina diligências contra financiadores das caravanas de 7 de Setembro.', 'Precisamos identificar os financiadores das manifestações antidemocráticas.', 'Decisão em setembro de 2021 no inquérito das milícias digitais.', 'verified', true, '2021-09-10', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=472000', 'official_statement', 2, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-caravanas-7set-b103-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Cláudio Castro no RJ mesmo após Chacina do Jacarezinho.', 'O que aconteceu no Jacarezinho é fruto do combate ao crime. A polícia tem que ter autonomia.', 'Declaração em maio de 2021 após a Chacina do Jacarezinho com 28 mortos.', 'verified', true, '2021-05-07', 'https://www1.folha.uol.com.br/cotidiano/2021/05/bolsonaro-jacarezinho.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-jacarezinho-b103-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo denuncia Chacina do Jacarezinho e cobra responsabilização.', 'Jacarezinho foi uma chacina. O governo Bolsonaro legitima este tipo de violência.', 'Declaração em 6 de maio de 2021 após a operação policial no Jacarezinho.', 'verified', false, '2021-05-06', 'https://www.poder360.com.br/estados/freixo-jacarezinho-chacina/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista à imprensa', 'freixo-jacarezinho-b103-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca ativista indígena Sonia Guajajara durante reunião com ruralistas.', 'A Sonia Guajajara é financiada pelo estrangeiro.', 'Declaração em reunião com bancada ruralista em abril de 2021.', 'verified', false, '2021-04-12', 'https://www.cnnbrasil.com.br/politica/bolsonaro-sonia-guajajara/', 'news_article', 3, 'Brasília', 'Reunião com ruralistas', 'bolsonaro-guajajara-b103-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_salles, 'Ricardo Salles incentiva "passar a boiada" e usa pandemia para afrouxar normas ambientais.', 'Temos que aproveitar que a atenção está na pandemia para passar a boiada.', 'Declaração resgatada em 2021 de reunião ministerial de abril de 2020, usada em depoimento na CPI.', 'verified', true, '2021-06-08', 'https://g1.globo.com/politica/noticia/2021/06/08/salles-passar-boiada.ghtml', 'news_article', 5, 'Brasília', 'Reunião ministerial', 'salles-passar-boiada-b103-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro promete refinaria nova para não depender de preços internacionais.', 'Vamos construir uma refinaria nova. Não vamos depender do dólar.', 'Declaração em agosto de 2021 após altas consecutivas da gasolina.', 'verified', false, '2021-08-27', 'https://www1.folha.uol.com.br/mercado/2021/08/bolsonaro-refinaria-combustiveis.shtml', 'news_article', 1, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-refinaria-b103-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é hospitalizado com suspeita de obstrução intestinal.', 'Meu problema é soluço há dez dias. Estou bem.', 'Declaração de 14 de julho de 2021 durante hospitalização em São Paulo.', 'verified', false, '2021-07-14', 'https://g1.globo.com/politica/noticia/2021/07/14/bolsonaro-hospital-obstrucao.ghtml', 'news_article', 1, 'São Paulo', 'Internação hospitalar', 'bolsonaro-obstrucao-b103-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro declara que pessoas morrem "por doenças ou por Deus" e minimiza vacina.', 'Todo mundo morre. Ou por doença ou por Deus.', 'Declaração em evento com apoiadores em junho de 2021.', 'verified', false, '2021-06-18', 'https://www.cnnbrasil.com.br/politica/bolsonaro-todo-mundo-morre/', 'news_article', 3, 'Brasília', 'Encontro com apoiadores', 'bolsonaro-todo-mundo-morre-b103-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco prorroga CPI da Covid por pressão da oposição.', 'A CPI será prorrogada conforme decidido pelo plenário. Estado democrático de direito.', 'Declaração em agosto de 2021 concordando com prorrogação da CPI.', 'verified', false, '2021-08-04', 'https://www12.senado.leg.br/noticias/materias/2021/08/04/pacheco-prorroga-cpi', 'official_statement', 1, 'Senado Federal', 'Ato administrativo', 'pacheco-prorroga-cpi-b103-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe convoca Ricardo Barros, líder do governo, para depor na CPI.', 'Ricardo Barros precisa explicar o envolvimento com a Covaxin e com o governo.', 'Declaração em julho de 2021 após requerimento aprovado pela CPI.', 'verified', false, '2021-07-15', 'https://g1.globo.com/politica/noticia/2021/07/15/randolfe-convoca-ricardo-barros.ghtml', 'official_statement', 3, 'Senado Federal', 'Sessão da CPI da Covid', 'randolfe-convoca-barros-b103-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro descarta Luciano Hang como "empresário-soldado" da direita.', 'O Luciano Hang é um empresário-soldado. Tem nosso respeito.', 'Declaração em setembro de 2021 defendendo o empresário da Havan na CPI.', 'verified', false, '2021-09-22', 'https://www1.folha.uol.com.br/poder/2021/09/bolsonaro-hang-soldado.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-hang-soldado-b103-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar denuncia "gabinete paralelo" que tomou decisões sobre pandemia.', 'Havia um gabinete paralelo. Decisões eram tomadas fora do ministério da Saúde.', 'Declaração em setembro de 2021 após depoimentos na CPI sobre aconselhamento paralelo.', 'verified', true, '2021-09-23', 'https://www12.senado.leg.br/noticias/materias/2021/09/23/otto-gabinete-paralelo', 'official_statement', 4, 'Senado Federal', 'Sessão da CPI da Covid', 'otto-gabinete-paralelo-b103-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama afirma que tratamento precoce foi "política de morte" do governo.', 'A política de tratamento precoce foi, de fato, uma política de morte.', 'Declaração em outubro de 2021 durante finalização do relatório da CPI.', 'verified', false, '2021-10-05', 'https://www12.senado.leg.br/noticias/materias/2021/10/05/eliziane-politica-morte', 'official_statement', 3, 'Senado Federal', 'Sessão da CPI da Covid', 'eliziane-politica-morte-b103-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça adversários em discurso na Marinha.', 'Meus adversários não sabem com quem estão lidando. Sou militar.', 'Declaração em cerimônia militar em outubro de 2021.', 'verified', false, '2021-10-12', 'https://g1.globo.com/politica/noticia/2021/10/12/bolsonaro-marinha-adversarios.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Cerimônia militar', 'bolsonaro-marinha-adversarios-b103-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann classifica Bolsonaro como ameaça permanente à democracia.', 'Bolsonaro é uma ameaça permanente. Não vamos baixar a guarda.', 'Declaração como presidente do PT em outubro de 2021.', 'verified', false, '2021-10-18', 'https://www.pt.org.br/gleisi-ameaca-permanente/', 'official_statement', 2, 'Brasília', 'Reunião do Diretório Nacional do PT', 'gleisi-ameaca-permanente-b103-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende reeleição e diz que não vai se candidatar a deputado.', 'Só tenho uma alternativa: reeleger ou não disputar nada.', 'Declaração em novembro de 2021 descartando alternativas políticas.', 'verified', false, '2021-11-18', 'https://www1.folha.uol.com.br/poder/2021/11/bolsonaro-reeleicao-alternativa.shtml', 'news_article', 1, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-reeleicao-alternativa-b103-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro visita Luciano Hang na Havan após CPI.', 'Estou aqui com um grande brasileiro, empresário que gera emprego.', 'Visita à loja da Havan em outubro de 2021 em apoio ao empresário após depoimento.', 'verified', false, '2021-10-16', 'https://www.metropoles.com/brasil/politica-br/bolsonaro-havan-hang', 'news_article', 3, 'Brusque, SC', 'Visita à Havan', 'bolsonaro-havan-hang-b103-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa denuncia visita de Bolsonaro à Havan como obstrução da CPI.', 'Visitar Hang logo após ele mentir na CPI é obstrução clara.', 'Declaração em outubro de 2021 após visita de Bolsonaro à Havan.', 'verified', false, '2021-10-17', 'https://www12.senado.leg.br/noticias/materias/2021/10/17/humberto-visita-havan', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'humberto-visita-havan-b103-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral vota pela derrubada da PEC do voto impresso na Câmara.', 'Voto impresso não traz segurança. Urna eletrônica é auditável e confiável.', 'Declaração em agosto de 2021 durante votação na Câmara.', 'verified', false, '2021-08-10', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/tabata-voto-impresso.html', 'news_article', 1, 'Câmara dos Deputados', 'Sessão plenária', 'tabata-voto-impresso-b103-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro zomba de máscaras em encontro com apoiadores.', 'Essa máscara não ajuda em nada. Isso foi comprovado.', 'Declaração em evento em Manaus em maio de 2021.', 'verified', false, '2021-05-24', 'https://g1.globo.com/politica/noticia/2021/05/24/bolsonaro-mascara-manaus.ghtml', 'news_article', 4, 'Manaus', 'Encontro com apoiadores', 'bolsonaro-zomba-mascaras-b103-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que vai "acabar com isolamento" em São Paulo e ataca Doria.', 'Isolamento mata. Doria é responsável pela crise em São Paulo.', 'Declaração em março de 2021 em meio ao pico da pandemia.', 'verified', false, '2021-03-18', 'https://www1.folha.uol.com.br/poder/2021/03/bolsonaro-doria-isolamento.shtml', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-doria-isolamento-b103-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_magno, 'Magno Malta promove jejum nacional contra o STF.', 'Vamos jejuar contra o mal que atacou o Brasil. O STF precisa se converter.', 'Declaração em julho de 2021 em evento evangélico com apoiadores.', 'verified', false, '2021-07-15', 'https://www.metropoles.com/brasil/politica-br/magno-jejum-stf', 'social_media_post', 3, 'Vila Velha, ES', 'Evento religioso', 'magno-jejum-stf-b103-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara diz que CPI virou "circo" da oposição.', 'A CPI virou um circo. A oposição só quer derrubar o presidente.', 'Declaração em setembro de 2021 como líder da bancada evangélica.', 'verified', false, '2021-09-18', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/silas-cpi-circo.html', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista', 'silas-cpi-circo-b103-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem diz que Bolsonaro merece respaldo da direita apesar das crises.', 'Bolsonaro é o único que representa a direita. Apoio sem concordar com tudo.', 'Declaração em novembro de 2021 em evento do Novo sobre posicionamento.', 'verified', false, '2021-11-10', 'https://www.poder360.com.br/congresso/van-hattem-bolsonaro-apoio/', 'news_article', 2, 'Porto Alegre', 'Evento partidário', 'vanhattem-apoio-bolsonaro-b103-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar apresenta projeto para suspender uso de verbas públicas por ministros envolvidos na Covaxin.', 'Ministros envolvidos no escândalo da Covaxin devem ter verbas suspensas.', 'Apresentação de projeto de lei em setembro de 2021 após revelações da CPI.', 'verified', false, '2021-09-10', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/chico-alencar-covaxin-verbas.html', 'official_statement', 2, 'Câmara dos Deputados', 'Apresentação de projeto', 'chico-projeto-covaxin-b103-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali denuncia apagão de dados do Ministério da Saúde na pandemia.', 'Apagar dados é mais uma das tentativas de esconder a tragédia que causaram.', 'Declaração em junho de 2021 após Ministério da Saúde deixar de divulgar números completos.', 'verified', false, '2021-06-08', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/jandira-apagao-dados.html', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista à imprensa', 'jandira-apagao-dados-b103-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca governadores do Nordeste e diz que não enviou vacina "por ironia".', 'Não enviei vacina para governadores que me atacavam. Por ironia, me atacam mais.', 'Declaração em entrevista em junho de 2021 admitindo uso político da distribuição de vacinas.', 'verified', true, '2021-06-14', 'https://g1.globo.com/politica/noticia/2021/06/14/bolsonaro-governadores-vacina-ironia.ghtml', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-governadores-vacinas-b103-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Brasil "não é quintal de ninguém" ao atacar Moraes.', 'O Brasil não é quintal de ministro do STF. Somos livres.', 'Declaração em setembro de 2021 em encontro com apoiadores.', 'verified', false, '2021-09-12', 'https://www.cnnbrasil.com.br/politica/bolsonaro-quintal-moraes/', 'news_article', 4, 'Brasília', 'Encontro com apoiadores', 'bolsonaro-quintal-moraes-b103-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke relata intimidação do governo durante CPI.', 'Recebi telefonemas de gente do Planalto me pedindo para segurar a pauta. É intimidação.', 'Declaração em setembro de 2021 como senadora titular da CPI.', 'verified', false, '2021-09-20', 'https://www12.senado.leg.br/noticias/materias/2021/09/20/soraya-intimidacao-planalto', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'soraya-intimidacao-b103-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Moraes autoriza inquérito sobre atos antidemocráticos contra Bolsonaro.', 'A incitação reiterada a atos antidemocráticos configura conduta investigável.', 'Decisão em agosto de 2021 autorizando apuração formal contra o presidente.', 'verified', true, '2021-08-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=469999', 'official_statement', 3, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-autoriza-inquerito-b103-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Fachin como novo presidente do TSE.', 'Fachin no TSE? Isso é resposta pra quem defende a urna eletrônica.', 'Declaração em dezembro de 2021 atacando novo presidente do TSE.', 'verified', true, '2021-12-18', 'https://g1.globo.com/politica/noticia/2021/12/18/bolsonaro-ataca-fachin.ghtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-ataca-fachin-b103-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eduardo, 'Eduardo Bolsonaro viaja à Hungria e CPAC para aproximar-se da extrema-direita global.', 'Queremos construir uma direita internacional forte, de Orbán a Trump.', 'Declaração em evento em Budapeste em setembro de 2021.', 'verified', false, '2021-09-25', 'https://www.metropoles.com/brasil/politica-br/eduardo-hungria-direita', 'news_article', 2, 'Budapeste, Hungria', 'Evento internacional de direita', 'eduardo-hungria-direita-b103-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carlos, 'Carlos Bolsonaro coordena gabinete do ódio em ataques coordenados a adversários.', 'Quem ataca meu pai, eu vou atrás.', 'Declaração em redes sociais em julho de 2021 após investigações apontarem centro de fake news.', 'verified', false, '2021-07-20', 'https://www1.folha.uol.com.br/poder/2021/07/carlos-bolsonaro-gabinete-odio.shtml', 'social_media_post', 4, 'Rio de Janeiro', 'Postagem em redes sociais', 'carlos-gabinete-odio-b103-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende "kit-Covid" mesmo após relatório da Anvisa contra tratamento precoce.', 'O kit salvou vidas. A Anvisa está errada.', 'Declaração em outubro de 2021 contradizendo autoridade sanitária.', 'verified', false, '2021-10-05', 'https://www.poder360.com.br/governo/bolsonaro-kit-covid-anvisa/', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-kit-anvisa-b103-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz avalia que Bolsonaro vai responder por pelo menos três crimes.', 'Vai responder pelo menos por três crimes graves: responsabilidade, humanidade e prevaricação.', 'Declaração em outubro de 2021 após entrega do relatório final.', 'verified', false, '2021-10-21', 'https://www12.senado.leg.br/noticias/materias/2021/10/21/aziz-bolsonaro-crimes', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'aziz-tres-crimes-b103-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros encerra CPI classificando Bolsonaro de "presidente psicopata".', 'Temos um presidente psicopata, incompetente e mesquinho.', 'Declaração em 27 de outubro de 2021 no encerramento da CPI.', 'verified', true, '2021-10-27', 'https://g1.globo.com/politica/noticia/2021/10/27/renan-bolsonaro-psicopata.ghtml', 'official_statement', 3, 'Senado Federal', 'Encerramento da CPI da Covid', 'renan-bolsonaro-psicopata-b103-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que ministro da Saúde Queiroga é "mole" demais.', 'O Queiroga é muito mole. Não age com a força que o momento exige.', 'Declaração em setembro de 2021 criticando o quarto ministro da Saúde do governo.', 'verified', false, '2021-09-24', 'https://www1.folha.uol.com.br/equilibrioesaude/2021/09/bolsonaro-queiroga-mole.shtml', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-queiroga-mole-b103-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco recebe relatório da CPI e promete encaminhar aos órgãos competentes.', 'O Senado cumprirá rigorosamente os encaminhamentos do relatório.', 'Declaração em 27 de outubro de 2021 ao receber o relatório final da CPI.', 'verified', true, '2021-10-27', 'https://www12.senado.leg.br/noticias/materias/2021/10/27/pacheco-recebe-relatorio', 'official_statement', 2, 'Senado Federal', 'Recebimento do relatório final', 'pacheco-recebe-relatorio-b103-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro participa de reunião com empresários e critica vacinação.', 'Esse povo vacinado pega Covid igual. Para que vacinar tanto?', 'Declaração em outubro de 2021 em reunião com empresários bolsonaristas.', 'verified', false, '2021-10-08', 'https://g1.globo.com/politica/noticia/2021/10/08/bolsonaro-empresarios-vacinacao.ghtml', 'news_article', 4, 'Brasília', 'Reunião com empresários', 'bolsonaro-empresarios-vacinacao-b103-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vieira, 'Alessandro Vieira pede ao STF que obrigue governo a cumprir recomendações da CPI.', 'O governo precisa ser obrigado a cumprir o que foi recomendado pela CPI.', 'Declaração em novembro de 2021 após encaminhamento do relatório.', 'verified', false, '2021-11-05', 'https://www12.senado.leg.br/noticias/materias/2021/11/05/vieira-stf-cpi', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'vieira-stf-cumprir-b103-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem comícios proibidos e diz que "nenhum juiz pode me calar".', 'Nenhum juiz pode me calar. Vamos continuar os atos.', 'Declaração em dezembro de 2021 após restrições de tribunais regionais.', 'verified', false, '2021-12-05', 'https://www1.folha.uol.com.br/poder/2021/12/bolsonaro-juiz-calar.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-juiz-calar-b103-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcristina, 'Tereza Cristina culpa pandemia mundial por alta da carne bovina no Brasil.', 'A alta é mundial. Não há como controlar isso no Brasil apenas.', 'Declaração em setembro de 2021 após alta recorde do preço da picanha.', 'verified', false, '2021-09-14', 'https://g1.globo.com/economia/noticia/2021/09/14/tereza-carne-mundial.ghtml', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'tereza-carne-mundial-b103-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro brinca com fome no Brasil e diz que "povo não morre de fome".', 'Povo brasileiro não morre de fome. Não é isso que a imprensa diz?', 'Declaração em setembro de 2021 em meio a aumento da miséria extrema.', 'verified', true, '2021-09-07', 'https://www1.folha.uol.com.br/mercado/2021/09/bolsonaro-povo-nao-morre-fome.shtml', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-povo-fome-b103-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula denuncia volta da fome no Brasil como resultado do governo Bolsonaro.', 'A fome voltou ao Brasil por culpa direta do governo Bolsonaro.', 'Declaração em setembro de 2021 durante evento em Recife.', 'verified', false, '2021-09-11', 'https://www.poder360.com.br/eleicoes/lula-fome-bolsonaro/', 'news_article', 2, 'Recife', 'Evento político', 'lula-fome-bolsonaro-b103-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que comprar osso é "o que tem na casa de muita gente".', 'Quem não tem dinheiro come osso, faz sopa. É o que tem.', 'Declaração em setembro de 2021 diante da inflação dos alimentos.', 'verified', false, '2021-09-21', 'https://g1.globo.com/economia/noticia/2021/09/21/bolsonaro-osso-sopa.ghtml', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'bolsonaro-osso-sopa-b103-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo anuncia pré-candidatura ao governo do RJ com discurso democrático.', 'Precisamos reconstruir o Rio e o Brasil. Vamos enfrentar o bolsonarismo.', 'Declaração em novembro de 2021 lançando pré-candidatura pelo PSB.', 'verified', false, '2021-11-20', 'https://www.cnnbrasil.com.br/politica/freixo-pre-candidatura-rj/', 'news_article', 1, 'Rio de Janeiro', 'Lançamento de pré-candidatura', 'freixo-pre-candidatura-b103-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann anuncia Lula como pré-candidato oficial do PT em 2022.', 'Lula é o nosso pré-candidato. Vamos reconstruir o Brasil a partir de 2022.', 'Anúncio oficial do PT em dezembro de 2021.', 'verified', true, '2021-12-09', 'https://www.pt.org.br/gleisi-anuncia-lula/', 'official_statement', 1, 'Brasília', 'Reunião do Diretório Nacional do PT', 'gleisi-lula-pre-candidato-b103-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_feliciano, 'Marco Feliciano promove culto em Brasília em apoio a Bolsonaro em 7 de Setembro.', 'Deus colocou Bolsonaro na Presidência e vai mantê-lo.', 'Declaração em culto evangélico em Brasília em setembro de 2021.', 'verified', false, '2021-09-06', 'https://www.metropoles.com/brasil/politica-br/feliciano-culto-bolsonaro-7-setembro', 'news_article', 3, 'Brasília', 'Culto evangélico', 'feliciano-culto-bolsonaro-b103-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro visita quartel e usa discurso para atacar o STF novamente.', 'O Exército é o último bastião da Nação. Nosso povo não aceita tirania.', 'Discurso em cerimônia militar em novembro de 2021.', 'verified', false, '2021-11-19', 'https://g1.globo.com/politica/noticia/2021/11/19/bolsonaro-quartel-stf.ghtml', 'news_article', 4, 'Brasília', 'Cerimônia militar', 'bolsonaro-quartel-stf-b103-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Moraes abre novo inquérito contra Bolsonaro por associar vacina a Aids.', 'A disseminação sistemática de informações falsas sobre vacinas justifica apuração.', 'Decisão em 1º de novembro de 2021 após live infame sobre vacinas.', 'verified', true, '2021-11-01', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=476500', 'official_statement', 3, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-novo-inquerito-b103-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz despede-se da CPI com discurso sobre responsabilidade histórica.', 'Nós cumprimos nosso dever. A história dirá se fizemos o suficiente.', 'Discurso de encerramento em 27 de outubro de 2021 como presidente da CPI.', 'verified', false, '2021-10-27', 'https://www12.senado.leg.br/noticias/materias/2021/10/27/aziz-despedida-cpi', 'official_statement', 2, 'Senado Federal', 'Encerramento da CPI da Covid', 'aziz-despedida-cpi-b103-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros anuncia articulação por CPMI da Covaxin em 2022 para aprofundar investigação.', 'Vamos criar uma CPMI em 2022 para investigar a Covaxin em profundidade.', 'Declaração em dezembro de 2021 propondo comissão mista para 2022.', 'verified', false, '2021-12-10', 'https://www12.senado.leg.br/noticias/materias/2021/12/10/renan-cpmi-covaxin', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'renan-cpmi-covaxin-b103-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

END $$;
