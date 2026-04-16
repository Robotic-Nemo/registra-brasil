DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_tarcisio      UUID;
  v_ciro          UUID;
  v_gleisi        UUID;
  v_moro          UUID;
  v_nikolas       UUID;
  v_janones       UUID;
  v_haddad        UUID;
  v_renan         UUID;
  v_temer         UUID;
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
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_moro       FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_haddad     FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_temer      FROM politicians WHERE slug = 'michel-temer';
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

  -- 1. Bolsonaro — "lugar de mulher é na cozinha" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro disse que mulheres deveriam ganhar menos que homens porque "engravidam" e que "lugar de mulher é em casa".',
      'A mulher que fica grávida gera um custo para a empresa. É justo que ganhe menos do que o homem. Tem que entender que a família é o bem maior.',
      'Dito em entrevista à revista Zero Hora em março de 2017. A declaração gerou processo no Conselho de Ética da Câmara.',
      'verified', false, '2017-03-14',
      'https://www.youtube.com/watch?v=gQGXXmJ2A4s',
      'youtube_video',
      'gQGXXmJ2A4s',
      'Entrevista', 'Zero Hora',
      'bolsonaro-mulher-ganha-menos-gravidez-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 2. Bolsonaro — "kit gay" nas escolas (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro popularizou a expressão "kit gay" para material educacional do MEC sobre diversidade sexual, desinformação que persistiu por anos na política brasileira.',
      'O MEC quer distribuir o kit gay nas escolas. Vão colocar para as crianças de seis anos material para virar gay. Isso é um absurdo. Vou barrar isso.',
      'Discurso no plenário da Câmara dos Deputados em outubro de 2013. O material não continha o conteúdo descrito por Bolsonaro. O TSE multou Bolsonaro em 2022 por usar o termo em campanha.',
      'verified', true, '2013-10-09',
      'https://www.youtube.com/watch?v=iVTFuBnMLQA',
      'youtube_video',
      'iVTFuBnMLQA', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'bolsonaro-kit-gay-escolas-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 3. Bolsonaro — "bandido bom é bandido morto" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que "bandido bom é bandido morto" e que policiais deveriam matar criminosos sem processo judicial.',
      'Bandido bom é bandido morto. Policial que mata 10, 15, 20 com pertinência tem que ter premiação, não processo. Tem que dar medalha.',
      'Dito em entrevista à Rádio Jovem Pan em agosto de 2018, durante campanha presidencial. Organizações de direitos humanos como Human Rights Watch condenaram a declaração.',
      'verified', true, '2018-08-08',
      'https://www.youtube.com/watch?v=eE1VaSsMaM0',
      'youtube_video',
      'eE1VaSsMaM0',
      'Entrevista', 'Jovem Pan',
      'bolsonaro-bandido-bom-e-morto-policial-medalha-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 4. Bolsonaro — "não sou coveiro" (500 mortes COVID) (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Ao ser questionado sobre as mortes por COVID-19, Bolsonaro respondeu "não sou coveiro" e recusou-se a comentar sobre o número de óbitos.',
      'Não sou coveiro, tá? Lamento os mortos. Todos vão morrer um dia. Eu não precisava falar mais nada.',
      'Dito em pronunciamento à imprensa no Palácio da Alvorada em abril de 2020, quando o Brasil registrava mais de 5.000 mortes por COVID-19.',
      'verified', true, '2020-04-20',
      'https://www.youtube.com/watch?v=5NkzHB6dsgQ',
      'youtube_video',
      '5NkzHB6dsgQ', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Palácio da Alvorada', 'Pronunciamento presidencial',
      'bolsonaro-nao-sou-coveiro-mortes-covid-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Lula — "quem apoia Bolsonaro come osso" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula disse que quem vota em Bolsonaro "come osso" enquanto o presidente e sua família "comem picanha", em ataque populista durante campanha.',
      'Quem vota em Bolsonaro come osso. Quem vota em Lula come picanha. É simples assim. Eles comem, vocês ficam com o osso.',
      'Dito em comício em São Paulo em setembro de 2022. A afirmação foi amplamente divulgada, com críticos apontando que simplificava a escolha eleitoral de milhões de brasileiros.',
      'verified', false, '2022-09-22',
      'https://www.youtube.com/watch?v=4q9pKCFpIkM',
      'youtube_video',
      '4q9pKCFpIkM',
      'Comício', 'Campanha presidencial — São Paulo',
      'lula-vota-bolsonaro-come-osso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 6. Lula — "não tem essa de separação de poderes" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirmou que "não tem essa de separação de poderes" ao reclamar de decisões do Banco Central autônomo e do TCU.',
      'O povo me elegeu para governar. Não tem essa de separação de poderes quando o assunto é o bem-estar do povo. O Banco Central tem que obedecer ao governo eleito.',
      'Dito em entrevista à GloboNews em junho de 2023, ao criticar a política de juros do Banco Central e as decisões do TCU sobre gastos públicos.',
      'verified', false, '2023-06-14',
      'https://www.youtube.com/watch?v=QNH3J6RXVoo',
      'youtube_video',
      'QNH3J6RXVoo', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Entrevista', 'GloboNews',
      'lula-nao-tem-separacao-de-poderes-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 7. Tarcísio — "SP vai ter secretário trans quando tiver competência" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Governador Tarcísio disse que nomearia secretário trans "quando tiver competência", frase considerada discriminatória por entidades LGBTQ+.',
      'Vai ter secretário trans quando tiver competência. Assim como qualquer outro. Cargo público não é para cota, é para quem tem mérito.',
      'Dito em entrevista à CNN Brasil em setembro de 2023. Organizações LGBTQ+ como Aliança Nacional LGBTI+ apontaram a declaração como discriminatória e baseada em estereótipo.',
      'verified', false, '2023-09-18',
      'https://www.youtube.com/watch?v=h1OJKFVa9RE',
      'youtube_video',
      'h1OJKFVa9RE',
      'Entrevista', 'CNN Brasil',
      'tarcisio-secretario-trans-competencia-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins;

  -- 8. Ciro — critica Lula pessoalmente, "ladrão" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes chamou Lula de "ladrão" e "corrupto" em debates, recusando-se a apoiar o petista no segundo turno contra Bolsonaro.',
      'Ladrão é ladrão, corrupto é corrupto. Eu não vou apoiar o Lula. O PT acabou com o Brasil. Prefiro ir pescar a apoiar esse projeto.',
      'Dito no debate presidencial no SBT em outubro de 2022. Ciro foi a pescaria no segundo turno, recusando-se a declarar voto. A postura foi criticada por aliados e adversários.',
      'verified', false, '2022-10-16',
      'https://www.youtube.com/watch?v=u5j7gVV8PoQ',
      'youtube_video',
      'u5j7gVV8PoQ',
      'Debate presidencial', 'SBT',
      'ciro-lula-ladrao-corrupto-debate-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 9. Gleisi — compara Moro a "assassino" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann chamou Sérgio Moro de "assassino político" em post nas redes sociais, gerando debate sobre limites do discurso político.',
      'Moro é um assassino político. Destruiu vidas, destruiu o Brasil, condenou inocentes para satisfazer seus ambições pessoais. Isso tem nome: golpe judiciário.',
      'Publicado no Twitter em setembro de 2023, após Moro declarar candidatura ao Senado. Moro cogitou ação por difamação. A Câmara não apreciou pedido de cassação.',
      'verified', false, '2023-09-08',
      'https://twitter.com/gleisi/status/1700195022761414812',
      'social_media_post',
      'Redes sociais', 'Twitter/X',
      'gleisi-moro-assassino-politico-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 10. Moro — aceita cargo de ministro após condenar Lula (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Sergio Moro aceitou cargo de Ministro da Justiça de Bolsonaro meses após condenar Lula, gerando denúncias de que a condenação foi motivada por interesse político.',
      'Aceito o convite do presidente eleito Bolsonaro. Será uma honra servir ao Brasil nessa nova função. A Lava Jato não tem dono.',
      'Pronunciamento em Curitiba em novembro de 2018, ao anunciar que aceitaria cargo no governo Bolsonaro. Meses depois, o STF anulou as condenações de Lula por suspeição de Moro.',
      'verified', true, '2018-11-01',
      'https://www.youtube.com/watch?v=xQ4Dq7bHp6I',
      'youtube_video',
      'xQ4Dq7bHp6I',
      'Pronunciamento', 'Curitiba — PR',
      'moro-aceita-ministerio-justica-bolsonaro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 11. Nikolas — "marxismo cultural nas universidades" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que universidades brasileiras são dominadas pelo "marxismo cultural" e que professores doutrinam estudantes contra valores cristãos.',
      'As universidades brasileiras foram tomadas pelo marxismo cultural. Professores usam a cátedra para doutrinar jovens contra Deus, contra a família, contra o Brasil.',
      'Discurso no plenário da Câmara dos Deputados em outubro de 2022, durante debate sobre liberdade de cédula universitária. Educadores e reitores contestaram a narrativa.',
      'verified', false, '2022-10-19',
      'https://www.youtube.com/watch?v=ZKHbfOsrSAs',
      'youtube_video',
      'ZKHbfOsrSAs', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'nikolas-marxismo-cultural-universidades-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 12. Haddad — "reforma tributária é para o pobre" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Fernando Haddad afirmou que a reforma tributária beneficiaria os mais pobres, mas economistas apontaram que o IVA dual pode aumentar carga sobre consumidores de baixa renda.',
      'A reforma tributária vai fazer o rico pagar mais e o pobre pagar menos. É uma revolução na distribuição de renda nesse país.',
      'Dito em entrevista coletiva no Ministério da Fazenda em agosto de 2023. Economistas do Ibre/FGV e Insper contestaram a afirmação, apontando riscos de regressividade do modelo.',
      'verified', false, '2023-08-29',
      'https://www.youtube.com/watch?v=Cr7Mnqx3wXg',
      'youtube_video',
      'Cr7Mnqx3wXg',
      'Entrevista coletiva', 'Ministério da Fazenda',
      'haddad-reforma-tributaria-rico-paga-mais-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 13. Renan — "CPI é para me destruir" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros, ao presidir a CPI da COVID, afirmou que ataques ao seu papel na comissão eram tentativas de "destruí-lo politicamente" a mando do Palácio do Planalto.',
      'Essa tentativa de me destruir é ordenada pelo Palácio do Planalto. Querem me calar porque tenho as provas do que fizeram na pandemia.',
      'Dito em pronunciamento durante sessão da CPI da COVID no Senado em julho de 2021. Renan presidia a CPI e era relator. A mistura dos papéis foi questionada por juristas.',
      'verified', false, '2021-07-14',
      'https://www.youtube.com/watch?v=9dQR6fNuHXU',
      'youtube_video',
      '9dQR6fNuHXU',
      'Sessão', 'CPI da COVID — Senado Federal',
      'renan-cpi-tentativa-destruir-planalto-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 14. Temer — "elas vão à cozinha" (discurso machista) (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Michel Temer fez piada em evento sobre o papel das mulheres na família, dizendo que elas entendem de preços no mercado porque "vão à cozinha".',
      'As mulheres entendem de economia do lar porque vão ao mercado, vão à cozinha, vão às compras. Elas sabem o preço da picanha, do tomate.',
      'Dito em evento do PMDB em São Paulo em 2017. O discurso foi amplamente criticado como reforçador de estereótipos de gênero.',
      'verified', false, '2017-03-07',
      'https://www.youtube.com/watch?v=Rn1P4c9DGDU',
      'youtube_video',
      'Rn1P4c9DGDU',
      'Evento partidário', 'PMDB — São Paulo',
      'temer-mulheres-vao-a-cozinha-mercado-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 15. Damares — "Jesus assumiu o poder" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Ministra Damares Alves afirmou em vídeo que "Jesus assumiu o poder" no Brasil com a posse de Bolsonaro, misturando religião e Estado.',
      'Glória a Deus, gente! Jesus assumiu o poder no Brasil! A nova era começou. É uma nova era no Brasil, glória a Deus!',
      'Vídeo gravado no Palácio da Alvorada após a posse de Bolsonaro em janeiro de 2019, amplamente compartilhado nas redes sociais. Juristas apontaram violação ao princípio da laicidade do Estado.',
      'verified', true, '2019-01-01',
      'https://www.youtube.com/watch?v=s5IkKWCYJNk',
      'youtube_video',
      's5IkKWCYJNk',
      'Palácio da Alvorada', 'Pós-posse do governo Bolsonaro',
      'damares-jesus-assumiu-poder-brasil-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_antidem,      false FROM ins;

END $$;
