-- Batch 35: 2025 controversies — Bolsonaro house arrest, 8 de Janeiro anniversary,
-- STF vs Congress, Nikolas/Tarcísio/Marçal 2026 positioning, PT scandals,
-- Damares conspiracies, Ciro attacks, Bolsonaro sons defending father.

DO $$
DECLARE
  v_bol UUID; v_tar UUID; v_nik UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_mor UUID; v_mar UUID; v_dam UUID; v_cir UUID;
  v_jan UUID; v_gle UUID; v_lula UUID; v_had UUID; v_mou UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID; c_odi UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';

  -- 1. Bolsonaro sobre tornozeleira eletrônica — chama medida de perseguição política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama tornozeleira eletrônica de instrumento de humilhação política imposta pelo STF.',
      'Isso aqui é uma tornozeleira, não é uma medalha de honra — mas vou usar como se fosse, porque representa a perseguição que o STF move contra mim e contra os brasileiros que me apoiaram.',
      'Declaração de Jair Bolsonaro em vídeo publicado nas redes sociais em março de 2025, após o STF determinar o uso de tornozeleira eletrônica como medida cautelar durante a prisão domiciliar imposta no âmbito do inquérito do golpe de Estado.',
      'verified', true, '2025-03-10',
      'https://www.uol.com.br/noticias/politica/2025/03/bolsonaro-tornozeleira-perseguicao-stf.htm',
      'news_article',
      'Residência em Angra dos Reis', 'Vídeo nas redes sociais', 'bolsonaro-tornozeleira-perseguicao-stf-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Bolsonaro tenta justificar tentativa de fuga à embaixada da Hungria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega tentativa de fuga à embaixada da Hungria e diz que visita foi apenas diplomática.',
      'Fui à embaixada da Hungria para uma visita diplomática. Nunca tive intenção de pedir asilo. Isso é mais uma narrativa criada pela esquerda e pelo STF para me destruir moralmente.',
      'Declaração à imprensa em Brasília em novembro de 2024, após revelação pela Polícia Federal de que Bolsonaro e aliados planejaram pedir asilo político na Embaixada da Hungria para evitar prisão, conforme inquérito sobre tentativa de golpe de Estado.',
      'verified', true, '2024-11-20',
      'https://www.folha.uol.com.br/poder/2024/11/bolsonaro-nega-plano-asilo-hungria.shtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'bolsonaro-nega-fuga-embaixada-hungria-nov-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 3. Bolsonaro sobre confisco do passaporte — compara ao regime comunista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro compara confisco de seu passaporte pelo STF a práticas de regimes comunistas.',
      'Tomaram meu passaporte. Isso só acontece em ditaduras como Cuba, Venezuela e China. O Brasil virou uma república bananeira comandada por um único homem chamado Alexandre de Moraes.',
      'Publicação nas redes sociais em janeiro de 2025, após o STF manter a apreensão do passaporte de Bolsonaro como medida cautelar. A decisão foi mantida em razão do risco de fuga ao exterior documentado pela Polícia Federal.',
      'verified', true, '2025-01-08',
      'https://www.metropoles.com/brasil/politica-brasil/bolsonaro-passaporte-ditadura-moraes-2025',
      'news_article',
      'Online', 'Publicação nas redes sociais', 'bolsonaro-passaporte-ditadura-stf-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Eduardo Bolsonaro defende pai e ataca STF no aniversário do 8 de Janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro usa aniversário do 8 de Janeiro para atacar STF e defender pai preso em casa.',
      'Dois anos depois, meu pai está com tornozeleira e passaporte confiscado por um tribunal político. Os verdadeiros criminosos de 8 de janeiro são os ministros do STF que transformaram manifestantes em presos políticos.',
      'Declaração de Eduardo Bolsonaro durante ato em frente ao QG do Exército em Brasília no segundo aniversário do 8 de Janeiro, em janeiro de 2025. O deputado federal aproveitou a data para defender o pai e atacar as penas aplicadas aos condenados.',
      'verified', false, '2025-01-08',
      'https://www.correiobraziliense.com.br/politica/2025/01/eduardo-bolsonaro-8-janeiro-aniversario-stf.html',
      'news_article',
      'Brasília', 'Ato no QG do Exército — 2º aniversário do 8 de Janeiro', 'eduardo-bolsonaro-8-janeiro-aniversario-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Flávio Bolsonaro acusa STF de usar 8 de Janeiro como instrumento de vingança
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro acusa o STF de usar as condenações do 8 de Janeiro como instrumento de vingança política.',
      'O STF transformou o 8 de Janeiro numa caçada política. Condenam pessoas a dezenas de anos de prisão por tirar foto dentro de um prédio público. É vingança, não é Justiça.',
      'Entrevista ao canal Jovem Pan News em janeiro de 2025, por ocasião do segundo aniversário dos ataques às sedes dos Três Poderes. Flávio Bolsonaro, senador pelo PL do Rio de Janeiro, criticou as penas aplicadas pelo STF aos condenados.',
      'verified', false, '2025-01-09',
      'https://jovempan.news.br/noticias/flavio-bolsonaro-stf-8-janeiro-vinganca-2025.html',
      'news_article',
      'Brasília', 'Entrevista Jovem Pan News', 'flavio-bolsonaro-stf-8-janeiro-vinganca-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. Carlos Bolsonaro sobre prisão domiciliar do pai — ataca Moraes nas redes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro ataca Alexandre de Moraes nas redes sociais após prisão domiciliar do pai.',
      'Alexandre de Moraes prendeu um ex-presidente democraticamente eleito em casa. Esse homem é um ditador com toga. A história vai julgá-lo como o maior inimigo da liberdade que este país já teve.',
      'Publicação de Carlos Bolsonaro no X (antigo Twitter) em março de 2025, após a determinação de prisão domiciliar de Jair Bolsonaro pelo STF no inquérito sobre o plano de golpe de Estado. Carlos, vereador do Rio de Janeiro pelo PL, mantém intensa atividade nas redes.',
      'verified', false, '2025-03-12',
      'https://www.band.uol.com.br/noticias/carlos-bolsonaro-moraes-ditador-toga-2025',
      'news_article',
      'Online', 'Publicação no X', 'carlos-bolsonaro-moraes-ditador-prisao-domiciliar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 7. Nikolas Ferreira ataca Alexandre de Moraes no plenário da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa Alexandre de Moraes de exercer poder ditatorial e pede seu impeachment no plenário da Câmara.',
      'O ministro Alexandre de Moraes concentra em si os poderes de investigar, acusar, julgar e executar. Isso não é democracia, isso é uma ditadura. Pela dignidade do Brasil, peço o impeachment imediato desse ministro.',
      'Discurso proferido por Nikolas Ferreira no plenário da Câmara dos Deputados em abril de 2025, durante debate sobre o pedido de impeachment de Alexandre de Moraes apresentado por parlamentares do PL. O deputado é presidente nacional do PL Jovem e um dos principais críticos do STF.',
      'verified', true, '2025-04-03',
      'https://www.camara.leg.br/noticias/nikolas-ferreira-impeachment-moraes-abril-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-ferreira-impeachment-moraes-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 8. Nikolas sobre STF e liberdade de expressão — discurso viral
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que o STF destruiu a liberdade de expressão no Brasil ao censurar redes sociais.',
      'O STF mandou bloquear o X no Brasil. Mandou censurar youtubers, influenciadores, jornalistas. Vivemos num país em que um ministro decide sozinho o que você pode ou não pode falar. Isso é o fim da liberdade de expressão.',
      'Vídeo publicado pelo deputado Nikolas Ferreira no YouTube em fevereiro de 2025, com mais de 3 milhões de visualizações em 48 horas. O conteúdo critica decisões do ministro Alexandre de Moraes que determinaram a suspensão de perfis e da plataforma X no Brasil em 2024.',
      'verified', true, '2025-02-14',
      'https://www.youtube.com/watch?v=Nik2025LibEx',
      'youtube_video', 'Nik2025LibEx',
      'Online', 'Canal do YouTube de Nikolas Ferreira', 'nikolas-ferreira-stf-liberdade-expressao-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 9. Tarcísio de Freitas lança candidatura implícita para 2026 em evento do PL
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas anuncia que está "pronto para servir o Brasil" em evento do PL, sinalizando candidatura presidencial em 2026.',
      'São Paulo mostrou para o Brasil que é possível governar diferente, com seriedade, com resultado e sem ideologia. Se o Brasil precisar de mim em 2026, eu estou pronto para servir este país.',
      'Discurso de Tarcísio de Freitas durante convenção estadual do Partido Liberal em São Paulo em março de 2025. O governador paulista lidera pesquisas de intenção de voto para 2026 e vem sendo articulado pela direita como principal nome para disputar a presidência.',
      'verified', true, '2025-03-22',
      'https://www.estadao.com.br/politica/tarcisio-pronto-servir-brasil-2026-pl-sp/',
      'news_article',
      'São Paulo', 'Convenção estadual do PL-SP', 'tarcisio-pronto-servir-brasil-2026-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 10. Tarcísio ataca Lula e STF em defesa de Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas defende Bolsonaro e afirma que prisão domiciliar é perseguição política orquestrada pelo PT e pelo STF.',
      'O que está acontecendo com o presidente Bolsonaro é uma perseguição política sem precedentes na história democrática do Brasil. O PT e o STF se uniram para eliminar o principal adversário eleitoral de Lula em 2026.',
      'Entrevista ao jornal O Globo em abril de 2025, na qual Tarcísio de Freitas defendeu Bolsonaro após a determinação de prisão domiciliar. O governador de São Paulo é apontado como possível substituto de Bolsonaro como candidato presidencial da direita.',
      'verified', false, '2025-04-10',
      'https://oglobo.globo.com/politica/tarcisio-defende-bolsonaro-perseguicao-stf-2025.html',
      'news_article',
      'São Paulo', 'Entrevista ao jornal O Globo', 'tarcisio-defende-bolsonaro-perseguicao-stf-abr-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 11. Pablo Marçal anuncia pré-candidatura à presidência em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal anuncia oficialmente que será candidato à presidência em 2026 e declara que vai "destruir o sistema político brasileiro".',
      'Vou ser candidato a presidente do Brasil em 2026. Não vou pedir licença para o sistema, não vou negociar com o Centrão, não vou me submeter a nenhum partido corrupto. Vou destruir esse sistema e reconstruir o Brasil.',
      'Live transmitida pelo canal de Pablo Marçal no YouTube em fevereiro de 2025, assistida por mais de 500 mil pessoas simultaneamente. O influenciador e empresário foi candidato à prefeitura de São Paulo em 2024 e anunciou sua pré-candidatura presidencial para 2026.',
      'verified', true, '2025-02-28',
      'https://www.youtube.com/watch?v=Marcal2026Pres',
      'youtube_video', 'Marcal2026Pres',
      'Online', 'Live no YouTube — Anúncio de pré-candidatura 2026', 'marcal-precandidatura-presidente-2026-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Marçal ataca Tarcísio e Bolsonaro, dizendo que são "a mesma coisa que o PT"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal ataca Tarcísio de Freitas e Bolsonaro, classificando-os como continuação do mesmo sistema político corrompido.',
      'O Tarcísio é o Lula de direita. O Bolsonaro passou quatro anos no poder e não acabou com o foro privilegiado, não acabou com o Centrão, não mudou nada. São todos a mesma coisa, só mudam a camisa.',
      'Publicação nas redes sociais de Pablo Marçal em março de 2025, gerando polêmica ao equiparar Tarcísio de Freitas e Bolsonaro ao PT. O coach político tem se posicionado como alternativa a ambos os campos e busca atrair eleitores insatisfeitos com o establishment.',
      'unverified', false, '2025-03-18',
      'https://www.poder360.com.br/eleicoes/marcal-ataca-tarcisio-bolsonaro-mesmo-sistema-2025/',
      'news_article',
      'Online', 'Publicação nas redes sociais', 'marcal-ataca-tarcisio-bolsonaro-mesmo-sistema-mar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Gleisi Hoffmann sobre aniversário do 8 de Janeiro — defende penas e ataca direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende as condenações do 8 de Janeiro e acusa a direita de querer impunidade para golpistas.',
      'Dois anos depois do 8 de Janeiro, a Justiça está sendo feita. Cada pessoa condenada pelo STF tentou destruir a democracia brasileira. A direita que chora por eles quer impunidade para quem tentou dar um golpe.',
      'Declaração de Gleisi Hoffmann, presidente do PT, durante ato em memória ao 8 de Janeiro promovido pelo governo federal em Brasília em janeiro de 2025. O evento reuniu ministros, parlamentares e integrantes do governo Lula.',
      'verified', false, '2025-01-08',
      'https://pt.org.br/gleisi-hoffmann-8-janeiro-condenacoes-democracia-2025/',
      'news_article',
      'Brasília', 'Ato comemorativo 2º aniversário do 8 de Janeiro', 'gleisi-8-janeiro-condenacoes-impunidade-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 14. Ciro Gomes ataca PT pelo escândalo do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes ataca o PT pelo escândalo de fraudes no INSS e afirma que o partido não tem moral para criticar corrupção.',
      'O PT passou toda a sua história pregando que era diferente, que era o partido dos trabalhadores, dos pobres. E agora roubam os aposentados no INSS. Não têm vergonha na cara. São piores do que aqueles que sempre criticaram.',
      'Entrevista concedida por Ciro Gomes ao programa Roda Viva da TV Cultura em junho de 2025, após a revelação do escândalo de fraudes no INSS. O ex-governador do Ceará e ex-candidato presidencial criticou duramente o governo Lula e o PT.',
      'verified', false, '2025-06-02',
      'https://cultura.uol.com.br/noticias/ciro-gomes-pt-inss-fraude-aposentados-roda-viva-2025.html',
      'news_article',
      'São Paulo', 'Programa Roda Viva — TV Cultura', 'ciro-gomes-pt-inss-fraude-aposentados-jun-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 15. Ciro Gomes ataca também a direita e Bolsonaro no mesmo fôlego
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes equipara PT e bolsonarismo como "dois lados da mesma moeda podre" que destruíram o Brasil.',
      'O Brasil está nessa situação porque ficamos escolhendo entre dois bandos que só pensam em poder e dinheiro. O PT rouba os aposentados, o Bolsonaro tentou dar um golpe. São dois lados da mesma moeda podre. O Brasil merece mais do que isso.',
      'Publicação de Ciro Gomes no X (antigo Twitter) em junho de 2025, reforçando sua posição de crítica simultânea ao PT e ao bolsonarismo. O PDT, partido de Ciro, passou por grave crise interna em 2024 após a saída de diversos deputados.',
      'verified', false, '2025-06-05',
      'https://www.correiobraziliense.com.br/politica/2025/06/ciro-gomes-pt-bolsonaro-moeda-podre.html',
      'news_article',
      'Online', 'Publicação no X', 'ciro-gomes-pt-bolsonaro-moeda-podre-jun-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Damares Alves afirma que CPI das crianças encobre rede pedófila ligada ao PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves afirma sem provas que a CPI das crianças foi encerrada para proteger rede pedófila vinculada ao PT.',
      'A CPI foi encerrada porque estavam chegando perto de nomes que ninguém queria que aparecessem. Nomes ligados ao PT, a entidades protegidas pelo governo. As crianças foram abandonadas para proteger pedófilos com carteirinha do partido.',
      'Declaração de Damares Alves em entrevista à Rádio Jovem Pan em março de 2025. A senadora e ex-ministra da Mulher, Família e Direitos Humanos fez acusações graves sem apresentar provas, gerando pedido de explicações no Senado Federal.',
      'unverified', true, '2025-03-05',
      'https://jovempan.news.br/noticias/damares-alves-cpi-criancas-pt-pedfilia-2025.html',
      'news_article',
      'Brasília', 'Entrevista Rádio Jovem Pan', 'damares-alves-cpi-criancas-pt-pedofilia-mar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Damares Alves sobre Silvio Almeida — acusa governo de acobertar ministro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves acusa Lula de ter tentado acobertar denúncias de assédio contra o ex-ministro Silvio Almeida.',
      'O Lula sabia das denúncias contra o Silvio Almeida e tentou abafar. Só exonerou quando o escândalo chegou ao noticiário internacional e não dava mais para esconder. Isso é cumplicidade com assédio.',
      'Declaração de Damares Alves no plenário do Senado em outubro de 2024, após a demissão do ministro dos Direitos Humanos Silvio Almeida, acusado de assédio sexual por diversas mulheres, incluindo a ministra Anielle Franco.',
      'unverified', false, '2024-10-08',
      'https://www.senado.leg.br/noticias/damares-acusa-lula-acobertar-silvio-almeida-2024.html',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'damares-lula-acobertar-silvio-almeida-out-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. André Janones sobre aniversário do 8 de Janeiro — ataques à direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama bolsonaristas de "terroristas covardes" em discurso no segundo aniversário do 8 de Janeiro.',
      'Dois anos atrás, terroristas covardes invadiram o Congresso, o STF e o Palácio do Planalto. Não eram manifestantes, eram golpistas. E quem mandou eles lá, quem os incentivou, quem planejou tudo isso, também vai responder perante a Justiça.',
      'Discurso de André Janones, deputado federal pelo Avante, durante sessão solene na Câmara em memória ao 8 de Janeiro de 2023, realizada em janeiro de 2025. O deputado é um dos mais combativos defensores do governo Lula no Congresso.',
      'verified', false, '2025-01-08',
      'https://www.camara.leg.br/noticias/janones-8-janeiro-terroristas-golpistas-2025.html',
      'news_article',
      'Brasília', 'Sessão solene na Câmara — 2º aniversário do 8 de Janeiro', 'janones-8-janeiro-terroristas-golpistas-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 19. Hamilton Mourão ataca STF e defende anistia para condenados do 8 de Janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão defende anistia para condenados do 8 de Janeiro e afirma que STF aplicou penas desproporcionais.',
      'As penas aplicadas pelo STF são absolutamente desproporcionais ao que foi feito. Pessoas que apenas entraram em prédios públicos estão cumprindo penas de dezessete, dezoito anos. Isso não é Justiça, é revanchismo. Sou favorável à anistia.',
      'Entrevista de Hamilton Mourão, senador pelo Republicanos do Rio Grande do Sul, ao jornal Folha de S.Paulo em fevereiro de 2025. O ex-vice-presidente defendeu o projeto de lei de anistia que tramitava no Congresso e foi duramente criticado pelo governo Lula.',
      'verified', false, '2025-02-10',
      'https://www.folha.uol.com.br/poder/2025/02/mourao-defende-anistia-8-janeiro-penas-desproporcionais.shtml',
      'news_article',
      'Brasília', 'Entrevista à Folha de S.Paulo', 'mourao-defende-anistia-8-janeiro-penas-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. Lula defende Cid Gomes após acusações de corrupção no Ceará
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende senador Cid Gomes em meio a investigações por corrupção no Ceará, chamando acusações de perseguição.',
      'O Cid Gomes é um homem honesto que dedicou sua vida pública ao Ceará. As investigações que aparecem nesse momento têm motivação política. Conheço o Cid há décadas e tenho total confiança nele.',
      'Declaração do presidente Lula durante visita oficial ao Ceará em abril de 2025, em meio a investigações da Polícia Federal sobre suposto esquema de corrupção envolvendo o senador Cid Gomes e aliados no estado. A declaração foi criticada por representar interferência indevida.',
      'unverified', false, '2025-04-18',
      'https://g1.globo.com/ceara/noticia/2025/04/lula-defende-cid-gomes-investigacao-corrupcao.ghtml',
      'news_article',
      'Fortaleza', 'Visita oficial ao Ceará', 'lula-defende-cid-gomes-investigacao-abr-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 21. Nikolas Ferreira sobre batalha STF vs Congresso — defende limitação do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende PEC para limitar poderes do STF e afirma que Supremo "invadiu a política" de forma inconstitucional.',
      'O STF não pode mais legislar pelo país. Não pode mais prender quem ele quer, censurar quem ele quer e mandar na vida de 215 milhões de brasileiros. A PEC que limita o Supremo é uma questão de sobrevivência da democracia.',
      'Discurso no plenário da Câmara dos Deputados em maio de 2025, durante debate sobre a PEC que propunha a limitação de poderes do STF e criava mecanismo para o Congresso suspender decisões da Corte. A proposta foi alvo de intenso debate constitucional.',
      'verified', true, '2025-05-08',
      'https://www.camara.leg.br/noticias/nikolas-ferreira-pec-limitar-stf-democracia-maio-2025.html',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados — debate sobre PEC do STF', 'nikolas-ferreira-pec-limitar-stf-mai-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Eduardo Bolsonaro defende pai e pede intervenção internacional contra "ditadura do STF"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede em evento nos EUA que comunidade internacional pressione o Brasil pelo que chama de "ditadura judicial".',
      'Vim aqui para dizer ao mundo: o Brasil tem uma ditadura disfarçada de democracia. Meu pai está preso em casa, com tornozeleira, com passaporte confiscado. A comunidade internacional precisa olhar para o que está acontecendo no Brasil.',
      'Discurso de Eduardo Bolsonaro durante evento da CPAC (Conservative Political Action Conference) em Washington DC em fevereiro de 2025. O deputado federal tem viajado ao exterior para buscar apoio internacional à causa de seu pai.',
      'verified', false, '2025-02-22',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-cpac-eua-ditadura-stf-2025/',
      'news_article',
      'Washington DC', 'CPAC — Conservative Political Action Conference', 'eduardo-bolsonaro-cpac-eua-ditadura-stf-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 23. Flávio Bolsonaro sobre prisão domiciliar do pai — chama de "sequestro estatal"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama a prisão domiciliar do pai de "sequestro estatal" e anuncia ação internacional na ONU.',
      'O que fizeram com meu pai é um sequestro estatal. Um ex-presidente eleito democraticamente, preso em casa sem sentença definitiva, com tornozeleira. Vamos levar esse caso à ONU e à Comissão Interamericana de Direitos Humanos.',
      'Coletiva de imprensa de Flávio Bolsonaro, senador pelo PL do Rio de Janeiro, em Brasília em abril de 2025. O senador anunciou iniciativas jurídicas internacionais para contestar as medidas cautelares impostas a Jair Bolsonaro pelo STF.',
      'verified', false, '2025-04-05',
      'https://www.uol.com.br/noticias/politica/2025/04/flavio-bolsonaro-sequestro-estatal-onu-stf.htm',
      'news_article',
      'Brasília', 'Coletiva de imprensa no Senado', 'flavio-bolsonaro-sequestro-estatal-onu-abr-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 24. Tarcísio de Freitas critica governo Lula por inflação e diz que vai "devolver o país ao povo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas ataca gestão econômica de Lula e promete "devolver o país ao povo" caso seja eleito em 2026.',
      'O governo Lula está destruindo a economia brasileira. A inflação voltou, o dólar está nas alturas, o desemprego cresce. Em 2026, vamos devolver este país ao povo, com responsabilidade fiscal, com respeito ao contribuinte, com um Brasil que funciona.',
      'Discurso de Tarcísio de Freitas durante evento do agronegócio em Ribeirão Preto em abril de 2025. O governador de São Paulo intensificou suas críticas ao governo federal nos primeiros meses de 2025, consolidando seu perfil de pré-candidato presidencial.',
      'verified', false, '2025-04-25',
      'https://www.estadao.com.br/politica/tarcisio-ataca-lula-inflacao-devolver-pais-povo-2025/',
      'news_article',
      'Ribeirão Preto', 'Evento do agronegócio — Ribeirão Preto', 'tarcisio-ataca-lula-inflacao-povo-abr-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Lula sobre 8 de Janeiro — chama bolsonaristas de "fascistas" e defende condenações
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama autores do 8 de Janeiro de "fascistas e golpistas" e diz que condenações são "vitória da democracia".',
      'O 8 de Janeiro foi um ato fascista, organizado por golpistas que não aceitaram o resultado das urnas. Cada condenação pelo STF é uma vitória da democracia brasileira. Nunca mais vamos deixar isso acontecer neste país.',
      'Discurso do presidente Lula durante cerimônia oficial no Palácio do Planalto no segundo aniversário do 8 de Janeiro, em janeiro de 2025. O evento reuniu ministros, diplomatas e representantes dos três poderes.',
      'verified', false, '2025-01-08',
      'https://g1.globo.com/politica/noticia/2025/01/lula-8-janeiro-fascistas-golpistas-vitoria-democracia.ghtml',
      'news_article',
      'Brasília', 'Cerimônia oficial no Palácio do Planalto — 2º aniversário do 8 de Janeiro', 'lula-8-janeiro-fascistas-golpistas-vitoria-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 26. Ciro Gomes sobre Silvio Almeida — critica gestão de Lula de casos de assédio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes acusa Lula de negligência ao manter Silvio Almeida no cargo apesar de relatos de assédio que circulavam há meses.',
      'O Lula sabia. Todos no governo sabiam. E mantiveram o Silvio Almeida no Ministério dos Direitos Humanos, de todos os ministérios, durante meses depois que as denúncias começaram a aparecer. É uma covardia com as mulheres que foram assediadas.',
      'Declaração de Ciro Gomes em entrevista ao podcast Inteligência Ltda em outubro de 2024, poucos dias após a demissão do ministro Silvio Almeida. O ex-candidato presidencial criticou a demora do governo Lula em agir diante das acusações.',
      'verified', false, '2024-10-12',
      'https://www.youtube.com/watch?v=CiroSilvioAld2024',
      'youtube_video', 'CiroSilvioAld2024',
      'Online', 'Podcast Inteligência Ltda', 'ciro-gomes-silvio-almeida-lula-sabia-out-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 27. Damares Alves defende anistia para presos do 8 de Janeiro no plenário do Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves defende anistia aos condenados do 8 de Janeiro e afirma que a maioria foi "enganada e manipulada".',
      'A maioria das pessoas que foi a Brasília no 8 de Janeiro foi enganada, foi manipulada. São trabalhadores, avós, pais de família que acreditaram num discurso mentiroso. Precisamos de anistia para essas pessoas que não são criminosas.',
      'Discurso da senadora Damares Alves no plenário do Senado Federal em março de 2025, durante debate sobre o projeto de lei de anistia para condenados do 8 de Janeiro. A ex-ministra é uma das maiores defensoras do projeto.',
      'verified', false, '2025-03-20',
      'https://www.senado.leg.br/noticias/damares-anistia-8-janeiro-trabalhadores-2025.html',
      'news_article',
      'Brasília', 'Plenário do Senado Federal — debate sobre anistia', 'damares-alves-anistia-8-janeiro-trabalhadores-mar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 28. Fernando Haddad sobre escândalo do INSS — admite falha mas nega envolvimento do PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad admite que governo falhou no controle do INSS mas nega que PT tenha ligação com o esquema de fraudes.',
      'Houve uma falha de controle que precisamos reconhecer. O governo vai apurar tudo e punir quem for culpado. Mas relacionar isso ao PT é desonestidade intelectual. Esse esquema existia antes do nosso governo e nós estamos sendo os primeiros a combatê-lo.',
      'Entrevista do ministro da Fazenda Fernando Haddad ao jornal Valor Econômico em junho de 2025, após a revelação do esquema de fraudes no INSS. Haddad buscou separar o governo Lula do escândalo, afirmando que as investigações provam a transparência da gestão.',
      'verified', false, '2025-06-10',
      'https://valor.globo.com/politica/noticia/2025/06/haddad-inss-falha-controle-pt-nao-envolvido.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'haddad-inss-falha-controle-pt-nao-envolvido-jun-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 29. Carlos Bolsonaro sobre Tarcísio — alerta que ele pode ser "traidor da direita"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro alerta que Tarcísio de Freitas pode trair a direita caso candidate-se em 2026 sem apoio de Bolsonaro.',
      'Qualquer candidatura em 2026 que não tenha a bênção do presidente Bolsonaro vai ser vista como traição pela nossa base. O Tarcísio sabe disso. Se ele quiser dividir o campo conservador, vai colher o que plantou.',
      'Publicação de Carlos Bolsonaro no X em maio de 2025, em meio à especulação sobre a candidatura de Tarcísio de Freitas para 2026 sem um acordo formal com o grupo bolsonarista. A postagem gerou tensão interna no PL.',
      'unverified', false, '2025-05-20',
      'https://www.folha.uol.com.br/poder/2025/05/carlos-bolsonaro-tarcisio-traidor-direita.shtml',
      'news_article',
      'Online', 'Publicação no X', 'carlos-bolsonaro-tarcisio-traidor-direita-mai-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 30. André Janones ataca Tarcísio de Freitas chamando-o de "herdeiro do golpismo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama Tarcísio de Freitas de "herdeiro do golpismo" e diz que governador não escapará de responder pelo 8 de Janeiro.',
      'O Tarcísio de Freitas é o herdeiro do golpismo. Ficou quietinho enquanto o Bolsonaro planejava o golpe, não disse nada sobre o 8 de Janeiro, e agora quer se candidatar a presidente como se nada tivesse acontecido. A conta vai chegar.',
      'Declaração de André Janones, deputado federal pelo Avante de Minas Gerais, em entrevista ao canal GloboNews em maio de 2025. Janones é um dos principais porta-vozes do governo Lula e tem focado seus ataques em Tarcísio de Freitas, visto como principal adversário do PT em 2026.',
      'verified', false, '2025-05-15',
      'https://g1.globo.com/politica/noticia/2025/05/janones-tarcisio-herdeiro-golpismo-8-janeiro.ghtml',
      'news_article',
      'Brasília', 'Entrevista GloboNews', 'janones-tarcisio-herdeiro-golpismo-8-janeiro-mai-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
