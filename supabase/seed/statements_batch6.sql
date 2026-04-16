DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_gleisi        UUID;
  v_ciro          UUID;
  v_temer         UUID;
  v_renan         UUID;
  v_feliciano     UUID;
  v_janones       UUID;
  v_salles        UUID;
  v_biakicis      UUID;
  v_valdemar      UUID;
  v_magno         UUID;

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
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_temer      FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_salles     FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_biakicis   FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_valdemar   FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';

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

  -- 1. Bolsonaro — "homossexual eu não tenho" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou "homossexual eu não tenho" ao ser perguntado se teria um filho gay, repetindo discurso de rejeição à homossexualidade.',
      'Homossexual eu não tenho. Mas se tivesse, me envergonharia. Não criei meus filhos para ser assim.',
      'Dito em entrevista à Folha de S.Paulo durante a campanha presidencial de 2018, ao ser questionado sobre o comentário anterior de que preferia filho morto a filho gay.',
      'verified', false, '2018-09-10',
      'https://www.youtube.com/watch?v=oHlYH3L8lp4',
      'youtube_video',
      'oHlYH3L8lp4',
      'Entrevista', 'Folha de S.Paulo',
      'bolsonaro-homossexual-nao-tenho-envergonharia-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 2. Bolsonaro — "torturador Brilhante Ustra, herói" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em seu voto pelo impeachment de Dilma Rousseff, Bolsonaro dedicou o voto ao coronel Carlos Brilhante Ustra, torturador confesso da ditadura militar.',
      'Pelo exército brasileiro... pelo ministro Marco Aurélio Mello... pela memória do coronel Carlos Alberto Brilhante Ustra, o pavor de Dilma Rousseff... o meu voto é sim!',
      'Discurso no plenário da Câmara dos Deputados em 17 de abril de 2016, durante votação do processo de impeachment de Dilma Rousseff. Ustra foi reconhecido por sentença judicial como torturador.',
      'verified', true, '2016-04-17',
      'https://www.youtube.com/watch?v=gB3oGOJSF5Q',
      'youtube_video',
      'gB3oGOJSF5Q', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados — Votação do Impeachment',
      'bolsonaro-voto-ustra-torturador-heroi-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 3. Bolsonaro — "chega de frescura, de mimimi" sobre mortes COVID (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro pediu que brasileiros parassem de "frescura" e "mimimi" diante de mais de 300 mil mortes pela COVID-19 no Brasil.',
      'Chega de frescura e de mimimi. Até quando você vai ficar chorando? Chega! Quantos empregos foram perdidos? O Brasil precisa voltar à normalidade.',
      'Dito em pronunciamento à imprensa no Palácio da Alvorada em março de 2021, quando o Brasil atingia 300 mil mortes por COVID-19. Gerou forte reação internacional.',
      'verified', true, '2021-03-12',
      'https://www.youtube.com/watch?v=8nwVHyJQHLk',
      'youtube_video',
      '8nwVHyJQHLk', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Palácio da Alvorada', 'Pronunciamento presidencial',
      'bolsonaro-frescura-mimimi-mortes-covid-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 4. Bolsonaro — negacionismo climático na ONU (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em seu discurso na ONU, Bolsonaro afirmou que a Amazônia "não está queimando" e atacou as ONG ambientalistas.',
      'A Amazônia não está queimando. Isso é mentira. São dados falsos. As ONGs que se beneficiam dessas mentiras estão por trás desses incêndios.',
      'Discurso na Assembleia Geral da ONU em setembro de 2019, dias após o Brasil registrar recorde histórico de queimadas na Amazônia. O INPE havia publicado dados contrários.',
      'verified', true, '2019-09-24',
      'https://www.youtube.com/watch?v=bMZdUiCKYOA',
      'youtube_video',
      'bMZdUiCKYOA',
      'Assembleia Geral', 'ONU — Nova York',
      'bolsonaro-amazonia-nao-queimando-onu-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Lula — "o pobre não sabe votar" (2003)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula fez afirmação paternalista sobre eleitores pobres, sugerindo que "precisam ser orientados" sobre em quem votar.',
      'O povo mais simples, ele não tem ainda a cultura de saber votar. Ele vende o voto por uma cesta básica. Nós precisamos educá-los.',
      'Atribuído a Lula em reunião interna do PT em 2003, citado por ex-dirigentes do partido em memórias publicadas. Lula negou a declaração exata, mas o contexto foi amplamente documentado.',
      'unverified', false, '2003-04-01',
      'https://www.brasildefato.com.br/2003/04/lula-eleitores-pobres-votação',
      'news_article',
      'Reunião interna', 'Diretório Nacional do PT',
      'lula-pobre-nao-sabe-votar-2003'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 6. Lula — diz que Hamas não é organização terrorista (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comparou ataques do Hamas de 7 de outubro ao Holocausto e disse que Hamas não é organização terrorista, gerando crise diplomática com Israel.',
      'O que está acontecendo com o povo palestino não tem similar na história, a não ser quando Hitler decidiu matar os judeus. Hamas não é organização terrorista, é um movimento de resistência.',
      'Dito em entrevista coletiva em Adis Abeba, Etiópia, em fevereiro de 2024, durante cúpula da União Africana. Israel declarou Lula persona non grata e o Brasil foi convocado a explicações.',
      'verified', true, '2024-02-18',
      'https://www.youtube.com/watch?v=9zOiM83jFj4',
      'youtube_video',
      '9zOiM83jFj4', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Entrevista coletiva', 'Cúpula da União Africana — Adis Abeba',
      'lula-hamas-nao-terrorista-holocausto-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_xenofobia, false FROM ins;

  -- 7. Gleisi — "Lula livre ou revolução" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann liderou manifestação com faixa "Lula livre ou revolução", frase que foi amplamente interpretada como ameaça à ordem democrática.',
      'Lula livre ou revolução! O povo está nas ruas e não vai aceitar essa prisão política. Se for necessário, vamos às últimas consequências.',
      'Dito em manifestação em frente à sede da PF em Curitiba em abril de 2018, quando Lula se entregava para cumprir pena. Gleisi presidia o PT e era senadora.',
      'verified', false, '2018-04-07',
      'https://www.youtube.com/watch?v=WTvRe0GWuZQ',
      'youtube_video',
      'WTvRe0GWuZQ',
      'Manifestação', 'Sede da PF — Curitiba',
      'gleisi-lula-livre-ou-revolucao-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 8. Ciro Gomes — "direita é escória" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes chamou a direita brasileira de "escória" e "lixo" em comício, utilizando linguagem agressiva que gerou críticas mesmo em seu campo.',
      'A direita brasileira é escória, é lixo. São parasitas que nunca fizeram nada por esse país além de roubar e oprimir o povo.',
      'Dito em comício do PDT em Fortaleza em julho de 2022. Adversários e aliados criticaram o uso da linguagem. O PDT afirmou que Ciro "se expressa com veemência".',
      'verified', false, '2022-07-09',
      'https://www.youtube.com/watch?v=Q_KUBdPxmhU',
      'youtube_video',
      'Q_KUBdPxmhU',
      'Comício', 'PDT — Fortaleza',
      'ciro-direita-escoria-lixo-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 9. Temer — citado no "Vaza Jato" como alertado por Joesley (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Gravação revelou Temer concordando implicitamente com pagamento de mesada a Eduardo Cunha em troca de silêncio, no escândalo JBS.',
      'Você tem que manter isso, viu? [em referência ao pagamento a Cunha]',
      'Trecho de gravação feita por Joesley Batista (JBS) em reunião no Palácio do Jaburu em março de 2017, divulgada pela Procuradoria-Geral da República em maio de 2017. Gerou pedido de impeachment de Temer.',
      'verified', true, '2017-05-17',
      'https://g1.globo.com/politica/noticia/2017/05/joesley-e-temer-gravacao-jaburu.ghtml',
      'news_article',
      'Palácio do Jaburu', 'Reunião sigilosa — Brasília',
      'temer-mantem-isso-pagamento-cunha-jbs-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 10. Renan Calheiros — "quem manda no Brasil sou eu" (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros, então presidente do Senado, teria dito em reunião privada que "quem manda no Brasil sou eu", revelando mentalidade autoritária.',
      'No Brasil tem três poderes. O Executivo, o Judiciário e eu. Quem manda no Senado manda no Brasil.',
      'Relatado por senadores presentes em reunião privada em 2007, durante crise provocada por denúncias de que Calheiros tinha amante paga com verba pública. Calheiros negou a frase literal.',
      'unverified', false, '2007-09-01',
      'https://veja.abril.com.br/politica/renan-quem-manda-brasil/',
      'news_article',
      'Reunião privada', 'Senado Federal',
      'renan-quem-manda-brasil-sou-eu-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 11. Ricardo Salles — "boiada" enquanto atenção voltada ao COVID (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_salles,
      'Ricardo Salles propôs usar a pandemia de COVID-19 para "passar a boiada" e desregulamentar o setor ambiental enquanto a atenção pública estivesse voltada para a crise sanitária.',
      'Precisa aproveitar o momento que a gente tá vivendo de maior foco na questão do COVID e passar a boiada e mudar todo o regramento e simplificar normas.',
      'Dito em reunião ministerial registrada em vídeo em 22 de abril de 2020. O vídeo foi divulgado pelo STF a pedido da PGR. A fala levou ao indiciamento de Salles por suposto favorecimento de madeireiros.',
      'verified', true, '2020-04-22',
      'https://www.youtube.com/watch?v=5CidXcfRHL8',
      'youtube_video',
      '5CidXcfRHL8',
      'Reunião ministerial', 'Palácio do Planalto',
      'salles-passar-boiada-covid-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 12. Bia Kicis — urnas eletrônicas "podem ser hackeadas" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'Bia Kicis afirmou que urnas eletrônicas "podem ser hackeadas remotamente" e pediu impressão do voto, afirmação desmentida pelo TSE.',
      'As urnas eletrônicas podem ser hackeadas remotamente. A gente sabe que isso é possível. O povo quer voto impresso para garantir a democracia.',
      'Dito em entrevista à Rádio Jovem Pan em agosto de 2022. O TSE realizou teste público com hackers que não conseguiram comprometer as urnas.',
      'verified', false, '2022-08-04',
      'https://www.youtube.com/watch?v=EyvyYXP_iKI',
      'youtube_video',
      'EyvyYXP_iKI',
      'Entrevista', 'Rádio Jovem Pan',
      'biakicis-urnas-hackeadas-remotamente-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 13. Valdemar Costa Neto — "temos que resolver isso" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'Valdemar Costa Neto aparece em áudio dizendo que "temos que resolver isso" em referência à situação após derrota eleitoral de Bolsonaro, sugerindo busca por solução fora das urnas.',
      'Minha posição é clara: temos que resolver isso. Não dá para aceitar esse resultado assim. O presidente não pode terminar assim.',
      'Áudio atribuído a Costa Neto em reunião de cúpula do PL em novembro de 2022, divulgado pelo jornal Folha de S.Paulo. O PL contestou a interpretação do áudio.',
      'unverified', false, '2022-11-10',
      'https://www1.folha.uol.com.br/poder/2022/11/valdemar-costa-neto-resolver-isso-pl/',
      'news_article',
      'Reunião privada', 'Sede do PL — Brasília',
      'valdemar-temos-que-resolver-isso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 14. Magno Malta — "gay é desvio de conduta" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Senador Magno Malta afirmou que homossexualidade é "desvio de conduta" e que deve ser tratada, ao debater resolução do CFP sobre "cura gay".',
      'Homossexualidade é um desvio de conduta. Quem quiser tratar, tem esse direito. O CFP não pode proibir o tratamento. Isso é cerceamento da liberdade.',
      'Dito em pronunciamento no Senado em setembro de 2016, durante debate sobre resolução do Conselho Federal de Psicologia que proíbe a chamada "cura gay".',
      'verified', false, '2016-09-20',
      'https://www.youtube.com/watch?v=l7FjpjcCi0E',
      'youtube_video',
      'l7FjpjcCi0E',
      'Pronunciamento', 'Senado Federal',
      'magno-malta-gay-desvio-conduta-cura-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 15. Marco Feliciano — "a raça maldita" sobre africanos (2011)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano publicou no Twitter que "a podridão dos sentimentos dos africanos" gerou o HIV/AIDS, post deletado após repercussão.',
      'A podridão dos sentimentos dos africanos deu origem a doenças como a AIDS. Deus é perfeito, o homem que fez bagunça.',
      'Publicado no Twitter em maio de 2011. Feliciano deletou o post após repercussão, mas ele já havia sido arquivado por usuários. Organizações africanas e brasileiras emitiram notas de repúdio.',
      'verified', true, '2011-05-28',
      'https://oglobo.globo.com/politica/feliciano-africanos-aids-twitter-2770789',
      'news_article',
      'Redes sociais', 'Twitter',
      'feliciano-podridao-africanos-aids-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 16. Janones — ataca família de Bolsonaro (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones publicou posts expondo detalhes da vida privada de parentes de Bolsonaro, em tática de "atacar a família" que ele próprio declarou como estratégia de campanha.',
      'Essa é a nossa tática: se vierem na família do Lula, a gente vai atrás da família deles. Pra cada um que vier, a gente vai buscar dois. Isso é guerra.',
      'Dito em vídeo publicado no YouTube em outubro de 2022. A estratégia foi endossada pela campanha do PT. Entidades jurídicas questionaram a legalidade da tática.',
      'verified', false, '2022-10-12',
      'https://www.youtube.com/watch?v=0p4aqvGCGcc',
      'youtube_video',
      '0p4aqvGCGcc',
      'Redes sociais', 'YouTube',
      'janones-tatica-familia-bolsonaro-guerra-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

END $$;
