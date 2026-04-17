-- Batch 144: Enchentes RS + Pantanal + desastres climaticos 2024-2026 (parte 1)
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_mar UUID; v_rui UUID; v_pad UUID;
  v_muc UUID; v_wde UUID; v_wgo UUID; v_fav UUID; v_teb UUID;
  v_sil UUID; v_pte UUID; v_nis UUID; v_lew UUID; v_jai UUID;
  v_sal UUID; v_edu UUID; v_nik UUID; v_mvh UUID; v_mou UUID;
  v_tar UUID; v_zem UUID; v_cai UUID; v_rat UUID; v_ele UUID;
  v_sme UUID; v_hel UUID; v_wil UUID; v_mme UUID; v_rie UUID;
  v_cas UUID; v_brd UUID; v_cam UUID; v_cle UUID; v_lir UUID;
  v_hmo UUID; v_ave UUID; v_tcr UUID; v_pab UUID; v_jaw UUID;
  v_hum UUID; v_ran UUID; v_ors UUID; v_jan UUID; v_cha UUID;
  v_sam UUID; v_tal UUID; v_fme UUID; v_eri UUID;
  c_irr UUID; c_des UUID; c_neg UUID; c_con UUID; c_abu UUID;
  c_odi UUID; c_ame UUID; c_aut UUID; c_cor UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_muc FROM politicians WHERE slug = 'jose-mucio';
  SELECT id INTO v_wde FROM politicians WHERE slug = 'wellington-dias';
  SELECT id INTO v_wgo FROM politicians WHERE slug = 'waldez-goes';
  SELECT id INTO v_fav FROM politicians WHERE slug = 'carlos-favaro';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'alexandre-silveira';
  SELECT id INTO v_pte FROM politicians WHERE slug = 'paulo-teixeira';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_ele FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_sme FROM politicians WHERE slug = 'sebastiao-melo';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_wil FROM politicians WHERE slug = 'wilson-lima';
  SELECT id INTO v_mme FROM politicians WHERE slug = 'mauro-mendes';
  SELECT id INTO v_rie FROM politicians WHERE slug = 'eduardo-riedel';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_brd FROM politicians WHERE slug = 'carlos-brandao';
  SELECT id INTO v_cam FROM politicians WHERE slug = 'gladson-cameli';
  SELECT id INTO v_cle FROM politicians WHERE slug = 'clecio-luis';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_ave FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_tcr FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_ors FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_fme FROM politicians WHERE slug = 'fernanda-melchionna';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';

  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Eduardo Leite decreta calamidade pública e pede ajuda federal.', 'É a maior tragédia da história do Rio Grande do Sul. Precisamos de todo apoio possível.', 'Coletiva em Porto Alegre no auge das enchentes de maio de 2024.', 'verified', true, '2024-05-02', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/leite-calamidade-rs.html', 'news_article', 1, 'Porto Alegre', 'Decreto calamidade', 'leite-calamidade-rs-b144-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sobrevoa áreas alagadas e promete ajuda integral ao RS.', 'Nenhum gaúcho ficará desamparado. Vamos reconstruir o Rio Grande.', 'Visita a Canoas com governador e ministros em maio de 2024.', 'verified', true, '2024-05-05', 'https://g1.globo.com/rs/rio-grande-do-sul/noticia/2024/05/05/lula-rs-enchente.ghtml', 'news_article', 1, 'Canoas, RS', 'Visita RS', 'lula-rs-enchente-ajuda-b144-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva relaciona enchentes do RS às mudanças climáticas.', 'Isso que estamos vendo é o que os cientistas avisaram. É a crise climática chegando.', 'Entrevista coletiva em Brasília em maio de 2024.', 'verified', true, '2024-05-06', 'https://www.correiobraziliense.com.br/brasil/2024/05/marina-rs-clima.html', 'news_article', 2, 'Brasília', 'Coletiva', 'marina-rs-clima-b144-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro minimiza enchentes e politiza tragédia do RS.', 'O governo Lula está usando a tragédia para esconder seu desastre.', 'Live em maio de 2024 em meio a milhares de desabrigados gaúchos.', 'verified', true, '2024-05-10', 'https://www.poder360.com.br/politica/bolsonaro-minimiza-enchente-rs/', 'news_article', 5, 'Redes sociais', 'Live', 'bolsonaro-minimiza-rs-b144-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles nega ligação entre enchentes e mudança climática.', 'Enchente sempre teve. Isso de crise climática é narrativa.', 'Postagem em rede social com negacionismo em plena catástrofe.', 'verified', true, '2024-05-08', 'https://www.metropoles.com/brasil/salles-enchente-rs-clima', 'news_article', 5, 'Redes sociais', 'Postagem', 'salles-nega-enchente-rs-b144-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira espalha fake news sobre Pix do governo para enchentes.', 'Estão desviando doações do RS. Ninguém pode confiar no governo.', 'Vídeo com alegações falsas que confundiram doadores em maio de 2024.', 'verified', true, '2024-05-12', 'https://www.uol.com.br/tilt/noticias/2024/05/12/nikolas-fake-rs-pix.htm', 'news_article', 5, 'Redes sociais', 'Postagem', 'nikolas-fake-rs-pix-b144-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro culpa Lula pela tragédia do RS.', 'A culpa é do governo Lula, que abandonou o RS.', 'Postagem em rede social em maio de 2024 com ataque político em meio à catástrofe.', 'verified', true, '2024-05-09', 'https://www.metropoles.com/brasil/eduardo-bolsonaro-culpa-lula-rs', 'news_article', 4, 'Redes sociais', 'Postagem', 'eduardo-culpa-lula-rs-b144-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sme, 'Sebastião Melo diz que a enchente desafia capacidade de Porto Alegre.', 'Estamos fazendo o possível. A cidade nunca viu nada igual.', 'Coletiva na prefeitura em maio de 2024 após falha do sistema de bombas.', 'verified', true, '2024-05-06', 'https://www.correiodopovo.com.br/noticias/politica/melo-bombas-enchente.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'melo-bombas-poa-b144-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite admite deficiência em sistema de proteção contra cheias.', 'Claramente o sistema de proteção do RS não foi suficiente.', 'Coletiva em Porto Alegre reconhecendo falhas estruturais.', 'verified', true, '2024-05-15', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/leite-sistema-protecao.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'leite-sistema-protecao-b144-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem ataca governo Lula durante tragédia do RS.', 'O governo Lula chegou atrasado e tratou o RS como laboratório ideológico.', 'Discurso na Câmara em meio aos desabrigados gaúchos.', 'verified', true, '2024-05-14', 'https://www.camara.leg.br/noticias/marcel-rs-enchente-governo', 'official_statement', 4, 'Câmara dos Deputados', 'Sessão', 'marcel-rs-laboratorio-b144-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia pacote de R$ 50 bi para reconstrução do RS.', 'O governo vai fazer o que for necessário para reconstruir o Rio Grande.', 'Anúncio em Brasília com governadores.', 'verified', true, '2024-05-13', 'https://valor.globo.com/politica/noticia/2024/05/13/rui-costa-pacote-rs.ghtml', 'news_article', 1, 'Brasília', 'Anúncio pacote', 'rui-pacote-rs-b144-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia calamidade fiscal para ampliar gastos no RS.', 'A reconstrução do RS é prioridade absoluta sobre o arcabouço.', 'Coletiva no Ministério da Fazenda em maio de 2024.', 'verified', false, '2024-05-22', 'https://valor.globo.com/politica/noticia/2024/05/22/haddad-calamidade-rs.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'haddad-calamidade-rs-b144-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wgo, 'Waldez Góes defende capacidade de resposta federal à tragédia do RS.', 'A Defesa Civil federal está presente em todos os municípios atingidos.', 'Coletiva sobre resposta nacional à catástrofe.', 'verified', false, '2024-05-16', 'https://www.gov.br/mdr/pt-br/noticias/waldez-rs-defesa-civil', 'other', 1, 'Brasília', 'Coletiva', 'waldez-rs-defesa-civil-b144-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski envia Força Nacional ao RS para segurança.', 'A Força Nacional vai garantir ordem e proteção aos desabrigados.', 'Anúncio como ministro da Justiça no dia 7 de maio.', 'verified', false, '2024-05-07', 'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/lewandowski-forca-nacional-rs', 'other', 1, 'Brasília', 'Anúncio', 'lewandowski-forca-nacional-rs-b144-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio manda Forças Armadas para resgates no RS.', 'As Forças Armadas estão totalmente empenhadas no resgate da população gaúcha.', 'Entrevista em Porto Alegre durante operação das FFAA.', 'verified', false, '2024-05-08', 'https://www.gov.br/defesa/pt-br/assuntos/noticias/mucio-ffaa-rs', 'other', 1, 'Porto Alegre', 'Entrevista', 'mucio-ffaa-rs-b144-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nis, 'Nísia Trindade monta força-tarefa de saúde no RS.', 'Saúde pública está mobilizada para atender o povo gaúcho.', 'Coletiva como ministra da Saúde em maio de 2024.', 'verified', false, '2024-05-11', 'https://www.gov.br/saude/pt-br/assuntos/noticias/nisia-rs-forca-tarefa', 'other', 1, 'Brasília', 'Coletiva', 'nisia-rs-forca-tarefa-b144-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wde, 'Wellington Dias cria Bolsa Família Emergencial para atingidos no RS.', 'Nenhuma família gaúcha vai passar fome enquanto reconstruímos a vida.', 'Anúncio em Porto Alegre do auxílio emergencial a atingidos.', 'verified', false, '2024-05-17', 'https://www.gov.br/mds/pt-br/noticias/wellington-bolsa-rs', 'other', 1, 'Porto Alegre', 'Anúncio', 'wellington-bolsa-rs-b144-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal usa tragédia para atacar Lula e ganhar engajamento.', 'O Lula está deixando o RS morrer enquanto posa para foto.', 'Live em maio de 2024 com acusações falsas monetizadas.', 'verified', true, '2024-05-11', 'https://www.uol.com.br/eleicoes/2024/05/11/marcal-rs-ataque-lula.htm', 'news_article', 4, 'Redes sociais', 'Live', 'marcal-rs-ataque-lula-b144-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia milicianos que cobram por resgates no RS.', 'Aplicar lei do mais forte em meio à tragédia é miserável.', 'Declaração em Porto Alegre durante visita de parlamentares.', 'verified', false, '2024-05-19', 'https://www.brasildefato.com.br/2024/05/19/samia-milicianos-rs', 'news_article', 2, 'Porto Alegre', 'Visita', 'samia-milicianos-rs-b144-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna cobra ação contra fake news no RS.', 'As fake news estão matando gente no meio da tragédia.', 'Entrevista em Porto Alegre sobre boatos que levaram doadores a recuar.', 'verified', true, '2024-05-13', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/05/melchionna-fake-rs.html', 'news_article', 2, 'Porto Alegre', 'Entrevista', 'melchionna-fake-rs-b144-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton pede responsabilização de negacionistas climáticos.', 'O negacionismo matou no RS. Isso tem que ter responsabilização.', 'Discurso na Câmara após enchentes.', 'verified', false, '2024-05-20', 'https://www.camara.leg.br/noticias/erika-negacionismo-rs', 'official_statement', 2, 'Câmara dos Deputados', 'Sessão', 'erika-negacionismo-rs-b144-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio envia ajuda de SP ao RS e critica federal.', 'São Paulo fez sua parte. Falta o federal dar respostas.', 'Coletiva em São Paulo durante envio de doações.', 'verified', false, '2024-05-14', 'https://www1.folha.uol.com.br/cotidiano/2024/05/tarcisio-rs-sp.shtml', 'news_article', 2, 'São Paulo', 'Coletiva', 'tarcisio-sp-rs-b144-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema critica prioridades do governo Lula em tragédia do RS.', 'Enquanto o RS afunda, o governo se preocupa com Venezuela.', 'Entrevista em MG em maio de 2024.', 'verified', false, '2024-05-12', 'https://www.poder360.com.br/politica/zema-rs-venezuela/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'zema-rs-venezuela-b144-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado manda bombeiros de GO ao RS.', 'Goiás é solidário. Enviamos o que temos de melhor.', 'Cerimônia de despacho em Goiânia.', 'verified', false, '2024-05-07', 'https://g1.globo.com/go/goias/noticia/2024/05/07/caiado-bombeiros-rs.ghtml', 'news_article', 1, 'Goiânia', 'Despacho tropas', 'caiado-bombeiros-rs-b144-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rat, 'Ratinho Jr envia apoio do Paraná para o RS.', 'O Paraná está junto com o Rio Grande.', 'Cerimônia em Curitiba enviando estrutura.', 'verified', false, '2024-05-08', 'https://www.gazetadopovo.com.br/politica/ratinho-rs-pr/', 'news_article', 1, 'Curitiba', 'Despacho', 'ratinho-pr-rs-b144-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira articula MP de socorro ao RS na Câmara.', 'A Câmara vai aprovar o que for preciso para o Rio Grande.', 'Entrevista em Brasília em maio de 2024.', 'verified', false, '2024-05-15', 'https://www.camara.leg.br/noticias/lira-mp-rs', 'official_statement', 1, 'Câmara dos Deputados', 'Entrevista', 'lira-mp-rs-b144-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pte, 'Paulo Teixeira anuncia crédito emergencial rural ao RS.', 'O pequeno agricultor gaúcho não vai quebrar. Vamos socorrer.', 'Coletiva em Porto Alegre com Pronaf emergencial.', 'verified', false, '2024-05-18', 'https://www.gov.br/mda/pt-br/noticias/paulo-teixeira-rs-pronaf', 'other', 1, 'Porto Alegre', 'Anúncio Pronaf', 'paulo-teixeira-rs-pronaf-b144-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Carlos Fávaro anuncia apoio a produtores rurais atingidos.', 'Vamos renegociar dívidas e dar assistência técnica a todos.', 'Coletiva sobre pacote para agropecuária gaúcha.', 'verified', false, '2024-05-21', 'https://www.gov.br/agricultura/pt-br/assuntos/noticias/favaro-rs', 'other', 1, 'Brasília', 'Coletiva', 'favaro-rs-agropecuaria-b144-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet articula reconstrução no MPO com visão plurianual.', 'Não adianta ajuda pontual. Precisamos de plano de 5 anos.', 'Entrevista ao Valor em maio de 2024.', 'verified', false, '2024-05-24', 'https://valor.globo.com/politica/noticia/2024/05/24/tebet-rs-plano.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'tebet-rs-plano-b144-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina critica desmonte de alertas climáticos por governos anteriores.', 'Nos governos Bolsonaro, desmontaram a ciência do clima no Brasil.', 'Entrevista à Zero Hora em maio de 2024.', 'verified', true, '2024-05-23', 'https://gauchazh.clicrbs.com.br/geral/noticia/2024/05/marina-desmonte-clima.html', 'news_article', 3, 'Porto Alegre', 'Entrevista', 'marina-desmonte-clima-b144-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite anuncia plano Rio Grande de reconstrução plurianual.', 'Vamos reconstruir com resiliência climática e segurança hídrica.', 'Lançamento do plano Rio Grande em junho de 2024.', 'verified', true, '2024-06-10', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/06/leite-plano-rio-grande.html', 'news_article', 2, 'Porto Alegre', 'Plano Rio Grande', 'leite-plano-rio-grande-b144-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica desorganização do plano Rio Grande.', 'O plano do governador está lento demais para o povo gaúcho.', 'Declaração em Porto Alegre em outubro de 2024.', 'verified', true, '2024-10-08', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/10/lula-plano-rio-grande-leite.html', 'news_article', 3, 'Porto Alegre', 'Visita RS', 'lula-critica-plano-leite-b144-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite rebate Lula sobre plano Rio Grande.', 'Precisamos de parceria, não de politicagem neste momento.', 'Resposta pública ao presidente em outubro de 2024.', 'verified', true, '2024-10-09', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/10/leite-rebate-lula.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'leite-rebate-lula-b144-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes minimiza incêndios do Pantanal em 2024.', 'Pantanal sempre pegou fogo. É natural.', 'Entrevista em Cuiabá durante explosão de queimadas em junho de 2024.', 'verified', true, '2024-06-18', 'https://g1.globo.com/mt/mato-grosso/noticia/2024/06/18/mendes-pantanal-fogo.ghtml', 'news_article', 5, 'Cuiabá', 'Entrevista', 'mendes-minimiza-pantanal-b144-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Eduardo Riedel declara emergência no Pantanal do MS.', 'O Pantanal do MS está em situação crítica. Precisamos de ajuda.', 'Coletiva em Corumbá após recorde de focos.', 'verified', false, '2024-06-25', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2024/06/25/riedel-emergencia-pantanal.ghtml', 'news_article', 2, 'Corumbá', 'Coletiva', 'riedel-emergencia-pantanal-b144-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina mobiliza operação federal contra incêndios no Pantanal.', 'Temos que salvar o Pantanal. A seca e o fogo estão devastando.', 'Anúncio em Brasília em junho de 2024 sobre operação PrevFogo.', 'verified', true, '2024-06-20', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-pantanal-prevfogo', 'other', 2, 'Brasília', 'Anúncio operação', 'marina-pantanal-prevfogo-b144-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina minimiza incêndios no Pantanal.', 'O produtor rural está sendo demonizado sem provas.', 'Discurso no Senado em junho de 2024 em defesa do agro.', 'verified', false, '2024-06-26', 'https://www12.senado.leg.br/noticias/materias/2024/06/26/tereza-pantanal-produtor', 'official_statement', 3, 'Senado Federal', 'Sessão', 'tereza-pantanal-produtor-b144-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles defende pecuaristas após gigantesco incêndio no Pantanal.', 'Estão perseguindo pecuaristas para criar narrativa verde.', 'Postagem em rede social em julho de 2024.', 'verified', true, '2024-07-12', 'https://www.metropoles.com/brasil/salles-pecuaristas-pantanal', 'news_article', 5, 'Redes sociais', 'Postagem', 'salles-pecuaristas-pantanal-b144-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro nega papel do desmatamento nos incêndios.', 'Desmatamento cai no meu governo, quem sabe disso fica calado.', 'Live em julho de 2024 com informação falsa.', 'verified', true, '2024-07-15', 'https://www.poder360.com.br/politica/bolsonaro-desmatamento-pantanal/', 'news_article', 5, 'Redes sociais', 'Live', 'bolsonaro-desmatamento-pantanal-b144-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hel, 'Helder Barbalho associa queimadas na Amazônia à crise climática.', 'O Pará está queimando mais. A crise climática agrava tudo.', 'Entrevista em Belém durante queimadas de agosto de 2024.', 'verified', false, '2024-08-22', 'https://g1.globo.com/pa/para/noticia/2024/08/22/helder-queimadas-clima.ghtml', 'news_article', 2, 'Belém', 'Entrevista', 'helder-queimadas-clima-b144-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_wil, 'Wilson Lima decreta emergência em 62 municípios do AM por seca e fogo.', 'O Amazonas enfrenta a pior seca de sua história.', 'Decreto em setembro de 2024 com fumaça bloqueando Manaus.', 'verified', true, '2024-09-10', 'https://d24am.com/politica/wilson-lima-emergencia-seca/', 'news_article', 2, 'Manaus', 'Decreto', 'wilson-seca-amazonas-b144-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina denuncia atraso de recursos para brigadistas.', 'Não dá para combater fogo com equipe desmontada.', 'Declaração em Brasília sobre urgência de brigadas.', 'verified', true, '2024-08-19', 'https://valor.globo.com/brasil/noticia/2024/08/19/marina-brigadistas.ghtml', 'news_article', 3, 'Brasília', 'Coletiva', 'marina-brigadistas-b144-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira trava prioridade de orçamento ambiental na Câmara.', 'Tem coisa mais importante que brigada no país.', 'Declaração em Brasília em agosto de 2024.', 'verified', false, '2024-08-14', 'https://www.correiobraziliense.com.br/politica/2024/08/lira-orcamento-ambiental.html', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista', 'lira-orcamento-ambiental-b144-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar denuncia ineficácia diante das queimadas.', 'Não há Plano contra o fogo à altura da crise.', 'Discurso na Câmara em setembro de 2024.', 'verified', false, '2024-09-09', 'https://www.camara.leg.br/noticias/chico-alencar-queimadas', 'official_statement', 2, 'Câmara dos Deputados', 'Sessão', 'chico-queimadas-b144-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe cobra ação rápida para seca no Amapá.', 'O Amapá não pode esperar. Estamos secando.', 'Discurso no Senado em setembro de 2024.', 'verified', false, '2024-09-17', 'https://www12.senado.leg.br/noticias/materias/2024/09/17/randolfe-seca-ap', 'official_statement', 1, 'Senado Federal', 'Sessão', 'randolfe-seca-ap-b144-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cle, 'Clécio Luís reclama demora de auxílio federal à seca no Amapá.', 'Precisamos de dragas, precisamos de água, precisamos de prazo.', 'Entrevista em Macapá em setembro de 2024.', 'verified', false, '2024-09-20', 'https://g1.globo.com/ap/amapa/noticia/2024/09/20/clecio-seca-federal.ghtml', 'news_article', 2, 'Macapá', 'Entrevista', 'clecio-seca-federal-b144-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Claudio Castro nega gravidade do calor extremo no RJ.', 'O Rio sempre teve calor. Não é novidade.', 'Declaração em fevereiro de 2024 durante onda de calor recorde.', 'verified', false, '2024-02-17', 'https://oglobo.globo.com/rio/noticia/2024/02/17/castro-calor-rj.ghtml', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'castro-calor-rj-b144-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone critica falta de centros de resfriamento no RJ.', 'O calor mata pobre e o RJ não tem política pública.', 'Discurso na Câmara em fevereiro de 2024.', 'verified', false, '2024-02-20', 'https://www.brasildefato.com.br/2024/02/20/taliria-calor-rj', 'news_article', 2, 'Rio de Janeiro', 'Ato', 'taliria-calor-rj-b144-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete lei de adaptação climática nacional.', 'Vamos ter lei que obrigue todos os entes a se adaptarem.', 'Fala em evento em São Paulo em outubro de 2024.', 'verified', false, '2024-10-18', 'https://g1.globo.com/politica/noticia/2024/10/18/lula-adaptacao-climatica.ghtml', 'news_article', 1, 'São Paulo', 'Evento clima', 'lula-adaptacao-clima-b144-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina lança Plano Clima em dezembro de 2024.', 'O Brasil tem Plano Clima. Ele guiará todas as políticas.', 'Lançamento do Plano Clima no Palácio do Planalto.', 'verified', true, '2024-12-10', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-plano-clima', 'other', 1, 'Brasília', 'Lançamento Plano Clima', 'marina-plano-clima-b144-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sme, 'Sebastião Melo é criticado por cortar verba de defesa civil antes das enchentes.', 'As críticas são injustas. Estávamos dentro do orçamento.', 'Entrevista em Porto Alegre após enchente de maio de 2024.', 'verified', true, '2024-06-05', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/06/melo-defesa-civil-corte.html', 'news_article', 4, 'Porto Alegre', 'Entrevista', 'melo-defesa-civil-corte-b144-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite reconhece erros em alertas climáticos e promete melhoria.', 'Temos que melhorar radicalmente os alertas no RS.', 'Coletiva em Porto Alegre após CPI das enchentes.', 'verified', false, '2024-09-05', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/09/leite-alertas-cpi.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'leite-alertas-cpi-b144-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner propõe ajuste fiscal emergencial para reconstrução.', 'O RS merece exceção fiscal.', 'Discurso no Senado em maio de 2024.', 'verified', false, '2024-05-22', 'https://www12.senado.leg.br/noticias/materias/2024/05/22/jaques-ajuste-rs', 'official_statement', 1, 'Senado Federal', 'Sessão', 'jaques-ajuste-rs-b144-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende Sistema Único de Defesa Civil.', 'Precisamos de um SUS para desastres.', 'Artigo em jornal em junho de 2024.', 'verified', false, '2024-06-14', 'https://www12.senado.leg.br/noticias/materias/2024/06/14/humberto-sus-desastres', 'official_statement', 1, 'Senado Federal', 'Artigo', 'humberto-sus-desastres-b144-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ors, 'Orlando Silva defende Fundo Clima robusto e antecipa debate do arcabouço.', 'Sem Fundo Clima forte, vamos reconstruir e cair de novo.', 'Discurso em Brasília em junho de 2024.', 'verified', false, '2024-06-18', 'https://www.camara.leg.br/noticias/orlando-fundo-clima', 'official_statement', 1, 'Câmara dos Deputados', 'Sessão', 'orlando-fundo-clima-b144-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali cobra política nacional de reassentamento climático.', 'Milhões vão ter que migrar. O Estado precisa se preparar.', 'Discurso na Câmara em julho de 2024.', 'verified', false, '2024-07-18', 'https://www.camara.leg.br/noticias/jandira-reassentamento-climatico', 'official_statement', 1, 'Câmara dos Deputados', 'Sessão', 'jandira-reassentamento-b144-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fme, 'Fernanda Melchionna apresenta projeto sobre migrantes climáticos.', 'O Brasil terá refugiados climáticos. Precisamos de estatuto.', 'Apresentação de PL em julho de 2024.', 'verified', false, '2024-07-25', 'https://www.camara.leg.br/noticias/melchionna-refugiados-climaticos', 'official_statement', 1, 'Câmara dos Deputados', 'Apresentação PL', 'melchionna-refugiados-climaticos-b144-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama refugiados climáticos de invasão.', 'Estão querendo abrir porteira para qualquer um entrar.', 'Postagem em rede social em agosto de 2024 contra PL de refugiados.', 'verified', true, '2024-08-02', 'https://www.metropoles.com/brasil/eduardo-refugiados-climaticos', 'news_article', 4, 'Redes sociais', 'Postagem', 'eduardo-refugiados-climaticos-b144-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira debocha de vítimas da enchente em post viral.', 'Enquanto gaúcho chora, Lula dança.', 'Postagem com vídeo manipulado em maio de 2024.', 'verified', true, '2024-05-17', 'https://www.metropoles.com/brasil/nikolas-deboche-gauchos', 'news_article', 4, 'Redes sociais', 'Postagem', 'nikolas-deboche-gauchos-b144-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica Forças Armadas atuando em ajuda humanitária.', 'FFAA não é ONG. Não deveriam estar distribuindo cesta.', 'Discurso no Senado em maio de 2024 durante operação no RS.', 'verified', false, '2024-05-16', 'https://www12.senado.leg.br/noticias/materias/2024/05/16/mourao-ffaa-rs', 'official_statement', 3, 'Senado Federal', 'Sessão', 'mourao-ffaa-rs-b144-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ave, 'Adriana Ventura questiona crédito especial de reconstrução.', 'Estão abrindo boquinha para gastar fora do arcabouço.', 'Entrevista em Brasília em junho de 2024.', 'verified', false, '2024-06-03', 'https://valor.globo.com/politica/noticia/2024/06/03/adriana-arcabouco-rs.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'adriana-arcabouco-rs-b144-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel Van Hattem chama ajuda de trampolim eleitoral.', 'Lula usa tragédia para campanha. É cinismo.', 'Discurso na Câmara em maio de 2024.', 'verified', true, '2024-05-22', 'https://www.camara.leg.br/noticias/marcel-trampolim-rs', 'official_statement', 4, 'Câmara dos Deputados', 'Sessão', 'marcel-trampolim-rs-b144-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula volta ao RS e promete retomada.', 'O Rio Grande está se levantando. Vamos fazer o impossível.', 'Visita em setembro de 2024 a Canoas, com cerimônia de entrega.', 'verified', true, '2024-09-08', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/09/lula-canoas-setembro.html', 'news_article', 1, 'Canoas, RS', 'Entrega obras', 'lula-canoas-setembro-b144-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite cobra mais recursos do PAC Reconstrução.', 'O dinheiro que chegou ainda é pouco diante do tamanho.', 'Entrevista à Zero Hora em novembro de 2024.', 'verified', false, '2024-11-11', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/11/leite-pac-reconstrucao.html', 'news_article', 2, 'Porto Alegre', 'Entrevista', 'leite-pac-reconstrucao-b144-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sme, 'Melo é alvo de MP por omissão em sistema de bombas.', 'Não cabe mais politizar esse tema. Vamos esperar a Justiça.', 'Coletiva em outubro de 2024 após ação do MP.', 'verified', false, '2024-10-17', 'https://www.correiodopovo.com.br/noticias/politica/melo-mp-bombas.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'melo-mp-bombas-b144-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim apresenta projeto punindo quem espalha fake news em desastres.', 'Fake news em tragédia é crime. Tem que virar lei clara.', 'Apresentação de PL em junho de 2024.', 'verified', false, '2024-06-11', 'https://www.camara.leg.br/noticias/samia-fake-desastres-pl', 'official_statement', 1, 'Câmara dos Deputados', 'Apresentação PL', 'samia-fake-desastres-pl-b144-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton cobra apoio psicossocial no RS pós enchentes.', 'A tragédia é trauma coletivo. Precisamos de acolhimento.', 'Visita a abrigos em Porto Alegre em junho de 2024.', 'verified', false, '2024-06-07', 'https://gauchazh.clicrbs.com.br/politica/noticia/2024/06/erika-abrigos-rs.html', 'news_article', 1, 'Porto Alegre', 'Visita abrigos', 'erika-abrigos-rs-b144-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula decreta luto nacional após enchentes de 2025 no RS.', 'O Brasil chora mais uma vez pelo Rio Grande.', 'Decreto em outubro de 2025 após nova catástrofe no RS.', 'verified', true, '2025-10-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/notas-oficiais/2025/lula-luto-rs', 'official_statement', 1, 'Brasília', 'Decreto luto', 'lula-luto-rs-2025-b144-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina denuncia emergência climática como a nova normalidade.', 'Não há mais normal. Temos que conviver com a emergência climática.', 'Entrevista à Zero Hora em outubro de 2025 após nova tragédia.', 'verified', true, '2025-10-15', 'https://gauchazh.clicrbs.com.br/geral/noticia/2025/10/marina-emergencia-nova-normalidade.html', 'news_article', 3, 'Porto Alegre', 'Entrevista ZH', 'marina-emergencia-normalidade-b144-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles diz que não há emergência climática.', 'Não existe emergência climática. É invenção de globalistas.', 'Postagem em outubro de 2025 em plena tragédia do RS.', 'verified', true, '2025-10-12', 'https://www.metropoles.com/brasil/salles-emergencia-invencao', 'news_article', 5, 'Redes sociais', 'Postagem', 'salles-emergencia-invencao-b144-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ridiculariza reforma do RS durante visita a Porto Alegre.', 'Dois anos depois e ainda tem rua alagada. Falharam de novo.', 'Discurso em ato bolsonarista em Porto Alegre em 2025.', 'verified', true, '2025-05-18', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/05/bolsonaro-poa-ato.html', 'news_article', 4, 'Porto Alegre', 'Ato bolsonarista', 'bolsonaro-poa-ato-2025-b144-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rie, 'Riedel alerta para nova emergência no Pantanal em 2025.', 'O Pantanal continua vulnerável. Preciso de mais recursos.', 'Coletiva em Corumbá em julho de 2025.', 'verified', false, '2025-07-22', 'https://g1.globo.com/ms/mato-grosso-do-sul/noticia/2025/07/22/riedel-pantanal-2025.ghtml', 'news_article', 2, 'Corumbá', 'Coletiva', 'riedel-pantanal-2025-b144-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mme, 'Mauro Mendes volta a minimizar incêndios em 2025.', 'Ano chuvoso no Pantanal é ano bom. E tivemos.', 'Entrevista em Cuiabá em agosto de 2025.', 'verified', false, '2025-08-15', 'https://g1.globo.com/mt/mato-grosso/noticia/2025/08/15/mendes-pantanal-chuvoso.ghtml', 'news_article', 4, 'Cuiabá', 'Entrevista', 'mendes-pantanal-chuvoso-b144-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, false FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cam, 'Gladson Cameli decreta emergência por fumaça no Acre em 2024.', 'Rio Branco está engasgada. Precisamos de resposta.', 'Decreto em setembro de 2024 com fumaça encobrindo Acre.', 'verified', false, '2024-09-12', 'https://g1.globo.com/ac/acre/noticia/2024/09/12/cameli-fumaca.ghtml', 'news_article', 1, 'Rio Branco', 'Decreto', 'cameli-fumaca-b144-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_brd, 'Carlos Brandão pede ajuda federal contra seca no MA.', 'Maranhão enfrenta seca com poucos recursos.', 'Entrevista em São Luís em outubro de 2024.', 'verified', false, '2024-10-04', 'https://g1.globo.com/ma/maranhao/noticia/2024/10/04/brandao-seca-ma.ghtml', 'news_article', 1, 'São Luís', 'Entrevista', 'brandao-seca-ma-b144-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio autoriza operação contra fogo em SP.', 'Vamos atacar o fogo com toda força do Estado.', 'Coletiva em agosto de 2024 sobre queimadas em SP.', 'verified', false, '2024-08-26', 'https://www1.folha.uol.com.br/cotidiano/2024/08/tarcisio-queimadas-sp.shtml', 'news_article', 1, 'São Paulo', 'Coletiva', 'tarcisio-queimadas-sp-b144-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema nega responsabilidade por enchentes no Vale do Rio Doce.', 'Foi ato da natureza. Estado não pode controlar tudo.', 'Entrevista em janeiro de 2025 sobre chuvas em MG.', 'verified', false, '2025-01-14', 'https://g1.globo.com/mg/minas-gerais/noticia/2025/01/14/zema-vale-rio-doce.ghtml', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'zema-vale-rio-doce-b144-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cas, 'Cláudio Castro pede recursos do Fundo Clima para RJ.', 'Nossa encosta precisa de obras. Sem isso, morreremos mais.', 'Entrevista em fevereiro de 2025.', 'verified', false, '2025-02-19', 'https://oglobo.globo.com/rio/noticia/2025/02/19/castro-fundo-clima.ghtml', 'news_article', 1, 'Rio de Janeiro', 'Entrevista', 'castro-fundo-clima-b144-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina vota contra regulação de agrotóxicos pós enchentes.', 'Não tem nada a ver uma coisa com a outra.', 'Discurso no Senado em junho de 2024.', 'verified', false, '2024-06-12', 'https://www12.senado.leg.br/noticias/materias/2024/06/12/tereza-agrotoxicos', 'official_statement', 3, 'Senado Federal', 'Sessão', 'tereza-agrotoxicos-b144-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pte, 'Paulo Teixeira defende que reforma agrária considere clima.', 'Reforma agrária hoje precisa olhar resiliência climática.', 'Entrevista em novembro de 2024.', 'verified', false, '2024-11-20', 'https://www.gov.br/mda/pt-br/noticias/paulo-teixeira-clima-reforma', 'other', 1, 'Brasília', 'Entrevista', 'paulo-teixeira-clima-reforma-b144-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fav, 'Fávaro anuncia recursos para agricultura climática no RS.', 'Rio Grande vai receber novas tecnologias de convivência com eventos extremos.', 'Anúncio em Porto Alegre em março de 2025.', 'verified', false, '2025-03-04', 'https://www.correiodopovo.com.br/noticias/economia/favaro-agro-rs.html', 'news_article', 1, 'Porto Alegre', 'Anúncio', 'favaro-agro-rs-b144-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina denuncia boicote do Congresso à COP30.', 'Estão tentando sabotar o Brasil na presidência da COP30.', 'Entrevista em setembro de 2025 sobre PLs que flexibilizam licenciamento.', 'verified', true, '2025-09-22', 'https://valor.globo.com/politica/noticia/2025/09/22/marina-boicote-cop30.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'marina-boicote-cop30-b144-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Lira articula PL do licenciamento express em ano de catástrofes.', 'Licenciamento precisa ser modernizado. Não pode travar o país.', 'Entrevista em julho de 2024 sobre PL 2159.', 'verified', true, '2024-07-24', 'https://www.camara.leg.br/noticias/lira-licenciamento-pl2159', 'official_statement', 4, 'Câmara dos Deputados', 'Entrevista', 'lira-licenciamento-pl-b144-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta articula PL da devastação em 2025.', 'Esse projeto vai destravar o Brasil.', 'Entrevista em maio de 2025 ao Poder360.', 'verified', true, '2025-05-28', 'https://www.poder360.com.br/congresso/hugo-motta-pl-devastacao/', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista', 'hugo-motta-pl-devastacao-b144-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula veta parcialmente PL do licenciamento.', 'Vetei porque atacava a proteção ambiental. Continuamos com regra firme.', 'Coletiva em agosto de 2025 sobre vetos ao PL 2159.', 'verified', true, '2025-08-08', 'https://g1.globo.com/politica/noticia/2025/08/08/lula-vetos-licenciamento.ghtml', 'news_article', 2, 'Brasília', 'Coletiva vetos', 'lula-vetos-licenciamento-b144-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel promete derrubar vetos na Câmara.', 'Vamos derrubar todos esses vetos ideológicos.', 'Entrevista em agosto de 2025.', 'verified', false, '2025-08-12', 'https://www.camara.leg.br/noticias/marcel-derrubar-vetos', 'official_statement', 3, 'Câmara dos Deputados', 'Entrevista', 'marcel-derrubar-vetos-b144-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende marco da devastação como soberania.', 'É questão de soberania.', 'Declaração no Senado em agosto de 2025.', 'verified', true, '2025-08-20', 'https://www12.senado.leg.br/noticias/materias/2025/08/20/randolfe-devastacao', 'official_statement', 3, 'Senado Federal', 'Sessão', 'randolfe-devastacao-b144-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina admite derrota política com aprovação do marco da devastação.', 'É a pior derrota ambiental do Congresso em décadas.', 'Entrevista em julho de 2025.', 'verified', true, '2025-07-17', 'https://valor.globo.com/politica/noticia/2025/07/17/marina-derrota-marco.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'marina-derrota-marco-b144-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão comemora aprovação do PL da Devastação.', 'É um avanço para o Brasil produtor.', 'Declaração no Senado em julho de 2025.', 'verified', false, '2025-07-18', 'https://www12.senado.leg.br/noticias/materias/2025/07/18/mourao-devastacao', 'official_statement', 3, 'Senado Federal', 'Sessão', 'mourao-devastacao-b144-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira denuncia conflito de interesses em marco da devastação.', 'Ruralistas legislando em causa própria. Isso é escândalo.', 'Discurso em junho de 2025.', 'verified', false, '2025-06-11', 'https://www.camara.leg.br/noticias/jandira-conflito-ruralistas', 'official_statement', 2, 'Câmara dos Deputados', 'Sessão', 'jandira-conflito-ruralistas-b144-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton cobra processamento de Salles por negacionismo.', 'Negacionismo climático deveria ter consequência penal.', 'Discurso na Câmara em outubro de 2025.', 'verified', false, '2025-10-22', 'https://www.camara.leg.br/noticias/erika-negacionismo-penal', 'official_statement', 3, 'Câmara dos Deputados', 'Sessão', 'erika-negacionismo-penal-b144-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sme, 'Melo enfrenta nova enchente em outubro de 2025.', 'Estamos mais preparados, mas o volume é inédito de novo.', 'Coletiva em outubro de 2025 em nova cheia.', 'verified', true, '2025-10-10', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/10/melo-nova-enchente.html', 'news_article', 3, 'Porto Alegre', 'Coletiva', 'melo-nova-enchente-b144-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ele, 'Leite cobra responsabilização federal por nova tragédia no RS.', 'O RS não aguenta outra tragédia sem reforço federal.', 'Coletiva em Porto Alegre em outubro de 2025.', 'verified', true, '2025-10-11', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/10/leite-federal-nova-tragedia.html', 'news_article', 2, 'Porto Alegre', 'Coletiva', 'leite-federal-tragedia-2025-b144-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula anuncia programa emergencial em Canoas em outubro de 2025.', 'Não vai faltar recurso para o Rio Grande.', 'Visita a Canoas em 2025 após nova enchente.', 'verified', true, '2025-10-17', 'https://gauchazh.clicrbs.com.br/politica/noticia/2025/10/lula-canoas-2025.html', 'news_article', 1, 'Canoas, RS', 'Visita', 'lula-canoas-2025-b144-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio culpa federal por falta de prevenção.', 'Falta coordenação federal com estados.', 'Entrevista em novembro de 2025.', 'verified', false, '2025-11-05', 'https://www1.folha.uol.com.br/cotidiano/2025/11/tarcisio-federal-prevencao.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'tarcisio-federal-prevencao-b144-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal faz rifa falsa para vítimas do RS em 2025.', 'Mande um Pix para salvar o Rio Grande.', 'Live em outubro de 2025 com esquema duvidoso.', 'verified', true, '2025-10-14', 'https://www.uol.com.br/noticias/2025/10/marcal-rifa-rs.htm', 'news_article', 4, 'Redes sociais', 'Live', 'marcal-rifa-rs-2025-b144-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina abre COP30 em Belém defendendo financiamento climático.', 'O Sul Global precisa de recursos do Norte. É justiça.', 'Discurso de abertura da COP30 em novembro de 2025.', 'verified', true, '2025-11-10', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-cop30-abertura', 'other', 2, 'Belém', 'COP30', 'marina-cop30-abertura-b144-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cobra recursos em discurso na COP30.', 'Sem dinheiro dos ricos, não há transição justa.', 'Discurso em Belém na COP30.', 'verified', true, '2025-11-11', 'https://g1.globo.com/natureza/cop-30/noticia/2025/11/11/lula-cop30-discurso.ghtml', 'news_article', 2, 'Belém', 'COP30', 'lula-cop30-discurso-b144-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ridiculariza COP30 em Belém.', 'COP30 é festa bilionária enquanto brasileiro passa fome.', 'Live em novembro de 2025.', 'verified', true, '2025-11-13', 'https://www.metropoles.com/brasil/bolsonaro-cop30-ridiculariza', 'news_article', 4, 'Redes sociais', 'Live', 'bolsonaro-ridiculariza-cop30-b144-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina conclui COP30 com alerta sobre inação.', 'Se não agirmos agora, não haverá Belém para nossos netos.', 'Discurso de encerramento da COP30 em novembro de 2025.', 'verified', true, '2025-11-22', 'https://www.gov.br/mma/pt-br/assuntos/noticias/marina-cop30-encerramento', 'other', 3, 'Belém', 'COP30', 'marina-cop30-encerramento-b144-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, false FROM ins;

END $$;
