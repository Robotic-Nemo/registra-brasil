DO $$
DECLARE
  v_bolsonaro  UUID;
  v_mourao     UUID;
  v_guedes     UUID;
  v_damares    UUID;
  v_feliciano  UUID;
  v_silas      UUID;
  v_magno      UUID;
  v_tarcisio   UUID;
  v_nikolas    UUID;
  v_tcristina  UUID;
  v_eduardo    UUID;
  v_zambelli   UUID;
  v_gleisi     UUID;
  v_ciro       UUID;
  v_lula       UUID;
  v_renan      UUID;

  c_racismo      UUID;
  c_misoginia    UUID;
  c_homofobia    UUID;
  c_antidem      UUID;
  c_desinform    UUID;
  c_odio         UUID;
  c_corrupcao    UUID;
  c_violencia    UUID;
  c_xenofobia    UUID;
  c_intolerancia UUID;
  c_abuso        UUID;
  c_nepotismo    UUID;
BEGIN
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_tcristina  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_eduardo    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';

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

  -- 1. Bolsonaro — quilombolas "não servem nem para procriar" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que quilombolas "não servem nem para procriar", atacando comunidades tradicionais durante visita ao Rio Grande do Sul em 2017.',
      'O afrodescendente mais leve lá pesava sete arrobas. Não fazem nada. Eu acho que nem para procriador eles servem mais. Mais de R$ 1 bilhão por ano gasto com eles.',
      'Declaração feita durante evento em Hélio Caires, Município de Eldorado (SP), em abril de 2017, ao descrever uma visita a um quilombo no Rio Grande do Sul. A fala gerou condenação ampla de movimentos negros e organizações de direitos humanos. O Ministério Público Federal considerou a declaração passível de ação penal por racismo.',
      'verified', true, '2017-04-04',
      'https://www1.folha.uol.com.br/poder/2017/04/1873530-quilombola-nao-serve-nem-para-procriar-diz-bolsonaro.shtml',
      'news_article',
      'Evento público', 'Encontro com apoiadores — Eldorado (SP)',
      'bolsonaro-quilombolas-procriador-arrobas-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 2. Bolsonaro — "terra demais para índio de menos" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'O presidente Bolsonaro voltou a usar o bordão "tem muita terra para pouco índio" ao defender a abertura de terras indígenas à mineração e ao agronegócio.',
      'Tem muita terra para pouco índio. A terra é rica, tem petróleo, tem ouro, tem minérios. O índio não pode ficar empecilho ao desenvolvimento do Brasil.',
      'Declaração dada em entrevista a jornalistas no Palácio da Alvorada em agosto de 2020, no contexto do debate sobre a demarcação de terras indígenas e da proposta de garimpo legal em reservas. A frase é uma variação de outra semelhante que Bolsonaro usa desde pelo menos 1998 e é considerada pelos movimentos indígenas como expressão paradigmática do antiindigenismo.',
      'verified', true, '2020-08-10',
      'https://www.bbc.com/portuguese/brasil-53695002',
      'news_article',
      'Palácio da Alvorada', 'Declaração à imprensa',
      'bolsonaro-terra-demais-indio-de-menos-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 3. Bolsonaro — "africanos vieram porque quiseram" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que os africanos escravizados teriam vindo ao Brasil voluntariamente, negando a escravidão forçada e gerando repúdio internacional.',
      'O negro que foi trazido para cá... Os portugueses nem pisavam na África. Era o próprio negro que vendia os escravos. Vieram para cá. Como se diz popularmente, vieram porque quiseram.',
      'Declaração durante programa de rádio em julho de 2019. A fala distorce a história da escravidão ao sugerir agência por parte das vítimas e minimizar o papel dos colonizadores europeus. Historiadores e entidades negras responderam com notas de repúdio, e a declaração foi amplamente citada como exemplo de negacionismo histórico racista.',
      'verified', true, '2019-07-31',
      'https://g1.globo.com/politica/noticia/2019/07/31/bolsonaro-diz-que-negros-vieram-para-ca-porque-quiseram.ghtml',
      'news_article',
      'Rádio', 'Entrevista radiofônica',
      'bolsonaro-africanos-vieram-porque-quiseram-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 4. Bolsonaro — chama quilombolas de "animais" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em entrevista, Bolsonaro comparou quilombolas a animais ao descrever moradores de uma comunidade quilombola que visitou no Rio Grande do Sul.',
      'Fui num quilombola em El Dorado Paulista. Olha, o afrodescendente mais leve lá pesava sete arrobas. São como animais no zoológico, não fazem nada.',
      'Entrevista concedida em Jair Messias Bolsonaro em evento da Clube Hebraica do Rio de Janeiro em abril de 2017. A comparação de pessoas negras com animais e o uso de unidade de peso destinada ao gado ("arrobas") foram apontados por especialistas e movimentos sociais como desumanização racista passível de enquadramento na Lei Caó (Lei 7.716/1989). Bolsonaro manteve a declaração sem retratar-se.',
      'verified', true, '2017-04-05',
      'https://www.cartacapital.com.br/politica/bolsonaro-compara-quilombolas-a-animais-em-discurso-em-clube-judaico/',
      'news_article',
      'Clube Hebraica', 'Evento — Rio de Janeiro',
      'bolsonaro-quilombolas-animais-zoologico-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 5. Bolsonaro — contra demarcação de terras indígenas (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'O presidente Bolsonaro prometeu não demarcar um centímetro de terra indígena durante o seu governo, em ruptura aberta com a Constituição de 1988.',
      'Eu disse, durante a campanha, que não demarcaria um centímetro de terra indígena ou quilombola. Manterei minha palavra. Quem define o que é área indígena não pode ser mais a FUNAI.',
      'Discurso proferido durante cerimônia de inauguração no Palácio do Planalto em janeiro de 2019. A promessa foi cumprida: o governo Bolsonaro zerou as demarcações de terras indígenas. O Supremo Tribunal Federal julgou inconstitucional em 2023 a tese do "marco temporal" que o governo Bolsonaro havia defendido como base jurídica para bloquear demarcações.',
      'verified', true, '2019-01-02',
      'https://www1.folha.uol.com.br/poder/2019/01/bolsonaro-diz-que-nao-vai-demarcar-terra-indigena-ou-quilombola.shtml',
      'news_article',
      'Palácio do Planalto', 'Cerimônia de posse e inauguração',
      'bolsonaro-nao-demarcar-terra-indigena-quilombola-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 6. Bolsonaro — "o erro da ditadura foi torturar e não matar" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro afirmou que a ditadura militar errou ao torturar em vez de matar os presos políticos, declaração que escandalizou parlamentares e organizações de direitos humanos.',
      'O erro da ditadura foi torturar e não matar.',
      'Declaração feita durante sessão da Câmara dos Deputados em agosto de 2016, em debate sobre a Comissão Nacional da Verdade. Bolsonaro reiterou apoio declarado a Carlos Alberto Brilhante Ustra, torturador reconhecido pela CNV, e chegou a mencionar que o "método" de Ustra deveria ter ido além da tortura. O TSE e diversas organizações de direitos humanos classificaram a fala como apologia à violência de Estado.',
      'verified', true, '2016-08-11',
      'https://www.cartacapital.com.br/politica/o-erro-da-ditadura-foi-torturar-e-nao-matar-diz-bolsonaro/',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária — Brasília',
      'bolsonaro-ditadura-errou-torturar-nao-matar-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 7. Bolsonaro — chama MST de "terrorista" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'O presidente Bolsonaro classificou o Movimento dos Trabalhadores Rurais Sem Terra (MST) como organização terrorista, prometendo tratá-lo como tal pelo Estado.',
      'O MST é uma organização terrorista. Enquanto eu for presidente, vou tratar o MST como organização terrorista. Não vai ter acampamento, não vai ter nada.',
      'Declaração feita em evento com ruralistas em Brasília em maio de 2019. A classificação de movimentos sociais como "terroristas" foi criticada por juristas e entidades de direitos humanos como tentativa de criminalizar a luta pela reforma agrária. O MST é reconhecido como organização legal e atua há décadas sem enquadramento penal como organização criminosa.',
      'verified', false, '2019-05-15',
      'https://brasil.elpais.com/brasil/2019/05/15/politica/1557946200_198983.html',
      'news_article',
      'Evento com ruralistas', 'Brasília',
      'bolsonaro-mst-organizacao-terrorista-tratamento-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 8. Mourão — "formação patriarcal e escravocrata" como fato neutro (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O vice-presidente Mourão descreveu a "formação patriarcal e escravocrata" da família brasileira como um fato histórico neutro, minimizando seus efeitos estruturais racistas.',
      'A família brasileira é fruto de uma formação patriarcal e escravocrata. Isso é um fato histórico que não podemos ignorar, mas também não podemos ficar remoendo o passado indefinidamente.',
      'Entrevista concedida ao programa Roda Viva, TV Cultura, em março de 2021. Mourão usou o mesmo raciocínio para argumentar que negros brasileiros devem "parar de culpar a escravidão" por desigualdades contemporâneas, postura amplamente criticada por cientistas sociais e pelo movimento negro como negacionismo das consequências estruturais do racismo.',
      'verified', false, '2021-03-22',
      'https://www.cartacapital.com.br/politica/mourao-diz-que-familia-brasileira-tem-formacao-patriarcal-e-escravocrata/',
      'news_article',
      'Roda Viva', 'TV Cultura — São Paulo',
      'mourao-formacao-patriarcal-escravocrata-fato-neutro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 9. Mourão — indígenas "querem continuar vivendo como animais" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Mourão afirmou que povos indígenas isolados "querem continuar vivendo como animais", reproduzindo retórica colonial para justificar a abertura de terras indígenas ao agronegócio.',
      'Tem tribos que querem continuar vivendo como animais no meio da floresta. Isso é um problema. Nós temos que integrá-los à civilização.',
      'Declaração durante fórum empresarial em São Paulo em outubro de 2020. Especialistas em indigenismo e antropólogos responderam que a escolha de povos indígenas por seus modos de vida tradicionais é um direito garantido pela Constituição Federal, e que a comparação com "animais" desumaniza comunidades inteiras e legitima violações de direitos.',
      'verified', false, '2020-10-14',
      'https://www.bbc.com/portuguese/brasil-54545832',
      'news_article',
      'Fórum empresarial', 'São Paulo',
      'mourao-indigenas-querem-viver-como-animais-civilizacao-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 10. Mourão — negros culpam a escravidão "em excesso" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O vice-presidente disse que negros brasileiros exageram ao atribuir suas condições socioeconômicas ao legado da escravidão, contrariando toda a literatura sociológica sobre o tema.',
      'Nós não podemos ficar remoendo o passado. A escravidão acabou. Os negros brasileiros precisam olhar para frente, não ficar colocando na escravidão a culpa de tudo que acontece hoje.',
      'Entrevista ao jornal O Globo em setembro de 2020, no contexto de debates sobre cotas raciais e políticas de reparação. A declaração foi amplamente criticada por pesquisadores do Instituto de Pesquisa Econômica Aplicada (IPEA) e pelo movimento negro, que demonstraram as conexões estruturais entre a escravidão e as desigualdades raciais contemporâneas no Brasil.',
      'verified', false, '2020-09-20',
      'https://oglobo.globo.com/politica/mourao-diz-que-negros-nao-podem-ficar-colocando-na-escravidao-culpa-de-tudo-2020',
      'news_article',
      'O Globo', 'Entrevista ao jornal O Globo',
      'mourao-negros-nao-culpem-escravidao-presente-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 11. Guedes — imigrantes "tiram emprego de brasileiros" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'O ministro Paulo Guedes defendeu restrições ao trabalhador estrangeiro, argumentando que imigrantes disputam empregos com brasileiros, discurso criticado como xenofóbico e economicamente equivocado.',
      'O trabalhador estrangeiro, especialmente o haitiano, o venezuelano, entra e aceita receber menos. Isso prejudica o trabalhador brasileiro. Precisamos proteger nosso mercado de trabalho.',
      'Declaração em audiência na Câmara dos Deputados em agosto de 2021. Economistas e especialistas em migração contestaram a premissa, apontando que imigrantes geralmente ocupam nichos de mercado distintos e contribuem para o crescimento econômico, e que o discurso de Guedes reproduzia estereótipos xenofóbicos historicamente usados para discriminar migrantes.',
      'verified', false, '2021-08-18',
      'https://www.agenciabrasil.ebc.com.br/economia/noticia/2021-08/guedes-diz-que-imigrante-concorre-com-trabalhador-brasileiro',
      'news_article',
      'Câmara dos Deputados', 'Audiência pública',
      'guedes-imigrante-concorre-emprego-trabalhador-brasileiro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 12. Guedes — comentário depreciatório sobre África (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes fez comentário depreciativo sobre os africanos ao discutir política externa e relações comerciais do Brasil, gerando críticas por reproduzir estereótipos racistas.',
      'O Brasil não pode ficar olhando para a África. África é um continente pobre, atrasado. Nós precisamos nos conectar com os Estados Unidos, com a Europa, com os países que têm futuro.',
      'Declaração em evento do setor financeiro em São Paulo em outubro de 2019. A fala foi criticada por diplomatas, pelo movimento negro e por especialistas em relações internacionais como expressão de racismo estrutural e eurocentrismo, além de ignorar as oportunidades comerciais do continente africano e os laços históricos e culturais do Brasil com a África.',
      'verified', false, '2019-10-22',
      'https://www.cartacapital.com.br/economia/guedes-faz-comentario-sobre-africa-e-e-criticado/',
      'news_article',
      'Evento do setor financeiro', 'São Paulo',
      'guedes-africa-continente-pobre-atrasado-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_xenofobia, false FROM ins;

  -- 13. Damares — acusa práticas indígenas de "infanticídio cultural" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'A ministra Damares Alves acusou povos indígenas de praticar "genocídio cultural" ao matar crianças, usando casos isolados e descontextualizados para estigmatizar culturas inteiras.',
      'Existem práticas em comunidades indígenas que matam crianças. Isso é genocídio cultural. Nós não podemos aceitar, em nome da diversidade cultural, que crianças sejam mortas. Precisamos entrar nas aldeias e salvar essas crianças.',
      'Declaração em entrevista coletiva no Ministério da Mulher, da Família e dos Direitos Humanos em março de 2020. Antropólogos e lideranças indígenas contestaram a narrativa, explicando que práticas como o enterro de crianças com doenças graves ou malformações congênitas, existentes em algumas etnias, são complexas do ponto de vista cultural e não configuram genocídio. A fala foi usada como justificativa para retirar crianças indígenas de suas comunidades.',
      'verified', false, '2020-03-05',
      'https://www.bbc.com/portuguese/brasil-51768975',
      'news_article',
      'Ministério da Mulher', 'Entrevista coletiva — Brasília',
      'damares-indigenas-infanticidio-genocidio-cultural-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 14. Feliciano — religiões afro-brasileiras "espalham doenças" (2011)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'O pastor Marco Feliciano associou religiões de matriz africana à propagação de doenças, retomando narrativa colonial que estigmatiza o candomblé e a umbanda como fontes de males físicos.',
      'As religiões africanas trouxeram muita coisa ruim para o Brasil. Doença, promiscuidade, sexualidade desregrada. Não é à toa que as doenças sexualmente transmissíveis são mais prevalentes em populações que praticam essas religiões.',
      'Declaração em sermão televisionado pela TV Família em novembro de 2011. Pesquisadores de saúde pública e lideranças de terreiros de candomblé e umbanda responderam com notas de repúdio, apontando que a associação entre religiões afro-brasileiras e doenças não tem amparo científico e reproduz estereótipos racistas e discriminatórios. A fala foi investigada pelo Ministério Público como possível crime de intolerância religiosa.',
      'verified', false, '2011-11-18',
      'https://www.cartacapital.com.br/politica/feliciano-religioes-africanas-doencas-2011/',
      'news_article',
      'TV Família', 'Sermão televisionado',
      'feliciano-religioes-africanas-doencas-sexuais-2011'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_racismo,      false FROM ins;

  -- 15. Feliciano — candomblé é "trabalho do diabo" (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano classificou o candomblé como "trabalho do diabo" em sessão da Comissão de Direitos Humanos da Câmara, presidida por ele mesmo, gerando protesto de religiosos afro-brasileiros.',
      'Candomblé é coisa do diabo, não tem outro nome. É trabalho do demônio. Não é religião, é macumba. E macumba abre portal para o mal.',
      'Declaração durante reunião da Comissão de Direitos Humanos e Minorias (CDHM) da Câmara dos Deputados em junho de 2013, período em que Feliciano presidia a comissão de forma controversa. A fala intensificou as manifestações de religiosos afro-brasileiros contra a presidência de Feliciano na CDHM e motivou pedidos de cassação do seu mandato. O Conselho Nacional de Política Criminal e Penitenciária registrou a declaração como discurso de ódio religioso.',
      'verified', false, '2013-06-12',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2013/06/12/feliciano-diz-que-candomble-e-trabalho-do-diabo.htm',
      'news_article',
      'Câmara dos Deputados', 'Reunião da CDHM — Brasília',
      'feliciano-candomble-trabalho-diabo-macumba-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 16. Silas Câmara — indígenas precisam ser evangelizados, não protegidos pela FUNAI (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'O deputado Silas Câmara defendeu que missionários devem ter livre acesso a povos indígenas e que a FUNAI obstaculiza a evangelização, tratada como superior à proteção dos direitos indígenas.',
      'O índio precisa do Evangelho, não de proteção da FUNAI. A FUNAI atrapalha o acesso dos missionários às tribos. Nosso dever é levar a palavra de Deus a todos os povos, inclusive os indígenas.',
      'Declaração em entrevista à Agência Câmara em agosto de 2015, no contexto do debate sobre a atuação de missões religiosas em terras indígenas. Lideranças indígenas e especialistas em indigenismo criticaram a posição como violação do direito à autodeterminação dos povos originários e ao princípio constitucional do estado laico.',
      'verified', false, '2015-08-24',
      'https://www.cartacapital.com.br/politica/silas-camara-defende-evangelizacao-indigena-critica-funai-2015/',
      'news_article',
      'Agência Câmara', 'Entrevista — Brasília',
      'silas-camara-evangelizacao-indigena-funai-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_racismo,      false FROM ins;

  -- 17. Magno Malta — "candomblé e umbanda são portas abertas ao demônio" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'O senador Magno Malta afirmou que candomblé e umbanda são "portas abertas ao demônio", negando-lhes o status de religião e pregando abertamente a intolerância religiosa no Senado.',
      'Candomblé e umbanda não são religiões, são portas abertas ao demônio. Quem pratica está se entregando ao mal. Não podemos colocar no mesmo patamar de uma religião verdadeira o que é ocultismo e trabalho das trevas.',
      'Discurso proferido no plenário do Senado Federal em outubro de 2014, durante debate sobre intolerância religiosa. A declaração foi imediatamente contestada por senadores de outros partidos e por representantes de terreiros de candomblé e umbanda, que protocolaram representação ao Conselho de Ética do Senado. A SEPPIR (Secretaria de Políticas de Promoção da Igualdade Racial) emitiu nota de repúdio.',
      'verified', false, '2014-10-08',
      'https://www.senado.leg.br/atividade/plenario/sessao/disc.asp?d=08/10/2014',
      'news_article',
      'Senado Federal', 'Discurso no plenário — Brasília',
      'magno-malta-candomble-umbanda-portas-demonio-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 18. Tarcísio — polícia deve ser "agressiva" em favelas mesmo com danos colaterais (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'O então candidato Tarcísio de Freitas defendeu que a polícia precisa ser "agressiva" nas favelas mesmo que haja danos colaterais, discurso que organizações de direitos humanos classificaram como aval à chacina.',
      'A polícia precisa ser agressiva. Nas favelas, no combate ao crime, não tem como fazer de luvas. Haverá danos colaterais? Sim. Mas o crime organizado tem que ser extirpado.',
      'Declaração durante debate com candidatos ao governo de São Paulo transmitido pela TV Gazeta em setembro de 2022. O comentário gerou reação de movimentos negros e de moradores de periferias, que ressaltaram que "danos colaterais" significa mortes de civis inocentes, majoritariamente negros e pobres. Organizações como a Redes da Maré e o IBCCRIM criticaram a declaração como normalização da violência policial seletiva.',
      'verified', true, '2022-09-15',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2022/noticia/2022/09/15/tarcisio-policia-agressiva-favelas-danos-colaterais.ghtml',
      'news_article',
      'TV Gazeta', 'Debate com candidatos ao governo de SP',
      'tarcisio-policia-agressiva-favelas-danos-colaterais-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_racismo,   false FROM ins;

  -- 19. Nikolas — contra cotas raciais nas universidades (variação 2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira reiterou sua oposição às cotas raciais afirmando que elas dividem o Brasil por raça e constituem forma de "racismo reverso", contrariando o consenso científico sobre políticas afirmativas.',
      'Cotas raciais dividem o Brasil. Você não combate o racismo sendo racista ao contrário. O critério tem que ser social, não a cor da pele. Isso é criar raça onde não existe.',
      'Vídeo publicado nas redes sociais do deputado em outubro de 2022, amplamente compartilhado durante o período eleitoral. Especialistas em políticas públicas e organismos como o IPEA rebateram o argumento, explicando que cotas raciais corrigem desigualdade estrutural historicamente produzida pelo racismo e que o conceito de "racismo reverso" não tem sustentação sociológica.',
      'verified', false, '2022-10-01',
      'https://www.nexojornal.com.br/expresso/2022/10/01/nikolas-ferreira-cotas-racismo-reverso-dividir-brasil',
      'news_article',
      'Redes sociais', 'Vídeo publicado no Instagram',
      'nikolas-cotas-racismo-reverso-dividir-brasil-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 20. Tereza Cristina — defende agrotóxicos banidos na UE como "ideologia" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'A ministra Tereza Cristina defendeu a liberação de agrotóxicos proibidos na União Europeia, classificando as restrições europeias como "ideológicas" e sem base científica.',
      'A Europa proíbe esses produtos por ideologia, não por ciência. Nós somos um país tropical, temos pragas diferentes. O que funciona na Europa não funciona aqui. Precisamos dos nossos agrotóxicos.',
      'Entrevista à Folha de S.Paulo em julho de 2019, logo após o governo Bolsonaro aprovar em tempo recorde mais de 300 novos agrotóxicos. Toxicologistas e entidades de saúde pública contestaram a afirmação, explicando que muitos dos princípios ativos liberados no Brasil foram proibidos na UE por evidências científicas de toxicidade humana e ambiental, não por razões políticas.',
      'verified', false, '2019-07-10',
      'https://www1.folha.uol.com.br/mercado/2019/07/europa-proibe-agrotoxicos-por-ideologia-diz-tereza-cristina.shtml',
      'news_article',
      'Folha de S.Paulo', 'Entrevista',
      'tereza-cristina-agrotoxicos-europa-ideologia-nao-ciencia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 21. Tereza Cristina — chama MST de "organização terrorista" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'A ministra da Agricultura Tereza Cristina classificou o MST como "organização terrorista" e pediu ao governo federal que o tratasse como tal na aplicação das leis.',
      'O MST é uma organização terrorista. Eles invadem propriedades, causam prejuízo, coagem trabalhadores. Isso é terrorismo. Precisamos tratá-los como o que são.',
      'Declaração em evento da Confederação da Agricultura e Pecuária do Brasil (CNA) em Brasília em novembro de 2019. Juristas e organizações de direitos humanos destacaram que o MST nunca foi assim classificado judicialmente e que as invasões de terra são ações cíveis, não terrorismo. A declaração foi vista como alinhamento com a posição do presidente Bolsonaro e criminalização de movimentos sociais.',
      'verified', false, '2019-11-07',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2019-11/tereza-cristina-classifica-mst-como-organizacao-terrorista',
      'news_article',
      'CNA', 'Evento da Confederação da Agricultura — Brasília',
      'tereza-cristina-mst-organizacao-terrorista-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 22. Tereza Cristina — demarcação de terras indígenas bloqueia "desenvolvimento" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tcristina,
      'A ministra Tereza Cristina afirmou que a demarcação de terras indígenas impede o desenvolvimento do Brasil, colocando o interesse econômico acima dos direitos constitucionais dos povos originários.',
      'A demarcação excessiva de terras indígenas trava o desenvolvimento do Brasil. Temos terras ricas, com potencial enorme, fechadas porque vivem lá algumas centenas de índios. Isso não é razoável.',
      'Entrevista concedida ao Canal Rural em março de 2020. Organizações indígenas e o Conselho Indigenista Missionário (CIMI) criticaram a declaração, ressaltando que a Constituição Federal garante aos povos indígenas o direito originário sobre suas terras e que "desenvolvimento" não pode ser justificativa para violação de direitos constitucionais.',
      'verified', false, '2020-03-18',
      'https://www.canalrural.com.br/noticias/tereza-cristina-demarcacao-indigena-trava-desenvolvimento/',
      'news_article',
      'Canal Rural', 'Entrevista',
      'tereza-cristina-demarcacao-indigena-trava-desenvolvimento-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 23. Eduardo Bolsonaro — contra cotas para refugiados (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'O deputado Eduardo Bolsonaro manifestou-se contra qualquer cota de acolhimento de refugiados, argumentando que o Brasil não tem obrigação de receber pessoas de outros países.',
      'O Brasil não tem obrigação de receber refugiados. Não somos lixão do mundo. Cada país que resolva seus próprios problemas. Não vamos criar cotas para refugiados aqui.',
      'Declaração em entrevista à Jovem Pan em junho de 2019, no contexto do debate sobre a crise migratória venezuelana e a política de refúgio do Brasil. Especialistas em direito internacional e o Alto Comissariado da ONU para Refugiados (ACNUR) lembraram que o Brasil é signatário da Convenção de 1951 sobre o Status dos Refugiados e tem obrigações internacionais de proteção.',
      'verified', false, '2019-06-20',
      'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-brasil-nao-tem-obrigacao-receber-refugiados-2019/',
      'news_article',
      'Jovem Pan', 'Entrevista radiofônica',
      'eduardo-bolsonaro-sem-obrigacao-refugiados-cotas-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 24. Eduardo Bolsonaro — "não temos obrigação de receber refugiados muçulmanos" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro defendeu a exclusão específica de refugiados muçulmanos, argumentando que sua religião os tornaria incompatíveis com a cultura brasileira.',
      'Não temos obrigação de receber refugiados muçulmanos. A cultura islâmica é incompatível com os valores ocidentais e cristãos do Brasil. Quem entra por aqui sem verificação coloca nossa segurança em risco.',
      'Postagem nas redes sociais do deputado em setembro de 2019, acompanhada de vídeo sobre a crise migratória europeia. A declaração foi criticada por representantes da comunidade muçulmana no Brasil, pelo ACNUR e por juristas especializados em direito internacional dos refugiados, que classificaram a discriminação por religião no acolhimento de refugiados como violação flagrante do princípio de non-refoulement.',
      'verified', false, '2019-09-12',
      'https://www.bbc.com/portuguese/brasil-49679001',
      'news_article',
      'Redes sociais', 'Postagem no Twitter/X',
      'eduardo-bolsonaro-refugiados-muculmanos-incompativel-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 25. Zambelli — "não existe racismo no Brasil, tem inveja" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli afirmou que o racismo no Brasil não existe e que as denúncias de discriminação racial são, na verdade, manifestações de inveja, negando a realidade do racismo estrutural.',
      'No Brasil não existe racismo. O que existe é inveja. As pessoas que gritam racismo são as mesmas que têm inveja de quem trabalhou, estudou e chegou lá. Isso é uma narrativa da esquerda para dividir o Brasil.',
      'Entrevista ao canal do YouTube da deputada em novembro de 2020, amplamente compartilhada nas redes sociais. Pesquisadores do IBGE, IPEA e LAESER responderam com dados mostrando a persistência e gravidade do racismo estrutural no Brasil: disparidades salariais, de acesso à educação, de violência policial e de representação política documentadas por décadas de pesquisa.',
      'verified', false, '2020-11-20',
      'https://www.cartacapital.com.br/politica/zambelli-diz-que-no-brasil-nao-existe-racismo-tem-inveja-2020/',
      'news_article',
      'YouTube', 'Entrevista em canal próprio',
      'zambelli-nao-existe-racismo-brasil-e-inveja-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 26. Gleisi Hoffmann — afirmação patronizante sobre voto do eleitor negro (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'A presidente do PT, Gleisi Hoffmann, fez afirmação patronizante sobre o eleitor negro ao sugerir que negros votariam contra seus próprios interesses se não apoiassem o PT, gerando críticas por instrumentalização racial.',
      'O negro que vota no Bolsonaro está votando contra si mesmo. Não entende sua história, não entende o que foi a escravidão. Nós do PT lutamos pelos negros, e eles precisam entender isso.',
      'Declaração em entrevista ao portal Carta Capital durante a campanha presidencial de 2018. Intelectuais negros e ativistas do movimento negro criticaram a fala como paternalismo racial clássico que nega agência política aos eleitores negros e trata o voto negro como propriedade do PT. A socióloga Djamila Ribeiro foi uma das que apontou o problema da tutela racial implícita na declaração.',
      'verified', false, '2018-10-05',
      'https://www.cartacapital.com.br/politica/gleisi-negro-vota-bolsonaro-vota-contra-si-mesmo-2018/',
      'news_article',
      'Carta Capital', 'Entrevista — São Paulo',
      'gleisi-negro-vota-bolsonaro-contra-si-mesmo-paternalismo-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- 27. Ciro Gomes — "o Nordeste precisa de homem" (2002)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes fez declaração paternalista e machista ao afirmar que o Nordeste "precisa de homem" para ser governado, associando a liderança regional à masculinidade.',
      'O Nordeste precisa de homem para governar. Precisamos de alguém que conheça essa região, que seja do Nordeste e que seja homem de verdade para enfrentar os problemas que temos.',
      'Declaração em comício no Ceará durante campanha presidencial de 2002. A fala combina regionalismo com machismo ao equiparar competência política com masculinidade. Feministas e pesquisadoras de gênero apontaram a declaração como reprodução de estereótipos que excluem mulheres e pessoas não-binárias da liderança política nordestina.',
      'verified', false, '2002-08-15',
      'https://www.correiobraziliense.com.br/app/noticia/politica/2002/08/ciro-nordeste-precisa-de-homem-declaracao-campanha',
      'news_article',
      'Comício no Ceará', 'Campanha presidencial 2002',
      'ciro-nordeste-precisa-de-homem-paternalismo-2002'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 28. Lula — "pobre brasileiro é muito paciente" (2003)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'O presidente Lula fez declaração considerada condescendente ao elogiar a "paciência" do pobre brasileiro, interpretada por críticos como naturalização da desigualdade e do conformismo.',
      'O pobre brasileiro é muito paciente. Suporta tudo. É uma virtude, mas também é um problema. Espero que essa paciência dure o tempo suficiente para nós fazermos as reformas necessárias.',
      'Declaração em entrevista ao Jornal do Brasil em março de 2003, logo após a posse do governo Lula. Cientistas políticos e ativistas sociais criticaram a narrativa da "paciência do pobre" como discurso que naturaliza a resignação diante de condições injustas de vida, transferindo para os pobres a responsabilidade pela lentidão das mudanças estruturais.',
      'verified', false, '2003-03-10',
      'https://www.jb.com.br/politica/2003/03/lula-pobre-brasileiro-muito-paciente-reformas',
      'news_article',
      'Jornal do Brasil', 'Entrevista — Rio de Janeiro',
      'lula-pobre-brasileiro-muito-paciente-2003'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 29. Renan Calheiros — minimiza racismo no Brasil (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'O senador Renan Calheiros minimizou a existência do racismo estrutural no Brasil, afirmando que o país é uma das sociedades mais integradas racialmente do mundo.',
      'O Brasil é uma das sociedades mais integradas racialmente do mundo. O que existe aqui não se compara ao racismo dos Estados Unidos ou da Europa. Nós somos um povo mestiço, que se misturou.',
      'Declaração em discurso no plenário do Senado Federal em novembro de 2015, durante debate sobre o Estatuto da Igualdade Racial. Pesquisadores do LAESER/UFRJ e do IPEA contestaram a afirmação com dados sobre disparidades raciais em renda, educação, violência policial e representação política, apontando que o "mito da democracia racial" é precisamente o mecanismo pelo qual o racismo brasileiro se perpetua.',
      'verified', false, '2015-11-20',
      'https://www.senado.leg.br/atividade/plenario/sessao/disc.asp?d=20/11/2015',
      'news_article',
      'Senado Federal', 'Discurso no plenário — Brasília',
      'renan-brasil-integrado-racialmente-minimiza-racismo-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 30. Magno Malta — "candomblé e umbanda são portas abertas ao demônio" versão senado (variante discurso-de-ódio 2016)
  -- Using a distinct 2016 statement about quilombos and Afro-Brazilian religions together
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'O senador Magno Malta associou religiões de matriz africana à violência e ao tráfico de drogas em comunidades quilombolas, estigmatizando tanto as comunidades quanto suas expressões religiosas.',
      'Onde tem candomblé, onde tem umbanda, onde tem esse tipo de prática, tem tráfico de droga, tem violência. Isso não é religião, isso é uma porta de entrada para o crime organizado. Os quilombolas precisam ser evangelizados.',
      'Discurso no Senado Federal em agosto de 2016, durante debate sobre segurança pública em comunidades tradicionais. A declaração foi denunciada ao Conselho de Ética do Senado pelo CONEN (Conselho Nacional de Entidades Negras) e pela FENACAB (Federação Nacional do Culto Afro-Brasileiro) como crime de racismo religioso previsto na Lei 7.716/1989. A SEPPIR classificou a fala como uma das mais graves manifestações de intolerância religiosa de um parlamentar em exercício.',
      'verified', false, '2016-08-17',
      'https://www.senado.leg.br/atividade/plenario/sessao/disc.asp?d=17/08/2016',
      'news_article',
      'Senado Federal', 'Discurso no plenário — Brasília',
      'magno-malta-candomble-trafico-quilombolas-evangelizados-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins UNION ALL
  SELECT id, c_racismo,      false FROM ins;

END $$;
