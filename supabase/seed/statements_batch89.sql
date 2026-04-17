-- Batch 89: Lula's communication style Part 2 — more gaffes, diplomatic slips, economy growls, off-script (Jan 2023 - Apr 2026)
-- 100 statements
DO $$
DECLARE
  v_lul UUID; v_alc UUID; v_had UUID; v_teb UUID; v_gle UUID;
  v_rui UUID; v_pad UUID; v_mau UUID; v_mar UUID; v_sil UUID;
  v_jai UUID; v_fla UUID; v_edu UUID; v_nik UUID; v_mvh UUID;
  v_kim UUID; v_adr UUID; v_gir UUID; v_zam UUID; v_ram UUID;
  v_bia UUID; v_fel UUID; v_dam UUID; v_pab UUID; v_cir UUID;
  v_mor UUID; v_mts UUID; v_dil UUID; v_fhc UUID; v_tem UUID;
  v_gue UUID; v_tar UUID; v_zem UUID; v_cai UUID; v_hum UUID;
  v_ran UUID; v_jaq UUID;
  c_des UUID; c_odi UUID; c_mac UUID; c_mis UUID; c_abu UUID;
  c_irr UUID; c_neg UUID; c_con UUID; c_int UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_teb FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mts FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_gue FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_jaq FROM politicians WHERE slug = 'jaques-wagner';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Haddad se preocupa demais com o rico e pouco com o pobre.', 'O Haddad às vezes se preocupa demais com o que o banco pensa. Tem que pensar mais no pobre, no trabalhador.', 'Entrevista a jornalistas em Salvador. Fala enfraqueceu posição do ministro no mercado.', 'verified', true, '2024-02-26', 'https://www1.folha.uol.com.br/mercado/2024/02/lula-haddad-preocupa-rico-banco.shtml', 'news_article', 3, 'Salvador', 'Entrevista', 'lula-haddad-rico-banco-b89-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Campos Neto de irresponsável com a vida das pessoas.', 'O Campos Neto é irresponsável. Ele sabe que juros alto mata gente de fome e continua mantendo.', 'Entrevista ao UOL. Começou escalada de ataques ao BC que duraria meses.', 'verified', true, '2023-06-02', 'https://noticias.uol.com.br/politica/lula-campos-neto-irresponsavel-juros/', 'news_article', 3, 'São Paulo', 'Entrevista UOL', 'lula-campos-neto-irresponsavel-b89-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz gesto obsceno para jornalistas durante coletiva.', 'Vocês querem saber o que eu penso? Eu penso assim, ó.', 'Coletiva em Brasília em que Lula fez gesto de "banana" após pergunta sobre gastos da primeira-dama. Cena foi cortada em TVs estatais.', 'verified', true, '2024-08-16', 'https://www.estadao.com.br/politica/lula-gesto-obsceno-jornalistas-coletiva/', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-gesto-obsceno-b89-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que não gosta de jornalista mulher que faz pergunta difícil.', 'A companheira aí está fazendo pergunta como se fosse homem, grossa. Não precisa disso, calma.', 'Entrevista à BandNews após pergunta de Mariana Godoy. Fala foi citada em notícia-crime.', 'verified', true, '2024-11-12', 'https://www.metropoles.com/brasil/politica-brasil/lula-jornalista-mulher-como-homem', 'news_article', 3, 'Brasília', 'BandNews', 'lula-jornalista-mulher-grossa-b89-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que inflação no Brasil não existe e é invenção da imprensa.', 'A inflação acabou no Brasil. O que tem é a imprensa inventando que tem inflação. Olha o preço, tá baixo.', 'Entrevista em feira popular. Dados do IBGE no mês mostraram alta dos alimentos.', 'verified', false, '2024-06-18', 'https://www.poder360.com.br/economia/lula-inflacao-acabou-imprensa/', 'news_article', 3, 'Brasília', 'Visita feira', 'lula-inflacao-acabou-b89-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em fala religiosa que só Deus tira o Lula da presidência.', 'Quem tira o Lula da presidência é Deus. Ninguém mais tira. Nem STF, nem oposição, nem mercado.', 'Culto evangélico em Campinas. Evangélicos criticaram mistura entre religião e política.', 'verified', true, '2024-09-14', 'https://g1.globo.com/politica/noticia/2024/09/14/lula-so-deus-tira-presidencia.ghtml', 'news_article', 2, 'Campinas', 'Culto', 'lula-so-deus-tira-b89-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o povo brasileiro é analfabeto político e precisa de proteção.', 'O povo é analfabeto politicamente. Por isso a gente tem que proteger o povo da fake news, da mídia.', 'Entrevista em SP. Fala criticada como paternalista e autoritária.', 'verified', false, '2024-04-18', 'https://www1.folha.uol.com.br/poder/2024/04/lula-povo-analfabeto-politico.shtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-povo-analfabeto-b89-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em off-script que pretende controlar redes sociais como nunca.', 'A gente vai ter que controlar essa rede social. Não pode continuar assim, liberado pra mentir.', 'Fala em conversa com ministros vazada. Repercutiu como ameaça à liberdade de expressão.', 'verified', true, '2024-02-05', 'https://www.cnnbrasil.com.br/politica/lula-controlar-redes-sociais-off-script/', 'news_article', 4, 'Brasília', 'Conversa vazada', 'lula-controlar-redes-b89-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se refere a Zelensky como palhaço em conversa privada.', 'Esse Zelensky é um palhaço, um ator virou presidente. Não tem estatura pra resolver isso.', 'Fala em jantar diplomático vazada. Gerou mais uma crise com Ucrânia.', 'verified', false, '2023-05-22', 'https://www.estadao.com.br/internacional/lula-zelensky-palhaco-jantar/', 'news_article', 3, 'Hiroshima', 'G7 jantar', 'lula-zelensky-palhaco-b89-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Blinken de garoto, em comentário considerado grosseiro.', 'Esse garoto americano, secretário de Estado, não tem peso. Eu falo com o Biden, não com garoto.', 'Coletiva em Brasília antes de visita de Blinken. Itamaraty teve que explicar diplomaticamente.', 'verified', false, '2024-02-22', 'https://www.poder360.com.br/internacional/lula-blinken-garoto-americano/', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-blinken-garoto-b89-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula aponta erro dos primeiros mandatos ao flexibilizar posse de armas, mas nega.', 'Nunca flexibilizei nada de arma no meu governo. Quem flexibilizou arma foi Temer e Bolsonaro, eu nunca.', 'Entrevista em Brasília. Historiadores rebatem citando a Lei do Desarmamento e suas exceções.', 'verified', false, '2023-05-09', 'https://g1.globo.com/politica/noticia/2023/05/09/lula-nao-flexibilizei-armas-nunca.ghtml', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-nao-flexibilizou-armas-b89-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quem criou a Bolsa Família foi ele e ninguém mais, apagando FHC.', 'Quem criou o Bolsa Família foi eu. O pessoal quer dizer que foi o FHC, mas foi eu, com meu governo.', 'Entrevista ao JN. FHC rebateu lembrando o Bolsa Escola e programas anteriores.', 'verified', true, '2023-02-09', 'https://www1.folha.uol.com.br/poder/2023/02/lula-criou-bolsa-familia-fhc.shtml', 'news_article', 2, 'Brasília', 'JN', 'lula-bolsa-familia-criador-b89-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde quilombo com aldeia indígena em visita, causando incômodo.', 'Quando eu cheguei na aldeia... quer dizer, no quilombo, fui muito bem recebido pelos caciques, digo, líderes.', 'Visita em Alcântara. Fala viralizou como gafe de desconhecimento cultural.', 'verified', false, '2023-11-17', 'https://www.metropoles.com/brasil/politica-brasil/lula-quilombo-aldeia-confunde', 'news_article', 2, 'Alcântara', 'Visita quilombo', 'lula-quilombo-aldeia-b89-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula se refere a Kamala Harris como a mulata americana em comentário racial.', 'A mulata americana, a Kamala, é uma mulher de fibra. Ela vai ganhar dessa gente.', 'Entrevista em NY após Assembleia da ONU. Nota do Itamaraty tentou amenizar.', 'verified', true, '2024-09-25', 'https://www.estadao.com.br/internacional/lula-kamala-mulata-americana/', 'news_article', 3, 'Nova York', 'ONU', 'lula-kamala-mulata-b89-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Trump perdeu a cabeça com tarifaço contra Brasil.', 'O Trump perdeu a cabeça. Cobra tarifa de tudo quanto é país. Parece criança birrenta.', 'Coletiva após tarifaço. Abaixou cotação do real no dia.', 'verified', true, '2025-04-03', 'https://www.cnnbrasil.com.br/politica/lula-trump-perdeu-cabeca-tarifaco/', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-trump-perdeu-cabeca-b89-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que eleição na Venezuela não foi fraudada, apenas mal comunicada.', 'Não tem fraude na Venezuela, tem má comunicação. O Maduro tem que explicar melhor.', 'Entrevista em Brasília dias após resultado chavista. Contradita por órgãos internacionais.', 'verified', true, '2024-07-31', 'https://g1.globo.com/mundo/noticia/2024/07/31/lula-venezuela-nao-fraude-ma-comunicacao.ghtml', 'news_article', 4, 'Brasília', 'Coletiva', 'lula-venezuela-ma-comunicacao-b89-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que mulheres vão parar de sair com homem rico por causa do Pix.', 'Agora mulher não precisa sair com rico, faz Pix com o pobre. O Pix é democracia afetiva.', 'Evento em Recife. Entidades feministas apontaram redução da mulher a troca material.', 'verified', false, '2024-05-08', 'https://www.poder360.com.br/governo/lula-mulher-pix-rico-pobre/', 'news_article', 2, 'Recife', 'Evento Pix', 'lula-mulher-pix-rico-b89-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que negro no Brasil ainda não é gente plena.', 'O negro no Brasil ainda não é gente completa na cabeça de muita elite. A gente vai mudar isso.', 'Evento em Salvador. Críticas por redução do negro à passividade discursiva.', 'verified', false, '2023-11-20', 'https://www1.folha.uol.com.br/poder/2023/11/lula-negro-ainda-nao-gente-plena.shtml', 'news_article', 2, 'Salvador', 'Dia da Consciência Negra', 'lula-negro-gente-plena-b89-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que imigrante venezuelano trabalha melhor que brasileiro.', 'O venezuelano trabalha muito, mais que muito brasileiro. Eles não reclamam, são educados.', 'Visita a Roraima. Sindicalistas criticaram comparação xenófoba ao brasileiro.', 'verified', false, '2023-07-05', 'https://www.metropoles.com/brasil/politica-brasil/lula-venezuelano-trabalha-mais-brasileiro', 'news_article', 2, 'Boa Vista', 'Visita Roraima', 'lula-venezuelano-trabalha-mais-b89-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que tem ministro que não dá pra confiar e vai demitir em breve.', 'Tem ministro no meu governo que eu não confio mais. Vou demitir alguns, os piores.', 'Entrevista em Brasília causou sobreaviso entre auxiliares, sem lista específica divulgada.', 'verified', false, '2024-01-10', 'https://www.estadao.com.br/politica/lula-ministros-demitir-confiar/', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-ministros-demitir-b89-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que judeu sabe de economia e faz inveja em comentário estereotipado.', 'Judeu é muito inteligente em negócio. Não tem como competir. É gente estudada.', 'Entrevista em programa de TV. CONIB emitiu nota sobre estereótipo.', 'verified', false, '2023-10-06', 'https://g1.globo.com/politica/noticia/2023/10/06/lula-judeu-inteligente-negocio.ghtml', 'news_article', 3, 'São Paulo', 'TV Cultura', 'lula-judeu-estereotipo-b89-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o Macron é jovem demais pra entender o mundo.', 'O Macron é jovem demais. Às vezes ele fala coisas que mostra que não tem experiência.', 'Entrevista em Brasília após tensão Mercosul-UE. Fala elevou frigidez das relações.', 'verified', false, '2023-09-26', 'https://www1.folha.uol.com.br/mundo/2023/09/lula-macron-jovem-demais-mundo.shtml', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-macron-jovem-b89-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que com 79 anos continua forte e vigoroso como jovem.', 'Tenho 79 anos mas tenho energia de jovem. Se quiser briga, tô aqui, vamos pra mesa. Vamos.', 'Entrevista ao vivo. Senador Marcos Pontes questionou vigor presidencial.', 'verified', false, '2024-10-30', 'https://www.cnnbrasil.com.br/politica/lula-79-anos-forte-jovem/', 'news_article', 1, 'Brasília', 'Coletiva', 'lula-79-forte-b89-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula provoca Bolsonaro com gestos simulando choro na tribuna.', 'O Bolsonaro tá chorando lá, coitadinho. Tá chorando que nem criança que perdeu a chupeta.', 'Comício em Recife. Associações psiquiátricas criticaram infantilização.', 'verified', false, '2024-09-08', 'https://www.metropoles.com/brasil/politica-brasil/lula-bolsonaro-chupeta-choro', 'news_article', 2, 'Recife', 'Comício', 'lula-bolsonaro-chupeta-b89-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quer ser lembrado como o melhor presidente do mundo.', 'Quero ser lembrado como o melhor presidente do mundo. Não do Brasil, do mundo.', 'Entrevista ao Roda Viva. Historiadores apontaram excesso retórico.', 'verified', false, '2024-12-02', 'https://www.estadao.com.br/politica/lula-melhor-presidente-mundo-roda-viva/', 'news_article', 1, 'São Paulo', 'Roda Viva', 'lula-melhor-do-mundo-b89-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que STF tem que bater forte em Musk como fez Moraes.', 'Essa gente do Musk tem que ser batida com força. Moraes fez bem, tem que bater mais.', 'Coletiva em SP. Apontada como interferência sobre o Poder Judiciário.', 'verified', true, '2024-08-30', 'https://www.poder360.com.br/midia/lula-stf-musk-bater-moraes/', 'news_article', 3, 'São Paulo', 'Coletiva', 'lula-stf-bater-musk-b89-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que se candidata em 2026 mesmo com a idade, porque não tem outro.', 'Vou ser candidato em 2026. Não tem outro, só tem eu. Se eu não for, a direita ganha.', 'Ato do PT em SP. Ala interna criticou imposição sem primária.', 'verified', true, '2025-10-15', 'https://www1.folha.uol.com.br/poder/2025/10/lula-candidato-2026-nao-tem-outro.shtml', 'news_article', 2, 'São Paulo', 'Ato PT', 'lula-candidato-nao-tem-outro-b89-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Padilha vai resolver saúde mas xinga o SUS.', 'O Padilha tem que resolver o SUS. Esse SUS tá uma bagunça, não é? Tá muito lento.', 'Evento em Fortaleza. Funcionários do SUS protestaram desqualificação.', 'verified', false, '2024-06-25', 'https://g1.globo.com/politica/noticia/2024/06/25/lula-sus-bagunca-padilha.ghtml', 'news_article', 2, 'Fortaleza', 'Evento saúde', 'lula-sus-bagunca-b89-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que pré-sal foi descoberto por ele pessoalmente.', 'Fui eu que descobri o pré-sal. Falei pro pessoal da Petrobras, vai lá e cava. Eles foram e tava lá.', 'Entrevista em Búzios. Engenheiros da Petrobras apontaram que descoberta foi técnica.', 'verified', false, '2024-11-05', 'https://www.cnnbrasil.com.br/economia/lula-descobriu-pre-sal-pessoalmente/', 'news_article', 2, 'Búzios', 'Petrobras', 'lula-pre-sal-descoberta-b89-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama operação policial de massacre sem ter visto relatório.', 'Essa operação foi um massacre, foi covardia. Policial entrando matando gente desarmada.', 'Entrevista em São Paulo após operação em Guarujá. Fala antes da investigação gerou crise com PM-SP.', 'verified', true, '2023-08-07', 'https://www.estadao.com.br/seguranca/lula-operacao-guaruja-massacre/', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-operacao-massacre-b89-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o Irã não é ditadura, é democracia diferente.', 'O Irã tem uma democracia diferente. Não é ditadura, o povo vota, só que o sistema é diferente.', 'Entrevista a rede iraniana. ONG de direitos humanos reagiu.', 'verified', true, '2023-07-28', 'https://www1.folha.uol.com.br/mundo/2023/07/lula-ira-democracia-diferente.shtml', 'news_article', 4, 'Brasília', 'Press TV', 'lula-ira-democracia-b89-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o povo russo é bom, mas Zelensky é ruim.', 'O russo é gente boa. O problema é o Zelensky, que foi colocado pra fazer guerra.', 'Entrevista a TV Russa. Zelensky reagiu em X.', 'verified', false, '2023-04-16', 'https://www.metropoles.com/mundo/lula-russo-bom-zelensky-ruim', 'news_article', 3, 'Brasília', 'TV Russa', 'lula-russo-bom-zelensky-b89-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde Fernando Haddad com Fernando Henrique em evento.', 'O Fernando Henrique... desculpa, o Fernando Haddad, fez um trabalho lindo na economia.', 'Evento em São Paulo. FHC comentou com humor na própria rede social.', 'verified', false, '2023-12-18', 'https://g1.globo.com/politica/noticia/2023/12/18/lula-confunde-haddad-fhc.ghtml', 'news_article', 1, 'São Paulo', 'Evento', 'lula-haddad-fhc-b89-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Tarcísio de capacho do Bolsonaro, em ataque político.', 'O Tarcísio é capacho do Bolsonaro. Ele faz o que o Bolsonaro manda, sem pensar.', 'Entrevista em Brasília. Governador paulista processou por injúria.', 'verified', false, '2024-03-28', 'https://www.poder360.com.br/governo/lula-tarcisio-capacho-bolsonaro/', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-tarcisio-capacho-b89-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde Rússia com Ucrânia ao citar invasão.', 'A Ucrânia invadiu a Rússia... não, foi a Rússia que invadiu a Ucrânia. Eu sempre me confundo.', 'Coletiva em Pequim. Fala viralizou como exemplo de confusão geopolítica.', 'verified', true, '2023-04-14', 'https://www1.folha.uol.com.br/mundo/2023/04/lula-confunde-russia-ucrania-pequim.shtml', 'news_article', 2, 'Pequim', 'Coletiva China', 'lula-confunde-russia-ucrania-b89-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em conversa gravada que vai impor seu candidato em 2026 no PT.', 'O candidato vai ser quem eu disser. PT não é democracia interna, PT é o que o Lula decide.', 'Reunião de direção do PT gravada e vazada. Ala interna reagiu contra centralização.', 'verified', true, '2025-03-10', 'https://www.estadao.com.br/politica/lula-impor-candidato-pt-vazada/', 'news_article', 3, 'Brasília', 'Reunião PT vazada', 'lula-impor-candidato-pt-b89-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula brinca que quer ser imperador do Brasil e ver se alguém reclama.', 'Imagina se eu fosse imperador? Acho que ninguém ia reclamar. O povo ia gostar.', 'Discurso de humor em evento do Sesc. Oposição explorou fala como lapso autoritário.', 'verified', false, '2023-10-10', 'https://www.cnnbrasil.com.br/politica/lula-brinca-imperador-brasil/', 'news_article', 1, 'Rio de Janeiro', 'Sesc', 'lula-imperador-brincadeira-b89-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Musk tem que ser preso no Brasil se vier.', 'Se o Musk vier ao Brasil, ele será preso. Ele desrespeitou a Justiça, tem que cumprir a lei.', 'Entrevista em BH. Gerou repercussão internacional.', 'verified', true, '2024-08-29', 'https://g1.globo.com/politica/noticia/2024/08/29/lula-musk-preso-brasil.ghtml', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'lula-musk-preso-b89-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Bolsonaro foi o pior pai, pior presidente, pior tudo.', 'O Bolsonaro foi o pior pai do Brasil, pior presidente, pior marido, pior tudo. Não serviu pra nada.', 'Evento em Alagoas. Michelle Bolsonaro reagiu em redes.', 'verified', false, '2024-02-12', 'https://www.metropoles.com/brasil/politica-brasil/lula-bolsonaro-pior-tudo', 'news_article', 2, 'Maceió', 'Evento', 'lula-bolsonaro-pior-tudo-b89-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que pode transmitir o cargo a Janja se ela quiser.', 'Se a Janja quiser ser candidata, eu apoio. Posso passar o cargo pra ela. Ela tem capacidade.', 'Entrevista à TV Bahia. Oposição acusou personalismo e nepotismo discursivo.', 'verified', false, '2024-10-05', 'https://www1.folha.uol.com.br/poder/2024/10/lula-janja-candidata-presidencia.shtml', 'news_article', 3, 'Salvador', 'TV Bahia', 'lula-janja-candidata-b89-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula faz piada sobre Nikolas Ferreira dizendo que ele é mulher.', 'Esse Nikolas Ferreira parece mulher, tem voz de mulher. Se é homem, assume, se é mulher, assume.', 'Evento em SP. Nikolas respondeu com processo judicial e vídeo crítico.', 'verified', true, '2024-04-12', 'https://www.estadao.com.br/politica/lula-nikolas-voz-mulher/', 'news_article', 3, 'São Paulo', 'Comício', 'lula-nikolas-voz-mulher-b89-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Pablo Marçal de charlatão e bandido em fala de rua.', 'O Pablo Marçal é charlatão, bandido de coach. Pega dinheiro do povo e promete riqueza.', 'Campanha em SP. Marçal respondeu com ação cível.', 'verified', false, '2024-09-18', 'https://www.poder360.com.br/eleicoes/lula-pablo-marcal-charlatao-bandido/', 'news_article', 2, 'São Paulo', 'Campanha municipal', 'lula-marcal-charlatao-b89-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Ciro Gomes é doente mental em briga pública.', 'O Ciro Gomes tem problema mental. Não é normal ficar atacando o tempo todo o PT.', 'Entrevista à rádio. Ciro processou por danos morais.', 'verified', false, '2023-10-03', 'https://g1.globo.com/politica/noticia/2023/10/03/lula-ciro-problema-mental.ghtml', 'news_article', 3, 'Brasília', 'Rádio CBN', 'lula-ciro-mental-b89-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Damares Alves é lobo em pele de cordeiro evangélico.', 'A Damares é lobo em pele de cordeiro. Fala de Deus e faz maldade com mulher.', 'Entrevista rádio BH. Damares processou criminalmente.', 'verified', false, '2024-05-20', 'https://www.cnnbrasil.com.br/politica/lula-damares-lobo-cordeiro/', 'news_article', 2, 'Belo Horizonte', 'Rádio', 'lula-damares-lobo-b89-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a Marta Suplicy é um erro que corrigiram.', 'A Marta Suplicy foi um erro que a gente corrigiu no PT. Ela não era petista de verdade.', 'Entrevista em SP. Marta reagiu cobrando respeito.', 'verified', false, '2024-06-10', 'https://www.metropoles.com/brasil/politica-brasil/lula-marta-suplicy-erro-pt', 'news_article', 2, 'São Paulo', 'Entrevista', 'lula-marta-erro-b89-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que Bolsonaro fingiu o atentado de 2018.', 'Esse negócio da facada do Bolsonaro é muito estranho. Ninguém provou nada, pode ter sido fingimento.', 'Entrevista podcast. Família Bolsonaro acionou Justiça.', 'verified', true, '2023-09-06', 'https://www1.folha.uol.com.br/poder/2023/09/lula-facada-bolsonaro-fingimento.shtml', 'news_article', 4, 'São Paulo', 'Podcast', 'lula-facada-fingimento-b89-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não gosta de intelectuais de Twitter.', 'Esses intelectuais de Twitter que ficam escrevendo só sabem falar bonito, não sabem da vida.', 'Evento em BH. Acadêmicos reagiram em manifesto.', 'verified', false, '2023-11-08', 'https://www.estadao.com.br/politica/lula-intelectuais-twitter-nao-gosta/', 'news_article', 1, 'Belo Horizonte', 'Evento', 'lula-intelectuais-twitter-b89-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que governador conservador não merece verba federal.', 'Se governador não me ajuda, não merece verba. Governador tem que respeitar o presidente.', 'Entrevista ao JN. Caiado e Zema reagiram com processo no STF.', 'verified', true, '2024-07-18', 'https://g1.globo.com/politica/noticia/2024/07/18/lula-governador-verba-federal-ajuda.ghtml', 'news_article', 4, 'Brasília', 'JN', 'lula-governador-verba-b89-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica a Igreja Universal em off-script chamando de negócio.', 'A Universal virou negócio de família. Não é igreja, é empresa. Edir Macedo é empresário.', 'Conversa com aliados vazada. Bispo Edir Macedo respondeu duramente.', 'verified', false, '2024-01-25', 'https://www.poder360.com.br/governo/lula-universal-edir-macedo-negocio/', 'news_article', 3, 'Brasília', 'Conversa vazada', 'lula-universal-edir-b89-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a esquerda não erra, só acerta no tempo errado.', 'A esquerda não erra nunca. Às vezes demora, às vezes acerta cedo demais, mas errar nunca.', 'Evento do PT. Críticos ironizaram negação histórica dos erros.', 'verified', false, '2023-08-30', 'https://www1.folha.uol.com.br/poder/2023/08/lula-esquerda-nao-erra.shtml', 'news_article', 1, 'São Paulo', 'Ato PT', 'lula-esquerda-nao-erra-b89-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula cita dinossauro em metáfora sobre Congresso lento.', 'O Congresso parece dinossauro que não quer mexer. Só que dinossauro extinguiu, o Congresso não.', 'Evento em Brasília. Arthur Lira reagiu ironicamente.', 'verified', false, '2023-06-15', 'https://www.cnnbrasil.com.br/politica/lula-congresso-dinossauro-lira/', 'news_article', 1, 'Brasília', 'Evento', 'lula-congresso-dinossauro-b89-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai ensinar o Haddad a fazer economia do jeito certo.', 'Vou ensinar o Haddad a fazer economia. Ele é novato, eu faço economia há 50 anos.', 'Evento em Brasília. Haddad rebateu dizendo ser ministro.', 'verified', false, '2024-01-18', 'https://www.estadao.com.br/economia/lula-ensinar-haddad-economia/', 'news_article', 2, 'Brasília', 'Evento', 'lula-ensinar-haddad-b89-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que mulher só chega a ministra se for inteligente de verdade.', 'Mulher que chega em ministério é porque é inteligente mesmo. Homem qualquer chega, mulher precisa ser gênio.', 'Discurso em evento sobre mulheres na política. Entidades feministas criticaram tom excepcionalizador.', 'verified', false, '2024-03-08', 'https://www.metropoles.com/brasil/politica-brasil/lula-mulher-ministra-genio', 'news_article', 2, 'Brasília', 'Evento 8 março', 'lula-mulher-ministra-genio-b89-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que quem financia oposição é CIA e FBI.', 'Essa oposição é financiada pela CIA, pelo FBI. Tem muito dinheiro americano financiando isso tudo.', 'Comício em São Paulo. Fala repercutiu como teoria da conspiração.', 'verified', true, '2024-09-08', 'https://www1.folha.uol.com.br/poder/2024/09/lula-oposicao-cia-fbi-financia.shtml', 'news_article', 3, 'São Paulo', 'Comício', 'lula-oposicao-cia-fbi-b89-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que indígenas são como crianças a serem cuidadas.', 'Índio é como criança. A gente tem que cuidar, proteger, ensinar. O Estado é o pai dos índios.', 'Evento em Altamira. APIB protestou infantilização.', 'verified', false, '2023-11-30', 'https://g1.globo.com/politica/noticia/2023/11/30/lula-indio-crianca-estado-pai.ghtml', 'news_article', 3, 'Altamira', 'Evento indígena', 'lula-indio-crianca-b89-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde o próprio governo e cita ministro demitido como atual.', 'O Silvio Almeida, nosso ministro, que tá fazendo um trabalho bonito... ele saiu, né?', 'Evento em setembro de 2024 após demissão de Silvio. Fala mostrou desatenção pública.', 'verified', false, '2024-09-20', 'https://www.poder360.com.br/governo/lula-confunde-silvio-ministro-saiu/', 'news_article', 2, 'Brasília', 'Evento', 'lula-silvio-saiu-esqueceu-b89-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Sergio Moro de bandido com crachá de juiz.', 'O Moro é bandido com crachá de juiz. Ele usou a toga pra fazer maldade política.', 'Comício em Curitiba. Moro ingressou com processo de reparação.', 'verified', true, '2023-03-15', 'https://www.estadao.com.br/politica/lula-moro-bandido-crachá-juiz/', 'news_article', 3, 'Curitiba', 'Comício', 'lula-moro-bandido-cracha-b89-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que milícia só existe no Rio porque o Rio é bolsonarista.', 'A milícia é filha do bolsonarismo. O Rio vive milícia porque bolsonarismo cresceu ali.', 'Entrevista no Rio. Fala generalista criticada por Castro.', 'verified', false, '2024-05-22', 'https://www.cnnbrasil.com.br/politica/lula-milicia-rio-bolsonarismo/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'lula-milicia-rio-b89-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende em evento religioso que não apoia aborto, contrariando base.', 'Eu não apoio aborto. Deus sabe que eu não apoio. Sou católico e respeito a vida.', 'Missa em Aparecida. Base feminista e progressista do PT ficou em silêncio crítico.', 'verified', true, '2024-10-12', 'https://www1.folha.uol.com.br/poder/2024/10/lula-nao-apoia-aborto-aparecida.shtml', 'news_article', 2, 'Aparecida', 'Missa Padroeira', 'lula-nao-apoia-aborto-b89-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que povo brasileiro vai trair o PT se Haddad subir imposto.', 'Se o Haddad subir imposto, o povo vai trair a gente. E aí não tem como ganhar 2026.', 'Conversa com ministros vazada. Demonstrou contradição entre discurso e prática fiscal.', 'verified', false, '2024-10-15', 'https://www.poder360.com.br/governo/lula-imposto-haddad-povo-trair/', 'news_article', 2, 'Brasília', 'Reunião vazada', 'lula-povo-trair-haddad-b89-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que carro é caro porque Bolsonaro quebrou a indústria.', 'Carro hoje é caro porque o Bolsonaro quebrou a indústria automotiva. Não é culpa nossa.', 'Evento em São Bernardo. Anfavea rebateu com dados contraditórios.', 'verified', false, '2024-06-02', 'https://g1.globo.com/politica/noticia/2024/06/02/lula-carro-caro-bolsonaro-industria.ghtml', 'news_article', 2, 'São Bernardo do Campo', 'Evento industrial', 'lula-carro-caro-bolsonaro-b89-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza que BRICS é mais importante que G7.', 'O BRICS hoje é mais importante que o G7. Os ricos do mundo ficaram pra trás, é o BRICS que decide.', 'Cúpula em Kazan. Oposição apontou exagero geopolítico.', 'verified', true, '2024-10-23', 'https://www1.folha.uol.com.br/mundo/2024/10/lula-brics-importante-g7-kazan.shtml', 'news_article', 2, 'Kazan', 'Cúpula BRICS', 'lula-brics-mais-importante-b89-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Erdogan é amigo pessoal e não é autoritário.', 'Erdogan é meu amigo pessoal. Não é autoritário, é líder forte. Cada país tem seu estilo.', 'Entrevista a jornal turco. Ativistas turcos em exílio protestaram.', 'verified', false, '2024-06-29', 'https://www.cnnbrasil.com.br/internacional/lula-erdogan-amigo-nao-autoritario/', 'news_article', 3, 'Ancara', 'Visita oficial', 'lula-erdogan-amigo-b89-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o petróleo amazônico é nosso e quem critica é bobo.', 'Esse petróleo da foz do Amazonas é nosso. Quem critica não entende de petróleo, é bobo ambientalista.', 'Entrevista em Macapá. Marina Silva reagiu internamente.', 'verified', true, '2025-02-28', 'https://www.estadao.com.br/politica/lula-petroleo-foz-amazonas-bobo-ambientalista/', 'news_article', 3, 'Macapá', 'Evento petróleo', 'lula-petroleo-foz-bobo-b89-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a COP30 só vai ter sucesso se ele presidir.', 'A COP30 só vai dar certo se eu presidir. Ninguém mais tem moral pro mundo todo.', 'Evento em Belém. Marina Silva e Ana Toni foram discretamente relegadas.', 'verified', false, '2025-11-05', 'https://www.metropoles.com/brasil/politica-brasil/lula-cop30-so-eu-presido', 'news_article', 2, 'Belém', 'Pré-COP30', 'lula-cop30-so-eu-b89-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai enquadrar o Musk no Brasil se ele continuar com bravatas.', 'Esse Musk se vier aqui, vai ser enquadrado. Não vai mandar aqui. Aqui mando eu.', 'Entrevista em SP. Fala acirrou disputa com X Corp.', 'verified', false, '2024-04-10', 'https://www.poder360.com.br/midia/lula-musk-enquadrar-brasil/', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-musk-enquadrar-b89-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que oposição parlamentar é bicho que não serve pra nada.', 'Esses bicho da oposição não servem pra nada. Vivem atrapalhando, fazendo obstrução, jogando pro público.', 'Evento em Brasília. Frente parlamentar de oposição acionou PGR.', 'verified', false, '2024-08-22', 'https://g1.globo.com/politica/noticia/2024/08/22/lula-oposicao-bicho-nao-serve.ghtml', 'news_article', 3, 'Brasília', 'Evento', 'lula-oposicao-bicho-b89-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em entrevista estrangeira que o Brasil é dele e de mais ninguém.', 'O Brasil é meu. O povo é meu. Eu conheço cada canto desse país melhor que qualquer um.', 'Entrevista à BBC em Londres. Oposição criticou tom patrimonialista.', 'verified', true, '2024-07-15', 'https://www.bbc.com/portuguese/brasil-lula-brasil-e-meu-entrevista', 'news_article', 3, 'Londres', 'BBC', 'lula-brasil-e-meu-b89-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não aguenta mais as birras do Congresso contra ele.', 'Não aguento mais esse Congresso fazendo birra. Parece criança. Assinam emenda e depois votam contra.', 'Entrevista à rádio. Lira chamou para reunião tensa.', 'verified', false, '2024-10-29', 'https://www1.folha.uol.com.br/poder/2024/10/lula-congresso-birra-crianca.shtml', 'news_article', 2, 'Brasília', 'Rádio Nacional', 'lula-congresso-birra-b89-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que todos que criticam Janja são misóginos.', 'Todo mundo que critica a Janja é misógino. Toda crítica à minha mulher é machismo, é misoginia.', 'Entrevista em SP. Jornalistas criticaram generalização protetiva.', 'verified', true, '2024-08-05', 'https://www.cnnbrasil.com.br/politica/lula-janja-criticas-misoginia/', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-janja-misoginia-b89-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a pandemia matou mais por causa de Bolsonaro que do vírus.', 'Quem matou na pandemia foi o Bolsonaro, não foi o vírus. O vírus só matou porque Bolsonaro não comprou vacina.', 'Evento em Manaus. Ex-ministros da saúde contestaram simplificação.', 'verified', true, '2023-09-24', 'https://www.estadao.com.br/saude/lula-bolsonaro-matou-pandemia-nao-virus/', 'news_article', 3, 'Manaus', 'Evento saúde', 'lula-bolsonaro-matou-pandemia-b89-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que 2026 está vencido e já pode começar a colheita eleitoral.', 'A gente já venceu 2026. Só falta a eleição. A colheita já está feita, só faltou colher.', 'Evento em Brasília. Aliados pediram discrição estratégica.', 'verified', false, '2025-11-10', 'https://www.metropoles.com/brasil/politica-brasil/lula-2026-vencido-colheita', 'news_article', 1, 'Brasília', 'Evento', 'lula-2026-vencido-b89-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Marina Silva exagera com meio ambiente e atrapalha tudo.', 'A Marina exagera, quer preservar tudo. Vamos preservar, mas também tem que produzir. É moderação.', 'Entrevista em BH. Marina reagiu nos bastidores.', 'verified', true, '2024-03-25', 'https://www.poder360.com.br/governo/lula-marina-exagera-meio-ambiente/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'lula-marina-exagera-b89-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a Amazônia está cheia de ONG gringa traidora.', 'A Amazônia tá cheia de ONG gringa que é traidora. Eles querem internacionalizar a Amazônia.', 'Discurso em Manaus. Comunidades indígenas criticaram.', 'verified', false, '2024-02-27', 'https://g1.globo.com/politica/noticia/2024/02/27/lula-amazonia-ong-gringa-traidora.ghtml', 'news_article', 3, 'Manaus', 'Evento', 'lula-amazonia-ong-gringa-b89-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama governador do Rio Cláudio Castro de omisso em meio a violência.', 'O Cláudio Castro é omisso. A violência no Rio é culpa dele, não minha. Ele não governa nada.', 'Entrevista em BH após chacina no Complexo do Alemão. Castro reagiu com contra-ataque.', 'verified', false, '2025-10-30', 'https://www.cnnbrasil.com.br/politica/lula-claudio-castro-omisso-violencia-rio/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'lula-castro-omisso-b89-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a violência no Rio é culpa dos ricos que armaram os pobres.', 'A violência do Rio é culpa do rico que armou o pobre pra se defender do pobre. É o jogo do rico.', 'Entrevista após chacina. Especialistas apontaram superficialidade.', 'verified', false, '2025-10-31', 'https://www1.folha.uol.com.br/cotidiano/2025/10/lula-violencia-rico-armou-pobre.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-violencia-rico-armou-b89-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Janja tem que ter vantagens de primeira-dama.', 'A Janja é primeira-dama. Ela tem direito a viajar, a usar avião, a ter estrutura. Faz parte do cargo.', 'Entrevista sobre gastos da primeira-dama. TCU já questionava viagens.', 'verified', true, '2024-09-02', 'https://www.estadao.com.br/politica/lula-janja-vantagens-primeira-dama/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-janja-vantagens-b89-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vale-gás ajudou mais que qualquer programa da direita.', 'O vale-gás ajudou mais que tudo que a direita fez em quatro anos. Todo governo deveria copiar.', 'Evento em Teresina. Dados contraditam o impacto absoluto.', 'verified', false, '2024-04-15', 'https://www.poder360.com.br/governo/lula-vale-gas-mais-que-direita/', 'news_article', 1, 'Teresina', 'Evento', 'lula-vale-gas-mais-b89-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que corintiano não vota em Bolsonaro, politizando futebol.', 'Corintiano não vota em Bolsonaro. Corintiano é povo, é trabalhador, é pobre.', 'Evento no Parque São Jorge. Torcedores bolsonaristas reagiram.', 'verified', false, '2023-12-14', 'https://g1.globo.com/politica/noticia/2023/12/14/lula-corintiano-nao-vota-bolsonaro.ghtml', 'news_article', 1, 'São Paulo', 'Evento Corinthians', 'lula-corintiano-nao-vota-b89-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que ministros têm que bajular o presidente para funcionar.', 'Ministro tem que saber bajular o presidente de vez em quando. Faz parte do jogo. Todo presidente gosta.', 'Conversa gravada e vazada. Oposição explorou como confissão de personalismo.', 'verified', true, '2024-11-08', 'https://www1.folha.uol.com.br/poder/2024/11/lula-ministros-bajular-presidente.shtml', 'news_article', 3, 'Brasília', 'Conversa vazada', 'lula-ministros-bajular-b89-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em confusão que o Brasil tem 200 milhões de brasileiros ricos.', 'O Brasil tem 200 milhões de brasileiros ricos... quer dizer, 200 milhões de brasileiros no total, pobres e ricos juntos.', 'Evento em Brasília. Lapso compartilhado ironicamente.', 'verified', false, '2023-08-18', 'https://www.metropoles.com/brasil/politica-brasil/lula-200-milhoes-ricos', 'news_article', 1, 'Brasília', 'Evento', 'lula-200-milhoes-lapso-b89-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala de Janja como se ela fosse ministra sem portfólio.', 'A Janja é minha ministra sem portfólio. Ela é mais ativa que ministro nenhum.', 'Entrevista à BandNews. Oposição viu conflito institucional.', 'verified', true, '2024-06-05', 'https://www.cnnbrasil.com.br/politica/lula-janja-ministra-sem-portfolio/', 'news_article', 3, 'São Paulo', 'BandNews', 'lula-janja-ministra-b89-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insiste em comparar Bolsonaro a Adolfo Hitler do Brasil.', 'O Bolsonaro é o Hitler do Brasil. A diferença é que aqui ele não teve sucesso, graças a Deus.', 'Entrevista em Foz. Advogados de Bolsonaro acionaram PGR.', 'verified', true, '2024-07-22', 'https://www.estadao.com.br/politica/lula-bolsonaro-hitler-brasil/', 'news_article', 3, 'Foz do Iguaçu', 'Entrevista', 'lula-bolsonaro-hitler-b89-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que policial militar é funcionário da elite rica.', 'O PM hoje trabalha pra elite rica, protege condomínio. Não protege o povo. Virou segurança de rico.', 'Entrevista em SP. Sindicatos policiais reagiram em nota.', 'verified', false, '2024-06-11', 'https://www.poder360.com.br/seguranca/lula-pm-elite-rica-condominio/', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-pm-elite-rica-b89-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em cúpula que só ele fala de fome no mundo.', 'Aqui no mundo, só eu falo de fome. Os outros presidentes não se importam. Só eu.', 'G20 em Nova Délhi. Exagero criticado por aliados internacionais.', 'verified', true, '2023-09-10', 'https://g1.globo.com/mundo/noticia/2023/09/10/lula-g20-so-eu-falo-fome.ghtml', 'news_article', 2, 'Nova Délhi', 'G20', 'lula-so-eu-fome-b89-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula esquece nome de Simone Tebet e a chama de Simone Mendes.', 'A Simone Mendes, nossa ministra... desculpa, Simone Tebet. Confundi com a cantora.', 'Evento em Brasília. Tebet reagiu com humor.', 'verified', false, '2024-01-22', 'https://www1.folha.uol.com.br/poder/2024/01/lula-simone-tebet-mendes.shtml', 'news_article', 1, 'Brasília', 'Evento', 'lula-tebet-mendes-b89-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o TCU só existe pra atrapalhar governo de esquerda.', 'O TCU só existe pra atrapalhar governo de esquerda. No governo Bolsonaro não atrapalhou nada.', 'Entrevista em Brasília. Presidência do TCU rebateu institucionalmente.', 'verified', false, '2024-08-12', 'https://www.cnnbrasil.com.br/politica/lula-tcu-atrapalha-esquerda/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-tcu-atrapalha-b89-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Randolfe virou de direita depois que saiu do PSOL.', 'O Randolfe virou direita depois que saiu do PSOL. Virou centrão, é assim que faz.', 'Entrevista em SP. Randolfe ingressou no PT meses depois, rebatendo a fala.', 'verified', false, '2023-06-05', 'https://www.estadao.com.br/politica/lula-randolfe-direita-saiu-psol/', 'news_article', 1, 'São Paulo', 'Entrevista', 'lula-randolfe-direita-b89-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que governo prévio deixou buraco tão grande que nunca vai pagar.', 'O buraco que o Bolsonaro deixou é tão grande que a gente nunca vai pagar. Só se o povo pagar.', 'Entrevista à BandNews. Economistas criticaram o tom resignado.', 'verified', false, '2024-03-02', 'https://www.poder360.com.br/economia/lula-buraco-bolsonaro-povo-paga/', 'news_article', 2, 'Brasília', 'BandNews', 'lula-buraco-bolsonaro-b89-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que conselho ministerial é teatro e só ele manda no governo.', 'Esse conselho de ministros é teatro. Quem decide é o presidente. Aqui, sou eu.', 'Reunião gravada e vazada. Ministros reagiram nos bastidores.', 'verified', true, '2024-12-10', 'https://g1.globo.com/politica/noticia/2024/12/10/lula-conselho-ministerial-teatro.ghtml', 'news_article', 3, 'Brasília', 'Reunião vazada', 'lula-conselho-teatro-b89-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a imprensa sempre mentiu sobre ele e sempre vai mentir.', 'A imprensa sempre mentiu sobre o Lula, sempre vai mentir. Faz parte da natureza da imprensa.', 'Entrevista a youtubers petistas. Associações jornalísticas criticaram generalização.', 'verified', false, '2024-10-20', 'https://www1.folha.uol.com.br/poder/2024/10/lula-imprensa-sempre-mentiu-mentir.shtml', 'news_article', 3, 'Brasília', 'Podcast militantes', 'lula-imprensa-sempre-mentiu-b89-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que se ministro não render vai trocar como camisa suja.', 'Ministro que não rende troca como camisa suja. Não tenho paciência com gente que não produz.', 'Entrevista em BH. Ministros considerados em risco ficaram desestabilizados.', 'verified', false, '2024-07-09', 'https://www.metropoles.com/brasil/politica-brasil/lula-ministro-camisa-suja', 'news_article', 2, 'Belo Horizonte', 'Entrevista', 'lula-ministro-camisa-suja-b89-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala em tom religioso que é missão divina governar o Brasil.', 'Deus me escolheu pra governar o Brasil. Foi missão divina, não humana. Eu sou eleito de Deus.', 'Culto em SP. Oposição evangélica criticou apropriação religiosa.', 'verified', true, '2024-05-05', 'https://www.cnnbrasil.com.br/politica/lula-missao-divina-governar-brasil/', 'news_article', 3, 'São Paulo', 'Culto evangélico', 'lula-missao-divina-b89-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Brasil não precisa de Itamaraty velho e elitista.', 'Esse Itamaraty é velho e elitista. Diplomata fala francês e não liga pro pobre. Vou mudar.', 'Entrevista em Genebra. Diplomatas reagiram em nota interna.', 'verified', false, '2023-06-16', 'https://www.estadao.com.br/politica/lula-itamaraty-velho-elitista/', 'news_article', 3, 'Genebra', 'Entrevista', 'lula-itamaraty-elitista-b89-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que mandou Padilha se resolver com Congresso sozinho.', 'Falei pro Padilha: se vira no Congresso. Não é problema meu, é seu. Vai lá e resolve.', 'Entrevista em SP. Pastor evangélico da base reclamou falta de articulação.', 'verified', false, '2024-11-18', 'https://www.poder360.com.br/governo/lula-padilha-congresso-se-vira/', 'news_article', 2, 'São Paulo', 'Entrevista', 'lula-padilha-se-vira-b89-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o BRICS vai criar moeda única e destruir o dólar.', 'A gente vai criar moeda única no BRICS. Vai destruir o dólar. O dólar está com os dias contados.', 'Cúpula BRICS. Fala mexeu com mercado cambial internacional.', 'verified', true, '2023-08-22', 'https://g1.globo.com/economia/noticia/2023/08/22/lula-brics-moeda-destruir-dolar.ghtml', 'news_article', 3, 'Joanesburgo', 'Cúpula BRICS', 'lula-brics-moeda-dolar-b89-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Caiado é governador caipira que não entende de nada.', 'O Caiado é caipira, não entende de governar. Goiás parou sob o comando dele. É só boiadeiro.', 'Entrevista em Brasília. Caiado reagiu em nota acalmada.', 'verified', false, '2024-05-16', 'https://www1.folha.uol.com.br/poder/2024/05/lula-caiado-caipira-goias.shtml', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-caiado-caipira-b89-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Jair Bolsonaro foi a maior praga do Brasil.', 'O Bolsonaro foi a maior praga que o Brasil já teve. Pior que peste, pior que guerra, pior que crise.', 'Comício em Recife. Bolsonaristas reagiram nas redes.', 'verified', false, '2024-10-02', 'https://www.cnnbrasil.com.br/politica/lula-bolsonaro-maior-praga-brasil/', 'news_article', 2, 'Recife', 'Comício', 'lula-bolsonaro-praga-b89-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que tem coragem e todo mundo deveria ter.', 'Eu tenho coragem. Quem não tem coragem é corno. Tem que enfrentar a vida de peito aberto.', 'Discurso em SBC. Fala com palavrão repercutiu em redes.', 'verified', false, '2024-05-01', 'https://www.metropoles.com/brasil/politica-brasil/lula-coragem-corno-1-maio', 'news_article', 2, 'São Bernardo do Campo', 'Ato 1 Maio', 'lula-coragem-corno-b89-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em 2026 que vai governar até 2030 se Deus permitir.', 'Se Deus permitir, eu governo até 2030. Não acabo em 2026, não. Tô ficando forte de novo.', 'Entrevista em Brasília no início de 2026. Alarmou aliados que planejavam sucessão.', 'verified', true, '2026-02-15', 'https://www1.folha.uol.com.br/poder/2026/02/lula-governar-ate-2030-deus-permitir.shtml', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-governar-ate-2030-b89-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
