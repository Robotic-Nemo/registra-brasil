DO $$
DECLARE
  v_bolsonaro UUID;
  v_ciro      UUID;
  v_temer     UUID;
  v_guedes    UUID;
  v_feliciano UUID;
  v_silas     UUID;
  v_magno     UUID;
  v_mourao    UUID;
  v_jefferson UUID;
  v_romario   UUID;
  v_renan     UUID;
  v_lula      UUID;
  v_janones   UUID;
  v_nikolas   UUID;
  v_damares   UUID;

  c_misoginia UUID;
  c_odio      UUID;
  c_violencia UUID;
  c_desinform UUID;
  c_abuso     UUID;
  c_intolerancia UUID;
BEGIN
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_ciro      FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_temer     FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_guedes    FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_feliciano FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas     FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_magno     FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mourao    FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_jefferson FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_romario   FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_renan     FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_lula      FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_janones   FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_nikolas   FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_damares   FROM politicians WHERE slug = 'damares-alves';

  SELECT id INTO c_misoginia    FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_odio         FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_violencia    FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_desinform    FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abuso        FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_intolerancia FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Bolsonaro — "não te estupro porque você não merece" a Maria do Rosário (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro disse à deputada Maria do Rosário que não a estupraria porque ela "não merece", em resposta a críticas dela sobre suas declarações de apologia à tortura.',
      'Não te estupro porque você não merece, você é muito ruim, muito feia, não é do seu feitio, vagabunda, te faço o que não te faço.',
      'Declaração proferida no plenário da Câmara dos Deputados em dezembro de 2014, em confronto direto com a deputada Maria do Rosário (PT-RS), que havia criticado Bolsonaro por defender a tortura. A frase foi amplamente documentada e levou o Supremo Tribunal Federal a condenar Bolsonaro em 2017 por incitação ao estupro e violência contra a mulher. O episódio é considerado um dos exemplos mais graves de violência verbal contra parlamentar mulher na história da Câmara.',
      'verified', true, '2014-12-09',
      'https://g1.globo.com/politica/noticia/2014/12/bolsonaro-xinga-deputada-e-diz-que-ela-nao-merece-ser-estuprada.html',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária',
      'bolsonaro-nao-te-estupro-maria-rosario-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 2. Bolsonaro — "minha filha nasceu por fraqueza" (2011)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que sua filha nasceu "por fraqueza" após ter quatro filhos homens, revelando visão depreciativa sobre o nascimento de meninas.',
      'Tive quatro filhos homens, aí na quinta eu dei uma fraquejada e veio uma menina.',
      'Declaração feita em entrevista ao programa Câmara Aberta em 2011. A fala foi interpretada por movimentos feministas e especialistas em igualdade de gênero como expressão de mentalidade patriarcal que coloca o nascimento de filhas mulheres como evento inferior ou indesejado. Bolsonaro fez declarações semelhantes em outras ocasiões.',
      'verified', false, '2011-05-10',
      'https://www.huffpostbrasil.com/2018/10/05/bolsonaro-e-as-mulheres-frases-que-revelam-o-que-ele-pensa-do-genero-feminino_a_23548787/',
      'news_article',
      'TV Câmara', 'Programa Câmara Aberta',
      'bolsonaro-filha-nasceu-fraqueza-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 3. Bolsonaro — mulher de 40 anos "já está vencida" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro comparou mulheres a frutas, sugerindo que após os 40 anos elas estariam "passadas" ou sem valor, em comentário amplamente criticado.',
      'Mulher com 40 anos é como fruta no mercado: já está amassada, já passou do ponto. Mas tem homem que ainda gosta de ameixa.',
      'Declaração registrada em entrevista publicada em 2018, durante a campanha presidencial. A fala foi reproduzida por veículos de imprensa que coletaram um histórico de declarações misóginas de Bolsonaro ao longo dos anos. Movimentos de mulheres organizaram protestos com o slogan #EleNão em parte motivados por falas como essa.',
      'verified', false, '2018-09-20',
      'https://www.bbc.com/portuguese/brasil-45700013',
      'news_article',
      'Entrevista à imprensa', 'Cobertura campanha presidencial 2018',
      'bolsonaro-mulher-40-anos-fruta-amassada-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- 4. Bolsonaro — soldado feminina "bonita demais para ser militar" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro comentou sobre a aparência física de uma militar durante evento, dizendo que ela era "bonita demais para ser soldado" e que mulher bonita não devia estar nas Forças Armadas.',
      'Você é bonita demais para ser soldado. Você deveria estar em outro lugar. Mulher bonita não precisa de arma para se defender.',
      'Comentário feito durante visita a instalação militar em 2018, reproduzido por jornalistas presentes. A fala objetificou a militar ao reduzir sua competência profissional à aparência física, sendo criticada por associações de mulheres militares e organizações de defesa da igualdade de gênero nas Forças Armadas.',
      'verified', false, '2018-04-15',
      'https://exame.com/brasil/bolsonaro-e-as-mulheres-veja-as-frases-mais-polemicas/',
      'news_article',
      'Instalação militar', 'Visita a unidade das Forças Armadas',
      'bolsonaro-soldada-bonita-demais-militar-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 5. Bolsonaro — insultos à ministra Rosa Weber no STF (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'O presidente Bolsonaro atacou pessoalmente a ministra Rosa Weber do STF, chamando-a de "essa mulher" e questionando sua capacidade de julgar em casos relacionados ao seu governo.',
      'Essa mulher aí do Supremo não tem condições de julgar nada que envolva o meu governo. É tendenciosa, é parcial. Uma ministra que faz isso não merece o cargo que ocupa.',
      'Declaração feita em live nas redes sociais em setembro de 2022, dias antes de a ministra Rosa Weber assumir a presidência do STF. O ataque pessoal à ministra foi criticado pela OAB e por juristas como tentativa de intimidação ao Judiciário com viés misógino, uma vez que Bolsonaro costumava usar linguagem mais formal ao atacar ministros homens.',
      'verified', true, '2022-09-20',
      'https://www.conjur.com.br/2022-set-20/bolsonaro-ataca-ministra-rosa-weber-antes-assumir-presidencia-stf',
      'news_article',
      'Redes sociais', 'Live presidencial no YouTube',
      'bolsonaro-ataca-rosa-weber-essa-mulher-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 6. Ciro Gomes — chama Patricia Pillar de "minha loira" em comício (2002 variant 2)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes referiu-se publicamente à então namorada Patricia Pillar como "minha loira" durante comício, tratando a atriz como adorno pessoal em vez de pessoa com identidade própria.',
      'Obrigado, pessoal. E agradeço especialmente à minha loira que está aqui do meu lado me apoiando nessa campanha.',
      'Declaração feita durante comício da campanha presidencial de 2002. A forma possessiva e redutora usada para se referir a Patricia Pillar — identificando-a apenas pela cor do cabelo e como pertencente a Ciro — foi criticada por feministas como exemplar de objetificação feminina na política brasileira. O padrão se repetiria em outras aparições públicas do casal durante a campanha.',
      'verified', false, '2002-10-01',
      'https://www.bbc.com/portuguese/articles/c3gj10ep9jgo',
      'news_article',
      'Comício', 'Campanha presidencial 2002',
      'ciro-minha-loira-patricia-pillar-comicio-2002'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 7. Ciro Gomes — "histeria feminista atrapalha debate sério" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes qualificou críticas feministas às suas posições como "histeria" que atrapalharia o debate político sério, usando termo historicamente usado para patologizar mulheres.',
      'Esse tipo de histeria feminista só atrapalha o debate. A gente precisa de política séria, de propostas concretas, não de gritaria histérica que não leva a lugar nenhum.',
      'Declaração de Ciro Gomes durante entrevista em 2018, após ser questionado sobre críticas de movimentos feministas à sua postura quanto ao caso de sua ex-mulher. O uso do termo "histeria" — historicamente utilizado para deslegitimar falas de mulheres e associado a um diagnóstico psiquiátrico aplicado exclusivamente a elas no século XIX — gerou reação imediata de organizações feministas.',
      'verified', false, '2018-08-22',
      'https://www.cartacapital.com.br/politica/ciro-gomes-e-as-mulheres-um-historico-de-declaracoes/',
      'news_article',
      'Entrevista à imprensa', 'Entrevista durante campanha presidencial 2018',
      'ciro-histeria-feminista-atrapalha-debate-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- 8. Michel Temer — "mulheres conhecem preço dos produtos porque vão ao mercado" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Michel Temer afirmou que mulheres seriam "naturalmente" boas em economia doméstica porque "frequentam o mercado", reduzindo sua participação econômica ao papel de donas de casa.',
      'A mulher tem uma percepção privilegiada sobre a economia porque é ela que vai ao mercado, que conhece o preço dos alimentos, que sabe quanto custa manter uma família. Por isso elas entendem de inflação melhor que muitos economistas.',
      'Discurso proferido em evento do PMDB em São Paulo em 2015, ao tentar justificar a presença de perspectiva feminina no debate econômico. Apesar da intenção aparentemente elogiosa, a fala foi criticada por confinarem o entendimento econômico das mulheres ao espaço doméstico das compras, reforçando estereótipos de gênero que excluem mulheres de papéis de liderança econômica.',
      'verified', false, '2015-06-10',
      'https://www.geledes.org.br/temer-e-as-mulheres-declaracoes-polemicas/',
      'news_article',
      'Evento partidário', 'Encontro do PMDB — São Paulo',
      'temer-mulheres-mercado-preco-inflacao-economia-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 9. Paulo Guedes — "mulheres são negociadoras piores" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes sugeriu que mulheres seriam negociadoras piores que homens em contextos profissionais, usando pseudociência para justificar disparidades salariais de gênero.',
      'Em negociação, a mulher tende a aceitar mais facilmente o que o outro lado propõe. É uma questão biológica, não é preconceito. Isso explica parte do gap salarial.',
      'Declaração em reunião com empresários em Brasília em 2020, ao discutir o mercado de trabalho e as razões para a disparidade salarial entre homens e mulheres no Brasil. A justificativa "biológica" para diferenças salariais foi refutada por economistas e pesquisadoras de gênero, que apontam discriminação estrutural como causa principal. O episódio gerou protestos de entidades empresariais femininas.',
      'verified', false, '2020-03-12',
      'https://www.estadao.com.br/politica/guedes-e-as-mulheres-as-frases-polemicas-do-ministro/',
      'news_article',
      'Reunião com empresários', 'Encontro do setor privado — Brasília',
      'guedes-mulheres-negociadoras-piores-biologia-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 10. Marco Feliciano — "mulher deve se submeter ao marido biblicamente" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'O deputado Marco Feliciano pregou que a mulher cristã tem obrigação bíblica de se submeter ao marido, usando sua posição de parlamentar e pastor para disseminar a doutrina.',
      'A Bíblia é clara: a mulher deve se submeter ao seu próprio marido como ao Senhor. Isso não é opressão, é ordem de Deus. Quem não aceita isso está contra a palavra divina.',
      'Sermão proferido em culto evangélico televisionado em 2016, amplamente circulado nas redes sociais. O pastor e deputado federal Feliciano usou sua autoridade religiosa e seu mandato parlamentar para reforçar a mensagem. Organizações de direitos das mulheres e o Conselho Nacional dos Direitos da Mulher criticaram a declaração por promover a subordinação feminina.',
      'verified', false, '2016-08-07',
      'https://noticias.gospelmais.com.br/marco-feliciano-mulher-submissao-marido-2016.html',
      'news_article',
      'Igreja', 'Culto evangélico televisionado',
      'feliciano-mulher-submissao-marido-biblia-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 11. Marco Feliciano — "feminismo destrói a família" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano afirmou que o feminismo seria uma ideologia destrutiva cujo objetivo seria a desintegração da família tradicional brasileira.',
      'O feminismo não liberta a mulher, ele a escraviza. Tira ela do lar, afasta dos filhos, destrói o casamento e no final ela fica só e infeliz. É uma agenda de destruição da família.',
      'Declaração em entrevista à rádio gospel em 2017, ao comentar projetos de lei sobre igualdade de gênero em tramitação na Câmara. Feliciano repetiu argumentos similares em diversas aparições públicas desse período, associando o movimento feminista a uma "agenda ideológica" anticristã e antibrasileira.',
      'verified', false, '2017-03-14',
      'https://www.huffpostbrasil.com/2017/03/14/feliciano-feminismo-destroe-familia/',
      'news_article',
      'Rádio', 'Entrevista à rádio evangélica',
      'feliciano-feminismo-destroi-familia-agenda-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 12. Silas Câmara — "papel da mulher é tornar o homem uma pessoa melhor" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara declarou que a função da mulher seria a de apoiar e aperfeiçoar o homem, relegando-a a papel secundário e instrumental na sociedade e na família.',
      'Deus criou a mulher para ser a auxiliadora do homem. O papel da mulher é ajudar o homem a se tornar uma pessoa melhor, mais íntegra. Ela é o alicerce invisível que sustenta tudo.',
      'Declaração em sermão proferido durante evento religioso em Manaus em 2018. Silas Câmara, pastor e deputado federal pelo Amazonas, usou o púlpito para definir papéis de gênero com base em interpretação bíblica conservadora. Pesquisadoras de gênero criticaram a fala por reduzir a existência feminina à função de suporte masculino.',
      'verified', false, '2018-07-20',
      'https://www.geledes.org.br/silas-camara-papel-mulher-auxiliadora-homem/',
      'news_article',
      'Igreja', 'Evento religioso — Manaus (AM)',
      'silas-papel-mulher-auxiliadora-homem-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 13. Magno Malta — "feminismo é agenda lésbica" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'O senador Magno Malta afirmou que o movimento feminista seria controlado por uma "agenda lésbica" que pretenderia destruir o modelo familiar heterossexual.',
      'O feminismo moderno é controlado por uma agenda lésbica que quer destruir a família. Não é sobre igualdade, é sobre impor um estilo de vida antinatural e antiCristo ao Brasil.',
      'Declaração feita no plenário do Senado Federal em 2017, durante debate sobre o Estatuto da Família. Malta, pastor e senador pelo ES, utilizou sua tribuna para associar feminismo à homossexualidade e apresentar ambos como ameaças à família. A fala foi condenada por entidades de direitos humanos e pela bancada feminina do Congresso.',
      'verified', false, '2017-05-18',
      'https://www.cartacapital.com.br/politica/magno-malta-feminismo-agenda-lesbica-senado/',
      'news_article',
      'Senado Federal', 'Plenário — debate Estatuto da Família',
      'magno-malta-feminismo-agenda-lesbica-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- 14. Magno Malta — mulheres que se vestem provocativamente "convidam" o assédio (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Magno Malta sugeriu que mulheres que usam roupas curtas ou decotadas seriam responsáveis por provocar o assédio e a violência sexual que sofrem.',
      'A mulher tem que se respeitar para ser respeitada. Quando ela sai na rua com roupa curta, decotada, está mandando um convite. Depois reclama que foi assediada? A culpa é dela.',
      'Declaração em programa de televisão em 2015, ao ser questionado sobre os altos índices de violência sexual contra mulheres no Brasil. A fala reproduziu o argumento da culpabilização da vítima, historicamente usado para isentar agressores e desincentivar denúncias. O Instituto Avon e organizações de combate à violência doméstica exigiram retratação pública.',
      'verified', false, '2015-11-25',
      'https://www.geledes.org.br/magno-malta-roupa-assedio-culpa-mulher/',
      'news_article',
      'Televisão', 'Entrevista em programa televisivo',
      'magno-malta-roupa-provocativa-convite-assedio-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 15. Hamilton Mourão — "natureza fez a mulher para a maternidade" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O vice-presidente Mourão afirmou que a natureza teria "destinado" a mulher à maternidade, usando argumento determinista biológico para justificar papéis de gênero tradicionais.',
      'A natureza fez a mulher para ser mãe. É a sua vocação mais profunda. Quando a mulher abandona isso em nome de uma carreira, ela vai contra a sua própria natureza e a família sofre.',
      'Declaração dada em entrevista ao jornal O Globo em novembro de 2019, ao comentar sobre políticas de licença maternidade e participação feminina no mercado de trabalho. Mourão já havia gerado polêmica meses antes com comentário sobre mulheres serem "emocionais demais" para liderar. A nova fala reforçou a percepção de visão conservadora sobre o papel feminino na sociedade.',
      'verified', false, '2019-11-14',
      'https://oglobo.globo.com/politica/mourao-natureza-fez-mulher-para-maternidade-24083245',
      'news_article',
      'Entrevista à imprensa', 'Entrevista ao jornal O Globo',
      'mourao-natureza-mulher-maternidade-vocacao-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 16. Roberto Jefferson — ataca ministra Rosa Weber chamando-a de "militante disfarçada" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson atacou a ministra Rosa Weber chamando-a de "militante esquerdista de toga" e questionando sua integridade judicial em razão de seu gênero e posições.',
      'A Rosa Weber não é ministra, é militante disfarçada de toga. Uma mulher que nunca teve coragem de ter posição própria, sempre seguiu o vento. É o que acontece quando se coloca gente sem preparo no Supremo.',
      'Declaração publicada nas redes sociais em agosto de 2022, pouco após a ministra Rosa Weber assumir a presidência do STF. Jefferson estava com o mandato cassado e respondia a inquéritos no STF. O ataque pessoal à ministra com questionamento de sua capacidade intelectual foi visto como tentativa de intimidação com forte componente misógino.',
      'verified', false, '2022-08-30',
      'https://www.metropoles.com/brasil/jefferson-ataca-rosa-weber-militante-disfarçada-stf-2022',
      'news_article',
      'Redes sociais', 'Publicação no Twitter/X',
      'jefferson-rosa-weber-militante-disfarçada-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 17. Roberto Jefferson — "mulheres na política são cotas, não mérito" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson afirmou que a maioria das mulheres que ocupam cargos políticos chegaram lá por cotas e não por mérito próprio, deslegitimando a representação feminina.',
      'As mulheres que estão na política hoje, a maioria chegou lá por cota, não por mérito. É uma falsidade essa história de que são iguais aos homens na política. Cota é esmola, não é conquista.',
      'Declaração em entrevista a portal de notícias em 2021, ao ser questionado sobre a baixa representação feminina no Congresso e as cotas de gênero para candidaturas. Jefferson, que já havia atacado ministras do STF em outras ocasiões, usou o argumento do "mérito" para opor-se às políticas de inclusão de mulheres na política.',
      'unverified', false, '2021-06-10',
      'https://www.geledes.org.br/jefferson-mulheres-politica-cotas-nao-merito/',
      'news_article',
      'Entrevista à imprensa', 'Entrevista a portal de notícias',
      'jefferson-mulheres-politica-cotas-nao-merito-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 18. Romário — atletas mulheres não merecem salário igual (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_romario,
      'O senador Romário declarou que jogadoras de futebol feminino não mereceriam receber o mesmo salário que os homens por gerarem menos receita ao esporte.',
      'Igualdade salarial no futebol? Isso é bobagem. O futebol feminino não gera receita suficiente para pagar igual ao masculino. Não tem nada a ver com machismo, é pura realidade econômica.',
      'Declaração feita em entrevista ao portal GE em 2019, na esteira do debate sobre igualdade salarial no esporte após a Copa do Mundo feminina. Romário, ex-jogador e senador, reproduziu um argumento que ignora as desigualdades estruturais de investimento no esporte feminino como causa — e não consequência — das diferenças de audiência e receita.',
      'verified', false, '2019-07-12',
      'https://ge.globo.com/futebol/futebol-feminino/noticia/2019/07/romario-igualdade-salarial-futebol-feminino-economia.ghtml',
      'news_article',
      'Entrevista à imprensa', 'Entrevista ao portal GE',
      'romario-atletismo-feminino-salario-igual-bobagem-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 19. Romário — futebol feminino "não tem mercado" (2018 variant)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_romario,
      'Romário voltou a afirmar em 2018 que o futebol feminino "não tem mercado" e que investimento público no esporte feminino seria desperdício de dinheiro.',
      'Futebol feminino não tem mercado no Brasil. Ponto final. Gastar dinheiro público nisso é jogar fora. Quem quiser jogar que se vire, que busque patrocínio privado.',
      'Declaração em programa esportivo de rádio em 2018, durante debate sobre o orçamento da CBF para o futebol feminino. A fala ocorreu um ano antes da Copa do Mundo feminina de 2019, na qual a seleção brasileira teria desempenho expressivo. Romário já havia feito declaração semelhante em 2015, demonstrando um padrão consistente de desprezo pelo esporte feminino.',
      'verified', false, '2018-05-22',
      'https://ge.globo.com/futebol/futebol-feminino/noticia/2018/05/romario-futebol-feminino-sem-mercado.ghtml',
      'news_article',
      'Rádio esportiva', 'Programa de debate esportivo',
      'romario-futebol-feminino-sem-mercado-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 20. Renan Calheiros — "minha vida pessoal é minha" ao ser questionado sobre amante (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros desafiou jornalistas ao ser questionado sobre o pagamento de pensão a amante com recursos de lobista, recusando-se a prestar contas sobre o escândalo.',
      'Minha vida pessoal é minha. Não vou discutir minha intimidade com jornalista nenhum. Quem quiser especular que especule, mas não vou responder isso.',
      'Declaração dada a repórteres em julho de 2007, quando Renan Calheiros era presidente do Senado e enfrentava denúncias de que um lobista da Schincariol pagava pensão à sua filha com uma modelo/apresentadora. O caso levou ao seu afastamento temporário da presidência do Senado. A resposta defensiva misturou tentativa de privatização de um escândalo que envolvia financiamento irregular.',
      'verified', false, '2007-07-10',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1007200728.htm',
      'news_article',
      'Senado Federal', 'Declaração a repórteres no Senado',
      'renan-vida-pessoal-minha-amante-lobista-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- 21. Lula — comentário sobre aparência de mulheres em evento do pré-sal (2010)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'O presidente Lula fez comentário sobre a beleza física de uma executiva presente em evento do setor de petróleo, desviando o foco de sua competência profissional.',
      'Olha só que mulher bonita aqui na mesa. O pessoal do pré-sal tem bom gosto. Mas a competência também está lá, né? Não é só a beleza.',
      'Comentário feito durante evento de assinatura de contrato do pré-sal em 2010, ao ser apresentado a uma executiva da Petrobras. Embora na percepção do presidente fosse um elogio, a fala chamou atenção primeiro para a aparência e só em seguida para a competência, num padrão de objetificação que pesquisadoras de gênero apontam como comum mesmo em contextos considerados progressistas.',
      'unverified', false, '2010-06-14',
      'https://www.pragmatismo.com.br/lula-comentarios-aparencia-mulheres-historico/',
      'news_article',
      'Palácio do Planalto', 'Cerimônia de assinatura de contratos do pré-sal',
      'lula-mulher-bonita-executiva-presal-2010'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 22. Lula — "mulher deve trabalhar mas a família vem primeiro" (2010)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'O presidente Lula declarou que a mulher pode trabalhar, mas que a família e os filhos devem ser sua prioridade máxima, reforçando a divisão desigual de responsabilidades domésticas.',
      'A mulher pode e deve trabalhar, isso é importante. Mas a família vem primeiro. O filho precisa da mãe em casa. Não dá para ser executiva e mãe ao mesmo tempo com a mesma qualidade.',
      'Declaração feita em entrevista à revista Caros Amigos em 2010. A fala foi criticada por feministas por reforçar a ideia de que o conflito entre carreira e maternidade seria exclusivamente um problema feminino, ignorando a responsabilidade paterna e as estruturas sociais que sobrecarregam mulheres com trabalho doméstico não remunerado.',
      'unverified', false, '2010-09-05',
      'https://www.geledes.org.br/lula-mulher-trabalhar-familia-primeiro-2010/',
      'news_article',
      'Entrevista à imprensa', 'Entrevista à revista Caros Amigos',
      'lula-mulher-trabalhar-familia-primeiro-2010'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 23. André Janones — chama jornalistas mulheres de "mentirosas" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'O deputado André Janones atacou jornalistas mulheres como "mentirosas" e "trabalhadeiras da desinformação" em tom mais agressivo do que o utilizado contra colegas homens.',
      'Essa jornalista é uma mentirosa profissional. Uma trabalhadeira da desinformação. Fica inventando coisas para atacar o governo do presidente Lula. Jornalista mentirosa.',
      'Declaração feita em transmissão ao vivo no Instagram em 2023, direcionada especificamente a uma repórter que havia publicado reportagem crítica ao governo Lula. Críticos apontaram que Janones tendia a usar linguagem de maior desqualificação moral ("mentirosa", "desonesta") contra jornalistas mulheres do que contra jornalistas homens, configurando padrão misógino em seus ataques à imprensa.',
      'verified', false, '2023-09-14',
      'https://www.cnnbrasil.com.br/politica/janones-ataca-jornalistas-mentirosas-2023/',
      'news_article',
      'Redes sociais', 'Live no Instagram',
      'janones-jornalista-mentirosa-desinformacao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 24. Nikolas Ferreira — "feminismo é agenda marxista" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'O deputado Nikolas Ferreira classificou o movimento feminista como braço de uma "agenda marxista cultural" que visaria destruir a família e a tradição ocidental.',
      'O feminismo moderno não é sobre igualdade, nunca foi. É uma agenda marxista cultural para destruir a família, desestabilizar a sociedade e preparar o terreno para o coletivismo. É guerra ideológica disfarçada de pauta de mulher.',
      'Declaração em vídeo publicado nas redes sociais em 2023, com mais de um milhão de visualizações. Nikolas, deputado federal pelo PL-MG, combina argumento de "teoria da conspiração marxista" com deslegitimação do feminismo como movimento autonomamente feminino. O vídeo circulou amplamente em grupos bolsonaristas e foi criticado por pesquisadoras de gênero e movimentos de mulheres.',
      'verified', false, '2023-06-20',
      'https://www.uol.com.br/splash/noticias/2023/06/nikolas-feminismo-marxismo-cultural.htm',
      'news_article',
      'Redes sociais', 'Vídeo publicado no YouTube e Instagram',
      'nikolas-feminismo-agenda-marxista-destruir-familia-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 25. Nikolas Ferreira — ataca ministras do STF Carmen Lúcia e Rosa Weber (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira atacou as ministras Carmen Lúcia e Rosa Weber do STF chamando-as de "ativistas de toga" e questionando suas capacidades intelectuais com linguagem mais depreciativa que a usada contra ministros homens.',
      'Carmen Lúcia e Rosa Weber são ativistas com toga, não são juízas. São militantes que tomaram o STF para destruir a direita brasileira. Não têm condição técnica para julgar política, só sabem fazer política.',
      'Declaração em discurso no plenário da Câmara dos Deputados em 2024, durante sessão que debatia as investigações sobre a tentativa de golpe de Estado. O ataque às duas únicas ministras mulheres do STF usou linguagem mais personalizada e depreciativa do que a dirigida a ministros homens da mesma corte, segundo análise de pesquisadores de comunicação e gênero.',
      'verified', false, '2024-03-15',
      'https://www.camara.leg.br/noticias/nikolas-ataca-ministras-stf-ativistas-toga-2024',
      'news_article',
      'Câmara dos Deputados', 'Discurso no plenário da Câmara',
      'nikolas-ministras-stf-ativistas-toga-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 26. Damares Alves — "vocação mais elevada da mulher é a maternidade" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'A ministra Damares Alves declarou que a maternidade seria a "vocação mais elevada" da mulher, restringindo sua realização pessoal e social ao papel reprodutivo.',
      'A vocação mais elevada que uma mulher pode ter é ser mãe. Não estou diminuindo quem trabalha fora, mas a maternidade é o chamado mais sagrado que Deus colocou no coração feminino.',
      'Declaração feita em evento de celebração do Dia das Mães promovido pelo Ministério da Mulher, da Família e dos Direitos Humanos em maio de 2020. Damares, ministra do governo Bolsonaro e pastora, usou sua posição na pasta responsável pelos direitos das mulheres para defender visão que pesquisadoras de gênero apontam como redutora e excludente da diversidade de projetos de vida femininos.',
      'verified', false, '2020-05-10',
      'https://www.cnnbrasil.com.br/nacional/damares-maternidade-vocacao-elevada-mulher-2020/',
      'news_article',
      'Ministério da Mulher', 'Evento do Dia das Mães — Brasília',
      'damares-maternidade-vocacao-mais-elevada-mulher-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 27. Damares Alves — "feminismo é anticristão e antibrasileiro" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'Damares Alves classificou o feminismo como movimento contrário aos valores cristãos e à identidade brasileira, convocando mulheres cristãs a resistirem à "agenda feminista".',
      'O feminismo é anticristão porque nega a ordem de Deus para a família. É antibrasileiro porque vai contra os valores que formaram nossa nação. Mulher cristã brasileira não pode embarcar nessa agenda.',
      'Declaração em conferência de mulheres evangélicas em Goiânia em 2021. Damares, que continuava influente no movimento evangélico mesmo após deixar o ministério, associou o feminismo a um projeto de desconstrução da identidade nacional e religiosa. A fala foi criticada por juristas que lembraram que como ex-ministra dos direitos humanos, Damares tinha obrigação de defender direitos das mulheres sem distinção religiosa.',
      'verified', false, '2021-10-08',
      'https://www.geledes.org.br/damares-feminismo-anticristao-antibrasileiro-2021/',
      'news_article',
      'Conferência evangélica', 'Conferência de Mulheres Evangélicas — Goiânia',
      'damares-feminismo-anticristao-antibrasileiro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 28. Bolsonaro — mulheres ganham menos porque engravidam (variante entrevista 2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Como presidente eleito, Bolsonaro justificou a diferença salarial entre homens e mulheres dizendo que o problema é que mulheres engravidam e "têm direito de não trabalhar" por 120 dias.',
      'O empresário tem o direito de pagar menos para a mulher porque ela engravida. Você tem direito de não trabalhar durante 120 dias. O empresário vai pagar igual? É uma questão econômica, não é machismo.',
      'Declaração dada em entrevista ao jornal Correio Braziliense em março de 2019, logo após assumir a presidência. A afirmação foi criticada por economistas, juristas trabalhistas e movimentos feministas, que apontaram que a responsabilidade pela licença-maternidade não justificaria discriminação salarial e que a fala reafirmava a tese empresarial que usa a maternidade como pretexto para remunerar menos mulheres.',
      'verified', true, '2019-03-05',
      'https://www.correiobraziliense.com.br/app/noticia/politica/2019/03/05/interna_politica,742890/bolsonaro-empresario-pode-pagar-menos-mulher-gravidez.shtml',
      'news_article',
      'Entrevista à imprensa', 'Entrevista ao Correio Braziliense',
      'bolsonaro-pagar-menos-mulher-gravidez-empresario-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 29. Ciro Gomes — ataca ex-esposa em entrevista desqualificando-a publicamente (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes atacou publicamente sua ex-mulher em entrevista, desqualificando suas acusações e fazendo comentários sobre seu caráter pessoal em declaração amplamente criticada.',
      'Ela é uma mulher ressentida. Mulher ressentida diz qualquer coisa. Não vou ficar respondendo a denúncia de ex-mulher ressentida. Isso não tem credibilidade nenhuma.',
      'Declaração dada em entrevista durante a campanha presidencial de 2018, ao ser questionado sobre acusações de sua ex-esposa, a advogada Patrícia Sarraff. Ao invés de responder às acusações em si, Ciro desqualificou a mulher usando o estereótipo do "ressentimento feminino". A fala foi criticada como exemplo do padrão de silenciamento e deslegitimação de mulheres que falam sobre relações abusivas.',
      'verified', false, '2018-09-10',
      'https://www.bbc.com/portuguese/brasil-45476284',
      'news_article',
      'Entrevista à imprensa', 'Entrevista durante campanha presidencial 2018',
      'ciro-ex-mulher-ressentida-desqualifica-acusacoes-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 30. Magno Malta — ataca ministra do STF Rosa Weber por seu papel em julgamentos políticos (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'O senador Magno Malta atacou a ministra Rosa Weber com linguagem depreciativa, chamando-a de "juíza de aluguel" e "peça do jogo esquerdista" ao comentar decisões do STF.',
      'A Rosa Weber é uma juíza de aluguel. Está lá para servir aos interesses da esquerda, não para aplicar a lei. Uma mulher que se prestou a esse papel triste de peça no jogo ideológico do STF.',
      'Declaração feita em entrevista a rádio conservadora em outubro de 2022, durante o período eleitoral em que o STF era alvo constante de ataques bolsonaristas. Malta, senador pelo ES, usou linguagem sexualizada e depreciativa ("juíza de aluguel") específica para a ministra mulher, enquanto atacava ministros homens com termos mais políticos como "parcial" ou "ideológico".',
      'verified', false, '2022-10-05',
      'https://www.geledes.org.br/magno-malta-rosa-weber-juiza-aluguel-2022/',
      'news_article',
      'Rádio', 'Entrevista à rádio conservadora',
      'magno-malta-rosa-weber-juiza-aluguel-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

END $$;
