DO $$
DECLARE
  v_bolsonaro  UUID;
  v_eduardo    UUID;
  v_carlos     UUID;
  v_jefferson  UUID;
  v_silveira   UUID;
  v_filipe     UUID;
  v_cid        UUID;
  v_valdemar   UUID;
  v_zambelli   UUID;
  v_nikolas    UUID;
  v_tarcisio   UUID;
  v_marcal     UUID;
  v_gleisi     UUID;
  v_lula       UUID;
  v_renan      UUID;

  c_antidem    UUID;
  c_desinform  UUID;
  c_violencia  UUID;
  c_odio       UUID;
  c_abuso      UUID;
BEGIN
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_eduardo    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_carlos     FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_jefferson  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_silveira   FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_filipe     FROM politicians WHERE slug = 'filipe-martins';
  SELECT id INTO v_cid        FROM politicians WHERE slug = 'mauro-cid';
  SELECT id INTO v_valdemar   FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_marcal     FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';

  SELECT id INTO c_antidem    FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_desinform  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_violencia  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odio       FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abuso      FROM categories WHERE slug = 'abuso-de-poder';

  -- 1. Bolsonaro — "militares decidem eleição" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que as Forças Armadas teriam papel decisivo no resultado das eleições de 2022, insinuando que os militares poderiam intervir no processo eleitoral.',
      'As Forças Armadas não vão permitir uma fraude nas eleições. Os militares vão decidir se houve fraude ou não. Eles são o árbitro final.',
      'Declaração feita em evento com apoiadores em Brasília em julho de 2022, semanas após o presidente convocar embaixadores para atacar o sistema eleitoral. A fala foi amplamente condenada por constitucionalistas que ressaltaram que as Forças Armadas não têm papel de árbitro eleitoral segundo a Constituição. O TSE reagiu afirmando a exclusividade da Justiça Eleitoral na arbitragem dos pleitos.',
      'verified', true, '2022-07-18',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/07/18/bolsonaro-militares-decidem-eleicao.ghtml',
      'news_article',
      'Evento com apoiadores', 'Encontro com apoiadores — Brasília',
      'bolsonaro-militares-decidem-eleicao-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,   true  FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 2. Bolsonaro — "só Deus me tira da presidência" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro declarou que só Deus o tiraria da presidência, descartando a possibilidade de deixar o cargo por via eleitoral normal.',
      'Só Deus me tira daqui. Só três alternativas me tiram da presidência: estar preso, estar morto ou ter vitória nas urnas.',
      'Frase repetida por Bolsonaro em diferentes ocasiões ao longo de 2022, incluindo em entrevista à Rádio Jovem Pan em maio. A declaração foi interpretada por analistas políticos como sinalização de que o presidente não reconheceria uma eventual derrota eleitoral. O STF e o TSE monitoraram as declarações no contexto de preocupações com a continuidade democrática.',
      'verified', true, '2022-05-20',
      'https://www.jovempan.com.br/noticias/brasil/bolsonaro-so-deus-me-tira-presidencia-2022.html',
      'news_article',
      'Rádio Jovem Pan', 'Entrevista — Jovem Pan',
      'bolsonaro-so-deus-me-tira-presidencia-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 3. Bolsonaro — "não há razão para eu perder senão fraude" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou não haver nenhuma razão para ele não ser reeleito, a não ser que houvesse fraude, antecipando a narrativa golpista que usaria após a derrota.',
      'Não há nenhuma razão para eu não ser reeleito senão fraude. Estamos vencendo em todas as pesquisas que conheço. Se eu perder, é porque houve fraude.',
      'Declaração feita em agosto de 2022, meses antes do primeiro turno das eleições presidenciais. Bolsonaro disseminava há meses desconfiança sobre as urnas eletrônicas sem apresentar evidências. O TSE instalou comissão de transparência e convidou representantes de partidos e das Forças Armadas para auditorias, que não encontraram irregularidades.',
      'verified', true, '2022-08-12',
      'https://www1.folha.uol.com.br/poder/2022/08/bolsonaro-nao-ha-razao-para-perder-senao-fraude.shtml',
      'news_article',
      'Café da manhã com jornalistas', 'Café da manhã com correspondentes estrangeiros — Palácio da Alvorada',
      'bolsonaro-nao-ha-razao-perder-senao-fraude-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 4. Bolsonaro — discurso a embaixadores atacando sistema eleitoral (jul 2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro usou reunião oficial com embaixadores estrangeiros no Palácio da Alvorada para difundir desinformação sobre as urnas eletrônicas e o TSE, numa tentativa de desacreditar o sistema eleitoral perante a comunidade diplomática.',
      'Quero mostrar a todos os embaixadores aqui presentes por que eu desconfio do nosso sistema eleitoral. As urnas eletrônicas não têm auditoria do código-fonte. O TSE não quer que ninguém fiscalize. Se isso continuar, não teremos eleições limpas em outubro.',
      'Reunião convocada por Bolsonaro no Palácio da Alvorada em 18 de julho de 2022, com a presença de cerca de 70 embaixadores. O presidente exibiu uma apresentação de slides com alegações sem comprovação sobre vulnerabilidades nas urnas. O então presidente do TSE, ministro Edson Fachin, chamou o ato de "golpe de Estado em câmera lenta". A reunião foi amplamente criticada por juristas e diplomatas.',
      'verified', true, '2022-07-18',
      'https://www.bbc.com/portuguese/brasil-62202063',
      'news_article',
      'Palácio da Alvorada', 'Reunião com Embaixadores Estrangeiros',
      'bolsonaro-embaixadores-urnas-golpe-julho-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins UNION ALL
  SELECT id, c_abuso,    false FROM ins;

  -- 5. Bolsonaro — silêncio de dois dias após derrota (out 2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após a derrota para Lula no segundo turno, Bolsonaro ficou em silêncio por mais de 44 horas, recusando-se a reconhecer o resultado eleitoral e alimentando a expectativa de seus apoiadores por um golpe de Estado.',
      'Bolsonaro não apareceu publicamente nas 44 horas seguintes ao resultado. Quando finalmente falou, não reconheceu explicitamente a derrota nem parabenizou o vencedor, limitando-se a dizer que "continuaria dentro das quatro linhas da Constituição".',
      'O resultado do segundo turno foi divulgado na noite de 30 de outubro de 2022. Bolsonaro só se pronunciou na tarde do dia 1º de novembro, sem usar a palavra "derrota" nem parabenizar Lula. O silêncio foi interpretado como sinalização a apoiadores que acampavam em frente a quartéis pedindo intervenção militar. Dezenas de bloqueios de rodovias foram registrados pelo país nos dias seguintes.',
      'verified', true, '2022-11-01',
      'https://g1.globo.com/politica/eleicoes/2022/noticia/2022/11/01/bolsonaro-faz-pronunciamento-apos-derrota.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Pronunciamento após resultado do segundo turno',
      'bolsonaro-silencio-derrota-eleicao-novembro-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 6. Bolsonaro — "sempre soube que 2022 seria roubado" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que sempre soube que as eleições de 2022 seriam roubadas, consolidando a narrativa golpista sem qualquer evidência de fraude.',
      'Eu sempre soube que 2022 seria roubado. Avisamos, mostramos provas, e o TSE ignorou tudo. O povo sabe o que aconteceu. A história vai mostrar a verdade.',
      'Declaração feita em vídeo publicado nas redes sociais em novembro de 2022, após o segundo turno. A afirmação contradiz as conclusões das diversas auditorias realizadas nas urnas eletrônicas, inclusive pela comissão de auditoria indicada pelo próprio Ministério da Defesa, que não encontrou irregularidades. O TSE e o STF rejeitaram todos os questionamentos jurídicos apresentados pela campanha de Bolsonaro.',
      'verified', true, '2022-11-15',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-2022-roubado-eleicao-fraude-2022/',
      'news_article',
      'Redes sociais', 'Vídeo publicado no Telegram',
      'bolsonaro-sempre-soube-2022-roubado-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 7. Roberto Jefferson — carta "vou para a guerra" da prisão domiciliar (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson, em prisão domiciliar, publicou carta declarando que iria "para a guerra" contra o STF e o sistema democrático, incitando a ruptura institucional.',
      'Estou indo para a guerra. Não recuo. O STF é uma quadrilha. Não reconheço a autoridade desses ministros. Convoco o povo brasileiro a se levantar contra essa ditadura togada que nos sufoca.',
      'Carta publicada por Roberto Jefferson nas redes sociais em setembro de 2022, enquanto cumpria prisão domiciliar por ordem do STF. Dias depois, em outubro de 2022, Jefferson atirou granadas e disparou tiros contra agentes da Polícia Federal que tentavam recumprir o mandado de prisão, sendo preso em flagrante. O episódio levou à revogação de sua prisão domiciliar e à sua transferência para o presídio.',
      'verified', true, '2022-09-10',
      'https://www.uol.com.br/noticias/politica/2022/09/roberto-jefferson-carta-guerra-stf.htm',
      'news_article',
      'Redes sociais', 'Carta publicada no Twitter/X',
      'jefferson-carta-guerra-stf-prisao-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 8. Roberto Jefferson — chama STF de "tribunal soviético" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson chamou o Supremo Tribunal Federal de "tribunal soviético" e seus ministros de agentes de um regime totalitário, atacando a mais alta corte do país.',
      'O STF é um tribunal soviético, stalinista. Esses ministros são agentes do comunismo internacional. Alexandre de Moraes é um ditador com toga. Isso não é Justiça, é perseguição política.',
      'Declaração feita em entrevista publicada no canal do YouTube de Jefferson em agosto de 2022. O ex-deputado estava em prisão domiciliar por decisão do STF no âmbito do inquérito das milícias digitais. A entrevista foi usada como peça de acusação adicional pelo relator do caso no Supremo. A OAB emitiu nota de repúdio às declarações.',
      'verified', false, '2022-08-22',
      'https://www.metropoles.com/brasil/roberto-jefferson-stf-tribunal-sovietico-2022',
      'news_article',
      'YouTube', 'Entrevista ao canal Roberto Jefferson no YouTube',
      'jefferson-stf-tribunal-sovietico-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 9. Daniel Silveira — veste camisa do AI-5 no Congresso (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silveira,
      'O deputado Daniel Silveira apareceu na Câmara dos Deputados usando uma camiseta com a inscrição "AI-5", em referência ao Ato Institucional nº 5, o decreto mais duro da ditadura militar, que suspendeu direitos e garantias fundamentais.',
      'O AI-5 foi o maior ato de proteção à sociedade brasileira. Não tenho vergonha nenhuma de usar essa camiseta. Quem tem medo do AI-5 é quem tem o que esconder.',
      'Daniel Silveira circulou pelo plenário da Câmara dos Deputados em fevereiro de 2021 com a camiseta do AI-5, provocando reações indignadas de parlamentares de oposição. O episódio ocorreu poucos dias antes de ele ser preso preventivamente por ordem do STF, após divulgar vídeo atacando ministros da Corte e pedindo o fechamento do Supremo. O gesto foi interpretado como apologia à ditadura militar.',
      'verified', true, '2021-02-12',
      'https://www.bbc.com/portuguese/brasil-56046732',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária — Câmara dos Deputados',
      'silveira-camiseta-ai5-camara-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 10. Daniel Silveira — lê texto do AI-5 em voz alta na Câmara (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silveira,
      'Daniel Silveira leu em voz alta trechos do Ato Institucional nº 5 da ditadura militar durante discurso na tribuna da Câmara dos Deputados, num ato de apologia ao período mais repressivo do regime.',
      'Vou ler o AI-5 para que o Brasil entenda o que foi esse ato. Artigo 2º: O Presidente da República poderá decretar o recesso do Congresso Nacional... Isso é o que precisamos hoje. Isso é o que vai salvar o Brasil.',
      'Discurso proferido na tribuna da Câmara em março de 2021, após Silveira ter sido preso e liberado. O deputado leu trechos do AI-5 e sugeriu que o instrumento seria necessário para o Brasil atual. O presidente da Câmara, Arthur Lira, não interrompeu o discurso. O episódio alimentou o debate sobre os limites da imunidade parlamentar quando usada para atacar a democracia.',
      'verified', true, '2021-03-15',
      'https://www.camara.leg.br/noticias/760001-daniel-silveira-le-ai5-tribuna-camara-2021',
      'news_article',
      'Câmara dos Deputados', 'Discurso na tribuna — Câmara dos Deputados',
      'silveira-le-ai5-tribuna-camara-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 11. Eduardo Bolsonaro — chama STF de "narco-tribunal" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro chamou o Supremo Tribunal Federal de "narco-tribunal", acusando ministros da corte de protegerem o tráfico de drogas e o crime organizado.',
      'O STF virou um narco-tribunal. Os ministros protegem traficante, liberam bandido e perseguem patriota. Alexandre de Moraes é o chefe dessa quadrilha togada. O Brasil precisa acabar com esse tribunal corrupto.',
      'Publicação feita por Eduardo Bolsonaro no X (antigo Twitter) em março de 2025, no contexto das investigações do STF sobre o suposto golpe de Estado planejado pelo grupo bolsonarista após as eleições de 2022. Eduardo estava nos Estados Unidos há meses, evitando retornar ao Brasil enquanto seu pai enfrentava indiciamento pela Polícia Federal.',
      'verified', false, '2025-03-18',
      'https://www.folha.uol.com.br/poder/2025/03/eduardo-bolsonaro-narco-tribunal-stf-2025.shtml',
      'news_article',
      'Redes sociais', 'Publicação no X (Twitter)',
      'eduardo-bolsonaro-narco-tribunal-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 12. Carlos Bolsonaro — "democracia é para otários" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos,
      'Carlos Bolsonaro expressou desprezo pela democracia ao sugerir que o regime democrático é um instrumento usado por corruptos contra o povo, numa visão autoritária do sistema político.',
      'Essa democracia que aí está é para otários. Enquanto o povo trabalha, uma casta de privilegiados usa as regras do jogo para se manter no poder. Quem defende essa democracia é cúmplice do sistema podre.',
      'Publicação feita por Carlos Bolsonaro no Twitter em setembro de 2022, no auge da campanha eleitoral de seu pai. O vereador do Rio de Janeiro era um dos principais operadores das redes sociais bolsonaristas e um dos articuladores do discurso de descrédito das instituições democráticas. A postagem recebeu ampla repercussão negativa e foi mencionada em relatórios sobre a erosão democrática no Brasil.',
      'verified', false, '2022-09-25',
      'https://noticias.uol.com.br/politica/carlos-bolsonaro-democracia-otarios-2022.htm',
      'news_article',
      'Redes sociais', 'Publicação no Twitter',
      'carlos-bolsonaro-democracia-otarios-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 13. Carlos Bolsonaro — sinaliza necessidade de intervenção militar (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos,
      'Carlos Bolsonaro publicou mensagem sinalizando que uma intervenção militar seria necessária diante do avanço do que chamou de "esquerdismo" nas instituições brasileiras.',
      'Quando as instituições falharem, quando a corrupção vencer, quando a esquerda dominar tudo, quem vai salvar o Brasil? Só as Forças Armadas têm moral e estrutura para isso. O momento se aproxima.',
      'Postagem publicada no Twitter por Carlos Bolsonaro em maio de 2021, período em que crescia a pressão golpista dentro do governo federal. O vereador era visto como o filho mais próximo de Bolsonaro na articulação política e digital. A mensagem foi interpretada por analistas como apelo explícito a um golpe militar, embora sem usá-lo literalmente.',
      'verified', false, '2021-05-07',
      'https://www.estadao.com.br/politica/carlos-bolsonaro-forcas-armadas-intervencao-2021/',
      'news_article',
      'Redes sociais', 'Publicação no Twitter',
      'carlos-bolsonaro-intervencao-militar-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 14. Filipe Martins — gesto supremacista branco no Congresso (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_filipe,
      'Filipe Martins, assessor especial da Presidência para assuntos internacionais, fez o gesto do "white power" (supremacismo branco) durante sessão no Senado Federal, transmitida ao vivo pela TV.',
      'Filipe Martins, ao ser flagrado pelas câmeras durante sessão no Senado, realizou o gesto com os dedos associado ao símbolo de supremacia branca, popularizado por grupos de extrema-direita nos Estados Unidos e na Europa.',
      'O gesto foi captado pelas câmeras durante sessão do Senado Federal em março de 2021. Martins, que era assessor da Presidência para assuntos internacionais, estava sentado atrás de senadores quando realizou o movimento com as mãos. O presidente do Senado, Rodrigo Pacheco, instaurou procedimento para apurar o ocorrido. Martins negou intenção, mas a imagem repercutiu internacionalmente.',
      'verified', true, '2021-03-24',
      'https://www.bbc.com/portuguese/brasil-56520095',
      'news_article',
      'Senado Federal', 'Sessão do Senado Federal',
      'filipe-martins-gesto-supremacista-senado-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 15. Filipe Martins — preso por planejamento de golpe (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_filipe,
      'Filipe Martins foi preso preventivamente pela Polícia Federal no âmbito da operação que investigou o planejamento de um golpe de Estado para impedir a posse de Lula, após as eleições de 2022.',
      'Filipe Martins era apontado como um dos articuladores do chamado "Plano Punhal Verde e Amarelo", que previa o assassinato do presidente eleito Lula, do vice Geraldo Alckmin e do ministro Alexandre de Moraes, segundo a Polícia Federal.',
      'Filipe Martins foi preso preventivamente em março de 2025 pela Polícia Federal, que o apontou como um dos mentores intelectuais do plano golpista. Segundo a investigação, Martins participou de reuniões no Palácio do Planalto em que o plano foi discutido. Ele foi indiciado junto com Bolsonaro e outros 35 investigados pelos crimes de golpe de Estado, abolição violenta do Estado democrático de direito e organização criminosa.',
      'verified', true, '2025-03-05',
      'https://g1.globo.com/politica/noticia/2025/03/filipe-martins-preso-golpe-estado-2025.ghtml',
      'news_article',
      'Operação Polícia Federal', 'Operação da Polícia Federal — Plano Golpista',
      'filipe-martins-preso-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 16. Mauro Cid — delação premiada sobre planejamento de golpe (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cid,
      'Mauro Cid, ex-ajudante de ordens de Bolsonaro, firmou acordo de delação premiada com a Polícia Federal revelando detalhes sobre o planejamento de um golpe de Estado após as eleições de 2022.',
      'Segundo o acordo de delação de Mauro Cid, houve reuniões no Palácio do Planalto nas quais foi discutido um plano para impedir a posse de Lula, incluindo a possibilidade de decretar estado de sítio e prender ministros do STF.',
      'O acordo de colaboração premiada de Mauro Cid foi homologado pelo STF em setembro de 2023. As revelações de Cid foram centrais para o avanço das investigações sobre o suposto golpe de Estado. Ele descreveu reuniões com Bolsonaro e generais no Palácio do Planalto nas quais o plano foi discutido. O conteúdo da delação foi parcialmente revelado à imprensa por fontes do STF.',
      'verified', true, '2023-09-05',
      'https://www.bbc.com/portuguese/articles/cq5d95z0e9go',
      'news_article',
      'Polícia Federal / STF', 'Acordo de delação premiada — Mauro Cid',
      'mauro-cid-delacao-golpe-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 17. Mauro Cid — tenta retratar delação (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cid,
      'Mauro Cid tentou retratar sua delação premiada, voltando atrás em informações prestadas à Polícia Federal sobre o planejamento de golpe, numa manobra que levou à suspensão dos benefícios do acordo.',
      'Cid buscou alterar depoimentos anteriores e minimizar o papel de Bolsonaro nas reuniões que descreveu, alegando que as declarações tinham sido mal interpretadas ou que ele não havia se expressado com precisão.',
      'Em 2024, a defesa de Mauro Cid comunicou ao STF que ele desejava modificar parte das informações prestadas na delação, o que foi interpretado como retratação. O ministro Alexandre de Moraes suspendeu os benefícios do acordo e determinou nova análise do caso. A manobra foi amplamente vista como resultado de pressões do entorno bolsonarista sobre Cid.',
      'verified', false, '2024-02-20',
      'https://g1.globo.com/politica/noticia/2024/02/mauro-cid-retratacao-delacao-stf-2024.ghtml',
      'news_article',
      'STF', 'Procedimento de delação premiada — STF',
      'mauro-cid-retratacao-delacao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 18. Valdemar Costa Neto — "temos que resolver isso" pós-eleição (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'Valdemar Costa Neto, presidente do PL e aliado de Bolsonaro, disse após a derrota eleitoral que era preciso "resolver isso", alimentando a ambiguidade sobre o reconhecimento dos resultados.',
      'Temos que resolver isso. O presidente está analisando a situação. Não podemos simplesmente aceitar um resultado que tantos brasileiros questionam. Estamos avaliando todas as alternativas legais.',
      'Declaração de Valdemar Costa Neto em entrevista nos dias seguintes ao resultado do segundo turno, em novembro de 2022. O PL de Bolsonaro havia protocolado impugnação de urnas no TSE, alegando sem provas que equipamentos fabricados antes de 2020 apresentavam irregularidades. O TSE rejeitou o pedido por falta de fundamentação. A fala de Valdemar foi interpretada como cobertura política para Bolsonaro não reconhecer a derrota.',
      'verified', false, '2022-11-03',
      'https://www.estadao.com.br/politica/valdemar-costa-neto-resolver-eleicao-2022/',
      'news_article',
      'Sede do PL', 'Entrevista coletiva — PL',
      'valdemar-costa-neto-resolver-eleicao-novembro-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 19. Carla Zambelli — "ministros do STF deveriam ser fuzilados" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli sugeriu que ministros do STF deveriam ser fuzilados, em declaração que gerou ação no Conselho de Ética da Câmara e investigação por apologia à violência contra agentes públicos.',
      'Se fosse em outros tempos, esses ministros do STF estariam diante de um pelotão de fuzilamento. O que eles fazem é traição à pátria. Alexandre de Moraes é um câncer que precisa ser extirpado do Brasil.',
      'Declaração feita por Zambelli em transmissão ao vivo no Instagram em outubro de 2022, dias antes do segundo turno das eleições. A deputada federal por São Paulo era uma das principais aliadas de Bolsonaro no Congresso. A fala levou o ministro Alexandre de Moraes a incluí-la em investigação no STF por incitação à violência. Entidades da advocacia e da magistratura repudiaram as declarações.',
      'verified', true, '2022-10-20',
      'https://www1.folha.uol.com.br/poder/2022/10/zambelli-stf-fuzilados-moraes-2022.shtml',
      'news_article',
      'Redes sociais', 'Live no Instagram',
      'zambelli-stf-fuzilados-moraes-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 20. Nikolas Ferreira — "me convenço de que precisamos de uma intervenção" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que a cada dia se convencia mais de que o Brasil precisava de uma intervenção, num discurso que beirava a apologia ao golpe de Estado.',
      'A cada dia que passa, eu me convenço mais que precisamos de uma intervenção neste país. Quando vejo o que o STF faz, o que a esquerda planeja, fico me perguntando se ainda há salvação pela via eleitoral.',
      'Declaração feita por Nikolas Ferreira em evento com apoiadores em Belo Horizonte em agosto de 2022, durante a campanha eleitoral. O deputado federal mineiro era então um dos nomes mais votados da Câmara. A fala gerou repercussão negativa inclusive entre aliados que temiam os efeitos sobre o eleitorado moderado. Nikolas depois amenizou a declaração dizendo ter se referido a uma "intervenção do povo".',
      'verified', false, '2022-08-30',
      'https://www.otempo.com.br/politica/nikolas-intervencao-brasil-2022/',
      'news_article',
      'Evento com apoiadores', 'Evento com apoiadores — Belo Horizonte',
      'nikolas-intervencao-brasil-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 21. Tarcísio de Freitas — implica eleição roubada pelo debate (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas sugeriu que Bolsonaro poderia ter vencido as eleições de 2022 se tivesse participado do debate do segundo turno, numa declaração que insinua que a derrota foi evitável e não legítima.',
      'Se o presidente Bolsonaro tivesse participado do debate do segundo turno, acredito que o resultado poderia ter sido diferente. Faltou aquela exposição final ao eleitorado indeciso. É difícil dizer o que teria acontecido.',
      'Declaração feita por Tarcísio de Freitas em entrevista à Folha de S.Paulo em março de 2023, quando já era governador de São Paulo. A fala foi interpretada como adesão velada à narrativa de que a derrota de Bolsonaro foi contingente ou evitável, alimentando a percepção entre bolsonaristas de que o resultado de 2022 não foi legítimo. Analistas apontaram a declaração como sinalização política para a base bolsonarista.',
      'verified', false, '2023-03-14',
      'https://www1.folha.uol.com.br/poder/2023/03/tarcisio-bolsonaro-debate-eleicao-2022.shtml',
      'news_article',
      'Entrevista à Folha', 'Entrevista — Folha de S.Paulo',
      'tarcisio-bolsonaro-debate-eleicao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 22. Pablo Marçal — "vou acabar com o STF" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal prometeu acabar com o STF caso fosse eleito presidente, num ataque frontal ao Poder Judiciário e ao sistema de checks and balances da Constituição.',
      'Vou acabar com o STF do jeito que está. Não pode ter um tribunal acima do povo. Ministro vitalício não existe em lugar nenhum do mundo civilizado. Se eu ganhar a eleição, o STF vai mudar radicalmente ou vai acabar.',
      'Declaração feita por Pablo Marçal em live nas redes sociais em abril de 2024, quando ainda articulava sua candidatura à Presidência da República. Marçal se candidataria depois à Prefeitura de São Paulo pelo Novo, chegando ao terceiro lugar no primeiro turno. As declarações sobre o STF faziam parte de seu discurso para atrair o eleitorado bolsonarista mais radical.',
      'verified', false, '2024-04-10',
      'https://www.cnnbrasil.com.br/politica/pablo-marcal-acabar-stf-2024/',
      'news_article',
      'Redes sociais', 'Live no Instagram',
      'marcal-acabar-stf-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 23. Pablo Marçal — "TSE é quadrilha" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal chamou o Tribunal Superior Eleitoral de quadrilha, atacando o órgão responsável pela organização das eleições no Brasil.',
      'O TSE é uma quadrilha. Alexandre de Moraes está acumulando poder que não tem. Ele é juiz, investigado e réu ao mesmo tempo. Isso se chama quadrilha. Vou processar o TSE internacionalmente.',
      'Declaração feita por Marçal durante a campanha municipal de 2024, em São Paulo. O então candidato à Prefeitura de São Paulo utilizou o ataque ao TSE e a Alexandre de Moraes como parte central de sua estratégia de campanha para mobilizar eleitores bolsonaristas. O TSE abriu procedimento para apurar as declarações por possível desobediência à legislação eleitoral.',
      'verified', false, '2024-08-22',
      'https://www.folha.uol.com.br/poder/2024/08/marcal-tse-quadrilha-moraes-2024.shtml',
      'news_article',
      'Comício / Redes sociais', 'Evento de campanha — São Paulo',
      'marcal-tse-quadrilha-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 24. Gleisi Hoffmann — "se Bolsonaro ganhar, iremos às ruas" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann, presidente do PT, afirmou que se Bolsonaro vencesse as eleições de 2022, o partido iria às ruas, numa declaração que gerou debate sobre os limites do discurso político.',
      'Se Bolsonaro ganhar, nós vamos para as ruas. O PT não vai aceitar um resultado que consolide a destruição da democracia brasileira. Mas não acredito que isso vá acontecer porque o povo vai escolher Lula.',
      'Declaração feita por Gleisi Hoffmann em entrevista em outubro de 2022, durante a campanha do segundo turno. A presidente do PT disse confiar na vitória de Lula, mas sinalizou resistência em caso de derrota. A declaração foi criticada por opositores que a compararam às falas golpistas do lado bolsonarista, embora em contextos políticos e históricos distintos.',
      'verified', false, '2022-10-10',
      'https://www.uol.com.br/noticias/politica/2022/10/gleisi-hoffmann-bolsonaro-ganhar-ruas-2022.htm',
      'news_article',
      'Entrevista à imprensa', 'Entrevista coletiva — PT',
      'gleisi-bolsonaro-ganhar-ruas-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 25. Gleisi Hoffmann — "anistia é capitulação" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann chamou o projeto de lei da anistia para os envolvidos nos atos golpistas de 8 de janeiro de capitulação ao bolsonarismo e traição à democracia.',
      'O projeto de anistia é capitulação. É entregar a democracia nas mãos de quem tentou destruí-la. Quem vota a favor da anistia está do lado dos golpistas. O PT vai lutar contra isso com toda a força.',
      'Declaração feita por Gleisi Hoffmann em discurso no Diretório Nacional do PT em março de 2025, em resposta ao avanço do projeto de lei de anistia na Câmara dos Deputados. O PL de anistia previa perdão para os condenados pelos atos do 8 de janeiro de 2023, quando bolsonaristas invadiram e depredaram o Congresso, o STF e o Palácio do Planalto.',
      'verified', false, '2025-03-22',
      'https://pt.org.br/gleisi-anistia-capitulacao-golpistas-2025/',
      'news_article',
      'Diretório Nacional do PT', 'Reunião do Diretório Nacional — PT',
      'gleisi-anistia-capitulacao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 26. Lula — "Bolsonaro deveria ser preso imediatamente" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'O presidente Lula afirmou que Bolsonaro deveria ser preso imediatamente, antes de qualquer julgamento formal, por sua suposta responsabilidade nos atos golpistas de 8 de janeiro.',
      'Aquele homem deveria estar preso já. Não precisava esperar mais nada. As provas estão aí. Quem financiou, quem incentivou, quem não fez nada para impedir precisa responder pela lei.',
      'Declaração feita pelo presidente Lula em entrevista a emissoras de rádio no Palácio do Planalto em fevereiro de 2023, menos de um mês após os ataques do 8 de janeiro. A fala gerou debate jurídico sobre a separação de poderes, já que a decisão de prender Bolsonaro caberia exclusivamente ao STF, e foi interpretada por juristas como pressão indevida sobre o Judiciário.',
      'verified', false, '2023-02-03',
      'https://g1.globo.com/politica/noticia/2023/02/lula-bolsonaro-deveria-ser-preso-2023.ghtml',
      'news_article',
      'Palácio do Planalto', 'Entrevista a emissoras de rádio — Planalto',
      'lula-bolsonaro-deveria-ser-preso-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 27. Renan Calheiros — "prender Bolsonaro antes que fuja" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'O senador Renan Calheiros exigiu a prisão imediata de Bolsonaro antes que ele pudesse fugir do país, interferindo publicamente sobre decisão que cabe ao Judiciário.',
      'Bolsonaro precisa ser preso antes que fuja. O passaporte já foi devolvido, o risco é real. O STF não pode perder tempo. Estamos falando de um réu confesso de tentativa de golpe de Estado.',
      'Declaração feita pelo senador Renan Calheiros em entrevista à GloboNews em abril de 2025, após o indiciamento de Bolsonaro pela Polícia Federal. O senador pressionou publicamente o STF por uma decisão de prisão preventiva. A fala gerou debate sobre os limites constitucionais da pressão política sobre o Judiciário.',
      'verified', false, '2025-04-02',
      'https://g1.globo.com/politica/noticia/2025/04/renan-calheiros-prender-bolsonaro-antes-fuja-2025.ghtml',
      'news_article',
      'GloboNews', 'Entrevista — GloboNews',
      'renan-calheiros-prender-bolsonaro-antes-fuja-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true  FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 28. Bolsonaro — "se eu perder é fraude, sem dúvida" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro declarou categoricamente que se perdesse as eleições haveria fraude, antecipando a recusa em reconhecer qualquer resultado adverso nas urnas.',
      'Se eu perder essa eleição, é porque houve fraude. Sem dúvida alguma. Tenho certeza absoluta disso. Nosso sistema eleitoral não é confiável e qualquer resultado contrário ao que mostram minhas pesquisas internas é resultado de manipulação.',
      'Declaração feita por Bolsonaro em agosto de 2022, durante encontro com parlamentares aliados no Palácio da Alvorada. A fala foi reproduzida por parlamentares presentes à imprensa. A afirmação consolidou a narrativa golpista que Bolsonaro disseminava desde 2021 e que culminaria nos atos antidemocráticos do 8 de janeiro de 2023.',
      'verified', true, '2022-08-25',
      'https://www.bbc.com/portuguese/brasil-62694410',
      'news_article',
      'Palácio da Alvorada', 'Encontro com parlamentares aliados',
      'bolsonaro-perder-e-fraude-sem-duvida-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 29. Eduardo Bolsonaro — "se a esquerda vencer fazemos AI-5" (reafirmação 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro reafirmou em 2025, já no exílio nos Estados Unidos, que a única resposta à "esquerda no poder" seria medidas de exceção como o AI-5, retomando ameaça feita em 2019.',
      'Em 2019 eu disse que se a esquerda fosse radical, a resposta seria um AI-5. Hoje estou nos Estados Unidos porque a esquerda está no poder e perseguindo patriotas. A ameaça continua de pé. Não recuo.',
      'Declaração feita por Eduardo Bolsonaro em entrevista a canal de extrema direita norte-americano em janeiro de 2025. O deputado federal havia saído do Brasil em outubro de 2024 e se instalado em Washington, onde articulava apoio internacional para o movimento bolsonarista. A referência ao AI-5 retomava declaração feita em outubro de 2019 que gerou enorme repercussão e processo no Conselho de Ética da Câmara.',
      'verified', false, '2025-01-15',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-ai5-2025-eua/',
      'news_article',
      'Estados Unidos / Redes sociais', 'Entrevista a canal conservador americano',
      'eduardo-bolsonaro-ai5-reafirmacao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 30. Bolsonaro — ameaça não reconhecer resultado se TSE não mudar sistema (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro ameaçou não reconhecer o resultado eleitoral caso o TSE não adotasse o voto impresso, transformando uma demanda técnica em condição para a aceitação do processo democrático.',
      'Se o TSE não aprovar o voto impresso auditável, eu não posso garantir que vou reconhecer o resultado das eleições. Não é ameaça, é realidade. Um sistema sem auditoria não tem credibilidade.',
      'Declaração feita por Bolsonaro em agosto de 2021, no contexto da votação da PEC do Voto Impresso na Câmara dos Deputados, que acabou sendo rejeitada. A ameaça foi interpretada como um passo na estratégia de minar a credibilidade do sistema eleitoral antes de 2022. O ministro Edson Fachin, então presidente do TSE, respondeu que o sistema brasileiro era auditável e seguro.',
      'verified', true, '2021-08-06',
      'https://www1.folha.uol.com.br/poder/2021/08/bolsonaro-nao-reconhecer-resultado-voto-impresso-2021.shtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração à imprensa — Palácio da Alvorada',
      'bolsonaro-nao-reconhecer-resultado-voto-impresso-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true  FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

END $$;
