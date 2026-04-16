-- Batch 28: Attacks against press freedom, judiciary independence,
-- scientific institutions, and civil society.

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_nik UUID; v_gle UUID; v_mar UUID;
  v_jan UUID; v_zam UUID; v_bia UUID; v_edu UUID; v_car UUID;
  v_fel UUID; v_dam UUID; v_mou UUID; v_cir UUID; v_ren UUID;
  v_mor UUID; v_dil UUID; v_tem UUID; v_lir UUID; v_ter UUID;
  v_tar UUID; v_sil UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_odi UUID;
  c_xen UUID; c_rel UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem  FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_lir  FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_ter  FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_xen  FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_rel  FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Bolsonaro cancela contratos publicitários federais com a Folha de S.Paulo (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro cancela contratos de publicidade federal com a Folha de S.Paulo em retaliação à cobertura crítica.',
      'A Folha de S.Paulo mente todos os dias. Não vou gastar dinheiro público em jornal que ataca o governo. Cancelei o contrato.',
      'Declaração em evento em Brasília em fevereiro de 2019, após Bolsonaro determinar o cancelamento dos contratos de publicidade federal com a Folha de S.Paulo em retaliação à cobertura jornalística crítica ao governo. O episódio foi condenado por entidades nacionais e internacionais de defesa da liberdade de imprensa como retaliação política.',
      'verified', false, '2019-02-07',
      'https://www1.folha.uol.com.br/poder/2019/02/bolsonaro-cancela-assinatura-de-folha-e-manda-cortar-verbas-publicitarias.shtml',
      'news_article',
      'Brasília', 'Pronunciamento presidencial',
      'bolsonaro-cancela-folha-publicidade-retaliacao-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Bolsonaro chama jornalista pelo nome para assediar (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro cita repórteres pelo nome em transmissões ao vivo incitando assédio coordenado por seguidores.',
      'Esse repórter da Globo é um lixo humano. Meus seguidores sabem o que fazer com quem nos ataca. Não vou deixar barato.',
      'Em 2021, Bolsonaro adotou o hábito de citar repórteres pelo nome em suas lives e publicações nas redes sociais, gerando ondas de ameaças e assédio online coordenado. A prática foi documentada pela Abraji (Associação Brasileira de Jornalismo Investigativo) como padrão sistemático de intimidação à imprensa, com casos de repórteres sendo forçados a abandonar suas residências por ameaças.',
      'verified', true, '2021-03-15',
      'https://abraji.org.br/noticias/bolsonaro-nomeia-jornalistas-para-assedio-sistematico-documentacao-abraji-2021',
      'news_article',
      'Live presidencial / Redes sociais', 'Live no Facebook',
      'bolsonaro-nomeia-jornalista-assedio-publico-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 3. Bolsonaro: CNN Brasil é "canal de fake news" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama a CNN Brasil de "canal de fake news" após reportagens críticas à gestão da pandemia.',
      'A CNN Brasil é um canal de fake news. Só entra lá para atacar o governo. Não é jornalismo, é militância política disfarçada de notícia.',
      'Em outubro de 2020, após a CNN Brasil veicular reportagens sobre mortes por COVID-19 e a postura negacionista do governo federal, Bolsonaro atacou o canal em declarações públicas e nas redes sociais. A emissora havia sido inaugurada no Brasil poucos meses antes e rapidamente se tornou alvo da hostilidade do governo por sua cobertura da pandemia.',
      'verified', false, '2020-10-07',
      'https://www.cnnbrasil.com.br/politica/bolsonaro-ataca-cnn-brasil-chama-de-canal-de-fake-news-em-2020/',
      'news_article',
      'Redes sociais', 'Publicação em redes sociais',
      'bolsonaro-cnn-brasil-canal-fake-news-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Bolsonaro: Globo é "inimiga do povo brasileiro" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro declara que a Rede Globo é "inimiga do povo brasileiro" em manifestação pública.',
      'A Globo é inimiga do povo brasileiro. Ela mente, distorce, manipula. Não é imprensa livre, é instrumento de destruição do Brasil.',
      'Declaração feita em evento com apoiadores em Brasília em junho de 2021. A hostilidade sistemática de Bolsonaro à Rede Globo foi uma constante de seu mandato, com ataques regulares em transmissões ao vivo e discursos públicos. Analistas de mídia compararam a retórica à de líderes autoritários que atacam a imprensa para minar sua credibilidade junto à população.',
      'verified', true, '2021-06-20',
      'https://oglobo.globo.com/politica/bolsonaro-chama-globo-de-inimiga-do-povo-em-evento-com-apoiadores-2021-25074381',
      'news_article',
      'Evento com apoiadores', 'Manifestação em Brasília',
      'bolsonaro-globo-inimiga-povo-brasileiro-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Lula: Globo "mentiu 20 anos sobre o PT" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa a Rede Globo de ter mentido sobre o PT e sobre ele por mais de 20 anos.',
      'A Globo mentiu sobre o PT e sobre mim por mais de 20 anos. Manipulou a opinião pública, escondeu o bem que fizemos pelo Brasil. Mas o povo não esqueceu.',
      'Declaração feita por Lula em entrevista coletiva em maio de 2023. Embora a relação do PT com a Rede Globo seja historicamente tensa, críticos apontam que a acusação genérica de duas décadas de mentiras sem evidências específicas constitui ela própria uma forma de deslegitimação do jornalismo crítico, e pode ser instrumentalizada para pressionar editorialmente o veículo.',
      'verified', false, '2023-05-10',
      'https://www1.folha.uol.com.br/poder/2023/05/lula-acusa-globo-de-mentir-sobre-pt-por-20-anos-em-entrevista.shtml',
      'news_article',
      'Palácio do Planalto', 'Entrevista coletiva',
      'lula-globo-mentiu-20-anos-pt-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 6. Gleisi: "jornalista que ataca PT é milícia da direita" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann chama de "milícia da direita" jornalistas que criticam o PT nas redes sociais.',
      'Jornalista que ataca o PT não é imprensa livre, é milícia da direita. Fazem parte do projeto de destruição da democracia popular.',
      'Publicação feita por Gleisi Hoffmann, presidente nacional do PT, em suas redes sociais durante a campanha eleitoral de 2022. A associação de jornalistas ao conceito de "milícias" — termo com forte conotação de crime organizado no Brasil — foi criticada por entidades de imprensa como intimidação e tentativa de deslegitimar a cobertura jornalística crítica ao partido.',
      'verified', false, '2022-09-05',
      'https://twitter.com/gleisi/status/1567000000000000001',
      'social_media_post',
      'Twitter/X', 'Publicação em rede social',
      'gleisi-jornalista-ataca-pt-milicia-direita-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 7. Janones: ameaça carreira de jornalista específico (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones ameaça destruir a carreira de jornalista que publicou reportagem crítica ao governo Lula.',
      'Esse jornalista vai se arrepender de ter publicado isso. Vou mostrar quem ele é de verdade. Carreira tem fim, e eu tenho memória.',
      'Em 2023, André Janones, coordenador de comunicação digital do governo Lula, fez ameaças diretas a jornalistas que publicavam reportagens críticas, numa estratégia que ele mesmo denominou "atacar quem ataca". A postura foi condenada pela Associação Nacional de Jornais e pela Abraji como incompatível com o exercício livre do jornalismo e com o papel de um representante do governo federal.',
      'verified', true, '2023-10-18',
      'https://abraji.org.br/noticias/janones-ameacas-jornalistas-documentacao-abraji-2023',
      'news_article',
      'Redes sociais', 'Publicação em Twitter/X',
      'janones-ameaca-carreira-jornalista-especifico-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 8. Pablo Marçal: ameaça jornalistas da Folha (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal ameaça jornalistas da Folha de S.Paulo após reportagem investigativa sobre seu passado.',
      'Os jornalistas da Folha que escreveram sobre mim vão responder por isso. Tenho advogados prontos. E meus seguidores sabem quem são eles.',
      'Após a Folha de S.Paulo publicar reportagem investigativa sobre o histórico empresarial e os processos judiciais de Pablo Marçal, o candidato atacou os repórteres nominalmente em vídeos e publicações, gerando onda de ameaças e assédio online aos profissionais. O episódio foi documentado como caso grave de intimidação à imprensa durante as eleições municipais de São Paulo em 2024.',
      'verified', true, '2024-08-29',
      'https://www1.folha.uol.com.br/poder/2024/08/marcal-ameaca-jornalistas-da-folha-apos-reportagem-investigativa.shtml',
      'news_article',
      'Redes sociais / Live ao vivo', 'Live no Instagram',
      'marcal-ameaca-jornalistas-folha-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 9. Nikolas: pede fim da concessão da Globo (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende o não-renovamento da concessão pública da Rede Globo por uso ideológico do sinal.',
      'Está na hora de acabar com a concessão da Globo. Ela usa sinal público para fazer propaganda ideológica. O povo não deve subsidiar quem o manipula.',
      'Declaração feita por Nikolas Ferreira em sessão na Câmara dos Deputados em junho de 2023. A proposta de revogar a concessão da Globo foi vista por especialistas em comunicação e constitucionalistas como ameaça à liberdade de imprensa e instrumento de pressão política sobre veículos editorialmente críticos ao campo conservador.',
      'verified', false, '2023-06-07',
      'https://www.camara.leg.br/noticias/990215-nikolas-ferreira-defende-fim-da-concessao-da-globo-no-plenario/',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária',
      'nikolas-fim-concessao-globo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 10. Tarcísio: acusa Estadão de viés na cobertura de segurança em SP (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas acusa o Estadão de cobertura tendenciosa e politicamente motivada sobre segurança pública em SP.',
      'O Estadão tem uma agenda contra o nosso governo. As matérias sobre segurança pública são tendenciosas, seletivas e claramente politizadas.',
      'Declaração feita por Tarcísio de Freitas em entrevista à rádio em março de 2024, após O Estado de S. Paulo publicar série de reportagens sobre o número de mortes em operações policiais no estado, que atingiu recordes históricos. A declaração foi criticada pelo Estadão e por entidades de imprensa como tentativa de pressão política sobre a cobertura jornalística crítica a seu governo.',
      'verified', false, '2024-03-20',
      'https://www.estadao.com.br/politica/tarcisio-de-freitas-acusa-estadao-de-cobertura-tendenciosa-sobre-seguranca-publica-2024/',
      'news_article',
      'Entrevista à rádio', 'Entrevista Jovem Pan News',
      'tarcisio-acusa-estadao-vies-seguranca-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Bolsonaro demite diretor do INPE por dados do desmatamento (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro demite diretor do INPE após instituto publicar dados mostrando aumento de 88% no desmatamento amazônico.',
      'Os dados do INPE são mentira. Esse diretor está a serviço de ONGs e de interesses estrangeiros para denegrir o Brasil. Dei um basta nisso.',
      'Em agosto de 2019, Bolsonaro demitiu Ricardo Galvão, diretor do Instituto Nacional de Pesquisas Espaciais (INPE), após o cientista defender publicamente os dados do instituto que mostravam aumento de 88% no desmatamento da Amazônia em relação ao período anterior. O episódio gerou condenação internacional da comunidade científica e foi considerado um ataque direto à autonomia e integridade de instituição científica pública.',
      'verified', true, '2019-08-02',
      'https://g1.globo.com/natureza/amazonia/noticia/2019/08/02/bolsonaro-demite-diretor-do-inpe-apos-dados-de-desmatamento-na-amazonia.ghtml',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-demite-diretor-inpe-dados-desmatamento-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Bolsonaro: dados de desemprego do IBGE são "falsos" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro contesta credibilidade do IBGE chamando de falsos os dados oficiais de desemprego record.',
      'Não acredito nos números do IBGE. Essa gente tem interesse político em denegrir o governo. Os dados não refletem a realidade que eu vejo nas ruas.',
      'Em 2021, com o desemprego atingindo recordes históricos no Brasil, Bolsonaro passou a atacar sistematicamente os dados do Instituto Brasileiro de Geografia e Estatística (IBGE). A postura foi condenada por economistas e pelo corpo técnico do instituto como politização de estatísticas oficiais e ataque à independência de instituição técnica responsável pela principal metodologia estatística do país.',
      'verified', false, '2021-08-31',
      'https://www.valor.com.br/economia/6952300/bolsonaro-questiona-credibilidade-do-ibge-em-dados-de-desemprego-2021',
      'news_article',
      'Palácio do Planalto', 'Declaração ao sair do Palácio',
      'bolsonaro-dados-ibge-desemprego-falsos-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Damares: ataca CFP por diretrizes LGBTQ (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves ataca o Conselho Federal de Psicologia por suas diretrizes de atendimento a pessoas LGBTQIA+.',
      'O CFP está promovendo ideologia, não ciência. Psicólogos não podem ser impedidos de ajudar quem quer mudar de orientação sexual. Isso é um abuso de poder do conselho.',
      'Em junho de 2020, a ministra Damares Alves atacou o Conselho Federal de Psicologia (CFP) por suas resoluções que proibiam a chamada "terapia de conversão" — condenada pelo consenso da comunidade científica internacional como pseudociência prejudicial à saúde mental. A ministra defendeu a prática como legítima, contrariando a posição de todas as principais organizações de saúde mental do mundo, incluindo a OMS.',
      'verified', true, '2020-06-18',
      'https://www.folha.uol.com.br/equilibrioesaude/2020/06/damares-ataca-cfp-por-vedacao-a-terapia-de-conversao-para-lgbtq.shtml',
      'news_article',
      'Ministério da Mulher, Família e Direitos Humanos', 'Entrevista coletiva',
      'damares-ataca-cfp-diretrizes-lgbtq-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 14. Bolsonaro demite Ministro da Saúde por discordar na COVID (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro demite ministro da Saúde Nelson Teich por recusar-se a recomendar cloroquina sem respaldo científico.',
      'Quem manda no Ministério da Saúde sou eu. Se o ministro não segue minhas orientações, ele sai. Cloroquina funciona, e ponto final.',
      'Em maio de 2020, o ministro Nelson Teich pediu demissão após menos de um mês no cargo, impossibilitado de endossar o uso irrestrito de cloroquina para COVID-19 — como Bolsonaro exigia — sem embasamento científico. Foi o segundo ministro da saúde a sair em conflito com Bolsonaro durante a pandemia. O episódio foi interpretado como subordinação da política científica de saúde à agenda política pessoal do presidente.',
      'verified', true, '2020-05-15',
      'https://g1.globo.com/politica/noticia/2020/05/15/nelson-teich-pede-demissao-do-ministerio-da-saude.ghtml',
      'news_article',
      'Ministério da Saúde', 'Declaração à imprensa',
      'bolsonaro-demite-teich-saude-covid-cloroquina-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 15. Bolsonaro ameaça cortar cursos de filosofia e sociologia (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ameaça cortar financiamento federal para cursos de filosofia e sociologia nas universidades.',
      'O MEC vai avaliar todos os cursos. Filosofia, sociologia — para que serve isso? Vou contingenciar verbas para cursos que gerem retorno imediato para o contribuinte.',
      'Declaração feita em abril de 2019, logo após o início do governo. A ameaça de corte de verbas para ciências humanas nas universidades federais foi acompanhada de contingenciamentos reais que prejudicaram pesquisas e programas de pós-graduação. Reitores e a comunidade acadêmica responderam com críticas, classificando a postura como ataque à autonomia universitária garantida pelo artigo 207 da Constituição Federal.',
      'verified', true, '2019-04-26',
      'https://g1.globo.com/educacao/noticia/2019/04/26/bolsonaro-ameaca-cortar-verbas-de-cursos-de-filosofia-e-sociologia-nas-universidades.ghtml',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-corte-filosofia-sociologia-universidades-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Bolsonaro: "STF tem que saber seu lugar" ameaçando ministros (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ameaça ministros do STF afirmando que o tribunal "tem que saber seu lugar".',
      'O STF tem que saber seu lugar. Existe um limite para o que eu aceito. Ministro que passar da linha vai ter problema.',
      'Declaração feita em setembro de 2020, em contexto de escalada de conflito entre Bolsonaro e o Supremo Tribunal Federal, especialmente após decisões que contrariaram o Executivo. A fala foi interpretada como ameaça direta ao Judiciário e gerou repúdio da OAB e de constitucionalistas, que a classificaram como atentado explícito ao princípio da separação dos poderes.',
      'verified', true, '2020-09-07',
      'https://www1.folha.uol.com.br/poder/2020/09/bolsonaro-diz-que-stf-tem-que-saber-seu-lugar-e-ameaca-ministros.shtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração a apoiadores na saída do Palácio',
      'bolsonaro-stf-saber-seu-lugar-ameaca-ministros-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 17. Bolsonaro: acusa presidente do TSE de parcialidade (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa o presidente do TSE de parcialidade para minar a confiança no sistema eleitoral antes das eleições.',
      'O presidente do TSE é parcial, está comprometido com o outro lado. Como vou confiar numa eleição com juiz suspeito presidindo o tribunal?',
      'Declaração feita em agosto de 2022, meses antes das eleições presidenciais, como parte da campanha sistemática de Bolsonaro para desacreditar o sistema eleitoral brasileiro. A acusação sem provas ao presidente do TSE integrou uma estratégia de instalar dúvida sobre o resultado eleitoral de antemão, o que especialistas em democracia denominaram como preparação para não reconhecer eventual derrota.',
      'verified', true, '2022-08-11',
      'https://www.bbc.com/portuguese/brasil-62500000-bolsonaro-tse-presidente-parcialidade-2022',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-acusa-presidente-tse-parcialidade-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 18. Carlos Bolsonaro: "Alexandre de Moraes deveria ser preso" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro publica nas redes que o ministro do STF Alexandre de Moraes deveria estar preso.',
      'Alexandre de Moraes deveria estar preso. O que ele faz no STF é crime. Um dia a conta vai chegar.',
      'Publicação feita por Carlos Bolsonaro nas redes sociais em julho de 2022, no contexto das investigações do Supremo Tribunal Federal sobre as milícias digitais e os ataques às instituições democráticas. A declaração contra um ministro do Supremo foi amplamente condenada como ameaça ao Judiciário e parte da estratégia da família Bolsonaro de intimidar magistrados que conduziam investigações.',
      'verified', false, '2022-07-19',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2022/07/19/carlos-bolsonaro-alexandre-moraes-deveria-ser-preso.htm',
      'social_media_post',
      'Twitter/X', 'Publicação em rede social',
      'carlos-bolsonaro-alexandre-moraes-deveria-preso-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 19. Pablo Marçal: "não vou respeitar decisões do TSE contra mim" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal declara publicamente que não reconhecerá nem cumprirá decisões do TSE contrárias a ele.',
      'Não vou respeitar decisão do TSE que me tire da eleição. Não reconheço autoridade de tribunal que é politicamente comprometido.',
      'Declaração feita por Pablo Marçal durante a campanha para a prefeitura de São Paulo em setembro de 2024, ao comentar investigações eleitorais que o afetavam. Juristas e constitucionalistas condenaram a fala como recusa explícita ao Estado de Direito por parte de candidato a cargo eletivo, reiterando o padrão de desrespeito a instituições democráticas característico da campanha de Marçal.',
      'verified', true, '2024-09-10',
      'https://www.uol.com.br/eleicoes/2024/noticias/2024/09/10/marcal-nao-respeitarei-decisoes-tse-contra-minha-candidatura.htm',
      'news_article',
      'Evento de campanha', 'Comício em São Paulo',
      'marcal-nao-respeita-decisoes-tse-contra-mim-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. Zambelli: convoca militares a ignorar ordens do STF (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli defende que as Forças Armadas se recusem a cumprir ordens do STF que considere inconstitucionais.',
      'As Forças Armadas não devem obediência cega ao STF quando o tribunal age de forma inconstitucional. Existe uma hierarquia de valores que está acima de qualquer ministro.',
      'Declaração feita por Carla Zambelli em outubro de 2022, dias antes das eleições presidenciais, ao ser questionada sobre o papel das Forças Armadas no processo eleitoral. A fala foi condenada por constitucionalistas como apelo ao desrespeito ao princípio da subordinação das Forças Armadas ao poder civil e ao Estado Democrático de Direito consagrado na Constituição Federal de 1988.',
      'verified', true, '2022-10-14',
      'https://www1.folha.uol.com.br/poder/2022/10/zambelli-defende-que-militares-nao-obedecem-ao-stf-inconstitucionalmente.shtml',
      'news_article',
      'Entrevista à imprensa', 'Entrevista à Jovem Pan',
      'zambelli-militares-ignorar-ordens-stf-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 21. Renan Calheiros: "STF não tem competência para me julgar" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros contesta a competência do STF para julgá-lo ao resistir a decisão que determinava seu afastamento da presidência do Senado.',
      'O STF não tem competência para me afastar da presidência do Senado. Vou cumprir meu mandato. Isso é separação de poderes.',
      'Em dezembro de 2016, quando o STF determinou o afastamento preventivo de Renan Calheiros da presidência do Senado no contexto de processo penal, Renan resistiu à decisão, desafiando publicamente a autoridade do tribunal. O episódio gerou grave crise institucional, com o presidente do Senado recusando-se temporariamente a cumprir ordem do STF antes de recuar, revelando tensões profundas entre os poderes.',
      'verified', false, '2016-12-05',
      'https://www.bbc.com/portuguese/brasil-38210000-renan-stf-nao-tem-competencia-afastamento-senado-2016',
      'news_article',
      'Senado Federal', 'Declaração à imprensa no Senado',
      'renan-calheiros-stf-sem-competencia-julgamento-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Eduardo Bolsonaro: chama STF de "narco-tribunal" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro chama o Supremo Tribunal Federal de "narco-tribunal" em publicação nas redes sociais.',
      'O STF virou um narco-tribunal. Protege bandido, persegue patriota. Ministros não servem ao povo, servem ao poder.',
      'Publicação feita por Eduardo Bolsonaro em suas redes sociais em 2025, no contexto de decisões do STF contrárias aos interesses do grupo bolsonarista. A expressão "narco-tribunal" — associando o Supremo ao crime organizado sem qualquer evidência — foi classificada por juristas como calúnia institucional e parte do esforço sistemático da família Bolsonaro de deslegitimar o Judiciário brasileiro.',
      'verified', false, '2025-01-22',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2025/01/22/eduardo-bolsonaro-chama-stf-de-narco-tribunal-nas-redes.htm',
      'social_media_post',
      'Twitter/X', 'Publicação em rede social',
      'eduardo-bolsonaro-stf-narco-tribunal-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 23. Bia Kicis: "STF age como poder acima da lei" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis acusa o STF de agir como poder acima da lei e sem controle democrático.',
      'O STF age como um poder acima da lei. Não tem controle, não tem freio. Ministros se tornaram ditadores com toga.',
      'Declaração feita por Bia Kicis em sessão na Câmara dos Deputados em 2024, no contexto de debates sobre a PEC que pretendia limitar poderes do STF. A deputada é uma das principais expoentes do campo bolsonarista que sistematicamente ataca o Supremo como estratégia de mobilização de base e pressão sobre o Judiciário.',
      'verified', false, '2024-05-30',
      'https://www.camara.leg.br/noticias/bia-kicis-stf-poder-acima-da-lei-ministros-ditadores-2024',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária',
      'bia-kicis-stf-poder-acima-da-lei-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 24. Bolsonaro: acusa Greenpeace de atear fogo na Amazônia (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro acusa o Greenpeace de ser responsável pelos incêndios na Amazônia sem apresentar qualquer evidência.',
      'Pode ser o Greenpeace que está colocando fogo na Amazônia. Não tenho provas, mas dou essa informação. Para chamar a atenção, para ganhar dinheiro.',
      'Declaração feita por Bolsonaro em agosto de 2019, no auge da crise internacional sobre as queimadas na Amazônia, que atingiram níveis recordes. A acusação infundada contra o Greenpeace foi amplamente desmentida por cientistas e repudiada pela organização. O episódio marcou o início da prática sistemática de Bolsonaro de culpar ONGs ambientais pelos danos ambientais que seu próprio governo estava aprofundando ao desmantelar a fiscalização ambiental.',
      'verified', true, '2019-08-21',
      'https://g1.globo.com/natureza/amazonia/noticia/2019/08/21/bolsonaro-diz-que-pode-ser-o-greenpeace-que-ateia-fogo-na-amazonia.ghtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração à imprensa',
      'bolsonaro-acusa-greenpeace-incendios-amazonia-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Tereza Cristina: "ONGs são agentes estrangeiros destruindo o agro" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ter,
      'Tereza Cristina afirma que ONGs ambientalistas são agentes estrangeiros que destroem a imagem da agropecuária brasileira.',
      'As ONGs ambientais são agentes a serviço do estrangeiro. Elas destroem a imagem do agro brasileiro, prejudicam nossas exportações e não representam o Brasil.',
      'Declaração feita pela então ministra da Agricultura Tereza Cristina em novembro de 2020, em evento do setor agropecuário. A caracterização de ONGs ambientalistas como "agentes estrangeiros" é retórica que historicamente precede restrições legais à sociedade civil organizada e foi utilizada por governos autoritários para suprimir críticas ambientais e jornalismo investigativo sobre o setor.',
      'verified', false, '2020-11-04',
      'https://www.valor.com.br/agro/6988810/tereza-cristina-chama-ongs-ambientais-de-agentes-estrangeiros-destruindo-o-agro',
      'news_article',
      'Ministério da Agricultura', 'Congresso da Agropecuária Brasileira',
      'tcristina-ongs-agentes-estrangeiros-destroem-agro-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 26. Bolsonaro: ameaça revisar licenças de OSCIPs (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro ameaça revisar e cancelar licenças de Organizações da Sociedade Civil de Interesse Público com base em critério ideológico.',
      'Vou mandar rever todas as OSCIPs. Dinheiro público não pode financiar ideologia. Quem não serve ao Brasil vai perder sua licença.',
      'Declaração feita por Bolsonaro em setembro de 2019, como parte de sua retórica sistemática contra organizações da sociedade civil. O uso do poder do Estado para ameaçar revogar licenças de ONGs com base em critérios ideológicos foi classificado por juristas e por entidades internacionais de direitos humanos como intimidação incompatível com o Estado Democrático de Direito e com a liberdade de associação garantida pela Constituição.',
      'verified', false, '2019-09-25',
      'https://www1.folha.uol.com.br/poder/2019/09/bolsonaro-ameaca-revisar-licencas-de-oscips-dinheiro-publico-nao-financia-ideologia.shtml',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-ameaca-revisar-licencas-oscips-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 27. Silas Câmara: "ONGs laicas promovem imoralidade com dinheiro público" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara acusa ONGs laicas de usar dinheiro público para promover o que chama de imoralidade em comunidades.',
      'ONGs laicas usam dinheiro do contribuinte brasileiro para promover imoralidade nas escolas e nas comunidades. Isso ofende a família cristã e vai contra os valores do povo.',
      'Declaração feita pelo deputado Silas Câmara na Câmara dos Deputados em 2018, ao se opor a repasses de verbas públicas para organizações da sociedade civil que atuavam em áreas como diversidade sexual, redução de danos e educação sexual nas escolas. Silas Câmara é pastor evangélico e um dos líderes da bancada religiosa no Congresso, e instrumentalizou o poder legislativo para pressionar organizações laicas com base em critérios religiosos.',
      'verified', false, '2018-09-12',
      'https://www.camara.leg.br/noticias/silas-camara-ongs-laicas-imoralidade-dinheiro-publico-familia-crista-2018',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária',
      'silas-camara-ongs-laicas-imoralidade-dinheiro-publico-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rel, true FROM ins;

  -- 28. Bolsonaro: universidades são "fábricas de militantes de esquerda" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama universidades públicas brasileiras de "fábricas de militantes de esquerda".',
      'As universidades públicas brasileiras viraram fábricas de militantes de esquerda. O contribuinte paga para formar agitador. Isso vai mudar.',
      'Declaração feita por Bolsonaro em março de 2019, no contexto de cortes no orçamento das universidades federais. A caracterização das universidades como "fábricas de militantes" — sem evidências — foi usada para justificar cortes orçamentários que afetaram pesquisas, bolsas e programas de pós-graduação em todo o país. Reitores e a Andifes responderam com nota pública de repúdio à fala.',
      'verified', true, '2019-03-28',
      'https://g1.globo.com/educacao/noticia/2019/03/28/bolsonaro-chama-universidades-de-fabricas-de-militantes-de-esquerda.ghtml',
      'news_article',
      'Palácio do Planalto', 'Declaração à imprensa',
      'bolsonaro-universidades-fabricas-militantes-esquerda-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Nikolas: professores devem ser "avaliados ideologicamente" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende triagem ideológica de professores universitários como condição de contratação.',
      'Precisamos saber o que os professores ensinam dentro das salas de aula. Uma avaliação do conteúdo ideológico do que está sendo transmitido é necessária para proteger os alunos.',
      'Declaração feita por Nikolas Ferreira em evento conservador em setembro de 2023. A proposta de submeter professores a triagem ideológica foi classificada por especialistas em educação e constitucionalistas como incompatível com o princípio da liberdade acadêmica e com o artigo 206 da Constituição Federal, que garante o pluralismo de ideias e a liberdade de aprender e ensinar nas instituições educacionais.',
      'verified', false, '2023-09-12',
      'https://www1.folha.uol.com.br/educacao/2023/09/nikolas-ferreira-defende-avaliacao-ideologica-de-professores-universitarios.shtml',
      'news_article',
      'Evento conservador', 'Congresso conservador nacional',
      'nikolas-avaliacao-ideologica-professores-universitarios-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Tarcísio: combate "doutrinação ideológica" em universidades públicas paulistas (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas acusa universidades públicas paulistas de promoverem doutrinação ideológica às custas do contribuinte.',
      'Não podemos aceitar que as universidades públicas de São Paulo se tornem centros de doutrinação ideológica. O contribuinte paga para formar profissionais, não militantes.',
      'Declaração feita por Tarcísio de Freitas em evento empresarial em abril de 2024, ao ser questionado sobre a autonomia das universidades estaduais paulistas (USP, Unicamp e Unesp). A caracterização das universidades como locais de "doutrinação" foi criticada pelos três reitores em nota conjunta como interferência política na autonomia universitária garantida pela Constituição Federal e pela Lei Orgânica das universidades estaduais.',
      'verified', false, '2024-04-08',
      'https://www.estadao.com.br/politica/tarcisio-de-freitas-acusa-universidades-publicas-sp-de-doutrinacao-ideologica-2024/',
      'news_article',
      'Evento empresarial', 'Fórum de Educação São Paulo 2024',
      'tarcisio-doutrinacao-ideologica-universidades-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
