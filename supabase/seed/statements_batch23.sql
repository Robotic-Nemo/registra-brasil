DO $$
DECLARE
  v_bolsonaro  UUID;
  v_jefferson  UUID;
  v_dsilveira  UUID;
  v_marcal     UUID;
  v_zambelli   UUID;
  v_eduardo    UUID;
  v_carlos     UUID;
  v_gleisi     UUID;
  v_janones    UUID;
  v_feliciano  UUID;
  v_magno      UUID;
  v_tarcisio   UUID;
  v_mourao     UUID;
  v_ciro       UUID;
  v_nikolas    UUID;

  c_violencia    UUID;
  c_antidem      UUID;
  c_odio         UUID;
  c_desinform    UUID;
  c_abuso        UUID;
  c_intolerancia UUID;
  c_homofobia    UUID;
BEGIN
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_jefferson  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_dsilveira  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_marcal     FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_eduardo    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_carlos     FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';

  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_antidem      FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abuso        FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_homofobia    FROM categories WHERE slug = 'homofobia';

  -- 1. Bolsonaro — "vou fuzilar a petralhada" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em comício em 2018, Bolsonaro declarou que iria "fuzilar a petralhada", incitando violência contra eleitores e apoiadores do PT.',
      'Se eu chegar lá, vou fuzilar a petralhada. Não vou prender. Vou fuzilar. Tem que ter coragem para fazer isso.',
      'Declaração feita durante comício em Juiz de Fora (MG) em outubro de 2018, semanas antes do primeiro turno das eleições presidenciais. A fala gerou condenação de partidos de oposição e entidades de direitos humanos, sendo interpretada como incitação explícita à violência política. Bolsonaro não recuou da declaração quando questionado pela imprensa.',
      'verified', true, '2018-10-18',
      'https://www1.folha.uol.com.br/poder/2018/10/bolsonaro-diz-que-vai-fuzilar-a-petralhada.shtml',
      'news_article',
      'Juiz de Fora (MG)', 'Comício de campanha presidencial',
      'bolsonaro-fuzilar-petralhada-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 2. Bolsonaro — "só me tiram morto ou preso" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro declarou que só sairia da presidência morto ou preso, sinalizando recusa em aceitar eventual derrota eleitoral.',
      'Só vão me tirar daqui morto ou preso. Podem ter certeza disso. Esse governo não vai cair.',
      'Frase dita em discurso a apoiadores na frente do Palácio da Alvorada em agosto de 2022, meses antes das eleições presidenciais. A declaração foi amplamente interpretada como sinalização de que Bolsonaro não aceitaria um resultado eleitoral adverso, alimentando o temor de uma ruptura institucional. Analistas políticos e membros do TSE expressaram preocupação com o teor da fala.',
      'verified', true, '2022-08-09',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/08/09/bolsonaro-so-vao-me-tirar-daqui-morto-ou-preso.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Pronunciamento a apoiadores',
      'bolsonaro-so-me-tiram-morto-ou-preso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 3. Bolsonaro — "PM que não mata não é PM" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro declarou que policial militar que não mata não é PM, defendendo o uso letal de força policial como critério de competência profissional.',
      'PM que não mata não é PM. Tem que ter coragem. É uma questão de caráter, de missão. Tem que ir com o propósito de matar.',
      'Declaração feita durante cerimônia de formatura de policiais militares em agosto de 2019. A frase foi condenada por entidades de direitos humanos e pela ONU como incentivo à violência extrajudicial e execuções sumárias. O Brasil já registrava à época uma das maiores taxas de mortes por intervenção policial do mundo.',
      'verified', true, '2019-08-22',
      'https://www.bbc.com/portuguese/brasil-49440340',
      'news_article',
      'Palácio do Planalto', 'Cerimônia de formatura de PMs',
      'bolsonaro-pm-que-nao-mata-nao-e-pm-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 4. Bolsonaro — "bandido que roubar vai se arrepender ou vai morrer" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro prometeu que bandidos que roubarem vão se arrepender ou morrer, endossando execuções extrajudiciais como política de segurança pública.',
      'Bandido que roubar, sequestrar, estuprar vai ter uma só escolha: se arrepender ou morrer. Essa é a nossa política de segurança pública.',
      'Declaração durante evento em São Paulo em abril de 2019, ao apresentar o pacote anticrime do então ministro Sergio Moro. A fala foi criticada por juristas e entidades de direitos humanos como apologia ao extermínio e violação do devido processo legal. O Brasil registrava naquele ano mais de 6.000 mortes por intervenção policial.',
      'verified', false, '2019-04-02',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2019/04/02/bolsonaro-bandido-roubar-se-arrepender-ou-morrer.htm',
      'news_article',
      'São Paulo (SP)', 'Apresentação do pacote anticrime',
      'bolsonaro-bandido-se-arrepender-ou-morrer-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 5. Bolsonaro — "se eu ganhar não vai ter MST nem MTST" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro prometeu extinguir movimentos sociais como MST e MTST caso eleito presidente, ameaçando organizações legais de trabalhadores rurais e urbanos.',
      'Se eu ganhar a eleição, pode ter certeza: não vai ter MST nem MTST no Brasil. Ou eles se enquadram na lei ou vão para a cadeia.',
      'Declaração em entrevista durante a campanha presidencial de outubro de 2018. O MST e o MTST são movimentos sociais reconhecidos legalmente no Brasil. A ameaça foi considerada por juristas e organizações de direitos humanos como tentativa de criminalização de movimentos sociais e restrição de direitos constitucionais de associação e manifestação.',
      'verified', false, '2018-10-05',
      'https://www.cartacapital.com.br/politica/bolsonaro-nao-vai-ter-mst-nem-mtst-no-brasil/',
      'news_article',
      'Entrevista televisiva', 'Campanha presidencial 2018',
      'bolsonaro-nao-vai-ter-mst-mtst-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 6. Bolsonaro — ameaça a jornalistas (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro ameaçou jornalistas afirmando que "a imprensa que me atacar vai pagar um preço muito caro", intimidando a liberdade de imprensa.',
      'A imprensa que me atacar, que mentir sobre mim, vai pagar um preço muito caro. Podem estar certos disso. Nós temos os meios para isso.',
      'Declaração feita durante entrevista a veículos bolsonaristas em março de 2021, no contexto de crescentes tensões entre o governo federal e a grande imprensa. A RSF (Repórteres Sem Fronteiras) e a CPJ (Comitê de Proteção a Jornalistas) classificaram a fala como ameaça direta à liberdade de imprensa no Brasil.',
      'verified', false, '2021-03-15',
      'https://www.uol.com.br/tilt/noticias/redacao/2021/03/15/bolsonaro-imprensa-pagar-preco-muito-caro.htm',
      'news_article',
      'Brasília (DF)', 'Entrevista a apoiadores',
      'bolsonaro-imprensa-pagar-preco-caro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 7. Bolsonaro — "futuros ministros são do Exército" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro disse que os futuros ministros do Brasil seriam do Exército, sugerindo substituição de governo civil por um de natureza militar.',
      'Os futuros ministros do Brasil são do Exército, são do povo fardado. Podem ter certeza disso. As Forças Armadas nunca vão abandonar o povo brasileiro.',
      'Declaração feita durante manifestação em 7 de setembro de 2022 em Brasília, diante de uma multidão de apoiadores, num contexto de crescente retórica golpista e questionamento do sistema eleitoral. A fala foi vista por analistas políticos e pelo STF como sinalização direta de ruptura institucional e uso das Forças Armadas para manutenção no poder.',
      'verified', true, '2022-09-07',
      'https://g1.globo.com/politica/noticia/2022/09/07/bolsonaro-futuros-ministros-sao-do-exercito.ghtml',
      'news_article',
      'Esplanada dos Ministérios', 'Manifestação de 7 de setembro de 2022',
      'bolsonaro-futuros-ministros-exercito-7setembro-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 8. Roberto Jefferson — "banho de sangue" se STF tentar prendê-lo (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson ameaçou que qualquer tentativa do STF de prendê-lo resultaria em "banho de sangue", incitando resistência armada a decisão judicial.',
      'Se o Supremo Tribunal Federal mandar me prender, vai ser um banho de sangue. Não vou ser preso de jeito nenhum. Vou reagir com armas.',
      'Declaração dada em entrevista ao canal do YouTube de apoiadores em agosto de 2022, quando Jefferson estava sob monitoramento eletrônico por decisão do STF. Dois meses depois, em outubro de 2022, Jefferson cumpriu a ameaça ao atirar com fuzil e lançar granadas contra agentes da Polícia Federal que foram à sua casa para cumprir mandado de prisão.',
      'verified', true, '2022-08-20',
      'https://www.cnnbrasil.com.br/politica/roberto-jefferson-banho-de-sangue-stf-prender/',
      'news_article',
      'Entrevista online', 'Canal de apoiadores no YouTube',
      'jefferson-banho-de-sangue-stf-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 9. Roberto Jefferson — atira com fuzil em agentes da PF (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson disparou com fuzil e lançou granadas contra policiais federais que foram cumprir mandado de prisão, depois de anunciar que resistiria com violência.',
      'Eu não vou ser preso. Se vierem me prender, respondo com bala. Passei a minha vida trabalhando por esse país e não vou ser humilhado por esses bandidos de toga.',
      'Em 23 de outubro de 2022, policiais federais foram à residência de Roberto Jefferson em Comendador Levy Gasparian (RJ) para cumprir mandado de prisão preventiva decretado pelo ministro Alexandre de Moraes. Jefferson abriu fogo com fuzil e lançou granadas, ferindo dois agentes. Foi preso em flagrante. O episódio foi o único ataque armado a agentes da PF por um político em exercício na história recente do Brasil.',
      'verified', true, '2022-10-23',
      'https://www1.folha.uol.com.br/poder/2022/10/jefferson-atira-em-policiais-federais-e-e-preso-em-flagrante.shtml',
      'news_article',
      'Comendador Levy Gasparian (RJ)', 'Cumprimento de mandado de prisão',
      'jefferson-atira-fuzil-agentes-pf-preso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 10. Daniel Silveira — AI-5 seria "necessário" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsilveira,
      'O deputado Daniel Silveira declarou que o AI-5, ato institucional mais violento da ditadura militar, seria necessário para enfrentar o STF.',
      'O AI-5 foi necessário em 1968 e pode ser necessário novamente. Esses ministros do Supremo estão destruindo o Brasil e alguém tem que parar isso.',
      'Declaração feita em vídeo postado nas redes sociais em fevereiro de 2021, que resultou em sua prisão em flagrante por ordem do ministro Alexandre de Moraes. O AI-5, decretado em dezembro de 1968, foi o instrumento que fechou o Congresso, suspendeu habeas corpus e instaurou a fase mais violenta da ditadura militar. Silveira também pediu nesse mesmo vídeo o fechamento do STF.',
      'verified', true, '2021-02-16',
      'https://www.bbc.com/portuguese/brasil-56083823',
      'news_article',
      'Redes sociais', 'Vídeo publicado no YouTube',
      'dsilveira-ai5-necessario-stf-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 11. Daniel Silveira — ameaça ministros do STF por nome (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsilveira,
      'Daniel Silveira gravou vídeo ameaçando ministros do STF pelo nome, dizendo que eles "vão pagar" pelo julgamento contra ele.',
      'Edson Fachin, Alexandre de Moraes, Cármen Lúcia — vocês vão pagar por isso. Não agora, mas vocês vão pagar. O povo brasileiro não vai esquecer o que vocês fizeram.',
      'Declaração em vídeo publicado nas redes sociais em abril de 2022, após ser condenado pelo STF a oito anos e nove meses de prisão por ameaças a ministros e atos antidemocráticos. O vídeo foi considerado pelo próprio STF como elemento agravante e levado em consideração durante o julgamento. Bolsonaro concedeu indulto a Silveira horas após a condenação.',
      'verified', true, '2022-04-20',
      'https://g1.globo.com/politica/noticia/2022/04/20/daniel-silveira-ameaca-ministros-stf-video.ghtml',
      'news_article',
      'Redes sociais', 'Vídeo publicado após condenação no STF',
      'dsilveira-ameaca-ministros-stf-video-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 12. Pablo Marçal — "vou matar a carreira de todo jornalista que me atacar" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal ameaçou destruir a carreira de qualquer jornalista que o atacasse, intimidando a cobertura crítica de sua candidatura à prefeitura de São Paulo.',
      'Vou matar a carreira de todo jornalista que me atacar. Tenho como fazer isso. Tenho seguidores, tenho dinheiro, tenho advogados. Podem vir.',
      'Declaração feita durante live em suas redes sociais em setembro de 2024, no auge da campanha municipal de São Paulo. Marçal era candidato a prefeito pela coligação do Novo e utilizava a expressão em tom explicitamente ameaçador. A RSF (Repórteres Sem Fronteiras) emitiu nota de repúdio e a Federação Nacional dos Jornalistas (Fenaj) acionou o TSE.',
      'verified', true, '2024-09-12',
      'https://www.folha.uol.com.br/poder/2024/09/marcal-ameaca-matar-carreira-jornalistas.shtml',
      'news_article',
      'Live nas redes sociais', 'Campanha municipal São Paulo 2024',
      'marcal-matar-carreira-jornalistas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 13. Pablo Marçal — "meus seguidores são meu exército" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal declarou que seus seguidores nas redes sociais formam seu "exército" pronto para combater seus adversários, militarizando o discurso político digital.',
      'Meus seguidores são meu exército. Cada um de vocês é um soldado. Quando eu precisar, vocês avançam. Juntos somos invencíveis e vamos destruir a esquerda.',
      'Declaração feita durante evento para apoiadores em São Paulo em novembro de 2023, ao comentar sua estratégia de mobilização digital. A fala reflete o padrão de Marçal de usar linguagem militarizada e de confronto para engajar seguidores, estratégia que incluía campanhas coordenadas de assédio a críticos nas redes sociais.',
      'verified', false, '2023-11-18',
      'https://www.metropoles.com/colunas-blogs/guilherme-amado/marcal-seguidores-exercito-destruir-esquerda/',
      'news_article',
      'São Paulo (SP)', 'Evento para apoiadores',
      'marcal-seguidores-sao-meu-exercito-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,     true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 14. Carla Zambelli — "atirar em saqueadores" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli defendeu que saqueadores deveriam ser baleados por cidadãos armados, endossando execuções sumárias como resposta a crimes patrimoniais.',
      'Saqueador não merece pena. Saqueador merece bala. Cidadão de bem armado tem obrigação de defender o patrimônio alheio. É legítima defesa da sociedade.',
      'Declaração feita nas redes sociais em novembro de 2022, no contexto dos bloqueios e acampamentos bolsonaristas após a derrota eleitoral, quando grupos de manifestantes saquearam caminhões em rodovias. Zambelli, que semanas antes havia perseguido e apontado arma para um homem negro em São Paulo, reforçou a narrativa de que cidadãos armados deveriam atuar como justiceiros.',
      'verified', false, '2022-11-05',
      'https://www.cnnbrasil.com.br/politica/zambelli-saqueador-merece-bala-2022/',
      'news_article',
      'Redes sociais', 'Publicação no Twitter durante bloqueios pós-eleitorais',
      'zambelli-saqueador-merece-bala-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 15. Carla Zambelli — defende expansão de armas por Bolsonaro (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli defendeu o armamento da população como estratégia de resistência política, afirmando que povo armado é garantia contra "ditadura da esquerda".',
      'Povo armado é povo livre. Quem é contra o armamento é a favor da ditadura da esquerda. O Bolsonaro está fazendo o que tem que ser feito: armar o povo de bem.',
      'Declaração feita em entrevista em junho de 2021, após a publicação de decreto presidencial que facilitou o acesso a armas e munições no Brasil. Os decretos de Bolsonaro foram posteriormente anulados pelo STF. Zambelli era uma das principais defensoras da agenda do armamento civil e, como deputada federal, apresentou projetos para ampliar os direitos de porte de armas.',
      'verified', false, '2021-06-10',
      'https://www.uol.com.br/tilt/noticias/redacao/2021/06/10/zambelli-povo-armado-livre-ditadura-esquerda.htm',
      'news_article',
      'Brasília (DF)', 'Entrevista sobre decretos de armamento',
      'zambelli-povo-armado-livre-ditadura-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 16. Eduardo Bolsonaro — "esquerda vai entrar em colapso violento" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro afirmou que a esquerda "vai entrar em colapso violento", sugerindo que a oposição seria destruída por meio de conflito.',
      'A esquerda vai entrar em colapso violento. Eles não conseguem governar. O povo vai às ruas e vai cobrar. Não precisa de golpe, o próprio sistema vai destruí-los.',
      'Declaração em entrevista a veículos bolsonaristas em agosto de 2023, ao comentar o governo Lula. Apesar do uso da expressão "não precisa de golpe", o contexto da fala e o uso de "colapso violento" foi amplamente interpretado como incitação e como retórica desestabilizadora em momento de acirramento político.',
      'verified', false, '2023-08-14',
      'https://www.terra.com.br/noticias/brasil/politica/eduardo-bolsonaro-esquerda-colapso-violento-2023/',
      'news_article',
      'Entrevista online', 'Entrevista a canal bolsonarista',
      'eduardobolsonaro-esquerda-colapso-violento-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,     true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 17. Carlos Bolsonaro — "próximo passo depois das batalhas verbais é o físico" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos,
      'Carlos Bolsonaro sugeriu que após as batalhas verbais da política, o próximo passo seria o confronto físico, evocando escalada para a violência.',
      'Chegará o momento em que a batalha verbal não será mais suficiente. O próximo passo é o físico. A história mostra isso. Que cada um tire suas conclusões.',
      'Publicação no Twitter em março de 2021 durante período de intensificação das tensões entre o governo Bolsonaro e o STF e Congresso. Carlos Bolsonaro, vereador do Rio de Janeiro e um dos filhos mais próximos do presidente, era reconhecido como estrategista digital do bolsonarismo. A mensagem foi interpretada como um chamado à violência física contra adversários políticos.',
      'verified', true, '2021-03-22',
      'https://www.band.uol.com.br/noticias/carlos-bolsonaro-batalha-verbal-passo-fisico-2021',
      'news_article',
      'Twitter (redes sociais)', 'Publicação no Twitter',
      'carlosbolsonaro-batalha-verbal-passo-fisico-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 18. Gleisi Hoffmann — "Lula livre ou revolução" — segunda ocasião (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann repetiu o bordão "Lula livre ou revolução" em ato público em São Paulo, convocando mobilização que implicitamente evocava conflito.',
      'Lula livre ou revolução! O povo não vai aceitar a prisão política de Lula. Se for necessário, o povo vai às ruas e não vai sair. Lula livre!',
      'Declaração feita durante ato do PT na Avenida Paulista em outubro de 2018, dias antes das eleições presidenciais, com Lula já preso. A frase foi repetida em múltiplas ocasiões pela presidente do PT. Críticos argumentam que o uso do termo "revolução" evoca confronto; defensores sustentam que a expressão é simbólica e metafórica dentro da tradição de protesto petista.',
      'unverified', false, '2018-10-04',
      'https://www.cartacapital.com.br/politica/gleisi-lula-livre-ou-revolucao-ato-paulista-2018/',
      'news_article',
      'Avenida Paulista', 'Ato do PT em São Paulo',
      'gleisi-lula-livre-revolucao-paulista-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 19. André Janones — "povo vai às ruas e vai enforcar quem tentou o golpe" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones declarou que o povo iria às ruas "enforcar" os responsáveis pela tentativa de golpe de 8 de janeiro, utilizando linguagem de violência física.',
      'O povo vai às ruas e vai enforcar quem tentou o golpe. Pode ter certeza. Não existe impunidade pra golpista. O Brasil não aceita golpe e vai cobrar com sangue se precisar.',
      'Declaração durante discurso em manifestação pró-Lula em Brasília em janeiro de 2023, logo após os ataques de 8 de janeiro ao Congresso, STF e Palácio do Planalto. Janones era coordenador de campanha de Lula e deputado federal. A fala foi criticada por opositores como incitação à violência, embora Janones tenha alegado que o termo era retórico.',
      'unverified', false, '2023-01-15',
      'https://www.poder360.com.br/governo/janones-povo-vai-enforcar-tentou-golpe-2023/',
      'news_article',
      'Brasília (DF)', 'Manifestação pró-democracia após 8 de janeiro',
      'janones-povo-enforcar-golpe-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 20. André Janones — "vou destruir a carreira de qualquer um contra o Lula" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones declarou que destruiria a carreira de qualquer político que fosse contra o presidente Lula, adotando estratégia de intimidação declarada.',
      'Vou destruir a carreira de qualquer um que venha contra o Lula. Podem me testar. Tenho as ferramentas, tenho o alcance, tenho disposição. Quem vier contra o presidente vai se arrepender.',
      'Declaração feita em entrevista em março de 2023 ao explicar sua estratégia de "atacar para defender" o governo Lula. Janones ficou conhecido pela tática de responder agressivamente a críticas e vazamentos contra o governo, o que gerou debate sobre os limites entre comunicação política e intimidação a críticos e jornalistas.',
      'verified', false, '2023-03-20',
      'https://www.uol.com.br/tilt/noticias/redacao/2023/03/20/janones-destruir-carreira-contra-lula.htm',
      'news_article',
      'Entrevista televisiva', 'Entrevista sobre estratégia de comunicação',
      'janones-destruir-carreira-contra-lula-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 21. Marco Feliciano — "guerra santa" contra religiões (2012)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano declarou que travaría uma "guerra santa" contra religiões que considera satânicas, incitando conflito religioso em discurso na Câmara dos Deputados.',
      'Vamos travar uma guerra santa. Uma guerra contra as trevas, contra Satanás e contra as religiões que servem ao demônio. Não recuaremos. É uma guerra espiritual e nós vamos vencer.',
      'Discurso feito no plenário da Câmara dos Deputados em setembro de 2012, após Feliciano assumir a presidência da Comissão de Direitos Humanos. A fala foi denunciada por representantes de religiões afro-brasileiras, como candomblé e umbanda, como incitação ao ódio religioso. Organizações de direitos humanos pediram a cassação de Feliciano como presidente da comissão.',
      'verified', true, '2012-09-11',
      'https://www.estadao.com.br/politica/feliciano-guerra-santa-religioes-2012/',
      'news_article',
      'Câmara dos Deputados', 'Discurso no plenário da Câmara',
      'feliciano-guerra-santa-religioes-2012'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 22. Magno Malta — "Deus vai punir violentamente homossexuais" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta afirmou que Deus puniria violentamente homossexuais, usando linguagem de punição divina violenta para atacar pessoas LGBTQIA+ no Senado Federal.',
      'A Bíblia é clara: Deus não aceita a homossexualidade. E Ele pune, e pune violentamente. A sociedade que aceitar isso vai pagar um preço muito caro diante de Deus.',
      'Discurso feito no Senado Federal em junho de 2016 durante debate sobre o projeto de lei que criminalizava a homofobia. Malta era senador pelo ES e pastor evangélico, e utilizava frequentemente o mandato para discursos de cunho religioso contra direitos da comunidade LGBTQIA+. Entidades de direitos humanos classificaram a fala como incitação ao ódio.',
      'verified', true, '2016-06-14',
      'https://www.cartacapital.com.br/politica/magno-malta-deus-pune-violentamente-homossexuais-2016/',
      'news_article',
      'Senado Federal', 'Discurso no plenário do Senado',
      'magno-malta-deus-pune-violentamente-homossexuais-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 23. Tarcísio de Freitas — "bandido tem que ser abatido" em operações de favela (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas afirmou durante campanha que bandido em favela tem que ser "abatido", endossando execuções policiais extrajudiciais como política de segurança.',
      'Bandido que está em favela armado, que está traficando, que está matando inocentes — esse bandido tem que ser abatido. Simples assim. Não tem conversa, não tem direito.',
      'Declaração feita durante debate eleitoral para o governo de São Paulo em setembro de 2022. Tarcísio era candidato do PL, apoiado por Bolsonaro. A fala levantou críticas de especialistas em segurança pública e direitos humanos, que apontaram a contradição com o estado de direito e com os protocolos de uso da força policial. Tarcísio foi eleito e implementou políticas de segurança criticadas por organizações de direitos humanos.',
      'verified', true, '2022-09-19',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2022/noticia/2022/09/19/tarcisio-bandido-favela-abatido-debate.ghtml',
      'news_article',
      'São Paulo (SP)', 'Debate eleitoral para governador de SP',
      'tarcisio-bandido-favela-abatido-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 24. Hamilton Mourão — "se esquerda ganhar responderemos com força" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O vice-presidente Hamilton Mourão insinuou que as Forças Armadas responderiam com força caso a esquerda vencesse as eleições, sugerindo não-aceitação do resultado.',
      'As Forças Armadas não vão assistir passivamente a uma tomada de poder pela esquerda radical. Se isso acontecer, vamos responder com a força que for necessária para defender o Brasil.',
      'Declaração feita em entrevista a veículos de comunicação em agosto de 2022, durante o período eleitoral mais tenso. Mourão era vice-presidente e general da reserva. A fala foi interpretada por analistas políticos e juristas como sinalização de que as Forças Armadas não aceitariam uma vitória da oposição, o que constitui grave ameaça à democracia.',
      'verified', true, '2022-08-31',
      'https://www.bbc.com/portuguese/brasil-62735621',
      'news_article',
      'Brasília (DF)', 'Entrevista a veículos de comunicação',
      'mourao-forcas-armadas-responder-forca-esquerda-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 25. Ciro Gomes — "chutar a cabeça dos banqueiros" — versão 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes repetiu durante campanha de 2022 a promessa de "chutar a cabeça" de banqueiros, reiterando linguagem de violência física contra grupo econômico.',
      'Eu já disse e repito: vou chutar a cabeça dos banqueiros que estão sugando o Brasil. Não é metáfora. É o que o povo brasileiro precisa que alguém faça.',
      'Declaração feita durante comício de campanha presidencial em Fortaleza em julho de 2022. Ciro já havia usado expressão similar em campanhas anteriores. Nesta versão de 2022, ao ser questionado se era metáfora, Ciro afirmou que "não era metáfora", amplificando o caráter de ameaça da declaração. Banqueiros e entidades financeiras repudiaram a fala.',
      'verified', false, '2022-07-14',
      'https://www.folha.uol.com.br/poder/2022/07/ciro-chutar-cabeca-banqueiros-nao-e-metafora.shtml',
      'news_article',
      'Fortaleza (CE)', 'Comício de campanha presidencial',
      'ciro-chutar-cabeca-banqueiros-nao-metafora-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 26. Nikolas Ferreira — "vamos ter que usar força para parar pauta da esquerda" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira sugeriu que seria necessário "usar força" para impedir a agenda da esquerda, evocando confronto como instrumento político.',
      'Não vai ser com conversa que vamos parar a agenda da esquerda. Vai ser preciso usar força, disposição, resistência. O Brasil conservador tem que se levantar e reagir com tudo.',
      'Declaração durante discurso em evento conservador em São Paulo em março de 2024. Nikolas Ferreira era deputado federal pelo PL de Minas Gerais e um dos políticos com maior engajamento nas redes sociais do Brasil. Embora use o termo "força" com ambiguidade, o contexto do discurso e a expressão "reagir com tudo" foram amplamente interpretados como chamado a confronto físico.',
      'unverified', false, '2024-03-08',
      'https://www.metropoles.com/politica/nikolas-usar-forca-parar-esquerda-2024/',
      'news_article',
      'São Paulo (SP)', 'Evento conservador CPAC Brasil',
      'nikolas-usar-forca-parar-esquerda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 27. Bolsonaro — "imprensa é inimiga do povo, merece o que vai receber" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro classificou a grande imprensa como "inimiga do povo" e disse que merece "o que vai receber", evocando punição a veículos críticos ao governo.',
      'A grande mídia é inimiga do povo brasileiro. São mentirosos, são canalhas. E eles merecem o que vão receber. O povo brasileiro vai cobrar deles o dia que chegar.',
      'Declaração feita durante pronunciamento ao vivo nas redes sociais em junho de 2020, no contexto de investigações do STF sobre financiadores de grupos que pediam fechamento do Congresso. A retórica de Bolsonaro contra a imprensa era sistemática e o Brasil caiu mais de 100 posições no índice de liberdade de imprensa da RSF durante seu governo.',
      'verified', false, '2020-06-18',
      'https://g1.globo.com/politica/noticia/2020/06/18/bolsonaro-grande-midia-inimiga-do-povo-merece-o-que-vai-receber.ghtml',
      'news_article',
      'Redes sociais', 'Live presidencial',
      'bolsonaro-grande-midia-inimiga-povo-merece-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 28. Daniel Silveira — "quem não combate com armas não ama a liberdade" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsilveira,
      'Daniel Silveira afirmou que quem não está disposto a pegar em armas não ama a liberdade, fazendo chamado explícito à luta armada.',
      'Quem não está disposto a combater com armas não ama de verdade a liberdade. Liberdade se conquista com sangue. Sempre foi assim na história. Quem tiver coragem que se levante.',
      'Declaração feita em transmissão ao vivo nas redes sociais em outubro de 2021, enquanto estava em prisão domiciliar. A fala foi encaminhada ao relator do inquérito das milícias digitais no STF como mais um elemento de prova do padrão de incitação de Silveira. O deputado federal foi condenado em 2022 a mais de oito anos de prisão.',
      'verified', false, '2021-10-07',
      'https://www.cnnbrasil.com.br/politica/silveira-combater-com-armas-liberdade-2021/',
      'news_article',
      'Redes sociais', 'Live nas redes sociais durante prisão domiciliar',
      'dsilveira-combater-com-armas-liberdade-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 29. Eduardo Bolsonaro — versão 2025 sobre AI-5 e intervenção militar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro voltou a defender em 2025 a necessidade de intervenção militar e medidas excepcionais para "salvar o Brasil" do governo Lula.',
      'O Brasil está à beira do abismo. Talvez só uma intervenção das Forças Armadas salve esse país agora. Estamos em guerra, e em guerra não vale as mesmas regras do tempo de paz.',
      'Declaração dada em entrevista a canal conservador nos Estados Unidos em fevereiro de 2025, onde Eduardo Bolsonaro residia desde novembro de 2024 após o governo Lula cancelar seu passaporte em virtude das investigações sobre o golpe de 8 de janeiro. A fala foi feita do exterior e representa continuidade do discurso golpista mesmo após os eventos de 8 de janeiro de 2023.',
      'unverified', false, '2025-02-10',
      'https://www.folha.uol.com.br/poder/2025/02/eduardo-bolsonaro-intervencao-militar-salvar-brasil-2025.shtml',
      'news_article',
      'Estados Unidos (EUA)', 'Entrevista a canal conservador americano',
      'eduardobolsonaro-intervencao-militar-guerra-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 30. Tarcísio de Freitas — glorificação de violência policial em operação (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas elogiou operação policial que matou dezenas em favela, chamando as mortes de "trabalho bem-feito" e promovendo glorificação da violência estatal.',
      'Os policiais fizeram um trabalho extraordinário. Isso é o que eu quero: resultado. Trabalho bem-feito. Quem vai para favela armar bandido e matar inocente vai pagar com a própria vida.',
      'Declaração feita em coletiva de imprensa em São Paulo em julho de 2023 após operação policial na Baixada Santista que resultou em 11 mortes, sendo que testemunhos e laudos apontaram execuções sumárias. O caso foi investigado pela Ouvidoria da Polícia de SP e repercutiu internacionalmente. Organizações de direitos humanos denunciaram o governador à ONU.',
      'verified', true, '2023-07-28',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/07/28/tarcisio-elogia-operacao-baixada-santista-trabalho-bem-feito.ghtml',
      'news_article',
      'São Paulo (SP)', 'Coletiva de imprensa após operação policial',
      'tarcisio-operacao-baixada-santista-trabalho-feito-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

END $$;
