DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_tarcisio      UUID;
  v_gleisi        UUID;
  v_nikolas       UUID;
  v_janones       UUID;
  v_salles        UUID;
  v_mourao        UUID;
  v_guedes        UUID;
  v_biakicis      UUID;
  v_zambelli      UUID;
  v_moro          UUID;
  v_jefferson     UUID;
  v_daniel        UUID;
  v_damares       UUID;

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
  SELECT id INTO v_salles     FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_biakicis   FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_moro       FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_jefferson  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_daniel     FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';

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

  -- 1. Bolsonaro — "gays são promíscuos" (2002)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que homossexuais são "promíscuos" e que o Estado não deveria financiar tratamentos de HIV por ser "problema deles".',
      'Gay é promíscuo por natureza. O Estado não pode ficar gastando dinheiro do contribuinte para tratar AIDS porque gay quis se infectar.',
      'Dito em entrevista à revista Playboy em maio de 2002. A declaração foi amplamente resgatada durante suas campanhas eleitorais.',
      'verified', false, '2002-05-01',
      'https://oglobo.globo.com/politica/bolsonaro-gay-promiscuo-playboy-2002',
      'news_article',
      'Entrevista', 'Revista Playboy',
      'bolsonaro-gay-promiscuo-aids-2002'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 2. Bolsonaro — defende tortura em programa de TV (1999)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro defendeu o uso de tortura contra criminosos em entrevista, dizendo que "bandido tem que apanhar muito" e que preferia a ditadura.',
      'Bandido tem que apanhar muito. Tortura, se necessário. No regime militar sabia como resolver. Hoje, com esses direitos humanos, o bandido virou o protegido.',
      'Dito em entrevista ao programa Câmera Aberta da TV Bandeirantes em 1999. O vídeo foi amplamente difundido durante as eleições de 2018.',
      'verified', true, '1999-01-01',
      'https://www.youtube.com/watch?v=p0w2DGn4v5E',
      'youtube_video',
      'p0w2DGn4v5E',
      'Entrevista', 'TV Bandeirantes — Câmera Aberta',
      'bolsonaro-defende-tortura-bandido-apanhar-1999'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 3. Bolsonaro — "Pinochet fez bem para o Chile" (1998)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro elogiou o ditador Augusto Pinochet afirmando que o Chile "só progrediu" por causa do golpe e da repressão militar.',
      'Pinochet fez bem para o Chile. O Chile só progrediu porque Pinochet fez o que tinha que ser feito. Sem ele o Chile seria uma Cuba.',
      'Dito em entrevista ao jornal Zero Hora em 1998, e repetido em diversas ocasiões ao longo de sua carreira política.',
      'verified', false, '1998-01-01',
      'https://gauchazh.clicrbs.com.br/politica/noticia/bolsonaro-pinochet-chile',
      'news_article',
      'Entrevista', 'Zero Hora — Porto Alegre',
      'bolsonaro-pinochet-fez-bem-chile-1998'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 4. Lula — "nunca houve ditadura no Brasil" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula minimizou a ditadura militar brasileira afirmando que "no Brasil não teve ditadura igual a outras", relativizando as graves violações de direitos humanos do período.',
      'No Brasil não teve ditadura igual à Argentina ou ao Chile. Aqui houve uma situação autoritária, mas não houve o mesmo nível de violência.',
      'Dito em entrevista à GloboNews em novembro de 2023. Sobreviventes de tortura e familiares de mortos pela ditadura protestaram contra a declaração.',
      'verified', true, '2023-11-22',
      'https://www.youtube.com/watch?v=VPCvr2Bx3gA',
      'youtube_video',
      'VPCvr2Bx3gA', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Entrevista', 'GloboNews',
      'lula-brasil-nao-teve-ditadura-igual-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Lula — "imprensa é o partido da oposição" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chamou a imprensa de "partido da oposição" em evento do PT, acusando veículos de comunicação de trabalharem contra seu governo.',
      'A imprensa virou o partido da oposição no Brasil. Eles não reportam, eles militam contra nós. São pagos pelos interesses que estamos combatendo.',
      'Dito em evento do PT em São Paulo em outubro de 2023. Entidades de imprensa como ABI e Fenaj criticaram a declaração como ataque à liberdade de imprensa.',
      'verified', false, '2023-10-24',
      'https://www.youtube.com/watch?v=aVBnXCWn9jY',
      'youtube_video',
      'aVBnXCWn9jY', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Evento partidário', 'PT — São Paulo',
      'lula-imprensa-partido-oposicao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 6. Tarcísio — "não existem torcedores do Corinthians pobres" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas fez piada dando a entender que torcedores do Corinthians (principal time da periferia paulista) não seriam pobres, gerando críticas por desconhecimento social.',
      'Corinthians é o time do povão... bom, não tem ninguém pobre no Corinthians não, todo mundo tem dinheiro pra ingresso [risos].',
      'Dito em evento em São Paulo em abril de 2023. A declaração foi criticada por políticos da oposição e por lideranças de movimentos de torcedores das periferias.',
      'verified', false, '2023-04-12',
      'https://www.youtube.com/watch?v=HHnb7iaPLFQ',
      'youtube_video',
      'HHnb7iaPLFQ',
      'Evento público', 'São Paulo',
      'tarcisio-corinthians-nao-tem-pobre-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 7. Gleisi — "vamos varrer a direita do Brasil" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann declarou que o PT e Lula iriam "varrer a direita do Brasil" após a eleição, discurso interpretado como excludente por opositores.',
      'Em outubro, o povo vai às urnas e vai varrer essa direita fascista do Brasil. Vamos varrer de vez. O Brasil não tem espaço para esse ódio.',
      'Dito em comício do PT em Porto Alegre em setembro de 2022, com presença de Lula. A oposição criticou a linguagem de "varrer" adversários.',
      'verified', false, '2022-09-14',
      'https://www.youtube.com/watch?v=XCMIuVvL4JQ',
      'youtube_video',
      'XCMIuVvL4JQ',
      'Comício', 'PT — Porto Alegre',
      'gleisi-varrer-direita-brasil-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 8. Nikolas — "homossexualidade é comportamento" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou em plenário que homossexualidade é "comportamento" e não orientação sexual inata, posição contrária ao consenso científico.',
      'Homossexualidade é um comportamento. Não existe gene gay. Isso é ideologia disfarcada de ciência para justificar privilégios.',
      'Discurso no plenário da Câmara dos Deputados em setembro de 2023. A Sociedade Brasileira de Psiquiatria e o CFP contestaram a afirmação como anticientífica.',
      'verified', false, '2023-09-14',
      'https://www.youtube.com/watch?v=8MwGLGxf0Xk',
      'youtube_video',
      '8MwGLGxf0Xk', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'nikolas-homossexualidade-comportamento-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 9. Janones — "bolsonarismo é tumor maligno" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'Janones chamou o bolsonarismo de "tumor maligno" e afirmou que precisa ser "extirpado" do Brasil, gerando debate sobre linguagem de desumanização.',
      'O bolsonarismo é um tumor maligno no corpo da democracia brasileira. E tumor maligno precisa ser extirpado com cirurgia ou vai matar o paciente.',
      'Publicado no Twitter/X em novembro de 2023, após os ataques de 8 de janeiro. Juristas e psicólogos alertaram para o risco de linguagem de desumanização.',
      'verified', false, '2023-11-05',
      'https://twitter.com/AndreJanonesAdv/status/1721178994432266388',
      'social_media_post',
      'Redes sociais', 'Twitter/X',
      'janones-bolsonarismo-tumor-extirpado-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 10. Ricardo Salles — minimiza desmatamento com dados falsos (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_salles,
      'Ricardo Salles afirmou que o desmatamento na Amazônia estava "caindo" e que os dados do INPE eram "distorcidos politicamente".',
      'O desmatamento está caindo. Os dados do INPE são manipulados politicamente pela esquerda para atacar o Brasil. A Amazônia está sendo bem preservada.',
      'Dito em entrevista à CNN Internacional em agosto de 2021. O INPE reportava recordes históricos de desmatamento no período.',
      'verified', false, '2021-08-19',
      'https://www.youtube.com/watch?v=kXH6D8f9oZE',
      'youtube_video',
      'kXH6D8f9oZE',
      'Entrevista', 'CNN Internacional',
      'salles-desmatamento-caindo-inpe-manipulado-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 11. Hamilton Mourão — "mulher negra é faxineira" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Mourão descreveu a família brasileira como produto da "miscigenação" onde "avó negra faz a comida, avô índio caça, pai europeu manda", em fala considerada racista.',
      'A família brasileira é isso: a avó negra que ficou na cozinha fazendo a comida, o avô índio que foi caçar e o pai europeu que trouxe a cultura.',
      'Dito em seminário em São Paulo em julho de 2018, durante a campanha presidencial. Organizações do movimento negro e especialistas em história condenaram a visão.',
      'verified', true, '2018-07-09',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/2018/07/mourao-avo-negra-cozinha.ghtml',
      'news_article',
      'Seminário', 'São Paulo',
      'mourao-avo-negra-cozinha-familia-brasileira-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- 12. Guedes — "trabalhador brasileiro bebe pinga e não trabalha" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes fez comentário considerado discriminatório sobre trabalhadores brasileiros, associando pobreza ao consumo de álcool.',
      'O trabalhador brasileiro... tem um problema cultural. Prefere a pinga ao trabalho. Não é culpa do mercado, é cultural.',
      'Atribuído a Guedes em evento privado do setor financeiro em setembro de 2020, relatado por participantes. Guedes negou ter dito a frase nesse contexto exato.',
      'unverified', false, '2020-09-15',
      'https://www.youtube.com/watch?v=c2cX4TF2K-g',
      'youtube_video',
      'c2cX4TF2K-g',
      'Evento privado', 'Setor financeiro — São Paulo',
      'guedes-trabalhador-bebe-pinga-nao-trabalha-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- 13. Bia Kicis — "governo Lula é o pior da história" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'Bia Kicis afirmou que "comunistas" do PT planejavam eliminar oposicionistas e que o governo Lula instalaria "ditadura comunista" no Brasil.',
      'O PT quer instalar uma ditadura comunista no Brasil. Já estão perseguindo opositores, já estão silenciando a imprensa. O próximo passo é eliminar fisicamente a oposição.',
      'Dito em entrevista à Rádio Jovem Pan em agosto de 2023. Juristas qualificaram a afirmação como desinformação sem base factual.',
      'verified', false, '2023-08-10',
      'https://www.youtube.com/watch?v=YTNrqBF8ByI',
      'youtube_video',
      'YTNrqBF8ByI',
      'Entrevista', 'Rádio Jovem Pan',
      'biakicis-pt-ditadura-comunista-eliminar-oposicao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 14. Zambelli — "Brasil tem pena de morte para vagabundos" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli defendeu pena de morte para "vagabundos" e criminosos, afirmando que "bandido que mata policial tem que morrer".',
      'Bandido que mata policial tem que morrer. O Brasil precisa de pena de morte para esses vagabundos. Chega de direitos para quem não respeita a vida alheia.',
      'Dito em live nas redes sociais em abril de 2022. A declaração gerou debate sobre constitucionalidade, já que a Constituição brasileira proíbe pena de morte exceto em estado de guerra.',
      'verified', false, '2022-04-14',
      'https://g1.globo.com/politica/noticia/2022/04/zambelli-pena-de-morte-vagabundos.ghtml',
      'news_article',
      'Redes sociais', 'Live no Instagram',
      'zambelli-pena-morte-vagabundos-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 15. Roberto Jefferson — carta a Cármen Lúcia (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson enviou carta pública à ministra Cármen Lúcia chamando-a de "prostituta" e fazendo ataques misóginos, levando à sua prisão.',
      'Cármen Lúcia, você é uma prostituta do poder. Vende seu corpo e sua dignidade ao sistema. Serva do mal.',
      'Carta publicada nas redes sociais de Jefferson em agosto de 2022. O STF determinou sua prisão preventiva por ataques à corte. Essa foi uma das razões para manter sua prisão domiciliar.',
      'verified', true, '2022-08-23',
      'https://g1.globo.com/politica/noticia/2022/08/jefferson-carta-carmen-lucia-prostituta.ghtml',
      'news_article',
      'Redes sociais', 'Publicação nas redes sociais',
      'jefferson-carta-carmen-lucia-prostituta-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 16. Daniel Silveira — "bandeira LGBTQ é do demônio" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_daniel,
      'Daniel Silveira publicou vídeo chamando a bandeira LGBTQ+ de "bandeira do demônio" e pedindo que fosse proibida em espaços públicos.',
      'Essa bandeira colorida é a bandeira do demônio. Não deveria ser permitida em nenhum espaço público. É uma ofensa à família e a Deus.',
      'Publicado em vídeo no YouTube em fevereiro de 2020. O vídeo foi derrubado pela plataforma após denúncias de discurso de ódio.',
      'verified', false, '2020-02-12',
      'https://www.youtube.com/watch?v=8pNJaA6p5Ts',
      'youtube_video',
      '8pNJaA6p5Ts',
      'Redes sociais', 'YouTube',
      'daniel-silveira-bandeira-lgbtq-demonio-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 17. Damares — "vou resolver o problema das meninas indígenas" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves afirmou que iria "tirar as crianças indígenas" das aldeias para educá-las em "casas de passagem" controladas pelo governo, gerando protesto de comunidades indígenas.',
      'Vamos criar casas de passagem para tirar as crianças indígenas das aldeias e educá-las com valores cristãos e respeito aos direitos humanos.',
      'Dito em pronunciamento no Ministério da Mulher em março de 2020. O CIMI e a FUNAI contestaram o projeto como violação de direitos de comunidades indígenas à autodeterminação.',
      'verified', false, '2020-03-11',
      'https://www.youtube.com/watch?v=J9mZV7pKnwU',
      'youtube_video',
      'J9mZV7pKnwU',
      'Pronunciamento', 'Ministério da Mulher, Família e Direitos Humanos',
      'damares-tirar-criancas-indigenas-casas-passagem-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 18. Moro — "Lula combinou com o povo" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Sérgio Moro disse que Lula "combinou tudo com o povo" ao criticar o resultado do STF que anulou suas condenações por suspeição.',
      'Lula combinou tudo. Combinou com o PT, combinou com o STF, combinou com o povo. É tudo combinado. Mas a história vai julgar.',
      'Dito em entrevista à CNN Brasil em junho de 2022, após o STF anular as condenações de Lula por suspeição de Moro. A afirmação de "combinação" não tinha base probatória apresentada.',
      'verified', false, '2022-06-23',
      'https://www.youtube.com/watch?v=I7sMv2M-PgQ',
      'youtube_video',
      'I7sMv2M-PgQ',
      'Entrevista', 'CNN Brasil',
      'moro-lula-combinou-stf-povo-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
