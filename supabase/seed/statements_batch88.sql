-- Batch 88: Lula's communication style — gaffes, verbal slips, controversial phrasings (Jan 2023 - Apr 2026)
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Janja de Marisa em evento público, confundindo a atual com a ex-mulher falecida.', 'A Marisa... desculpa, a Janja está me ajudando muito nessa transição.', 'Durante cerimônia de transmissão de cargo em Brasília, Lula se confundiu e chamou a primeira-dama Janja pelo nome de Marisa Letícia, sua ex-esposa falecida em 2017.', 'verified', true, '2023-01-10', 'https://www1.folha.uol.com.br/poder/2023/01/lula-confunde-janja-com-marisa-em-evento.shtml', 'news_article', 2, 'Palácio do Planalto', 'Transmissão de cargo', 'lula-confunde-janja-marisa-b88-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara operação israelense em Gaza ao Holocausto de Hitler, causando crise diplomática.', 'O que está acontecendo na Faixa de Gaza com o povo palestino não existe em nenhum outro momento histórico. Aliás, existiu, quando Hitler resolveu matar os judeus.', 'Declaração em Adis Abeba, Etiópia, durante cúpula da União Africana. Israel declarou Lula persona non grata em resposta e o Brasil chamou o embaixador para consultas.', 'verified', true, '2024-02-18', 'https://g1.globo.com/politica/noticia/2024/02/18/lula-compara-guerra-em-gaza-ao-holocausto-de-hitler.ghtml', 'news_article', 4, 'Adis Abeba', 'Cúpula da União Africana', 'lula-gaza-hitler-b88-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Milei é ridículo e insulta o presidente argentino publicamente.', 'O Milei falou muita bobagem. Ele tem que pedir desculpas. Ele falou uma besteira. É um cara ridículo.', 'Entrevista a jornalistas em Brasília, após trocas de insultos entre os dois presidentes. O episódio marcou deterioração nas relações Brasil-Argentina.', 'verified', true, '2024-05-21', 'https://www.estadao.com.br/politica/lula-chama-milei-de-ridiculo-e-pede-desculpas/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-milei-ridiculo-b88-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que presidente do BC Campos Neto tem lado político e sabota o governo.', 'Esse cidadão do Banco Central tem comportamento político. Não tem explicação para ele manter a taxa de juros nesse nível, a não ser querer prejudicar o país.', 'Entrevista à Band, em meio a conflitos públicos com Roberto Campos Neto sobre a Selic. Fala derrubou mercados no dia seguinte.', 'verified', true, '2023-02-02', 'https://www.poder360.com.br/economia/lula-ataca-campos-neto-banco-central/', 'news_article', 3, 'São Paulo', 'Entrevista à Band', 'lula-campos-neto-politico-b88-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que a guerra na Ucrânia tem dois lados com responsabilidade, gerando crise com Zelensky.', 'Quando um não quer, dois não brigam. Os dois lados têm responsabilidade pela guerra. A Ucrânia também contribuiu para esse conflito.', 'Declaração em Abu Dhabi, durante viagem aos Emirados Árabes. O governo ucraniano reagiu com indignação e cancelou encontro previsto.', 'verified', true, '2023-04-15', 'https://www1.folha.uol.com.br/mundo/2023/04/lula-diz-que-ucrania-tem-responsabilidade-pela-guerra.shtml', 'news_article', 4, 'Abu Dhabi', 'Visita aos Emirados Árabes', 'lula-ucrania-dois-lados-b88-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a Ucrânia é exportadora de mão-de-obra barata, causando indignação.', 'A Ucrânia virou exportadora de gente. Está vazia, todo mundo foi embora para trabalhar na Europa por salário baixo.', 'Café da manhã com jornalistas em Brasília. Declaração foi considerada desrespeitosa com refugiados ucranianos pelo governo de Kiev.', 'verified', false, '2023-05-08', 'https://www.cnnbrasil.com.br/politica/lula-ucrania-exportadora-mao-de-obra/', 'news_article', 3, 'Brasília', 'Café com jornalistas', 'lula-ucrania-mao-de-obra-b88-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama traficante morto em operação policial de vítima da sociedade.', 'Esse menino que foi morto pela polícia é uma vítima da sociedade. Ninguém nasce traficante, a sociedade faz o traficante.', 'Evento em periferia de São Paulo sobre juventude. A fala foi criticada por setores de segurança pública e familiares de vítimas da violência.', 'verified', true, '2023-07-12', 'https://g1.globo.com/politica/noticia/2023/07/12/lula-diz-que-traficante-e-vitima-da-sociedade.ghtml', 'news_article', 3, 'São Paulo', 'Evento sobre juventude', 'lula-traficante-vitima-b88-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula elogia fisicamente mulher presente em evento, chamando-a de mulher bonita.', 'Olha essa mulher bonita aqui na primeira fila, que coisa boa de ver de manhã cedo.', 'Evento do Minha Casa Minha Vida em Pernambuco. Comentário foi criticado por entidades feministas como objetificação.', 'verified', false, '2023-03-30', 'https://www.metropoles.com/brasil/politica-brasil/lula-mulher-bonita-evento', 'news_article', 2, 'Recife', 'Evento Minha Casa Minha Vida', 'lula-mulher-bonita-b88-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula usa o termo mulherzinha em tom pejorativo ao criticar adversários políticos.', 'O cara se comporta como uma mulherzinha, fica chorando toda hora. Homem de verdade encara as coisas de frente.', 'Comício em Minas Gerais ao criticar opositores. A fala foi denunciada por parlamentares como reforço a estereótipos machistas.', 'verified', true, '2024-03-11', 'https://www1.folha.uol.com.br/poder/2024/03/lula-mulherzinha-critica-machismo.shtml', 'news_article', 3, 'Belo Horizonte', 'Comício', 'lula-mulherzinha-b88-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Maduro não é ditador, contradizendo consenso democrático internacional.', 'Esse negócio de falar que tem ditadura na Venezuela é narrativa. Cada país tem sua história, o Maduro foi eleito.', 'Entrevista à RedeTV após reunião com Maduro no Itamaraty. A fala provocou reações da oposição venezuelana e de governos latino-americanos.', 'verified', true, '2023-05-29', 'https://www.estadao.com.br/politica/lula-nega-ditadura-venezuela-maduro/', 'news_article', 4, 'Brasília', 'Entrevista à RedeTV', 'lula-maduro-nao-ditador-b88-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que Trump faz o que quer e sugere que líderes democráticos deveriam ter mais autonomia.', 'O Trump faz o que quer, não tem ninguém que segure ele. Os presidentes nos Estados Unidos têm mais poder do que aqui.', 'Declaração em café da manhã com jornalistas estrangeiros. A fala foi usada por oposição como sinal de inveja autoritária.', 'verified', false, '2025-02-14', 'https://www.poder360.com.br/governo/lula-trump-faz-o-que-quer/', 'news_article', 2, 'Brasília', 'Café com correspondentes estrangeiros', 'lula-trump-faz-o-que-quer-b88-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama imprensa de inimiga do povo brasileiro em discurso inflamado.', 'Tem parte da imprensa que é inimiga do povo. Escreve mentira, inventa coisa, distorce tudo que eu falo.', 'Discurso em encontro com militantes do PT em São Paulo. Associações de jornalistas emitiram nota de repúdio.', 'verified', true, '2023-09-07', 'https://www1.folha.uol.com.br/poder/2023/09/lula-ataca-imprensa-inimiga-povo.shtml', 'news_article', 3, 'São Paulo', 'Encontro PT', 'lula-imprensa-inimiga-b88-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde Dilma com Irma, sua irmã, durante entrevista ao vivo.', 'A Irma... quer dizer, a Dilma, está fazendo um trabalho maravilhoso no banco do BRICS.', 'Entrevista à GloboNews sobre o banco dos BRICS. Lula se corrigiu rapidamente mas a troca viralizou.', 'verified', false, '2023-04-12', 'https://g1.globo.com/politica/noticia/2023/04/12/lula-confunde-dilma-com-irma-entrevista.ghtml', 'news_article', 1, 'Brasília', 'Entrevista GloboNews', 'lula-dilma-irma-b88-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que em Israel se pratica genocídio contra o povo palestino.', 'Isso não é guerra, é genocídio. Israel está cometendo genocídio contra crianças e mulheres palestinas.', 'Declaração em cúpula da CELAC. Gerou crise diplomática, com Israel convocando embaixador brasileiro.', 'verified', true, '2024-02-20', 'https://www.cnnbrasil.com.br/internacional/lula-israel-genocidio-gaza/', 'news_article', 4, 'São Vicente', 'Cúpula CELAC', 'lula-israel-genocidio-b88-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quer acabar com a autonomia do Banco Central se depender dele.', 'Se depender de mim, a autonomia do BC acaba. Não pode um cara que eu não indiquei determinar os juros do país que eu governo.', 'Entrevista ao Jornal Nacional. Fala derrubou o dólar e abriu disputa pública com Campos Neto.', 'verified', true, '2023-02-16', 'https://www.estadao.com.br/economia/lula-autonomia-banco-central-acabar/', 'news_article', 3, 'Brasília', 'Entrevista JN', 'lula-autonomia-bc-acabar-b88-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere comparar Netanyahu a nazistas e retira embaixador brasileiro de Israel.', 'Netanyahu não está brigando com o Hamas, está brigando com crianças, com mulheres. É exatamente o que os nazistas fizeram.', 'Declaração em Adis Abeba durante coletiva. Intensificou crise diplomática já aberta pela comparação com Hitler.', 'verified', true, '2024-02-19', 'https://g1.globo.com/mundo/noticia/2024/02/19/lula-netanyahu-nazistas.ghtml', 'news_article', 4, 'Adis Abeba', 'Coletiva União Africana', 'lula-netanyahu-nazistas-b88-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que oposição é composta por fascistas e nazistas.', 'Essa direita que está aí é fascista, é nazista. Não é oposição democrática, é gente que quer destruir o Brasil.', 'Comício no Recife em 2024. Parlamentares oposicionistas acionaram notícia-crime por injúria coletiva.', 'verified', false, '2024-07-10', 'https://www.metropoles.com/brasil/politica-brasil/lula-oposicao-fascista-nazista', 'news_article', 3, 'Recife', 'Comício', 'lula-oposicao-fascista-b88-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que evangélicos foram enganados pela direita bolsonarista.', 'Os evangélicos foram enganados. Muitos pastores mentiram, diziam que eu ia fechar igreja, e o povo acreditou na mentira.', 'Discurso em evento sindical em São Bernardo. Entidades evangélicas reagiram negativamente à generalização.', 'verified', false, '2023-05-01', 'https://www1.folha.uol.com.br/poder/2023/05/lula-evangelicos-enganados-direita.shtml', 'news_article', 2, 'São Bernardo do Campo', 'Ato do Primeiro de Maio', 'lula-evangelicos-enganados-b88-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Zema de mentiroso profissional em ato público.', 'O Zema é mentiroso profissional. Fala que o governo federal não ajuda Minas, mas é ele que não trabalha.', 'Evento em Belo Horizonte sobre calamidade nas chuvas. O governador reagiu com nota pública.', 'verified', false, '2024-01-20', 'https://www.estadao.com.br/politica/lula-zema-mentiroso-profissional/', 'news_article', 2, 'Belo Horizonte', 'Visita a áreas de enchente', 'lula-zema-mentiroso-b88-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai mandar cortar os salários dos servidores do BC se não reduzirem os juros.', 'Se o Banco Central não reduzir os juros, eu vou ver o que é possível fazer com o salário deles. Não pode receber fortuna para prejudicar o país.', 'Entrevista no Piauí. Fala repercutiu como ameaça institucional contra autonomia monetária.', 'verified', true, '2023-02-20', 'https://www.poder360.com.br/economia/lula-ameaca-servidores-bc-salario/', 'news_article', 3, 'Teresina', 'Entrevista regional', 'lula-salario-bc-cortar-b88-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz off-script que quer voltar a ser candidato em 2030 apesar da idade.', 'Se Deus me der saúde, eu posso ser candidato em 2030 também. Tem muita coisa pra fazer.', 'Conversa informal com jornalistas em Brasília. Repercutiu mal entre aliados preocupados com transição.', 'verified', false, '2024-09-05', 'https://g1.globo.com/politica/noticia/2024/09/05/lula-candidato-2030-saude.ghtml', 'news_article', 1, 'Brasília', 'Conversa com jornalistas', 'lula-candidato-2030-b88-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama jornalistas de idiotas em coletiva irritada.', 'Vocês jornalistas às vezes são uns idiotas, perguntam besteira e ainda acham que estão ajudando o país.', 'Coletiva em que repórteres questionavam gastos de Janja. Abin avaliou segurança após ofensa.', 'verified', false, '2024-06-22', 'https://www.metropoles.com/brasil/politica-brasil/lula-chama-jornalistas-idiotas', 'news_article', 2, 'Brasília', 'Coletiva presidencial', 'lula-jornalistas-idiotas-b88-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende que Maduro deve tirar dúvidas sobre eleição venezuelana, minimizando fraude.', 'Quem ganhou uma eleição, presta contas. Se o Maduro ganhou, ele tem que mostrar as atas.', 'Entrevista a rádio em Brasília. Fala foi vista como tentativa de relativização após declaração fraudulenta da vitória chavista.', 'verified', true, '2024-08-01', 'https://www.cnnbrasil.com.br/internacional/lula-maduro-eleicao-atas/', 'news_article', 3, 'Brasília', 'Entrevista à rádio', 'lula-maduro-atas-b88-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula admite que tinha esperança de que Maduro reconhecesse derrota, rompendo com aliado.', 'Eu achava que o Maduro iria fazer a coisa certa. O Maduro sabe que o regime dele é desagradável, tem viés autoritário.', 'Entrevista a correspondentes internacionais. Foi a primeira vez que Lula admitiu caráter autoritário do regime venezuelano.', 'verified', true, '2024-08-15', 'https://www1.folha.uol.com.br/mundo/2024/08/lula-maduro-viesautoritario.shtml', 'news_article', 3, 'Brasília', 'Entrevista correspondentes', 'lula-maduro-autoritario-b88-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que boliviano é bonzinho em referência a imigrantes latino-americanos.', 'O boliviano é bonzinho, o peruano também. Eles trabalham muito nas costureiras, ajudam a economia de São Paulo.', 'Discurso em evento sobre migração. Entidades de imigrantes apontaram estereotipização infantilizadora.', 'verified', false, '2023-11-14', 'https://www.estadao.com.br/politica/lula-boliviano-bonzinho-imigracao/', 'news_article', 2, 'São Paulo', 'Evento sobre migração', 'lula-boliviano-bonzinho-b88-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde nome de ministro Rui Costa chamando-o de Haddad em evento.', 'O Haddad... desculpa, o Rui Costa está fazendo um trabalho excepcional na Casa Civil.', 'Cerimônia no Palácio do Planalto. Mais um episódio da série de confusões de nomes do presidente.', 'verified', false, '2023-06-08', 'https://g1.globo.com/politica/noticia/2023/06/08/lula-confunde-rui-costa-haddad.ghtml', 'news_article', 1, 'Palácio do Planalto', 'Cerimônia', 'lula-confunde-rui-haddad-b88-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que homem de verdade não fala grosso com mulher, em fala considerada paternalista.', 'Homem de verdade não grita com mulher, não. Homem de verdade cuida, protege. Mulher tem que ser tratada como flor.', 'Evento do Dia das Mulheres em Brasília. Organizações feministas criticaram romantização e paternalismo.', 'verified', false, '2024-03-08', 'https://www.poder360.com.br/governo/lula-mulher-flor-dia-mulheres/', 'news_article', 2, 'Brasília', 'Evento 8 de março', 'lula-mulher-flor-b88-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula declara que o PIB do agronegócio serve para alimentar tubarão, em crítica exportadora.', 'Esse agronegócio todo serve pra alimentar tubarão na China. O povo brasileiro não come a soja que o agro produz.', 'Comício em Mato Grosso. Bancada ruralista reagiu com indignação, setor considerou ofensivo.', 'verified', false, '2023-09-21', 'https://www.metropoles.com/brasil/politica-brasil/lula-agro-tubarao-china', 'news_article', 2, 'Cuiabá', 'Comício', 'lula-agro-tubarao-b88-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o povo brasileiro comia mortadela na pandemia por culpa de Bolsonaro.', 'Na pandemia, o povo comia mortadela porque o Bolsonaro queria que o povo morresse de fome.', 'Entrevista radiofônica em Fortaleza. Fala foi disputada por base bolsonarista como exagero retórico.', 'verified', false, '2023-08-17', 'https://www1.folha.uol.com.br/poder/2023/08/lula-povo-mortadela-bolsonaro.shtml', 'news_article', 2, 'Fortaleza', 'Entrevista rádio', 'lula-mortadela-bolsonaro-b88-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que foi pobre e sabe o que é fome, em fala repetitiva criticada como populista.', 'Eu fui pobre, eu passei fome. Nenhum filho da puta aí que nunca passou fome pode falar do pobre.', 'Evento do Bolsa Família em Alagoas. O palavrão foi transmitido ao vivo e repercutiu na mídia.', 'verified', true, '2023-03-06', 'https://www.estadao.com.br/politica/lula-filho-da-puta-bolsa-familia/', 'news_article', 2, 'Maceió', 'Lançamento Bolsa Família', 'lula-filho-da-puta-pobre-b88-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Putin não será preso se vier ao Brasil para o G20.', 'Se o Putin vier ao Brasil, eu garanto que ele não será preso. O Brasil é um país soberano.', 'Entrevista à Firstpost India em Nova Délhi. Gerou crise com TPI, já que Brasil é signatário.', 'verified', true, '2023-09-09', 'https://g1.globo.com/politica/noticia/2023/09/09/lula-putin-nao-sera-preso-g20.ghtml', 'news_article', 4, 'Nova Délhi', 'Cúpula do G20', 'lula-putin-nao-preso-b88-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula volta atrás e diz que Putin será preso se vier ao Brasil, causando confusão diplomática.', 'Quem decide é a Justiça, não sou eu. Se a Justiça decidir prender, prende. Eu não falei o que disseram que eu falei.', 'Entrevista em Brasília após pressão internacional. Contradição explícita com fala anterior foi notada.', 'verified', false, '2023-09-11', 'https://www.cnnbrasil.com.br/politica/lula-volta-atras-putin-prisao/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-putin-volta-atras-b88-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Silvio Almeida de traidor após denúncias de assédio contra o ex-ministro.', 'Eu confiei no Silvio e ele me traiu. Isso não se faz com mulher, e não se faz com o governo.', 'Entrevista a jornalistas após demissão de Silvio Almeida. Reforçou narrativa ética, mas criticada por demora na saída.', 'verified', false, '2024-09-07', 'https://www.poder360.com.br/governo/lula-silvio-almeida-traidor-assedio/', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-silvio-traidor-b88-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que nunca viu tanta gente rica reclamando em sua vida.', 'Eu nunca vi tanta gente rica chorando no Brasil. Rico sempre teve de tudo, agora tá reclamando que o pobre está comendo picanha.', 'Ato do 1 de maio em São Paulo. Tornou-se bordão político repetido em campanha.', 'verified', true, '2023-05-01', 'https://www1.folha.uol.com.br/poder/2023/05/lula-rico-chorando-picanha.shtml', 'news_article', 2, 'São Paulo', 'Ato 1 de Maio', 'lula-rico-chorando-b88-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai acabar com jeitinho brasileiro, em fala contraditória sobre corrupção.', 'Esse jeitinho brasileiro tem que acabar. Só que o Brasil precisa ter seu jeitinho quando for pra defender o pobre.', 'Discurso em posse de ministros. A fala contradictória viralizou em redes como piada política.', 'verified', false, '2023-07-20', 'https://www.metropoles.com/brasil/politica-brasil/lula-jeitinho-brasileiro-contradicao', 'news_article', 1, 'Brasília', 'Posse de ministros', 'lula-jeitinho-contradicao-b88-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula insinua que Israel deveria ser processado pela ONU pelo genocídio.', 'A ONU tem que processar Israel. Se não processar, a ONU não serve pra nada, vira organização de fachada.', 'Discurso na Assembleia Geral da ONU. Delegações ocidentais protestaram.', 'verified', true, '2024-09-24', 'https://g1.globo.com/mundo/noticia/2024/09/24/lula-israel-onu-genocidio.ghtml', 'news_article', 3, 'Nova York', 'Assembleia Geral da ONU', 'lula-onu-israel-processo-b88-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o povo do Nordeste só conhece o PT, minimizando opção democrática.', 'No Nordeste, o povo conhece o PT. Não tem pra onde fugir, o PT fez tudo que tem lá.', 'Comício em Natal. Oposição acusou fala de patrimonialista e eleitoreira.', 'verified', false, '2024-08-10', 'https://www.estadao.com.br/politica/lula-nordeste-so-conhece-pt/', 'news_article', 2, 'Natal', 'Comício', 'lula-nordeste-pt-b88-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que os rios amazônicos nascem no Peru, em erro geográfico básico.', 'O rio Amazonas nasce lá no Peru, é um rio peruano que vira brasileiro. Temos que cuidar de toda a bacia.', 'Visita a Manaus para evento sobre Amazônia. Cientistas apontaram imprecisão sobre bacia hidrográfica.', 'verified', false, '2023-08-04', 'https://www.cnnbrasil.com.br/nacional/lula-rio-amazonas-peru-erro/', 'news_article', 2, 'Manaus', 'Cúpula da Amazônia', 'lula-amazonas-peru-b88-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que o desmatamento na Amazônia é culpa só de Bolsonaro, ignorando histórico.', 'O desmatamento é só culpa do Bolsonaro. No meu primeiro mandato não tinha desmatamento, era zero.', 'Entrevista à TV Cultura. Dados históricos contradizem a afirmação, com desmatamento elevado em seus mandatos anteriores.', 'verified', false, '2023-08-07', 'https://www1.folha.uol.com.br/ambiente/2023/08/lula-desmatamento-bolsonaro-culpa.shtml', 'news_article', 3, 'São Paulo', 'Entrevista TV Cultura', 'lula-desmatamento-culpa-bolsonaro-b88-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não vai mais falar com jornalistas que criticam Janja.', 'Não vou falar com jornalista que ataca minha mulher. Jornalista que fala mal da Janja não é jornalista, é militante.', 'Entrevista em Brasília. ABI e FENAJ emitiram notas de repúdio à intimidação à imprensa.', 'verified', true, '2024-07-15', 'https://www.poder360.com.br/midia/lula-jornalistas-janja-nao-falar/', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-jornalistas-janja-b88-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que rezou com o Papa para Janja engravidar, em fala estranha.', 'Eu pedi ao Papa pra rezar pra Janja engravidar. O Papa riu, disse que ia rezar. Deus é grande.', 'Entrevista a jornalistas após audiência no Vaticano. Repercutiu como fala fora do tom.', 'verified', false, '2023-06-21', 'https://g1.globo.com/politica/noticia/2023/06/21/lula-papa-janja-engravidar.ghtml', 'news_article', 1, 'Vaticano', 'Audiência com o Papa', 'lula-papa-janja-engravidar-b88-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula alfineta comparando ministros de ditadura com ministros do STF atual.', 'Esses ministros aí são corajosos, diferente dos ministros da ditadura que tinham medo do general.', 'Evento de homenagem a Dias Toffoli. Foi interpretado como comentário politizando o Supremo.', 'verified', false, '2023-11-01', 'https://www.estadao.com.br/politica/lula-ministros-stf-coragem-ditadura/', 'news_article', 2, 'Brasília', 'Homenagem STF', 'lula-ministros-coragem-ditadura-b88-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai cuidar das mulherzinhas do Bolsa Família, em fala condescendente.', 'A gente vai cuidar dessas mulherzinhas do Bolsa Família. Elas sofrem muito, precisam de ajuda do governo.', 'Evento do Bolsa Família em João Pessoa. Entidades feministas apontaram diminutivo patronizante.', 'verified', false, '2023-10-12', 'https://www.metropoles.com/brasil/politica-brasil/lula-mulherzinhas-bolsa-familia', 'news_article', 3, 'João Pessoa', 'Evento Bolsa Família', 'lula-mulherzinhas-bolsa-b88-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Bolsonaro tem cara de vagabundo, em ataque pessoal.', 'Olhem pro Bolsonaro, tem cara de vagabundo, cara de gente que não trabalha, nunca trabalhou na vida.', 'Comício em Diadema. Episódio reacendeu discussão sobre baixo nível do debate público.', 'verified', false, '2024-10-04', 'https://www.cnnbrasil.com.br/politica/lula-bolsonaro-vagabundo/', 'news_article', 2, 'Diadema', 'Comício municipal', 'lula-bolsonaro-vagabundo-b88-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que quem não vota no PT é contra o povo, em fala polarizadora.', 'Quem não vota no PT, vota contra o povo. Não tem como explicar de outro jeito.', 'Comício em Salvador. PT aliados pediram moderação discursiva nos dias seguintes.', 'verified', false, '2024-09-30', 'https://www1.folha.uol.com.br/poder/2024/09/lula-quem-nao-vota-pt-contra-o-povo.shtml', 'news_article', 3, 'Salvador', 'Comício eleitoral', 'lula-quem-nao-vota-pt-b88-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Milei não tem cérebro, em ataque diplomaticamente imprudente.', 'O Milei não tem cérebro, não sabe governar. A Argentina está afundando por culpa dele.', 'Entrevista à Globo. Novo episódio na crise bilateral.', 'verified', false, '2024-10-22', 'https://www.poder360.com.br/internacional/lula-milei-sem-cerebro/', 'news_article', 3, 'Brasília', 'Entrevista à Globo', 'lula-milei-sem-cerebro-b88-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula confunde Moçambique com Angola durante visita a África.', 'É um prazer estar aqui em Angola... quer dizer, em Moçambique. Esses países irmãos se confundem na gente.', 'Discurso em Maputo. Provocou risada incômoda da delegação moçambicana.', 'verified', false, '2023-08-25', 'https://g1.globo.com/mundo/noticia/2023/08/25/lula-confunde-mocambique-angola.ghtml', 'news_article', 1, 'Maputo', 'Visita oficial', 'lula-mocambique-angola-b88-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Alckmin de companheiro Alckmin, errando por empolgação até o nome do vice.', 'O companheiro Alckmin, o companheiro Geraldo Padilha, esse pessoal todo do governo.', 'Evento em Brasília sobre saúde. Lula trocou os nomes do vice e do ministro Padilha.', 'verified', false, '2023-04-25', 'https://www.estadao.com.br/politica/lula-confunde-alckmin-padilha/', 'news_article', 1, 'Brasília', 'Evento saúde', 'lula-alckmin-padilha-b88-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Bolsonaro deveria ir pra cadeia ou pro hospício, em ataque pessoal.', 'O Bolsonaro tinha que ir pra cadeia ou pro hospício. Aquele cara é louco, é perigoso pro Brasil.', 'Entrevista à BandNews. Fala retomada em notícia-crime de oposição.', 'verified', false, '2023-06-13', 'https://www.metropoles.com/brasil/politica-brasil/lula-bolsonaro-cadeia-hospicio', 'news_article', 2, 'São Paulo', 'Entrevista BandNews', 'lula-bolsonaro-hospicio-b88-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que pobre é o patrão da república, em fala inflamada de campanha.', 'No meu governo, o pobre é o patrão. Quem manda é o pobre, a elite que se dane.', 'Evento em Petrolina. Recebida com aplausos mas criticada por setores empresariais.', 'verified', true, '2023-05-18', 'https://www1.folha.uol.com.br/poder/2023/05/lula-pobre-patrao-elite-se-dane.shtml', 'news_article', 2, 'Petrolina', 'Inauguração transposição', 'lula-pobre-patrao-b88-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a fome voltou porque o Bolsonaro odiava o pobre.', 'A fome voltou porque o Bolsonaro odiava o pobre. Ele tinha prazer em ver criança passando fome.', 'Lançamento de programa social em Recife. Oposição rebateu citando dados de pobreza.', 'verified', false, '2023-04-30', 'https://www.cnnbrasil.com.br/politica/lula-bolsonaro-odiava-pobre-fome/', 'news_article', 2, 'Recife', 'Programa social', 'lula-bolsonaro-odiava-pobre-b88-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sugere que Hamas não é terrorista, é movimento de resistência palestina.', 'Eu não concordo em chamar o Hamas de terrorista. É um movimento que resiste à ocupação, não é a mesma coisa.', 'Entrevista à rede árabe. Gerou reações de Israel e EUA.', 'verified', true, '2024-02-15', 'https://www.estadao.com.br/internacional/lula-hamas-nao-terrorista/', 'news_article', 4, 'Brasília', 'Entrevista Al Jazeera', 'lula-hamas-nao-terrorista-b88-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o PT é o partido da honestidade, em meio a escândalos do INSS.', 'O PT é o partido mais honesto do Brasil. Quem diz que tem corrupção no PT é mentiroso.', 'Comício em São Paulo durante escândalo dos descontos indevidos no INSS. Contradição criticada.', 'verified', false, '2025-05-10', 'https://www.poder360.com.br/governo/lula-pt-honestidade-inss/', 'news_article', 3, 'São Paulo', 'Comício', 'lula-pt-honesto-inss-b88-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em tom jocoso que vai caçar oposição como se fosse inimigo de guerra.', 'Eu vou caçar esse pessoal da oposição, vou caçar um a um. Eles vão ver com quem estão mexendo.', 'Ato do PT em Fortaleza. Parlamentares oposicionistas acionaram PGR por incitação.', 'verified', false, '2024-06-14', 'https://www.metropoles.com/brasil/politica-brasil/lula-cacar-oposicao', 'news_article', 3, 'Fortaleza', 'Ato PT', 'lula-cacar-oposicao-b88-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o presidente tem que reinar acima do povo, em lapso monárquico.', 'O presidente tem que reinar... quer dizer, governar junto com o povo. Presidente é empregado do povo.', 'Evento em Brasília. Lapso viralizou em redes sociais.', 'verified', false, '2023-12-05', 'https://g1.globo.com/politica/noticia/2023/12/05/lula-presidente-reinar-lapso.ghtml', 'news_article', 1, 'Brasília', 'Evento Palácio', 'lula-reinar-lapso-b88-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Elon Musk e o chama de fascista.', 'Esse cidadão Musk é um fascista de extrema-direita. Ele quer destruir a democracia com suas redes.', 'Entrevista em meio a bate-boca Musk-Moraes sobre X. Fala escalou crise com empresário.', 'verified', true, '2024-04-08', 'https://www1.folha.uol.com.br/mercado/2024/04/lula-musk-fascista-extrema-direita.shtml', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'lula-musk-fascista-b88-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que vai bater na mesa com Trump como fez Milei, em bravata.', 'Se o Trump quiser briga comigo, vou bater na mesa, vou falar bem alto. Trump não me assusta.', 'Entrevista em Itaipu. Fala foi vista como bravata antes de encontro diplomático.', 'verified', false, '2025-01-18', 'https://www.cnnbrasil.com.br/politica/lula-bater-mesa-trump/', 'news_article', 2, 'Foz do Iguaçu', 'Inauguração Itaipu', 'lula-bater-mesa-trump-b88-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o Trump é o pior presidente americano da história.', 'O Trump é o pior presidente que os Estados Unidos já tiveram. É um perigo pra humanidade.', 'Discurso em posse de embaixadores. Aprofundou tensão bilateral antes de tarifaço.', 'verified', true, '2025-02-25', 'https://www.estadao.com.br/internacional/lula-trump-pior-presidente/', 'news_article', 3, 'Brasília', 'Posse embaixadores', 'lula-trump-pior-b88-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que gay casamento é escolha, em fala polêmica para religiosos.', 'Cada um faz o que quer da vida, homem com homem, mulher com mulher, não é assunto do Estado.', 'Entrevista a podcast de esquerda. Bancada evangélica criticou redução do tema a escolha.', 'verified', false, '2024-05-30', 'https://www.poder360.com.br/governo/lula-casamento-gay-escolha/', 'news_article', 1, 'São Paulo', 'Podcast', 'lula-casamento-gay-b88-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama evangélicos radicais de falsos cristãos.', 'Tem muito pastor que é falso cristão, que usa o nome de Jesus pra ganhar dinheiro. Jesus não era isso.', 'Evento em igreja católica em BH. Lideranças evangélicas reagiram com indignação.', 'verified', false, '2024-04-02', 'https://www.metropoles.com/brasil/politica-brasil/lula-pastores-falsos-cristaos', 'news_article', 3, 'Belo Horizonte', 'Missa da CNBB', 'lula-pastores-falsos-b88-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que tem fome no Brasil por causa da imprensa que mente.', 'A fome ainda existe porque a imprensa não conta a verdade. A imprensa mente dizendo que a fome piorou.', 'Entrevista em Teresina. Afirmação contradita por dados do IBGE.', 'verified', false, '2024-03-20', 'https://g1.globo.com/politica/noticia/2024/03/20/lula-fome-imprensa-mente.ghtml', 'news_article', 2, 'Teresina', 'Visita regional', 'lula-fome-imprensa-b88-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que FMI é pra ferrar com o povo pobre.', 'O FMI sempre foi pra ferrar com o povo pobre. Esse FMI só serve pro rico, nunca serviu pro Brasil.', 'Ato do PT em São Paulo. Tradicionalmente repetida, mas gerou ruído com assessoria econômica de Haddad.', 'verified', false, '2023-05-01', 'https://www1.folha.uol.com.br/mercado/2023/05/lula-fmi-ferrar-pobre.shtml', 'news_article', 2, 'São Paulo', 'Ato 1 Maio', 'lula-fmi-ferrar-b88-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que tem muita fofoca no Planalto, minimizando denúncias.', 'Tem muita fofoca nesse Planalto. Todo dia inventam uma coisa diferente. Não dá pra levar a sério.', 'Entrevista à Rádio Mundial. Oposição acusou desdém a denúncias.', 'verified', false, '2024-09-10', 'https://www.cnnbrasil.com.br/politica/lula-planalto-fofoca-denuncias/', 'news_article', 2, 'Brasília', 'Entrevista rádio', 'lula-fofoca-planalto-b88-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ironiza que não é dono da verdade, mas é como se fosse.', 'Eu não sou dono da verdade, mas o que eu falo geralmente é verdade. Acerto quase sempre.', 'Entrevista a jovens ativistas. Fala repercutiu como arrogância discursiva.', 'verified', false, '2023-10-30', 'https://www.estadao.com.br/politica/lula-dono-da-verdade-arrogancia/', 'news_article', 1, 'São Paulo', 'Encontro jovens', 'lula-dono-verdade-b88-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que empresários são piratas que exploram trabalhadores.', 'Tem empresário que é pirata, explora o trabalhador, sonega imposto, destroi o meio ambiente. É essa elite suja.', 'Ato sindical em SBC. CNI e FIESP emitiram notas de repúdio.', 'verified', false, '2023-04-12', 'https://www.poder360.com.br/economia/lula-empresarios-piratas/', 'news_article', 2, 'São Bernardo do Campo', 'Ato sindical', 'lula-empresarios-piratas-b88-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula fala que em 2026 vai enterrar o bolsonarismo politicamente.', 'Em 2026 a gente vai enterrar o bolsonarismo. Vai ser enterrado, acabado, nem vai ter velório.', 'Comício na Bahia. Linguagem mortuária foi criticada como agressiva demais para o momento polarizado.', 'verified', true, '2025-09-21', 'https://www1.folha.uol.com.br/poder/2025/09/lula-enterrar-bolsonarismo-2026.shtml', 'news_article', 2, 'Feira de Santana', 'Comício', 'lula-enterrar-bolsonarismo-b88-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula admite que não lê pesquisas e se guia pelo sentimento popular.', 'Eu não leio pesquisa, não. Pesquisa não diz nada, eu sinto o povo na rua, é isso que importa.', 'Entrevista à GloboNews. Levantou preocupação sobre desinformação do planejamento oficial.', 'verified', false, '2024-08-25', 'https://g1.globo.com/politica/noticia/2024/08/25/lula-nao-le-pesquisas-sentimento.ghtml', 'news_article', 1, 'Brasília', 'Entrevista GloboNews', 'lula-nao-le-pesquisa-b88-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o Ibama atrasa obra com burocracia, critica próprio governo.', 'Esse Ibama vive atrasando obra com burocracia. Tem técnico que é bolsonarista escondido no governo.', 'Visita às obras da transposição. Criou conflito com Marina Silva no Ministério do Meio Ambiente.', 'verified', true, '2023-11-15', 'https://www.estadao.com.br/politica/lula-ibama-burocracia-obra/', 'news_article', 3, 'Sobradinho', 'Visita transposição', 'lula-ibama-burocracia-b88-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quer reabrir refinarias privatizadas, contrariando planejamento.', 'Vamos reabrir essas refinarias que privatizaram. Ou compra de volta, ou a gente faz do jeito que tem que fazer.', 'Ato em Mataripe. Fala jogou dólar e balançou Petrobras.', 'verified', false, '2024-07-02', 'https://www.cnnbrasil.com.br/economia/lula-refinarias-privatizadas-reabrir/', 'news_article', 2, 'São Francisco do Conde', 'Ato Petrobras', 'lula-refinarias-privatizadas-b88-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Venezuela precisa urgentemente de ajuda, mudando de posição.', 'A Venezuela precisa de ajuda urgente. O povo venezuelano não pode mais esperar. Tem gente passando fome.', 'Coletiva em Brasília após ruptura com Maduro. Guinada contrasta com falas de 2023.', 'verified', true, '2024-08-20', 'https://www1.folha.uol.com.br/mundo/2024/08/lula-venezuela-ajuda-urgente.shtml', 'news_article', 2, 'Brasília', 'Coletiva', 'lula-venezuela-ajuda-b88-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que não vota em mulher se não for do PT.', 'Eu só voto em mulher se for do PT. Não adianta vir com mulher de direita, não é a mesma coisa.', 'Entrevista em campanha municipal. Declaração criticada por reduzir mulher a tendência partidária.', 'verified', false, '2024-09-05', 'https://www.metropoles.com/brasil/politica-brasil/lula-so-vota-mulher-pt', 'news_article', 2, 'São Paulo', 'Campanha municipal', 'lula-so-vota-mulher-pt-b88-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula pergunta se quilombola é tudo forte, em estereótipo racial.', 'Quilombola tem força, né? É tudo forte, musculoso, trabalhador. Vocês são uma raça diferenciada.', 'Visita a quilombo em Alagoas. Movimento negro criticou romantização e racialização.', 'verified', false, '2024-05-14', 'https://www.poder360.com.br/governo/lula-quilombola-forte-raca/', 'news_article', 2, 'União dos Palmares', 'Visita quilombo', 'lula-quilombola-forte-b88-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai meter a mão na Polícia Federal que não investiga direito.', 'Se a PF não investigar direito, eu vou meter a mão lá. Sou presidente, sou chefe da PF.', 'Conversa com jornalistas em Brasília. Delegados reagiram com nota corporativa.', 'verified', true, '2024-10-18', 'https://g1.globo.com/politica/noticia/2024/10/18/lula-meter-mao-policia-federal.ghtml', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-meter-mao-pf-b88-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula culpa o vento pela queda de helicóptero em agenda, em fala inusitada.', 'Foi o vento que atrapalhou. Se não fosse o vento, a gente teria chegado, visto os problemas. Mas o vento não deixou.', 'Agenda cancelada no Rio Grande do Sul durante enchentes. Fala virou piada em redes sociais.', 'verified', false, '2024-05-13', 'https://www.estadao.com.br/politica/lula-vento-helicoptero-agenda-rs/', 'news_article', 1, 'Porto Alegre', 'Agenda RS', 'lula-vento-helicoptero-b88-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que a enchente do RS é aviso da natureza contra o agronegócio.', 'Essa enchente do Rio Grande é aviso da natureza contra o agro que desmata tudo. A natureza está cobrando.', 'Entrevista em Canoas durante calamidade. Bancada gaúcha criticou como politização da tragédia.', 'verified', false, '2024-05-10', 'https://www.cnnbrasil.com.br/nacional/lula-enchente-rs-aviso-natureza/', 'news_article', 3, 'Canoas', 'Visita enchente RS', 'lula-enchente-aviso-b88-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em off-script que Haddad quer tudo, em fala que desautoriza ministro.', 'O Haddad quer tudo, ele quer tributar até o papai do céu. Vou ter que segurar o Haddad.', 'Conversa com líderes sindicais gravada e vazada. Repercutiu como enfraquecimento do ministro.', 'verified', true, '2024-10-08', 'https://www1.folha.uol.com.br/mercado/2024/10/lula-haddad-quer-tudo-vazada.shtml', 'news_article', 3, 'Brasília', 'Conversa vazada', 'lula-haddad-quer-tudo-b88-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o Exército errou por não impedir o 8 de janeiro.', 'O Exército foi conivente no 8 de janeiro. Se não foi conivente, foi omisso. Isso tem que ser apurado.', 'Coletiva em Brasília. Altas patentes militares reagiram em nota reservada.', 'verified', true, '2023-01-15', 'https://www.poder360.com.br/governo/lula-exercito-conivente-8-janeiro/', 'news_article', 3, 'Brasília', 'Coletiva pós 8 janeiro', 'lula-exercito-conivente-b88-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama STF de instituição machista por poucos ministros negros.', 'O STF é machista e racista, tem pouco preto, pouca mulher. Tem que mudar isso urgentemente.', 'Evento em universidade em Salvador. Fala repercutiu em debate sobre composição do Supremo.', 'verified', false, '2024-11-20', 'https://www.metropoles.com/brasil/politica-brasil/lula-stf-machista-racista', 'news_article', 2, 'Salvador', 'UFBA', 'lula-stf-machista-b88-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que o trabalhador tem direito de tomar cerveja no fim de semana.', 'O trabalhador tem direito a tomar cerveja gelada no fim de semana. Trabalhar e beber cerveja é dignidade.', 'Discurso no 1 de maio. Bordão virou slogan petista, criticado por setores de saúde.', 'verified', false, '2024-05-01', 'https://g1.globo.com/politica/noticia/2024/05/01/lula-trabalhador-cerveja-gelada.ghtml', 'news_article', 1, 'São Paulo', 'Ato 1 Maio', 'lula-cerveja-gelada-b88-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula compara gastos com Forças Armadas a gastos com saúde, em provocação.', 'Esse exército gasta mais que o SUS. Pra quê tanta arma se ninguém vai invadir o Brasil?', 'Entrevista à BandNews. Provocou declaração dura do comando militar.', 'verified', false, '2024-03-15', 'https://www.estadao.com.br/politica/lula-exercito-gasta-mais-sus/', 'news_article', 2, 'Brasília', 'BandNews', 'lula-exercito-gasta-sus-b88-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que adolescente em escola cívico-militar está sendo doutrinado como no nazismo.', 'Botar criança de farda na escola é doutrinação parecida com nazismo. A gente não pode aceitar.', 'Evento em Cuiabá sobre educação. Gerou protesto de governadores de direita.', 'verified', false, '2023-10-24', 'https://www1.folha.uol.com.br/educacao/2023/10/lula-escola-militar-doutrinacao-nazismo.shtml', 'news_article', 3, 'Cuiabá', 'Evento educacional', 'lula-escola-militar-nazismo-b88-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que tem orgulho de nunca ter lido livro inteiro na vida.', 'Não li um livro inteiro, mas li gente. Livro não ensina tanto quanto o povo ensina.', 'Entrevista à Carta Capital. Intelectuais criticaram valorização da ignorância formal.', 'verified', false, '2023-09-18', 'https://www.cartacapital.com.br/politica/lula-livro-inteiro-ler-gente/', 'news_article', 1, 'São Paulo', 'Carta Capital', 'lula-livro-inteiro-b88-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ameaça rever todas as privatizações de Temer e Bolsonaro.', 'Vou rever cada privatização que o Temer e o Bolsonaro fizeram. Se tiver irregularidade, volta pro Estado.', 'Entrevista a Paulo Henrique Amorim. Mercado reagiu com desvalorização cambial.', 'verified', false, '2023-03-08', 'https://www.poder360.com.br/economia/lula-rever-privatizacoes/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-rever-privatizacoes-b88-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai mostrar a cara do Moro como traidor.', 'O Moro é um traidor. Ele traiu o Brasil, traiu a Justiça, traiu a família dele. Todo mundo vai ver.', 'Entrevista à GloboNews. Senador Moro processou o presidente por danos morais.', 'verified', true, '2024-02-07', 'https://g1.globo.com/politica/noticia/2024/02/07/lula-moro-traidor-processo.ghtml', 'news_article', 2, 'Brasília', 'GloboNews', 'lula-moro-traidor-b88-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Gleisi é a melhor presidente que o PT já teve, em fala problemática.', 'A Gleisi é a melhor que o PT já teve. Antes dela, ninguém fez o PT crescer como ela está fazendo.', 'Evento do PT em BH. Ex-presidentes do partido criticaram desconsideração.', 'verified', false, '2023-07-15', 'https://www.estadao.com.br/politica/lula-gleisi-melhor-pt/', 'news_article', 1, 'Belo Horizonte', 'Congresso PT', 'lula-gleisi-melhor-pt-b88-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula ataca senador do MBL e chama a direita jovem de criancinha mimada.', 'Essa direita jovem é tudo criancinha mimada, filho de rico que nunca trabalhou. Não sabem o que é sofrer.', 'Entrevista à BandNews. Marcel Van Hattem reagiu citando trabalho desde jovem.', 'verified', false, '2024-04-22', 'https://www.metropoles.com/brasil/politica-brasil/lula-direita-criancinha-mimada', 'news_article', 2, 'Brasília', 'BandNews', 'lula-direita-mimada-b88-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quer taxar bilionário até doer e incluir patrimônio global.', 'Vou taxar bilionário até doer no bolso. Não é só o dinheiro no Brasil, tem que pegar onde eles escondem.', 'Declaração em Roma, cúpula do G7. Fala mexeu com mercado financeiro.', 'verified', true, '2024-06-13', 'https://www1.folha.uol.com.br/mercado/2024/06/lula-taxar-bilionario-g7-roma.shtml', 'news_article', 2, 'Roma', 'Cúpula G7', 'lula-taxar-bilionario-b88-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama Tarcísio de governador fajuto de São Paulo.', 'Esse Tarcísio é governador fajuto, não sabe governar. É um engenheiro do Bolsonaro, só isso.', 'Comício em São Paulo. Tarcísio respondeu com ataque duro na sequência.', 'verified', false, '2024-11-10', 'https://www.cnnbrasil.com.br/politica/lula-tarcisio-governador-fajuto/', 'news_article', 2, 'São Paulo', 'Comício', 'lula-tarcisio-fajuto-b88-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Zema é um coronel moderno que só pensa em si.', 'O Zema é um coronelzinho moderno. Só pensa em si, na família dele, nos negócios dele. Nunca pensou em Minas.', 'Evento em Brasília. Governador mineiro respondeu processualmente.', 'verified', false, '2024-06-05', 'https://www.poder360.com.br/governo/lula-zema-coronelzinho-moderno/', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-zema-coronelzinho-b88-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quem financia sabotagem do governo são banqueiros.', 'Essa sabotagem do governo é feita pelos banqueiros. Eles pagam gente na imprensa pra inventar crise.', 'Entrevista a rádio. Federação Brasileira de Bancos soltou nota de repúdio.', 'verified', true, '2024-07-28', 'https://www.estadao.com.br/economia/lula-banqueiros-sabotagem-imprensa/', 'news_article', 3, 'Brasília', 'Entrevista rádio', 'lula-banqueiros-sabotagem-b88-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em evento que Alckmin continua igualzinho tucano, minimizando o vice.', 'O Alckmin é tucano, sempre foi. Ele é companheiro, mas continua igualzinho tucano chato.', 'Evento em Osasco. Fala criou mal-estar na base aliada do governo.', 'verified', false, '2023-06-28', 'https://g1.globo.com/politica/noticia/2023/06/28/lula-alckmin-tucano-chato.ghtml', 'news_article', 1, 'Osasco', 'Inauguração', 'lula-alckmin-tucano-b88-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que jornalista de direita é lacaio do mercado financeiro.', 'Esses jornalistas de direita são lacaios do mercado. Escrevem o que o banco manda escrever.', 'Entrevista em SP. Associação Nacional de Jornais criticou intimidação profissional.', 'verified', false, '2024-08-14', 'https://www1.folha.uol.com.br/poder/2024/08/lula-jornalistas-lacaios-mercado.shtml', 'news_article', 3, 'São Paulo', 'Entrevista', 'lula-jornalistas-lacaios-b88-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que é mais velho que a PEC, em fala gerontofóbica.', 'Eu sou mais velho que essa PEC aí, então posso opinar. Jovem não sabe de nada, precisa escutar.', 'Coletiva com Gilmar Mendes. Fala irônica criticada por relativizar participação jovem.', 'verified', false, '2023-07-05', 'https://www.cnnbrasil.com.br/politica/lula-velho-pec-jovem-escutar/', 'news_article', 1, 'Brasília', 'Coletiva', 'lula-velho-pec-b88-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula afirma que dólar alto é culpa de especulador e não do fiscal.', 'Esse dólar alto é especulação, não tem nada a ver com fiscal. É gente ganhando dinheiro com o caos.', 'Entrevista em Brasília durante alta cambial de final de 2024. Fala contrariada por consenso econômico.', 'verified', true, '2024-12-19', 'https://www.poder360.com.br/economia/lula-dolar-especulador-fiscal/', 'news_article', 3, 'Brasília', 'Coletiva', 'lula-dolar-especulador-b88-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica STF por derrubar decretos de armas de Bolsonaro com lentidão.', 'O STF demorou pra cancelar os decretos de armas. Tinha que ter cancelado no primeiro dia, não meses depois.', 'Entrevista em Brasília. Supremo não respondeu oficialmente ao atrito.', 'verified', false, '2023-04-25', 'https://www.metropoles.com/brasil/politica-brasil/lula-stf-decretos-armas-demora', 'news_article', 2, 'Brasília', 'Entrevista', 'lula-stf-armas-demora-b88-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que quer receber ditador da China como amigo próximo.', 'Xi Jinping é um amigão meu. Ditador? Não é ditador, é líder. Cada país tem seu modo.', 'Entrevista a chinês antes de visita a Pequim. Oposição acusou flerte autoritário.', 'verified', true, '2023-04-11', 'https://www1.folha.uol.com.br/mundo/2023/04/lula-xi-jinping-amigao-nao-ditador.shtml', 'news_article', 3, 'Pequim', 'Visita à China', 'lula-xi-jinping-amigao-b88-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que indígena tem que deixar de ser preguiçoso, em fala grave.', 'O índio precisa produzir também. Tem índio que é preguiçoso, vive do governo. Isso tem que acabar.', 'Visita em Altamira. APIB emitiu nota de repúdio forte, cobrando retratação.', 'verified', true, '2023-11-30', 'https://g1.globo.com/politica/noticia/2023/11/30/lula-indigena-preguicoso-apib.ghtml', 'news_article', 4, 'Altamira', 'Visita Amazônia', 'lula-indigena-preguicoso-b88-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que sem educação sexual, a menina engravida por ignorância.', 'A menina pobre engravida porque não tem educação sexual. Na classe média, a menina tem informação, não engravida.', 'Evento de saúde em SP. Críticas por estratificar o problema e culpar a menina.', 'verified', false, '2024-08-05', 'https://www.estadao.com.br/saude/lula-menina-pobre-engravida-ignorancia/', 'news_article', 2, 'São Paulo', 'Evento saúde', 'lula-menina-pobre-engravida-b88-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que nunca foi corrupto e quem diz isso é filho da puta.', 'Eu nunca fui corrupto. Quem disser isso é filho da puta, é mentiroso. Eu fui perseguido, não condenado.', 'Entrevista a Carta Capital. O palavrão e a ênfase repercutiram por dias.', 'verified', true, '2023-03-12', 'https://www.cartacapital.com.br/politica/lula-nunca-corrupto-filho-da-puta/', 'news_article', 2, 'São Paulo', 'Carta Capital', 'lula-nunca-corrupto-fdp-b88-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que Janja é a melhor primeira-dama da história, em fala contestada.', 'A Janja é a melhor primeira-dama que o Brasil já teve. Nenhuma outra se compara a ela.', 'Evento em Palácio. Comentários comparando com Marisa Letícia geraram controvérsia, inclusive no PT.', 'verified', false, '2024-12-22', 'https://www.poder360.com.br/governo/lula-janja-melhor-primeira-dama/', 'news_article', 2, 'Brasília', 'Evento Palácio', 'lula-janja-melhor-primeira-dama-b88-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
