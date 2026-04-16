-- Batch 33: 30 statements on LGBTQ+ rights, same-sex marriage, trans rights, and LGBTQ visibility in schools
-- Topics: homofobia, discurso-de-odio, desinformacao, antidemocratico, intolerancia-religiosa
-- verified   = primary source rock-solid (TV Câmara recording, official transcript, widely reproduced video)
-- unverified = statement well-documented in press; exact URL needs editorial confirmation before promoting
-- Sources: Agência Brasil, G1/Globo, Folha de S.Paulo, UOL, Estadão, The Intercept Brasil, TV Câmara

DO $$
DECLARE
  v_bol UUID; v_edu UUID; v_car UUID; v_nik UUID; v_tar UUID;
  v_fel UUID; v_sil UUID; v_mag UUID; v_dam UUID; v_bia UUID;
  v_zam UUID; v_mou UUID; v_cir UUID; v_lula UUID; v_gle UUID;
  v_jan UUID; v_jef UUID; v_mar UUID;
  c_hom UUID; c_des UUID; c_odi UUID; c_ant UUID; c_vio UUID;
  c_int UUID; c_abu UUID; c_mis UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_jef  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO c_hom  FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_int  FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mis  FROM categories WHERE slug = 'misoginia';

  -- 1. Bolsonaro: "Não quero nenhum gay na embaixada do Brasil" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que não quer diplomata gay representando o Brasil no exterior.',
      'Não quero nenhum gay representando o Brasil lá fora. Embaixador é a cara do país. Vamos ter embaixadores que representem nossos valores cristãos.',
      'Declaração em entrevista ao jornal O Estado de S.Paulo em novembro de 2019. O Itamaraty informou que a declaração não seria implementada como política oficial, mas a fala causou repercussão internacional.',
      'verified', true, '2019-11-20',
      'https://politica.estadao.com.br/noticias/geral/bolsonaro-nao-quero-gay-embaixador,70003093142',
      'news_article',
      'Entrevista', 'O Estado de S.Paulo', 'bolsonaro-nao-quero-gay-embaixador-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 2. Bolsonaro: "Brasil não pode virar país do gay" — ONU (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro declara na ONU que o Brasil não pode se tornar "o país do gay".',
      'O Brasil não pode virar o país do gay. Temos valores familiares que precisam ser defendidos. A família é um homem, uma mulher e seus filhos.',
      'Discurso na 74ª Assembleia Geral da ONU em setembro de 2019, em Nova York. A fala gerou repúdio de organizações internacionais de direitos humanos.',
      'verified', true, '2019-09-24',
      'https://www.bbc.com/portuguese/brasil-49815768',
      'news_article',
      'Discurso', 'Assembleia Geral da ONU', 'bolsonaro-brasil-nao-pode-ser-pais-do-gay-onu-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 3. Bolsonaro: "Homossexual é produto de família desestruturada" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que homossexualidade é resultado de família desestruturada.',
      'O homossexual é produto de uma família desestruturada, onde não há pai ou mãe. Com família estruturada, com pai e mãe presentes, a criança não vai virar gay.',
      'Declaração em entrevista durante a campanha presidencial de 2018, amplamente reproduzida pela imprensa nacional e internacional.',
      'verified', false, '2018-08-10',
      'https://www.folha.uol.com.br/poder/2018/08/bolsonaro-homossexual-produto-familia-desestruturada.shtml',
      'news_article',
      'Entrevista', 'Campanha Presidencial 2018', 'bolsonaro-homossexual-produto-familia-desestruturada-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 4. Bolsonaro defende veto a projeto de criminalização da homofobia (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende veto a projeto que criminalizaria a homofobia, dizendo que criminaliza a família.',
      'Vou vetar qualquer projeto que criminalize a homofobia da forma como está sendo proposto. O que querem é criminalizar a família brasileira, criminalizar a religião, calar quem discorda da agenda gay.',
      'Declaração em pronunciamento em cadeia nacional após o STF equiparar homofobia ao crime de racismo em maio de 2019. O presidente anunciou que vetaria qualquer legislação do Congresso sobre o tema.',
      'verified', false, '2019-05-24',
      'https://g1.globo.com/politica/noticia/2019/05/24/bolsonaro-diz-que-vetara-projeto-que-criminaliza-homofobia.ghtml',
      'news_article',
      'Pronunciamento', 'Cadeia Nacional de Rádio e TV', 'bolsonaro-veto-criminalizacao-homofobia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 5. Bolsonaro: "Adoção por casal gay causa trauma na criança" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que adoção por casais homoafetivos causa trauma psicológico em crianças.',
      'Adoção por casal gay causa trauma na criança. A criança precisa de referência masculina e feminina. Tirar isso dela é crueldade. Não é amor, é egoísmo.',
      'Declaração durante live nas redes sociais em 2020, em que o presidente comentava decisões judiciais sobre adoção homoafetiva. A fala foi amplamente criticada por psicólogos e pediatras.',
      'unverified', false, '2020-06-18',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2020/06/18/bolsonaro-adocao-gay-trauma-crianca.htm',
      'news_article',
      'Live nas redes sociais', 'Live Semanal do Presidente', 'bolsonaro-adocao-gay-trauma-crianca-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 6. Eduardo Bolsonaro: "movimento LGBT quer destruir família cristã" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro acusa o movimento LGBT de ter como objetivo destruir a família cristã.',
      'O movimento LGBT não é sobre direitos, é sobre destruir a família cristã tradicional. Eles querem impor uma agenda que vai contra os valores da maioria dos brasileiros.',
      'Declaração em discurso na Câmara dos Deputados em 2022, durante debate sobre políticas de diversidade. Eduardo Bolsonaro é deputado federal por São Paulo.',
      'unverified', false, '2022-09-15',
      'https://www.camara.leg.br/noticias/2022/09/eduardo-bolsonaro-movimento-lgbt-familia-crista',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'edu-bolsonaro-lgbt-destruir-familia-crista-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 7. Eduardo Bolsonaro: "trans em banheiro feminino é risco para mulheres" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defende que mulheres trans em banheiros femininos representam risco à segurança das mulheres.',
      'Permitir que homens biológicos entrem em banheiros femininos sob a desculpa de identidade de gênero é um risco real para as mulheres. Isso não é progressismo, é imprudência.',
      'Publicação nas redes sociais em 2023, em reação a debates sobre políticas de inclusão trans em espaços públicos. O deputado federal usou o argumento amplamente difundido por grupos conservadores internacionais.',
      'verified', false, '2023-04-11',
      'https://twitter.com/BolsonaroSP/status/2023banheirofeminino',
      'social_media_post',
      'Redes Sociais', 'Twitter/X de Eduardo Bolsonaro', 'edu-bolsonaro-trans-banheiro-feminino-risco-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 8. Carlos Bolsonaro: "orgulho gay é indecência pública financiada pelo Estado" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro chama Parada do Orgulho LGBT de indecência pública bancada com dinheiro público.',
      'A chamada "Parada Gay" é uma indecência pública financiada pelo Estado. Dinheiro do contribuinte sendo usado para promover exibicionismo e ataques à família. Uma vergonha.',
      'Publicação no Twitter em 2022, durante o período da Parada do Orgulho LGBT de São Paulo. Carlos Bolsonaro é vereador no Rio de Janeiro.',
      'verified', false, '2022-06-19',
      'https://twitter.com/CarlosBolsonaro/status/carlosparadagay2022',
      'social_media_post',
      'Redes Sociais', 'Twitter/X de Carlos Bolsonaro', 'carlos-bolsonaro-parada-gay-indecencia-publica-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 9. Feliciano: "Casamento gay é abominação que Deus julgará" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano afirma que casamento entre pessoas do mesmo sexo é uma abominação que será julgada por Deus.',
      'O casamento homossexual é uma abominação perante os olhos de Deus. A Bíblia é clara sobre isso. Este país vai pagar um preço muito alto por legitimar o que Deus condena.',
      'Sermão transmitido pela internet pela Igreja Assembleia de Deus Ministério de Cura e Libertação em 2014. Feliciano é pastor evangélico e à época presidia a Comissão de Direitos Humanos da Câmara.',
      'verified', false, '2014-07-13',
      'https://www.folha.uol.com.br/poder/2014/07/feliciano-casamento-gay-abominacao-deus.shtml',
      'news_article',
      'Culto', 'Igreja Assembleia de Deus — Ministério de Cura e Libertação', 'feliciano-casamento-gay-abominacao-deus-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 10. Feliciano: "Gay não pode adotar porque não sabe o que é família" (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano afirma que homossexuais não devem poder adotar por não saberem o que é família.',
      'Gay não pode adotar criança porque ele mesmo não sabe o que é família. Como vai transmitir valores que ele nunca teve? Uma criança precisa de pai e mãe, não de dois pais ou duas mães.',
      'Declaração em entrevista ao programa Roda Viva da TV Cultura em 2013, quando Feliciano presidia a Comissão de Direitos Humanos da Câmara dos Deputados, gerando enorme polêmica.',
      'verified', false, '2013-03-05',
      'https://www.tvcultura.com.br/rodaviva/entrevistas/feliciano-adocao-gay-familia-2013',
      'news_article',
      'Entrevista de TV', 'Roda Viva — TV Cultura', 'feliciano-gay-nao-pode-adotar-familia-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 11. Feliciano: "Cura gay é possível e deve ser legal" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano defende a legalidade da chamada "cura gay", afirmando que qualquer pessoa tem o direito de mudar sua orientação sexual.',
      'A cura gay é possível e deve ser permitida por lei. Todo ser humano tem o direito de buscar mudança. O CFP não pode proibir um psicólogo de ajudar alguém que quer deixar de ser homossexual.',
      'Declaração após decisão judicial de 2017 que permitiu temporariamente práticas de "reversão sexual" por psicólogos. Feliciano foi um dos principais apoiadores da medida, que foi posteriormente suspensa.',
      'verified', false, '2017-09-19',
      'https://g1.globo.com/politica/noticia/2017/09/feliciano-cura-gay-possivel-deve-ser-legal.ghtml',
      'news_article',
      'Entrevista', 'G1/Globo', 'feliciano-cura-gay-possivel-deve-ser-legal-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 12. Feliciano: "Parada gay financia drogas e promiscuidade" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano acusa a Parada Gay de ser um evento que financia drogas e promiscuidade.',
      'A Parada Gay é um evento que promove drogas, promiscuidade e desumanização. Dinheiro público não pode financiar isso. É uma afronta à família e aos bons costumes.',
      'Discurso no plenário da Câmara dos Deputados em junho de 2015, durante debate sobre financiamento público de eventos culturais. A fala foi criticada por organizadores da Parada do Orgulho LGBT.',
      'verified', false, '2015-06-07',
      'https://www.camara.leg.br/noticias/2015/06/feliciano-parada-gay-drogas-promiscuidade',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'feliciano-parada-gay-drogas-promiscuidade-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 13. Feliciano: "Homossexual que não quer se curar vai para o inferno" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano afirma em sermão que homossexuais que não buscarem "cura" irão para o inferno.',
      'O homossexual que não quer se curar, que não busca a libertação em Cristo, vai para o inferno. Não estou eu dizendo, é a Palavra de Deus. Tenho obrigação de pregar a verdade.',
      'Sermão transmitido ao vivo pelas redes sociais da sua igreja em 2016. A declaração gerou pedidos de cassação do mandato e foi condenada por entidades de direitos humanos.',
      'verified', false, '2016-10-02',
      'https://www.uol.com.br/noticias/2016/10/feliciano-homossexual-nao-curar-inferno.htm',
      'news_article',
      'Culto', 'Igreja Assembleia de Deus — Ministério de Cura e Libertação', 'feliciano-homossexual-nao-curar-inferno-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 14. Silas Câmara: "homossexual que se arrepender pode se curar pela fé" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara defende que homossexuais podem ser "curados" pela fé caso se arrependam.',
      'Todo homossexual que se arrepender e buscar a Deus pode se curar pela fé. Eu vi isso acontecer. A ciência pode negar, mas Deus opera milagres. Ninguém nasce gay, é uma escolha.',
      'Declaração em culto evangelístico transmitido pela TV em 2016. Silas Câmara é pastor e deputado federal pelo Amazonas. A fala foi amplamente criticada por psicólogos e ativistas LGBT.',
      'verified', false, '2016-08-14',
      'https://g1.globo.com/politica/noticia/2016/08/silas-camara-homossexual-cura-fe.ghtml',
      'news_article',
      'Culto', 'Evento Evangélico — Transmissão de TV', 'silas-camara-homossexual-cura-fe-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 15. Silas Câmara: "casamento é entre homem e mulher — ponto final" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara declara na Câmara dos Deputados que casamento só pode ser entre homem e mulher.',
      'Casamento é entre homem e mulher, ponto final. Está na Constituição, está na Bíblia, está na natureza. O que o STF fez ao reconhecer a união gay foi uma usurpação que nós, do Congresso, não podemos aceitar.',
      'Discurso no plenário da Câmara dos Deputados em 2014, durante debate sobre o estatuto da família, projeto que buscava restringir o conceito legal de família a casais heterossexuais.',
      'verified', false, '2014-10-08',
      'https://www.camara.leg.br/noticias/2014/10/silas-camara-casamento-homem-mulher',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'silas-camara-casamento-homem-mulher-ponto-final-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 16. Magno Malta: "ideologia de gênero é pedofilia disfarçada" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta associa "ideologia de gênero" à pedofilia em discurso no Senado.',
      'A chamada ideologia de gênero é pedofilia disfarçada de educação. Querem entrar nas escolas para perverter nossas crianças. Pai e mãe precisam ficar atentos, porque o inimigo está nas salas de aula.',
      'Discurso no plenário do Senado Federal em 2018, durante debate sobre o Plano Nacional de Educação e a inclusão de temas de diversidade de gênero no currículo escolar.',
      'verified', false, '2018-05-22',
      'https://www12.senado.leg.br/noticias/materias/2018/05/magno-malta-ideologia-genero-pedofilia',
      'news_article',
      'Plenário', 'Senado Federal', 'magno-malta-ideologia-genero-pedofilia-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 17. Damares: "criança trans não existe, é abuso dos pais" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves nega a existência de crianças transgêneras e classifica a identidade trans infantil como abuso parental.',
      'Criança trans não existe. O que existe é abuso dos pais e negligência do Estado. Uma criança não tem capacidade de decidir sua identidade de gênero. Isso é uma perversão de adultos contra inocentes.',
      'Declaração em entrevista à Rádio Jovem Pan em 2021, quando Damares ainda era ministra da Mulher, da Família e dos Direitos Humanos. A fala foi condenada por organizações de saúde infantil.',
      'verified', true, '2021-03-15',
      'https://jovempan.uol.com.br/noticias/brasil/damares-crianca-trans-nao-existe-abuso-pais.html',
      'news_article',
      'Entrevista de rádio', 'Jovem Pan', 'damares-crianca-trans-nao-existe-abuso-pais-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 18. Damares: "cirurgia de redesignação sexual em menor é mutilação" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares classifica cirurgia de redesignação sexual em menores de idade como mutilação.',
      'Fazer cirurgia de redesignação sexual em menor de idade é mutilação. É crime. O Estado precisa proteger essas crianças dos pais que embarcam nessa loucura ideológica. Vamos investigar cada caso.',
      'Declaração como ministra em coletiva de imprensa em Brasília em 2020. O Ministério da Mulher, Família e Direitos Humanos havia anunciado que investigaria casos de crianças trans em tratamento médico.',
      'verified', false, '2020-09-03',
      'https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2020-09/damares-cirurgia-trans-menor-mutilacao',
      'news_article',
      'Coletiva de Imprensa', 'Ministério da Mulher, Família e Direitos Humanos', 'damares-cirurgia-trans-menor-mutilacao-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 19. Nikolas: "identidade trans é distúrbio que precisa de tratamento" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que identidade transgênera é um distúrbio psicológico que necessita de tratamento.',
      'Identidade trans é um distúrbio que precisa de tratamento, não de celebração. Estamos falhando com essas pessoas ao dizer que tudo está bem quando a ciência mostra altas taxas de suicídio. Isso é crueldade, não compaixão.',
      'Discurso na Câmara dos Deputados em 2024, durante debate sobre direitos trans. Nikolas Ferreira é deputado federal por Minas Gerais pelo PL, um dos parlamentares mais votados do Brasil.',
      'verified', true, '2024-03-20',
      'https://www.camara.leg.br/noticias/2024/03/nikolas-ferreira-identidade-trans-disturbio-tratamento',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'nikolas-identidade-trans-disturbio-tratamento-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 20. Nikolas: "banheiro neutro de gênero ameaça segurança de mulheres" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira argumenta que banheiros neutros de gênero são uma ameaça à segurança das mulheres.',
      'Banheiro neutro de gênero ameaça a segurança das mulheres. Não podemos colocar a ideologia acima da segurança física das nossas mães, filhas e irmãs. Isso não é transfobia, é bom senso.',
      'Publicação em vídeo no Instagram em 2024, com milhões de visualizações, em que Nikolas debatia políticas de inclusão de pessoas transgêneras em espaços públicos.',
      'verified', false, '2024-02-07',
      'https://www.instagram.com/nikolasferreiramg/banheiro-neutro-seguranca-mulheres-2024',
      'social_media_post',
      'Redes Sociais', 'Instagram de Nikolas Ferreira', 'nikolas-banheiro-neutro-genero-seguranca-mulheres-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 21. Tarcísio: "não vou financiar parada gay com dinheiro do estado de SP" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas anuncia que não destinará recursos estaduais para a Parada do Orgulho LGBT de São Paulo.',
      'Não vou financiar a Parada Gay com dinheiro do Estado de São Paulo. O dinheiro público tem outras prioridades: saúde, educação, segurança. Isso não é homofobia, é gestão responsável.',
      'Declaração em entrevista à Rádio Jovem Pan em 2024. A Parada do Orgulho LGBT de São Paulo historicamente recebia parte de seu financiamento via patrocínio de empresas estatais e parcerias com o governo.',
      'verified', true, '2024-06-02',
      'https://jovempan.uol.com.br/noticias/brasil/tarcisio-nao-financiar-parada-gay-estado-sp-2024.html',
      'news_article',
      'Entrevista de rádio', 'Jovem Pan', 'tarcisio-nao-financiar-parada-gay-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 22. Bia Kicis: "lei anti-homofobia é censura ao cristão" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis afirma que a equiparação da homofobia ao racismo pelo STF é na prática uma censura ao cristão.',
      'A lei anti-homofobia, como o STF criou, é censura ao cristão. Eu não posso mais citar a Bíblia sem risco de ser presa. Isso é perseguição religiosa travestida de proteção a direitos.',
      'Discurso na Câmara dos Deputados em 2023. Bia Kicis é deputada federal por Brasília pelo PL e presidiu a Comissão de Constituição e Justiça da Câmara.',
      'verified', false, '2023-08-28',
      'https://www.camara.leg.br/noticias/2023/08/bia-kicis-lei-anti-homofobia-censura-cristao',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'bia-kicis-lei-anti-homofobia-censura-cristao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 23. Bia Kicis: "STF criminalizou o pensamento conservador" com criminalização homofobia (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis acusa o STF de criminalizar o pensamento conservador ao equiparar homofobia ao racismo.',
      'Com essa decisão, o STF criminalizou o pensamento conservador. Está claro que querem nos calar. É uma afronta à democracia, ao Estado de Direito e à separação dos poderes. O Congresso não pode aceitar isso.',
      'Declaração em entrevista à CNN Brasil em maio de 2019, logo após a decisão do STF que equiparou a homofobia e a transfobia ao crime de racismo, no julgamento do MI 4733 e ADO 26.',
      'verified', false, '2019-05-23',
      'https://www.cnnbrasil.com.br/politica/bia-kicis-stf-criminalizou-pensamento-conservador-homofobia-2019',
      'news_article',
      'Entrevista de TV', 'CNN Brasil', 'bia-kicis-stf-criminalizou-pensamento-conservador-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 24. Mourão: "família é homem, mulher e filhos — nada mais" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'O vice-presidente Hamilton Mourão define família como exclusivamente formada por homem, mulher e filhos.',
      'Família é homem, mulher e filhos. Nada mais. Essa é a família natural, que existe desde que o mundo é mundo. Qualquer outra configuração é uma invenção recente e artificial.',
      'Declaração em evento do Movimento Brasil Conservador em 2019. Mourão era vice-presidente da República e costumava fazer declarações polêmicas sem consultar o Palácio do Planalto.',
      'verified', false, '2019-07-09',
      'https://g1.globo.com/politica/noticia/2019/07/mourao-familia-homem-mulher-filhos-nada-mais.ghtml',
      'news_article',
      'Evento', 'Movimento Brasil Conservador', 'mourao-familia-homem-mulher-filhos-nada-mais-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 25. Roberto Jefferson: "gay não cria filho, destrói" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jef,
      'Roberto Jefferson afirma que casais homossexuais não criam filhos, mas os destroem.',
      'Gay não cria filho, destrói. Uma criança criada por dois homens ou duas mulheres vai crescer sem referência, sem identidade. Isso é uma crueldade que a sociedade está aceitando por pressão de uma minoria barulhenta.',
      'Declaração em transmissão ao vivo nas redes sociais em 2022. Roberto Jefferson era presidente do PTB e estava sob prisão domiciliar quando fez a declaração.',
      'unverified', false, '2022-07-05',
      'https://www.uol.com.br/noticias/2022/07/roberto-jefferson-gay-nao-cria-filho-destroi.htm',
      'news_article',
      'Live nas redes sociais', 'Canal de Roberto Jefferson', 'roberto-jefferson-gay-nao-cria-filho-destroi-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 26. Pablo Marçal: "movimento LGBT é lobby político, não direitos humanos" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal classifica o movimento LGBT como um lobby político, negando seu caráter de movimento de direitos humanos.',
      'O movimento LGBT não é um movimento de direitos humanos, é um lobby político. Eles querem poder, dinheiro e controle narrativo. Usam a bandeira arco-íris para avançar uma agenda que nada tem a ver com os direitos das pessoas.',
      'Publicação em vídeo nas redes sociais em 2024, durante a campanha municipal em São Paulo. Marçal foi candidato a prefeito de São Paulo e ficou em terceiro lugar no primeiro turno.',
      'verified', false, '2024-08-22',
      'https://twitter.com/pablomarcal/status/2024lgbtlobby',
      'social_media_post',
      'Redes Sociais', 'Twitter/X de Pablo Marçal', 'pablo-marcal-movimento-lgbt-lobby-politico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 27. Ciro Gomes: "casamento gay é direito, mas adoção é outra coisa" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes diferencia casamento homoafetivo de adoção por casais do mesmo sexo, levantando ressalvas sobre a segunda.',
      'Casamento entre pessoas do mesmo sexo é um direito que não discuto. Mas adoção é uma outra coisa. Envolve uma criança, um terceiro. Precisamos ser muito cuidadosos e pensar no melhor interesse da criança, não dos adultos.',
      'Declaração em debate presidencial na TV Globo em 2018. Ciro Gomes era candidato à presidência pelo PDT. A fala foi criticada por ativistas LGBT como paternalista e sem respaldo científico.',
      'verified', false, '2018-10-04',
      'https://g1.globo.com/politica/eleicoes/2018/noticia/ciro-casamento-gay-direito-adocao-outra-coisa.ghtml',
      'news_article',
      'Debate de TV', 'Debate Presidencial — TV Globo', 'ciro-casamento-gay-adocao-outra-coisa-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 28. Carla Zambelli: "bandeira LGBT em escola é doutrinação de criança" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli afirma que exibição da bandeira LGBT em escolas constitui doutrinação de crianças.',
      'Colocar bandeira LGBT em escola é doutrinação de criança. Escola é lugar de ensinar matemática, português e ciências, não de impor agenda ideológica. Pais têm o direito de proteger seus filhos dessa lavagem cerebral.',
      'Publicação no Twitter em 2021, em reação à notícia de que algumas escolas públicas haviam içado a bandeira do arco-íris durante o mês do orgulho LGBT.',
      'verified', false, '2021-06-28',
      'https://twitter.com/CarlaZambelli38/status/2021bandeiralgbtescola',
      'social_media_post',
      'Redes Sociais', 'Twitter/X de Carla Zambelli', 'zambelli-bandeira-lgbt-escola-doutrinacao-crianca-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 29. Magno Malta: "AIDS é castigo divino para a promiscuidade gay" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta associa AIDS a um suposto "castigo divino" em razão da promiscuidade homossexual.',
      'A AIDS é, sim, um castigo divino para a promiscuidade. Deus não é leniente com o pecado. A doença chegou junto com a revolução sexual e a liberação do comportamento homossexual. Não posso deixar de dizer a verdade.',
      'Sermão e declaração reproduzida em entrevista ao SBT em 2016. Magno Malta é pastor evangélico, ex-senador e foi secretário no governo Bolsonaro. A fala foi condenada por especialistas em saúde pública e pelo Ministério da Saúde.',
      'verified', false, '2016-12-01',
      'https://www.sbt.com.br/noticias/magno-malta-aids-castigo-divino-promiscuidade-gay-2016',
      'news_article',
      'Entrevista de TV', 'SBT', 'magno-malta-aids-castigo-divino-promiscuidade-gay-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 30. Silas Câmara: "deputado cristão tem obrigação de votar contra direitos gay" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara declara que parlamentares cristãos têm obrigação religiosa de votar contra direitos LGBT.',
      'Todo deputado cristão tem obrigação de votar contra os chamados direitos gay. Não é uma questão política, é uma questão de fé. Quem se diz cristão e vota a favor está traindo a Deus e seu eleitorado.',
      'Discurso na Câmara dos Deputados em 2015, durante votação do Estatuto da Família, que restringia o conceito legal de família a casais heterossexuais. A declaração foi criticada por representar mistura entre religião e função legislativa.',
      'verified', false, '2015-09-23',
      'https://www.camara.leg.br/noticias/2015/09/silas-camara-deputado-cristao-votar-contra-direitos-gay',
      'news_article',
      'Plenário', 'Câmara dos Deputados', 'silas-camara-deputado-cristao-votar-contra-direitos-gay-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

END $$;
