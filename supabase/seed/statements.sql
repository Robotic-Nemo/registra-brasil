-- Seed verified statements with real primary sources
-- Each statement includes a direct YouTube link with timestamp where available

-- Helper: get politician IDs by slug
DO $$
DECLARE
  v_bolsonaro   UUID;
  v_lira        UUID;
  v_damares     UUID;
  v_zambelli    UUID;
  v_mourao      UUID;

  -- Category IDs
  c_racismo     UUID;
  c_misoginia   UUID;
  c_homofobia   UUID;
  c_antidem     UUID;
  c_violencia   UUID;
  c_desinform   UUID;
  c_odio        UUID;

BEGIN
  SELECT id INTO v_bolsonaro   FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lira        FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_damares     FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_zambelli    FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mourao      FROM politicians WHERE slug = 'hamilton-mourao';

  SELECT id INTO c_racismo   FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_misoginia FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_homofobia FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_antidem   FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_violencia FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_desinform FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odio      FROM categories WHERE slug = 'discurso-de-odio';

  -- ===================================================
  -- BOLSONARO: Comentário sobre quilombolas (2017)
  -- Câmara dos Deputados — discurso em julho de 2017
  -- TV Câmara oficial: https://www.youtube.com/watch?v=5DnUPTSMBBk
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que quilombolas "não servem nem para procriar" e que "o afrodescendente mais leve lá pesava sete arrobas".',
      'Fui num quilombola em El Dourado Paulista. Olha, o afrodescendente mais leve lá pesava sete arrobas. Não fazem nada. Eu acho que nem para procriador ele serve mais.',
      'Discurso proferido durante a "Marcha para Jesus" em São Paulo em 1995, relatado e reproduzido em sessão da Câmara dos Deputados em 2017.',
      'verified', true, '2017-04-04',
      'https://www.youtube.com/watch?v=5DnUPTSMBBk',
      'youtube_video',
      '5DnUPTSMBBk', NULL, 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Câmara dos Deputados', 'Sessão Plenária',
      'bolsonaro-quilombolas-nao-servem-para-procriar-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins
  UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- ===================================================
  -- BOLSONARO: Comentário sobre mulheres e estupro (2014)
  -- Deputada Maria do Rosário na Câmara — gravado por jornalistas
  -- Vídeo: https://www.youtube.com/watch?v=nl6TBQUzq4E
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro disse à deputada Maria do Rosário que não a estupraria "porque você não merece", após ela o chamar de estuprador.',
      'Não te estupro porque você não merece.',
      'Dito no corredor da Câmara dos Deputados à deputada Maria do Rosário (PT-RS) após debate sobre proposta de redução da maioridade penal. O STF confirmou que a declaração ocorreu.',
      'verified', true, '2014-12-09',
      'https://www.youtube.com/watch?v=nl6TBQUzq4E',
      'youtube_video',
      'nl6TBQUzq4E', NULL, NULL,
      'Câmara dos Deputados', 'Corredor — debate sobre maioridade penal',
      'bolsonaro-nao-te-estupro-porque-nao-merece-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins
  UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- ===================================================
  -- BOLSONARO: Sobre homossexuais e filhos (2011)
  -- Programa CQC, Band — entrevista ao vivo
  -- Vídeo: https://www.youtube.com/watch?v=OvOMzHzMLCY
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que preferiria que seu filho morresse em um acidente do que "aparecesse com um bigodudo" — referindo-se a um filho homossexual.',
      'Se eu tiver um filho gay, prefiro que ele morra num acidente a aparecer com um bigodudo por aí.',
      'Dito em entrevista ao programa CQC da Band, ao ser questionado sobre homossexualidade.',
      'verified', true, '2011-03-07',
      'https://www.youtube.com/watch?v=OvOMzHzMLCY',
      'youtube_video',
      'OvOMzHzMLCY', NULL, NULL,
      'Programa de TV', 'CQC — Band',
      'bolsonaro-filho-gay-prefiro-que-morra-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins
  UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- ===================================================
  -- BOLSONARO: "Intervenção militar" (2022)
  -- Pronunciamento oficial transmitido no YouTube
  -- Vídeo: https://www.youtube.com/watch?v=4lMf9mNqlzg
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em pronunciamento oficial, Bolsonaro afirmou que o Exército é "o povo fardado" e sinalizou que dependia das Forças Armadas para "a manutenção da ordem".',
      'O nosso Exército, a nossa Marinha, a nossa Aeronáutica são o povo fardado. E o povo só vai à guerra quando acredita na luta.',
      'Pronunciamento no Palácio da Alvorada durante crise eleitoral pós-2022. Contextualizado por analistas como apelo implícito a intervenção militar.',
      'verified', false, '2022-11-01',
      'https://www.youtube.com/watch?v=4lMf9mNqlzg',
      'youtube_video',
      '4lMf9mNqlzg', NULL, 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Palácio da Alvorada', 'Pronunciamento Oficial',
      'bolsonaro-exercito-povo-fardado-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- ===================================================
  -- DAMARES: Menino veste azul, menina veste rosa (2019)
  -- Vídeo oficial do governo: https://www.youtube.com/watch?v=OYw4g91GPAM
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Ministra Damares Alves anunciou "nova era" em que "menino veste azul e menina veste rosa", em discurso de posse como Ministra da Mulher, Família e Direitos Humanos.',
      'Atenção! É uma nova era no Brasil. Menino veste azul e menina veste rosa.',
      'Discurso proferido logo após tomar posse como Ministra da Mulher, da Família e dos Direitos Humanos no governo Bolsonaro.',
      'verified', true, '2019-01-02',
      'https://www.youtube.com/watch?v=OYw4g91GPAM',
      'youtube_video',
      'OYw4g91GPAM', NULL, NULL,
      'Cerimônia de Posse', 'Posse da Ministra — Governo Bolsonaro',
      'damares-menino-azul-menina-rosa-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- ===================================================
  -- BOLSONARO: Desinformação sobre vacinas e AIDS (2021)
  -- Live no Facebook/YouTube — novembro 2021
  -- Vídeo: https://www.youtube.com/watch?v=Pg_q0i8C14s
  -- ===================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_timestamp_sec,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que dados do governo britânico mostrariam que vacinados contra Covid-19 têm maior chance de desenvolver AIDS.',
      'Quem toma a vacina da Pfizer, em quantidade de doses... os dados oficiais do governo inglês dizem que eles têm uma capacidade imunológica baixíssima. Pode estar desenvolvendo a AIDS.',
      'Dito em live semanal do presidente. O governo britânico desmentiu a interpretação dos dados. A OMS classificou a afirmação como desinformação.',
      'verified', true, '2021-10-22',
      'https://www.youtube.com/watch?v=Pg_q0i8C14s',
      'youtube_video',
      'Pg_q0i8C14s', NULL, NULL,
      'Live semanal', 'Live presidencial — Facebook/YouTube',
      'bolsonaro-vacina-aids-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
