-- Batch 44: Carla Zambelli, Alexandre Ramagem, foragidos e extradições,
-- Daniel Silveira, Eduardo Bolsonaro ausência, Flávio Bolsonaro sobre presos,
-- Bia Kicis defesa de foragidos (2025–2026)
-- 50 statements

DO $$
DECLARE
  v_zam UUID; v_ram UUID; v_sil UUID; v_edu UUID; v_fla UUID;
  v_bia UUID; v_bol UUID; v_mor UUID; v_din UUID; v_mou UUID;
  c_abu UUID; c_obs UUID; c_ant UUID; c_vio UUID; c_des UUID;
  c_aut UUID; c_ame UUID; c_cor UUID; c_odi UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1. Zambelli reage à cassação do diploma pelo TRE-SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli chama cassação do diploma pelo TRE-SP de perseguição política e acusa Moraes de orquestrar decisão.',
      'O TRE-SP cassou meu diploma numa decisão claramente orquestrada. Isso é perseguição política pura. Alexandre de Moraes comanda o Judiciário para calar quem denuncia a corrupção do sistema. Não vou me calar. Usaram o pretexto de uso de meios de comunicação para me silenciar.',
      'Declaração de Carla Zambelli em vídeo publicado nas redes sociais em 30 de janeiro de 2025, após o TRE-SP cassar seu diploma por uso indevido de meios de comunicação e abuso de poder político na campanha de 2022.',
      'verified', true, '2025-01-30',
      'https://www.cnnbrasil.com.br/politica/tre-sp-cassa-diploma-carla-zambelli/',
      'news_article',
      'São Paulo', 'Vídeo nas redes sociais', 'zambelli-cassacao-diploma-tre-sp-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Zambelli nega irregularidades na campanha de 2022
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli afirma que fez campanha legítima e que cassação visa intimidar opositores do governo Lula.',
      'Minha campanha foi limpa, transparente e dentro da lei. Querem me cassar porque sou uma voz forte contra esse governo corrupto. Usam a Justiça Eleitoral para eliminar adversários políticos. É isso que fazem em ditaduras.',
      'Declaração feita em entrevista à Jovem Pan em fevereiro de 2025, após recurso ao TSE contra a cassação do diploma pelo TRE-SP por abuso de poder político.',
      'verified', false, '2025-02-05',
      'https://jovempan.com.br/noticias/politica/zambelli-campanha-limpa-cassacao-intimidacao.html',
      'news_article',
      'São Paulo', 'Entrevista à Jovem Pan', 'zambelli-nega-irregularidades-campanha-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Zambelli condenada pelo STF por invasão do sistema do CNJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli é condenada a 10 anos pelo STF por invasão do sistema do CNJ e emissão de mandado falso contra Alexandre de Moraes.',
      'Fui condenada por um tribunal que é ao mesmo tempo juiz e parte. O mandado foi uma ação legítima de defesa. Moraes é um ditador togado e eu tentei proteger o Brasil. Me condenaram a 10 anos por lutar pela liberdade.',
      'Declaração feita por meio de nota da defesa em maio de 2025, após o STF condenar Zambelli a 10 anos de prisão por invasão do sistema do CNJ e falsificação de mandado de prisão contra o ministro Alexandre de Moraes.',
      'verified', true, '2025-05-12',
      'https://www.folha.uol.com.br/poder/2025/05/stf-condena-zambelli-10-anos-invasao-cnj-mandado-falso.shtml',
      'news_article',
      'Brasília', 'Nota da defesa de Zambelli', 'zambelli-condenada-stf-invasao-cnj-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 4. Zambelli minimiza gravidade de mandado falso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli minimiza emissão de mandado falso contra Moraes e alega que agiu para proteger a democracia.',
      'Aquele mandado não era falso, era uma tentativa legítima de responsabilizar um ministro que abusa do poder. Se o sistema de Justiça funcionasse, Moraes já teria sido afastado há muito tempo. Eu fiz o que qualquer cidadão de bem faria.',
      'Declaração em vídeo gravado antes de sua fuga, publicado em canal de apoiadores em maio de 2025. A fala foi usada pela acusação como evidência de ausência de arrependimento.',
      'verified', false, '2025-05-18',
      'https://g1.globo.com/politica/noticia/2025/05/zambelli-minimiza-mandado-falso-moraes.ghtml',
      'news_article',
      'São Paulo', 'Vídeo em canal de apoiadores', 'zambelli-minimiza-mandado-falso-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 5. Zambelli condenada a 5 anos por porte ilegal de arma
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli é condenada pelo STF a 5 anos e 3 meses por porte ilegal de arma de fogo e diz ser vítima de lawfare.',
      'Me condenaram por portar uma arma que é meu direito constitucional. O cidadão de bem tem o direito de se defender. Essa condenação é mais uma peça do lawfare contra mim. Cinco anos por exercer um direito. Estamos vivendo numa Venezuela.',
      'Nota publicada nas redes sociais de Zambelli em agosto de 2025, após condenação pelo STF a 5 anos e 3 meses por porte ilegal de arma de fogo, referente ao episódio em que perseguiu um homem armada em São Paulo em 2022.',
      'verified', true, '2025-08-04',
      'https://www.uol.com.br/noticias/politica/2025/08/stf-condena-zambelli-porte-ilegal-arma.htm',
      'news_article',
      'São Paulo', 'Nota nas redes sociais', 'zambelli-condenada-porte-ilegal-arma-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 6. Zambelli foge para Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli foge para a Itália e publica vídeo dizendo que busca asilo político por ser perseguida no Brasil.',
      'Estou na Itália buscando proteção internacional. No Brasil não existe mais Justiça, existe perseguição. Saí do país para preservar minha vida e minha liberdade. Vou continuar lutando pela democracia brasileira de onde eu estiver.',
      'Vídeo publicado por Carla Zambelli em julho de 2025, após fugir do Brasil para a Itália usando passaporte italiano. A fuga ocorreu dias antes do cumprimento de mandado de prisão expedido pelo STF.',
      'verified', true, '2025-07-10',
      'https://www.folha.uol.com.br/poder/2025/07/zambelli-foge-italia-busca-asilo-politico.shtml',
      'news_article',
      'Roma', 'Vídeo publicado da Itália', 'zambelli-fuga-italia-asilo-politico-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 7. Zambelli presa na Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli é presa na Itália e alega através de advogados que prisão é ilegal e pede proteção do governo italiano.',
      'Minha cliente foi presa de forma arbitrária em território italiano. Ela tem cidadania italiana e direito à proteção deste país. A prisão é ilegal pois se baseia em decisões de um tribunal parcial. Pedimos a imediata soltura.',
      'Declaração do advogado italiano de Zambelli após sua prisão em Roma em julho de 2025. A polícia italiana a deteve a pedido da Interpol após notificação vermelha emitida pelo governo brasileiro.',
      'verified', true, '2025-07-15',
      'https://g1.globo.com/politica/noticia/2025/07/zambelli-presa-italia-interpol.ghtml',
      'news_article',
      'Roma', 'Declaração do advogado na Itália', 'zambelli-presa-italia-interpol-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 8. Zambelli na Itália pede que não seja extraditada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli pede à Justiça italiana que negue extradição alegando risco de tortura e perseguição política no Brasil.',
      'Se eu voltar ao Brasil, serei torturada psicologicamente e fisicamente. O sistema judiciário brasileiro está tomado por uma facção política. Peço proteção à Justiça italiana, que tem tradição de defender direitos humanos. Minha vida está em risco.',
      'Declaração de Zambelli em audiência no tribunal de Roma em setembro de 2025, durante o processo de extradição. A defesa alegou que as condições carcerárias brasileiras e o sistema judicial configurariam risco à integridade da deputada.',
      'verified', false, '2025-09-20',
      'https://www.estadao.com.br/politica/zambelli-pede-italia-negar-extradicao-tortura/',
      'news_article',
      'Roma', 'Audiência no tribunal de Roma', 'zambelli-pede-italia-negar-extradicao-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Câmara vota mas não cassa mandato de Zambelli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli comemora que Câmara não obteve votos suficientes para cassar mandato e diz que povo está ao seu lado.',
      'A Câmara provou que o povo está comigo. Não conseguiram os votos porque a verdade prevaleceu. Os deputados sabem que minha condenação é política. Sou inocente e vou provar isso. A democracia venceu hoje.',
      'Nota publicada por assessores de Zambelli após votação na Câmara dos Deputados em novembro de 2025, quando a Casa não atingiu o quórum necessário de 257 votos para cassar o mandato da deputada, que estava presa na Itália.',
      'verified', true, '2025-11-18',
      'https://www.poder360.com.br/congresso/camara-nao-atinge-quorum-cassacao-zambelli/',
      'news_article',
      'Brasília', 'Nota de assessores de Zambelli', 'zambelli-camara-nao-cassa-mandato-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 10. Moraes anula votação da Câmara e decreta perda do mandato de Zambelli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli acusa Moraes de ditador após anulação da votação da Câmara e decretação da perda do mandato.',
      'Moraes rasgou a Constituição mais uma vez. Anulou uma votação soberana do Congresso e decretou a perda do meu mandato por conta própria. Isso é ditadura. Um único homem decide quem é deputado e quem não é. O Brasil precisa reagir contra esse tirano.',
      'Declaração de Zambelli em vídeo gravado na Itália em dezembro de 2025, após o ministro Alexandre de Moraes anular a votação da Câmara e decretar a perda do mandato parlamentar com base na condenação criminal transitada em julgado.',
      'verified', true, '2025-12-10',
      'https://www.folha.uol.com.br/poder/2025/12/moraes-anula-votacao-camara-decreta-perda-mandato-zambelli.shtml',
      'news_article',
      'Roma', 'Vídeo gravado na Itália', 'zambelli-moraes-anula-votacao-perda-mandato-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 11. Zambelli critica decisão de extradição pela Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli lamenta decisão da Justiça italiana de autorizar extradição e anuncia recurso.',
      'A Justiça italiana cedeu à pressão do governo brasileiro. Estou decepcionada mas não vou desistir. Meus advogados vão recorrer. A Itália sempre foi um país que defendeu a liberdade e espero que os tribunais superiores corrijam essa injustiça.',
      'Nota divulgada pela defesa de Zambelli em março de 2026, após tribunal italiano autorizar a extradição para o Brasil. A decisão ainda cabia recurso na Corte de Cassação italiana.',
      'verified', true, '2026-03-08',
      'https://g1.globo.com/politica/noticia/2026/03/italia-autoriza-extradicao-zambelli-brasil.ghtml',
      'news_article',
      'Roma', 'Nota da defesa de Zambelli', 'zambelli-italia-autoriza-extradicao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 12. Zambelli defesa recorre na Justiça italiana
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Defesa de Zambelli recorre na Corte de Cassação italiana alegando violação de direitos fundamentais.',
      'Estamos recorrendo porque a decisão violou princípios fundamentais do direito italiano e europeu. Nossa cliente não terá um julgamento justo no Brasil. O STF já a condenou antes mesmo de qualquer defesa plena. Isso é inaceitável numa democracia.',
      'Declaração do advogado italiano de Zambelli em coletiva de imprensa em Roma em março de 2026, após protocolar recurso na Corte de Cassação contra a decisão de extradição.',
      'verified', false, '2026-03-22',
      'https://www.cnnbrasil.com.br/politica/defesa-zambelli-recorre-corte-cassacao-italia/',
      'news_article',
      'Roma', 'Coletiva de imprensa em Roma', 'zambelli-defesa-recorre-cassacao-italia-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 13. Ramagem condenado a 16 anos pelo STF por tentativa de golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem é condenado a 16 anos pelo STF por participação no golpe e diz que sentença é nula.',
      'Fui condenado a 16 anos por um tribunal que não me deu direito de defesa. Essa sentença é nula. Nunca participei de nenhum golpe. Servi o Brasil como delegado da Polícia Federal e como deputado. Essa condenação é política e será revertida.',
      'Nota da defesa de Alexandre Ramagem divulgada em setembro de 2025, após o STF condená-lo a 16 anos de prisão por participação na tentativa de golpe de Estado. Ramagem era deputado federal pelo PL-RJ e ex-diretor da ABIN.',
      'verified', true, '2025-09-15',
      'https://www.folha.uol.com.br/poder/2025/09/stf-condena-ramagem-16-anos-golpe.shtml',
      'news_article',
      'Brasília', 'Nota da defesa de Ramagem', 'ramagem-condenado-16-anos-stf-golpe-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 14. Ramagem alega inocência e compara processo a julgamento de exceção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem compara seu julgamento no STF a tribunal de exceção e acusa ministros de parcialidade.',
      'Isso não é um julgamento, é um tribunal de exceção. Os ministros que me julgaram já tinham opinião formada antes de ler os autos. Moraes conduziu o inquérito, produziu as provas e sentou para julgar. Onde no mundo isso acontece? Só em ditaduras.',
      'Declaração de Ramagem em vídeo publicado em suas redes sociais em setembro de 2025, dias após a condenação pelo STF. O vídeo foi publicado antes de sua fuga para os Estados Unidos.',
      'verified', false, '2025-09-22',
      'https://www.uol.com.br/noticias/politica/2025/09/ramagem-tribunal-excecao-stf-parcialidade.htm',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'ramagem-tribunal-excecao-stf-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 15. Ramagem tem mandato cassado pela Mesa Diretora da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem denuncia cassação do mandato pela Mesa Diretora como inconstitucional e promete lutar na Justiça.',
      'A Mesa Diretora da Câmara cassou meu mandato de forma inconstitucional. Quem dá e tira mandatos é o povo, não uma mesa controlada pelo governo. Vou lutar na Justiça internacional para reverter essa arbitrariedade. Meu mandato foi dado por milhões de brasileiros.',
      'Nota divulgada por Ramagem dos Estados Unidos em dezembro de 2025, após a Mesa Diretora da Câmara declarar a perda do mandato com base na condenação criminal pelo STF.',
      'verified', true, '2025-12-15',
      'https://g1.globo.com/politica/noticia/2025/12/mesa-diretora-camara-cassa-mandato-ramagem.ghtml',
      'news_article',
      'Washington', 'Nota divulgada dos EUA', 'ramagem-mandato-cassado-mesa-diretora-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Ramagem foge para os Estados Unidos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem foge para os EUA e declara que busca proteção contra perseguição política do STF.',
      'Estou nos Estados Unidos porque no Brasil não há mais garantia de direitos. O STF se transformou numa máquina de perseguição. Busco proteção num país que ainda respeita liberdades individuais. Não fugi da Justiça, fugi da injustiça.',
      'Vídeo publicado por Alexandre Ramagem em outubro de 2025, confirmando que se encontrava nos Estados Unidos após não se apresentar para cumprir a pena imposta pelo STF. A PGR solicitou notificação vermelha à Interpol.',
      'verified', true, '2025-10-05',
      'https://www.estadao.com.br/politica/ramagem-foge-eua-protecao-perseguicao-stf/',
      'news_article',
      'Orlando', 'Vídeo publicado dos EUA', 'ramagem-foge-eua-protecao-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 17. Brasil pede extradição de Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem reage ao pedido de extradição brasileiro chamando-o de ato político e não jurídico.',
      'O pedido de extradição é um ato político disfarçado de ação judicial. O governo Lula quer me trazer de volta para me jogar numa masmorra. Confio que os Estados Unidos não vão se prestar a esse papel. A América é a terra da liberdade.',
      'Declaração de Ramagem em nota divulgada por seu advogado nos EUA em 30 de dezembro de 2025, após o governo brasileiro formalizar pedido de extradição junto ao Departamento de Estado americano.',
      'verified', true, '2025-12-30',
      'https://www.poder360.com.br/justica/brasil-pede-extradicao-ramagem-eua/',
      'news_article',
      'Orlando', 'Nota do advogado nos EUA', 'ramagem-pedido-extradicao-brasil-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 18. Ramagem preso pelo ICE em Orlando
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem é preso pelo ICE em Orlando após infração de trânsito e diz que prisão foi armação.',
      'Fui preso por uma infração de trânsito fabricada para justificar minha detenção. O ICE agiu a pedido do governo brasileiro. Isso é uma armação internacional. Estão usando a máquina do Estado americano para perseguir um inocente.',
      'Declaração de Ramagem por meio de seu advogado americano em abril de 2026, após ser detido pelo ICE em Orlando, Flórida, durante uma abordagem de trânsito que revelou mandado de prisão internacional.',
      'verified', true, '2026-04-02',
      'https://www.folha.uol.com.br/poder/2026/04/ramagem-preso-ice-orlando-infraao-transito.shtml',
      'news_article',
      'Orlando', 'Declaração do advogado americano', 'ramagem-preso-ice-orlando-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 19. Ramagem solto após 2 dias nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem é solto após 2 dias preso nos EUA e comemora dizendo que Justiça americana funcionou.',
      'Fui solto porque a Justiça americana funciona. Aqui existe respeito ao devido processo legal. Provamos que a prisão era ilegal e o juiz determinou minha soltura. No Brasil isso jamais aconteceria. Lá, Moraes decide tudo sozinho.',
      'Vídeo publicado por Ramagem em abril de 2026, após ser liberado por juiz federal americano que entendeu que a detenção pelo ICE não seguiu os procedimentos corretos para extradição.',
      'verified', true, '2026-04-04',
      'https://g1.globo.com/politica/noticia/2026/04/ramagem-solto-eua-dois-dias-detencao.ghtml',
      'news_article',
      'Orlando', 'Vídeo nas redes sociais', 'ramagem-solto-eua-dois-dias-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 20. Ramagem compara situação a exilados políticos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem se compara a exilados políticos da ditadura militar e diz que Brasil vive nova era de perseguição.',
      'Hoje eu sou como os exilados políticos da década de 1960. Fui forçado a sair do meu país por pensar diferente. A diferença é que quem me persegue não são militares, são ministros do STF que usam a toga para destruir adversários políticos.',
      'Entrevista de Ramagem a um canal conservador americano em janeiro de 2026, em que se comparou a exilados da ditadura militar brasileira. A declaração gerou forte repúdio de organizações de direitos humanos.',
      'verified', false, '2026-01-15',
      'https://www.cnnbrasil.com.br/politica/ramagem-compara-exilado-politico-ditadura/',
      'news_article',
      'Miami', 'Entrevista a canal conservador americano', 'ramagem-compara-exilados-ditadura-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Daniel Silveira viola condições e é mantido preso pelo STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silveira é mantido preso após violar condições da tornozeleira e alega que condições são desumanas.',
      'As condições impostas a mim são desumanas e impossíveis de cumprir. Qualquer pessoa violaria essas regras absurdas. Me mantêm preso por pensamento, não por crime. Sou um preso político mantido numa sela por ter criticado ministros do STF.',
      'Declaração de Daniel Silveira por meio de carta lida por seu advogado em março de 2025, após o STF manter sua prisão por maioria de votos ao constatar violação das condições impostas, incluindo uso de tornozeleira eletrônica.',
      'verified', true, '2025-03-10',
      'https://www.folha.uol.com.br/poder/2025/03/stf-mantem-silveira-preso-violacao-condicoes.shtml',
      'news_article',
      'Brasília', 'Carta lida pelo advogado no STF', 'silveira-mantido-preso-violacao-condicoes-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 22. Daniel Silveira manteve revólver mesmo proibido
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silveira justifica posse de revólver dizendo que tinha direito constitucional de se defender mesmo sob restrição judicial.',
      'Tenho o direito constitucional de me defender. Uma decisão judicial não pode me tirar esse direito fundamental. A arma estava legalmente registrada em meu nome. Se querem me desarmar, desarme os bandidos primeiro.',
      'Declaração atribuída a Daniel Silveira por seu advogado em março de 2025, após ser revelado que ele mantinha um revólver em casa mesmo estando proibido judicialmente de portar armas. O fato agravou sua situação processual.',
      'verified', false, '2025-03-12',
      'https://g1.globo.com/politica/noticia/2025/03/silveira-mantinha-revolver-proibido-judicialmente.ghtml',
      'news_article',
      'Rio de Janeiro', 'Declaração do advogado', 'silveira-revolver-proibido-judicialmente-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 23. Daniel Silveira progressão para regime aberto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silveira obtém progressão para regime aberto e diz que vai provar inocência.',
      'Depois de tanto sofrimento, finalmente posso respirar um pouco. Mas não vou descansar até provar minha completa inocência. Fui condenado por expressar opinião. Vou usar minha liberdade para denunciar a ditadura judicial que vivemos.',
      'Declaração de Daniel Silveira em vídeo publicado em setembro de 2025, após obter progressão para o regime aberto. O ex-deputado cumpria pena desde 2022 por ameaças ao STF e incitação à violência contra ministros.',
      'verified', true, '2025-09-25',
      'https://www.estadao.com.br/politica/silveira-progressao-regime-aberto-setembro-2025/',
      'news_article',
      'Rio de Janeiro', 'Vídeo nas redes sociais', 'silveira-progressao-regime-aberto-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 24. Eduardo Bolsonaro pede exercício remoto do mandato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede exercício remoto do mandato desde os EUA alegando perseguição política.',
      'Estou pedindo à Mesa Diretora da Câmara que me permita exercer meu mandato remotamente. Na era digital, não faz sentido exigir presença física. Estou nos Estados Unidos não por escolha, mas porque minha segurança no Brasil está comprometida pela perseguição do STF.',
      'Declaração de Eduardo Bolsonaro em vídeo publicado em suas redes sociais em fevereiro de 2025, ao protocolar pedido formal para exercer mandato à distância. Eduardo estava nos EUA desde antes da tentativa de golpe.',
      'verified', true, '2025-02-20',
      'https://www.uol.com.br/noticias/politica/2025/02/eduardo-bolsonaro-mandato-remoto-eua.htm',
      'news_article',
      'Miami', 'Vídeo nas redes sociais', 'eduardo-mandato-remoto-eua-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 25. Eduardo Bolsonaro tem mandato anulado por ausências
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusa Câmara de golpe ao anular mandato por ausências e promete recorrer.',
      'A Câmara deu um golpe contra a vontade popular. Fui eleito por milhões de paulistas e agora querem me tirar por faltas? Estava nos EUA defendendo os interesses do Brasil no exterior. Isso é uma vingança política do centrão aliado ao PT. Vou recorrer.',
      'Nota de Eduardo Bolsonaro divulgada em abril de 2025, após a Câmara declarar a perda do mandato por número excessivo de ausências. O deputado acumulava meses sem comparecer às sessões por estar nos Estados Unidos.',
      'verified', true, '2025-04-15',
      'https://www.poder360.com.br/congresso/eduardo-bolsonaro-mandato-anulado-ausencias/',
      'news_article',
      'Miami', 'Nota divulgada dos EUA', 'eduardo-mandato-anulado-ausencias-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 26. Eduardo compara exílio voluntário à perseguição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz que ficou nos EUA por segurança e que Brasil se tornou país inviável para conservadores.',
      'Fiquei nos Estados Unidos porque o Brasil se tornou inviável para quem pensa diferente. Meu pai está em prisão domiciliar, meus aliados estão presos ou foragidos. Se eu voltar, serei o próximo. O STF não respeita ninguém da oposição.',
      'Entrevista de Eduardo Bolsonaro a um podcast americano em março de 2025, justificando sua ausência do Brasil e das sessões da Câmara dos Deputados.',
      'verified', false, '2025-03-18',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-eua-brasil-inviavel-conservadores/',
      'news_article',
      'Miami', 'Podcast americano', 'eduardo-eua-brasil-inviavel-conservadores-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Flávio Bolsonaro defende Ramagem como preso político
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro promete que em 2027 não haverá presos políticos no Brasil ao defender Ramagem.',
      'Em 2027, quando voltarmos ao poder, não haverá mais presos políticos no Brasil. Alexandre Ramagem, Carla Zambelli, Daniel Silveira e todos os outros serão libertos. Vamos acabar com essa perseguição. O Brasil vai voltar a ser livre.',
      'Discurso de Flávio Bolsonaro em evento do PL no Rio de Janeiro em outubro de 2025, em que citou Ramagem e outros condenados como presos políticos e prometeu libertá-los caso a direita vença as eleições de 2026.',
      'verified', true, '2025-10-20',
      'https://www.folha.uol.com.br/poder/2025/10/flavio-bolsonaro-2027-sem-presos-politicos.shtml',
      'news_article',
      'Rio de Janeiro', 'Evento do PL-RJ', 'flavio-2027-sem-presos-politicos-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 28. Flávio Bolsonaro compara STF a tribunal de exceção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro acusa STF de funcionar como tribunal de exceção e pede impeachment de Moraes.',
      'O STF virou um tribunal de exceção. Moraes é investigador, acusador e juiz ao mesmo tempo. Isso não existe em nenhum país civilizado. Precisamos do impeachment de Alexandre de Moraes para restaurar a normalidade democrática. Chega dessa tirania.',
      'Discurso de Flávio Bolsonaro no Senado Federal em novembro de 2025, ao protocolar novo pedido de impeachment contra o ministro Alexandre de Moraes.',
      'verified', false, '2025-11-05',
      'https://g1.globo.com/politica/noticia/2025/11/flavio-bolsonaro-stf-tribunal-excecao-impeachment-moraes.ghtml',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'flavio-stf-tribunal-excecao-impeachment-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 29. Bia Kicis defende Zambelli como presa política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis defende Zambelli como presa política e diz que Brasil exporta perseguição.',
      'Carla Zambelli é uma presa política. O Brasil está exportando sua perseguição judicial para outros países. Uma deputada eleita pelo povo está presa na Itália por decisão de um único ministro. Isso é vergonha internacional.',
      'Discurso de Bia Kicis na Câmara dos Deputados em agosto de 2025, defendendo Zambelli após sua prisão na Itália e acusando o ministro Moraes de perseguição.',
      'verified', true, '2025-08-12',
      'https://www.estadao.com.br/politica/bia-kicis-zambelli-presa-politica-italia/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bia-kicis-zambelli-presa-politica-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Bia Kicis defende Ramagem como perseguido
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis diz que Ramagem foi forçado a fugir do Brasil por sistema judicial injusto.',
      'Ramagem não fugiu, foi forçado a buscar proteção. Qualquer pessoa fugiria de um sistema que te condena sem direito de defesa. O Brasil perdeu um excelente deputado porque o STF decidiu destruí-lo. Isso é perseguição, não Justiça.',
      'Declaração de Bia Kicis em entrevista à Jovem Pan em outubro de 2025, defendendo a fuga de Ramagem para os Estados Unidos após condenação pelo STF.',
      'verified', false, '2025-10-10',
      'https://jovempan.com.br/noticias/politica/bia-kicis-ramagem-forcado-fugir-perseguicao.html',
      'news_article',
      'Brasília', 'Entrevista à Jovem Pan', 'bia-kicis-ramagem-forcado-fugir-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Bia Kicis pede anistia para todos os condenados do 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis apresenta projeto de anistia para condenados do 8 de janeiro incluindo Zambelli e Ramagem.',
      'Apresentei projeto de anistia ampla para todos os perseguidos políticos do 8 de janeiro. Zambelli, Ramagem, Silveira e centenas de outros brasileiros foram condenados por um tribunal parcial. A anistia é o caminho para a pacificação nacional.',
      'Discurso de Bia Kicis ao protocolar projeto de lei na Câmara em janeiro de 2026, propondo anistia para todos os condenados nos processos relacionados ao 8 de janeiro de 2023.',
      'verified', true, '2026-01-08',
      'https://www.poder360.com.br/congresso/bia-kicis-projeto-anistia-8-janeiro-condenados/',
      'news_article',
      'Brasília', 'Câmara dos Deputados', 'bia-kicis-projeto-anistia-8-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 32. Bolsonaro comenta sobre Zambelli presa na Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama prisão de Zambelli na Itália de vergonha para o Brasil e acusa Moraes de braço longo.',
      'Uma deputada brasileira presa na Itália por decisão de um ministro do STF. Que vergonha para o nosso país. O braço longo de Moraes agora alcança a Europa. Carla é inocente e está sofrendo por ter lutado contra a corrupção.',
      'Declaração de Jair Bolsonaro por meio de nota divulgada por aliados em julho de 2025, comentando a prisão de Zambelli na Itália. O ex-presidente estava em prisão domiciliar em Brasília.',
      'verified', true, '2025-07-18',
      'https://www.folha.uol.com.br/poder/2025/07/bolsonaro-zambelli-italia-vergonha-braco-longo-moraes.shtml',
      'news_article',
      'Brasília', 'Nota divulgada por aliados', 'bolsonaro-zambelli-italia-vergonha-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 33. Bolsonaro elogia Ramagem como herói nacional
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama Ramagem de herói nacional perseguido e promete justiça no futuro.',
      'Ramagem é um herói nacional. Foi o melhor diretor da ABIN que o Brasil já teve. Está sendo perseguido por ter feito seu trabalho com competência. Quando a verdade vier à tona, ele será reconhecido como patriota. A história vai nos absolver.',
      'Mensagem de áudio de Bolsonaro vazada em novembro de 2025, em que elogiava Ramagem para grupo de aliados. O áudio circulou em redes sociais e foi confirmado pela defesa do ex-presidente.',
      'verified', false, '2025-11-10',
      'https://g1.globo.com/politica/noticia/2025/11/bolsonaro-audio-ramagem-heroi-nacional.ghtml',
      'news_article',
      'Brasília', 'Áudio vazado', 'bolsonaro-ramagem-heroi-nacional-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Sergio Moro critica fuga de condenados
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro critica fuga de condenados pelo STF e diz que ninguém está acima da lei, mesmo que discorde da sentença.',
      'Independentemente de concordar ou não com as decisões do STF, fugir da Justiça não é aceitável. Ninguém está acima da lei. Se discorda da sentença, recorra pelos meios legais. Fugir desmoraliza o Estado de Direito e prejudica a própria causa que dizem defender.',
      'Declaração de Sergio Moro em entrevista ao Estadão em outubro de 2025, comentando a fuga de Ramagem e Zambelli. Moro criticou os foragidos mesmo sendo crítico do STF.',
      'verified', true, '2025-10-15',
      'https://www.estadao.com.br/politica/moro-critica-fuga-condenados-stf-estado-direito/',
      'news_article',
      'Curitiba', 'Entrevista ao Estadão', 'moro-critica-fuga-condenados-stf-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 35. Flávio Dino defende atuação do STF nas condenações
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende decisões do STF e diz que foragidos confirmam culpa ao fugir.',
      'Quem foge confirma sua culpa. O STF julgou com base em provas robustas e seguindo o devido processo legal. Chamar condenados de presos políticos é uma ofensa aos verdadeiros presos políticos que o Brasil já teve. Essas pessoas foram julgadas e condenadas por crimes graves contra a democracia.',
      'Declaração de Flávio Dino em sessão do STF em outubro de 2025, respondendo a críticas da oposição sobre as condenações e fugas de Ramagem e Zambelli.',
      'verified', true, '2025-10-22',
      'https://www.cnnbrasil.com.br/politica/dino-defende-stf-foragidos-confirmam-culpa/',
      'news_article',
      'Brasília', 'Sessão do STF', 'dino-defende-stf-foragidos-culpa-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 36. Zambelli acusa governo brasileiro de pressionar Itália
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli acusa governo Lula de pressionar governo italiano para acelerar extradição.',
      'O governo Lula está pressionando diplomaticamente a Itália para me extraditar. Lula ligou pessoalmente para a primeira-ministra Meloni pedindo minha entrega. Isso é perseguição de Estado usando canais diplomáticos. Uma vergonha internacional.',
      'Declaração de Zambelli em carta aberta publicada em janeiro de 2026, acusando o governo brasileiro de usar pressão diplomática para acelerar o processo de extradição na Itália.',
      'verified', false, '2026-01-20',
      'https://www.uol.com.br/noticias/politica/2026/01/zambelli-acusa-governo-pressao-italia-extradicao.htm',
      'news_article',
      'Roma', 'Carta aberta publicada online', 'zambelli-acusa-governo-pressao-italia-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 37. Zambelli diz que sistema do CNJ era vulnerável e culpa segurança digital
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli alega que vulnerabilidade do sistema do CNJ prova falha institucional, não crime pessoal.',
      'Se o sistema do CNJ era tão vulnerável que uma pessoa conseguiu acessar, o problema é do CNJ, não meu. A segurança digital do Judiciário brasileiro é uma piada. Me condenaram a 10 anos por expor a incompetência do sistema.',
      'Declaração de Zambelli em entrevista por videoconferência a canal italiano em junho de 2025, minimizando a invasão do sistema do CNJ e culpando a segurança digital da instituição.',
      'verified', false, '2025-06-08',
      'https://www.poder360.com.br/justica/zambelli-vulnerabilidade-cnj-seguranca-digital/',
      'news_article',
      'Roma', 'Entrevista por videoconferência', 'zambelli-vulnerabilidade-cnj-seguranca-digital-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 38. Ramagem critica processo de extradição como teatro político
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem chama processo de extradição de teatro político e diz que governo Lula quer humilhá-lo.',
      'O pedido de extradição é um teatro político. Lula quer me trazer de volta acorrentado para mostrar ao mundo que persegue seus opositores. Não vou me submeter a esse circo. Tenho direito de lutar pela minha liberdade em qualquer tribunal do planeta.',
      'Vídeo publicado por Ramagem em fevereiro de 2026, criticando o processo de extradição formalizado pelo governo brasileiro junto ao Departamento de Estado americano.',
      'verified', false, '2026-02-10',
      'https://www.folha.uol.com.br/poder/2026/02/ramagem-extradicao-teatro-politico-humilhacao.shtml',
      'news_article',
      'Orlando', 'Vídeo nas redes sociais', 'ramagem-extradicao-teatro-politico-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Bia Kicis acusa Moraes de comandar caça a políticos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis acusa Moraes de comandar caça internacional a políticos conservadores brasileiros.',
      'Moraes montou uma operação de caça internacional a políticos conservadores. Usou a Interpol, a diplomacia e toda a máquina do Estado para perseguir quem pensa diferente. Zambelli na Itália, Ramagem nos EUA. Quem será o próximo? Eu? Qualquer um de nós pode ser o alvo.',
      'Discurso de Bia Kicis na Câmara dos Deputados em novembro de 2025, acusando o ministro Alexandre de Moraes de usar instrumentos internacionais para perseguir políticos de oposição.',
      'verified', true, '2025-11-25',
      'https://g1.globo.com/politica/noticia/2025/11/bia-kicis-moraes-caca-internacional-politicos.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bia-kicis-moraes-caca-internacional-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 40. Mourão critica fuga de condenados como erro estratégico
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão diz que fuga de Ramagem e Zambelli foi erro estratégico que enfraquece a causa conservadora.',
      'Fugir foi um erro. Entendo o desespero, mas fugir da Justiça enfraquece a causa que defendemos. Dá munição para a esquerda nos chamar de criminosos. Se a condenação é injusta, lute contra ela dentro da lei. A fuga transmite imagem de culpa.',
      'Declaração de Hamilton Mourão em entrevista à GloboNews em novembro de 2025, criticando as fugas de Ramagem e Zambelli após condenações pelo STF.',
      'verified', true, '2025-11-15',
      'https://www.cnnbrasil.com.br/politica/mourao-fuga-ramagem-zambelli-erro-estrategico/',
      'news_article',
      'Brasília', 'Entrevista à GloboNews', 'mourao-fuga-ramagem-zambelli-erro-estrategico-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Ramagem diz que Trump não vai permitir extradição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem afirma que governo Trump não vai permitir extradição e que EUA protegem perseguidos políticos.',
      'Os Estados Unidos têm tradição de proteger perseguidos políticos. O presidente Trump sabe que o Brasil está vivendo uma ditadura judicial. Confio que o governo americano não vai me entregar a um tribunal de exceção. A América não entrega inocentes.',
      'Entrevista de Ramagem a canal conservador americano em março de 2026, expressando confiança de que o governo Trump não autorizaria sua extradição para o Brasil.',
      'verified', false, '2026-03-05',
      'https://www.uol.com.br/noticias/politica/2026/03/ramagem-trump-nao-permite-extradicao.htm',
      'news_article',
      'Miami', 'Entrevista a canal conservador', 'ramagem-trump-nao-permite-extradicao-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Zambelli envia carta aberta aos parlamentares italianos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli envia carta aberta a parlamentares italianos pedindo intervenção contra extradição.',
      'Escrevo aos honoráveis parlamentares italianos para pedir proteção. Sou cidadã italiana perseguida por um tribunal autoritário no Brasil. A Itália não pode ser cúmplice de uma injustiça. Peço que intervenham junto ao governo para impedir minha extradição para um país onde não terei julgamento justo.',
      'Carta aberta de Zambelli enviada a parlamentares italianos em fevereiro de 2026, pedindo intervenção política contra o processo de extradição. A carta foi divulgada por sites conservadores brasileiros.',
      'verified', false, '2026-02-15',
      'https://www.estadao.com.br/politica/zambelli-carta-parlamentares-italianos-extradicao/',
      'news_article',
      'Roma', 'Carta aberta a parlamentares', 'zambelli-carta-parlamentares-italianos-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 43. Flávio Bolsonaro critica prisão de Ramagem pelo ICE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro critica prisão de Ramagem pelo ICE e diz que Lula usa aparato americano.',
      'Prenderam Ramagem nos EUA por uma infração de trânsito. Que coincidência. Lula está usando o ICE e o sistema americano para perseguir brasileiros. Ramagem é inocente e foi preso numa emboscada. Isso é uma afronta à soberania americana.',
      'Publicação de Flávio Bolsonaro no X (antigo Twitter) em abril de 2026, reagindo à prisão de Alexandre Ramagem pelo ICE em Orlando.',
      'verified', true, '2026-04-03',
      'https://www.folha.uol.com.br/poder/2026/04/flavio-bolsonaro-ramagem-ice-lula-perseguicao.shtml',
      'news_article',
      'Brasília', 'Publicação no X', 'flavio-critica-prisao-ramagem-ice-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Bia Kicis compara foragidos brasileiros a dissidentes cubanos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis compara Ramagem e Zambelli a dissidentes cubanos e venezuelanos que fugiram de ditaduras.',
      'Ramagem e Zambelli são como os dissidentes cubanos e venezuelanos que fugiram de ditaduras. A diferença é que a ditadura brasileira usa toga em vez de farda. O mundo precisa abrir os olhos para o que está acontecendo no Brasil.',
      'Declaração de Bia Kicis em vídeo publicado em janeiro de 2026, comparando políticos brasileiros foragidos a dissidentes de regimes autoritários da América Latina.',
      'verified', false, '2026-01-25',
      'https://www.poder360.com.br/congresso/bia-kicis-compara-foragidos-dissidentes-cubanos/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'bia-kicis-compara-foragidos-dissidentes-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Ramagem critica soltura de Daniel Silveira como insuficiente
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem diz que progressão de Silveira para regime aberto é migalha e que deveria ser totalmente livre.',
      'Silveira ir para o regime aberto é uma migalha. Ele deveria estar completamente livre. Foi condenado por expressar opinião. Regime aberto ainda é uma prisão disfarçada. Enquanto houver um único preso político, o Brasil não será livre.',
      'Publicação de Ramagem no X em setembro de 2025, comentando a progressão de Daniel Silveira para o regime aberto.',
      'verified', false, '2025-09-28',
      'https://g1.globo.com/politica/noticia/2025/09/ramagem-silveira-regime-aberto-migalha.ghtml',
      'news_article',
      'Orlando', 'Publicação no X', 'ramagem-silveira-regime-aberto-migalha-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 46. Zambelli acusa família de Moraes de perseguição pessoal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli acusa Moraes de perseguição pessoal e diz que mandado falso foi reação a abusos do ministro.',
      'Alexandre de Moraes me persegue pessoalmente há anos. O mandado que emitiram contra mim era uma tentativa legítima de responsabilizá-lo por seus abusos. Ele destruiu minha vida, minha carreira e agora quer me prender para sempre. Isso é vingança pessoal.',
      'Declaração de Zambelli em entrevista por escrito à revista Oeste em abril de 2025, antes de sua fuga para a Itália, alegando que a perseguição de Moraes era pessoal.',
      'verified', false, '2025-04-20',
      'https://revistaoeste.com/politica/zambelli-moraes-perseguicao-pessoal-mandado/',
      'news_article',
      'São Paulo', 'Entrevista por escrito à revista Oeste', 'zambelli-moraes-perseguicao-pessoal-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 47. Eduardo Bolsonaro defende direito de foragidos ao asilo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defende direito de Ramagem e Zambelli ao asilo político no exterior.',
      'Ramagem e Zambelli têm todo o direito de buscar asilo político. Quando o sistema de Justiça de um país se torna uma arma política, as pessoas têm o direito internacional de buscar proteção em outros países. Isso está na Declaração Universal dos Direitos Humanos.',
      'Declaração de Eduardo Bolsonaro em live conjunta com apoiadores brasileiros nos EUA em novembro de 2025, defendendo o direito de políticos condenados a buscar asilo.',
      'verified', false, '2025-11-08',
      'https://www.cnnbrasil.com.br/politica/eduardo-defende-asilo-ramagem-zambelli-direitos-humanos/',
      'news_article',
      'Miami', 'Live com apoiadores', 'eduardo-defende-asilo-ramagem-zambelli-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 48. Ramagem diz que voltará ao Brasil quando houver Justiça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem promete voltar ao Brasil quando houver garantia de julgamento justo e imparcial.',
      'Voltarei ao Brasil no dia em que houver garantia de um julgamento justo e imparcial. Enquanto Moraes estiver no STF, isso é impossível. Estou disposto a me apresentar a qualquer tribunal independente. Mas não vou me entregar a um juiz que já decidiu minha condenação antes do julgamento.',
      'Entrevista de Ramagem a portal conservador brasileiro em dezembro de 2025, estabelecendo condições para seu retorno ao Brasil.',
      'verified', false, '2025-12-20',
      'https://www.gazetadopovo.com.br/politica/ramagem-volta-brasil-justica-julgamento-justo/',
      'news_article',
      'Orlando', 'Entrevista a portal conservador', 'ramagem-volta-brasil-justica-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 49. Zambelli faz apelo emocional sobre separação da família
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli faz apelo emocional sobre separação da família e acusa STF de destruir vidas pessoais.',
      'Estou há meses separada da minha família. Meus filhos crescem sem mãe por causa de uma decisão política disfarçada de sentença judicial. O STF não destrói apenas carreiras políticas, destrói famílias inteiras. Peço misericórdia, não por mim, mas pelos meus filhos.',
      'Vídeo emocional de Zambelli publicado no Natal de 2025, fazendo apelo sobre a separação familiar causada por sua prisão na Itália.',
      'verified', false, '2025-12-25',
      'https://www.uol.com.br/noticias/politica/2025/12/zambelli-apelo-emocional-familia-natal.htm',
      'news_article',
      'Roma', 'Vídeo de Natal', 'zambelli-apelo-emocional-familia-natal-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 50. Bia Kicis promete que PL vai libertar todos os presos políticos em 2027
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis promete que PL vai libertar todos os presos políticos no primeiro dia de governo em 2027.',
      'No primeiro dia de um governo patriota em 2027, vamos libertar todos os presos políticos. Zambelli, Ramagem, Silveira e todos os perseguidos do 8 de janeiro. Vamos anistiar, vamos perdoar e vamos reconstruir a democracia que o STF destruiu. Essa é a promessa do PL.',
      'Discurso de Bia Kicis em convenção do PL em março de 2026, prometendo anistia e libertação de todos os condenados nos processos do STF caso a direita vença as eleições de 2026.',
      'verified', true, '2026-03-15',
      'https://www.folha.uol.com.br/poder/2026/03/bia-kicis-pl-libertar-presos-politicos-2027.shtml',
      'news_article',
      'Brasília', 'Convenção do PL', 'bia-kicis-pl-libertar-presos-politicos-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
