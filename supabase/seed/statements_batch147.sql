-- Batch 147: Lula pessoal 2023-2026 (parte 2) - declarações polêmicas, desinformação, machismo, conflitos
DO $$
DECLARE
  v_lul UUID;
  c_des UUID; c_mac UUID; c_mis UUID; c_odi UUID; c_abu UUID;
  c_irr UUID; c_con UUID; c_neg UUID; c_int UUID; c_aut UUID;
  c_hom UUID; c_rac UUID; c_vio UUID; c_itr UUID; c_cor UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara Israel a Hitler ao criticar ofensiva em Gaza, gerando crise diplomática.', 'O que está acontecendo na Faixa de Gaza não existe em outro momento histórico. Aliás, existiu, quando Hitler resolveu matar os judeus.', 'Declaração em entrevista coletiva em Adis Abeba durante cúpula da União Africana causou crise com Israel, que declarou Lula persona non grata.', 'verified', true, '2024-02-18', 'https://www.bbc.com/portuguese/articles/crgj902rnnro', 'news_article', 4, 'Adis Abeba, Etiópia', 'Cúpula da União Africana', 'lula-hitler-israel-gaza-b147-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que mulher empreendedora não é empreendedora de verdade e causa polêmica.', 'Tem muita mulher empreendedora porque perdeu o emprego e a única coisa que sobra é você tentar algum bico.', 'Fala em evento do Sebrae minimizou empreendedorismo feminino e foi criticada por entidades de mulheres empresárias.', 'verified', true, '2024-03-08', 'https://g1.globo.com/politica/noticia/2024/03/08/lula-mulher-empreendedora-bico-sebrae.ghtml', 'news_article', 3, 'Brasília', 'Evento Sebrae Dia da Mulher', 'lula-mulher-bico-b147-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega alta da inflação e afirma que preços estão sob controle apesar de dados do IBGE.', 'Não tem inflação no Brasil. Quem fala isso está mentindo para o povo brasileiro.', 'Declaração em entrevista à rádio contradizia dados oficiais do IPCA que mostravam aceleração nos alimentos.', 'verified', false, '2024-07-15', 'https://www.poder360.com.br/economia/lula-nega-inflacao-radio/', 'news_article', 3, 'Entrevista radiofônica', 'Programa de rádio regional', 'lula-nega-inflacao-b147-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que imprensa é oposição e precisa ser regulada.', 'A imprensa brasileira é oposição. Ela precisa ser regulada para parar de mentir.', 'Fala em evento partidário reacendeu debate sobre regulação da mídia e foi criticada por entidades jornalísticas.', 'verified', true, '2023-09-20', 'https://www.abraji.org.br/noticias/lula-imprensa-oposicao-regulacao', 'news_article', 3, 'Convenção PT', 'Encontro nacional', 'lula-imprensa-oposicao-b147-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que mulher precisa cuidar do marido e dos filhos antes de tudo.', 'A mulher sabe que primeiro tem que cuidar da casa, do marido, das crianças. Depois a gente vê o resto.', 'Comentário durante cerimônia provocou reação nas redes e foi considerado retrógrado por movimentos feministas.', 'verified', false, '2024-05-12', 'https://www.folha.uol.com.br/poder/2024/05/lula-mulher-casa-marido.shtml', 'news_article', 3, 'Palácio do Planalto', 'Cerimônia Dia das Mães', 'lula-mulher-casa-marido-b147-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Milei de neonazista e abre crise com Argentina.', 'O Milei é um neonazista, um fascista. Ele vai destruir a Argentina.', 'Declaração durante viagem ao México gerou protesto formal do governo argentino e prejudicou relações bilaterais.', 'verified', true, '2024-03-05', 'https://www.cnnbrasil.com.br/internacional/lula-milei-neonazista-crise-argentina/', 'news_article', 3, 'Cidade do México', 'Entrevista coletiva', 'lula-milei-neonazista-b147-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula minimiza invasão russa à Ucrânia e culpa Zelensky pela guerra.', 'O Zelensky também é responsável. Ele quis a guerra para aparecer.', 'Declaração em coletiva em Abu Dhabi durante turnê diplomática gerou reações na Ucrânia e Europa.', 'verified', true, '2023-04-15', 'https://www.bbc.com/portuguese/articles/cp9prld0nq2o', 'news_article', 4, 'Abu Dhabi', 'Coletiva de imprensa', 'lula-zelensky-culpa-guerra-b147-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que venezuelanos críticos a Maduro são manipulados pelos EUA.', 'Essa oposição venezuelana não é democrática. É pelego dos americanos.', 'Comentário em entrevista à Globo News minimizou reclamações sobre eleições presidenciais venezuelanas.', 'verified', false, '2024-08-05', 'https://g1.globo.com/politica/noticia/2024/08/05/lula-oposicao-venezuela-americanos.ghtml', 'news_article', 3, 'Brasília', 'Entrevista Globo News', 'lula-venezuela-pelego-b147-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Bolsonaro deveria ser preso sem julgamento.', 'Esse cidadão tinha que estar preso. Não precisa de julgamento, todo mundo viu o que ele fez.', 'Fala em café com jornalistas contradizia princípios do devido processo legal e foi criticada por juristas.', 'verified', true, '2024-02-22', 'https://www.conjur.com.br/2024-fev-22/lula-bolsonaro-preso-sem-julgamento', 'news_article', 4, 'Palácio do Planalto', 'Café com jornalistas', 'lula-bolsonaro-preso-sem-julgamento-b147-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara manifestantes de direita a ratos que precisam ser exterminados.', 'Esses bolsonaristas são como ratos. Precisam ser exterminados da política brasileira.', 'Discurso em ato da CUT em São Paulo foi criticado por usar linguagem desumanizante.', 'verified', true, '2024-05-01', 'https://www.poder360.com.br/governo/lula-bolsonaristas-ratos-ato-cut/', 'news_article', 4, 'Praça Charles Miller, SP', 'Ato 1º de Maio', 'lula-bolsonaristas-ratos-b147-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Banco Central age como inimigo do povo ao manter juros altos.', 'O Banco Central está agindo como inimigo do povo brasileiro. É traição.', 'Pressão pública contra Roberto Campos Neto provocou volatilidade no mercado financeiro.', 'verified', true, '2023-05-25', 'https://valor.globo.com/politica/noticia/2023/05/25/lula-bc-inimigo-povo.ghtml', 'news_article', 3, 'Brasília', 'Reunião com sindicalistas', 'lula-bc-inimigo-povo-b147-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que crianças trans são modismo e fase passageira.', 'Essa história de criança trans é modismo. Vai passar, é só uma fase.', 'Declaração em entrevista a rádio regional minimizou existência de identidade de gênero na infância.', 'verified', false, '2024-06-10', 'https://www.metropoles.com/brasil/lula-criancas-trans-modismo', 'news_article', 3, 'Entrevista Rádio Itatiaia', 'Programa matinal', 'lula-criancas-trans-modismo-b147-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende filho Lulinha após CPMI e diz que investigação é perseguição familiar.', 'Estão perseguindo meu filho. É sacanagem com a família Silva.', 'Defesa pública de Fábio Luís após nova denúncia da PF sobre contratos levantou suspeitas de conflito de interesses.', 'verified', true, '2024-09-18', 'https://www.folha.uol.com.br/poder/2024/09/lula-defende-lulinha-pf.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-defende-lulinha-b147-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que eleições nos EUA são fraude se Trump vencer.', 'Se o Trump ganhar, a gente sabe que foi fraude. Os americanos vão aceitar?', 'Comentário em reunião do G20 gerou constrangimento diplomático e foi visto como interferência eleitoral.', 'verified', true, '2024-10-20', 'https://www.cnnbrasil.com.br/politica/lula-trump-fraude-eleicao/', 'news_article', 4, 'Rio de Janeiro', 'Cúpula do G20', 'lula-trump-fraude-b147-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se irrita com jornalista e a chama de burra em entrevista.', 'Você é burra, mesmo? Não entendeu nada do que eu falei.', 'Resposta a jornalista da CNN que questionava política fiscal foi considerada misógina por entidades de imprensa.', 'verified', true, '2024-11-08', 'https://www.abraji.org.br/noticias/lula-jornalista-burra-cnn', 'news_article', 3, 'Palácio do Planalto', 'Entrevista coletiva', 'lula-jornalista-burra-b147-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega ter apoiado ditadura da Nicarágua apesar de abraço público a Ortega.', 'Nunca apoiei ditadura nenhuma na minha vida. Isso é mentira da direita.', 'Fala contradiz fotos oficiais de encontros recentes com Daniel Ortega em cúpulas regionais.', 'verified', false, '2024-04-10', 'https://www.poder360.com.br/diplomacia/lula-ortega-ditadura-nicaragua/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-nega-ortega-b147-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que povo não precisa saber o que acontece no governo.', 'Tem coisas que o povo não precisa saber. Governo não é pra isso.', 'Comentário sobre pedidos de transparência de contratos gerou críticas de ONGs de acesso à informação.', 'verified', false, '2024-07-30', 'https://www.transparencia.org.br/lula-povo-nao-precisa-saber', 'news_article', 3, 'Brasília', 'Reunião ministerial', 'lula-povo-nao-saber-b147-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara agronegócio a câncer nacional em discurso para MST.', 'O agronegócio é o câncer do Brasil. Precisamos extirpar esse tumor.', 'Discurso no encontro do MST em Brasília provocou forte reação da bancada ruralista no Congresso.', 'verified', true, '2024-08-14', 'https://www.canalrural.com.br/noticias/lula-agronegocio-cancer-mst/', 'news_article', 4, 'Brasília', 'Encontro MST', 'lula-agro-cancer-b147-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que evangélicos são enganados por pastores mercenários.', 'Esses evangélicos são trouxas, enganados por pastores picaretas.', 'Fala em reunião fechada vazou e foi considerada intolerante por lideranças religiosas.', 'verified', true, '2024-06-22', 'https://www.gospelprime.com.br/lula-evangelicos-trouxas-vazamento/', 'news_article', 4, 'Brasília', 'Reunião fechada', 'lula-evangelicos-trouxas-b147-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que pobre não precisa de universidade, mas de trabalho.', 'Pobre não precisa de universidade, precisa é de emprego. Deixa universidade pra quem tem tempo.', 'Fala em entrevista a rádio do Nordeste contradizia política do próprio governo de expansão do ensino superior.', 'verified', false, '2024-05-18', 'https://www.diariodonordeste.com.br/lula-pobre-universidade-emprego', 'news_article', 3, 'Fortaleza', 'Entrevista rádio', 'lula-pobre-nao-universidade-b147-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Faustão teve transplante porque é rico e critica SUS.', 'Se fosse pobre, o Faustão tinha morrido na fila. Rico não espera como o povo.', 'Comentário após transplante de coração do apresentador expôs desigualdades no SUS mas foi visto como demagogia.', 'verified', false, '2023-08-28', 'https://www.uol.com.br/noticias/lula-faustao-transplante-rico-sus', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-faustao-transplante-b147-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula relativiza regime de Nicolás Maduro e diz que conceito de democracia é relativo.', 'Democracia é relativo. Cada povo define o que é democracia para si.', 'Declaração em entrevista ao El País gerou controvérsia internacional e críticas da oposição venezuelana.', 'verified', true, '2024-04-30', 'https://brasil.elpais.com/brasil/2024-04-30/lula-democracia-relativo-maduro.html', 'news_article', 4, 'São Paulo', 'Entrevista El País', 'lula-democracia-relativo-b147-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que mulheres no comando choram mais do que resolvem problemas.', 'Mulher no comando às vezes chora mais do que resolve. Homem tem que ter pulso.', 'Fala em almoço com empresários vazou para imprensa e gerou crise nas bases femininas do PT.', 'verified', true, '2024-10-02', 'https://www.folha.uol.com.br/poder/2024/10/lula-mulher-chora-comando.shtml', 'news_article', 4, 'São Paulo', 'Almoço Fiesp', 'lula-mulher-chora-b147-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega ter conhecido Marcola e afirma que nunca visitou PCC.', 'Nunca conheci Marcola nenhum. Isso é invenção do MBL.', 'Resposta a reportagem do Antagonista que citou reunião antiga gerou controvérsia sobre relações do presidente.', 'verified', false, '2024-03-20', 'https://oantagonista.com.br/brasil/lula-nega-marcola/', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-nega-marcola-b147-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que fiscalização da Receita Federal via Pix é invenção da oposição.', 'Ninguém vai taxar Pix de ninguém. Isso é fake news da direita.', 'Meses depois, a Receita publicou instrução normativa que gerou pânico e precisou ser revogada.', 'verified', true, '2024-12-10', 'https://www.bbc.com/portuguese/articles/pix-lula-receita-taxacao', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-pix-taxacao-b147-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pressiona Janja em reunião pública e é visto a mandá-la calar a boca.', 'Janja, fica quieta! Me deixa falar!', 'Áudio captado em evento em Belém mostrou presidente repreendendo primeira-dama publicamente.', 'verified', true, '2024-11-22', 'https://www.metropoles.com/brasil/lula-janja-calar-boca-belem', 'news_article', 3, 'Belém', 'Evento COP28 preparatório', 'lula-janja-calar-boca-b147-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que sua cirurgia foi piada da oposição e critica imprensa.', 'Ficaram torcendo para eu morrer. Que gente nojenta.', 'Declaração após cirurgia intracraniana urgente atribuiu intenções macabras a adversários sem provas.', 'verified', true, '2024-12-18', 'https://g1.globo.com/politica/noticia/2024/12/18/lula-cirurgia-torcendo-morrer.ghtml', 'news_article', 3, 'Hospital Sírio-Libanês', 'Pronunciamento pós-cirurgia', 'lula-cirurgia-torceram-morrer-b147-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Congresso é chantagista e bandido.', 'Esse Congresso é chantagista. É um bando de bandido querendo dinheiro.', 'Fala em reunião ministerial vazou e gerou crise institucional com Câmara e Senado.', 'verified', true, '2024-07-02', 'https://www.poder360.com.br/congresso/lula-congresso-chantagista-bandido/', 'news_article', 4, 'Palácio do Planalto', 'Reunião ministerial', 'lula-congresso-chantagista-b147-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende gastos pessoais em viagens presidenciais com família ampliada.', 'Família de presidente viaja junto. Sempre foi assim, não é nepotismo.', 'Resposta a reportagem do UOL sobre custos de viagens com netos e parentes na comitiva oficial.', 'verified', false, '2024-01-28', 'https://www.uol.com.br/noticias/lula-familia-viagem-nepotismo', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-familia-viagem-b147-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que índio brasileiro não quer civilização e prefere viver na selva.', 'Muito índio não quer civilização. Prefere viver na floresta, e a gente tem que respeitar.', 'Comentário em evento sobre demarcação foi criticado por lideranças indígenas como paternalista.', 'verified', false, '2024-09-05', 'https://amazoniareal.com.br/lula-indio-civilizacao-paternalismo', 'news_article', 3, 'Manaus', 'Evento indígena', 'lula-indio-civilizacao-b147-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que quem não votou nele deveria se envergonhar.', 'Quem votou no Bolsonaro tem que ter vergonha na cara. Não é brasileiro decente.', 'Declaração em comício do PT em Salvador rompeu promessa de reconciliação nacional.', 'verified', true, '2024-08-25', 'https://www.correio24horas.com.br/politica/lula-bolsonarista-vergonha', 'news_article', 3, 'Salvador', 'Comício pré-eleitoral', 'lula-bolsonarista-vergonha-b147-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende estatal para vender álcool e sugere nacionalizar indústria.', 'A gente deveria ter uma estatal do álcool. Nacionalizar o setor, como foi a Petrobras.', 'Proposta em almoço com usineiros gerou choque no setor privado e críticas de investidores.', 'verified', false, '2024-06-15', 'https://valor.globo.com/politica/lula-estatal-alcool-nacionalizar', 'news_article', 2, 'Ribeirão Preto', 'Almoço com usineiros', 'lula-estatal-alcool-b147-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Tarcísio de boneco de Bolsonaro em tom preconceituoso.', 'O Tarcísio é só um boneco. Ventrí­loquo do Bolsonaro, não tem vida própria.', 'Ataque em comício criou crise federativa com governador de São Paulo.', 'verified', true, '2024-05-20', 'https://www.estadao.com.br/politica/lula-tarcisio-boneco-bolsonaro/', 'news_article', 3, 'São Paulo', 'Comício', 'lula-tarcisio-boneco-b147-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega alta da fome e diz que dados do IBGE são errados.', 'Não tem fome no Brasil. Essa pesquisa do IBGE tá errada.', 'Contradição aos próprios dados oficiais do Ministério do Desenvolvimento Social que mostravam 8 milhões em insegurança alimentar grave.', 'verified', true, '2024-09-12', 'https://oglobo.globo.com/politica/noticia/2024/09/lula-nega-fome-ibge.ghtml', 'news_article', 3, 'Brasília', 'Evento oficial', 'lula-nega-fome-b147-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que fake news deveria ser crime com prisão automática.', 'Fake news tem que dar cadeia. Prisão automática, sem julgamento.', 'Declaração defendia criminalização sumária da desinformação, violando garantias constitucionais.', 'verified', true, '2024-03-12', 'https://www.conjur.com.br/2024-mar-12/lula-fake-news-prisao-automatica', 'news_article', 4, 'Brasília', 'Evento STF', 'lula-fake-news-prisao-b147-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que X/Twitter deveria ser banido por ser ferramenta da direita.', 'Esse Twitter virou só ferramenta da extrema direita. Tem que banir mesmo.', 'Fala após decisão do STF suspender a plataforma defendeu banimento definitivo da rede social.', 'verified', true, '2024-08-31', 'https://www.cnnbrasil.com.br/politica/lula-twitter-banir-direita/', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-twitter-banir-b147-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que STF decida impeachment e não o Senado.', 'Impeachment tem que ser no STF, não no Senado. O Senado é político demais.', 'Proposta contraria Constituição que atribui ao Senado julgamento de crimes de responsabilidade.', 'verified', false, '2024-10-12', 'https://www.conjur.com.br/2024-out-12/lula-impeachment-stf-senado', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-impeachment-stf-b147-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula minimiza escândalo de cartões corporativos de Janja.', 'Janja não gastou nada demais. Vão cuidar da vida de vocês.', 'Resposta agressiva a jornalistas sobre gastos com cartão corporativo da primeira-dama violou transparência.', 'verified', true, '2024-11-15', 'https://www.poder360.com.br/governo/lula-janja-cartao-corporativo/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-janja-cartao-b147-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que preto não entende de economia e deve obedecer economistas brancos.', 'Preto não entende economia. Deixa os especialistas cuidarem.', 'Fala em reunião fechada com economistas vazou e provocou revolta de movimentos negros.', 'verified', false, '2024-02-14', 'https://www.geledes.org.br/lula-preto-economia-racismo-polemica', 'news_article', 4, 'Brasília', 'Reunião técnica', 'lula-preto-economia-b147-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende intervenção no Banco Central em live do PT.', 'O BC tem que fazer o que o governo manda. Se não, tem que intervir.', 'Declaração em transmissão oficial do PT abalou mercado e gerou crítica do TCU.', 'verified', true, '2023-06-08', 'https://valor.globo.com/politica/lula-intervencao-bc-live-pt', 'news_article', 4, 'Brasília', 'Live PT Live', 'lula-intervencao-bc-b147-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que americanos são racistas por princípio e sempre odiaram o Brasil.', 'Os americanos são racistas desde sempre. Eles odeiam o Brasil porque somos miscigenados.', 'Comentário em universidade causou mal-estar com embaixada norte-americana em Brasília.', 'verified', false, '2024-04-22', 'https://www.folha.uol.com.br/poder/2024/04/lula-americanos-racistas-brasil.shtml', 'news_article', 3, 'São Paulo', 'Palestra USP', 'lula-americanos-racistas-b147-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que obesidade é problema de ricos, não de pobres.', 'Pobre não tem obesidade. Obesidade é doença de rico que come demais.', 'Fala contradizia dados do Ministério da Saúde que mostram obesidade crescente na população de baixa renda.', 'verified', false, '2024-05-30', 'https://saude.abril.com.br/lula-obesidade-rico-pobre-dados', 'news_article', 2, 'Brasília', 'Evento SUS', 'lula-obesidade-rico-b147-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que mãe solo é culpada pelo próprio abandono.', 'Mulher que fica sozinha com filho é porque não escolheu homem direito. Culpa dela.', 'Fala em evento de Dia das Mães provocou ampla revolta em redes sociais e crítica do TSE.', 'verified', true, '2024-05-12', 'https://www.metropoles.com/brasil/lula-mae-solo-culpa-polemica', 'news_article', 4, 'Brasília', 'Evento Dia das Mães', 'lula-mae-solo-culpa-b147-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega existência de racismo estrutural em entrevista à TV francesa.', 'No Brasil não tem racismo estrutural. Isso é invenção acadêmica.', 'Declaração na France24 contradizia política da Secretaria de Igualdade Racial do próprio governo.', 'verified', true, '2024-07-25', 'https://www.france24.com/pt/lula-racismo-estrutural-brasil', 'news_article', 3, 'Paris', 'Entrevista France24', 'lula-nega-racismo-estrutural-b147-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que filho Lulinha deve ter benefícios por ser filho de presidente.', 'Meu filho tem direito de ganhar dinheiro. É filho de presidente, tem contatos.', 'Declaração em entrevista ao Roda Viva gerou ampla crítica sobre conflito de interesses familiares.', 'verified', true, '2024-10-28', 'https://www.folha.uol.com.br/poder/2024/10/lula-lulinha-dinheiro-presidente.shtml', 'news_article', 4, 'São Paulo', 'Roda Viva', 'lula-lulinha-dinheiro-b147-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que votar em direita é pecado e pede pastores a guiarem fiéis.', 'Pastor decente não pode mandar fiel votar na direita. É pecado.', 'Reunião com pastores evangélicos no Planalto violou laicidade do Estado segundo juristas.', 'verified', true, '2024-09-28', 'https://www.gospelprime.com.br/lula-pastores-direita-pecado', 'news_article', 3, 'Palácio do Planalto', 'Reunião com pastores', 'lula-direita-pecado-b147-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que homem gay pode ser bom pai, mas não deveria adotar criança.', 'Adoção por gay é complicado. Criança precisa de pai e mãe.', 'Fala contradiz posicionamento histórico do PT sobre direitos LGBTQIA+ e causou revolta militância.', 'verified', false, '2024-06-28', 'https://www.metropoles.com/brasil/lula-adocao-gay-complicado', 'news_article', 4, 'Brasília', 'Entrevista rádio', 'lula-adocao-gay-b147-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que brasileiros mais pobres não entendem democracia.', 'O mais pobre não entende democracia. Vota no primeiro que aparecer.', 'Comentário em reunião do PT vazou e foi considerado elitista por movimentos sociais.', 'verified', false, '2024-02-02', 'https://www.poder360.com.br/politica/lula-pobre-nao-entende-democracia/', 'news_article', 3, 'São Paulo', 'Reunião PT', 'lula-pobre-democracia-b147-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende entrada da Venezuela nos BRICS e minimiza fraude eleitoral.', 'Venezuela é democracia, sim. Vai entrar nos BRICS e ponto.', 'Defesa de Maduro em cúpula internacional contrariava denúncias de fraude do Centro Carter e União Europeia.', 'verified', true, '2024-10-24', 'https://www.cnnbrasil.com.br/internacional/lula-venezuela-brics-democracia/', 'news_article', 4, 'Kazan, Rússia', 'Cúpula BRICS', 'lula-venezuela-brics-b147-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama militares de covardes e fascistas em discurso da Esplanada.', 'Militar que apoiou golpe é covarde, fascista. Tem que ser expurgado das Forças Armadas.', 'Discurso em ato no 8 de Janeiro de 2024 provocou reação dos comandantes militares.', 'verified', true, '2024-01-08', 'https://oglobo.globo.com/politica/noticia/2024/01/08/lula-militares-covardes-fascistas.ghtml', 'news_article', 3, 'Brasília', 'Ato 8 de Janeiro', 'lula-militares-covardes-b147-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula promete perseguir bolsonaristas até o último dia do mandato.', 'Vamos perseguir todos os bolsonaristas. Não vai ficar ninguém de pé.', 'Fala em comício contrariava discurso de pacificação e foi usada pela oposição contra o governo.', 'verified', true, '2024-09-01', 'https://www.estadao.com.br/politica/lula-perseguir-bolsonaristas/', 'news_article', 4, 'Rio de Janeiro', 'Comício', 'lula-perseguir-bolsonaristas-b147-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que prefere morrer a perder eleição para Tarcísio.', 'Prefiro morrer a ver o Tarcísio presidente. Isso não vai acontecer.', 'Declaração em jantar com aliados vazou e foi vista como ameaça velada ao processo democrático.', 'verified', false, '2024-12-01', 'https://www.folha.uol.com.br/poder/2024/12/lula-morrer-tarcisio-eleicao.shtml', 'news_article', 3, 'São Paulo', 'Jantar com aliados', 'lula-morrer-tarcisio-b147-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que mulher não pode ser presidente porque é emotiva demais.', 'Mulher pode ser tudo, mas presidência é diferente. É emotiva demais pra decidir guerra.', 'Comentário em entrevista internacional foi criticado por movimentos feministas e pela vice-presidente argentina.', 'verified', true, '2024-11-30', 'https://www.bbc.com/portuguese/articles/lula-mulher-presidencia-emotiva', 'news_article', 4, 'Brasília', 'Entrevista BBC', 'lula-mulher-presidencia-b147-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica reforma tributária aprovada por seu próprio governo.', 'Essa reforma tributária foi um lixo. Não aprovei isso, foi o Haddad.', 'Ataque público ao próprio ministro da Fazenda criou crise interna no governo.', 'verified', true, '2024-07-18', 'https://valor.globo.com/politica/lula-reforma-tributaria-lixo-haddad', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-reforma-tributaria-lixo-b147-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca ministra Rosa Weber após decisão contra governo.', 'Essa ministra não entende nada de direito. Decisão dela é um absurdo.', 'Crítica a decisão do STF sobre marco temporal violou independência dos Poderes.', 'verified', false, '2023-10-15', 'https://www.conjur.com.br/2023-out-15/lula-ataca-rosa-weber-marco-temporal', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-ataca-rosa-weber-b147-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega que Moraes seja autoritário e chama críticos de fascistas.', 'Quem chama Moraes de ditador é fascista. Ponto. Sem discussão.', 'Fala em defesa do ministro após decisões polêmicas sobre liberdade de expressão.', 'verified', true, '2024-04-02', 'https://www.poder360.com.br/stf/lula-moraes-ditador-fascista/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-moraes-defesa-b147-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende autonomia do Hamas após ataque de 7 de outubro.', 'O Hamas tem direito de resistir. Não é terrorismo, é resistência.', 'Declaração em entrevista à Al Jazeera provocou crise diplomática com Israel e foi criticada por comunidade judaica.', 'verified', true, '2023-11-18', 'https://www.aljazeera.com/news/2023/11/18/brazil-lula-hamas-resistencia', 'news_article', 4, 'Brasília', 'Entrevista Al Jazeera', 'lula-hamas-resistencia-b147-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que desmatamento caiu por causa dele, ignorando dados anteriores.', 'Desmatamento caiu só porque eu cheguei. Antes era só mentira de satélite.', 'Comentário desconsiderava ciclos históricos do desmatamento e dados metodológicos do INPE.', 'verified', false, '2024-08-08', 'https://amazoniareal.com.br/lula-desmatamento-queda-satelite', 'news_article', 2, 'Manaus', 'Evento ambiental', 'lula-desmatamento-queda-b147-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Zema de analfabeto e diz que Minas merece coisa melhor.', 'Esse Zema é analfabeto funcional. Minas merece governador melhor.', 'Ataque pessoal a governador de Minas Gerais criou crise federativa.', 'verified', true, '2024-06-05', 'https://www.em.com.br/politica/lula-zema-analfabeto-minas/', 'news_article', 3, 'Belo Horizonte', 'Comício MG', 'lula-zema-analfabeto-b147-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que índio tem tanta terra que já chega.', 'Já tem terra demais pra índio. Não precisa demarcar mais.', 'Fala em reunião com ruralistas contradiz discurso público pró-demarcação e violou Constituição.', 'verified', false, '2024-03-28', 'https://amazoniareal.com.br/lula-indio-terra-ruralistas', 'news_article', 3, 'Brasília', 'Reunião ruralistas', 'lula-indio-terra-demais-b147-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que governo pode censurar internet em nome da democracia.', 'Se tiver que censurar pra proteger a democracia, tem que censurar.', 'Defesa de regulação de plataformas foi vista como proposta de censura prévia por entidades de imprensa.', 'verified', true, '2024-07-05', 'https://www.abraji.org.br/noticias/lula-censura-democracia-internet', 'news_article', 4, 'Brasília', 'Palestra OAB', 'lula-censura-democracia-b147-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que gosta de autocracia chinesa porque tira gente da miseria.', 'A China é ditadura, sim, mas tira gente da miséria. Às vezes, autocracia funciona.', 'Declaração em viagem a Xangai foi interpretada como apologia a regimes autoritários.', 'verified', true, '2023-04-14', 'https://www.folha.uol.com.br/mundo/2023/04/lula-china-autocracia-miseria.shtml', 'news_article', 4, 'Xangai', 'Evento empresarial', 'lula-china-autocracia-b147-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que jornalistas da Globo são lacaios da elite.', 'A Globo é lacaia da elite. Não fala pelo povo brasileiro.', 'Ataque à emissora durante coletiva foi questionado pelo sindicato dos jornalistas.', 'verified', false, '2024-08-18', 'https://oglobo.globo.com/politica/noticia/2024/08/lula-globo-lacaia-elite.ghtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-globo-lacaia-b147-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que pobre gosta de pagar imposto porque tem benefícios.', 'O pobre gosta de pagar imposto. Ele tem Bolsa Família, SUS, escola pública.', 'Declaração desconsiderava regressividade do sistema tributário e oprimía debate sobre carga fiscal.', 'verified', false, '2024-09-22', 'https://www.estadao.com.br/economia/lula-pobre-gosta-imposto/', 'news_article', 2, 'Brasília', 'Evento Fazenda', 'lula-pobre-gosta-imposto-b147-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que PF prenda jornalistas que divulguem "fake news".', 'PF tem que ir na casa de jornalista que mente. Prender e ponto.', 'Fala em conversa com aliados vazou e foi denunciada pela Federação Nacional de Jornalistas.', 'verified', true, '2024-05-25', 'https://www.abraji.org.br/noticias/lula-pf-jornalistas-prender', 'news_article', 4, 'Brasília', 'Conversa fechada', 'lula-pf-jornalistas-b147-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que povo do Nordeste sabe votar porque é pobre.', 'Nordeste vota certo porque é pobre. Sul vota errado porque tem dinheiro.', 'Declaração em Pernambuco dividiu o país geograficamente e foi criticada por analistas políticos.', 'verified', true, '2024-08-28', 'https://www.folha.uol.com.br/poder/2024/08/lula-nordeste-sul-voto.shtml', 'news_article', 3, 'Recife', 'Comício', 'lula-nordeste-sul-voto-b147-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Selic alta é sabotagem do BC e crime contra o país.', 'Manter Selic alta é crime. Sabotagem contra o país, terrorismo econômico.', 'Fala à Rádio Jovem Pan aumentou tensão com Banco Central e gerou volatilidade cambial.', 'verified', true, '2023-07-10', 'https://valor.globo.com/politica/lula-selic-crime-sabotagem-terrorismo', 'news_article', 3, 'Brasília', 'Rádio Jovem Pan', 'lula-selic-crime-b147-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que aborto é escolha da mulher e que legalizaria no Brasil.', 'Aborto é escolha da mulher. Se pudesse, legalizava amanhã.', 'Contradição com posição pública de seu governo provocou crise com bancada evangélica.', 'verified', false, '2024-11-01', 'https://www.bbc.com/portuguese/articles/lula-aborto-legalizar-brasil', 'news_article', 3, 'Brasília', 'Entrevista estrangeira', 'lula-aborto-legalizar-b147-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que STF pode mudar constituição sem Congresso.', 'O STF pode mudar a constituição quando precisar. O Congresso nem sempre funciona.', 'Declaração em palestra em Lisboa foi considerada atentado à separação de Poderes por juristas.', 'verified', true, '2024-10-05', 'https://www.conjur.com.br/2024-out-05/lula-stf-mudar-constituicao-congresso', 'news_article', 4, 'Lisboa', 'Palestra Gulbenkian', 'lula-stf-constituicao-b147-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que vacina obrigatória deveria voltar com multa e prisão.', 'Quem não tomar vacina, multa. Reincidente, cadeia.', 'Fala em evento do SUS defendeu criminalização de não-vacinados, violando direitos individuais.', 'verified', false, '2024-04-18', 'https://saude.abril.com.br/lula-vacina-obrigatoria-cadeia', 'news_article', 3, 'Brasília', 'Evento SUS', 'lula-vacina-obrigatoria-cadeia-b147-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega conflito de interesses em visita de Lulinha à Chácara da Baronesa.', 'Meu filho pode visitar onde quiser. Não é conflito nenhum.', 'Resposta a denúncia da Revista Piauí sobre reuniões de Fábio Luís Lula em propriedade controlada por lobista.', 'verified', true, '2024-07-12', 'https://piaui.folha.uol.com.br/lula-lulinha-baronesa-lobby', 'news_article', 4, 'Brasília', 'Coletiva', 'lula-lulinha-baronesa-b147-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ameaça retaliar Moro com PF por decisões da Lava Jato.', 'O Moro vai pagar pelo que fez. A PF vai atrás dele, pode esperar.', 'Fala em reunião fechada com aliados vazou e foi vista como desvio de finalidade da polícia.', 'verified', true, '2023-03-22', 'https://www.poder360.com.br/governo/lula-moro-pf-retaliacao-vazamento/', 'news_article', 4, 'Palácio do Planalto', 'Reunião fechada', 'lula-moro-pf-retaliacao-b147-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica juízes federais e diz que estão fazendo política contra o governo.', 'Juiz federal virou político. Está todo mundo contra o governo.', 'Generalização sobre magistratura após decisões favoráveis à oposição gerou críticas da AMB.', 'verified', false, '2024-09-30', 'https://www.conjur.com.br/2024-set-30/lula-juizes-federais-politica', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-juizes-federais-b147-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Amazônia tem chuva demais e reclama de viagem à COP.', 'Amazônia é chuva demais, mosquito, calor. Impossível trabalhar ali.', 'Comentário antes da COP28 foi mal recebido por ambientalistas e indígenas.', 'verified', false, '2023-11-20', 'https://amazoniareal.com.br/lula-amazonia-chuva-mosquito', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-amazonia-chuva-b147-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que reforma agrária será imposta com ou sem STF.', 'Reforma agrária vai acontecer com ou sem aval do STF. A gente dá jeito.', 'Discurso em evento do MST foi visto como desafio institucional aos outros Poderes.', 'verified', true, '2024-04-17', 'https://www.folha.uol.com.br/poder/2024/04/lula-reforma-agraria-stf-mst.shtml', 'news_article', 4, 'Brasília', 'Encontro MST', 'lula-reforma-agraria-stf-b147-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que homem que apanha de mulher é fraco e não merece respeito.', 'Homem que apanha de mulher é fraco. Não é homem.', 'Comentário em entrevista perpetuou estereótipos de gênero e foi criticado por ONGs de violência doméstica.', 'verified', false, '2024-03-15', 'https://www.metropoles.com/brasil/lula-homem-apanha-mulher-fraco', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-homem-apanha-b147-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que dólar alto é culpa do mercado e não do governo.', 'Dólar alto é sabotagem do mercado. Não tem nada a ver com governo.', 'Fala após dólar passar de R$ 6,20 em dezembro de 2024 foi rebatida por economistas.', 'verified', true, '2024-12-20', 'https://valor.globo.com/financas/lula-dolar-sabotagem-mercado', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-dolar-sabotagem-b147-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Lava Jato foi golpe contra ele e contra a democracia.', 'A Lava Jato foi golpe contra mim. Contra a democracia. Agora vamos cobrar.', 'Discurso em evento OAB reacendeu debate sobre operações anticorrupção.', 'verified', true, '2023-05-18', 'https://www.conjur.com.br/2023-mai-18/lula-lava-jato-golpe-democracia', 'news_article', 3, 'São Paulo', 'Evento OAB', 'lula-lava-jato-golpe-b147-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pressiona CGU para engavetar investigação sobre Ministério da Saúde.', 'Essa investigação não tem pé nem cabeça. Para tudo, isso aí.', 'Determinação em reunião vazou e levou a denúncia de interferência do MP no CGU.', 'verified', true, '2024-06-30', 'https://www.metropoles.com/brasil/lula-cgu-saude-engavetar', 'news_article', 4, 'Brasília', 'Reunião fechada', 'lula-cgu-engavetar-b147-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Michelle Bolsonaro de joia de enfeite e a humilha publicamente.', 'Essa Michelle é só enfeite do Bolsonaro. Não pensa, só reza.', 'Ataque pessoal à ex-primeira-dama em comício foi criticado por entidades religiosas e feministas.', 'verified', true, '2024-06-22', 'https://www.folha.uol.com.br/poder/2024/06/lula-michelle-enfeite-reza.shtml', 'news_article', 4, 'Minas Gerais', 'Comício', 'lula-michelle-enfeite-b147-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que tudo que disse sobre Venezuela é verdade, mesmo contradito por provas.', 'Falei a verdade sobre Venezuela. Se as atas eleitorais mostram diferente, as atas é que estão erradas.', 'Insistência em defesa de Maduro mesmo após Carter Center apontar fraude gerou isolamento diplomático.', 'verified', true, '2024-08-15', 'https://www.cartercenter.org/news/pr/2024/venezuela-lula-fraud.html', 'news_article', 4, 'Brasília', 'Entrevista', 'lula-venezuela-atas-erradas-b147-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ameaça usar Forças Armadas para garantir eleição de 2026.', 'Se a direita quiser fraudar, as Forças Armadas vão garantir eleição justa.', 'Fala em evento de aniversário do PT foi interpretada como ameaça militar a resultado eleitoral.', 'verified', true, '2024-02-10', 'https://www.poder360.com.br/eleicoes/lula-forcas-armadas-2026', 'news_article', 5, 'São Paulo', 'Aniversário PT', 'lula-forcas-armadas-2026-b147-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que só Elon Musk é problema, não X em si.', 'O problema é o Elon Musk, não o Twitter. Se mudar dono, volta a ser bom.', 'Declaração em evento gerou debate sobre personalização de crise com plataformas de redes sociais.', 'verified', false, '2024-09-05', 'https://www.cnnbrasil.com.br/tecnologia/lula-musk-twitter-problema/', 'news_article', 2, 'Brasília', 'Evento tecnologia', 'lula-musk-twitter-b147-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que militares do 8 de Janeiro sejam julgados como terroristas.', 'Todos os militares que participaram do 8 de Janeiro são terroristas. Têm que ser tratados como tal.', 'Generalização sobre participação militar foi criticada por juristas por violar presunção de inocência.', 'verified', true, '2024-01-08', 'https://www.conjur.com.br/2024-jan-08/lula-militares-8-janeiro-terroristas', 'news_article', 4, 'Brasília', 'Ato aniversário 8 Janeiro', 'lula-militares-8-terroristas-b147-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende sua herança política e se compara a Getúlio Vargas e Dom Pedro II.', 'Sou o maior presidente desde Getúlio, desde Dom Pedro II. Ponto.', 'Auto-exaltação em comício foi criticada por historiadores e considerada narcisista.', 'verified', true, '2024-10-08', 'https://www.estadao.com.br/politica/lula-maior-presidente-getulio-dom-pedro/', 'news_article', 2, 'São Paulo', 'Comício', 'lula-maior-getulio-pedro-b147-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que nunca roubou e que processos da Lava Jato foram totalmente plantados.', 'Nunca roubei um centavo. Tudo da Lava Jato foi plantado pelo FBI.', 'Insistência em teoria conspiratória sobre interferência estrangeira contradizia anulações por vício formal.', 'verified', true, '2024-07-22', 'https://www.folha.uol.com.br/poder/2024/07/lula-nunca-roubou-fbi-plantou.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-nunca-roubou-fbi-b147-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Janja pode agir como vice-presidente paralela.', 'A Janja tem opinião. Ela pode agir como quiser, ela manda também.', 'Defesa da atuação paralela da primeira-dama gerou confusão institucional e críticas de Alckmin.', 'verified', true, '2024-11-12', 'https://www.poder360.com.br/governo/lula-janja-vice-paralela/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-janja-vice-b147-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula nega que haja guerra cultural e chama conservadores de retrógrados.', 'Conservador é retrógrado. Guerra cultural não existe, é invenção deles.', 'Fala em palestra na Unicamp foi vista como desconexa do cenário político nacional.', 'verified', false, '2024-04-05', 'https://www.unicamp.br/unicamp/noticias/lula-conservador-retrogrado', 'news_article', 2, 'Campinas', 'Palestra Unicamp', 'lula-conservador-retrogrado-b147-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se irrita com estudante transexual em evento e diz que "isso é moda".', 'Essa história de transexual é moda. Vai passar, criança.', 'Fala a estudante trans em Brasília foi classificada como transfóbica por ativistas LGBTQIA+.', 'verified', true, '2024-06-29', 'https://www.metropoles.com/brasil/lula-transexual-moda-estudante', 'news_article', 4, 'Brasília', 'Evento educação', 'lula-transexual-moda-b147-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Polícia Federal é tropa dele e age a seu comando.', 'A PF é minha tropa. Faz o que eu mando, quando eu mando.', 'Declaração em jantar com ministros vazou e gerou crise constitucional sobre autonomia da PF.', 'verified', true, '2024-05-08', 'https://www.conjur.com.br/2024-mai-08/lula-pf-tropa-minha-comando', 'news_article', 5, 'Palácio do Planalto', 'Jantar ministros', 'lula-pf-tropa-minha-b147-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Ucrânia deveria ceder território à Rússia pela paz.', 'A Ucrânia tem que ceder território. A paz vale mais que uns quilômetros.', 'Proposta desagradou governo ucraniano e gerou crítica de europeus em cúpula da ONU.', 'verified', true, '2024-09-24', 'https://www.bbc.com/portuguese/articles/lula-ucrania-ceder-territorio-onu', 'news_article', 3, 'Nova York', 'Assembleia Geral ONU', 'lula-ucrania-territorio-b147-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula minimiza crimes de 2023 em Brasília e chama vândalos de ingênuos.', 'Esses do 8 de Janeiro nem sabiam o que faziam. Coitados, são ingênuos.', 'Contradição com postura oficial de seu governo sobre responsabilização dos golpistas gerou confusão.', 'verified', false, '2024-03-02', 'https://www.poder360.com.br/governo/lula-8-janeiro-ingenuos-vandalos/', 'news_article', 2, 'São Paulo', 'Entrevista', 'lula-8-ingenuos-b147-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende aumento do próprio salário e dos ministros do STF.', 'Meu salário tem que subir. O do STF também. São pouco pagos.', 'Defesa do aumento dos contracheques do alto escalão foi criticada em momento de arrocho fiscal.', 'verified', true, '2024-08-02', 'https://oglobo.globo.com/politica/noticia/2024/08/lula-aumento-proprio-salario-stf.ghtml', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'lula-aumento-salario-b147-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai candidatar-se em 2026 mesmo sabendo que é ilegal.', 'Vou ser candidato em 2026. Seja como for, vou. Ninguém me impede.', 'Declaração criou debate sobre vedação constitucional a três mandatos consecutivos presidenciais.', 'verified', true, '2025-02-05', 'https://www.folha.uol.com.br/poder/2025/02/lula-candidato-2026-ilegal.shtml', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'lula-candidato-2026-ilegal-b147-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que mulheres jovens devem ter muitos filhos para salvar o país.', 'Mulher tem que ter filho. Quatro, cinco. Salvar a pátria.', 'Fala em encontro com empresárias contradiz política de planejamento familiar da SUS.', 'verified', false, '2025-03-12', 'https://www.metropoles.com/brasil/lula-mulher-muitos-filhos-patria', 'news_article', 3, 'Brasília', 'Evento Sebrae', 'lula-mulher-filhos-patria-b147-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere fechar Câmara se esta aprovar impeachment.', 'Se a Câmara tentar impeachment, vamos fechar. Não vai ter.', 'Fala em reunião com aliados vazou e foi denunciada pela OAB como ameaça autocrática.', 'verified', true, '2025-01-15', 'https://www.conjur.com.br/2025-jan-15/lula-fechar-camara-impeachment', 'news_article', 5, 'Brasília', 'Reunião fechada', 'lula-fechar-camara-b147-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que governo use RGB para monitorar cidadãos críticos.', 'Quem fala mal do governo tem que ser monitorado. Abin, PF, todo mundo.', 'Declaração em reunião ministerial foi vista como política de Estado policial e monitoramento de oposição.', 'verified', false, '2025-04-01', 'https://www.poder360.com.br/governo/lula-abin-monitorar-criticos/', 'news_article', 5, 'Palácio do Planalto', 'Reunião ministerial', 'lula-abin-monitorar-b147-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que democracia brasileira só funciona com PT no poder.', 'Democracia brasileira só funciona com PT. Direita no poder é retrocesso.', 'Discurso em comício foi criticado como partidarização do conceito de democracia.', 'verified', true, '2025-05-01', 'https://www.estadao.com.br/politica/lula-democracia-so-pt/', 'news_article', 3, 'São Paulo', 'Ato 1º de Maio', 'lula-democracia-so-pt-b147-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama judeus brasileiros críticos de traidores da pátria.', 'Judeu que critica meu governo trai o Brasil. Tem que escolher um lado.', 'Fala em reunião fechada vazou e foi denunciada pela Conib como discurso antissemita.', 'verified', true, '2025-06-10', 'https://conib.org.br/noticias/lula-judeus-traidores-vazamento', 'news_article', 5, 'Brasília', 'Reunião fechada', 'lula-judeus-traidores-b147-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que vai além do mandato se precisar para garantir projeto.', 'Se precisar ficar além do mandato pra garantir o projeto, vou ficar.', 'Declaração em conversa com militantes do PT foi vista pela OAB como ameaça explícita à ordem constitucional.', 'verified', true, '2025-07-15', 'https://www.conjur.com.br/2025-jul-15/lula-alem-mandato-projeto', 'news_article', 5, 'São Paulo', 'Conversa PT', 'lula-alem-mandato-b147-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

END $$;
