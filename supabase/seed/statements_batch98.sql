-- Batch 98: Bolsonaro government first year (Jan 2019 - Feb 2020)
DO $$
DECLARE
  v_jair UUID; v_edu UUID; v_fla UUID; v_car UUID; v_dam UUID;
  v_mor UUID; v_gue UUID; v_sal UUID; v_mou UUID; v_tcr UUID;
  v_sar UUID; v_col UUID; v_mer UUID; v_mar UUID; v_fel UUID;
  v_mag UUID; v_sil UUID; v_zam UUID; v_dsi UUID; v_kic UUID;
  v_van UUID; v_kim UUID; v_adr UUID; v_tab UUID; v_chi UUID;
  v_jan UUID; v_frx UUID; v_jse UUID; v_gle UUID; v_lul UUID;
  v_dil UUID; v_had UUID; v_tem UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_hom UUID; c_mis UUID; c_mac UUID;
  c_rac UUID; c_xen UUID; c_itr UUID; c_neg UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_int UUID; c_obs UUID; c_ame UUID;
BEGIN
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_gue  FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_sal  FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_tcr  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_sar  FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_col  FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_mer  FROM politicians WHERE slug = 'aloizio-mercadante';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_kic  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_van  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim  FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr  FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_tab  FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_chi  FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_frx  FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_jse  FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lul  FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_tem  FROM politicians WHERE slug = 'michel-temer';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares afirma que "menino veste azul e menina veste rosa" em vídeo de posse.', 'Atenção, atenção! É uma nova era no Brasil: menino veste azul e menina veste rosa.', 'Declaração em vídeo amplamente compartilhado logo após posse no Ministério da Mulher, Família e Direitos Humanos.', 'verified', true, '2019-01-03', 'https://g1.globo.com/politica/noticia/2019/01/03/nova-era-no-brasil-menino-veste-azul-e-menina-veste-rosa-diz-damares-alves.ghtml', 'news_article', 4, 'Brasília', 'Primeiro dia no ministério', 'damares-menino-azul-menina-rosa-b98-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara nazismo a movimento de esquerda em visita a Israel.', 'Não há dúvida, é... O nazismo era um movimento de esquerda.', 'Declaração feita em coletiva no Museu do Holocausto em Jerusalém, contradizendo consenso histórico.', 'verified', true, '2019-04-02', 'https://www1.folha.uol.com.br/mundo/2019/04/bolsonaro-diz-que-nazismo-foi-movimento-de-esquerda-em-visita-a-israel.shtml', 'news_article', 5, 'Jerusalém', 'Visita a Yad Vashem', 'bolsonaro-nazismo-esquerda-israel-b98-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro sugere colocar arame nos portões de hospitais para evitar fraudes no SUS.', 'A gente pensa em botar arame farpado nos portões de hospitais para evitar que pessoas entrem.', 'Fala em conversa com apoiadores em frente ao Palácio da Alvorada sobre combate a "fraudes" no sistema de saúde.', 'verified', true, '2019-08-22', 'https://g1.globo.com/politica/noticia/2019/08/22/bolsonaro-arame-farpado-hospitais.ghtml', 'news_article', 5, 'Palácio da Alvorada', 'Conversa com apoiadores', 'bolsonaro-arame-farpado-hospitais-b98-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro defende pacote anticrime com ampliação de legítima defesa de policiais.', 'O pacote anticrime é a resposta do governo ao crime organizado e à corrupção.', 'Apresentação do projeto de lei anticrime na Câmara dos Deputados.', 'verified', false, '2019-02-04', 'https://www1.folha.uol.com.br/poder/2019/02/moro-apresenta-pacote-anticrime.shtml', 'news_article', 2, 'Ministério da Justiça', 'Lançamento do pacote anticrime', 'moro-pacote-anticrime-b98-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes promete privatizar tudo e reduzir Estado ao mínimo.', 'Vamos privatizar tudo que for possível. O Estado brasileiro é elefantiásico.', 'Apresentação do plano econômico ao mercado financeiro em São Paulo.', 'verified', false, '2019-01-15', 'https://valor.globo.com/brasil/noticia/2019/01/15/guedes-privatizar-tudo.ghtml', 'news_article', 2, 'São Paulo', 'Evento com investidores', 'guedes-privatizar-tudo-b98-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles diz que é preciso "passar a boiada" em meio à pandemia, mas já em 2019 relaxava normas ambientais.', 'A Amazônia é brasileira. A agenda ambiental internacional é uma agenda imposta.', 'Entrevista em que criticava ONGs e o acordo de Paris.', 'verified', false, '2019-03-20', 'https://www1.folha.uol.com.br/ambiente/2019/03/salles-agenda-ambiental-imposta.shtml', 'news_article', 3, 'Brasília', 'Entrevista ao Estadão', 'salles-agenda-imposta-b98-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro sugere "novo AI-5" caso haja radicalização da esquerda.', 'Se a esquerda radicalizar a esse ponto, a resposta pode ser via um novo AI-5.', 'Entrevista ao canal americano Brasil Paralelo causando repercussão internacional.', 'verified', true, '2019-10-31', 'https://g1.globo.com/politica/noticia/2019/10/31/eduardo-bolsonaro-novo-ai-5.ghtml', 'news_article', 5, 'Brasília', 'Entrevista a Brasil Paralelo', 'eduardo-ai5-radicalizacao-b98-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca jornalistas e instituições em série de tuítes do "gabinete do ódio".', 'A imprensa é inimiga do Brasil. Não vão nos calar.', 'Série de tuítes coordenados do núcleo digital do Planalto investigado pela CPMI das Fake News.', 'verified', true, '2019-10-15', 'https://www1.folha.uol.com.br/poder/2019/10/carlos-bolsonaro-gabinete-odio.shtml', 'social_media_post', 4, 'Rio de Janeiro', 'Postagens no Twitter', 'carlos-gabinete-odio-imprensa-b98-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é alvo de investigação da rachadinha no Rio de Janeiro.', 'Não existe rachadinha. Tudo isso é perseguição política contra minha família.', 'Declaração após vazamento do relatório do Coaf apontando movimentações atípicas de Queiroz.', 'verified', true, '2019-01-18', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2019/01/18/flavio-bolsonaro-rachadinha-coaf.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva de imprensa', 'flavio-rachadinha-coaf-b98-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão minimiza ditadura militar e fala em "excessos" de ambos os lados.', 'Houve excessos, sim, mas o regime militar salvou o Brasil do comunismo.', 'Entrevista no Palácio do Jaburu a jornalistas estrangeiros.', 'verified', false, '2019-03-31', 'https://www1.folha.uol.com.br/poder/2019/03/mourao-ditadura-excessos.shtml', 'news_article', 3, 'Palácio do Jaburu', 'Entrevista a correspondentes', 'mourao-ditadura-excessos-b98-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro determina comemorações do golpe militar de 1964.', 'Eu determinei ao ministro da Defesa que faça as devidas comemorações do dia 31 de março de 1964.', 'Declaração do porta-voz do Planalto confirmando ordem presidencial para celebrar o golpe.', 'verified', true, '2019-03-25', 'https://g1.globo.com/politica/noticia/2019/03/25/bolsonaro-determina-comemoracao-31-marco.ghtml', 'news_article', 5, 'Palácio do Planalto', 'Comunicado da Secretaria de Comunicação', 'bolsonaro-comemoracao-golpe-1964-b98-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares relata visão de Jesus em goiabeira durante discurso em igreja.', 'Jesus apareceu para mim numa goiabeira e me disse: "Você vai abortar o aborto no Brasil".', 'Pregação em igreja evangélica compartilhada em vídeo viral.', 'verified', true, '2019-01-21', 'https://www1.folha.uol.com.br/poder/2019/01/damares-jesus-goiabeira.shtml', 'news_article', 3, 'Igreja Batista', 'Pregação evangélica', 'damares-jesus-goiabeira-b98-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro assina decreto facilitando posse de armas de fogo.', 'Agora o cidadão de bem vai poder se defender. Armas nas mãos de quem merece.', 'Cerimônia de assinatura do decreto 9.685/2019 que flexibilizou posse de armas.', 'verified', true, '2019-01-15', 'https://g1.globo.com/politica/noticia/2019/01/15/bolsonaro-assina-decreto-posse-armas.ghtml', 'news_article', 3, 'Palácio do Planalto', 'Assinatura de decreto', 'bolsonaro-decreto-posse-armas-b98-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama imprensa de "canalha" após reportagem do Intercept.', 'Esse site lá é um site canalha. Essa imprensa vagabunda deveria ser banida.', 'Reação às reportagens da Vaza Jato publicadas pelo Intercept Brasil.', 'verified', true, '2019-06-10', 'https://g1.globo.com/politica/noticia/2019/06/10/bolsonaro-chama-imprensa-canalha.ghtml', 'news_article', 3, 'Palácio da Alvorada', 'Declaração à imprensa', 'bolsonaro-imprensa-canalha-intercept-b98-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Folha é "o maior fake news do Brasil".', 'A Folha de S.Paulo é o maior fake news do Brasil. Não compro, não leio, não patrocino.', 'Declaração na porta do Alvorada quando questionado sobre reportagens sobre Queiroz.', 'verified', true, '2019-08-15', 'https://www1.folha.uol.com.br/poder/2019/08/bolsonaro-folha-fake-news.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-folha-fake-news-b98-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles ataca pesquisadores do Inpe sobre dados de desmatamento.', 'Os dados do Inpe são mentirosos. Estão a serviço de uma agenda contra o Brasil.', 'Coletiva após divulgação de dados que mostravam alta de 88% no desmatamento em julho de 2019.', 'verified', true, '2019-07-19', 'https://g1.globo.com/natureza/noticia/2019/07/19/salles-ataca-inpe-desmatamento.ghtml', 'news_article', 4, 'Ministério do Meio Ambiente', 'Coletiva sobre desmatamento', 'salles-ataque-inpe-desmatamento-b98-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro demite diretor do Inpe após divulgação de dados do desmatamento.', 'Esse Ricardo Galvão está a serviço de quem? Ele foi demitido.', 'Declaração após polêmica com dados de desmatamento e crítica pública do diretor do Inpe.', 'verified', true, '2019-08-02', 'https://www1.folha.uol.com.br/ambiente/2019/08/bolsonaro-demite-galvao-inpe.shtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-demissao-galvao-inpe-b98-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro acusa ONGs de atearem fogo na Amazônia sem apresentar provas.', 'Pode ser que as ONGs estejam ateando fogo para chamar a atenção do mundo.', 'Declaração em meio às queimadas recordes na Amazônia em agosto de 2019.', 'verified', true, '2019-08-21', 'https://g1.globo.com/politica/noticia/2019/08/21/bolsonaro-acusa-ongs-queimadas.ghtml', 'news_article', 4, 'Brasília', 'Transmissão ao vivo', 'bolsonaro-ongs-queimadas-amazonia-b98-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz comentário machista sobre a esposa de Macron.', 'Não humilha, cara. Kkkk.', 'Curtida e comentário em postagem que comparava aparência das primeiras-damas brasileira e francesa.', 'verified', true, '2019-08-25', 'https://www1.folha.uol.com.br/mundo/2019/08/bolsonaro-brigitte-macron.shtml', 'social_media_post', 3, 'Facebook', 'Postagem em rede social', 'bolsonaro-macron-brigitte-b98-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que igrejas serão "varredouro" do Estado mínimo.', 'As igrejas vão cuidar do que o Estado não consegue. Vamos devolver a família ao centro.', 'Discurso em evento evangélico em Brasília.', 'verified', false, '2019-03-08', 'https://g1.globo.com/politica/noticia/2019/03/08/damares-igrejas-estado-minimo.ghtml', 'news_article', 3, 'Brasília', 'Culto evangélico', 'damares-igrejas-estado-minimo-b98-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes chama funcionalismo público de "parasita".', 'Tem muito parasita no serviço público que não produz nada.', 'Evento com empresários sobre reforma administrativa.', 'verified', true, '2019-05-22', 'https://www1.folha.uol.com.br/mercado/2019/05/guedes-funcionario-parasita.shtml', 'news_article', 3, 'São Paulo', 'Evento com empresários', 'guedes-funcionario-parasita-b98-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comenta "fake news" sobre mulher ao criticar jornalista.', 'Ele não pode levar uma chamada de "presidente é maricas"?', 'Resposta ao jornalista Laurindo Lalo Leal Filho em coletiva.', 'verified', true, '2019-11-08', 'https://g1.globo.com/politica/noticia/2019/11/08/bolsonaro-maricas-jornalista.ghtml', 'news_article', 3, 'Brasília', 'Coletiva no Alvorada', 'bolsonaro-maricas-jornalista-b98-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Amazônia "não é nossa", contradizendo soberania.', 'A Amazônia é nossa. Mas precisamos explorar.', 'Coletiva após declaração controversa sobre internacionalização.', 'verified', false, '2019-09-05', 'https://g1.globo.com/politica/noticia/2019/09/05/bolsonaro-amazonia-explorar.ghtml', 'news_article', 2, 'Brasília', 'Declaração à imprensa', 'bolsonaro-amazonia-exploracao-b98-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama repórter de "veado" em coletiva.', 'Que cara de veado que você tem.', 'Pergunta feita ao repórter durante coletiva no Alvorada.', 'verified', true, '2019-06-27', 'https://www1.folha.uol.com.br/poder/2019/06/bolsonaro-cara-veado-reporter.shtml', 'news_article', 4, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-cara-veado-reporter-b98-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro anuncia Operação Hashtag contra crime cibernético.', 'A segurança nacional depende de enfrentar também o crime digital.', 'Lançamento de operação da PF sobre crimes na internet.', 'verified', false, '2019-05-10', 'https://www1.folha.uol.com.br/poder/2019/05/moro-operacao-hashtag.shtml', 'news_article', 1, 'Ministério da Justiça', 'Coletiva de lançamento', 'moro-operacao-hashtag-b98-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica STF e diz que "quem manda sou eu".', 'Quem manda no país sou eu. O STF tem que se limitar a interpretar a lei.', 'Declaração após decisões do STF contra pautas do governo.', 'verified', true, '2019-10-18', 'https://g1.globo.com/politica/noticia/2019/10/18/bolsonaro-quem-manda-sou-eu.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-quem-manda-sou-eu-b98-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro é indicado pelo pai para embaixada em Washington.', 'Meu filho Eduardo é a pessoa certa para Washington. Tem experiência com Trump.', 'Anúncio da indicação que gerou controvérsia sobre nepotismo diplomático.', 'verified', true, '2019-07-11', 'https://www1.folha.uol.com.br/poder/2019/07/eduardo-embaixador-washington.shtml', 'news_article', 4, 'Brasília', 'Anúncio presidencial', 'eduardo-embaixador-washington-b98-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que a Lava Jato "acabou" ao comentar operação.', 'A Lava Jato para mim acabou, porque não tem mais corrupção no governo.', 'Declaração a apoiadores na porta do Palácio.', 'verified', true, '2019-10-02', 'https://g1.globo.com/politica/noticia/2019/10/02/bolsonaro-lava-jato-acabou.ghtml', 'news_article', 3, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-lava-jato-acabou-b98-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr  , 'Tereza Cristina defende liberação recorde de agrotóxicos.', 'O Brasil precisa produzir. Os agrotóxicos estão dentro dos padrões mundiais.', 'Resposta às críticas sobre a liberação de mais de 200 defensivos em 2019.', 'verified', false, '2019-05-14', 'https://g1.globo.com/economia/agronegocios/noticia/2019/05/14/tereza-cristina-agrotoxicos.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'tcristina-agrotoxicos-liberacao-b98-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica Marielle e insinua ligação com milícia.', 'O Marcelo Freixo é ligado a quem? A Marielle morreu por quê? Falem a verdade.', 'Declaração em live semanal no Facebook.', 'verified', true, '2019-10-30', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-marielle-milicia.shtml', 'social_media_post', 4, 'Facebook Live', 'Live semanal', 'bolsonaro-marielle-insinuacao-b98-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares nega aborto em caso de estupro de criança de 10 anos.', 'O aborto é violência contra uma vida. Precisamos proteger as duas vidas.', 'Declaração após caso de menina de 10 anos vítima de estupro.', 'verified', true, '2020-02-20', 'https://g1.globo.com/politica/noticia/2020/02/20/damares-aborto-estupro-crianca.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'damares-aborto-estupro-crianca-b98-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro diz que democracia "do jeito que está não funciona".', 'Do jeito que está, pelo voto e pela democracia, a gente não vai conseguir mudar o Brasil no ritmo que todos querem.', 'Tuíte após derrota do governo na votação de um projeto na Câmara.', 'verified', true, '2019-09-24', 'https://g1.globo.com/politica/noticia/2019/09/24/carlos-bolsonaro-democracia-nao-funciona.ghtml', 'social_media_post', 5, 'Twitter', 'Postagem em rede social', 'carlos-democracia-nao-funciona-b98-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comenta "micos" em viagem a Davos.', 'Não viemos aqui pagar mico. Viemos mostrar o Brasil aos investidores.', 'Declaração no Fórum Econômico Mundial em janeiro de 2019.', 'verified', false, '2019-01-22', 'https://www1.folha.uol.com.br/mercado/2019/01/bolsonaro-davos-investidores.shtml', 'news_article', 1, 'Davos, Suíça', 'Fórum Econômico Mundial', 'bolsonaro-davos-investidores-b98-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz na ONU que Amazônia "não é patrimônio da humanidade".', 'A Amazônia não é patrimônio da humanidade e nem é o pulmão do mundo.', 'Discurso na abertura da 74ª Assembleia Geral da ONU.', 'verified', true, '2019-09-24', 'https://g1.globo.com/mundo/noticia/2019/09/24/bolsonaro-onu-amazonia.ghtml', 'speech', 3, 'Nova York, ONU', 'Assembleia Geral da ONU', 'bolsonaro-onu-amazonia-b98-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli ataca professores e chama universidades de "focos de doutrinação".', 'As universidades brasileiras são focos de doutrinação esquerdista. Vamos acabar com isso.', 'Discurso em plenário da Câmara.', 'verified', false, '2019-04-30', 'https://www1.folha.uol.com.br/educacao/2019/04/zambelli-universidades-doutrinacao.shtml', 'speech', 3, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'zambelli-universidades-doutrinacao-b98-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis defende redução da maioridade penal para 14 anos.', 'Bandido de 14 anos tem que ir preso. Chega de esconder nome, chega de impunidade.', 'Defesa da PEC na CCJ da Câmara.', 'verified', false, '2019-06-05', 'https://g1.globo.com/politica/noticia/2019/06/05/bia-kicis-maioridade-penal.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Sessão da CCJ', 'bia-kicis-maioridade-14-b98-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira grava vídeo ameaçando ministros do STF.', 'Os ministros do STF estão cometendo um crime contra a democracia.', 'Vídeo gravado na porta do STF em meio à tensão entre poderes.', 'verified', true, '2020-02-12', 'https://www1.folha.uol.com.br/poder/2020/02/silveira-ameaca-stf.shtml', 'social_media_post', 4, 'Brasília', 'Vídeo postado nas redes', 'silveira-ameaca-stf-b98-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Marco Feliciano ataca comunidade LGBT em discurso na Câmara.', 'A família tradicional está sob ataque. Ideologia de gênero não passará.', 'Discurso em plenário sobre currículo escolar.', 'verified', false, '2019-03-27', 'https://g1.globo.com/politica/noticia/2019/03/27/feliciano-ideologia-genero.ghtml', 'speech', 3, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'feliciano-ideologia-genero-b98-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende ensino religioso obrigatório e "cura gay".', 'Deus cura, sim. Quem quiser deixar de ser homossexual, Jesus cura.', 'Entrevista em programa religioso.', 'verified', false, '2019-05-20', 'https://www1.folha.uol.com.br/poder/2019/05/magno-malta-cura-gay.shtml', 'news_article', 4, 'TV evangélica', 'Entrevista em programa religioso', 'magno-malta-cura-gay-b98-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_itr, false FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua que jornalistas da Folha queriam "dar" para ele.', 'Você não vai me pegar. Não sou desses. Tem muito jornalista que queria dar pra mim.', 'Resposta grosseira a pergunta de jornalista da Folha.', 'verified', true, '2019-12-20', 'https://g1.globo.com/politica/noticia/2019/12/20/bolsonaro-jornalista-folha.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-jornalista-folha-insinuacao-b98-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes diz que empregada indo à Disney é "farra" do câmbio baixo.', 'Tinha empregada doméstica indo para a Disney, uma festa danada.', 'Declaração em evento sobre a alta do dólar.', 'verified', true, '2020-02-05', 'https://g1.globo.com/economia/noticia/2020/02/05/guedes-empregada-disney.ghtml', 'news_article', 4, 'Brasília', 'Evento em seminário', 'guedes-empregada-disney-b98-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que avô era "indolente" ao falar de indígenas.', 'Nós herdamos da parte indígena a indolência e da parte africana, a malandragem.', 'Entrevista em que repete estereótipo racista.', 'verified', true, '2019-01-06', 'https://www1.folha.uol.com.br/poder/2019/01/mourao-indigenas-indolencia.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'mourao-indigenas-indolencia-b98-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "não vai se meter" em caso do filho Flávio.', 'Eu não vou me meter. Se o Flávio errou, que ele pague.', 'Declaração ao ser questionado sobre rachadinha.', 'verified', false, '2019-02-10', 'https://www1.folha.uol.com.br/poder/2019/02/bolsonaro-flavio-rachadinha.shtml', 'news_article', 2, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-flavio-rachadinha-b98-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney critica ataques de Bolsonaro à Nova República.', 'Estamos vivendo um retrocesso institucional sem precedentes desde 1988.', 'Declaração em entrevista ao Globo.', 'verified', false, '2019-04-02', 'https://oglobo.globo.com/politica/sarney-retrocesso-institucional-23567890', 'news_article', 1, 'Brasília', 'Entrevista ao Globo', 'sarney-retrocesso-institucional-b98-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende Bolsonaro no Senado e ataca mídia.', 'A imprensa não dá trégua a um governo eleito pelo povo.', 'Pronunciamento em plenário do Senado.', 'verified', false, '2019-06-12', 'https://www12.senado.leg.br/noticias/2019/06/collor-defesa-bolsonaro', 'speech', 1, 'Senado Federal', 'Pronunciamento em plenário', 'collor-defende-bolsonaro-b98-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante critica desmonte de políticas sociais pelo governo.', 'O Brasil está desmontando, peça por peça, a rede de proteção social.', 'Entrevista após cortes em programas sociais.', 'verified', false, '2019-05-15', 'https://www1.folha.uol.com.br/poder/2019/05/mercadante-desmonte-social.shtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'mercadante-desmonte-social-b98-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy critica pacote anti-aborto de Damares.', 'A ministra transforma crença pessoal em política pública. Isso é inaceitável.', 'Entrevista no contexto do debate sobre aborto.', 'verified', false, '2019-03-15', 'https://g1.globo.com/politica/noticia/2019/03/15/marta-critica-damares-aborto.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista à rádio', 'marta-critica-damares-aborto-b98-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende uso de recursos públicos em ação religiosa.', 'A bancada evangélica vai garantir que os valores cristãos prevaleçam no orçamento.', 'Reunião da bancada evangélica na Câmara.', 'verified', false, '2019-02-26', 'https://www1.folha.uol.com.br/poder/2019/02/silas-camara-bancada-evangelica.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Reunião de bancada', 'silas-camara-bancada-evangelica-b98-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem defende reforma da Previdência em plenário.', 'Quem não quer reforma é quem vive do Estado. A reforma salvará o Brasil.', 'Pronunciamento em plenário em defesa da PEC.', 'verified', false, '2019-07-10', 'https://g1.globo.com/politica/noticia/2019/07/10/van-hattem-defende-previdencia.ghtml', 'speech', 1, 'Câmara dos Deputados', 'Discurso sobre a Previdência', 'van-hattem-previdencia-b98-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende teto de gastos mesmo em crise.', 'Sem teto de gastos, o Brasil volta à inflação dos anos 80.', 'Entrevista sobre política fiscal.', 'verified', false, '2019-08-20', 'https://www1.folha.uol.com.br/mercado/2019/08/kim-kataguiri-teto-gastos.shtml', 'news_article', 1, 'Brasília', 'Entrevista', 'kim-teto-gastos-b98-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura defende revisão da Lei Maria da Penha.', 'A Maria da Penha tem falhas que precisam ser corrigidas.', 'Declaração em audiência pública sobre violência contra mulher.', 'verified', false, '2019-09-10', 'https://g1.globo.com/politica/noticia/2019/09/10/ventura-lei-maria-penha.ghtml', 'news_article', 2, 'Câmara dos Deputados', 'Audiência pública', 'ventura-maria-da-penha-b98-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral critica cortes na educação.', 'Cortar o MEC é atentar contra o futuro do Brasil.', 'Discurso em plenário contra bloqueio de R$ 6 bilhões na Educação.', 'verified', false, '2019-05-06', 'https://g1.globo.com/politica/noticia/2019/05/06/tabata-critica-cortes-educacao.ghtml', 'speech', 1, 'Câmara dos Deputados', 'Pronunciamento em plenário', 'tabata-cortes-educacao-b98-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar critica militarização do governo.', 'Nunca tivemos tantos militares em cargos civis desde a ditadura.', 'Entrevista à Carta Capital.', 'verified', false, '2019-08-25', 'https://www.cartacapital.com.br/politica/chico-alencar-militarizacao/', 'news_article', 1, 'Rio de Janeiro', 'Entrevista à Carta Capital', 'chico-alencar-militarizacao-b98-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali critica Damares e ameaças ao SUS.', 'O SUS está sendo desmontado enquanto Damares prega moralismo.', 'Pronunciamento em plenário sobre saúde.', 'verified', false, '2019-06-18', 'https://www.cartacapital.com.br/politica/jandira-sus-damares/', 'speech', 1, 'Câmara dos Deputados', 'Discurso em plenário', 'jandira-critica-sus-damares-b98-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo denuncia ameaças de milícia após citações de Bolsonaro.', 'Depois de ser citado pelo presidente, recebi ameaças de milicianos.', 'Entrevista ao Globo após Bolsonaro ter feito insinuações.', 'verified', true, '2019-11-01', 'https://oglobo.globo.com/politica/freixo-ameacas-milicia-bolsonaro-23612345', 'news_article', 3, 'Rio de Janeiro', 'Entrevista ao Globo', 'freixo-ameacas-milicia-b98-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jse, 'José Serra defende reforma tributária moderada.', 'A reforma tributária precisa ser gradual e pactuada.', 'Entrevista sobre proposta econômica.', 'verified', false, '2019-10-08', 'https://valor.globo.com/politica/noticia/2019/10/08/serra-reforma-tributaria.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista ao Valor', 'serra-reforma-tributaria-b98-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann denuncia escalada autoritária.', 'Bolsonaro tenta militarizar o país e fragilizar as instituições.', 'Entrevista à rádio após declarações do presidente sobre o STF.', 'verified', false, '2019-10-20', 'https://www1.folha.uol.com.br/poder/2019/10/gleisi-militarizacao.shtml', 'news_article', 1, 'Brasília', 'Entrevista à rádio', 'gleisi-militarizacao-b98-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula é solto após decisão do STF sobre prisão em 2ª instância.', 'Eu nunca deveria ter sido preso. Agora vou cobrar a conta desse país.', 'Declaração ao deixar a sede da PF em Curitiba.', 'verified', true, '2019-11-08', 'https://g1.globo.com/pr/parana/noticia/2019/11/08/lula-solto-curitiba.ghtml', 'speech', 1, 'Curitiba', 'Saída da PF', 'lula-solto-curitiba-b98-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma critica governo e defende investigação sobre Moro.', 'A Vaza Jato mostra que Moro trabalhou contra a justiça, não a favor.', 'Entrevista após vazamentos do Intercept.', 'verified', false, '2019-06-14', 'https://www1.folha.uol.com.br/poder/2019/06/dilma-moro-vaza-jato.shtml', 'news_article', 1, 'Porto Alegre', 'Entrevista', 'dilma-moro-vaza-jato-b98-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad denuncia ataques à democracia no primeiro ano de Bolsonaro.', 'Nunca vimos tantas ameaças às instituições num só ano.', 'Palestra em universidade sobre o governo Bolsonaro.', 'verified', false, '2019-12-05', 'https://www1.folha.uol.com.br/poder/2019/12/haddad-ataques-democracia.shtml', 'speech', 1, 'São Paulo', 'Palestra na USP', 'haddad-ataques-democracia-b98-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer defende ampla frente democrática contra ataques a instituições.', 'As instituições precisam ser preservadas. Não podemos normalizar ataques.', 'Discurso em evento jurídico.', 'verified', false, '2019-08-14', 'https://valor.globo.com/politica/noticia/2019/08/14/temer-defesa-instituicoes.ghtml', 'news_article', 1, 'São Paulo', 'Evento jurídico', 'temer-defesa-instituicoes-b98-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz gesto obsceno e diz "imagina se encher" sobre chuva dourada.', 'Imagina se encher a boca... Quem quiser colocar, coloca.', 'Resposta a pergunta sobre vídeo de Carnaval postado no Twitter oficial.', 'verified', true, '2019-03-06', 'https://g1.globo.com/politica/noticia/2019/03/06/bolsonaro-chuva-dourada-carnaval.ghtml', 'social_media_post', 4, 'Brasília', 'Postagem em rede social', 'bolsonaro-chuva-dourada-carnaval-b98-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro manda repórter "calar a boca" em coletiva.', 'Cala a boca, cara. Você só pergunta bobagem.', 'Reação agressiva a jornalista que o questionou sobre Queiroz.', 'verified', true, '2019-10-01', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-cala-a-boca-jornalista.shtml', 'news_article', 3, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-cala-a-boca-reporter-b98-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada sobre turismo gay no Brasil.', 'Se você quiser vir aqui fazer sexo com uma mulher, fique à vontade.', 'Declaração em coletiva sobre turismo, causando repercussão internacional.', 'verified', true, '2019-04-25', 'https://g1.globo.com/politica/noticia/2019/04/25/bolsonaro-turismo-gay.ghtml', 'news_article', 4, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-turismo-gay-b98-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles minimiza vazamento de óleo no Nordeste.', 'O óleo não é brasileiro. Estamos investigando. O governo está fazendo o que pode.', 'Coletiva após derramamento que atingiu praias de nove estados do Nordeste.', 'verified', true, '2019-10-25', 'https://g1.globo.com/natureza/noticia/2019/10/25/salles-oleo-nordeste.ghtml', 'news_article', 4, 'Brasília', 'Coletiva sobre vazamento', 'salles-oleo-nordeste-b98-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende Coaf sob Moro e depois muda posição.', 'O Coaf fica onde o presidente quiser. Eu quero com Moro.', 'Declaração após STF tirar Coaf da Justiça; posteriormente Bolsonaro retirou.', 'verified', false, '2019-07-23', 'https://www1.folha.uol.com.br/mercado/2019/07/bolsonaro-coaf-moro.shtml', 'news_article', 2, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-coaf-moro-b98-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca OAB e diz que ela "não serve para nada".', 'A OAB não serve para nada. É uma entidade que fica atrapalhando.', 'Declaração em evento com apoiadores em Brasília.', 'verified', true, '2019-05-28', 'https://g1.globo.com/politica/noticia/2019/05/28/bolsonaro-ataca-oab.ghtml', 'news_article', 3, 'Brasília', 'Evento com apoiadores', 'bolsonaro-ataca-oab-b98-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende decreto que afrouxa controle de armas.', 'Armas nas mãos dos cidadãos de bem vão reduzir violência.', 'Defesa do decreto 9.847/2019 sobre armamento.', 'verified', false, '2019-06-25', 'https://g1.globo.com/politica/noticia/2019/06/25/bolsonaro-decreto-armas-9847.ghtml', 'news_article', 3, 'Brasília', 'Assinatura de decreto', 'bolsonaro-decreto-armas-9847-b98-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro posa com camiseta do Mossad em visita aos EUA.', 'Adorei a camiseta. Um símbolo da luta contra o terrorismo.', 'Foto publicada em redes após visita a Steve Bannon.', 'verified', false, '2019-03-10', 'https://www1.folha.uol.com.br/poder/2019/03/eduardo-mossad-bannon.shtml', 'social_media_post', 2, 'Washington, EUA', 'Visita a Steve Bannon', 'eduardo-mossad-bannon-b98-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro organiza gabinete do ódio no Planalto, aponta CPMI.', 'Imprensa é câncer. Vou acabar com esses picaretas.', 'Postagens que seriam provas da atuação do "gabinete do ódio" segundo CPMI das Fake News.', 'verified', true, '2019-11-20', 'https://g1.globo.com/politica/noticia/2019/11/20/carlos-bolsonaro-gabinete-odio-cpmi.ghtml', 'social_media_post', 4, 'Brasília', 'Postagens investigadas', 'carlos-gabinete-odio-cpmi-b98-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro tenta obter foro privilegiado para escapar de investigação.', 'Como senador, tenho direito ao foro. A Justiça do Rio não tem competência.', 'Pedido apresentado pela defesa do senador no STJ.', 'verified', true, '2019-02-22', 'https://www1.folha.uol.com.br/poder/2019/02/flavio-foro-privilegiado-stj.shtml', 'news_article', 4, 'Brasília', 'Pedido no STJ', 'flavio-foro-privilegiado-b98-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que "minoria tem que se curvar à maioria".', 'As minorias têm que se adequar às maiorias. Ou simplesmente desaparecem.', 'Declaração durante palestra no Clube Hebraica nos EUA em março de 2019.', 'verified', true, '2019-03-03', 'https://g1.globo.com/politica/noticia/2019/03/03/bolsonaro-minoria-curvar-maioria.ghtml', 'speech', 5, 'Washington, EUA', 'Palestra para empresários', 'bolsonaro-minoria-curvar-maioria-b98-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares critica ONU e diz que o Brasil não vai aceitar "orientações" estrangeiras.', 'O Brasil não é refém de ONU nenhuma em temas de família.', 'Fala em Genebra no Conselho de Direitos Humanos.', 'verified', true, '2019-02-25', 'https://g1.globo.com/politica/noticia/2019/02/25/damares-onu-familia.ghtml', 'speech', 3, 'Genebra, Suíça', 'Conselho de Direitos Humanos da ONU', 'damares-onu-familia-b98-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que 8 de Março é "dia de reclamação da mulher".', 'Feliz dia às mulheres que não ficam reclamando o tempo todo.', 'Post nas redes sociais no Dia Internacional da Mulher.', 'verified', true, '2019-03-08', 'https://www1.folha.uol.com.br/poder/2019/03/bolsonaro-8-marco-mulher.shtml', 'social_media_post', 3, 'Twitter', 'Postagem no Dia da Mulher', 'bolsonaro-8-marco-reclamacao-b98-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "mulher tem salário menor por engravidar".', 'A mulher ganha menos porque fica grávida. É natural.', 'Declaração em palestra para empresários.', 'verified', true, '2019-08-01', 'https://g1.globo.com/politica/noticia/2019/08/01/bolsonaro-mulher-salario-gravidez.ghtml', 'speech', 4, 'São Paulo', 'Palestra a empresários', 'bolsonaro-mulher-salario-gravidez-b98-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende Amazônia na ONU e contradiz Bolsonaro.', 'A Amazônia é uma preocupação de todos. Cuidamos dela para o mundo.', 'Discurso na ONU após crise das queimadas.', 'verified', false, '2019-09-26', 'https://www1.folha.uol.com.br/ambiente/2019/09/mourao-onu-amazonia.shtml', 'speech', 1, 'Nova York, ONU', 'Assembleia Geral', 'mourao-onu-amazonia-b98-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara cacique Raoni a "peça" do cenário internacional.', 'O cacique Raoni não é o nosso líder. Esse povo tá sendo usado.', 'Resposta a questionamentos sobre críticas internacionais à sua política indígena.', 'verified', true, '2019-08-29', 'https://g1.globo.com/politica/noticia/2019/08/29/bolsonaro-raoni-peca.ghtml', 'news_article', 3, 'Brasília', 'Entrevista à rádio', 'bolsonaro-raoni-peca-b98-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que indígena "cada vez mais é um ser humano".', 'O índio está evoluindo, cada vez mais é um ser humano igual a nós.', 'Transmissão em live no Facebook sobre política indigenista.', 'verified', true, '2020-01-23', 'https://g1.globo.com/politica/noticia/2020/01/23/bolsonaro-indio-ser-humano.ghtml', 'social_media_post', 5, 'Facebook Live', 'Live semanal', 'bolsonaro-indio-ser-humano-b98-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles reúne-se com madeireiros e libera exploração na Amazônia.', 'O setor madeireiro é parceiro da preservação. Vamos desburocratizar.', 'Encontro em Brasília com representantes do setor.', 'verified', false, '2019-11-15', 'https://g1.globo.com/natureza/noticia/2019/11/15/salles-reuniao-madeireiros.ghtml', 'news_article', 3, 'Brasília', 'Reunião com madeireiros', 'salles-madeireiros-reuniao-b98-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "não tem que desculpa" sobre escravidão.', 'Não tem nada que me desculpar. Não fui eu. Eu sou branco. Fui descendente de italianos.', 'Resposta à pergunta sobre reparação histórica para descendentes de escravizados.', 'verified', true, '2019-11-28', 'https://www1.folha.uol.com.br/poder/2019/11/bolsonaro-desculpa-escravidao.shtml', 'news_article', 4, 'Nova Délhi, Índia', 'Coletiva em visita oficial', 'bolsonaro-desculpa-escravidao-b98-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama Greta Thunberg de "pirralha".', 'É impressionante como a imprensa dá espaço para uma pirralha desse tipo.', 'Reação à declaração de Greta Thunberg sobre mortes de indígenas no Brasil.', 'verified', true, '2019-12-10', 'https://g1.globo.com/politica/noticia/2019/12/10/bolsonaro-greta-pirralha.ghtml', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-greta-pirralha-b98-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro rebate Vaza Jato e defende atuação como juiz.', 'Não há nada de errado nas mensagens. É manipulação descontextualizada.', 'Defesa pública após o Intercept divulgar conversas com Deltan Dallagnol.', 'verified', true, '2019-06-10', 'https://g1.globo.com/politica/noticia/2019/06/10/moro-vaza-jato-defesa.ghtml', 'news_article', 4, 'Brasília', 'Coletiva de imprensa', 'moro-vaza-jato-defesa-b98-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes diz que aposentados "vivem muito" e oneram previdência.', 'O brasileiro está vivendo demais. Precisamos ajustar.', 'Audiência na Câmara sobre reforma da Previdência.', 'verified', true, '2019-04-03', 'https://www1.folha.uol.com.br/mercado/2019/04/guedes-aposentados-vivem-muito.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Audiência pública', 'guedes-aposentados-vivem-muito-b98-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça sair da ONU por resoluções de direitos humanos.', 'Se não nos respeitarem, saímos da ONU e da OMS, sim.', 'Declaração após votação desfavorável ao governo em comissão da ONU.', 'verified', true, '2020-01-08', 'https://www1.folha.uol.com.br/mundo/2020/01/bolsonaro-ameaca-sair-onu.shtml', 'news_article', 4, 'Brasília', 'Declaração à imprensa', 'bolsonaro-ameaca-sair-onu-b98-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli diz que esquerda "quer destruir a família".', 'A esquerda quer destruir a família brasileira com essa agenda de gênero.', 'Discurso em plenário contra projeto educacional.', 'verified', false, '2019-06-28', 'https://www1.folha.uol.com.br/educacao/2019/06/zambelli-esquerda-familia.shtml', 'speech', 3, 'Câmara dos Deputados', 'Plenário', 'zambelli-esquerda-familia-b98-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis propõe voto impresso e ataca urnas eletrônicas.', 'As urnas eletrônicas são fraudáveis. Precisamos do voto impresso.', 'Discurso no plenário defendendo PEC do voto impresso.', 'verified', true, '2019-09-17', 'https://g1.globo.com/politica/noticia/2019/09/17/bia-kicis-voto-impresso.ghtml', 'speech', 4, 'Câmara dos Deputados', 'Plenário', 'bia-kicis-voto-impresso-b98-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega femininicídio ao falar sobre violência contra mulher.', 'Não tem essa de feminicídio. Mulher morre porque tem briga entre o casal.', 'Declaração em evento com apoiadores.', 'verified', true, '2019-03-12', 'https://g1.globo.com/politica/noticia/2019/03/12/bolsonaro-feminicidio-casal.ghtml', 'news_article', 4, 'Brasília', 'Evento com apoiadores', 'bolsonaro-feminicidio-casal-b98-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é alvo de operação da PF sobre rachadinha.', 'Isso é perseguição política contra a família do presidente.', 'Reação à operação Furna da Onça no Rio.', 'verified', true, '2019-12-19', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2019/12/19/flavio-operacao-furna-onca.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva após operação', 'flavio-furna-da-onca-b98-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares nega desmonte de conselhos de direitos humanos.', 'Não estamos desmontando. Estamos reorganizando para dar eficiência.', 'Coletiva após extinção de diversos conselhos por decreto.', 'verified', false, '2019-04-11', 'https://g1.globo.com/politica/noticia/2019/04/11/damares-desmonte-conselhos.ghtml', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'damares-desmonte-conselhos-b98-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro dá "gazela" da segurança à família em evento polêmico.', 'Meu filho vai, sim, passar bem nos EUA. Não é nepotismo, é vocação.', 'Defesa da indicação de Eduardo para embaixada.', 'verified', false, '2019-07-15', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-eduardo-nepotismo.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-eduardo-nepotismo-defesa-b98-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica universidades e quer "expurgar" marxismo.', 'Vamos expurgar o marxismo das universidades. Aulas gratuitas para quem paga imposto.', 'Declaração em entrevista sobre política educacional.', 'verified', true, '2019-04-26', 'https://g1.globo.com/educacao/noticia/2019/04/26/bolsonaro-expurgar-marxismo.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-expurgar-marxismo-b98-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende governo em crise por queimadas.', 'O Brasil é líder mundial em preservação. Não aceitamos lições.', 'Entrevista após Cúpula do G7 criticar a Amazônia.', 'verified', false, '2019-08-26', 'https://www1.folha.uol.com.br/ambiente/2019/08/mourao-g7-amazonia.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'mourao-g7-amazonia-b98-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega pedofilia ao rejeitar lei anti-pedofilia proposta pela oposição.', 'Não vou sancionar lei que considere pedofilia crime hediondo sem análise.', 'Declaração cercada por polêmica sobre tramitação de projeto.', 'unverified', false, '2019-07-30', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-pedofilia-sancao.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-pedofilia-sancao-b98-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Brasil "virou maricas" com pandemia de preocupação.', 'O brasileiro não pode virar um país de maricas.', 'Entrevista sobre reformas e postura do brasileiro.', 'verified', true, '2019-11-05', 'https://g1.globo.com/politica/noticia/2019/11/05/bolsonaro-pais-maricas.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-pais-maricas-b98-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles desmonta comitê do Fundo Amazônia.', 'O Fundo Amazônia tem irregularidades. Vamos reorganizar a gestão.', 'Anúncio do desmonte do comitê gestor do fundo.', 'verified', true, '2019-05-16', 'https://g1.globo.com/natureza/noticia/2019/05/16/salles-fundo-amazonia.ghtml', 'news_article', 4, 'Brasília', 'Coletiva', 'salles-fundo-amazonia-desmonte-b98-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro celebra aprovação da Previdência e critica oposição.', 'A Previdência foi aprovada. A esquerda se deu mal de novo.', 'Live após aprovação em 2º turno no Senado.', 'verified', false, '2019-10-22', 'https://g1.globo.com/politica/noticia/2019/10/22/bolsonaro-previdencia-aprovada.ghtml', 'social_media_post', 1, 'Brasília', 'Live semanal', 'bolsonaro-previdencia-aprovada-b98-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "tem coisas que só se resolvem com guerra".', 'Tem problemas no Brasil que só se resolvem quando houver uma guerra.', 'Comentário em conversa com apoiadores à porta do Alvorada.', 'verified', true, '2020-01-30', 'https://www1.folha.uol.com.br/poder/2020/01/bolsonaro-guerra-resolver.shtml', 'news_article', 5, 'Palácio da Alvorada', 'Cerca do Alvorada', 'bolsonaro-guerra-resolver-b98-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama países europeus de "esquerdistas" em evento.', 'A Europa se rendeu à esquerda. Não vamos seguir esse caminho.', 'Fala em evento organizado por Steve Bannon.', 'verified', false, '2019-08-03', 'https://www1.folha.uol.com.br/mundo/2019/08/eduardo-europa-esquerdista.shtml', 'news_article', 3, 'Washington, EUA', 'Evento conservador', 'eduardo-europa-esquerdista-b98-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Nordeste "é problema" para ele.', 'Meu pior estado é o Nordeste. É o pior estado meu em termos de votação.', 'Declaração em coletiva sobre resultados eleitorais de 2018.', 'verified', true, '2019-02-06', 'https://g1.globo.com/politica/noticia/2019/02/06/bolsonaro-nordeste-problema.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-nordeste-problema-b98-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro encerra 2019 criticando imprensa e aliados.', 'Imprensa mentirosa, Congresso complicado. Mas o Brasil vai bem.', 'Coletiva de encerramento do ano no Planalto.', 'verified', false, '2019-12-19', 'https://g1.globo.com/politica/noticia/2019/12/19/bolsonaro-balanco-2019.ghtml', 'news_article', 2, 'Palácio do Planalto', 'Coletiva de fim de ano', 'bolsonaro-balanco-2019-b98-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
