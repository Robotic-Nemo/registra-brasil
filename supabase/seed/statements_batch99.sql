-- Batch 99: Bolsonaro government first year + entering 2020 (Jan 2019 - Feb 2020)
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz em discurso de posse que irá "libertar" o Brasil do "socialismo".', 'Vamos libertar o Brasil e o Itamaraty da visão ideológica. Socialismo nunca mais.', 'Discurso de posse no Congresso Nacional em 1º de janeiro de 2019.', 'verified', true, '2019-01-01', 'https://g1.globo.com/politica/noticia/2019/01/01/bolsonaro-posse-socialismo-nunca-mais.ghtml', 'other', 3, 'Congresso Nacional', 'Posse presidencial', 'bolsonaro-posse-libertar-socialismo-b99-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares diz que ONU "impõe agenda" sobre aborto contra Brasil.', 'Não vamos aceitar imposições da ONU. O Brasil é soberano para decidir sobre aborto.', 'Declaração em evento em Genebra na abertura do Conselho de Direitos Humanos.', 'verified', false, '2019-02-25', 'https://g1.globo.com/politica/noticia/2019/02/25/damares-onu-aborto-soberania.ghtml', 'other', 3, 'Genebra, Suíça', 'Conselho de Direitos Humanos da ONU', 'damares-onu-aborto-soberania-b99-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insinua perseguição em tuíte com o termo "golden shower".', 'Não me sinto confortável em mostrar, mas temos que expor a verdade.', 'Tuíte com vídeo obsceno de Carnaval no perfil oficial do presidente.', 'verified', true, '2019-03-05', 'https://g1.globo.com/politica/noticia/2019/03/05/bolsonaro-golden-shower-carnaval.ghtml', 'social_media_post', 4, 'Twitter', 'Postagem oficial do presidente', 'bolsonaro-golden-shower-b99-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro envia pacote anticrime ampliando excludente de ilicitude.', 'A polícia precisa do respaldo legal para atuar. Vamos ampliar a legítima defesa.', 'Entrevista sobre envio do projeto ao Congresso.', 'verified', false, '2019-02-06', 'https://www1.folha.uol.com.br/poder/2019/02/moro-pacote-excludente-ilicitude.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'moro-excludente-ilicitude-b99-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes defende "Estado mínimo" e chama Brasil de "paraíso do funcionalismo".', 'Virou paraíso do funcionário público. Tem que acabar com essa farra.', 'Evento em universidade em Brasília.', 'verified', false, '2019-03-25', 'https://valor.globo.com/brasil/noticia/2019/03/25/guedes-paraiso-funcionario.ghtml', 'other', 2, 'Brasília', 'Palestra em universidade', 'guedes-paraiso-funcionario-b99-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro questiona número de mortos na ditadura militar.', 'O número de mortos da ditadura foi inflado. A esquerda exagera.', 'Declaração em entrevista à TV Bandeirantes.', 'verified', true, '2019-04-01', 'https://g1.globo.com/politica/noticia/2019/04/01/bolsonaro-mortos-ditadura-inflado.ghtml', 'news_article', 4, 'Brasília', 'Entrevista à Band', 'bolsonaro-mortos-ditadura-inflado-b99-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles critica multas do Ibama e defende "pragmatismo ambiental".', 'Fiscalizar sim, mas com pragmatismo. O Ibama tem que colaborar com o produtor.', 'Entrevista sobre orientações ao Ibama.', 'verified', false, '2019-04-20', 'https://www1.folha.uol.com.br/ambiente/2019/04/salles-pragmatismo-ibama.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'salles-pragmatismo-ibama-b99-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "no Brasil gay se está tomando conta de tudo".', 'Se o cara for gay, me diz aí: o que está faltando pra ser puta?', 'Declaração em entrevista sobre famílias.', 'verified', true, '2019-04-06', 'https://www1.folha.uol.com.br/poder/2019/04/bolsonaro-gay-puta.shtml', 'news_article', 5, 'Brasília', 'Entrevista', 'bolsonaro-gay-puta-b99-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende Bolsonaro e minimiza crise política em torno de Moro.', 'Não há crise. O governo está unido.', 'Entrevista após publicações da Vaza Jato.', 'verified', false, '2019-06-15', 'https://g1.globo.com/politica/noticia/2019/06/15/mourao-crise-moro.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'mourao-crise-moro-b99-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca oposição e chama Maia de "traidor".', 'Rodrigo Maia está traindo o povo brasileiro. Não vai passar.', 'Reação à agenda própria da Câmara sob Maia.', 'verified', true, '2019-08-05', 'https://www1.folha.uol.com.br/poder/2019/08/bolsonaro-maia-traidor.shtml', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-maia-traidor-b99-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro encontra Bannon e assume liderança do Movimento.', 'O Brasil é o novo centro do conservadorismo mundial.', 'Entrevista após ser nomeado representante do Movimento de Bannon.', 'verified', true, '2019-02-02', 'https://g1.globo.com/mundo/noticia/2019/02/02/eduardo-bannon-movimento.ghtml', 'news_article', 3, 'Washington, EUA', 'Encontro com Steve Bannon', 'eduardo-bannon-movimento-b99-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Queiroz se entrega à polícia, Flávio Bolsonaro mantém versão.', 'O Queiroz é cidadão comum. Não devo satisfação a ele.', 'Declaração após prisão de Fabrício Queiroz, ex-assessor de Flávio.', 'verified', true, '2020-02-18', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2020/02/18/flavio-queiroz-preso.ghtml', 'news_article', 4, 'Brasília', 'Declaração a jornalistas', 'flavio-queiroz-preso-b99-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ofende jornalista perguntando sobre Queiroz.', 'Queiroz tinha que falar com você? Não.', 'Resposta agressiva à pergunta de jornalista da Globo.', 'verified', true, '2020-02-19', 'https://g1.globo.com/politica/noticia/2020/02/19/bolsonaro-queiroz-jornalista.ghtml', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-queiroz-jornalista-b99-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro convoca atos a favor do governo para 15 de março.', 'Estamos convocando o povo para mostrar quem manda no Brasil.', 'Declaração sobre manifestação com viés contra o Congresso.', 'verified', true, '2020-02-17', 'https://g1.globo.com/politica/noticia/2020/02/17/bolsonaro-atos-15-marco-convocacao.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-atos-15-marco-convocacao-b99-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares chama adoção por casais gays de "incerteza" para criança.', 'Criança precisa de pai e mãe. Adoção por casal gay gera insegurança.', 'Entrevista em TV sobre a política de adoção.', 'verified', true, '2019-10-12', 'https://www1.folha.uol.com.br/cotidiano/2019/10/damares-adocao-casal-gay.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'damares-adocao-casal-gay-b99-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Suécia e ambientalistas após crise da Amazônia.', 'A Suécia não tem lição a dar. Os jovens lá vivem de internet.', 'Resposta à Greta Thunberg e governo sueco sobre Amazônia.', 'verified', true, '2019-09-25', 'https://g1.globo.com/mundo/noticia/2019/09/25/bolsonaro-ataca-suecia.ghtml', 'news_article', 3, 'Nova York', 'Coletiva pós-ONU', 'bolsonaro-ataca-suecia-b99-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles flexibiliza regras ambientais em Portaria polêmica.', 'Vamos desburocratizar o licenciamento. O Brasil precisa produzir.', 'Publicação de portaria flexibilizando licenciamentos.', 'verified', false, '2020-02-12', 'https://g1.globo.com/natureza/noticia/2020/02/12/salles-portaria-desburocratizacao.ghtml', 'news_article', 3, 'Brasília', 'Publicação de portaria', 'salles-portaria-licenciamento-b99-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vai a ato na Paulista em apoio ao governo.', 'O povo está nas ruas. Ninguém vai parar o Brasil.', 'Discurso em ato de 26 de maio na Avenida Paulista.', 'verified', true, '2019-05-26', 'https://g1.globo.com/sp/sao-paulo/noticia/2019/05/26/bolsonaro-paulista-ato-apoio.ghtml', 'other', 3, 'Avenida Paulista, SP', 'Ato pró-governo', 'bolsonaro-paulista-26-maio-b99-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ameaça usar Forças Armadas em caso de "ameaça comunista".', 'Se for preciso, as Forças Armadas estarão prontas para garantir a ordem.', 'Declaração em cerimônia militar.', 'verified', true, '2019-08-10', 'https://www1.folha.uol.com.br/poder/2019/08/bolsonaro-forcas-armadas-comunismo.shtml', 'other', 5, 'Brasília', 'Cerimônia militar', 'bolsonaro-forcas-armadas-comunismo-b99-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro é investigado por articular ataques coordenados nas redes.', 'Não existe gabinete do ódio. É ficção da imprensa.', 'Declaração após CPMI das Fake News iniciar quebra de sigilos.', 'verified', true, '2019-12-10', 'https://g1.globo.com/politica/noticia/2019/12/10/carlos-bolsonaro-gabinete-odio-negacao.ghtml', 'social_media_post', 3, 'Twitter', 'Postagem em rede social', 'carlos-gabinete-odio-negacao-b99-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca governadores do Nordeste após reuniões com Macron.', 'Esses governadores do Nordeste são "paraíbas". Estão querendo se aliar à França.', 'Declaração após encontro de governadores do NE com Macron.', 'verified', true, '2019-08-30', 'https://www1.folha.uol.com.br/poder/2019/08/bolsonaro-governadores-paraibas.shtml', 'news_article', 4, 'Brasília', 'Conversa com apoiadores', 'bolsonaro-governadores-paraibas-b99-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende intervenção militar na Venezuela.', 'Não descartamos nenhuma solução. A Venezuela é uma ameaça à região.', 'Entrevista após crise na Venezuela com Guaidó.', 'verified', true, '2019-02-10', 'https://g1.globo.com/mundo/noticia/2019/02/10/mourao-intervencao-venezuela.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'mourao-intervencao-venezuela-b99-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes compara Chile a Brasil em proposta liberal.', 'Queremos que o Brasil seja o novo Chile da América Latina.', 'Evento com investidores sobre reformas econômicas.', 'verified', false, '2019-10-10', 'https://valor.globo.com/brasil/noticia/2019/10/10/guedes-brasil-chile.ghtml', 'other', 2, 'Nova York', 'Evento com investidores', 'guedes-brasil-chile-b99-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Glenn Greenwald pode "pegar cana" no Brasil.', 'Esse Glenn pode sim pegar cana no Brasil por invadir celular.', 'Declaração contra o jornalista do Intercept Brasil.', 'verified', true, '2019-07-27', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-glenn-greenwald-cadeia.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-glenn-greenwald-b99-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles chama multas ambientais de "indústria da multa".', 'Existe uma indústria da multa. Multar por multar não preserva nada.', 'Declaração em audiência no Senado.', 'verified', false, '2019-06-18', 'https://www1.folha.uol.com.br/ambiente/2019/06/salles-industria-da-multa.shtml', 'news_article', 3, 'Senado Federal', 'Audiência pública', 'salles-industria-multa-b99-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares critica músicas de funk e propõe censura.', 'Funk é degradação da mulher. Vamos pensar em ações educativas.', 'Entrevista em rádio evangélica.', 'verified', false, '2019-07-01', 'https://g1.globo.com/politica/noticia/2019/07/01/damares-funk-censura.ghtml', 'news_article', 3, 'Brasília', 'Entrevista à rádio', 'damares-funk-censura-b99-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara imprensa a "lixo" e promete cortar verbas publicitárias.', 'Imprensa é lixo. Vou cortar as verbas publicitárias do governo pra eles.', 'Declaração em live semanal.', 'verified', true, '2019-08-15', 'https://www1.folha.uol.com.br/poder/2019/08/bolsonaro-imprensa-lixo-verbas.shtml', 'social_media_post', 4, 'Facebook Live', 'Live semanal', 'bolsonaro-imprensa-lixo-verbas-b99-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro aponta arma imaginária em gesto a apoiadores.', 'CAC, tem que comprar fuzil. Todo mundo tem que ter fuzil.', 'Discurso em evento de colecionadores de armas.', 'verified', true, '2019-07-09', 'https://g1.globo.com/politica/noticia/2019/07/09/bolsonaro-fuzil-todos-cac.ghtml', 'other', 4, 'Brasília', 'Evento de CACs', 'bolsonaro-fuzil-todos-cac-b99-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nomeia filho de Sergio Reis e desafia denúncias.', 'Nomeações são livres. Não tem nepotismo, tem competência.', 'Defesa de nomeação cruzada envolvendo parentes.', 'verified', false, '2019-04-22', 'https://www1.folha.uol.com.br/poder/2019/04/bolsonaro-nomeacoes-nepotismo.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'bolsonaro-nomeacoes-nepotismo-b99-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro chama Venezuela de "narcoestado" em fala nos EUA.', 'Maduro é um ditador. A Venezuela é um narcoestado.', 'Fala em conferência nos EUA sobre a América Latina.', 'verified', false, '2019-03-15', 'https://g1.globo.com/mundo/noticia/2019/03/15/eduardo-venezuela-narcoestado.ghtml', 'other', 2, 'Washington, EUA', 'Conferência em think tank', 'eduardo-venezuela-narcoestado-b99-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "ficou quieto demais" e vai "partir pra cima" do STF.', 'Chega de passar a mão na cabeça do STF. Vou partir pra cima.', 'Declaração após decisões contrárias sobre armas e posse.', 'verified', true, '2020-02-10', 'https://www1.folha.uol.com.br/poder/2020/02/bolsonaro-stf-partir-pra-cima.shtml', 'news_article', 5, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-stf-partir-pra-cima-b99-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares anuncia programa de abstinência sexual para jovens.', 'Vamos ensinar abstinência. Sexo só no casamento.', 'Anúncio de campanha do ministério sobre educação sexual.', 'verified', true, '2020-01-28', 'https://g1.globo.com/politica/noticia/2020/01/28/damares-abstinencia-sexual.ghtml', 'news_article', 3, 'Brasília', 'Anúncio de programa', 'damares-abstinencia-sexual-b99-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comenta imagem do Nordeste como "laboratório" do PT.', 'O Nordeste foi um laboratório dos petistas. Agora vamos mudar isso.', 'Discurso para apoiadores no Nordeste.', 'verified', true, '2019-11-18', 'https://g1.globo.com/politica/noticia/2019/11/18/bolsonaro-nordeste-laboratorio.ghtml', 'other', 3, 'Nordeste', 'Evento com apoiadores', 'bolsonaro-nordeste-laboratorio-b99-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio é denunciado por lavagem e peculato pelo MP-RJ.', 'É perseguição política escancarada. O MP está contaminado.', 'Reação à denúncia formal da rachadinha.', 'verified', true, '2019-12-20', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2019/12/20/flavio-denuncia-mp-rj.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Coletiva após denúncia', 'flavio-denuncia-mp-rj-b99-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca Maia e Alcolumbre após derrota no Congresso.', 'Esses presidentes do Congresso estão me atrapalhando. Vão pagar.', 'Declaração após derrota em votação.', 'verified', true, '2019-11-28', 'https://www1.folha.uol.com.br/poder/2019/11/bolsonaro-maia-alcolumbre.shtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-maia-alcolumbre-b99-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis propõe criminalizar "doutrinação" em escolas.', 'Professor que faz doutrinação tem que ir preso.', 'Defesa de projeto em plenário.', 'verified', false, '2019-10-22', 'https://g1.globo.com/educacao/noticia/2019/10/22/kicis-doutrinacao-escolas.ghtml', 'other', 3, 'Câmara dos Deputados', 'Plenário', 'kicis-doutrinacao-escolas-b99-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli acusa "globalistas" de querer destruir o Brasil.', 'Os globalistas querem acabar com o Brasil. Vamos resistir.', 'Discurso em plenário.', 'verified', false, '2019-11-12', 'https://www1.folha.uol.com.br/poder/2019/11/zambelli-globalistas.shtml', 'other', 2, 'Câmara dos Deputados', 'Plenário', 'zambelli-globalistas-b99-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira ataca Alexandre de Moraes em vídeo.', 'Moraes é uma vergonha para o Judiciário brasileiro.', 'Vídeo gravado em evento bolsonarista.', 'verified', true, '2020-01-22', 'https://g1.globo.com/politica/noticia/2020/01/22/silveira-moraes-vergonha.ghtml', 'social_media_post', 4, 'Rio de Janeiro', 'Vídeo em rede social', 'silveira-moraes-vergonha-b99-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano defende Escola sem Partido em palestra.', 'Precisamos proteger nossas crianças da doutrinação ideológica.', 'Palestra em escola de formação política.', 'verified', false, '2019-08-20', 'https://www1.folha.uol.com.br/educacao/2019/08/feliciano-escola-sem-partido.shtml', 'other', 2, 'Brasília', 'Palestra', 'feliciano-escola-sem-partido-b99-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende leitura bíblica em escolas públicas.', 'A Bíblia tem que voltar para a escola. Nosso país é cristão.', 'Discurso em evento evangélico.', 'verified', false, '2019-10-05', 'https://g1.globo.com/politica/noticia/2019/10/05/malta-biblia-escolas.ghtml', 'other', 3, 'Vitória, ES', 'Culto evangélico', 'malta-biblia-escolas-b99-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende vínculo entre estado e igrejas.', 'O Brasil não é laico de fato. Deus está na Constituição.', 'Declaração em comissão sobre isenções fiscais de igrejas.', 'verified', false, '2019-09-10', 'https://www1.folha.uol.com.br/poder/2019/09/silas-camara-estado-igreja.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Comissão', 'silas-camara-estado-igreja-b99-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem critica estatais e propõe privatizações aceleradas.', 'Petrobras, Banco do Brasil, Caixa: tudo tem que ser privatizado.', 'Entrevista sobre o programa liberal do Novo.', 'verified', false, '2019-09-15', 'https://valor.globo.com/politica/noticia/2019/09/15/van-hattem-privatizacoes.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'van-hattem-privatizacoes-b99-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende plano de Guedes no Congresso.', 'A Previdência aprovada vai salvar o Brasil. Guedes está certo.', 'Entrevista após aprovação no Senado.', 'verified', false, '2019-10-24', 'https://g1.globo.com/politica/noticia/2019/10/24/kim-guedes-previdencia-aprovada.ghtml', 'news_article', 1, 'Brasília', 'Entrevista', 'kim-guedes-previdencia-b99-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura defende corte de ministérios e enxugamento do Estado.', 'O Brasil tem ministérios demais. Hora de enxugar.', 'Declaração sobre reforma administrativa.', 'verified', false, '2019-07-18', 'https://www1.folha.uol.com.br/mercado/2019/07/ventura-corte-ministerios.shtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'ventura-corte-ministerios-b99-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral critica Future-se e ataca corte de bolsas CAPES.', 'Cortar bolsas da CAPES é destruir a pós-graduação brasileira.', 'Discurso em plenário.', 'verified', false, '2019-08-07', 'https://g1.globo.com/politica/noticia/2019/08/07/tabata-capes-cortes.ghtml', 'other', 1, 'Câmara dos Deputados', 'Plenário', 'tabata-capes-cortes-b99-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar denuncia ataques contínuos à imprensa.', 'Governo declarou guerra à imprensa, ao jornalismo e à democracia.', 'Entrevista à Carta Capital.', 'verified', false, '2019-09-05', 'https://www.cartacapital.com.br/politica/chico-alencar-ataques-imprensa/', 'news_article', 1, 'Rio de Janeiro', 'Entrevista à Carta Capital', 'chico-alencar-ataques-imprensa-b99-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali denuncia ataques de Damares a direitos das mulheres.', 'Damares é a pior ministra que o Brasil já teve para os direitos das mulheres.', 'Coletiva após declaração sobre aborto.', 'verified', false, '2020-02-21', 'https://g1.globo.com/politica/noticia/2020/02/21/jandira-damares-direitos-mulheres.ghtml', 'news_article', 1, 'Brasília', 'Coletiva', 'jandira-damares-direitos-mulheres-b99-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo é ameaçado após vídeo de Bolsonaro.', 'As ameaças aumentaram depois que o presidente me citou.', 'Denúncia na mídia sobre segurança pessoal.', 'verified', true, '2019-11-03', 'https://oglobo.globo.com/rio/freixo-ameacado-bolsonaro-23615432', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'freixo-ameacado-bolsonaro-b99-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jse, 'Serra critica "espetacularização" do governo Bolsonaro.', 'Governar não é tuitar. Precisamos de ações, não lives.', 'Entrevista sobre primeiro ano do governo.', 'verified', false, '2020-01-05', 'https://www1.folha.uol.com.br/poder/2020/01/serra-tuitar-nao-governar.shtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'serra-tuitar-nao-governar-b99-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi denuncia perseguição política a Lula.', 'Lula é o maior preso político do Brasil. Isso não pode continuar.', 'Entrevista antes da soltura de Lula.', 'verified', false, '2019-10-30', 'https://www.pt.org.br/gleisi-lula-perseguido/', 'news_article', 1, 'Brasília', 'Entrevista', 'gleisi-lula-perseguido-b99-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "não estou com vontade de ser candidato" em primeira entrevista pós-prisão.', 'Não estou com vontade de ser candidato. Estou com vontade de rever o Brasil.', 'Entrevista coletiva após soltura de Curitiba.', 'verified', true, '2019-11-09', 'https://g1.globo.com/sp/sao-bernardo-do-campo-regiao/noticia/2019/11/09/lula-entrevista-abc.ghtml', 'other', 1, 'São Bernardo do Campo', 'Discurso no Sindicato dos Metalúrgicos', 'lula-solto-abc-discurso-b99-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma critica Moro e Vaza Jato em palestra internacional.', 'A Lava Jato foi um golpe contra a democracia brasileira.', 'Palestra em universidade europeia.', 'verified', false, '2019-07-15', 'https://www1.folha.uol.com.br/poder/2019/07/dilma-lava-jato-golpe.shtml', 'other', 1, 'Paris', 'Palestra acadêmica', 'dilma-lava-jato-golpe-b99-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad alerta para militarização e falta de diálogo.', 'O governo só sabe gritar e militarizar. Falta diálogo e projeto.', 'Discurso em evento do PT em São Paulo.', 'verified', false, '2019-05-01', 'https://g1.globo.com/sp/sao-paulo/noticia/2019/05/01/haddad-militarizacao-governo.ghtml', 'other', 1, 'São Paulo', 'Ato do 1º de maio', 'haddad-militarizacao-governo-b99-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer critica provocações do governo ao STF.', 'Não se governa provocando o Supremo. Isso é imaturidade institucional.', 'Entrevista ao Valor.', 'verified', false, '2020-02-14', 'https://valor.globo.com/politica/noticia/2020/02/14/temer-provocacoes-stf.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'temer-provocacoes-stf-b99-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro cita "estupros" em presídios para defender pacote anticrime.', 'Eu não quero meu filho estuprado na cadeia. Tem que dar tiro mesmo.', 'Declaração defendendo excludente de ilicitude.', 'verified', true, '2019-07-20', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-estupro-presidio.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-estupro-presidio-b99-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que brasileiro "pula no esgoto" e não morre.', 'Brasileiro pula em esgoto e não acontece nada com ele.', 'Declaração em live sobre ambiente.', 'verified', true, '2020-02-27', 'https://g1.globo.com/politica/noticia/2020/02/27/bolsonaro-esgoto-brasileiro.ghtml', 'social_media_post', 3, 'Facebook Live', 'Live semanal', 'bolsonaro-esgoto-brasileiro-b99-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles visita Dia da Amazônia e ataca ONGs.', 'ONGs são parasitas que vivem do dinheiro estrangeiro.', 'Discurso no 5 de setembro em Manaus.', 'verified', true, '2019-09-05', 'https://g1.globo.com/am/amazonas/noticia/2019/09/05/salles-ongs-parasitas.ghtml', 'other', 3, 'Manaus', 'Dia da Amazônia', 'salles-ongs-parasitas-b99-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "se o povo quiser, mudamos a Constituição".', 'Se o povo quiser, reinventamos tudo. Até a Constituição.', 'Declaração em conversa com apoiadores.', 'verified', true, '2019-07-30', 'https://www1.folha.uol.com.br/poder/2019/07/bolsonaro-mudar-constituicao.shtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-mudar-constituicao-b99-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara indígenas a "cobaias" em plena crise.', 'O índio está sendo cobaia dos antropólogos.', 'Declaração em reunião ministerial vazada.', 'verified', true, '2019-12-01', 'https://g1.globo.com/politica/noticia/2019/12/01/bolsonaro-indigena-cobaia.ghtml', 'news_article', 4, 'Brasília', 'Reunião ministerial', 'bolsonaro-indigena-cobaia-b99-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro diz que "Lava Jato não vai retroceder" após vazamentos.', 'A Lava Jato não vai retroceder. Vamos continuar nossa luta contra a corrupção.', 'Declaração em entrevista após Vaza Jato.', 'verified', false, '2019-07-04', 'https://g1.globo.com/politica/noticia/2019/07/04/moro-lava-jato-retroceder.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'moro-lava-jato-retroceder-b99-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz a empresário que Ustra "foi herói nacional".', 'Ustra é herói nacional. Salvou o Brasil do comunismo.', 'Fala em evento com empresários.', 'verified', true, '2019-11-22', 'https://www1.folha.uol.com.br/poder/2019/11/bolsonaro-ustra-heroi.shtml', 'news_article', 5, 'Brasília', 'Evento com empresários', 'bolsonaro-ustra-heroi-2019-b99-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz fala ofensiva sobre negros em evento.', 'Eu fui num quilombo. O afrodescendente mais leve pesava sete arrobas.', 'Repetição da fala racista em novo evento.', 'verified', true, '2019-07-14', 'https://g1.globo.com/politica/noticia/2019/07/14/bolsonaro-quilombolas-sete-arrobas-repete.ghtml', 'other', 5, 'Brasília', 'Evento com apoiadores', 'bolsonaro-quilombolas-repete-b99-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "ONG paga" foi responsável pelo óleo no Nordeste.', 'A gente tem informação que ONG paga derramou óleo para prejudicar o Brasil.', 'Declaração sem provas sobre crime ambiental.', 'verified', true, '2019-10-29', 'https://g1.globo.com/natureza/noticia/2019/10/29/bolsonaro-oleo-ong-paga.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-oleo-ong-paga-b99-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que miscigenação brasileira pode ter sido "benéfica".', 'A miscigenação melhorou a raça. É uma das virtudes brasileiras.', 'Entrevista em que voltou a falar em estereótipos raciais.', 'verified', true, '2019-05-15', 'https://www1.folha.uol.com.br/poder/2019/05/mourao-miscigenacao-raca.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'mourao-miscigenacao-raca-b99-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes diz que "quem tem nostalgia vai viver em Cuba".', 'Quem tem saudade do passado que vá viver em Cuba.', 'Fala no lançamento de plano liberal em Brasília.', 'verified', true, '2019-10-20', 'https://valor.globo.com/brasil/noticia/2019/10/20/guedes-cuba-nostalgia.ghtml', 'other', 3, 'Brasília', 'Lançamento de plano econômico', 'guedes-nostalgia-cuba-b99-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede ao Congresso CPI da Globo.', 'Vou propor CPI da Globo. Está na hora de eles prestarem contas.', 'Declaração após reportagem que ligou Queiroz ao Alvorada.', 'verified', true, '2019-10-30', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-cpi-globo.shtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-cpi-globo-b99-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que não vai renovar concessão da Globo.', 'A Globo não vai ter concessão renovada. É bom eles sentarem e conversarem.', 'Ameaça proferida em live.', 'verified', true, '2019-10-31', 'https://g1.globo.com/politica/noticia/2019/10/31/bolsonaro-globo-renovacao.ghtml', 'social_media_post', 5, 'Brasília', 'Live semanal', 'bolsonaro-globo-renovacao-concessao-b99-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares elogia Bolsonaro como "presidente mais importante da história".', 'Esse é o melhor presidente que já tivemos. Foi ungido por Deus.', 'Discurso em igreja evangélica.', 'verified', false, '2019-12-15', 'https://www1.folha.uol.com.br/poder/2019/12/damares-bolsonaro-ungido.shtml', 'other', 2, 'Brasília', 'Culto evangélico', 'damares-bolsonaro-ungido-b99-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio tenta anular investigação no STF.', 'O Senador tem foro. A investigação no Rio é inconstitucional.', 'Argumento apresentado ao STF.', 'verified', false, '2019-08-30', 'https://g1.globo.com/politica/noticia/2019/08/30/flavio-stf-foro.ghtml', 'news_article', 3, 'Brasília', 'Petição no STF', 'flavio-stf-foro-b99-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz piada com feminicídio em live.', 'Minha mulher é minha melhor amiga. Ela me dá cada cabeçada.', 'Fala em live semanal que foi criticada por banalizar violência.', 'verified', false, '2019-09-19', 'https://www1.folha.uol.com.br/poder/2019/09/bolsonaro-piada-michelle.shtml', 'social_media_post', 3, 'Facebook Live', 'Live semanal', 'bolsonaro-piada-michelle-b99-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro celebra revogação de nota sobre Stonewall em órgão governamental.', 'Não vamos promover agenda gay no governo.', 'Fala após cancelamento de nota da Secretaria de Cultura.', 'verified', true, '2019-06-28', 'https://g1.globo.com/politica/noticia/2019/06/28/bolsonaro-stonewall-agenda-gay.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-stonewall-agenda-gay-b99-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles é criticado pela ONU por política anti-ambiental.', 'A agenda da ONU não vai parar o agronegócio brasileiro.', 'Resposta a críticas internacionais.', 'verified', false, '2019-11-02', 'https://g1.globo.com/natureza/noticia/2019/11/02/salles-onu-agro.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'salles-onu-agro-b99-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que jornalistas "podem perder emprego" após CPI da Fake News.', 'Muitos jornalistas vão ter seus empregos ameaçados quando a verdade aparecer.', 'Fala ameaçadora em live.', 'verified', true, '2019-11-14', 'https://www1.folha.uol.com.br/poder/2019/11/bolsonaro-jornalistas-emprego.shtml', 'social_media_post', 4, 'Facebook Live', 'Live semanal', 'bolsonaro-jornalistas-emprego-b99-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro publica thread atacando Alcolumbre.', 'Alcolumbre está traindo o povo. Vergonha ao Senado.', 'Postagens em rede social contra o presidente do Senado.', 'verified', true, '2020-02-05', 'https://g1.globo.com/politica/noticia/2020/02/05/carlos-alcolumbre-traicao.ghtml', 'social_media_post', 3, 'Twitter', 'Postagem em rede social', 'carlos-alcolumbre-traicao-b99-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "não existe homofobia" no Brasil.', 'Homofobia no Brasil não existe. É invenção da imprensa.', 'Declaração após decisão do STF que criminalizou homofobia.', 'verified', true, '2019-06-13', 'https://www1.folha.uol.com.br/cotidiano/2019/06/bolsonaro-homofobia-nao-existe.shtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-homofobia-nao-existe-b99-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_neg, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares vai à ONU defender "direitos da criança em ventre".', 'A vida começa na concepção. Estado deve proteger desde o ventre.', 'Fala da ministra em evento paralelo da ONU.', 'verified', false, '2019-09-22', 'https://www1.folha.uol.com.br/mundo/2019/09/damares-onu-concepcao.shtml', 'other', 3, 'Nova York, ONU', 'Evento paralelo na ONU', 'damares-onu-concepcao-b99-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comenta sobre "cobras venenosas" em reserva indígena.', 'Lá tem cobras venenosas, onça. O índio não quer ficar isolado.', 'Declaração em evento para defender integrar indígenas.', 'verified', true, '2020-01-16', 'https://g1.globo.com/politica/noticia/2020/01/16/bolsonaro-indio-cobras.ghtml', 'news_article', 3, 'Brasília', 'Entrevista', 'bolsonaro-indio-cobras-b99-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo defende sanções dos EUA à Venezuela.', 'Vamos apertar as sanções. Maduro tem que cair.', 'Fala em Washington sobre política externa.', 'verified', false, '2019-09-20', 'https://www1.folha.uol.com.br/mundo/2019/09/eduardo-venezuela-sancoes.shtml', 'news_article', 2, 'Washington, EUA', 'Conferência conservadora', 'eduardo-venezuela-sancoes-b99-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca STF após decisão sobre prisão em segunda instância.', 'O STF me traiu. Vamos mudar isso por PEC.', 'Reação à virada jurisprudencial que soltou Lula.', 'verified', true, '2019-11-08', 'https://g1.globo.com/politica/noticia/2019/11/08/bolsonaro-stf-traiu-lula.ghtml', 'news_article', 4, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-stf-traiu-lula-b99-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gue, 'Guedes cogita criar nova CPMF em meio a debate tributário.', 'Uma CPMF digital pode resolver a reforma tributária.', 'Entrevista em que sugeriu novo imposto sobre transações.', 'verified', true, '2019-08-26', 'https://valor.globo.com/brasil/noticia/2019/08/26/guedes-cpmf-digital.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'guedes-cpmf-digital-b99-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que brigadistas do Pantanal são "incendiários".', 'Os brigadistas podem ser os que estão ateando fogo.', 'Fala sem provas contra voluntários de combate a incêndios.', 'verified', true, '2019-11-27', 'https://www1.folha.uol.com.br/ambiente/2019/11/bolsonaro-brigadistas-incendiarios.shtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-brigadistas-incendiarios-b99-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica Doria e governadores que o enfrentam.', 'João Doria é traidor. Não vai ser nada em 2022.', 'Declaração após Doria criticar postura anti-vacina.', 'verified', false, '2019-12-10', 'https://g1.globo.com/politica/noticia/2019/12/10/bolsonaro-doria-traidor.ghtml', 'news_article', 2, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-doria-traidor-b99-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares viaja para Alagoas e distribui bíblias em programa oficial.', 'Vamos levar a palavra de Deus e o amor da família a todos.', 'Ação oficial do ministério com verba pública.', 'verified', false, '2019-07-09', 'https://www1.folha.uol.com.br/poder/2019/07/damares-biblia-alagoas.shtml', 'news_article', 3, 'Alagoas', 'Visita oficial', 'damares-biblia-alagoas-b99-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Salles leva pastor evangélico a reunião sobre Amazônia.', 'Os pastores têm acesso direto aos indígenas. São aliados estratégicos.', 'Reunião com lideranças evangélicas sobre política indigenista.', 'verified', false, '2019-07-22', 'https://g1.globo.com/natureza/noticia/2019/07/22/salles-evangelicos-amazonia.ghtml', 'news_article', 3, 'Brasília', 'Reunião com evangélicos', 'salles-evangelicos-amazonia-b99-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "está virando Messias" com apoio popular.', 'O povo me chama de Messias. E eu confio em Deus.', 'Declaração em evento evangélico em Brasília.', 'verified', false, '2019-06-30', 'https://www1.folha.uol.com.br/poder/2019/06/bolsonaro-messias-povo.shtml', 'other', 2, 'Brasília', 'Evento evangélico', 'bolsonaro-messias-povo-b99-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro celebra veto à licença-paternidade estendida.', 'Vetei licença-paternidade. Quem vai cuidar do bebê é a mãe.', 'Fala em live sobre o veto presidencial.', 'verified', false, '2019-08-14', 'https://g1.globo.com/politica/noticia/2019/08/14/bolsonaro-veto-licenca-paternidade.ghtml', 'social_media_post', 3, 'Facebook Live', 'Live semanal', 'bolsonaro-veto-paternidade-b99-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro faz gesto obsceno para manifestante contra o governo.', 'Esse aí é um vagabundo. Vai lavar louça.', 'Declaração a manifestante em visita ao interior.', 'verified', true, '2019-09-14', 'https://g1.globo.com/politica/noticia/2019/09/14/bolsonaro-manifestante-lavar-louca.ghtml', 'news_article', 3, 'Interior', 'Evento em cidade do interior', 'bolsonaro-manifestante-lavar-louca-b99-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reafirma que "fome no Brasil é mentira".', 'Falar em fome no Brasil é grande mentira. Na minha casa se come bem.', 'Fala em evento com empresários.', 'verified', true, '2019-10-18', 'https://www1.folha.uol.com.br/poder/2019/10/bolsonaro-fome-mentira.shtml', 'news_article', 4, 'Brasília', 'Evento com empresários', 'bolsonaro-fome-mentira-b99-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tcr, 'Tereza Cristina libera mais 57 agrotóxicos de uma vez.', 'A liberação é baseada em ciência. Não há risco.', 'Coletiva anunciando mais uma rodada de liberações.', 'verified', false, '2019-09-18', 'https://g1.globo.com/economia/agronegocios/noticia/2019/09/18/tereza-cristina-57-agrotoxicos.ghtml', 'news_article', 3, 'Brasília', 'Coletiva', 'tcristina-57-agrotoxicos-b99-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que "a PF não vai mais investigar ministros".', 'A PF vai fazer o que eu determinar. Eu mando nela.', 'Declaração após crise com Moro sobre indicação na PF.', 'verified', true, '2020-02-20', 'https://www1.folha.uol.com.br/poder/2020/02/bolsonaro-pf-mando.shtml', 'news_article', 5, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-pf-mando-b99-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_aut, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ataca CPMI das Fake News com ironia.', 'Essa CPMI é uma piada. Vão perder tempo contra mim.', 'Fala em live atacando a comissão.', 'verified', true, '2019-09-04', 'https://g1.globo.com/politica/noticia/2019/09/04/bolsonaro-cpmi-piada.ghtml', 'social_media_post', 3, 'Facebook Live', 'Live semanal', 'bolsonaro-cpmi-piada-b99-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney diz que Brasil vive "maior crise política desde 1964".', 'Estamos numa crise institucional sem precedentes. Me preocupa.', 'Entrevista a jornal em São Luís.', 'verified', false, '2019-10-22', 'https://oglobo.globo.com/politica/sarney-crise-maior-1964-23625456', 'news_article', 1, 'São Luís', 'Entrevista ao jornal local', 'sarney-crise-desde-1964-b99-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende reforma da Previdência em plenário.', 'A Previdência é indispensável. Não dá para adiar mais.', 'Pronunciamento na tribuna do Senado.', 'verified', false, '2019-09-03', 'https://www12.senado.leg.br/noticias/2019/09/collor-previdencia-pronunciamento', 'other', 1, 'Senado Federal', 'Pronunciamento', 'collor-previdencia-pronunciamento-b99-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mer, 'Mercadante denuncia corte em ciência e tecnologia.', 'Cortar ciência é matar o futuro. Isso é irresponsável.', 'Artigo na Folha sobre cortes no MCTIC.', 'verified', false, '2019-08-09', 'https://www1.folha.uol.com.br/opiniao/2019/08/mercadante-ciencia-cortes.shtml', 'news_article', 1, 'São Paulo', 'Artigo de opinião', 'mercadante-ciencia-cortes-b99-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy questiona postura do governo sobre feminicídio.', 'O governo age como se mulher morrer fosse problema menor.', 'Entrevista após declaração de Bolsonaro.', 'verified', false, '2019-03-13', 'https://g1.globo.com/politica/noticia/2019/03/13/marta-feminicidio-governo.ghtml', 'news_article', 1, 'São Paulo', 'Entrevista', 'marta-feminicidio-governo-b99-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro ironiza Argentina e governo Fernández.', 'Os argentinos elegeram mal. Vão quebrar de novo.', 'Declaração após vitória de Alberto Fernández.', 'verified', true, '2019-10-28', 'https://www1.folha.uol.com.br/mundo/2019/10/bolsonaro-fernandez-argentina.shtml', 'news_article', 3, 'Brasília', 'Cerca do Alvorada', 'bolsonaro-fernandez-argentina-b99-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro publica fake news sobre Macron e esposa no Twitter.', 'Agora dá para entender por que Macron persegue o Brasil.', 'Legenda em postagem com imagem pejorativa da primeira-dama francesa.', 'verified', true, '2019-08-25', 'https://g1.globo.com/politica/noticia/2019/08/25/bolsonaro-twitter-macron-brigitte.ghtml', 'social_media_post', 4, 'Twitter', 'Postagem oficial', 'bolsonaro-twitter-macron-brigitte-b99-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_xen, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que 13 de maio "não tem nada a comemorar".', 'O 13 de maio não é uma data de celebração. Foi uma libertação incompleta.', 'Declaração em cerimônia oficial.', 'verified', false, '2019-05-13', 'https://g1.globo.com/politica/noticia/2019/05/13/mourao-13-maio-abolicao.ghtml', 'news_article', 2, 'Brasília', 'Cerimônia oficial', 'mourao-13-maio-abolicao-b99-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara pandemia mundial incipiente a "gripezinha" no início de 2020.', 'Esse coronavírus vai passar. É uma fantasia da imprensa.', 'Declaração em fevereiro de 2020, antes de a OMS decretar pandemia.', 'verified', true, '2020-02-28', 'https://g1.globo.com/politica/noticia/2020/02/28/bolsonaro-coronavirus-fantasia.ghtml', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-coronavirus-fantasia-b99-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro termina fevereiro de 2020 com ataque ao Congresso e convocação de atos.', 'Se o Congresso não ajudar, o povo vai às ruas. E pode ser agora.', 'Mensagem aos apoiadores em semana de tensão com Maia.', 'verified', true, '2020-02-29', 'https://www1.folha.uol.com.br/poder/2020/02/bolsonaro-congresso-ruas-fevereiro.shtml', 'social_media_post', 5, 'Brasília', 'Transmissão em rede social', 'bolsonaro-congresso-ruas-fevereiro-b99-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

END $$;
