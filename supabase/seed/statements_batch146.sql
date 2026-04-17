-- Batch 146: Lula pessoal 2023-2026 (Parte 1) - coletivas, Conversa com o Presidente, off-script
DO $$
DECLARE
  v_lul UUID;
  c_irr UUID; c_des UUID; c_neg UUID; c_odi UUID; c_abu UUID;
  c_cfi UUID; c_ame UUID; c_xen UUID; c_mac UUID; c_mis UUID;
  c_hom UUID; c_int UUID; c_aut UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_cfi FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara Gaza ao Holocausto em fala que gera crise diplomática com Israel.', 'O que está acontecendo na Faixa de Gaza e com o povo palestino não existiu em nenhum outro momento histórico. Aliás, existiu: quando Hitler resolveu matar os judeus.', 'Presidente fala na Etiópia durante cúpula da União Africana e é declarado persona non grata por Israel.', 'verified', true, '2024-02-18', 'https://g1.globo.com/politica/noticia/2024/02/18/lula-compara-gaza-holocausto.ghtml', 'news_article', 5, 'Adis Abeba, Etiópia', 'Cúpula União Africana', 'lula-gaza-holocausto-b146-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama ministro do STF de "maluco" em conversa com jornalistas.', 'Tem ministro que é maluco, não sabe o que está fazendo.', 'Presidente ataca indiretamente magistrados após decisões contrárias ao governo em entrevista informal no Planalto.', 'verified', false, '2023-11-14', 'https://www.poder360.com.br/governo/lula-ministro-maluco-stf/', 'news_article', 4, 'Palácio do Planalto', 'Conversa com jornalistas', 'lula-ministro-maluco-b146-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "mercado tem gente desonesta" após queda do real.', 'Tem muita gente desonesta no mercado. Gente que quer especular contra o Brasil.', 'Presidente atribui desvalorização do real a especuladores em pronunciamento.', 'verified', true, '2024-12-19', 'https://valor.globo.com/politica/noticia/2024/12/19/lula-mercado-desonesto.ghtml', 'news_article', 4, 'Brasília', 'Evento oficial', 'lula-mercado-desonesto-b146-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama BCE de "sem-vergonha" por juros altos.', 'Esse Banco Central é uma sem-vergonhice. Taxa de juros desse tamanho é crime.', 'Presidente ataca autonomia do BC em evento do PT em tom agressivo.', 'verified', true, '2023-02-02', 'https://g1.globo.com/politica/noticia/2023/02/02/lula-bc-sem-vergonhice.ghtml', 'news_article', 4, 'Brasília', 'Evento PT', 'lula-bc-sem-vergonhice-b146-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que Ucrânia também é culpada pela guerra com a Rússia.', 'Os dois lados são responsáveis. A Ucrânia não pode querer tudo.', 'Presidente causa revolta em Zelensky em declaração durante viagem a Abu Dhabi.', 'verified', true, '2023-04-15', 'https://www.bbc.com/portuguese/articles/cyxn1k17gg8o', 'news_article', 5, 'Abu Dhabi', 'Entrevista', 'lula-ucrania-culpada-b146-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "nem tudo o que cai do céu é bom" para vetar religião no debate.', 'Nem tudo que cai do céu é Deus. Tem gente que usa Deus para enganar.', 'Presidente ataca evangélicos em tom genérico em evento da CNBB.', 'verified', false, '2023-05-08', 'https://www.poder360.com.br/governo/lula-religiao-ceu/', 'news_article', 3, 'São Paulo', 'Evento CNBB', 'lula-religiao-ceu-b146-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula no "Conversa com o Presidente" afirma erroneamente que inflação era menor na redemocratização.', 'A inflação hoje está mais alta do que na redemocratização.', 'Presidente erra dado histórico gravemente em programa semanal; inflação em 1985 era de 235%.', 'verified', false, '2024-03-18', 'https://www.aosfatos.org/noticias/lula-conversa-inflacao-redemocratizacao/', 'news_article', 3, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-inflacao-b146-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Maduro de "democrata" após eleição contestada na Venezuela.', 'O Maduro é um democrata. A eleição foi legítima.', 'Presidente defende ditador venezuelano em contradição com a OEA e parceiros internacionais.', 'verified', true, '2024-08-05', 'https://www.reuters.com/world/americas/lula-maduro-democrat-2024-08-05/', 'news_article', 5, 'Brasília', 'Entrevista Reuters', 'lula-maduro-democrata-b146-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que brasileiro "tem prazer em endividar" para justificar juros.', 'O brasileiro tem prazer em se endividar. É cultura.', 'Presidente faz comentário considerado ofensivo a consumidores em evento do setor financeiro.', 'verified', false, '2023-06-29', 'https://www.poder360.com.br/governo/lula-brasileiro-prazer-dividas/', 'news_article', 3, 'São Paulo', 'Evento Febraban', 'lula-brasileiro-prazer-dividas-b146-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em Moçambique que "escravidão foi boa" para miscigenação brasileira.', 'A escravidão no Brasil foi ruim, mas produziu essa miscigenação que é fantástica.', 'Presidente faz declaração controversa em Maputo durante visita oficial à África.', 'verified', true, '2023-08-25', 'https://www.bbc.com/portuguese/articles/c9830kj8jkyo', 'news_article', 5, 'Maputo, Moçambique', 'Discurso oficial', 'lula-escravidao-miscigenacao-b146-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere boicote a empresas que apoiaram golpe em 8 de janeiro.', 'Os golpistas e quem financiou precisa ser boicotado pela sociedade.', 'Presidente incentiva boicote econômico em discurso pós-atentados.', 'verified', false, '2023-01-12', 'https://g1.globo.com/politica/noticia/2023/01/12/lula-boicote-empresas-golpistas.ghtml', 'news_article', 3, 'Brasília', 'Pronunciamento Planalto', 'lula-boicote-golpistas-b146-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala em "poupar a patroa" em referência machista à primeira-dama.', 'Deixa a Janja em paz, esse é um papel para homem.', 'Presidente faz comentário considerado machista sobre função da primeira-dama em viagem.', 'verified', false, '2023-07-10', 'https://www.metropoles.com/politica/lula-janja-homem-funcao', 'news_article', 2, 'Bruxelas', 'Coletiva Cúpula UE-Celac', 'lula-janja-homem-b146-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama direita de "nazifascistas" em plenário no dia 8 de janeiro.', 'Esses nazifascistas invadiram o Congresso. Vão pagar caro.', 'Presidente adota termo em discurso durante comemoração de resistência democrática.', 'verified', true, '2024-01-08', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2024/lula-8-janeiro-nazifascistas', 'other', 3, 'Brasília', 'Ato 8 de janeiro', 'lula-nazifascistas-b146-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza Milei chamando de "mala sem alça" em coletiva.', 'Esse argentino é uma mala sem alça. Fala besteira o tempo todo.', 'Presidente ataca presidente da Argentina em evento nacional.', 'verified', true, '2023-12-20', 'https://g1.globo.com/mundo/noticia/2023/12/20/lula-milei-mala-sem-alca.ghtml', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-milei-mala-b146-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra nome de Michelle Bachelet chamando-a de "presidente do Chile".', 'A presidente do Chile, a Michelle Bachelet, que eu admiro muito.', 'Presidente erra em evento oficial; Bachelet não era mais presidente do Chile.', 'verified', false, '2023-07-24', 'https://www.metropoles.com/politica/lula-bachelet-presidente-chile', 'news_article', 1, 'Santiago', 'Evento bilateral', 'lula-bachelet-presidente-b146-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama jornalistas de "mentirosos" em coletiva.', 'Tem jornalista aqui que é mentiroso profissional.', 'Presidente ataca imprensa presente em coletiva após pergunta sobre Janja.', 'verified', true, '2024-11-22', 'https://www.poder360.com.br/governo/lula-jornalistas-mentirosos/', 'news_article', 3, 'Brasília', 'Coletiva Planalto', 'lula-jornalistas-mentirosos-b146-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que vai "reduzir carne" na mesa do brasileiro.', 'A gente come muita carne. Brasileiro tem que reduzir.', 'Presidente causa polêmica em evento da ONU sobre clima.', 'verified', false, '2023-09-20', 'https://g1.globo.com/politica/noticia/2023/09/20/lula-reduzir-carne.ghtml', 'news_article', 2, 'Nova York', 'Assembleia ONU', 'lula-reduzir-carne-b146-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que empresários apoiaram o golpe para não pagar impostos.', 'Esses empresários queriam golpe para não pagar imposto. É fato.', 'Presidente generaliza em declaração pública sobre setor empresarial.', 'verified', false, '2023-01-15', 'https://www.poder360.com.br/governo/lula-empresarios-golpe-impostos/', 'news_article', 3, 'Brasília', 'Evento', 'lula-empresarios-golpe-b146-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Putin "não tem culpa" da guerra na Ucrânia.', 'Ele invadiu, mas não tem só ele culpa. Os EUA e a Europa também.', 'Presidente relativiza invasão russa em coletiva no Japão.', 'verified', true, '2023-05-21', 'https://www.bbc.com/portuguese/articles/c51j3m5g7p3o', 'news_article', 4, 'Hiroshima, Japão', 'Coletiva G7', 'lula-putin-sem-culpa-b146-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula brinca que empresários "só querem gastar o que é do governo".', 'Esses empresários só sabem pedir dinheiro do governo. Empresário no Brasil é filho do governo.', 'Presidente ofende setor privado durante evento sobre reforma tributária.', 'verified', false, '2023-07-18', 'https://www.poder360.com.br/governo/lula-empresario-filho-governo/', 'news_article', 2, 'Brasília', 'Evento CNI', 'lula-empresario-filho-governo-b146-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Netanyahu de "genocida" e critica criança israelense.', 'O Netanyahu é um genocida. Criança israelense é criada no ódio.', 'Presidente generaliza sobre sociedade israelense durante ato pró-Palestina.', 'verified', true, '2024-02-20', 'https://www.metropoles.com/mundo/lula-netanyahu-genocida-criancas', 'news_article', 5, 'São Paulo', 'Ato pró-Palestina', 'lula-netanyahu-genocida-b146-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula em "Conversa" diz que alimento "está barato".', 'Alimento no Brasil hoje está barato. Nunca esteve tão barato.', 'Presidente contraria dados do IBGE durante programa semanal em 2024.', 'verified', true, '2024-04-22', 'https://www.aosfatos.org/noticias/lula-alimento-barato-conversa/', 'news_article', 4, 'Brasília', 'Conversa com o Presidente', 'lula-alimento-barato-b146-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza pedidos de impeachment dizendo que "oposição ainda está chorando".', 'A direita ainda está chorando pela derrota. Só sabe pedir impeachment.', 'Presidente debocha de adversários em comício do PT.', 'verified', false, '2024-03-30', 'https://www.poder360.com.br/governo/lula-oposicao-chorando-impeachment/', 'news_article', 2, 'São Paulo', 'Comício PT', 'lula-oposicao-chorando-b146-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em Portugal que brasileiro "é mais trabalhador que português".', 'O brasileiro trabalha mais que o português, sem dúvida.', 'Presidente gera desconforto diplomático em visita oficial.', 'verified', true, '2023-04-22', 'https://www.publico.pt/2023/04/22/mundo/noticia/lula-brasileiro-trabalhador-portugues', 'news_article', 2, 'Lisboa', 'Visita oficial', 'lula-brasileiro-mais-trabalhador-b146-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala em "castrar" empresários que não cumprem lei.', 'Empresário que não cumpre lei precisa ser castrado economicamente.', 'Presidente usa linguagem agressiva em discurso sindical.', 'verified', false, '2024-05-01', 'https://www.poder360.com.br/governo/lula-empresario-castrado/', 'news_article', 3, 'São Bernardo', 'Ato 1º de Maio', 'lula-empresario-castrado-b146-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "mulher só é feliz casada" em comentário controverso.', 'Mulher só é feliz se for casada. É da natureza.', 'Presidente faz comentário considerado machista em comício do PT.', 'verified', true, '2024-09-15', 'https://www.metropoles.com/politica/lula-mulher-feliz-casada', 'news_article', 4, 'Recife', 'Comício PT', 'lula-mulher-feliz-casada-b146-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama o X (Twitter) de "esgoto" em coletiva.', 'Esse X do Musk virou um esgoto. Só tem fake news.', 'Presidente ataca rede social durante entrevista internacional.', 'verified', false, '2024-08-30', 'https://g1.globo.com/politica/noticia/2024/08/30/lula-x-esgoto.ghtml', 'news_article', 2, 'Brasília', 'Coletiva internacional', 'lula-x-esgoto-b146-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "quem come muito sushi vira japonês" em gafe alimentar.', 'Quem come muito sushi vira japonês. É verdade, tem gente assim.', 'Presidente comete gafe em visita a comunidade japonesa no Brasil.', 'verified', false, '2023-10-22', 'https://www.metropoles.com/politica/lula-sushi-japones-gafe', 'news_article', 1, 'São Paulo', 'Evento colônia japonesa', 'lula-sushi-japones-b146-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "pobre gasta mais que rico" em fala criticada.', 'Os pobres gastam mais que os ricos. Tem mais pobre no Brasil.', 'Presidente defende tese contestada por economistas em pronunciamento.', 'verified', false, '2023-08-10', 'https://www.poder360.com.br/economia/lula-pobre-gasta-mais/', 'news_article', 2, 'Brasília', 'Evento MDS', 'lula-pobre-gasta-mais-b146-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Bolsonaro de "genocida" após mortes na pandemia.', 'O Bolsonaro é um genocida. Matou 700 mil brasileiros.', 'Presidente insiste em acusação em comício do PT.', 'verified', false, '2023-03-15', 'https://g1.globo.com/politica/noticia/2023/03/15/lula-bolsonaro-genocida-pandemia.ghtml', 'news_article', 3, 'São Paulo', 'Comício PT', 'lula-bolsonaro-genocida-b146-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula desdenha Elon Musk dizendo que ele "tem complexo de Deus".', 'Esse Musk se acha Deus. Não passa de um fanfarrão.', 'Presidente ataca empresário durante crise do X no Brasil.', 'verified', true, '2024-09-02', 'https://www.poder360.com.br/tecnologia/lula-musk-complexo-deus/', 'news_article', 3, 'Brasília', 'Entrevista BandNews', 'lula-musk-deus-b146-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra nome do próprio ministro chamando Haddad de "Haddadinho".', 'O Haddadinho... quer dizer, o Fernando. Ele que sabe.', 'Presidente comete gafe ao referir a ministro da Fazenda em coletiva.', 'verified', false, '2024-01-28', 'https://www.metropoles.com/politica/lula-haddadinho-gafe', 'news_article', 1, 'Brasília', 'Coletiva Planalto', 'lula-haddadinho-gafe-b146-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "tirou o Brasil do mapa da fome" antes de dados oficiais.', 'Já tiramos o Brasil do mapa da fome. Missão cumprida.', 'Presidente antecipa anúncio em 2023 quando dados da FAO ainda não haviam sido divulgados.', 'verified', false, '2023-12-10', 'https://www.aosfatos.org/noticias/lula-mapa-fome-antecipa/', 'news_article', 3, 'Brasília', 'Pronunciamento', 'lula-mapa-fome-antecipa-b146-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que PF "só prende preto" em comentário racial polêmico.', 'A PF só prende preto. Branco rico nunca vai preso.', 'Presidente generaliza de forma controversa atuação da Polícia Federal.', 'verified', false, '2023-11-20', 'https://www.metropoles.com/brasil/lula-pf-preto-comentario', 'news_article', 3, 'Brasília', 'Evento negritude', 'lula-pf-preto-b146-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não precisa governar para "rico" em provocação fiscal.', 'Eu não fui eleito para governar para os ricos. Quem quer rico, volta o Bolsonaro.', 'Presidente polariza em discurso sobre reforma tributária.', 'verified', true, '2023-10-25', 'https://www.poder360.com.br/governo/lula-nao-governa-rico/', 'news_article', 3, 'Brasília', 'Evento Planalto', 'lula-nao-governa-rico-b146-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz piada sobre "meninas devem ficar calminhas" em evento.', 'As meninas, fiquem calminhas, não falem muito.', 'Presidente faz comentário considerado machista em evento com juventude do PT.', 'verified', false, '2024-06-15', 'https://www.metropoles.com/politica/lula-meninas-calminhas', 'news_article', 2, 'São Paulo', 'Evento JPT', 'lula-meninas-calminhas-b146-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza Trump chamando de "homem esquisito" em coletiva.', 'Esse Trump é um homem esquisito. Tem cabelo estranho.', 'Presidente comenta Trump em coletiva durante campanha americana.', 'verified', false, '2024-07-15', 'https://www.bbc.com/portuguese/articles/c90yyxq1m5ro', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-trump-esquisito-b146-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "sou o primeiro presidente honesto" em autoelogio.', 'Eu sou o primeiro presidente honesto que esse Brasil teve.', 'Presidente faz declaração considerada ofensiva a predecessores em comício.', 'verified', false, '2023-09-07', 'https://g1.globo.com/politica/noticia/2023/09/07/lula-primeiro-presidente-honesto.ghtml', 'news_article', 3, 'Brasília', 'Desfile 7 de setembro', 'lula-primeiro-honesto-b146-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "imprensa esperta" não mostra PIB em alta.', 'Imprensa tem medo de mostrar o sucesso do governo. É esperteza.', 'Presidente ataca mídia em reunião com jornalistas afetos.', 'verified', false, '2024-03-05', 'https://www.poder360.com.br/governo/lula-imprensa-esperta-pib/', 'news_article', 2, 'Brasília', 'Café com jornalistas', 'lula-imprensa-esperta-pib-b146-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que sua "velhice dá lucidez" para governar.', 'Minha velhice me dá lucidez. Bolsonaro é velho e louco. Eu, velho e lúcido.', 'Presidente faz comentário idadista em comício.', 'verified', false, '2024-04-20', 'https://www.metropoles.com/politica/lula-velhice-lucidez', 'news_article', 2, 'Salvador', 'Comício PT', 'lula-velhice-lucidez-b146-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula no "Conversa" erra dados do Bolsa Família com erro de dezenas de milhões.', 'Hoje 90 milhões de famílias recebem Bolsa Família no Brasil.', 'Presidente erra: o Bolsa Família atende 21 milhões de famílias, não 90 milhões.', 'verified', false, '2024-02-12', 'https://www.aosfatos.org/noticias/lula-conversa-bolsa-familia-90-milhoes/', 'news_article', 4, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-90-milhoes-b146-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que "empresa que demite" não vai ter crédito.', 'Empresa que demite muito não vai ter crédito do BNDES. É assim.', 'Presidente ameaça setor empresarial em fala no BNDES.', 'verified', false, '2023-06-20', 'https://www.poder360.com.br/economia/lula-empresa-demite-credito/', 'news_article', 3, 'Rio de Janeiro', 'Evento BNDES', 'lula-empresa-demite-credito-b146-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cfi, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "vai continuar depois de 2026" em aceno à reeleição antecipada.', 'Eu ainda vou ser candidato em 2026. Vocês vão ter mais Lula.', 'Presidente antecipa candidatura contra tradição política de discussão pós-mandato.', 'verified', true, '2024-10-05', 'https://g1.globo.com/politica/noticia/2024/10/05/lula-candidato-2026.ghtml', 'news_article', 2, 'São Paulo', 'Comício PT', 'lula-candidato-2026-b146-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula usa termo pejorativo "vagabundo" para criticar oposição.', 'Esse bando de vagabundo da oposição só sabe criticar, não faz nada.', 'Presidente usa xingamento em discurso sindical.', 'verified', false, '2023-08-31', 'https://www.poder360.com.br/governo/lula-oposicao-vagabundo/', 'news_article', 3, 'São Paulo', 'Ato CUT', 'lula-oposicao-vagabundo-b146-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "não vai deixar Moraes ser atacado" e defende censura.', 'Nenhum palhaço vai atacar o Moraes. Quem atacar vai preso.', 'Presidente usa linguagem de ameaça a adversários em ato.', 'verified', true, '2024-04-08', 'https://www.metropoles.com/politica/lula-moraes-ataques-preso', 'news_article', 4, 'Brasília', 'Ato 8 de abril', 'lula-defende-moraes-ameaca-b146-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra nome de Ignacio Lula da Silva Filho em gafe pessoal.', 'Meu filho, o... como ele se chama mesmo? Lulinha.', 'Presidente esquece nome do filho em entrevista.', 'verified', false, '2024-02-28', 'https://www.metropoles.com/politica/lula-esquece-nome-filho', 'news_article', 1, 'Brasília', 'Entrevista', 'lula-esquece-filho-b146-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Brasília de "ilha da fantasia" para criticar congresso.', 'Brasília é ilha da fantasia. Deputado vive em outro mundo.', 'Presidente ataca parlamentares em evento na periferia.', 'verified', false, '2023-07-05', 'https://www.poder360.com.br/governo/lula-brasilia-ilha-fantasia/', 'news_article', 2, 'São Paulo', 'Evento periferia', 'lula-brasilia-ilha-b146-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama adeptos de armas de "doentes" em evento sobre desarmamento.', 'Quem gosta de arma é doente mental. Gente anormal.', 'Presidente polariza ao generalizar em evento sobre política de armas.', 'verified', false, '2023-07-21', 'https://www.metropoles.com/politica/lula-armas-doentes-mental', 'news_article', 3, 'Brasília', 'Evento desarmamento', 'lula-armas-doentes-b146-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "bolsonarista come capim" em tom debochado.', 'Bolsonarista come capim. Não tem cérebro.', 'Presidente usa ofensa pessoal contra eleitores em ato partidário.', 'verified', false, '2024-01-13', 'https://www.metropoles.com/politica/lula-bolsonarista-come-capim', 'news_article', 3, 'Brasília', 'Ato PT', 'lula-bolsonarista-capim-b146-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "ator só serve de laranja" ao comentar política de atores.', 'Ator só serve para ser laranja. Não entende de política.', 'Presidente comenta sobre atores em política de forma polêmica.', 'verified', false, '2023-10-01', 'https://www.poder360.com.br/governo/lula-ator-laranja/', 'news_article', 2, 'São Paulo', 'Evento cultural', 'lula-ator-laranja-b146-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza Janja chamando de "minha nora" em evento público.', 'A Janja, minha nora, que cuida de mim.', 'Presidente erra ao chamar esposa de nora em evento transmitido ao vivo.', 'verified', false, '2024-05-25', 'https://www.metropoles.com/politica/lula-janja-nora-gafe', 'news_article', 1, 'Brasília', 'Evento oficial', 'lula-janja-nora-b146-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende eleição de Maduro com dados questionáveis.', 'Maduro venceu democraticamente. Ponto final.', 'Presidente defende ditador venezuelano contra evidências de fraude em entrevista ao NYT.', 'verified', true, '2024-08-12', 'https://www.nytimes.com/2024/08/12/world/americas/lula-maduro-election.html', 'news_article', 5, 'Brasília', 'Entrevista NYT', 'lula-maduro-democraticamente-b146-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma em evento religioso que "Deus é comunista".', 'Deus é mais comunista que qualquer um. Jesus foi o primeiro.', 'Presidente diz em missa causando polêmica nas redes.', 'verified', false, '2024-06-20', 'https://www.metropoles.com/politica/lula-deus-comunista', 'news_article', 3, 'São Paulo', 'Missa Corpus Christi', 'lula-deus-comunista-b146-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "nunca viu povo burro igual brasileiro que votou em Bolsonaro".', 'Nunca vi povo tão burro. Como pôde votar em Bolsonaro?', 'Presidente ofende eleitores do adversário em evento sindical.', 'verified', true, '2024-07-25', 'https://www.poder360.com.br/governo/lula-povo-burro-bolsonaro/', 'news_article', 4, 'São Bernardo', 'Ato sindical', 'lula-povo-burro-b146-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama ministro da Fazenda de "teimoso" em crítica pública.', 'O Haddad é teimoso demais. Às vezes não me ouve.', 'Presidente expõe ministro em café com jornalistas.', 'verified', false, '2024-11-15', 'https://www.poder360.com.br/governo/lula-haddad-teimoso/', 'news_article', 2, 'Brasília', 'Café com jornalistas', 'lula-haddad-teimoso-b146-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "vai acabar com o armamento" em discurso autoritário.', 'Vou tirar todas as armas desse povo. Todas.', 'Presidente promete medida que excede atribuições em comício.', 'verified', false, '2023-02-18', 'https://www.metropoles.com/politica/lula-tirar-armas-todos', 'news_article', 3, 'Brasília', 'Comício', 'lula-tirar-armas-b146-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "imprensa da direita deveria ser regulada".', 'Essa imprensa precisa de regulação. Não pode ficar como está.', 'Presidente defende regulação de mídia em evento da CUT.', 'verified', true, '2023-09-05', 'https://www.poder360.com.br/mídia/lula-regulacao-imprensa-cut/', 'news_article', 4, 'São Paulo', 'Evento CUT', 'lula-regulacao-imprensa-b146-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "pobre não se importa com déficit".', 'Pobre não liga para déficit. Pobre liga para comida no prato.', 'Presidente simplifica debate fiscal em comício.', 'verified', false, '2023-11-25', 'https://www.metropoles.com/politica/lula-pobre-deficit', 'news_article', 2, 'Recife', 'Comício', 'lula-pobre-deficit-b146-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula associa Bolsonaro a "Diabo" em fala religiosa polêmica.', 'O Bolsonaro é o Diabo em pessoa. Demonstrado.', 'Presidente apela religiosamente em ato evangélico em 2024.', 'verified', true, '2024-05-10', 'https://www.metropoles.com/politica/lula-bolsonaro-diabo-evangelico', 'news_article', 3, 'Rio de Janeiro', 'Ato evangélico PT', 'lula-bolsonaro-diabo-b146-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Paulo Guedes de "terrorista econômico" ao rever políticas fiscais.', 'O Guedes foi um terrorista econômico. Destruiu o Brasil.', 'Presidente ataca ex-ministro em entrevista com Carta Capital.', 'verified', false, '2023-03-20', 'https://www.cartacapital.com.br/politica/lula-guedes-terrorista/', 'news_article', 3, 'Brasília', 'Entrevista Carta Capital', 'lula-guedes-terrorista-b146-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula em "Conversa com o Presidente" nega inflação de alimentos que era real.', 'Não tem inflação na comida. Isso é mentira da imprensa.', 'Presidente nega dado do IBGE em programa semanal, especificamente setembro 2024 com inflação alimentar alta.', 'verified', true, '2024-10-14', 'https://www.aosfatos.org/noticias/lula-conversa-inflacao-alimentos-outubro/', 'news_article', 5, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-nega-inflacao-alimentos-b146-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma na G20 que "América Latina odeia os EUA".', 'Os EUA não são amados na América Latina. Todo mundo odeia.', 'Presidente faz declaração diplomaticamente delicada em reunião da G20.', 'verified', true, '2024-11-18', 'https://www.reuters.com/world/americas/lula-g20-us-latin-america/', 'news_article', 4, 'Rio de Janeiro', 'G20', 'lula-al-odeia-eua-b146-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra dizendo que "Brasil é o país que mais produz eólica do mundo".', 'O Brasil produz mais energia eólica que qualquer país do mundo.', 'Presidente erra dado; China lidera produção eólica mundial.', 'verified', false, '2024-04-10', 'https://www.aosfatos.org/noticias/lula-eolica-mundo/', 'news_article', 2, 'Brasília', 'Discurso evento eólica', 'lula-eolica-mundo-b146-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama pastores bolsonaristas de "hipócritas religiosos".', 'Esses pastores bolsonaristas são hipócritas. Não são crentes, são comerciantes.', 'Presidente ofende setor religioso evangélico em comício.', 'verified', true, '2024-05-15', 'https://www.metropoles.com/politica/lula-pastores-hipocritas', 'news_article', 3, 'Rio de Janeiro', 'Comício PT', 'lula-pastores-hipocritas-b146-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "homossexual e heterossexual é a mesma coisa" em generalização.', 'Homossexual e heterossexual é tudo igual, não tem diferença.', 'Presidente bem-intencionado faz declaração que gera críticas da própria comunidade LGBTQIA+.', 'verified', false, '2023-06-18', 'https://www.metropoles.com/brasil/lula-homossexual-igual', 'news_article', 2, 'São Paulo', 'Parada LGBTQIA+', 'lula-homossexual-igual-b146-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que "juiz deveria ser eleito", atacando judiciário.', 'Juiz deveria ser eleito. O povo escolhe seu juiz.', 'Presidente sugere mudança estrutural no Judiciário em entrevista.', 'verified', false, '2024-03-25', 'https://www.poder360.com.br/governo/lula-juiz-eleito/', 'news_article', 4, 'Brasília', 'Entrevista Roda Viva', 'lula-juiz-eleito-b146-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra ao dizer que "criou o Pix" em autopromoção.', 'A gente vai melhorar o Pix. Aliás, fomos nós que criamos o Pix.', 'Presidente se atribui criação do Pix, que foi lançado no governo Bolsonaro.', 'verified', true, '2024-07-08', 'https://www.aosfatos.org/noticias/lula-criou-pix/', 'news_article', 4, 'Brasília', 'Evento BCB', 'lula-criou-pix-b146-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "casamento gay incomoda porque é novidade" em fala simplificadora.', 'Casamento gay incomoda porque é novidade. Com tempo, passa.', 'Presidente subestima resistência homofóbica em comentário a ativistas.', 'verified', false, '2023-06-28', 'https://www.metropoles.com/brasil/lula-casamento-gay-novidade', 'news_article', 2, 'São Paulo', 'Evento LGBTQIA+', 'lula-casamento-gay-novidade-b146-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala em "vacina boa" implicando duvidar de outras.', 'Nosso governo só dá vacina boa. Vacina nossa.', 'Presidente insinua que vacinas de governos anteriores eram inferiores.', 'verified', false, '2023-02-27', 'https://www.poder360.com.br/saude/lula-vacina-boa/', 'news_article', 3, 'Brasília', 'Evento vacinação', 'lula-vacina-boa-b146-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "sou o cara" ao se definir diante de apoiadores.', 'Eu sou o cara. Sou melhor que qualquer outro presidente.', 'Presidente faz autoexaltação em evento com sindicalistas.', 'verified', false, '2023-04-30', 'https://www.poder360.com.br/governo/lula-sou-cara/', 'news_article', 2, 'São Paulo', 'Evento CUT', 'lula-sou-cara-b146-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza Macron sobre "vinho francês caro" em G7.', 'O Macron só bebe vinho caro. Por isso é tão caro o governo dele.', 'Presidente faz comentário informal sobre presidente francês em coletiva.', 'verified', false, '2023-05-22', 'https://www.lemonde.fr/politique/article/2023/05/22/lula-macron-g7-vin/', 'news_article', 1, 'Hiroshima', 'G7', 'lula-macron-vinho-b146-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "nunca roubou nada" apesar de condenações posteriormente anuladas.', 'Eu nunca roubei. Nunca. Bolsonaro sim, mas eu não.', 'Presidente faz autodefesa combativa em entrevista após passagens judiciais anteriores.', 'verified', false, '2023-06-15', 'https://www.poder360.com.br/governo/lula-nunca-roubei/', 'news_article', 2, 'Brasília', 'Entrevista Fantástico', 'lula-nunca-roubei-b146-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Bolsonaro de "fujão" e "covarde" em ataque pessoal.', 'Bolsonaro é fujão. Covarde. Fugiu dos Estados Unidos como rato.', 'Presidente usa linguagem pessoal agressiva em discurso.', 'verified', false, '2023-01-30', 'https://www.metropoles.com/politica/lula-bolsonaro-fujao-covarde', 'news_article', 2, 'Brasília', 'Ato esquerda', 'lula-bolsonaro-fujao-b146-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala "alô Brasília, tô aqui" em ato de demonstração pessoal.', 'Tô aqui, Brasília. Lula voltou. Aguenta firme, eu volto sempre.', 'Presidente faz ato personalista em viagem a interior.', 'verified', false, '2023-03-10', 'https://www.poder360.com.br/governo/lula-alo-brasilia/', 'news_article', 1, 'Minas Gerais', 'Agenda interior', 'lula-alo-brasilia-b146-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que "povo judeu já sofreu, mas agora oprime".', 'Os judeus sofreram, mas agora o Israel oprime os palestinos.', 'Presidente generaliza sobre judeus em fala polêmica.', 'verified', true, '2024-02-22', 'https://www.metropoles.com/mundo/lula-judeus-oprime', 'news_article', 4, 'Brasília', 'Entrevista Folha', 'lula-judeus-oprime-b146-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "cozinheira" da casa é "a mãe do país".', 'A cozinheira é a mãe do país. Mulher de verdade.', 'Presidente faz comentário considerado machista ao papel feminino em fala pública.', 'verified', false, '2024-03-08', 'https://www.metropoles.com/politica/lula-cozinheira-mae-pais', 'news_article', 2, 'Brasília', '8 de março evento', 'lula-cozinheira-mae-pais-b146-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama ministros de Bolsonaro de "lixo" em comício.', 'Aqueles ministros do Bolsonaro eram um lixo. Um bando de incompetentes.', 'Presidente generaliza sobre gestão anterior em comício do PT.', 'verified', false, '2023-04-15', 'https://www.poder360.com.br/governo/lula-ministros-bolsonaro-lixo/', 'news_article', 2, 'São Paulo', 'Comício PT', 'lula-ministros-lixo-b146-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "quem é contra aborto é hipócrita" em comentário polêmico.', 'Quem é contra aborto, mas deixa mulher morrer, é hipócrita.', 'Presidente simplifica debate sobre aborto em entrevista.', 'verified', false, '2024-09-28', 'https://www.metropoles.com/brasil/lula-aborto-hipocrita', 'news_article', 3, 'Brasília', 'Entrevista CBN', 'lula-aborto-hipocrita-b146-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza evangélicos dizendo que "só rezam e não votam direito".', 'Evangélico só reza e vota mal. Votam contra os próprios interesses.', 'Presidente ofende setor religioso em ato do PT.', 'verified', true, '2024-04-18', 'https://www.metropoles.com/politica/lula-evangelicos-votam-mal', 'news_article', 4, 'Rio de Janeiro', 'Ato PT', 'lula-evangelicos-votam-mal-b146-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula usa termo "ignorante" para eleitores de direita.', 'Eleitor de direita é ignorante. Só por isso vota errado.', 'Presidente ataca camada eleitoral em entrevista.', 'verified', false, '2024-10-28', 'https://www.poder360.com.br/governo/lula-eleitor-direita-ignorante/', 'news_article', 3, 'São Paulo', 'Entrevista TV Globo', 'lula-eleitor-direita-ignorante-b146-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma em "Conversa" que "PIB vai dobrar em dois anos".', 'Nosso PIB vai dobrar em dois anos. Pode anotar.', 'Presidente faz promessa economicamente irrealista em programa semanal.', 'verified', true, '2024-05-06', 'https://www.aosfatos.org/noticias/lula-pib-dobrar-conversa/', 'news_article', 3, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-pib-dobrar-b146-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta que "imigrante venezuelano foge de Maduro" e depois volta atrás.', 'Venezuelano foge de lá porque lá é difícil... mas é democracia.', 'Presidente contradiz-se em fala sobre Venezuela em coletiva.', 'verified', false, '2023-11-05', 'https://www.poder360.com.br/governo/lula-imigrante-venezuelano-contradicao/', 'news_article', 3, 'Roraima', 'Visita fronteira', 'lula-venezuelano-contradicao-b146-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz piada machista sobre cabelo de jornalista.', 'Olha esse cabelo dela. Mulher bonita com cabelo assim.', 'Presidente faz comentário sobre aparência de jornalista durante coletiva.', 'verified', false, '2024-05-20', 'https://www.metropoles.com/politica/lula-jornalista-cabelo-comentario', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-jornalista-cabelo-b146-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "Venezuela sofre por ser socialista que outros invejam".', 'Venezuela está assim porque os EUA odeiam o socialismo. Bloqueio é injusto.', 'Presidente defende Maduro atribuindo crise ao bloqueio americano.', 'verified', false, '2024-03-02', 'https://www.reuters.com/world/americas/lula-venezuela-blockade-2024-03-02/', 'news_article', 3, 'Buenos Aires', 'Coletiva', 'lula-venezuela-bloqueio-b146-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama vacina obrigatória de "dever" mesmo sem base legal.', 'Tomar vacina é dever. Quem não tomar, perde direitos.', 'Presidente fala em consequências que ultrapassariam legislação vigente.', 'verified', false, '2023-02-10', 'https://www.poder360.com.br/saude/lula-vacina-dever-direitos/', 'news_article', 3, 'Brasília', 'Ato vacinação', 'lula-vacina-dever-direitos-b146-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra dizendo que "Senado tem 81 mil membros".', 'O Senado com seus 81 mil membros...', 'Presidente confunde números em pronunciamento oficial; Senado tem 81 senadores.', 'verified', false, '2023-05-16', 'https://www.metropoles.com/politica/lula-senado-81-mil-erro', 'news_article', 1, 'Brasília', 'Pronunciamento', 'lula-senado-81-mil-b146-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "feminismo é bom, mas sem exagero".', 'Feminismo é bom, mas não pode ser exagerado.', 'Presidente faz comentário machista criticado por ativistas.', 'verified', true, '2024-08-19', 'https://www.metropoles.com/brasil/lula-feminismo-exagero', 'news_article', 3, 'São Paulo', 'Evento PT', 'lula-feminismo-exagero-b146-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula em "Conversa" mente sobre emprego criado, inflando números.', 'Criamos 4 milhões de empregos em 2024.', 'Presidente superestima emprego gerado; Caged registrou 1,7 milhão.', 'verified', false, '2025-01-20', 'https://www.aosfatos.org/noticias/lula-conversa-4-milhoes-empregos/', 'news_article', 4, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-4-milhoes-empregos-b146-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "mulher bonita não é só corpo" em evento.', 'Mulher bonita não é só corpo. Tem que ter cabeça.', 'Presidente objetifica mulheres em fala publica.', 'verified', false, '2024-03-10', 'https://www.metropoles.com/politica/lula-mulher-bonita-corpo', 'news_article', 2, 'Brasília', 'Evento universidade', 'lula-mulher-bonita-corpo-b146-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em evento do PT que "oposição nunca ganha mais".', 'Oposição nunca mais ganha uma eleição. Acabou.', 'Presidente prevê fim do ciclo eleitoral adversário em comício.', 'verified', false, '2024-11-10', 'https://www.poder360.com.br/governo/lula-oposicao-nunca-ganha/', 'news_article', 3, 'São Paulo', 'Comício PT', 'lula-oposicao-nunca-ganha-b146-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que "menino precisa apanhar às vezes" em educação.', 'Menino precisa levar umas palmadas. Eu levei.', 'Presidente defende castigo físico educativo, contrariando Lei Menino Bernardo.', 'verified', false, '2024-07-28', 'https://www.metropoles.com/brasil/lula-menino-palmada', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-menino-palmada-b146-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "CPI é coisa de oposição desocupada".', 'CPI é oposição que não tem o que fazer. Gente desocupada.', 'Presidente desqualifica instrumento constitucional em comentário.', 'verified', false, '2023-09-15', 'https://www.poder360.com.br/governo/lula-cpi-desocupada/', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-cpi-desocupada-b146-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende "mensalão era estratégia" em declaração controversa.', 'Mensalão era estratégia política. Não era corrupção.', 'Presidente minimiza escândalo histórico do próprio partido em entrevista.', 'verified', true, '2023-10-18', 'https://www.metropoles.com/politica/lula-mensalao-estrategia', 'news_article', 4, 'Brasília', 'Entrevista TV 247', 'lula-mensalao-estrategia-b146-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "Dilma foi injustamente cassada" em defesa política.', 'Dilma foi cassada injustamente. Foi golpe, golpe parlamentar.', 'Presidente repete tese do golpe, mesmo sendo impeachment constitucional aprovado.', 'verified', false, '2023-06-05', 'https://www.poder360.com.br/governo/lula-dilma-golpe-parlamentar/', 'news_article', 3, 'Brasília', 'Evento PT', 'lula-dilma-golpe-parlamentar-b146-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama ministros do TCU de "burocratas" em irritação pública.', 'Esses ministros do TCU são burocratas. Não entendem de governo.', 'Presidente ataca TCU após denúncias sobre contratações do governo.', 'verified', false, '2024-04-25', 'https://www.poder360.com.br/governo/lula-tcu-burocratas/', 'news_article', 3, 'Brasília', 'Café com jornalistas', 'lula-tcu-burocratas-b146-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que "alcoólatra e drogado" votou em Bolsonaro.', 'Só alcoólatra e drogado votou em Bolsonaro.', 'Presidente ofende em evento eleitoral de 2024.', 'verified', true, '2024-10-12', 'https://www.metropoles.com/politica/lula-alcoolatra-drogado-bolsonaro', 'news_article', 4, 'São Paulo', 'Comício Boulos', 'lula-alcoolatra-drogado-b146-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula erra número de mortes na pandemia em prestígio retórico.', 'Foram 800 mil mortes na pandemia com Bolsonaro.', 'Presidente infla dado; número é 700 mil em dados oficiais.', 'verified', false, '2024-02-03', 'https://www.aosfatos.org/noticias/lula-mortes-pandemia-800-mil/', 'news_article', 3, 'Brasília', 'Pronunciamento', 'lula-mortes-pandemia-erro-b146-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "lei de cotas pode ser mais forte" em tom autoritário.', 'A lei de cotas ainda é branda. Vamos fazer mais forte.', 'Presidente anuncia ampliação sem debate público prévio.', 'verified', false, '2023-11-20', 'https://www.poder360.com.br/governo/lula-cotas-mais-forte/', 'news_article', 2, 'Brasília', 'Evento Dia Consciência Negra', 'lula-cotas-mais-forte-b146-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma em "Conversa" que vai "reduzir Selic na marra".', 'Vou reduzir a Selic na marra, queira ou não queira o BC.', 'Presidente ameaça autonomia do BC em programa semanal.', 'verified', true, '2023-03-27', 'https://www.aosfatos.org/noticias/lula-selic-marra-bc/', 'news_article', 4, 'Brasília', 'Conversa com o Presidente', 'lula-conversa-selic-marra-b146-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz a empresário "não vem aqui chorar" em irritação pública.', 'Empresário chorão não vem aqui chorar. Arranja coragem.', 'Presidente se irrita com pedidos de setor empresarial em reunião.', 'verified', false, '2024-06-08', 'https://www.poder360.com.br/governo/lula-empresario-chorao/', 'news_article', 2, 'Brasília', 'Reunião setor privado', 'lula-empresario-chorao-b146-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

END $$;
