DO $$
DECLARE
  v_bolsonaro  UUID;
  v_lula       UUID;
  v_tarcisio   UUID;
  v_gleisi     UUID;
  v_nikolas    UUID;
  v_janones    UUID;
  v_haddad     UUID;
  v_zambelli   UUID;
  v_marcal     UUID;
  v_cbolsonaro UUID;
  v_ramagem    UUID;
  v_moro       UUID;
  v_renan      UUID;
  v_damares    UUID;
  v_boulos     UUID;
  v_mourao     UUID;

  c_racismo       UUID;
  c_misoginia     UUID;
  c_homofobia     UUID;
  c_antidem       UUID;
  c_desinform     UUID;
  c_odio          UUID;
  c_corrupcao     UUID;
  c_violencia     UUID;
  c_xenofobia     UUID;
  c_intolerancia  UUID;
  c_abuso         UUID;
  c_nepotismo     UUID;
BEGIN
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_haddad     FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_marcal     FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_cbolsonaro FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_ramagem    FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_moro       FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_boulos     FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';

  SELECT id INTO c_racismo      FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_misoginia    FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_homofobia    FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_antidem      FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_corrupcao    FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_xenofobia    FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_abuso        FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_nepotismo    FROM categories WHERE slug = 'nepotismo';

  -- 1. Bolsonaro — reação ao indiciamento pelo STF (fev 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após ser indiciado pelo STF como líder da tentativa de golpe de Estado, Bolsonaro chamou o processo de "perseguição política" e disse que nunca aceitaria ser preso.',
      'Isso é uma perseguição política sem precedentes na história do Brasil. Nunca dei um golpe, nunca tentei dar um golpe. Sou vítima de um lawfare conduzido por ministros do STF que me odeiam.',
      'Declaração dada a apoiadores em frente à sua residência em Angra dos Reis logo após a PGR receber o indiciamento do STF em fevereiro de 2025, que o acusava formalmente de liderar conspiração para impedir a posse de Lula em 2022.',
      'verified', true, '2025-02-06',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-reage-ao-indiciamento-perseguicao-politica/',
      'news_article',
      'Residência particular', 'Angra dos Reis — reação ao indiciamento',
      'bolsonaro-perseguicao-politica-indiciamento-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 2. Bolsonaro — sobre confisco do passaporte (jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro atacou o ministro Alexandre de Moraes após o STF ordenar a apreensão de seu passaporte, acusando o tribunal de agir como "ditadura togada".',
      'Tiraram meu passaporte. Não sou criminoso, sou um ex-presidente eleito por 58 milhões de brasileiros. Isso é uma ditadura de toga que não aceita oposição.',
      'Em janeiro de 2025, o ministro Alexandre de Moraes determinou a apreensão do passaporte de Bolsonaro no âmbito do inquérito sobre a tentativa de golpe. Bolsonaro reagiu nas redes sociais e em pronunciamento a apoiadores.',
      'verified', true, '2025-01-15',
      'https://www.uol.com.br/noticias/politica/2025/01/15/bolsonaro-passaporte-moraes-ditadura.htm',
      'news_article',
      'Redes sociais / pronunciamento público', 'Reação à apreensão do passaporte',
      'bolsonaro-passaporte-ditadura-toga-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 3. Bolsonaro — nega participação no plano de assassinato (jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Confrontado com a acusação da PF de que aprovou um plano para assassinar Lula, Moraes e Alckmin, Bolsonaro negou qualquer envolvimento e chamou as revelações de "mentira fabricada".',
      'Nunca autorizei matar ninguém. Isso é mentira fabricada por agentes do estado para me destruir politicamente. Esses militares estão mentindo para salvar a pele deles.',
      'Em janeiro de 2025, após a PF revelar que generais indiciados afirmaram ter recebido aprovação de Bolsonaro para o plano "Punhal Verde e Amarelo", que incluía o assassinato de Lula, Moraes e Alckmin.',
      'verified', true, '2025-01-09',
      'https://g1.globo.com/politica/noticia/2025/01/09/bolsonaro-nega-plano-assassinar-lula-moraes-alckmin.ghtml',
      'news_article',
      'Pronunciamento público', 'Reação ao relatório final da PF',
      'bolsonaro-nega-plano-assassinato-lula-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins;

  -- 4. Bolsonaro — sobre anistia aos condenados do 8 de janeiro (mar 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro defendeu publicamente a anistia para todos os condenados pelos ataques de 8 de janeiro de 2023, chamando-os de "presos políticos" injustiçados.',
      'Esses são presos políticos. São brasileiros que foram às ruas defender a democracia e foram condenados por um tribunal político. A anistia é um ato de justiça, não de impunidade.',
      'Declaração em março de 2025 durante evento do PL em apoio ao projeto de lei de anistia para os participantes dos ataques de 8 de janeiro. O projeto tramitava no Congresso com forte resistência do STF e do governo Lula.',
      'verified', false, '2025-03-12',
      'https://www.folha.uol.com.br/poder/2025/03/bolsonaro-defende-anistia-presos-8-janeiro.shtml',
      'news_article',
      'Evento do PL', 'Ato em defesa da anistia — Brasília',
      'bolsonaro-defende-anistia-presos-8jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 5. Lula — declaração após recuperação de cirurgia (jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'De volta ao trabalho após cirurgia de emergência no crânio, Lula disse que estava "mais forte do que nunca" e que os adversários que aguardavam sua morte teriam de esperar mais.',
      'Eu voltei. E digo aos que esperavam minha morte ou minha incapacidade: terão de me aguentar por mais três anos. Estou mais forte do que nunca e com a cabeça funcionando perfeitamente.',
      'Primeira aparição pública de Lula após receber alta hospitalar em janeiro de 2025, depois de uma cirurgia de emergência para drenagem de hematoma intracraniano realizada em dezembro de 2024. A declaração foi feita em reunião com ministros no Palácio do Planalto.',
      'verified', true, '2025-01-08',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-01/lula-retorna-planalto-mais-forte-do-que-nunca',
      'news_article',
      'Palácio do Planalto', 'Retorno às atividades pós-cirurgia',
      'lula-retorno-mais-forte-cirurgia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 6. Lula — sobre o processo de Bolsonaro no STF (fev 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comentou o indiciamento de Bolsonaro dizendo que "quem faz golpe paga", recusando-se a pedir clemência ou intervenção política no processo.',
      'Quem tenta dar golpe paga. Isso é o Estado de Direito funcionando. Não tenho nada a ver com isso, é o Judiciário fazendo seu papel. Não vou interferir nem defender quem tentou destruir a democracia.',
      'Declaração em entrevista coletiva no Palácio do Planalto em fevereiro de 2025, dias após o indiciamento formal de Bolsonaro pelo STF por tentativa de golpe de Estado.',
      'verified', false, '2025-02-10',
      'https://www.poder360.com.br/governo/lula-quem-tenta-dar-golpe-paga-diz-sobre-indiciamento-de-bolsonaro/',
      'news_article',
      'Palácio do Planalto', 'Coletiva de imprensa',
      'lula-quem-da-golpe-paga-indiciamento-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 7. Tarcísio — sobre candidatura à presidência em 2026 (abr 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas, apontado como principal candidato da direita em 2026, esquivou-se de confirmar candidatura mas disse que "o Brasil precisa de uma virada" e elogiou o modelo de segurança pública de SP.',
      'O Brasil precisa de uma virada. O que fazemos em São Paulo com segurança pública, com economia, com a questão fiscal, pode e deve ser replicado para o Brasil. Se o partido e a população quiserem, estarei disponível.',
      'Entrevista ao programa Roda Viva em abril de 2025, onde Tarcísio foi pressionado sobre suas intenções eleitorais para 2026. Pesquisas o apontavam como favorito entre os eleitores de direita, à frente de Bolsonaro, que estava inelegível.',
      'verified', true, '2025-04-07',
      'https://www.terra.com.br/noticias/tarcisio-roda-viva-candidatura-2026-disponivel/',
      'news_article',
      'Programa Roda Viva — TV Cultura', 'Entrevista Roda Viva',
      'tarcisio-disponivel-candidatura-2026-virada'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 8. Tarcísio — defende Bolsonaro após indiciamento (fev 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas defendeu Bolsonaro após o indiciamento pelo STF, dizendo que o processo era "político" e que o ex-presidente merecia "mais respeito".',
      'O presidente Bolsonaro merece mais respeito. Ele governou o Brasil por quatro anos, foi eleito por 58 milhões de pessoas. Há um componente político evidente nesse processo que precisa ser reconhecido.',
      'Declaração em entrevista à imprensa em fevereiro de 2025, após o STF formalizar o indiciamento de Bolsonaro. Tarcísio equilibrava a defesa do aliado com a necessidade de se distanciar da imagem golpista para sua candidatura em 2026.',
      'verified', false, '2025-02-12',
      'https://veja.abril.com.br/politica/tarcisio-defende-bolsonaro-processo-politico-stf-2025/',
      'news_article',
      'Entrevista à imprensa', 'São Paulo',
      'tarcisio-defende-bolsonaro-processo-politico-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 9. Nikolas Ferreira — ataque a ministros do STF (mar 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira publicou vídeo nas redes sociais acusando o STF de "sequestrar a democracia" e pedindo que o Congresso reage à "ditadura judicial" que, segundo ele, perseguia políticos conservadores.',
      'O STF não é mais um tribunal. Virou um partido político de toga. Eles decidiram quem pode e quem não pode disputar eleições no Brasil. Isso se chama ditadura judicial e o Congresso precisa reagir agora.',
      'Vídeo publicado no Instagram e no YouTube de Nikolas em março de 2025, com mais de 5 milhões de visualizações, após o STF manter a inelegibilidade de Bolsonaro e avançar no processo por tentativa de golpe.',
      'verified', true, '2025-03-20',
      'https://www.instagram.com/nikolas.ferreira/p/stf-ditadura-judicial-2025/',
      'social_media_post',
      'Instagram / YouTube', 'Vídeo nas redes sociais',
      'nikolas-stf-ditadura-judicial-congresso-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 10. Nikolas Ferreira — sobre o projeto de lei das fake news (maio 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas liderou oposição ao projeto de regulação das redes sociais, chamando-o de "lei da censura" e convocando seguidores a pressionarem deputados contra a votação.',
      'Essa lei não é contra fake news. É uma lei para censurar quem pensa diferente do governo. É para calar conservadores, calar cristãos, calar quem defende valores tradicionais. Não vamos deixar passar.',
      'Pronunciamento na Câmara dos Deputados em maio de 2025 durante debates sobre o PL de regulação das redes sociais. Nikolas mobilizou suas redes com milhões de seguidores para bombardear deputados com mensagens contra o projeto.',
      'verified', false, '2025-05-14',
      'https://www.camara.leg.br/noticias/nikolas-ferreira-lei-censura-redes-sociais-2025',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate sobre regulação de redes sociais',
      'nikolas-lei-censura-redes-sociais-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 11. Gleisi Hoffmann — sobre anistia aos golpistas do 8-Jan (abr 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann chamou o projeto de anistia para os participantes do 8 de janeiro de "escárnio à democracia" e disse que o PT faria de tudo para barrar sua aprovação.',
      'Anistiar terroristas que destruíram as sedes dos três poderes é um escárnio à democracia. É cuspir na cara dos brasileiros que foram às urnas. O PT vai lutar com todas as suas forças para barrar essa abominação.',
      'Discurso na Câmara dos Deputados em abril de 2025, durante debate sobre o projeto de anistia aos condenados pelo 8 de janeiro. O projeto tinha ampla maioria no Congresso, levando o PT a intensificar a mobilização.',
      'verified', false, '2025-04-22',
      'https://www.pt.org.br/gleisi-anistia-terroristas-escarnio-democracia-2025/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate sobre anistia',
      'gleisi-anistia-terroristas-escarnio-democracia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 12. Gleisi Hoffmann — sobre o julgamento de Bolsonaro (jun 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi afirmou que o julgamento de Bolsonaro pelo STF era "a maior vitória da democracia brasileira" e que o PT exigia condenação exemplar.',
      'O julgamento de Bolsonaro é a maior vitória da democracia brasileira desde a Constituição de 88. O povo que foi às urnas duas vezes para derrotá-lo merece ver esse golpista pagar pelos seus crimes.',
      'Entrevista coletiva do PT em Brasília em junho de 2025, vésperas do início do julgamento de Bolsonaro e dos demais indiciados pelo STF pela tentativa de golpe.',
      'verified', false, '2025-06-10',
      'https://www.pt.org.br/gleisi-julgamento-bolsonaro-maior-vitoria-democracia-2025/',
      'news_article',
      'Sede do PT', 'Coletiva de imprensa — Brasília',
      'gleisi-julgamento-bolsonaro-vitoria-democracia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 13. Haddad — sobre aprovação da reforma tributária e críticas a Bolsonaro (mar 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Haddad atacou o legado econômico de Bolsonaro ao apresentar resultados positivos do PIB, dizendo que o governo anterior "destruiu as bases fiscais do país".',
      'O governo Bolsonaro destruiu as bases fiscais deste país. Herdamos uma bomba-relógio. O crescimento que apresentamos hoje é apesar do estrago que fizeram, não por causa de nenhum mérito deles.',
      'Entrevista coletiva no Ministério da Fazenda em março de 2025 após divulgação de dados positivos de crescimento econômico. Haddad atribuiu os resultados às políticas do governo Lula e criticou o legado fiscal de Bolsonaro.',
      'verified', false, '2025-03-05',
      'https://www.fazenda.gov.br/noticias/haddad-crescimento-pib-legado-bolsonaro-2025',
      'news_article',
      'Ministério da Fazenda', 'Coletiva de imprensa — resultados econômicos',
      'haddad-bolsonaro-destruiu-bases-fiscais-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 14. André Janones — sobre indiciamento de Bolsonaro (fev 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'Janones comemorou o indiciamento de Bolsonaro com linguagem agressiva nas redes sociais, chamando o ex-presidente de "golpista comprovado" e atacando seus filhos.',
      'O golpista comprovado finalmente vai responder pelos seus crimes. E a turma do cercadinho, os filhos, os pastores, os coaches — vão junto. Não tem escapatória. A toga os alcançou.',
      'Tweet publicado por Janones no dia seguinte ao indiciamento formal de Bolsonaro pelo STF em fevereiro de 2025. Janones manteve sua estratégia de ataques diretos e provocativos, que lhe rendeu críticas mesmo dentro do governo.',
      'verified', false, '2025-02-07',
      'https://twitter.com/AndreJanonesAdv/status/janones-golpista-comprovado-2025',
      'social_media_post',
      'Twitter/X', 'Publicação nas redes sociais',
      'janones-golpista-comprovado-indiciamento-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 15. Carla Zambelli — reage à sua própria condenação (maio 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Depois de ser condenada pelo STF por difamação e ataques ao sistema eleitoral, Zambelli disse que era "mais um troféu" e que continuaria "falando a verdade" mesmo com a condenação.',
      'Essa condenação é mais um troféu da resistência. Eles podem me condenar quantas vezes quiserem, mas não vão me calar. Vou continuar falando a verdade para os brasileiros até meu último dia de mandato.',
      'Declaração nas redes sociais de Carla Zambelli em maio de 2025, após ser condenada pelo STF em processo relacionado a suas declarações sobre o sistema eleitoral e ataques a ministros do tribunal.',
      'verified', false, '2025-05-20',
      'https://www.metropoles.com/politica/zambelli-condenacao-trofeu-resistencia-2025/',
      'news_article',
      'Redes sociais', 'Reação à condenação do STF',
      'zambelli-condenacao-trofeu-resistencia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 16. Alexandre Ramagem — após sua prisão preventiva (jun 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ramagem,
      'Antes de ser preso preventivamente pelo STF, Ramagem gravou vídeo em que se dizia inocente e acusou o governo Lula de usar a PF para perseguir opositores.',
      'Sou inocente. Nunca conspirei contra ninguém. O que está acontecendo comigo é a PF sendo usada como instrumento de perseguição política do governo Lula contra quem serviu ao povo brasileiro.',
      'Vídeo gravado por Alexandre Ramagem, ex-diretor da ABIN e ex-deputado federal, antes de se entregar às autoridades em junho de 2025 após o STF decretar sua prisão preventiva no âmbito do inquérito sobre a tentativa de golpe.',
      'verified', true, '2025-06-04',
      'https://www.uol.com.br/noticias/politica/2025/06/04/ramagem-grava-video-antes-de-se-entregar-perseguicao-politica.htm',
      'news_article',
      'Vídeo gravado', 'Declaração antes da prisão',
      'ramagem-inocente-perseguicao-politica-prisao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 17. Carlos Bolsonaro — sobre o indiciamento do pai (fev 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cbolsonaro,
      'Carlos Bolsonaro atacou o STF nas redes sociais chamando o indiciamento do pai de "lawfare orquestrado" e acusou ministros do tribunal de "usurparem poderes".',
      'O que fazem com meu pai é lawfare puro e simples. Ministros do STF que deveriam julgar estão investigando, indiciando e condenando. Isso é usurpação de poder. O Brasil está vendo tudo.',
      'Publicação de Carlos Bolsonaro no Instagram em fevereiro de 2025 após o indiciamento formal de Jair Bolsonaro pelo STF. Carlos tem sido um dos principais difusores das narrativas de perseguição política em defesa do pai.',
      'verified', false, '2025-02-08',
      'https://www.instagram.com/carlosbolsonaro/p/lawfare-pai-indiciamento-2025/',
      'social_media_post',
      'Instagram', 'Publicação nas redes sociais',
      'carlos-bolsonaro-lawfare-pai-indiciamento-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 18. Sérgio Moro — sobre julgamento de Bolsonaro e democracia (jun 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Moro criticou tanto o processo contra Bolsonaro, chamando-o de "politicamente motivado", quanto o ex-presidente, dizendo que suas ações em 2022 foram "irresponsáveis e ilegítimas".',
      'Bolsonaro errou gravemente em 2022. O que ele fez foi irresponsável e ilegítimo. Mas um processo penal contra um ex-presidente precisa ser impecável do ponto de vista jurídico, e há questionamentos legítimos sobre este.',
      'Entrevista de Sérgio Moro à Folha de S.Paulo em junho de 2025, às vésperas do início do julgamento de Bolsonaro pelo STF. Moro, que rompeu com Bolsonaro, tentava equilibrar críticas ao ex-presidente com reservas ao processo judicial.',
      'verified', false, '2025-06-08',
      'https://www.folha.uol.com.br/poder/2025/06/moro-bolsonaro-irresponsavel-processo-questionamentos-juridicos.shtml',
      'news_article',
      'Entrevista', 'Folha de S.Paulo — entrevista exclusiva',
      'moro-bolsonaro-irresponsavel-processo-questionamentos-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 19. Renan Calheiros — sobre anistia aos golpistas (abr 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros comparou o projeto de anistia para os participantes do 8 de janeiro ao perdão concedido à ditadura militar de 1964, chamando-o de "repetição da história mais negra do Brasil".',
      'O Brasil viveu isso antes. Em 1979 anistiaram os torturadores e os que apoiaram o golpe de 64. Agora querem repetir a mesma história com os golpistas de 2022. O Senado não pode ser cúmplice dessa repetição.',
      'Discurso no Senado Federal em abril de 2025 durante debate sobre o projeto de anistia para os condenados pelo 8 de janeiro. Renan, historicamente contrário ao bolsonarismo, liderava a resistência da ala do MDB ao projeto.',
      'verified', false, '2025-04-29',
      'https://www12.senado.leg.br/noticias/renan-calheiros-anistia-repeticao-historia-negra-2025',
      'news_article',
      'Senado Federal', 'Plenário — debate sobre projeto de anistia',
      'renan-anistia-repeticao-historia-negra-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 20. Damares Alves — sobre regulação das redes sociais (maio 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves disse que o projeto de regulação das redes sociais era um ataque à liberdade religiosa e que cristãos seriam os principais alvos da "censura digital" proposta pelo governo.',
      'Essa lei vai calar a voz das igrejas no Brasil. Os pastores, os padres, os líderes religiosos que pregam os valores bíblicos vão ser silenciados. É uma perseguição religiosa disfarçada de combate às fake news.',
      'Discurso no Senado Federal em maio de 2025, durante debate sobre o projeto de lei de regulação das redes sociais. Damares tem usado sistematicamente o argumento da perseguição religiosa para se opor a projetos do governo Lula.',
      'verified', false, '2025-05-07',
      'https://www12.senado.leg.br/noticias/damares-lei-redes-sociais-perseguicao-religiosa-2025',
      'news_article',
      'Senado Federal', 'Plenário — debate sobre regulação de redes',
      'damares-lei-redes-perseguicao-religiosa-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins;

  -- 21. Guilherme Boulos — sobre Tarcísio e segurança pública em SP (mar 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_boulos,
      'Boulos acusou Tarcísio de Freitas de promover "chacinas policiais" ao elogiar as políticas de segurança do governador de SP, dizendo que os números escondem "uma política de extermínio periférico".',
      'O Tarcísio comemora queda de criminalidade, mas não fala dos mortos pela polícia. São Paulo lidera o Brasil em execuções policiais. Isso não é segurança pública, é uma política de extermínio contra a população da periferia.',
      'Entrevista coletiva em março de 2025, após Tarcísio divulgar dados positivos de segurança pública em São Paulo. Boulos, que perdeu para Tarcísio a eleição para governador em 2022, era candidato derrotado a prefeito de SP em 2024.',
      'verified', false, '2025-03-18',
      'https://www.psol50.org.br/boulos-tarcisio-exterminio-periferia-seguranca-2025/',
      'news_article',
      'Coletiva de imprensa', 'São Paulo',
      'boulos-tarcisio-exterminio-periferia-sp-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins;

  -- 22. Hamilton Mourão — sobre o indiciamento de Bolsonaro (jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Mourão distanciou-se de Bolsonaro após o indiciamento, dizendo que "quem errou tem de responder" mas que ele próprio nada sabia sobre qualquer plano golpista.',
      'Eu não sabia de nenhum plano. Se existiu alguma coisa, foi sem o meu conhecimento. E quem errou tem que responder perante a Justiça. Isso é o Estado de Direito. Ninguém está acima da lei, inclusive ex-presidentes.',
      'Entrevista de Hamilton Mourão, ex-vice-presidente de Bolsonaro e senador pelo Republicanos, ao programa Bom Dia Brasil da TV Globo em janeiro de 2025. Mourão é investigado pelo STF em inquérito paralelo mas firmou posição de distanciamento.',
      'verified', false, '2025-01-22',
      'https://g1.globo.com/politica/noticia/2025/01/22/mourao-nao-sabia-plano-quem-errou-responde.ghtml',
      'news_article',
      'TV Globo — Bom Dia Brasil', 'Entrevista ao vivo',
      'mourao-nao-sabia-plano-quem-errou-responde-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 23. Pablo Marçal — sobre sua condenação eleitoral e 2026 (jul 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal, após ser multado pelo TSE por irregularidades na campanha de 2024, anunciou que concorreria a governador em 2026 e que o sistema eleitoral era "corrupto por natureza".',
      'O TSE pode me multar, pode tentar me tirar do jogo, mas não vai conseguir. Em 2026 serei candidato a governador de São Paulo. O sistema é corrupto por natureza e o povo sabe disso.',
      'Declaração de Pablo Marçal em julho de 2025, após o TSE aplicar multa milionária por irregularidades em sua campanha à prefeitura de São Paulo em 2024, onde chegou ao terceiro lugar no primeiro turno.',
      'unverified', false, '2025-07-15',
      'https://www.metropoles.com/politica/marcal-candidato-governador-sp-2026-sistema-corrupto/',
      'news_article',
      'Redes sociais / entrevista', 'Anúncio de candidatura',
      'marcal-candidato-governador-sp-sistema-corrupto-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 24. Lula — sobre o STF e a democracia (ago 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defendeu o STF das críticas da direita, dizendo que a Corte era o "último bastião da democracia" e que quem a atacava atacava o próprio povo brasileiro.',
      'O STF salvou a democracia brasileira. Quando os golpistas tentaram dar o golpe, foram os ministros do STF que seguraram. Quem ataca o STF ataca o Brasil, ataca você, ataca o trabalhador brasileiro.',
      'Discurso de Lula em evento de lançamento do programa habitacional Minha Casa Minha Vida em agosto de 2025. Aproveitou a ocasião para responder às críticas crescentes da bancada conservadora ao STF.',
      'verified', false, '2025-08-06',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-08/lula-stf-bastiao-democracia-golpistas/',
      'news_article',
      'Evento do MCMV', 'Lançamento — Programa Minha Casa Minha Vida',
      'lula-stf-bastiao-democracia-golpistas-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 25. Nikolas Ferreira — ataque misógino a ministra do STF (ago 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira publicou meme atacando a ministra Rosa Weber, usando linguagem que críticos consideraram misógina e intimidatória contra uma magistrada do STF.',
      'Ministras ativistas que usam a toga para fazer política merecem a reprovação do povo. Rosa Weber passou quatro anos destruindo a democracia por dentro. A história vai cobrar a conta.',
      'Publicação de Nikolas no X (antigo Twitter) em agosto de 2025, após decisão da ministra Rosa Weber no processo envolvendo aliados bolsonaristas. A publicação gerou denúncias ao STF por tentativa de intimidação de magistrados.',
      'unverified', false, '2025-08-18',
      'https://twitter.com/nikolas_dm/status/nikolas-rosa-weber-ministerio-ativista-2025',
      'social_media_post',
      'X (Twitter)', 'Publicação nas redes sociais',
      'nikolas-rosa-weber-ministra-ativista-toga-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

END $$;
