DO $$
DECLARE
  v_bolsonaro   UUID;
  v_damares     UUID;

  c_racismo     UUID;
  c_misoginia   UUID;
  c_homofobia   UUID;
  c_antidem     UUID;
  c_desinform   UUID;
  c_odio        UUID;

BEGIN
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_damares   FROM politicians WHERE slug = 'damares-alves';

  SELECT id INTO c_racismo   FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_misoginia FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_homofobia FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_antidem   FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_desinform FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odio      FROM categories WHERE slug = 'discurso-de-odio';

  -- 1. Quilombolas (1995/2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que quilombolas "não servem nem para procriar" e que "o afrodescendente mais leve lá pesava sete arrobas".',
      'Fui num quilombola em El Dourado Paulista. Olha, o afrodescendente mais leve lá pesava sete arrobas. Não fazem nada. Eu acho que nem para procriador ele serve mais.',
      'Discurso proferido na Marcha para Jesus em São Paulo em 1995, reproduzido em sessão da Câmara dos Deputados em 2017.',
      'verified', true, '2017-04-04',
      'https://www.youtube.com/watch?v=5DnUPTSMBBk',
      'youtube_video',
      '5DnUPTSMBBk', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Câmara dos Deputados', 'Sessão Plenária',
      'bolsonaro-quilombolas-nao-servem-para-procriar-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 2. Maria do Rosário (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro disse à deputada Maria do Rosário que não a estupraria "porque você não merece", após ela o chamar de estuprador.',
      'Não te estupro porque você não merece.',
      'Dito no corredor da Câmara dos Deputados à deputada Maria do Rosário (PT-RS) após debate sobre redução da maioridade penal. O STF confirmou a declaração.',
      'verified', true, '2014-12-09',
      'https://www.youtube.com/watch?v=nl6TBQUzq4E',
      'youtube_video',
      'nl6TBQUzq4E',
      'Câmara dos Deputados', 'Corredor — debate sobre maioridade penal',
      'bolsonaro-nao-te-estupro-porque-nao-merece-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 3. Filho gay (2011)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que preferiria que seu filho morresse em um acidente do que "aparecesse com um bigodudo" — referindo-se a um filho homossexual.',
      'Se eu tiver um filho gay, prefiro que ele morra num acidente a aparecer com um bigodudo por aí.',
      'Dito em entrevista ao programa CQC da Band, ao ser questionado sobre homossexualidade.',
      'verified', true, '2011-03-07',
      'https://www.youtube.com/watch?v=OvOMzHzMLCY',
      'youtube_video',
      'OvOMzHzMLCY',
      'Programa de TV', 'CQC — Band',
      'bolsonaro-filho-gay-prefiro-que-morra-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 4. Exército povo fardado (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em pronunciamento oficial, Bolsonaro afirmou que o Exército é "o povo fardado" e sinalizou dependência das Forças Armadas para "a manutenção da ordem".',
      'O nosso Exército, a nossa Marinha, a nossa Aeronáutica são o povo fardado. E o povo só vai à guerra quando acredita na luta.',
      'Pronunciamento no Palácio da Alvorada durante crise eleitoral pós-2022. Contextualizado por analistas como apelo implícito a intervenção militar.',
      'verified', false, '2022-11-01',
      'https://www.youtube.com/watch?v=4lMf9mNqlzg',
      'youtube_video',
      '4lMf9mNqlzg', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Palácio da Alvorada', 'Pronunciamento Oficial',
      'bolsonaro-exercito-povo-fardado-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 5. Damares — menino azul menina rosa (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Ministra Damares Alves anunciou "nova era" em que "menino veste azul e menina veste rosa", em discurso de posse como Ministra da Mulher, Família e Direitos Humanos.',
      'Atenção! É uma nova era no Brasil. Menino veste azul e menina veste rosa.',
      'Discurso proferido logo após tomar posse como Ministra da Mulher, da Família e dos Direitos Humanos no governo Bolsonaro.',
      'verified', true, '2019-01-02',
      'https://www.youtube.com/watch?v=OYw4g91GPAM',
      'youtube_video',
      'OYw4g91GPAM',
      'Cerimônia de Posse', 'Posse da Ministra — Governo Bolsonaro',
      'damares-menino-azul-menina-rosa-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 6. Vacina e AIDS (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que dados do governo britânico mostrariam que vacinados contra Covid-19 têm maior chance de desenvolver AIDS.',
      'Quem toma a vacina da Pfizer... os dados oficiais do governo inglês dizem que eles têm uma capacidade imunológica baixíssima. Pode estar desenvolvendo a AIDS.',
      'Dito em live semanal. O governo britânico desmentiu a interpretação. A OMS classificou como desinformação.',
      'verified', true, '2021-10-22',
      'https://www.youtube.com/watch?v=Pg_q0i8C14s',
      'youtube_video',
      'Pg_q0i8C14s',
      'Live semanal', 'Live presidencial — Facebook/YouTube',
      'bolsonaro-vacina-aids-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
