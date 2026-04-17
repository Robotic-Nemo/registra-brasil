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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro minimiza segunda onda da Covid-19 ao comentar mortes em Manaus por falta de oxigênio.', 'Não adianta fugir disso, da realidade. Tem que enfrentar de peito aberto, porra.', 'Declaração em transmissão ao vivo enquanto Manaus colapsava com falta de oxigênio em janeiro de 2021.', 'verified', true, '2021-01-14', 'https://g1.globo.com/politica/noticia/2021/01/14/bolsonaro-manaus-oxigenio.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-manaus-peito-aberto-b102-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro volta a promover cloroquina como tratamento precoce mesmo sem eficácia comprovada.', 'Quem é de direita toma cloroquina, quem é de esquerda toma Tubaína.', 'Fala em evento com apoiadores em janeiro de 2021 enquanto Brasil ultrapassava 200 mil mortes.', 'verified', true, '2021-01-19', 'https://www1.folha.uol.com.br/equilibrioesaude/2021/01/bolsonaro-cloroquina.shtml', 'news_article', 4, 'Brasília', 'Encontro com apoiadores', 'bolsonaro-cloroquina-tubaina-b102-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Rodrigo Pacheco é eleito presidente do Senado com apoio do Planalto em manobra articulada por Bolsonaro.', 'Vamos exercer a presidência do Senado com equilíbrio e respeito à independência dos Poderes.', 'Discurso de posse como presidente do Senado em 1º de fevereiro de 2021 após derrota do candidato de Renan Calheiros.', 'verified', false, '2021-02-01', 'https://www12.senado.leg.br/noticias/materias/2021/02/01/rodrigo-pacheco-presidente-senado', 'news_article', 2, 'Senado Federal', 'Posse da Mesa Diretora', 'pacheco-posse-senado-b102-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira é eleito presidente da Câmara com apoio do governo Bolsonaro e do Centrão.', 'Seremos o guardião da harmonia entre os Poderes e do respeito ao povo brasileiro.', 'Discurso na eleição para presidência da Câmara em fevereiro de 2021, considerada vitória estratégica do Planalto.', 'verified', false, '2021-02-01', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/arthur-lira-presidente.html', 'news_article', 2, 'Câmara dos Deputados', 'Eleição da Mesa Diretora', 'lira-posse-camara-b102-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silveira, 'Daniel Silveira divulga vídeo defendendo o AI-5 e ameaça ministros do STF.', 'Quantas vezes eu imaginei você apanhar na rua, ministro Barroso, tomar porrada de bandido.', 'Vídeo publicado em redes sociais em 16 de fevereiro de 2021, levando o STF a determinar sua prisão em flagrante.', 'verified', true, '2021-02-16', 'https://g1.globo.com/politica/noticia/2021/02/16/daniel-silveira-video-stf.ghtml', 'social_media_post', 5, 'Rio de Janeiro', 'Vídeo em redes sociais', 'silveira-video-ai5-b102-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Alexandre de Moraes determina prisão em flagrante do deputado Daniel Silveira por ameaças ao STF.', 'O deputado Daniel Silveira, deliberadamente, em vídeo público, ofendeu e ameaçou ministros desta Corte.', 'Decisão do STF que determinou a prisão em flagrante do deputado por crimes contra a democracia em 16 de fevereiro de 2021.', 'verified', true, '2021-02-16', 'https://www.stf.jus.br/arquivo/cms/noticiaNoticiaStf/anexo/decisaoMoraes.pdf', 'official_statement', 2, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-prisao-silveira-b102-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende publicamente Daniel Silveira após prisão e tenta indulto constitucional.', 'O Daniel Silveira é um patriota. Esse vídeo foi tirado do contexto.', 'Declaração a jornalistas em Brasília após a prisão do deputado por ameaças ao STF em fevereiro de 2021.', 'verified', true, '2021-02-17', 'https://www1.folha.uol.com.br/poder/2021/02/bolsonaro-defende-silveira.shtml', 'news_article', 4, 'Palácio do Planalto', 'Entrevista à imprensa', 'bolsonaro-defende-silveira-b102-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kicis, 'Bia Kicis compara prisão de Daniel Silveira a ditadura e ataca o STF.', 'O STF age como uma ditadura. Estão perseguindo um deputado por opinião.', 'Declaração em entrevista após prisão de Silveira, como presidente da CCJ da Câmara.', 'verified', false, '2021-02-17', 'https://www.cnnbrasil.com.br/politica/bia-kicis-stf-ditadura/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'kicis-stf-ditadura-b102-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zambelli, 'Carla Zambelli ataca o STF e defende Silveira em redes sociais.', 'Essa perseguição não vai ficar assim. O povo não vai aceitar esse abuso do Supremo.', 'Postagem em redes sociais no dia da prisão de Daniel Silveira em fevereiro de 2021.', 'verified', false, '2021-02-17', 'https://www.metropoles.com/brasil/politica-br/zambelli-silveira-stf', 'social_media_post', 3, 'Brasília', 'Postagem em redes sociais', 'zambelli-defesa-silveira-b102-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça usar Forças Armadas contra lockdowns estaduais.', 'Meu Exército não vai às ruas para obrigar ninguém a ficar em casa.', 'Declaração em evento em Goiás em março de 2021 em meio ao pico da pandemia.', 'verified', true, '2021-03-04', 'https://g1.globo.com/politica/noticia/2021/03/04/bolsonaro-exercito-lockdown.ghtml', 'news_article', 4, 'Goiânia', 'Evento público', 'bolsonaro-exercito-lockdown-b102-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama brasileiros de maricas ao criticar medidas de restrição contra Covid-19.', 'O Brasil tem que deixar de ser um país de maricas. Tem que enfrentar de peito aberto.', 'Fala em evento em Brasília em março de 2021, quando o país registrava mais de 2 mil mortes diárias.', 'verified', true, '2021-03-04', 'https://www1.folha.uol.com.br/poder/2021/03/bolsonaro-pais-maricas.shtml', 'news_article', 4, 'Brasília', 'Reunião com parlamentares', 'bolsonaro-pais-maricas-b102-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fachin, 'Edson Fachin anula condenações de Lula na Lava Jato por incompetência da Vara de Curitiba.', 'A Justiça Federal de Curitiba é incompetente para julgar os casos envolvendo o ex-presidente Lula.', 'Decisão do STF em março de 2021 que devolveu os direitos políticos a Lula e alterou o cenário eleitoral de 2022.', 'verified', true, '2021-03-08', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=462066', 'official_statement', 1, 'Supremo Tribunal Federal', 'Decisão monocrática', 'fachin-anula-lula-b102-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula reaparece politicamente após recuperar direitos políticos e critica negacionismo de Bolsonaro.', 'O Brasil não pode continuar sendo governado por alguém que não respeita a vida.', 'Primeiro discurso público após a anulação das condenações, feito no Sindicato dos Metalúrgicos de São Bernardo do Campo.', 'verified', true, '2021-03-10', 'https://g1.globo.com/politica/noticia/2021/03/10/lula-metalurgicos-discurso.ghtml', 'news_article', 1, 'São Bernardo do Campo', 'Discurso no Sindicato dos Metalúrgicos', 'lula-reaparece-b102-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro demite comandantes das três Forças em crise militar sem precedentes.', 'Vocês sabem que eu sou o comandante supremo das Forças Armadas.', 'Fala após demitir os três comandantes em 30 de março de 2021 por resistência a usar militares politicamente.', 'verified', true, '2021-03-30', 'https://www1.folha.uol.com.br/poder/2021/03/bolsonaro-demite-comandantes.shtml', 'news_article', 5, 'Palácio do Planalto', 'Reforma ministerial', 'bolsonaro-demite-comandantes-b102-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mourao, 'Mourão tenta minimizar crise militar após demissão dos comandantes das Forças Armadas.', 'Não há crise institucional. O presidente exerceu sua prerrogativa constitucional.', 'Entrevista em 31 de março de 2021, um dia após a demissão coletiva dos comandantes.', 'verified', false, '2021-03-31', 'https://www.cnnbrasil.com.br/politica/mourao-crise-militar/', 'news_article', 2, 'Palácio do Jaburu', 'Entrevista à imprensa', 'mourao-crise-militar-b102-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz é eleito presidente da CPI da Covid e promete apuração rigorosa.', 'Esta CPI vai até o fim. Não vamos aceitar manobras protelatórias do governo.', 'Declaração em 27 de abril de 2021 após eleição na instalação da Comissão Parlamentar de Inquérito da Pandemia.', 'verified', true, '2021-04-27', 'https://www12.senado.leg.br/noticias/materias/2021/04/27/omar-aziz-cpi', 'official_statement', 1, 'Senado Federal', 'Instalação da CPI da Covid', 'aziz-presidente-cpi-b102-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros é escolhido relator da CPI da Covid e anuncia investigação sobre omissão federal.', 'Vamos apurar responsabilidades, especialmente do governo federal, pela tragédia da pandemia.', 'Entrevista após sua escolha como relator em abril de 2021, anunciando foco na atuação do Ministério da Saúde.', 'verified', true, '2021-04-27', 'https://g1.globo.com/politica/noticia/2021/04/27/renan-relator-cpi.ghtml', 'news_article', 1, 'Senado Federal', 'Instalação da CPI da Covid', 'renan-relator-cpi-b102-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar é eleito vice-presidente da CPI da Covid e critica a política de imunidade de rebanho.', 'O governo apostou na imunidade de rebanho e isso custou centenas de milhares de vidas.', 'Pronunciamento na primeira semana dos trabalhos da CPI da Covid, apontando a estratégia governamental.', 'verified', false, '2021-04-28', 'https://www12.senado.leg.br/noticias/materias/2021/04/28/otto-vice-cpi', 'official_statement', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'otto-vice-cpi-b102-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe Rodrigues, vice-líder da oposição, promete transformar CPI da Covid em espelho do Brasil.', 'A CPI vai mostrar ao povo brasileiro como o governo federal escolheu o caos.', 'Declaração na abertura dos trabalhos da CPI em abril de 2021 como um dos articuladores da investigação.', 'verified', false, '2021-04-28', 'https://www.poder360.com.br/congresso/randolfe-cpi-espelho/', 'news_article', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'randolfe-cpi-espelho-b102-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa afirma que CPI provará crime contra a humanidade cometido pelo governo Bolsonaro.', 'Isso aqui é crime contra a humanidade. Vamos documentar cada erro e cada morte evitável.', 'Declaração como membro titular da CPI em maio de 2021, ex-ministro da Saúde do governo Lula.', 'verified', false, '2021-05-04', 'https://www12.senado.leg.br/noticias/materias/2021/05/04/humberto-costa-cpi', 'official_statement', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'humberto-crime-humanidade-b102-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Omar Aziz e chama CPI da Covid de palhaçada.', 'A CPI é uma palhaçada. Querem me atacar politicamente.', 'Fala em live semanal em maio de 2021 após instalação da CPI da Covid.', 'verified', true, '2021-05-06', 'https://www1.folha.uol.com.br/poder/2021/05/bolsonaro-cpi-palhacada.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-cpi-palhacada-b102-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pressiona Pacheco e Lira a barrar CPI da Covid em tentativa de obstrução.', 'Eles não vão achar nada. Estão tentando me desgastar.', 'Declaração em evento em maio de 2021 admitindo pressão sobre a presidência do Senado.', 'verified', false, '2021-05-10', 'https://g1.globo.com/politica/noticia/2021/05/10/bolsonaro-pressao-pacheco.ghtml', 'news_article', 4, 'Brasília', 'Agenda presidencial', 'bolsonaro-pressao-pacheco-b102-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz rebate Bolsonaro e garante independência da CPI diante de pressões políticas.', 'Não estamos aqui para defender governo nenhum. Estamos aqui para investigar.', 'Resposta às tentativas de Bolsonaro de desqualificar os trabalhos da CPI em maio de 2021.', 'verified', false, '2021-05-11', 'https://www12.senado.leg.br/noticias/materias/2021/05/11/aziz-rebate-bolsonaro', 'official_statement', 1, 'Senado Federal', 'Sessão da CPI da Covid', 'aziz-rebate-bolsonaro-b102-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros classifica Bolsonaro como genocida em discurso na CPI.', 'O presidente Jair Bolsonaro tem responsabilidade direta pela tragédia. É um genocida.', 'Pronunciamento como relator da CPI em maio de 2021 durante depoimento de ex-ministros da Saúde.', 'verified', true, '2021-05-12', 'https://www1.folha.uol.com.br/poder/2021/05/renan-bolsonaro-genocida.shtml', 'official_statement', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'renan-bolsonaro-genocida-b102-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza perguntas sobre CPI e repete negação de responsabilidade na pandemia.', 'Tenho mil formas de agir sem precisar escalar. Nunca acreditei nessa história de fechar tudo.', 'Declaração a apoiadores no Palácio da Alvorada em maio de 2021 após 435 mil mortes.', 'verified', false, '2021-05-15', 'https://www.cnnbrasil.com.br/politica/bolsonaro-ironiza-cpi/', 'news_article', 3, 'Palácio da Alvorada', 'Cerimônia com apoiadores', 'bolsonaro-ironia-cpi-b102-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eduardo, 'Eduardo Bolsonaro tenta desqualificar CPI da Covid em entrevista à Fox News.', 'A CPI é um show político da oposição. Meu pai fez o melhor possível na pandemia.', 'Entrevista à emissora conservadora norte-americana em maio de 2021 defendendo o governo.', 'verified', false, '2021-05-18', 'https://www.metropoles.com/brasil/politica-br/eduardo-fox-cpi', 'news_article', 3, 'Brasília', 'Entrevista à Fox News', 'eduardo-fox-cpi-b102-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_flavio, 'Flávio Bolsonaro diz que CPI da Covid visa tirar seu pai do poder.', 'O objetivo da CPI é tirar o Bolsonaro do poder. Eles querem fazer do meu pai o bode expiatório.', 'Entrevista em maio de 2021 defendendo o governo contra os trabalhos da CPI.', 'verified', false, '2021-05-19', 'https://www.poder360.com.br/congresso/flavio-cpi-bode/', 'news_article', 3, 'Senado Federal', 'Entrevista à imprensa', 'flavio-cpi-bode-b102-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vieira, 'Alessandro Vieira cobra depoimentos de ministros e aliados do governo na CPI.', 'Vamos chamar todos os que têm responsabilidade. Ninguém está acima da lei.', 'Declaração como membro titular da CPI em maio de 2021 defendendo lista de convocações.', 'verified', false, '2021-05-20', 'https://www12.senado.leg.br/noticias/materias/2021/05/20/vieira-convocacoes', 'official_statement', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'vieira-convocacoes-b102-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama destaca negacionismo presidencial como causa central de mortes na pandemia.', 'O negacionismo do presidente é a causa direta de milhares de mortes. Isso é fato.', 'Pronunciamento como titular da CPI em maio de 2021 ao abordar boicote a medidas sanitárias.', 'verified', false, '2021-05-21', 'https://www12.senado.leg.br/noticias/materias/2021/05/21/eliziane-negacionismo', 'official_statement', 2, 'Senado Federal', 'Sessão da CPI da Covid', 'eliziane-negacionismo-b102-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Em depoimento na Câmara, Mandetta é citado por ter sido demitido após divergir do tratamento precoce.', 'O Mandetta queria vender medo. Eu não quero isso para o povo brasileiro.', 'Fala de Bolsonaro em entrevista quando Mandetta seria ouvido pela CPI em maio de 2021.', 'verified', false, '2021-05-03', 'https://g1.globo.com/politica/noticia/2021/05/03/bolsonaro-mandetta-medo.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-mandetta-medo-b102-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Em depoimento à CPI, ex-ministro Mandetta afirma que governo escolheu tratamento precoce sem base.', 'Não havia como convencer o presidente sobre a ineficácia da cloroquina.', 'Fala de Renan conduzindo o depoimento de Mandetta em 4 de maio de 2021, citando discordâncias internas.', 'verified', true, '2021-05-04', 'https://www12.senado.leg.br/noticias/materias/2021/05/04/mandetta-cpi-cloroquina', 'official_statement', 3, 'Senado Federal', 'Depoimento de Mandetta', 'renan-mandetta-cpi-b102-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz confronta Pazuello sobre omissão em Manaus no colapso do oxigênio.', 'O senhor sabia e não agiu. Ponto. As mortes de Manaus estão em suas mãos.', 'Interpelação de Aziz durante depoimento do ex-ministro da Saúde em 19 de maio de 2021.', 'verified', true, '2021-05-19', 'https://www12.senado.leg.br/noticias/materias/2021/05/19/aziz-pazuello-manaus', 'official_statement', 4, 'Senado Federal', 'Depoimento de Pazuello', 'aziz-pazuello-manaus-b102-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan pressiona Pazuello sobre distribuição de kit-Covid sem eficácia comprovada.', 'O senhor sabia que não tinha eficácia e mesmo assim distribuiu o kit Covid. Isso é responsabilidade criminal.', 'Interpelação feita por Renan Calheiros durante depoimento de Pazuello à CPI em maio de 2021.', 'verified', true, '2021-05-19', 'https://www1.folha.uol.com.br/poder/2021/05/renan-pazuello-kit-covid.shtml', 'official_statement', 4, 'Senado Federal', 'Depoimento de Pazuello', 'renan-pazuello-kit-b102-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega falta de oxigênio em Manaus apesar de provas apresentadas à CPI.', 'Não houve falta de oxigênio. O governo federal fez tudo que era possível.', 'Declaração em transmissão ao vivo em maio de 2021 contradizendo depoimentos e documentos oficiais.', 'verified', false, '2021-05-20', 'https://g1.globo.com/politica/noticia/2021/05/20/bolsonaro-nega-falta-oxigenio.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-nega-oxigenio-b102-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa confronta Pazuello sobre demora em comprar vacinas.', 'O senhor recusou a Pfizer oito vezes. Oito vezes. Quantas vidas foram perdidas por isso?', 'Interpelação durante depoimento de Pazuello na CPI da Covid em 19 de maio de 2021.', 'verified', true, '2021-05-19', 'https://www12.senado.leg.br/noticias/materias/2021/05/19/humberto-pazuello-pfizer', 'official_statement', 4, 'Senado Federal', 'Depoimento de Pazuello', 'humberto-pazuello-pfizer-b102-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar alerta sobre contradições no depoimento de Pazuello.', 'O general se contradiz sistematicamente. Isso é falso testemunho.', 'Intervenção de Otto Alencar como vice-presidente da CPI no depoimento de Pazuello em 19 de maio de 2021.', 'verified', false, '2021-05-19', 'https://www12.senado.leg.br/noticias/materias/2021/05/19/otto-pazuello-contradicoes', 'official_statement', 3, 'Senado Federal', 'Depoimento de Pazuello', 'otto-pazuello-contradicoes-b102-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe pede prisão de Pazuello por mentir à CPI sobre oxigênio em Manaus.', 'O general está mentindo sob juramento. Peço a prisão em flagrante por falso testemunho.', 'Requerimento feito por Randolfe Rodrigues durante depoimento de Pazuello em 19 de maio de 2021.', 'verified', true, '2021-05-19', 'https://www1.folha.uol.com.br/poder/2021/05/randolfe-prisao-pazuello.shtml', 'official_statement', 4, 'Senado Federal', 'Depoimento de Pazuello', 'randolfe-prisao-pazuello-b102-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros anuncia lista de 23 indiciados pela CPI da Covid.', 'Temos mais de vinte nomes que serão indiciados, incluindo o presidente da República.', 'Entrevista após sucessão de depoimentos de ex-ministros na CPI em junho de 2021.', 'verified', true, '2021-06-03', 'https://g1.globo.com/politica/noticia/2021/06/03/renan-lista-indiciados-cpi.ghtml', 'news_article', 2, 'Senado Federal', 'Coletiva de imprensa', 'renan-lista-indiciados-b102-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Pazuello após depoimento em live atacando senadores.', 'O general Pazuello é um herói. Vocês estão perseguindo um militar brasileiro.', 'Declaração em live semanal no dia seguinte ao depoimento de Pazuello à CPI em maio de 2021.', 'verified', false, '2021-05-20', 'https://www.cnnbrasil.com.br/politica/bolsonaro-defende-pazuello/', 'news_article', 3, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-defende-pazuello-b102-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz afirma que Bolsonaro tenta intimidar CPI e senadores.', 'O presidente tenta nos intimidar. Não vamos recuar um milímetro.', 'Declaração após ataques de Bolsonaro a senadores da CPI em maio de 2021.', 'verified', false, '2021-05-21', 'https://www12.senado.leg.br/noticias/materias/2021/05/21/aziz-intimidacao', 'official_statement', 2, 'Senado Federal', 'Entrevista à imprensa', 'aziz-intimidacao-b102-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Em motociata em São Paulo, Bolsonaro promove aglomeração em plena pandemia.', 'Se for para morrer, morre em pé. Não podemos continuar com esse fique em casa.', 'Fala em motociata em São Paulo em 12 de junho de 2021 em meio à vacinação lenta e mais de 2 mil mortes diárias.', 'verified', true, '2021-06-12', 'https://www1.folha.uol.com.br/poder/2021/06/bolsonaro-motociata-sp.shtml', 'news_article', 4, 'São Paulo', 'Motociata', 'bolsonaro-motociata-sp-b102-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro retira máscara em motociata e é multado pelo Procon-SP.', 'Multa? Paguem vocês. Eu não vou pagar nada por estar com minha gente.', 'Fala após Procon-SP multá-lo em junho de 2021 por promover aglomeração sem máscara em São Paulo.', 'verified', false, '2021-06-14', 'https://g1.globo.com/sp/sao-paulo/noticia/2021/06/14/bolsonaro-multa-procon.ghtml', 'news_article', 3, 'São Paulo', 'Agenda em SP', 'bolsonaro-multa-procon-b102-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lira, 'Arthur Lira afirma que impeachment não está na pauta da Câmara apesar de 130 pedidos.', 'Não há clima político para impeachment. Não temos elementos técnicos.', 'Declaração em junho de 2021 mantendo as centenas de pedidos de impeachment engavetados.', 'verified', false, '2021-06-15', 'https://www.cnnbrasil.com.br/politica/lira-impeachment-gaveta/', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista à imprensa', 'lira-impeachment-gaveta-b102-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo cobra Lira pela omissão diante dos pedidos de impeachment.', 'A omissão de Arthur Lira é criminosa. São mais de 500 mil mortos pedindo justiça.', 'Declaração em junho de 2021 cobrando o presidente da Câmara a pautar pedidos de impeachment.', 'verified', false, '2021-06-17', 'https://www.metropoles.com/brasil/politica-br/freixo-lira-impeachment', 'social_media_post', 2, 'Rio de Janeiro', 'Postagem em redes sociais', 'freixo-cobra-lira-b102-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe denuncia contrato suspeito da Covaxin e pede investigação à CGU.', 'A Covaxin foi comprada com sobrepreço absurdo e fora dos trâmites legais. É corrupção clara.', 'Declaração em 22 de junho de 2021 após denúncia de irregularidades no contrato de compra da vacina indiana.', 'verified', true, '2021-06-22', 'https://www1.folha.uol.com.br/poder/2021/06/randolfe-covaxin-denuncia.shtml', 'news_article', 5, 'Senado Federal', 'Sessão da CPI da Covid', 'randolfe-covaxin-b102-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz chama contrato da Covaxin de "crime grotesco" em plena CPI.', 'O contrato da Covaxin é a ponta do iceberg. Isso é crime escancarado.', 'Declaração em 23 de junho de 2021 durante sessão da CPI após depoimento dos irmãos Miranda.', 'verified', true, '2021-06-23', 'https://g1.globo.com/politica/noticia/2021/06/23/aziz-covaxin-crime.ghtml', 'official_statement', 5, 'Senado Federal', 'Sessão da CPI da Covid', 'aziz-covaxin-crime-b102-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan afirma que Bolsonaro sabia da propina na compra da Covaxin.', 'O presidente foi avisado pelo deputado Luis Miranda e não fez nada. Isso é prevaricação.', 'Declaração em 25 de junho de 2021 após depoimento do deputado Luis Miranda, que afirmou ter alertado pessoalmente Bolsonaro.', 'verified', true, '2021-06-25', 'https://www12.senado.leg.br/noticias/materias/2021/06/25/renan-bolsonaro-prevaricacao', 'official_statement', 5, 'Senado Federal', 'Sessão da CPI da Covid', 'renan-prevaricacao-b102-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega ter sido alertado sobre irregularidades na Covaxin.', 'Eu não fui avisado de nada. Ninguém me falou de propina.', 'Declaração em live após depoimentos de Luis Miranda e Luis Ricardo Miranda na CPI em junho de 2021.', 'verified', true, '2021-06-26', 'https://www1.folha.uol.com.br/poder/2021/06/bolsonaro-nega-covaxin.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-nega-covaxin-b102-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_otto, 'Otto Alencar indica que depoimento dos irmãos Miranda abre frente criminal contra Bolsonaro.', 'Os irmãos Miranda expuseram o presidente. Agora é crime comum.', 'Declaração após depoimentos de Luis Miranda e Luis Ricardo Miranda em 25 de junho de 2021.', 'verified', false, '2021-06-25', 'https://www12.senado.leg.br/noticias/materias/2021/06/25/otto-miranda-crime-comum', 'official_statement', 4, 'Senado Federal', 'Sessão da CPI da Covid', 'otto-miranda-crime-b102-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa defende que Covaxin é o "pedágio" do governo Bolsonaro na pandemia.', 'A Covaxin é o pedágio. Cobraram propina na compra de vacinas enquanto o povo morria.', 'Entrevista em 28 de junho de 2021 resumindo revelações dos depoimentos na CPI.', 'verified', false, '2021-06-28', 'https://www.poder360.com.br/congresso/humberto-covaxin-pedagio/', 'news_article', 4, 'Senado Federal', 'Entrevista à imprensa', 'humberto-covaxin-pedagio-b102-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eliziane, 'Eliziane Gama diz que CPI vai até Ricardo Barros, líder do governo na Câmara.', 'Ricardo Barros precisa ser convocado. As pistas apontam para o centro do governo.', 'Declaração em sessão da CPI em 29 de junho de 2021 aprovando convocação do líder do governo.', 'verified', false, '2021-06-29', 'https://g1.globo.com/politica/noticia/2021/06/29/eliziane-ricardo-barros-cpi.ghtml', 'official_statement', 3, 'Senado Federal', 'Sessão da CPI da Covid', 'eliziane-ricardo-barros-b102-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro alega que PF não encontrou crime na Covaxin para desqualificar CPI.', 'A PF disse que não há crime. A CPI não vale nada.', 'Fala em cerimônia no Planalto em julho de 2021 após relatório parcial da Polícia Federal.', 'verified', false, '2021-07-01', 'https://www1.folha.uol.com.br/poder/2021/07/bolsonaro-pf-covaxin.shtml', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia oficial', 'bolsonaro-pf-covaxin-b102-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que PPT fraudou urnas em 2018 e ameaça eleições de 2022.', 'Ou nós temos eleição limpa em 2022 ou não temos eleição. Será guerra civil.', 'Declaração em live em 8 de julho de 2021 atacando urnas eletrônicas e insinuando ruptura institucional.', 'verified', true, '2021-07-08', 'https://g1.globo.com/politica/noticia/2021/07/08/bolsonaro-guerra-civil-urnas.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-guerra-civil-b102-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_barroso, 'Barroso rebate Bolsonaro e defende integridade das urnas eletrônicas.', 'O sistema eletrônico de votação é seguro, auditado e confiável. Não há fraude.', 'Declaração como presidente do TSE em 10 de julho de 2021 após ataques presidenciais ao sistema eleitoral.', 'verified', true, '2021-07-10', 'https://www.tse.jus.br/imprensa/noticias-tse/2021/Julho/barroso-urnas-seguras', 'official_statement', 1, 'Tribunal Superior Eleitoral', 'Entrevista coletiva', 'barroso-urnas-seguras-b102-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça não entregar faixa e fala em prender ministros do STF.', 'Só saio preso ou morto. E ainda tem um terceiro caminho: a vitória.', 'Declaração em evento evangélico em julho de 2021 com dezenas de pastores.', 'verified', true, '2021-07-15', 'https://www1.folha.uol.com.br/poder/2021/07/bolsonaro-so-saio-preso-morto.shtml', 'news_article', 5, 'Brasília', 'Culto com evangélicos', 'bolsonaro-preso-morto-b102-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro convoca apoiadores para ato antidemocrático em 7 de setembro.', 'Convoco a todos para 7 de setembro na Avenida Paulista e na Esplanada dos Ministérios.', 'Declaração em live em agosto de 2021 convocando os atos que teriam tom golpista.', 'verified', true, '2021-08-05', 'https://g1.globo.com/politica/noticia/2021/08/05/bolsonaro-convoca-7-setembro.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-convoca-7set-b102-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Alexandre de Moraes abre inquérito contra Bolsonaro por ataques às urnas.', 'A constante disseminação de notícias fraudulentas sobre o sistema eleitoral caracteriza crime.', 'Decisão do STF em agosto de 2021 inquérito aberto por ataques reiterados ao sistema eletrônico.', 'verified', true, '2021-08-04', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=470000', 'official_statement', 2, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-inquerito-bolsonaro-b102-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende "voto impresso" e ataca TSE e ministros.', 'Se não tiver voto impresso, não teremos eleição. É simples assim.', 'Declaração em cerimônia em agosto de 2021 insistindo em PEC do voto impresso que viria a ser rejeitada pela Câmara.', 'verified', true, '2021-08-10', 'https://www1.folha.uol.com.br/poder/2021/08/bolsonaro-voto-impresso-tse.shtml', 'news_article', 5, 'Palácio do Planalto', 'Cerimônia oficial', 'bolsonaro-voto-impresso-b102-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kicis, 'Bia Kicis defende PEC do voto impresso mesmo sem consenso técnico.', 'O voto impresso é a única forma de garantir a lisura das eleições.', 'Declaração como presidente da CCJ em agosto de 2021 defendendo proposta do Planalto.', 'verified', false, '2021-08-11', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/kicis-voto-impresso.html', 'news_article', 3, 'Câmara dos Deputados', 'Sessão da CCJ', 'kicis-voto-impresso-b102-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz desfile de tanques do Exército na Esplanada em dia de votação da PEC do voto impresso.', 'Foi um desfile programado há muito tempo. Não tem nada a ver com a votação.', 'Desfile de blindados da Marinha em Brasília em 10 de agosto de 2021, no mesmo dia da votação da PEC.', 'verified', true, '2021-08-10', 'https://g1.globo.com/politica/noticia/2021/08/10/desfile-tanques-esplanada.ghtml', 'news_article', 5, 'Brasília', 'Desfile militar', 'bolsonaro-tanques-esplanada-b102-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Rodrigo Pacheco rejeita desfile militar e cobra explicação do governo.', 'O Senado não se curvará a gestos de intimidação. Respeitaremos a Constituição.', 'Declaração em sessão do Senado em 10 de agosto de 2021 após desfile de tanques.', 'verified', true, '2021-08-10', 'https://www12.senado.leg.br/noticias/materias/2021/08/10/pacheco-intimidacao-tanques', 'official_statement', 2, 'Senado Federal', 'Sessão plenária', 'pacheco-rejeita-tanques-b102-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Em ato de 7 de Setembro, Bolsonaro declara que não cumprirá decisões do ministro Alexandre de Moraes.', 'Esse ministro Alexandre de Moraes... eu não vou mais cumprir decisão dele. Ele tem que pedir as contas ou ser cassado pelo Senado.', 'Discurso no ato de 7 de Setembro de 2021 na Avenida Paulista com 125 mil apoiadores.', 'verified', true, '2021-09-07', 'https://www1.folha.uol.com.br/poder/2021/09/bolsonaro-7-setembro-paulista.shtml', 'news_article', 5, 'Avenida Paulista, SP', 'Ato de 7 de Setembro', 'bolsonaro-7set-moraes-b102-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'No ato em Brasília, Bolsonaro ameaça o STF e fala em paciência que se esgotou.', 'Tenho três alternativas para meu futuro: estar preso, ser morto ou a vitória.', 'Discurso na Esplanada dos Ministérios em 7 de Setembro de 2021, repetindo ameaças golpistas.', 'verified', true, '2021-09-07', 'https://g1.globo.com/politica/noticia/2021/09/07/bolsonaro-esplanada-7-setembro.ghtml', 'news_article', 5, 'Esplanada dos Ministérios', 'Ato de 7 de Setembro', 'bolsonaro-esplanada-7set-b102-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça presidente do STF Luiz Fux após decisões contrárias.', 'Ou o presidente do STF enquadra Alexandre de Moraes ou podemos ter problemas.', 'Declaração em 7 de Setembro de 2021 na Esplanada dos Ministérios diante de milhares de apoiadores.', 'verified', true, '2021-09-07', 'https://www.cnnbrasil.com.br/politica/bolsonaro-ameaca-fux/', 'news_article', 5, 'Esplanada dos Ministérios', 'Ato de 7 de Setembro', 'bolsonaro-ameaca-fux-b102-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Alexandre de Moraes rebate Bolsonaro e reafirma autoridade do STF.', 'Ninguém está acima da Constituição. Nenhum poder se submete à pressão política.', 'Pronunciamento em 8 de setembro de 2021, um dia após ataques de Bolsonaro no ato de 7 de Setembro.', 'verified', true, '2021-09-08', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=471111', 'official_statement', 2, 'Supremo Tribunal Federal', 'Sessão plenária', 'moraes-responde-7set-b102-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Após recuo negociado, Bolsonaro divulga carta dizendo que não quis agredir o STF.', 'Nunca tive intenção de agredir nenhum dos Poderes. Minhas palavras foram fruto do calor do momento.', 'Carta pública divulgada em 9 de setembro de 2021 após mediação do ex-presidente Michel Temer.', 'verified', true, '2021-09-09', 'https://www1.folha.uol.com.br/poder/2021/09/bolsonaro-carta-nacao-temer.shtml', 'official_statement', 3, 'Palácio do Planalto', 'Nota oficial', 'bolsonaro-carta-temer-b102-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gilmar, 'Gilmar Mendes classifica ataques de 7 de Setembro como tentativa golpista.', 'Aquilo foi uma clara tentativa de ruptura institucional. Não vamos ceder.', 'Declaração em entrevista em setembro de 2021 após os atos antidemocráticos.', 'verified', true, '2021-09-12', 'https://www.poder360.com.br/justica/gilmar-mendes-7-setembro-golpe/', 'news_article', 2, 'Supremo Tribunal Federal', 'Entrevista à imprensa', 'gilmar-7set-golpe-b102-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_barroso, 'Luís Roberto Barroso alerta que ataques à urna são um ataque à democracia.', 'Atacar o sistema eleitoral é atacar a própria democracia brasileira.', 'Pronunciamento como presidente do TSE em setembro de 2021 após sequência de ataques de Bolsonaro.', 'verified', false, '2021-09-15', 'https://www.tse.jus.br/imprensa/noticias-tse/2021/Setembro/barroso-ataques-democracia', 'official_statement', 2, 'Tribunal Superior Eleitoral', 'Sessão plenária', 'barroso-ataques-democracia-b102-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zambelli, 'Carla Zambelli defende 7 de Setembro e chama ministros do STF de ditadores.', 'Fomos às ruas contra a ditadura da toga. A soberania é do povo.', 'Entrevista em 8 de setembro de 2021 após o ato antidemocrático.', 'verified', false, '2021-09-08', 'https://www.metropoles.com/brasil/politica-br/zambelli-7-setembro-stf', 'social_media_post', 4, 'Brasília', 'Postagem em redes sociais', 'zambelli-7set-ditadura-b102-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eduardo, 'Eduardo Bolsonaro apoia atos de 7 de Setembro e ataca imprensa.', 'A imprensa brasileira é inimiga do povo. O 7 de Setembro foi um grito de liberdade.', 'Postagem em redes sociais em 8 de setembro de 2021 endossando os atos antidemocráticos.', 'verified', false, '2021-09-08', 'https://www.cnnbrasil.com.br/politica/eduardo-7-setembro-imprensa/', 'social_media_post', 4, 'Brasília', 'Postagem em redes sociais', 'eduardo-7set-imprensa-b102-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann afirma que 7 de Setembro foi tentativa de golpe.', 'Foi uma tentativa de golpe mal-sucedida. Bolsonaro deve ser responsabilizado.', 'Declaração em 9 de setembro de 2021 na Câmara dos Deputados como presidente do PT.', 'verified', false, '2021-09-09', 'https://g1.globo.com/politica/noticia/2021/09/09/gleisi-7-setembro-golpe.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista à imprensa', 'gleisi-7set-golpe-b102-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_freixo, 'Marcelo Freixo denuncia financiamento dos atos de 7 de Setembro por empresários bolsonaristas.', 'Os caminhões que levaram gente para Brasília foram pagos por empresários ligados ao Planalto.', 'Denúncia em setembro de 2021 citando nomes de empresários como Luciano Hang e José Koury.', 'verified', false, '2021-09-10', 'https://www1.folha.uol.com.br/poder/2021/09/freixo-financiamento-7-setembro.shtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista coletiva', 'freixo-financiamento-7set-b102-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz volta a cobrar convocação de Luciano Hang e Carlos Wizard na CPI da Covid.', 'O empresário Luciano Hang e Carlos Wizard precisam explicar o papel do gabinete paralelo.', 'Declaração em sessão da CPI da Covid em setembro de 2021 aprovando convocações.', 'verified', false, '2021-09-14', 'https://www12.senado.leg.br/noticias/materias/2021/09/14/aziz-hang-wizard', 'official_statement', 3, 'Senado Federal', 'Sessão da CPI da Covid', 'aziz-hang-wizard-b102-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_randolfe, 'Randolfe denuncia Luciano Hang por fake news sobre vacinas e financiamento a atos golpistas.', 'Luciano Hang financia o golpismo e espalha mentiras sobre vacinas. Isso vai ser apurado.', 'Declaração em sessão da CPI em 22 de setembro de 2021 sobre o empresário da Havan.', 'verified', true, '2021-09-22', 'https://g1.globo.com/politica/noticia/2021/09/22/randolfe-luciano-hang-cpi.ghtml', 'official_statement', 3, 'Senado Federal', 'Sessão da CPI da Covid', 'randolfe-hang-b102-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros confronta Carlos Wizard em depoimento sobre gabinete paralelo.', 'O senhor participou de reuniões no Planalto sobre tratamento precoce. É verdade ou não?', 'Interpelação feita por Renan Calheiros no depoimento do empresário em 22 de setembro de 2021.', 'verified', true, '2021-09-22', 'https://www1.folha.uol.com.br/poder/2021/09/renan-wizard-gabinete-paralelo.shtml', 'official_statement', 4, 'Senado Federal', 'Depoimento de Carlos Wizard', 'renan-wizard-b102-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Aziz manda prender Luciano Hang por falso testemunho após depoimento na CPI.', 'O senhor não é obrigado a produzir prova contra si. Mas mentir é crime.', 'Encerramento do depoimento de Luciano Hang em 28 de setembro de 2021 com indicativo de representação.', 'verified', true, '2021-09-28', 'https://www12.senado.leg.br/noticias/materias/2021/09/28/aziz-hang-falso-testemunho', 'official_statement', 3, 'Senado Federal', 'Depoimento de Luciano Hang', 'aziz-hang-prisao-b102-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcristina, 'Tereza Cristina defende Bolsonaro em meio à crise da CPI e minimiza apurações.', 'O presidente está comprometido com o Brasil. A CPI é excesso político.', 'Declaração como ministra da Agricultura em setembro de 2021 diante das revelações da CPI.', 'verified', false, '2021-09-25', 'https://www.cnnbrasil.com.br/politica/tereza-cristina-cpi/', 'news_article', 2, 'Brasília', 'Entrevista à imprensa', 'tereza-cpi-excesso-b102-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_damares, 'Damares Alves defende suposto gabinete paralelo e tratamento precoce na CPI.', 'O tratamento precoce salvou vidas. As vacinas não deveriam ter sido obrigatórias.', 'Declaração como ministra em entrevista em setembro de 2021 apoiando narrativa do Planalto.', 'verified', false, '2021-09-27', 'https://www.poder360.com.br/governo/damares-tratamento-precoce-cpi/', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'damares-tratamento-precoce-b102-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_salles, 'Ricardo Salles, ex-ministro do Meio Ambiente, é alvo de operação da PF por esquema na Amazônia.', 'Não há nada de irregular. É perseguição política da oposição.', 'Declaração em junho de 2021 após operação Akuanduba da PF que o investigava, levando à sua demissão.', 'verified', true, '2021-06-23', 'https://g1.globo.com/politica/noticia/2021/06/23/salles-pf-operacao.ghtml', 'news_article', 3, 'Brasília', 'Entrevista à imprensa', 'salles-pf-akuanduba-b102-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Salles mesmo após operação da PF por facilitar desmatamento.', 'O Salles é um dos melhores ministros que tive. Não existe crime.', 'Declaração em live em 24 de junho de 2021 após operação da PF contra o então ministro do Meio Ambiente.', 'verified', false, '2021-06-24', 'https://www1.folha.uol.com.br/ambiente/2021/06/bolsonaro-defende-salles.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-defende-salles-b102-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Paulo Guedes admite fura-teto do auxílio emergencial, contrariando discurso de responsabilidade fiscal.', 'Vamos furar o teto sim, para pagar o auxílio emergencial. Não há alternativa.', 'Declaração em outubro de 2021 após escolha de financiar o Auxílio Brasil com mudança constitucional.', 'verified', false, '2021-10-21', 'https://g1.globo.com/economia/noticia/2021/10/21/guedes-fura-teto-auxilio.ghtml', 'news_article', 2, 'Ministério da Economia', 'Entrevista coletiva', 'guedes-fura-teto-b102-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_guedes, 'Guedes é citado em Pandora Papers por ter offshore no Caribe enquanto era ministro.', 'Não há nada de ilegal. Minha offshore foi declarada ao Banco Central.', 'Declaração em 6 de outubro de 2021 após revelação do Consórcio Internacional de Jornalistas Investigativos.', 'verified', true, '2021-10-06', 'https://www1.folha.uol.com.br/mercado/2021/10/pandora-papers-paulo-guedes.shtml', 'news_article', 4, 'Ministério da Economia', 'Entrevista', 'guedes-pandora-papers-b102-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_humberto, 'Humberto Costa cobra saída de Guedes após revelações do Pandora Papers.', 'Como pode um ministro da Economia ter offshore em paraíso fiscal? É obsceno.', 'Declaração em outubro de 2021 sobre a offshore do ministro da Economia no Caribe.', 'verified', false, '2021-10-07', 'https://www12.senado.leg.br/noticias/materias/2021/10/07/humberto-pandora-guedes', 'news_article', 2, 'Senado Federal', 'Entrevista à imprensa', 'humberto-pandora-guedes-b102-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jandira, 'Jandira Feghali classifica governo Bolsonaro como "necropolítica" na pandemia.', 'Esse governo escolheu a morte como política pública. Será lembrado como necropolítica.', 'Declaração em outubro de 2021 na Câmara dos Deputados sobre a gestão da pandemia.', 'verified', false, '2021-10-12', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/jandira-necropolitica.html', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'jandira-necropolitica-b102-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chico, 'Chico Alencar pede ação popular contra Bolsonaro por crimes de responsabilidade na pandemia.', 'São mais de 600 mil mortos. Bolsonaro precisa responder pelos crimes de responsabilidade.', 'Declaração em outubro de 2021 defendendo representação no STF.', 'verified', false, '2021-10-15', 'https://www.cartacapital.com.br/politica/chico-alencar-acao-popular/', 'news_article', 2, 'Câmara dos Deputados', 'Entrevista à imprensa', 'chico-acao-popular-b102-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros apresenta relatório final da CPI pedindo indiciamento de Bolsonaro por nove crimes.', 'Este relatório imputa ao presidente da República nove crimes, incluindo crime contra a humanidade.', 'Apresentação do relatório final da CPI da Covid em 20 de outubro de 2021.', 'verified', true, '2021-10-20', 'https://www12.senado.leg.br/noticias/materias/2021/10/20/relatorio-final-cpi-covid', 'official_statement', 4, 'Senado Federal', 'Relatório final da CPI da Covid', 'renan-relatorio-final-cpi-b102-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aziz, 'Omar Aziz encerra CPI com discurso sobre responsabilização e memória dos mortos.', 'Os 600 mil mortos não podem ter morrido em vão. Este relatório é por eles.', 'Discurso de encerramento da CPI da Covid em 26 de outubro de 2021.', 'verified', true, '2021-10-26', 'https://g1.globo.com/politica/noticia/2021/10/26/aziz-encerramento-cpi.ghtml', 'official_statement', 2, 'Senado Federal', 'Encerramento da CPI da Covid', 'aziz-encerra-cpi-b102-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que relatório final da CPI "não vale nada" e ataca Renan.', 'Esse relatório do Renan Calheiros não vale uma casca de banana.', 'Declaração em live em 21 de outubro de 2021 após apresentação do relatório final da CPI.', 'verified', true, '2021-10-21', 'https://www1.folha.uol.com.br/poder/2021/10/bolsonaro-relatorio-cpi-casca-banana.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-casca-banana-b102-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Em live, Bolsonaro relaciona vacinas à Aids em desinformação grave sobre imunizantes.', 'Relatórios oficiais da Reino Unido sugerem que vacinados estão contraindo Aids mais rápido do que o previsto.', 'Live transmitida em 21 de outubro de 2021 espalhando fake news grave sobre vacinas contra Covid-19.', 'verified', true, '2021-10-21', 'https://g1.globo.com/politica/noticia/2021/10/21/bolsonaro-vacinas-aids-fake.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Live semanal', 'bolsonaro-vacinas-aids-b102-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_soraya, 'Soraya Thronicke critica live de Bolsonaro sobre vacinas e Aids.', 'Essa live do presidente é criminosa. Está colocando vidas em risco deliberadamente.', 'Pronunciamento no Senado em 22 de outubro de 2021 repudiando desinformação sobre vacinas.', 'verified', false, '2021-10-22', 'https://www12.senado.leg.br/noticias/materias/2021/10/22/soraya-live-vacinas-aids', 'official_statement', 2, 'Senado Federal', 'Sessão plenária', 'soraya-repudia-live-b102-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moraes, 'Moraes determina investigação sobre live de Bolsonaro relacionando vacinas à Aids.', 'A disseminação de informações falsas sobre vacinas configura ilícito penal e sanitário.', 'Decisão do STF em outubro de 2021 por live considerada de desinformação grave.', 'verified', true, '2021-10-25', 'https://www.stf.jus.br/portal/cms/verNoticiaDetalhe.asp?idConteudo=476222', 'official_statement', 3, 'Supremo Tribunal Federal', 'Decisão monocrática', 'moraes-live-vacinas-b102-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tabata, 'Tábata Amaral classifica governo Bolsonaro como pior em saúde pública na história recente.', 'É o pior governo da história em saúde pública. São mais de 600 mil mortos por decisões deliberadas.', 'Declaração em outubro de 2021 na Câmara dos Deputados após relatório final da CPI.', 'verified', false, '2021-10-22', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/tabata-pior-governo-saude.html', 'news_article', 2, 'Câmara dos Deputados', 'Sessão plenária', 'tabata-pior-saude-b102-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica rito da CPI mas reconhece necessidade de investigar Covaxin.', 'Discordo de muita coisa na CPI, mas a Covaxin precisa ser investigada de verdade.', 'Declaração em outubro de 2021 como deputado do DEM comentando o relatório final.', 'verified', false, '2021-10-22', 'https://www.cnnbrasil.com.br/politica/kim-cpi-covaxin/', 'news_article', 1, 'Câmara dos Deputados', 'Entrevista', 'kim-covaxin-b102-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_vanhattem, 'Marcel van Hattem acusa CPI de perseguição política e defende Bolsonaro.', 'A CPI virou um palanque eleitoral contra o presidente da República.', 'Declaração em outubro de 2021 como deputado do Novo minimizando o relatório final.', 'verified', false, '2021-10-25', 'https://www.metropoles.com/brasil/politica-br/van-hattem-cpi-palanque', 'news_article', 3, 'Câmara dos Deputados', 'Entrevista', 'vanhattem-cpi-palanque-b102-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_feliciano, 'Marco Feliciano defende Bolsonaro e ataca CPI como manobra eleitoral.', 'A CPI é uma farsa. Querem derrubar o presidente de qualquer jeito.', 'Declaração em redes sociais em outubro de 2021 defendendo Bolsonaro após CPI.', 'verified', false, '2021-10-23', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/feliciano-cpi-farsa.html', 'social_media_post', 3, 'Câmara dos Deputados', 'Postagem em redes sociais', 'feliciano-cpi-farsa-b102-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_magno, 'Magno Malta defende Bolsonaro em culto evangélico e chama CPI de conspiração.', 'É tudo conspiração. O presidente foi escolhido por Deus.', 'Declaração em culto evangélico em Vila Velha em outubro de 2021 defendendo Bolsonaro.', 'verified', false, '2021-10-24', 'https://www.poder360.com.br/congresso/magno-malta-culto-bolsonaro/', 'news_article', 2, 'Vila Velha, ES', 'Culto evangélico', 'magno-malta-culto-b102-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara defende Bolsonaro na bancada evangélica e tenta diminuir CPI.', 'Nenhum presidente fez tanto pela família brasileira. CPI é perseguição.', 'Declaração em outubro de 2021 como líder da bancada evangélica na Câmara.', 'verified', false, '2021-10-26', 'https://www2.camara.leg.br/camaranoticias/noticias/POLITICA/silas-camara-bancada.html', 'news_article', 2, 'Câmara dos Deputados', 'Reunião de bancada', 'silas-bancada-b102-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carlos, 'Carlos Bolsonaro ataca CPI em série de postagens e defende tratamento precoce.', 'A CPI é uma farsa nojenta. Meu pai salvou vidas com hidroxicloroquina.', 'Postagens em redes sociais em outubro de 2021 atacando relatório final da CPI.', 'verified', false, '2021-10-27', 'https://www.metropoles.com/brasil/politica-br/carlos-bolsonaro-cpi-posts', 'social_media_post', 3, 'Rio de Janeiro', 'Postagens em redes sociais', 'carlos-bolsonaro-cpi-posts-b102-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pacheco, 'Pacheco confirma envio do relatório da CPI ao STF, PGR e órgãos internacionais.', 'O relatório será encaminhado aos órgãos competentes para as devidas providências.', 'Anúncio em 27 de outubro de 2021 no encerramento oficial da CPI da Covid.', 'verified', false, '2021-10-27', 'https://www12.senado.leg.br/noticias/materias/2021/10/27/pacheco-envio-relatorio', 'official_statement', 2, 'Senado Federal', 'Ato de encerramento da CPI', 'pacheco-envio-relatorio-b102-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan Calheiros afirma que relatório da CPI é "memória dos mortos" da pandemia.', 'Este relatório é a memória dos mortos da pandemia. Não será esquecido.', 'Declaração em entrevista em 28 de outubro de 2021 ao jornal Folha de São Paulo.', 'verified', false, '2021-10-28', 'https://www1.folha.uol.com.br/poder/2021/10/renan-memoria-mortos.shtml', 'news_article', 2, 'Maceió, AL', 'Entrevista à imprensa', 'renan-memoria-mortos-b102-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

END $$;
