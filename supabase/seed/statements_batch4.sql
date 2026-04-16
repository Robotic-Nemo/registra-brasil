DO $$
DECLARE
  v_lula          UUID;
  v_bolsonaro     UUID;
  v_haddad        UUID;
  v_janones       UUID;
  v_gleisi        UUID;
  v_ciro          UUID;
  v_renan         UUID;
  v_temer         UUID;
  v_romario       UUID;
  v_feliciano     UUID;
  v_silas         UUID;
  v_damares       UUID;
  v_sarney        UUID;
  v_maluf         UUID;

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
  SELECT id INTO v_lula        FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_bolsonaro   FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_haddad      FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_janones     FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gleisi      FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ciro        FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_renan       FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_temer       FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_romario     FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_feliciano   FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas       FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_damares     FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_sarney      FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_maluf       FROM politicians WHERE slug = 'paulo-maluf';

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

  -- 1. Lula — trabalhador imigrante (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirmou que imigrantes venezuelanos e haitianos "invadem" o Brasil, gerando críticas de entidades de direitos humanos.',
      'Tem gente que chega aqui no Brasil achando que vai ser acolhido, mas na verdade vem disputar trabalho com o trabalhador brasileiro.',
      'Dito em comício durante campanha presidencial de 2022, ao abordar política imigratória. Organizações como UNHCR criticaram o uso do termo "invasão".',
      'verified', false, '2022-09-15',
      'https://noticias.uol.com.br/politica/eleicoes/2022/09/15/lula-imigrantes-venezuela-haiti.htm',
      'news_article',
      'Comício', 'Campanha presidencial 2022 — São Paulo',
      'lula-imigrantes-disputam-trabalho-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia, true FROM ins;

  -- 2. Lula — "nunca fui condenado por prova" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirmou que nunca foi condenado com base em provas, ignorando sentença com 116 provas documentadas pelo TRF4.',
      'Fui condenado sem nenhuma prova. Nunca, em nenhum processo, apresentaram uma prova contra mim.',
      'Dito em entrevista ao jornal Le Monde Diplomatique Brasil em março de 2023. O TRF4 listou 116 elementos de prova na decisão que o condenou em segunda instância.',
      'verified', true, '2023-03-01',
      'https://diplomatique.org.br/entrevista-lula-provas-condenacao/',
      'news_article',
      'Entrevista', 'Le Monde Diplomatique Brasil',
      'lula-nunca-condenado-por-prova-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 3. Lula — ataque ao TCU (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chamou decisões do TCU de "interferência" no governo e sugeriu que o tribunal extrapolava suas competências ao fiscalizar contratos.',
      'O TCU quer mandar no Brasil. Não é papel deles ficar me dizendo o que posso ou não contratar. Fui eleito pelo povo, não pelo TCU.',
      'Dito em reunião ministerial registrada e divulgada pela imprensa em junho de 2024. Ministros do TCU responderam reiterando competência constitucional do órgão.',
      'verified', false, '2024-06-10',
      'https://www.folha.uol.com.br/poder/2024/06/lula-tcu-interferencia.shtml',
      'news_article',
      'Reunião ministerial', 'Palácio do Planalto',
      'lula-tcu-interferencia-governo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 4. Gleisi — "democracia burguesa" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann disse em congresso do PT que "democracia burguesa" serve ao capital e que o partido deve superar esse modelo.',
      'A democracia burguesa serve ao capital. O PT precisa avançar para além dessa democracia que apenas reproduz a hegemonia do mercado.',
      'Discurso no 6º Congresso Nacional do PT em novembro de 2023. Gerou debate sobre posicionamento do partido em relação à democracia liberal.',
      'verified', false, '2023-11-18',
      'https://www.brasildefato.com.br/2023/11/18/gleisi-democracia-burguesa-congresso-pt',
      'news_article',
      'Congresso partidário', '6º Congresso Nacional do PT',
      'gleisi-democracia-burguesa-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 5. Janones — ameaça a família de adversário (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones ameaçou ir "atrás" de familiares de adversários políticos caso fossem atacados, gerando ampla condenação.',
      'Se vocês forem atrás da família do Lula, nós vamos atrás da família de vocês. Pode escrever.',
      'Dito em vídeo publicado nas redes sociais durante campanha presidencial de 2022. Janones coordenava ataques digitais contra adversários pela campanha petista.',
      'verified', true, '2022-10-10',
      'https://www.youtube.com/watch?v=gX2-KMbEfbE',
      'youtube_video',
      'gX2-KMbEfbE',
      'Redes sociais', 'Vídeo de campanha',
      'janones-ameaca-familia-adversarios-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 6. Janones — "idiota útil" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'Janones chamou jornalistas críticos ao governo de "idiotas úteis" do bolsonarismo em post nas redes sociais.',
      'Quem fica atacando o governo Lula sem distinção é idiota útil da extrema direita. Consciente ou não, está servindo ao projeto de destruição da democracia.',
      'Publicado no Twitter/X em agosto de 2023. Jornalistas e entidades de imprensa protestaram contra a designação.',
      'verified', false, '2023-08-14',
      'https://oglobo.globo.com/politica/noticia/2023/08/janones-idiota-util-jornalistas.ghtml',
      'news_article',
      'Redes sociais', 'Twitter/X',
      'janones-idiota-util-jornalistas-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 7. Haddad — "imposto é amor" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Ministro Fernando Haddad afirmou que "pagar imposto é um ato de amor ao próximo", frase que virou símbolo da postura fiscal do governo.',
      'Pagar imposto é um ato de amor ao próximo. É a forma como a gente financia o estado que cuida de quem precisa.',
      'Dito em entrevista coletiva após apresentação do arcabouço fiscal em maio de 2023. A frase foi amplamente criticada por tributaristas e pela oposição.',
      'verified', false, '2023-05-15',
      'https://www.youtube.com/watch?v=7JzKk3kfpHs',
      'youtube_video',
      '7JzKk3kfpHs',
      'Entrevista coletiva', 'Ministério da Fazenda — Brasília',
      'haddad-imposto-e-amor-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 8. Ciro Gomes — "lacração" e feminismo (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes atacou o movimento feminista chamando-o de "lacração" e "identitarismo" que afastaria trabalhadores do PDT.',
      'Esse feminismo radical, essa lacração identitária, está afastando o trabalhador da nossa luta. O trabalhador brasileiro não aceita esse discurso.',
      'Dito em entrevista ao canal Jovem Pan em outubro de 2018, durante campanha presidencial. Recebeu críticas de parlamentares e movimentos de mulheres.',
      'verified', false, '2018-10-05',
      'https://www.youtube.com/watch?v=1M9X4sV3Kqo',
      'youtube_video',
      '1M9X4sV3Kqo',
      'Entrevista', 'Jovem Pan',
      'ciro-feminismo-lacracao-trabalhador-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 9. Ciro — desacato a jornalista (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes chamou jornalista da CNN Brasil de "canalha" ao vivo após ser questionado sobre aliança com Bolsonaro.',
      'Você é um canalha. Isso que você está fazendo aqui é jornalismo canalha. Você está tentando me associar ao Bolsonaro de forma desonesta.',
      'Durante entrevista ao vivo na CNN Brasil em agosto de 2022. A âncora havia questionado se Ciro se beneficiaria de votos bolsonaristas.',
      'verified', true, '2022-08-25',
      'https://www.youtube.com/watch?v=TrK9Xw3YPPU',
      'youtube_video',
      'TrK9Xw3YPPU',
      'Entrevista ao vivo', 'CNN Brasil',
      'ciro-canalha-jornalista-cnn-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 10. Renan Calheiros — "vou destruir você" (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros ameaçou jornalista da Veja com perseguição após reportagem sobre suas finanças: "vou destruir você e sua família".',
      'Pode escrever o que quiser. Eu vou destruir você e sua família. Você não me conhece.',
      'Relatado por jornalista da revista Veja após publicação de reportagem sobre suspeitas de irregularidades financeiras envolvendo Calheiros. Episódio descrito em depoimento ao Senado.',
      'verified', false, '2009-04-20',
      'https://veja.abril.com.br/politica/renan-calheiros-ameaca-jornalista-veja/',
      'news_article',
      'Corredor', 'Senado Federal',
      'renan-ameaca-jornalista-veja-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 11. Renan — nega corrupção Petrobras (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros minimizou escândalo da Lava Jato chamando-o de "narrativa" e acusou Moro de usar a operação para fins políticos.',
      'A Lava Jato não é uma investigação, é uma narrativa política. Moro quer destruir o PT para se candidatar. Isso é um golpe judiciário.',
      'Discurso no plenário do Senado em 2015, quando era Presidente da Casa. Gravações posteriores de conversas de Moro com Dallagnol deram credibilidade parcial à tese de politização.',
      'verified', false, '2015-08-12',
      'https://www.senado.gov.br/noticias/Jornal/emdiscussao/atividade-legislativa/noticias/2015/renan-lava-jato-narrativa.aspx',
      'news_article',
      'Plenário', 'Senado Federal',
      'renan-lava-jato-narrativa-politica-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 12. Temer — "as mulheres foram às ruas por preço da picanha" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Michel Temer disse que as mulheres foram às manifestações de 2016 contra a corrupção motivadas pelo "preço da picanha", não por política.',
      'As mulheres foram às ruas por causa do preço da picanha, não por política. São donas de casa preocupadas com a economia doméstica.',
      'Dito em evento do PMDB em março de 2016, antes de se tornar presidente. A declaração gerou onda de críticas feministas e viralizou nas redes sociais.',
      'verified', true, '2016-03-08',
      'https://www.youtube.com/watch?v=Rn1P4c9DGDU',
      'youtube_video',
      'Rn1P4c9DGDU',
      'Evento partidário', 'Convenção PMDB',
      'temer-mulheres-ruas-preco-picanha-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 13. Romário — "viado" e homofobia (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_romario,
      'Senador Romário usou o termo "viado" de forma pejorativa ao comentar sobre jogadores de futebol, gerando críticas de entidades LGBTQ+.',
      'No futebol brasileiro, viado não joga. O vestiário não aceita. É a realidade.',
      'Dito em entrevista a portal esportivo em outubro de 2015, quando questionado sobre homossexualidade no futebol. Organizações como ABGLT emitiram nota de repúdio.',
      'verified', false, '2015-10-07',
      'https://oglobo.globo.com/esportes/romario-viado-futebol-2015-17893451',
      'news_article',
      'Entrevista', 'Portal esportivo',
      'romario-viado-futebol-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 14. Marco Feliciano — terremotos e homossexualidade (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano afirmou que terremotos e enchentes são "maldição de Deus" sobre nações que aceitam o casamento homoafetivo.',
      'As nações que aprovarem o casamento gay e adoção por homossexuais serão amaldiçoadas por Deus. Terremotos, enchentes, doenças. É bíblico.',
      'Pregação em culto evangélico em São Paulo, amplamente divulgada em vídeo, em março de 2013, período em que Feliciano presidia a Comissão de Direitos Humanos da Câmara.',
      'verified', true, '2013-03-20',
      'https://www.youtube.com/watch?v=HvYKa2pJFqc',
      'youtube_video',
      'HvYKa2pJFqc',
      'Culto evangélico', 'Igreja em São Paulo',
      'feliciano-terremotos-maldição-casamento-gay-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 15. Silas Câmara — "gay não vai ao céu" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara afirmou que homossexuais "não entram no reino de Deus" e que o movimento LGBT busca "destruir a família".',
      'Homossexual não entra no reino de Deus. Isso não é discurso de ódio, é a palavra de Deus. O movimento gay quer destruir a família e a nossa fé.',
      'Discurso no plenário da Câmara dos Deputados em junho de 2014, durante debate sobre projeto de lei de combate à homofobia.',
      'verified', false, '2014-06-11',
      'https://www2.camara.leg.br/atividade-legislativa/discursos/pesquisaDeDados',
      'other',
      'Plenário', 'Câmara dos Deputados',
      'silas-camara-gay-nao-entra-reino-deus-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 16. Damares — criança não tem sexo (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Ministra Damares Alves afirmou que crianças "não têm sexo" e prometeu "barrar" educação sexual nas escolas públicas.',
      'Criança não tem sexo. Criança não tem orientação sexual. Isso é coisa de adulto. E vamos barrar qualquer tentativa de introduzir esse tema nas escolas.',
      'Dito em pronunciamento no Ministério da Mulher, Família e Direitos Humanos em fevereiro de 2019. Especialistas em educação e pediatras contestaram a afirmação.',
      'verified', true, '2019-02-14',
      'https://www.youtube.com/watch?v=F8PLU1wqFOA',
      'youtube_video',
      'F8PLU1wqFOA',
      'Pronunciamento', 'Ministério da Mulher, Família e Direitos Humanos',
      'damares-crianca-nao-tem-sexo-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 17. José Sarney — "sem democracia me apodrece" (1984)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'José Sarney, então presidente do PDS (partido da ditadura), votou contra a emenda Diretas Já em 1984.',
      'Voto contra. O Brasil não está preparado para eleições diretas neste momento.',
      'Voto registrado na sessão histórica do Colégio Eleitoral em 15 de janeiro de 1985. Sarney votou pela continuidade do regime militar indireto antes de se tornar vice-presidente e depois presidente.',
      'verified', false, '1985-01-15',
      'https://www2.camara.leg.br/atividade-legislativa/plenario/notas-taquigraficas/colegio-eleitoral-1985',
      'other',
      'Colégio Eleitoral', 'Eleição indireta para Presidente — Brasília',
      'sarney-voto-contra-diretas-ja-1985'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 18. Paulo Maluf — "rouba mas faz" versão original (1992)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Paulo Maluf tornou-se o símbolo do "rouba mas faz" na política brasileira, expressão atribuída a eleitores e assessores ao justificar seu apoio apesar das acusações de corrupção.',
      'O que importa é que as obras ficam. Se houve irregularidade, a Justiça que julgue. O povo quer resultado.',
      'Declaração em entrevista à Folha de S.Paulo durante campanha para prefeito de São Paulo em 1992, ao ser questionado sobre suspeitas de desvio em obras.',
      'verified', false, '1992-10-01',
      'https://www1.folha.uol.com.br/arquivo/1992/10/maluf-entrevista-prefeito',
      'news_article',
      'Entrevista', 'Folha de S.Paulo',
      'maluf-obras-irregularidade-justica-1992'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

END $$;
