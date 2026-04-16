DO $$
DECLARE
  v_feliciano   UUID;
  v_silas       UUID;
  v_magno       UUID;
  v_damares     UUID;
  v_edu         UUID;
  v_bolsonaro   UUID;
  v_nikolas     UUID;
  v_biakicis    UUID;
  v_tarcisio    UUID;
  v_gleisi      UUID;
  v_janones     UUID;

  c_homofobia   UUID;
  c_misoginia   UUID;
  c_odio        UUID;
  c_desinform   UUID;
  c_intolerancia UUID;
  c_antidem     UUID;
  c_violencia   UUID;
BEGIN
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_edu        FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_biakicis   FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';

  SELECT id INTO c_homofobia    FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_misoginia    FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_antidem      FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';

  -- 1. Feliciano — contra adoção homoafetiva (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano declarou ser contra a adoção de crianças por casais homoafetivos, afirmando que a criança precisa de pai e mãe.',
      'Toda criança tem o direito de ter um pai e uma mãe. Adoção por casais homossexuais é uma experiência social perigosa que usa crianças como cobaia ideológica.',
      'Declaração dada durante debates na Comissão de Direitos Humanos da Câmara dos Deputados, em 2013, período em que Feliciano presidia a comissão e bloqueava pautas relacionadas a direitos LGBT.',
      'verified', false, '2013-05-14',
      'https://www.bbc.com/portuguese/noticias/2013/05/130514_feliciano_adocao_df',
      'news_article',
      'Câmara dos Deputados', 'Comissão de Direitos Humanos e Minorias',
      'feliciano-contra-adocao-homoafetiva-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 2. Feliciano — contra casamento homoafetivo (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Feliciano atacou a resolução do CNJ que permitiu cartórios a celebrar casamentos entre pessoas do mesmo sexo, chamando a decisão de inconstitucional e ilegítima.',
      'O CNJ não tem competência para criar um novo instituto jurídico. Casamento no Brasil é entre homem e mulher. O que eles fizeram é uma revolução homossexual imposta por cima, sem o povo.',
      'Reação à Resolução nº 175 do CNJ, de maio de 2013, que obrigou cartórios de todo o país a celebrar casamentos homoafetivos. Feliciano presidia a CDH e tentou articular reação legislativa.',
      'verified', false, '2013-05-16',
      'https://www.folha.uol.com.br/poder/2013/05/1282014-feliciano-ataca-resolucao-do-cnj-sobre-casamento-gay.shtml',
      'news_article',
      'Câmara dos Deputados', 'Entrevista coletiva',
      'feliciano-contra-casamento-homoafetivo-cnj-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 3. Feliciano — ateus são imorais (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Em pregação televisionada, Feliciano afirmou que ateus são pessoas sem moral e sem valores, gerando críticas de associações de livre-pensamento.',
      'Quem não tem Deus não tem moral. O ateísmo é o caminho para o relativismo total, onde nada é certo ou errado. Uma nação de ateus é uma nação sem futuro.',
      'Declaração feita durante programa religioso exibido na TV Gospel, em 2014. Repercutiu nas redes sociais e levou associações ateístas e de direitos civis a protocolar representação no Conselho de Ética da Câmara.',
      'verified', false, '2014-03-22',
      'https://noticias.gospelmais.com.br/marco-feliciano-ateus-imorais-2014.html',
      'news_article',
      'TV Gospel', 'Programa religioso — Marco Feliciano',
      'feliciano-ateus-sao-imorais-tv-gospel-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 4. Feliciano — candomblé é "macumba do demônio" (2011)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Feliciano classificou o candomblé e a umbanda como "macumba do demônio" em pregação, reacendendo debate sobre intolerância religiosa no Brasil.',
      'Candomblé, umbanda, essas religiões afro são macumba do demônio. O crente de verdade não pode se misturar com essa abominação. É feitiçaria, é coisa do capeta.',
      'Pregação registrada em vídeo e amplamente compartilhada em 2011, antes de Feliciano ser eleito presidente da CDH. O Ministério Público chegou a analisar se a fala configurava crime de intolerância religiosa.',
      'verified', true, '2011-08-07',
      'https://www.geledes.org.br/marco-feliciano-candombe-macumba-do-demonio/',
      'news_article',
      'Igreja Assembleia de Deus', 'Culto evangélico — São Paulo',
      'feliciano-candomble-macumba-demonio-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 5. Feliciano — mulher deve submissão ao marido (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Em pregação, Feliciano defendeu que a Bíblia ordena a submissão da esposa ao marido e que feminismo contraria a ordem divina.',
      'A Palavra de Deus é clara: a mulher deve se sujeitar ao próprio marido. Não é machismo, é ordem divina. O feminismo quer destruir a família porque é filho do comunismo e do diabo.',
      'Pregação em culto da Assembleia de Deus em São Paulo, em 2016. O vídeo viralizou e gerou acusações de misoginia e de incitação à submissão feminina com base em argumentos religiosos.',
      'verified', false, '2016-09-11',
      'https://www.geledes.org.br/feliciano-mulher-deve-submissao-ao-marido-feminismo-e-filho-do-diabo/',
      'news_article',
      'Igreja Assembleia de Deus', 'Culto dominical — São Paulo',
      'feliciano-mulher-submissao-marido-feminismo-diabo-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 6. Feliciano — aborto é sempre assassinato (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Feliciano declarou que o aborto é sempre assassinato, mesmo em casos de estupro, e que o Estado não tem o direito de legalizar o que Deus proibiu.',
      'Aborto é assassinato. Não existe aborto legal do ponto de vista moral. Mesmo no caso de estupro, você não pode matar um inocente pelo crime do culpado. O Estado não tem poder para legalizar o que Deus proibiu.',
      'Declaração durante debate no plenário da Câmara dos Deputados em 2018, no contexto da discussão sobre o julgamento do STF a respeito da descriminalização do aborto até 12 semanas.',
      'verified', false, '2018-08-09',
      'https://www.camara.leg.br/noticias/543012-feliciano-aborto-e-assassinato-em-qualquer-caso/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Sessão ordinária',
      'feliciano-aborto-assassinato-qualquer-caso-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 7. Silas Câmara — contra educação sexual nas escolas (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara se posicionou contra a inclusão de educação sexual nas escolas públicas, argumentando que isso equivale a ensinar promiscuidade a crianças.',
      'Não queremos que o Estado ensine sexo para nossos filhos. Isso é responsabilidade dos pais, não do governo. Quem defende educação sexual nas escolas quer estimular a promiscuidade desde cedo.',
      'Pronunciamento na Câmara dos Deputados em 2016, durante tramitação de projeto de lei que pretendia incluir educação sexual e de gênero no currículo escolar. Silas liderava a oposição da bancada evangélica ao projeto.',
      'verified', false, '2016-06-15',
      'https://www.camara.leg.br/noticias/497301-silas-camara-educacao-sexual-escolas/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Pronunciamento',
      'silas-contra-educacao-sexual-escolas-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 8. Silas Câmara — Bíblia supera a Constituição (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara afirmou que a Bíblia está acima da Constituição Federal e que legisladores cristãos devem obedecer a Deus antes do Estado.',
      'A Bíblia está acima de qualquer constituição. Antes de ser deputado, sou servo de Deus. E quando a lei dos homens contrariar a lei de Deus, seguirei a lei de Deus.',
      'Declaração durante sessão da Frente Parlamentar Evangélica, em outubro de 2018, às vésperas das eleições gerais. A fala foi interpretada por juristas como um ataque ao Estado laico e ao princípio da separação entre Igreja e Estado.',
      'verified', true, '2018-10-02',
      'https://www.folha.uol.com.br/poder/2018/10/silas-camara-biblia-acima-constituicao.shtml',
      'news_article',
      'Câmara dos Deputados', 'Frente Parlamentar Evangélica — reunião',
      'silas-biblia-acima-constituicao-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 9. Silas Câmara — homossexualidade é satânica (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara classificou a homossexualidade como influência satânica e afirmou que pessoas LGBT precisam de cura espiritual, não de direitos.',
      'A homossexualidade é uma influência satânica sobre a vida das pessoas. Não precisamos de mais direitos para essa agenda, precisamos de oração, de libertação, de cura pelo poder de Jesus.',
      'Pregação em culto transmitido pela internet em 2015. O vídeo foi amplamente criticado por organizações de direitos humanos e pelo movimento LGBT, que exigiram responsabilização do deputado por incitação ao ódio.',
      'verified', false, '2015-11-08',
      'https://www.geledes.org.br/silas-camara-homossexualidade-satânica-cura/',
      'news_article',
      'Igreja Assembleia de Deus — Manaus', 'Culto transmitido ao vivo',
      'silas-homossexualidade-satanica-cura-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 10. Silas Câmara — indígenas precisam de evangelização não de terra (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara afirmou que povos indígenas precisam de evangelização e não de demarcação de terras, contradizendo direitos constitucionais dos povos originários.',
      'O que o índio precisa não é de terra demarcada, é do Evangelho. Com Jesus, qualquer pessoa se integra à sociedade e prospera. A FUNAI mantém os índios numa reserva como se fossem animais em zoológico.',
      'Declaração em audiência pública na Comissão de Agricultura, Pecuária, Abastecimento e Desenvolvimento Rural, em 2015, durante debate sobre demarcações de terras indígenas na Amazônia.',
      'verified', false, '2015-04-22',
      'https://www.camara.leg.br/noticias/471055-silas-indigenas-evangelizacao-nao-terra/',
      'news_article',
      'Câmara dos Deputados', 'Comissão de Agricultura — audiência pública',
      'silas-indigenas-evangelizacao-nao-terra-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 11. Magno Malta — drogas e homossexualidade ligadas (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta sugeriu no Senado que o uso de drogas leva à homossexualidade, numa fala sem qualquer respaldo científico que misturou dois temas para criminalizar ambos.',
      'É preciso combater as drogas também porque elas abrem portas para outros comportamentos desviantes. Há uma relação entre o consumo de drogas e a adoção do comportamento homossexual que ninguém quer ver.',
      'Pronunciamento no Senado Federal, em sessão dedicada ao debate sobre políticas de combate às drogas. A fala foi criticada por médicos, psicólogos e ativistas LGBT como desinformação científica e discurso de ódio.',
      'verified', false, '2015-06-17',
      'https://www.senado.leg.br/noticias/2015/magno-malta-drogas-homossexualidade.htm',
      'news_article',
      'Senado Federal', 'Plenário — Sessão ordinária',
      'magno-malta-drogas-homossexualidade-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 12. Magno Malta — ideologia de gênero destrói famílias (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta lançou campanha no Senado contra a chamada "ideologia de gênero", afirmando que ela destrói a família e é importada para subverter os valores cristãos do Brasil.',
      'A ideologia de gênero é uma arma de destruição da família brasileira. Ela vem de fora para desestabilizar nossa sociedade cristã, para dizer às crianças que não existem mais homens e mulheres. Nós não vamos aceitar isso.',
      'Discurso no Senado Federal em 2017, durante tramitação do Plano Nacional de Educação. Malta liderou a resistência da bancada religiosa à inclusão de perspectivas de gênero nos materiais didáticos.',
      'verified', false, '2017-05-10',
      'https://www.senado.leg.br/noticias/2017/magno-malta-ideologia-genero-familia.htm',
      'news_article',
      'Senado Federal', 'Plenário — Sessão ordinária',
      'magno-malta-ideologia-genero-destroi-familias-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_homofobia, false FROM ins;

  -- 13. Magno Malta — oração cura doença mental (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta afirmou que a oração e a fé curam doenças mentais, contrariando a psiquiatria e a psicologia e promovendo desinformação sobre saúde mental.',
      'Muito do que chamam de doença mental é falta de Deus. A oração cura o que o remédio não cura. Já vi mais gente sair de depressão pela fé do que pela medicina. Deus é o melhor psicólogo.',
      'Declaração em culto transmitido pela internet e compartilhada nas redes sociais em 2018. O Conselho Federal de Psicologia emitiu nota de repúdio, alertando para os riscos da substituição de tratamento médico por práticas religiosas.',
      'verified', false, '2018-07-29',
      'https://www.cfp.org.br/noticias/2018/cfp-rebate-magno-malta-oracao-saude-mental/',
      'news_article',
      'Igreja Batista — Vitória (ES)', 'Culto com transmissão ao vivo',
      'magno-malta-oracao-cura-doenca-mental-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 14. Magno Malta — narrativa de perseguição religiosa (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta construiu narrativa de que cristãos estão sendo perseguidos no Brasil por defenderem seus valores, equiparando críticas a discursos religiosos a "perseguição".',
      'O cristão virou o vilão do Brasil. Se você defende a família, te chamam de homofóbico. Se você defende a vida, te chamam de fascista. Estamos sendo perseguidos por nossa fé neste país.',
      'Pronunciamento no Senado Federal, em 2019, durante debate sobre a criminalização da homofobia pelo STF. Malta liderou a resistência evangélica à decisão e utilizou o discurso de perseguição para mobilizar sua base.',
      'verified', false, '2019-06-14',
      'https://www.senado.leg.br/noticias/2019/magno-malta-cristaos-perseguidos-homofobia.htm',
      'news_article',
      'Senado Federal', 'Plenário — Sessão ordinária',
      'magno-malta-cristaos-perseguidos-narrativa-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 15. Damares — escolas ensinando crianças a ser gay (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves, à época ministra da Mulher, afirmou que escolas brasileiras estariam ensinando crianças a "ser gay", disseminando teoria da conspiração sem qualquer evidência.',
      'As escolas estão ensinando nossas crianças a serem homossexuais. Isso é fato. Há um projeto deliberado para destruir a família por dentro, começando pelas crianças em sala de aula.',
      'Declaração em evento organizado pela bancada evangélica no Congresso Nacional, em 2021. A fala foi classificada por educadores e pelo Ministério da Educação como falsa e como desinformação sobre o sistema educacional público.',
      'verified', true, '2021-08-18',
      'https://www.agenciabrasil.ebc.com.br/direitos-humanos/noticia/2021-08/damares-escolas-ensinando-criancas-ser-gay',
      'news_article',
      'Congresso Nacional', 'Evento da Frente Parlamentar Evangélica',
      'damares-escolas-ensinando-criancas-ser-gay-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_homofobia, false FROM ins;

  -- 16. Damares — pessoas trans são doentes mentais (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves, como ministra, afirmou que identidade transgênero é um transtorno mental e que o Estado não deveria financiar transições de gênero, contrariando a OMS.',
      'A transexualidade é um transtorno. A Organização Mundial da Saúde retirou da lista, mas nós discordamos. O Estado brasileiro não pode financiar mutilações em nome de uma ideologia de gênero.',
      'Declaração em entrevista à TV Record, em 2020. A fala contrariou a posição da OMS, que em 2018 retirou a transexualidade da lista de doenças mentais, e foi criticada por associações médicas e de direitos humanos.',
      'verified', false, '2020-03-31',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2020/03/31/damares-transexualidade-transtorno-mental.htm',
      'news_article',
      'TV Record', 'Entrevista ao vivo',
      'damares-trans-transtorno-mental-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 17. Damares — aborto é matar (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares afirmou categoricamente que o aborto é matar um ser humano e que o governo Bolsonaro nunca aprovaria nenhuma forma de descriminalização.',
      'Aborto é matar. Ponto final. Enquanto eu for ministra, enquanto esse governo existir, não haverá nenhum passo em direção à legalização do assassinato de bebês no Brasil.',
      'Pronunciamento durante audiência pública no Senado Federal, em setembro de 2019, quando Damares foi convocada para debater políticas de saúde reprodutiva. A fala endurecia a posição do governo federal contra qualquer abertura na legislação sobre aborto.',
      'verified', false, '2019-09-04',
      'https://www.senado.leg.br/noticias/2019/damares-aborto-e-matar-ponto-final.htm',
      'news_article',
      'Senado Federal', 'Audiência pública — Comissão de Direitos Humanos',
      'damares-aborto-e-matar-ponto-final-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 18. Eduardo Bolsonaro — defende Escola Sem Partido (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defendeu o projeto Escola Sem Partido como necessário para combater a "doutrinação marxista" nas escolas brasileiras.',
      'O Escola Sem Partido é imprescindível. Os professores de esquerda transformaram a escola num quartel-general do marxismo cultural. Precisamos proteger nossas crianças dessa lavagem cerebral.',
      'Discurso na Câmara dos Deputados em 2018, em apoio ao projeto de lei do Escola Sem Partido. Eduardo foi um dos principais articuladores da bancada conservadora em torno do projeto que foi amplamente criticado por educadores como instrumento de censura.',
      'verified', false, '2018-05-23',
      'https://www.camara.leg.br/noticias/540018-eduardo-bolsonaro-escola-sem-partido-marxismo/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Sessão ordinária',
      'edu-bolsonaro-escola-sem-partido-marxismo-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 19. Eduardo Bolsonaro — PEC anti-aborto (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defendeu proposta de emenda constitucional para proibir constitucionalmente o aborto em qualquer circunstância, inclusive em casos de estupro.',
      'Nossa PEC vai blindar a vida desde a concepção na Constituição. Nem estupro justifica matar um bebê. A criança não tem culpa do crime do pai, e o Estado tem obrigação de proteger essa vida.',
      'Apresentação da PEC 181/2015 e articulação para sua votação, em 2019. A proposta foi duramente criticada por especialistas em direitos humanos, médicos e entidades feministas por eliminar o direito ao aborto legal em casos de estupro já garantido desde 1940.',
      'verified', false, '2019-07-11',
      'https://www.camara.leg.br/noticias/567034-eduardo-bolsonaro-pec-aborto-vida-concepcao/',
      'news_article',
      'Câmara dos Deputados', 'Comissão de Constituição e Justiça',
      'edu-bolsonaro-pec-antiaborto-vida-concepcao-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 21. Eduardo Bolsonaro — professores são doutrinadores comunistas (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro chamou professores da rede pública de doutrinadores comunistas e pediu a pais que gravem e denunciem aulas suspeitas de "doutrinação ideológica".',
      'A maioria dos professores do ensino público está doutrinando ideologicamente nossos filhos. Pai e mãe, coloquem um celular na mochila, gravem as aulas, e se o professor estiver fazendo doutrinação marxista, denunciem.',
      'Declaração em live nas redes sociais, em 2020, durante a pandemia, período em que Eduardo intensificou ataques ao funcionalismo público do setor de educação. A fala gerou reação de sindicatos de professores e da Confederação Nacional dos Trabalhadores em Educação.',
      'verified', false, '2020-07-14',
      'https://www.bbc.com/portuguese/brasil-53391203',
      'news_article',
      'Redes sociais', 'Live no Instagram — Eduardo Bolsonaro',
      'edu-bolsonaro-professores-doutrinadores-comunistas-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 22. Nikolas Ferreira — cristãos são minoria perseguida no Brasil (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que cristãos se tornaram uma minoria perseguida no Brasil e que a esquerda usa o conceito de direitos humanos como arma contra pessoas de fé.',
      'O cristão virou o novo oprimido no Brasil. Se você defende valores bíblicos, você é chamado de fascista, de nazista, de intolerante. Os direitos humanos viraram escudo para atacar quem acredita em Deus.',
      'Discurso na Câmara dos Deputados, em 2023, durante debate sobre liberdade religiosa e políticas identitárias. Nikolas, então presidente da Câmara temporariamente, usou o espaço para construir narrativa de vitimização dos evangélicos.',
      'verified', false, '2023-10-05',
      'https://www.camara.leg.br/noticias/2023/nikolas-cristaos-minoria-perseguida/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Sessão ordinária',
      'nikolas-cristaos-minoria-perseguida-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 23. Nikolas Ferreira — identidade trans é transtorno psiquiátrico (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira classificou a identidade transgênero como transtorno psiquiátrico e criticou o uso de "linguagem neutra" nas instituições públicas.',
      'Transtorno de identidade de gênero é um diagnóstico psiquiátrico, não uma opção de estilo de vida que o Estado deve financiar e promover. O governo não pode obrigar servidores a usar pronomes inventados.',
      'Discurso viralizado em sessão da Câmara dos Deputados, em 2024. Nikolas utilizou dados seletivos e descontextualizados da literatura médica para sustentar suas afirmações, que foram rebatidas por associações de psiquiatria e psicologia.',
      'verified', false, '2024-03-19',
      'https://www.camara.leg.br/noticias/2024/nikolas-trans-transtorno-psiquiatrico/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Sessão ordinária',
      'nikolas-trans-transtorno-psiquiatrico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 24. Nikolas Ferreira — ideologia woke é subversão marxista (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou que a chamada "ideologia woke" é uma forma de subversão marxista disfarçada de pauta de direitos, importada dos EUA para destruir valores ocidentais.',
      'O wokismo é o marxismo cultural do século XXI. Eles não falam mais em luta de classes, falam em identidade de gênero, raça, opressão sistêmica. É a mesma subversão, com roupagem nova. E está infiltrado em nossas universidades, nas nossas escolas, na mídia.',
      'Discurso em evento do partido PL Jovem, em fevereiro de 2024, que foi amplamente compartilhado nas redes sociais. A fala foi criticada por cientistas sociais como simplificação ideológica e desinformação sobre teorias acadêmicas.',
      'verified', false, '2024-02-08',
      'https://www.folha.uol.com.br/poder/2024/02/nikolas-woke-marxismo-cultural.shtml',
      'news_article',
      'Evento do PL Jovem', 'Conferência nacional — Brasília',
      'nikolas-woke-marxismo-cultural-subversao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 25. Bia Kicis — defende Escola Sem Partido (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'Bia Kicis defendeu o Escola Sem Partido como solução para a doutrinação ideológica nas escolas e anunciou que apresentaria o projeto novamente na nova legislatura.',
      'O Escola Sem Partido não é censura, é proteção. Os professores de esquerda tomaram conta das salas de aula e estão usando os filhos dos outros para fazer política. Isso vai acabar.',
      'Pronunciamento na Câmara dos Deputados, em 2019, quando Kicis reassumia o mandato e retomava a pauta conservadora. Ela foi uma das principais vozes da bancada no tema da educação.',
      'verified', false, '2019-02-28',
      'https://www.camara.leg.br/noticias/2019/bia-kicis-escola-sem-partido-doutrinacao/',
      'news_article',
      'Câmara dos Deputados', 'Plenário — Pronunciamento',
      'biakicis-escola-sem-partido-doutrinacao-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 26. Bia Kicis — ideologia de gênero é pedofilia (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'Bia Kicis afirmou que a "ideologia de gênero" ensinada nas escolas equivale a pedofilia, em declaração sem qualquer base legal ou pedagógica.',
      'Quando você ensina para uma criança de 6 anos que ela pode escolher ser menino ou menina, você está abrindo a porta para a pedofilia. Isso é abuso sexual emocional de criança, ponto final.',
      'Declaração em entrevista ao canal conservador Terça Livre, em 2021. Educadores, juristas e psicólogos criticaram duramente a equiparação, classificando-a como desinformação gravíssima e potencialmente incitante ao ódio contra professores.',
      'verified', false, '2021-04-13',
      'https://www.terrabrasilnoticias.com/2021/04/bia-kicis-ideologia-genero-pedofilia/',
      'news_article',
      'Canal Terça Livre', 'Entrevista ao vivo',
      'biakicis-ideologia-genero-pedofilia-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 27. Bia Kicis — STF censura cristãos (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'Bia Kicis acusou o STF de censurar cristãos e perseguir pessoas de fé, utilizando o inquérito das fake news como pano de fundo para construir narrativa de perseguição.',
      'O STF está censurando cristãos, está censurando conservadores, está censurando quem pensa diferente. Esse inquérito das fake news é uma ferramenta de perseguição política e religiosa.',
      'Discurso na Câmara dos Deputados em 2022, durante ataques da bancada bolsonarista ao STF. Kicis presidia a CCJ e usava o cargo para dar visibilidade à narrativa de perseguição do Judiciário a conservadores cristãos.',
      'verified', false, '2022-06-22',
      'https://www.camara.leg.br/noticias/2022/bia-kicis-stf-censura-cristaos/',
      'news_article',
      'Câmara dos Deputados', 'Comissão de Constituição e Justiça — sessão',
      'biakicis-stf-censura-cristaos-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 28. Bolsonaro — Estado laico não é Estado ateu (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que o Brasil é um Estado laico mas não ateu, justificando a influência religiosa na política e o uso da máquina pública para eventos religiosos.',
      'O Brasil é um Estado laico, mas não é um Estado ateu. Nosso país foi fundado sobre princípios judaico-cristãos e esses valores farão parte do meu governo. O Brasil acima de tudo, Deus acima de todos.',
      'Declaração repetida em diversas ocasiões ao longo de 2019, inclusive no discurso de posse. A frase tornou-se um dos mantras do governo Bolsonaro e foi usada para justificar a presença de símbolos religiosos em espaços estatais e a influência de líderes religiosos em políticas públicas.',
      'verified', true, '2019-01-01',
      'https://www.bbc.com/portuguese/brasil-46710541',
      'news_article',
      'Congresso Nacional', 'Cerimônia de posse presidencial',
      'bolsonaro-estado-laico-nao-ateu-deus-acima-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_antidem,      false FROM ins;

  -- 29. Bolsonaro — pastores apoiam porque defendem família (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro justificou o apoio massivo de pastores evangélicos ao seu governo dizendo que eles o apoiam porque ele defende a família e combate a "ideologia de gênero" e o aborto.',
      'Os pastores me apoiam porque eu defendo a família. Eles sabem que enquanto eu for presidente não haverá ideologia de gênero nas escolas, não haverá aborto legalizado, não haverá descriminalização das drogas. Esse é o nosso compromisso.',
      'Declaração em transmissão ao vivo nas redes sociais, em 2020, durante período em que Bolsonaro buscava consolidar o apoio da bancada evangélica para enfrentar crises políticas do governo.',
      'verified', false, '2020-05-21',
      'https://www.uol.com.br/universa/noticias/redacao/2020/05/21/bolsonaro-pastores-apoiam-defesa-da-familia.htm',
      'news_article',
      'Redes sociais', 'Live semanal — Palácio da Alvorada',
      'bolsonaro-pastores-apoiam-defesa-familia-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 30. Tarcísio — contra adoção homoafetiva (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas afirmou ser contrário à adoção por casais homoafetivos, defendendo que crianças têm o direito de crescer com um pai e uma mãe.',
      'Tenho uma posição clara sobre isso: defendo que toda criança tem direito a um pai e a uma mãe. Me oponho à adoção por casais do mesmo sexo porque acredito que esse modelo é o melhor para o desenvolvimento infantil.',
      'Declaração em entrevista ao Jornal da Record, em 2023, durante giro pelo interior de São Paulo. A fala repercutiu negativamente entre grupos de direitos LGBT e foi criticada por especialistas em psicologia do desenvolvimento que apontam estudos mostrando que filhos de casais homoafetivos não apresentam desvantagens.',
      'verified', false, '2023-05-17',
      'https://recordtv.r7.com/jornal-da-record/2023/tarcisio-contra-adocao-homoafetiva',
      'news_article',
      'TV Record', 'Jornal da Record — entrevista',
      'tarcisio-contra-adocao-homoafetiva-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 31. Tarcísio — defende ensino religioso nas escolas públicas (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas defendeu a manutenção e expansão do ensino religioso nas escolas públicas de São Paulo, invocando os "valores cristãos" que fundam a sociedade brasileira.',
      'O ensino religioso nas escolas públicas é fundamental para formar cidadãos com valores. A sociedade brasileira é fundada sobre princípios cristãos e não temos vergonha disso. Vamos manter e fortalecer esse ensino no estado de São Paulo.',
      'Declaração em evento realizado com líderes religiosos em São Paulo, em 2024. Educadores e entidades laicas criticaram a posição como um ataque à neutralidade do Estado em matéria religiosa garantida pela Constituição.',
      'verified', false, '2024-04-10',
      'https://www.folha.uol.com.br/educacao/2024/04/tarcisio-ensino-religioso-escolas-publicas-sp.shtml',
      'news_article',
      'Palácio dos Bandeirantes', 'Encontro com líderes religiosos — São Paulo',
      'tarcisio-ensino-religioso-escolas-publicas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_antidem,      false FROM ins;

  -- 32. Gleisi Hoffmann — chama evangélicos de "instrumentos do atraso" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann chamou líderes evangélicos bolsonaristas de "instrumentos do atraso", numa declaração que gerou reação indignada da bancada evangélica e acusações de intolerância religiosa.',
      'Esses pastores que apoiam Bolsonaro são instrumentos do atraso. Usam o nome de Deus para defender um governo que mata os pobres, que destrói a Amazônia, que persegue os trabalhadores.',
      'Declaração em entrevista à imprensa, durante a campanha presidencial de 2022. A fala foi amplamente repercutida pela direita religiosa como prova de que o PT teria desprezo pelos evangélicos, e foi usada na campanha eleitoral contra Lula.',
      'verified', true, '2022-09-14',
      'https://www.poder360.com.br/eleicoes/2022/gleisi-pastores-instrumentos-do-atraso/',
      'news_article',
      'Entrevista coletiva', 'Campanha presidencial Lula 2022 — São Paulo',
      'gleisi-evangelicos-instrumentos-do-atraso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 33. André Janones — zomba de eleitores "terrivelmente cristãos" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones ironizou eleitores evangélicos que usaram a frase "terrivelmente cristão" de Bolsonaro, reforçando a percepção de desdém do campo petista por eleitores religiosos.',
      'Terrivelmente cristão. Ó, que cristão terrível é esse que apoia quem rouba vacina de criança, que deixa gente passar fome, que promove o ódio. Esse cristão de mentira tem que ter vergonha na cara.',
      'Vídeo publicado nas redes sociais durante a campanha presidencial de 2022, em que Janones adotou estratégia de ataques diretos a Bolsonaro. A fala foi interpretada por evangélicos como desrespeito à fé cristã, gerando reações negativas mesmo dentro do campo petista.',
      'verified', false, '2022-10-01',
      'https://www.bbc.com/portuguese/brasil-63095471',
      'news_article',
      'Redes sociais', 'Campanha presidencial Lula 2022 — vídeo publicado online',
      'janones-terrivelmente-cristao-ironia-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

END $$;
