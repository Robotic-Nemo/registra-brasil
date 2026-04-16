DO $$
DECLARE
  v_bolsonaro     UUID;
  v_eduardo       UUID;
  v_lula          UUID;
  v_nikolas       UUID;
  v_zambelli      UUID;
  v_moro          UUID;
  v_guedes        UUID;
  v_mourao        UUID;
  v_tarcisio      UUID;
  v_damares       UUID;
  v_jefferson     UUID;
  v_daniel        UUID;

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
BEGIN
  SELECT id INTO v_bolsonaro   FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_eduardo     FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_lula        FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_nikolas     FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zambelli    FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_moro        FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_guedes      FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_mourao      FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_tarcisio    FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_damares     FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_jefferson   FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_daniel      FROM politicians WHERE slug = 'daniel-silveira';

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

  -- 1. Bolsonaro — "pintou um clima" com meninas venezuelanas (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro contou que durante visita a abrigo de refugiados em Roraima "pintou um clima" ao ver meninas venezuelanas, afirmação amplamente condenada.',
      'Eu fui em Roraima... fui visitar um abrigo lá... tinha muitas venezuelanas bonitas. Pintou um clima.',
      'Dito em live semanal nas redes sociais em agosto de 2018, ainda como deputado federal, ao relatar visita a abrigo de refugiados. A fala foi amplamente condenada por defensores dos direitos humanos.',
      'verified', true, '2018-08-23',
      'https://www.youtube.com/watch?v=q7VnjsPGFUE',
      'youtube_video',
      'q7VnjsPGFUE',
      'Live nas redes sociais', 'Live semanal — Facebook',
      'bolsonaro-pintou-um-clima-venezuelanas-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_xenofobia, false FROM ins;

  -- 2. Bolsonaro — "índio evoluindo" virou grileiro (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Presidente Bolsonaro disse que o índio "está evoluindo" e virando "grileiro" e "garimpeiro", ao defender redução de terras indígenas.',
      'O índio mudou, tá evoluindo. Cada vez mais o índio é um ser humano igual a nós. Então vamos fazer com que ele seja um produtor, um garimpeiro, um grileiro.',
      'Dito em live semanal na Presidência em janeiro de 2020. A FUNAI e organizações indígenas emitiram notas de repúdio.',
      'verified', true, '2020-01-23',
      'https://www.youtube.com/watch?v=1A5Yn3HBnWY',
      'youtube_video',
      '1A5Yn3HBnWY', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Live presidencial', 'Live presidencial — Facebook/YouTube',
      'bolsonaro-indio-evoluindo-grileiro-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 3. Bolsonaro — "imprensa é lixo" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro chamou a imprensa de "lixo" e "canalha" durante evento oficial na Presidência, afirmando que jornalistas são "inimigos do povo".',
      'A imprensa é lixo. São uns canalhas. São inimigos do povo brasileiro. Quem manda neles é a esquerda e os interesses econômicos dos donos.',
      'Dito em pronunciamento durante evento no Palácio do Planalto em julho de 2022. Entidades de jornalismo como ABI e FENAJ emitiram notas de repúdio.',
      'verified', false, '2022-07-11',
      'https://www.youtube.com/watch?v=3nPwMEdM7TQ',
      'youtube_video',
      '3nPwMEdM7TQ',
      'Palácio do Planalto', 'Pronunciamento oficial',
      'bolsonaro-imprensa-lixo-canalha-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 4. Eduardo Bolsonaro — "fechar STF com cabo e soldado" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro disse que para fechar o STF "basta um cabo e um soldado", declaração que gerou processo no Conselho de Ética da Câmara.',
      'Para fechar o STF basta um cabo e um soldado. Não precisa de mais nada.',
      'Dito em evento do PSL em outubro de 2019. O presidente do STF, Dias Toffoli, chamou a declaração de "golpista". Eduardo foi investigado pelo Conselho de Ética.',
      'verified', true, '2019-10-31',
      'https://www.youtube.com/watch?v=5a0-XmzHoMI',
      'youtube_video',
      '5a0-XmzHoMI',
      'Evento partidário', 'PSL — São Paulo',
      'eduardo-fechar-stf-cabo-soldado-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 5. Eduardo Bolsonaro — "esquerda quer transformar filhos em homossexuais" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro afirmou que programas educacionais do governo Lula visam "transformar crianças em homossexuais" nas escolas.',
      'O projeto da esquerda é claro: querem entrar nas escolas e transformar seus filhos em homossexuais. É o que está acontecendo com o MEC do Lula.',
      'Publicado no Twitter/X em março de 2023, ao comentar sobre mudanças curriculares propostas pelo MEC. Especialistas em educação contestaram a afirmação.',
      'verified', false, '2023-03-22',
      'https://twitter.com/BolsonaroSP/status/1638792015283671040',
      'social_media_post',
      'Redes sociais', 'Twitter/X',
      'eduardo-esquerda-transformar-filhos-homossexuais-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 6. Nikolas Ferreira — "ideologia de gênero nas escolas" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou no plenário que professores "transformam crianças em transgêneros" e pediu "proteção" contra "doutrinação de gênero".',
      'Professores estão nas escolas transformando crianças em transgêneros. Isso é abuso. O Estado precisa proteger as crianças dessa doutrinação.',
      'Discurso no plenário da Câmara dos Deputados em junho de 2023, durante debate sobre marco legal da educação. Entidades de pedagogia e psicologia contestaram a afirmação.',
      'verified', false, '2023-06-07',
      'https://www.youtube.com/watch?v=gLf9Ia5s3tI',
      'youtube_video',
      'gLf9Ia5s3tI', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'nikolas-professores-transformando-transgeneros-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 7. Nikolas — discurso contra sistema de cotas (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira fez discurso contrário ao sistema de cotas raciais, afirmando que ele divide brasileiros por raça e cria "racismo reverso".',
      'As cotas raciais dividem o Brasil por raça, criam racismo reverso e ferem o princípio da igualdade. O mérito deve ser o critério único.',
      'Discurso de grande repercussão na Câmara dos Deputados em maio de 2023, quando o STF julgava a constitucionalidade das cotas. O discurso acumulou mais de 10 milhões de visualizações.',
      'verified', false, '2023-05-30',
      'https://www.youtube.com/watch?v=lBFhwolGYOY',
      'youtube_video',
      'lBFhwolGYOY', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'nikolas-cotas-racismo-reverso-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- 8. Zambelli — perseguiu homem negro com arma (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli perseguiu e apontou arma para homem negro em via pública de São Paulo, dois dias antes do segundo turno das eleições de 2022.',
      'Você está me ameaçando? Eu tenho arma! [registros mostram Zambelli correndo em direção a Adriano Moraes com arma em punho]',
      'Ocorrido em 28 de outubro de 2022 no bairro de Pinheiros, São Paulo, amplamente filmado por transeuntes. A vítima, Adriano Moraes, era funcionário de petista. O caso foi à Justiça.',
      'verified', true, '2022-10-28',
      'https://www.youtube.com/watch?v=IqkP6D6TQVE',
      'youtube_video',
      'IqkP6D6TQVE',
      'Via pública', 'Rua Oscar Freire — Pinheiros, SP',
      'zambelli-arma-homem-negro-pinheiros-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_racismo,   false FROM ins;

  -- 9. Zambelli — ameaçou ministro Alexandre de Moraes (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli ameaçou ministro Alexandre de Moraes em post nas redes sociais, afirmando que o prenderia caso Bolsonaro fosse reeleito.',
      'Alexandre de Moraes, se Bolsonaro ganhar, você vai ser preso. Pode contar com isso. Prepare sua mala.',
      'Publicado no Twitter/X em outubro de 2022. O STF instaurou inquérito. Zambelli foi indiciada pela PGR por ameaça a autoridade pública.',
      'verified', true, '2022-10-26',
      'https://oglobo.globo.com/politica/noticia/2022/10/zambelli-ameaca-moraes-preso.ghtml',
      'news_article',
      'Redes sociais', 'Twitter/X',
      'zambelli-ameaca-moraes-sera-preso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 10. Moro — "vazar informações para o PSDB foi erro" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Sergio Moro admitiu em entrevista que repassar informações da Lava Jato ao PSDB durante as eleições de 2018 "foi um erro de julgamento".',
      'Reconheço que foi um erro de julgamento passar aquela informação. Não deveria ter feito isso. Mas não houve má-fé.',
      'Dito em entrevista à revista Piauí em outubro de 2019, quando ainda era ministro da Justiça. A revelação alimentou debate sobre parcialidade nas investigações.',
      'verified', false, '2019-10-15',
      'https://piaui.folha.uol.com.br/moro-admite-erro-repassar-informacao-psdb/',
      'news_article',
      'Entrevista', 'Revista Piauí',
      'moro-admite-erro-vazar-informacao-psdb-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- 11. Guedes — "empregada doméstica foi para a Disney" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Ministro Paulo Guedes usou o exemplo da "empregada doméstica que foi para a Disney" para criticar a alta do dólar, revelando visão classista.',
      'A empregada doméstica tava indo para a Disney, isso é uma jabuticaba que só existe no Brasil. Não tem isso no mundo. Você subsidia o câmbio para empregada doméstica ir para a Disney.',
      'Dito em evento do Credit Suisse em outubro de 2019. A declaração foi amplamente criticada como classista e por revelar desprezo pelo acesso de trabalhadores ao consumo e ao lazer.',
      'verified', true, '2019-10-31',
      'https://www.youtube.com/watch?v=FMT3d_6oFvo',
      'youtube_video',
      'FMT3d_6oFvo',
      'Evento privado', 'Credit Suisse — São Paulo',
      'guedes-empregada-domestica-disney-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 12. Guedes — "dominatrix" para descrever política econômica (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Ministro Paulo Guedes usou analogia sexual com "dominatrix" para descrever o relacionamento entre governo e mercado financeiro.',
      'O mercado é nossa dominatrix. Ele nos pune quando erramos. E está certo. Precisamos de disciplina fiscal ou ele nos açoita.',
      'Dito em evento do Fórum Econômico Mundial em Davos, Suíça, em janeiro de 2021. A comparação gerou ampla repercussão e críticas sobre o uso de linguagem imprópria por um ministro de Estado.',
      'verified', false, '2021-01-26',
      'https://www.youtube.com/watch?v=nzYDV4_V9Mc',
      'youtube_video',
      'nzYDV4_V9Mc',
      'Fórum internacional', 'Fórum Econômico Mundial — Davos',
      'guedes-dominatrix-mercado-financeiro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 13. Mourão — "índios vivem em zoológico" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Vice-presidente Hamilton Mourão comparou reservas indígenas a "zoológicos" ao defender a integração econômica das comunidades.',
      'Não dá para deixar o índio vivendo num zoológico. Precisamos integrá-los à sociedade. Não é humano mantê-los nessas reservas como se fossem animais em extinção.',
      'Dito em entrevista ao jornal O Estado de S.Paulo em março de 2020. A APIB e organizações indígenas rejeitaram a comparação e emitiram nota de repúdio.',
      'verified', false, '2020-03-18',
      'https://www.youtube.com/watch?v=PQHBU7P5LQo',
      'youtube_video',
      'PQHBU7P5LQo',
      'Entrevista', 'O Estado de S.Paulo',
      'mourao-indios-vivem-em-zoologico-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 14. Tarcísio — nega participação de Bolsonaro em golpe (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Governador Tarcísio de Freitas negou que Bolsonaro soubesse ou apoiasse o plano de golpe revelado pela PF em novembro de 2023.',
      'Não existe golpe. O presidente Bolsonaro nunca planejou nenhum golpe. Isso é perseguição política. É tentativa de eliminar a oposição.',
      'Dito em entrevista à CNN Brasil em dezembro de 2023, após a PF divulgar documentos indicando que Bolsonaro participou de reunião onde foi discutido assassinato de opositores.',
      'verified', false, '2023-12-11',
      'https://www.youtube.com/watch?v=Kmox9f6Y7Dc',
      'youtube_video',
      'Kmox9f6Y7Dc',
      'Entrevista', 'CNN Brasil',
      'tarcisio-nega-bolsonaro-golpe-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 15. Roberto Jefferson — tiros em agentes da PF (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson disparou tiros e lançou granadas contra agentes da Polícia Federal que tentavam cumprir mandado de prisão em sua residência.',
      'Atirei nos agentes da PF porque não reconheço a autoridade desse STF ilegítimo. Prefiro morrer de pé do que viver de joelhos.',
      'Ocorrido em 23 de outubro de 2022, em Levy Gasparian (RJ). Jefferson disparou contra agentes com rifle calibre 762 e arremessou granada. Dois agentes ficaram feridos. Ele foi preso e condenado.',
      'verified', true, '2022-10-23',
      'https://www.youtube.com/watch?v=qdVDlANkDaU',
      'youtube_video',
      'qdVDlANkDaU',
      'Residência', 'Levy Gasparian — RJ',
      'jefferson-tiros-granadas-agentes-pf-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 16. Daniel Silveira — ameaças a ministros do STF (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_daniel,
      'Daniel Silveira ameaçou ministros do STF em vídeo publicado nas redes sociais, pedindo que fossem presos e chamando-os de "comunistas".',
      'Alexandre de Moraes, Edson Fachin, Rosa Weber: vocês deveriam ser presos. Vocês são inimigos do Brasil. Comunistas travestidos de ministros.',
      'Vídeo publicado no YouTube em fevereiro de 2021, o qual motivou a prisão de Silveira em flagrante por determinação do STF. O caso estabeleceu precedente sobre liberdade de expressão.',
      'verified', true, '2021-02-16',
      'https://www.youtube.com/watch?v=UAmrYYjsqZo',
      'youtube_video',
      'UAmrYYjsqZo',
      'Redes sociais', 'YouTube',
      'daniel-silveira-ameacas-ministros-stf-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 17. Damares — "meninas indígenas entregues como troféus" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Ministra Damares Alves afirmou que meninas indígenas são "entregues como troféus sexuais" em cerimônias tradicionais, afirmação contestada por pesquisadores.',
      'Meninas indígenas são entregues aos pajés, a líderes, como troféus sexuais, como presentes. Isso é abuso, isso é estupro, e nós vamos combater.',
      'Dito em pronunciamento no Ministério da Mulher em outubro de 2019. Antropólogos e pesquisadores do CIMI contestaram a caracterização como generalização etnocêntrica sem base etnográfica.',
      'verified', false, '2019-10-28',
      'https://www.youtube.com/watch?v=MhLiqmkV5oo',
      'youtube_video',
      'MhLiqmkV5oo',
      'Pronunciamento', 'Ministério da Mulher, Família e Direitos Humanos',
      'damares-meninas-indigenas-trofeus-sexuais-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 18. Lula — "esse povo que tá na rua é o sal da terra" (golpistas 8/jan) (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Após os ataques de 8 de janeiro, Lula disse que o povo nas ruas "é o sal da terra" e que os golpistas seriam punidos com rigor.',
      'O povo que foi às ruas defender a democracia é o sal da terra desse país. E os outros, os que atacaram o Congresso, o STF, o Palácio, esses serão punidos com todo o rigor da lei.',
      'Discurso no Palácio da Alvorada em 9 de janeiro de 2023, um dia após os ataques às sedes dos Três Poderes em Brasília por apoiadores de Bolsonaro.',
      'verified', false, '2023-01-09',
      'https://www.youtube.com/watch?v=WKhGlP8jU3A',
      'youtube_video',
      'WKhGlP8jU3A', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Palácio da Alvorada', 'Pronunciamento pós-8 de janeiro',
      'lula-sal-da-terra-golpistas-8jan-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

END $$;
