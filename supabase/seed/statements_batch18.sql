DO $$
DECLARE
  v_lula          UUID;
  v_dilma         UUID;
  v_temer         UUID;
  v_sarney        UUID;
  v_renan         UUID;
  v_lira          UUID;
  v_maluf         UUID;
  v_valdemar      UUID;
  v_jefferson     UUID;
  v_guedes        UUID;
  v_flavio        UUID;
  v_carlos        UUID;
  v_bolsonaro     UUID;
  v_haddad        UUID;
  v_ciro          UUID;

  c_corrupcao     UUID;
  c_abuso         UUID;
  c_nepotismo     UUID;
  c_desinform     UUID;
BEGIN
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_dilma      FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_temer      FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_sarney     FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_lira       FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_maluf      FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_valdemar   FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_jefferson  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_flavio     FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_carlos     FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_haddad     FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';

  SELECT id INTO c_corrupcao  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abuso      FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_nepotismo  FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_desinform  FROM categories WHERE slug = 'desinformacao';

  -- 1. Lula — "não sabia do mensalão" (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirmou desconhecer o esquema do mensalão, apesar de José Dirceu, seu chefe da Casa Civil, ser apontado como operador central.',
      'Não sabia de nada. Se alguém do meu governo praticou irregularidades, esse alguém vai ser punido. Eu nunca autorizei nenhum esquema de compra de votos.',
      'Declaração dada em entrevista coletiva após Roberto Jefferson denunciar o esquema do mensalão ao jornal Folha de S.Paulo em junho de 2005. A CPI do Mensalão apuraria posteriormente que o esquema movimentou dezenas de milhões de reais para parlamentares.',
      'verified', false, '2005-06-15',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1606200501.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva — Palácio do Planalto',
      'lula-nao-sabia-mensalao-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 2. Lula — defende José Dirceu (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defendeu seu chefe da Casa Civil José Dirceu mesmo após as denúncias do mensalão, classificando acusações como perseguição política.',
      'O Zé Dirceu é um homem honesto. O que está acontecendo é uma tentativa de destruir o meu governo. Não vou abandonar um companheiro por pressão da imprensa.',
      'Pronunciamento feito durante evento do PT em julho de 2005, semanas antes de Dirceu pedir demissão da Casa Civil. Dirceu foi posteriormente condenado pelo STF no julgamento do mensalão em 2012.',
      'verified', false, '2005-07-04',
      'https://www1.folha.uol.com.br/fsp/brasil/fc0507200501.htm',
      'news_article',
      'São Paulo', 'Evento do PT',
      'lula-defende-jose-dirceu-mensalao-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 3. Lula — "nunca roubei nem deixei roubar" (2006)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Em campanha pela reeleição, Lula proclamou nunca ter roubado nem deixado roubar, ignorando o escândalo do mensalão que marcou seu primeiro mandato.',
      'Eu nunca roubei, nunca deixei roubar, nunca desviei um centavo do erário público. Este governo é limpo e vai continuar limpo.',
      'Discurso de campanha proferido durante comício em outubro de 2006, véspera do segundo turno. O mensalão havia eclodido em 2005 e José Dirceu, braço-direito de Lula, renunciara à Casa Civil. Lula foi reeleito com 60,8% dos votos.',
      'verified', true, '2006-10-24',
      'https://veja.abril.com.br/politica/lula-nunca-roubei-nunca-deixei-roubar-2006/',
      'news_article',
      'São Paulo', 'Comício de campanha — segundo turno 2006',
      'lula-nunca-roubei-nem-deixei-roubar-mensalao-2006'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 4. Lula — triplex do Guarujá "é do metalúrgico" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula insistiu que o triplex no Guarujá, atribuído a ele pela Lava Jato, pertencia ao operário metalúrgico, negando qualquer vínculo com a OAS.',
      'Este apartamento é do metalúrgico, não é do presidente da República. Eu trabalhei a vida toda para ter o direito de ter uma coisa minha.',
      'Declaração em entrevista à Globo News em março de 2017, durante o processo que resultaria em sua condenação em primeira instância pelo juiz Sérgio Moro. O STJ e o TRF-4 mantiveram a condenação. Em 2021, o STF anulou as condenações por suspeição de Moro.',
      'verified', true, '2017-03-21',
      'https://g1.globo.com/politica/noticia/2017/03/lula-triplex-do-guaruja-e-do-metalurgico.html',
      'news_article',
      'São Paulo', 'Entrevista Globo News',
      'lula-triplex-guaruja-metalurgico-lava-jato-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 5. Lula — Instituto Lula como veículo de influência (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula minimizou investigações sobre o Instituto Lula ser usado como veículo para receber vantagens indevidas de empreiteiras durante seu governo.',
      'O Instituto Lula é uma entidade séria, que faz trabalho educacional. Qualquer empresa que contribuiu para o instituto fez isso de forma legal e transparente.',
      'Entrevista concedida após soltura em novembro de 2019, quando o STF derrubou a prisão em segunda instância. O Ministério Público Federal investigava o instituto como possível destinatário de propinas de construtoras em troca de contratos com a Petrobras.',
      'verified', false, '2019-11-11',
      'https://www.bbc.com/portuguese/brasil-50384096',
      'news_article',
      'São Paulo', 'Coletiva após soltura — sindicato dos metalúrgicos',
      'lula-instituto-lula-influencia-empresa-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 6. Dilma — "pedaladas são práticas normais de contabilidade" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma Rousseff defendeu as "pedaladas fiscais" como prática contábil corriqueira, minimizando o que o TCU classificou como crime de responsabilidade fiscal.',
      'As chamadas pedaladas são práticas normais de contabilidade governamental. Todos os governos fazem isso. O TCU nunca reprovou nenhuma conta por esse motivo antes.',
      'Pronunciamento em cadeia de rádio e TV em setembro de 2015, após o TCU recomendar a rejeição de suas contas presidenciais. As pedaladas — atrasos propositais nos repasses a bancos públicos — fundamentaram o processo de impeachment que a afastaria em 2016.',
      'verified', true, '2015-09-02',
      'https://www1.folha.uol.com.br/poder/2015/09/1676209-dilma-diz-que-pedaladas-sao-praticas-normais-de-contabilidade.shtml',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional de rádio e TV',
      'dilma-pedaladas-praticas-normais-contabilidade-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 7. Dilma — "não haverá ajuste fiscal" (2014)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma prometeu durante a campanha que não faria ajuste fiscal; poucos meses depois da reeleição, implementou o maior aperto fiscal em décadas.',
      'Não vai ter ajuste. Quem vai fazer ajuste é o Aécio. O PT não vai cortar direitos, não vai aumentar tarifas, não vai promover desemprego.',
      'Declaração em debate presidencial em outubro de 2014. Após ser reeleita com 51,6% dos votos, Dilma nomeou Joaquim Levy como ministro da Fazenda e promoveu cortes de R$ 70 bilhões, o maior ajuste fiscal da história recente do Brasil.',
      'verified', true, '2014-10-12',
      'https://www.estadao.com.br/politica/eleicoes/2014/dilma-nao-tera-ajuste-fiscal-debate-2014/',
      'news_article',
      'São Paulo', 'Debate presidencial — segundo turno 2014',
      'dilma-nao-havera-ajuste-fiscal-promessa-quebrada-2014'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 8. Dilma — defende nomeação de Lula como ministro para evitar prisão (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dilma,
      'Dilma nomeou Lula ministro-chefe da Casa Civil em 2016, ato interpretado como tentativa de blindá-lo do juiz Moro mediante foro privilegiado no STF.',
      'A nomeação do ex-presidente Lula é absolutamente legal e legítima. Ele é o homem certo para coordenar o diálogo político que o país precisa neste momento.',
      'Declaração em pronunciamento após assinar a nomeação de Lula para a Casa Civil em março de 2016. O juiz Sérgio Moro divulgou grampos telefônicos da conversa entre Dilma e Lula, gerando crise. O STF suspendeu a posse temporariamente. Críticos viram o ato como uso de cargo para obstruir a justiça.',
      'verified', true, '2016-03-16',
      'https://g1.globo.com/politica/noticia/2016/03/dilma-nomeia-lula-como-ministro-da-casa-civil.html',
      'news_article',
      'Brasília', 'Pronunciamento presidencial — Palácio do Planalto',
      'dilma-nomeia-lula-ministro-foro-privilegiado-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 9. Temer — PMDB lista de demandas (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Documento vazado indicava que Temer e o PMDB elaboraram lista de cargos e contratos em troca de apoio ao impeachment de Dilma, revelando barganha política.',
      'O documento não existe. É uma montagem, uma farsa produzida por quem quer desestabilizar o processo de impeachment. Não há nenhuma lista de demandas.',
      'Declaração após o jornal O Globo publicar, em outubro de 2016, um documento atribuído ao PMDB com lista de ministérios, estatais e cargos que o partido exigia em troca de apoio ao impeachment. Investigações posteriores confirmaram a existência de negociações de cargos.',
      'verified', false, '2016-10-05',
      'https://oglobo.globo.com/brasil/temer-nega-lista-de-demandas-pmdb-2016/',
      'news_article',
      'Brasília', 'Entrevista coletiva — vice-presidência',
      'temer-nega-lista-demandas-pmdb-impeachment-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 10. Temer — Rocha Loures com mala de R$500 mil (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Assessor de Temer, Rodrigo Rocha Loures foi flagrado em vídeo carregando mala com R$ 500 mil da JBS, dinheiro vinculado ao presidente.',
      'Esse dinheiro não tem nada a ver comigo. O Rocha Loures agiu por conta própria. Eu não autorizei nada, não recebi nada, não sabia de nada.',
      'Declaração de Temer após a divulgação, em maio de 2017, do vídeo em que Rocha Loures carregava mala com R$ 500 mil em notas, entregue por executivo da JBS. A delação da JBS revelava que Temer havia autorizado pagamento de propina a Eduardo Cunha para que mantivesse silêncio.',
      'verified', true, '2017-05-22',
      'https://veja.abril.com.br/politica/temer-nega-envolvimento-mala-jbs-rocha-loures-2017/',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional',
      'temer-nega-mala-rocha-loures-jbs-500-mil-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 11. Sarney — defende atos secretos do Senado (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'Sarney defendeu os atos secretos que beneficiavam parentes e aliados com cargos no Senado, minimizando o escândalo de nepotismo que abalou a presidência da Casa.',
      'Os atos administrativos do Senado foram legais, seguiram todas as normas. Nenhum servidor foi nomeado ilegalmente. Isso é uma campanha para me destruir politicamente.',
      'Declaração após o jornal Folha de S.Paulo revelar, em julho de 2009, que atos secretos do Senado criaram cargos comissionados beneficiando parentes de Sarney e aliados. A Polícia Legislativa identificou ao menos 663 atos secretos. Sarney permaneceu na presidência do Senado após articulação com líderes governistas.',
      'verified', true, '2009-07-15',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1607200901.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva — Senado Federal',
      'sarney-defende-atos-secretos-senado-nepotismo-cargos-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nepotismo, true FROM ins;

  -- 12. Sarney — "sou limpo" apesar de décadas de escândalos (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'Em meio ao escândalo dos atos secretos do Senado, Sarney proclamou ser um político limpo após 50 anos na vida pública.',
      'Tenho 50 anos de vida pública e sou limpo. Nunca roubei, nunca me apropriei do que não era meu. Esses ataques são covardia de quem não tem argumento.',
      'Declaração dada em entrevista em agosto de 2009, durante a crise dos atos secretos do Senado. Sarney presidia o país quando eclodiu o escândalo do "sarneyzinho" nos anos 1990 e também foi investigado pelo TCU por irregularidades em contratos no Maranhão.',
      'verified', false, '2009-08-10',
      'https://veja.abril.com.br/politica/sarney-sou-limpo-50-anos-vida-publica-2009/',
      'news_article',
      'Brasília', 'Entrevista — Senado Federal',
      'sarney-sou-limpo-cinquenta-anos-escandalo-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 13. Renan — "não desviei nenhum centavo" (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros declarou não ter desviado nenhum centavo durante investigação sobre pagamento de pensão alimentícia de sua filha com recursos de lobista.',
      'Não desviei nenhum centavo dos cofres públicos. Minha vida privada é minha vida privada. O que está acontecendo é uma caçada política sem precedentes.',
      'Declaração em discurso no plenário do Senado em setembro de 2007, durante crise que levaria à sua renúncia provisória da presidência da Casa. Inquérito apurava que lobista da Recel pagava pensão de filha de Renan em troca de favorecimento em contratos.',
      'verified', false, '2007-09-12',
      'https://www1.folha.uol.com.br/fsp/brasil/fc1209200701.htm',
      'news_article',
      'Brasília', 'Discurso no plenário do Senado',
      'renan-nao-desviei-centavo-lobista-pensao-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 14. Renan — defende-se do Mensalão (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan negou envolvimento com o mensalão e atacou Roberto Jefferson, que o citara entre os beneficiários do esquema de compra de votos.',
      'O Jefferson é um mentiroso. Nunca recebi nenhum centavo do PT, nunca participei de nenhum esquema. É uma calúnia e vou processar quem me acusar sem provas.',
      'Declaração após Roberto Jefferson denunciar, em junho de 2005, que o PMDB também recebera recursos do mensalão. Renan presidia o Senado e foi alvo de várias investigações subsequentes, incluindo o escândalo do lobista da Recel em 2007.',
      'verified', false, '2005-06-20',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2006200501.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva — Senado Federal',
      'renan-nega-mensalao-ataca-jefferson-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 15. Lira — defende-se de investigação por suborno (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lira,
      'Recém-eleito presidente da Câmara, Arthur Lira declarou que investigações contra ele por corrupção eram perseguição política sem fundamento.',
      'Estou aqui, eleito pelo povo, reconhecido pelos meus pares. Quem tem ficha limpa não precisa de defensores. As acusações contra mim são antigas, frágeis e politicamente motivadas.',
      'Declaração após sua eleição à presidência da Câmara em fevereiro de 2021. O STF mantinha inquérito sobre suposto recebimento de propina de R$ 106 mil de construtoras alagoanas. Lira conduziu a Câmara durante todo o governo Bolsonaro, travando pedidos de impeachment.',
      'verified', false, '2021-02-02',
      'https://www.bbc.com/portuguese/brasil-55885420',
      'news_article',
      'Brasília', 'Discurso de posse — presidência da Câmara',
      'lira-defesa-investigacao-suborno-corrupcao-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 16. Lira — bloqueia pedidos de impeachment de Bolsonaro (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lira,
      'Lira arquivou dezenas de pedidos de impeachment contra Bolsonaro, exercendo poder discricionário que críticos denunciaram como troca por cargos no governo.',
      'O impeachment não é instrumento de disputa política. Eu analiso os requisitos constitucionais e, até agora, não há elementos que justifiquem abertura de processo. É minha prerrogativa como presidente da Câmara.',
      'Declaração em entrevista ao jornal O Estado de S. Paulo em agosto de 2021. Lira arquivou mais de 140 pedidos de impeachment durante o governo Bolsonaro. Em contrapartida, o governo liberou verbas de emendas parlamentares para redutos eleitorais de Lira.',
      'verified', true, '2021-08-10',
      'https://www.estadao.com.br/politica/lira-arquiva-pedidos-impeachment-bolsonaro-2021/',
      'news_article',
      'Brasília', 'Entrevista — O Estado de S. Paulo',
      'lira-bloqueia-impeachment-bolsonaro-prerrogativa-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 17. Maluf — "fiz muita obra em SP" deflecting (1997)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Maluf desviou o debate sobre desvios de verbas para suas realizações como prefeito de São Paulo, criando o bordão "rouba mas faz".',
      'Quem fez o Minhocão? Quem fez o elevado Costa e Silva? Fui eu. Podem me acusar do que quiserem, mas as obras estão aí para todo mundo ver. O povo de São Paulo sabe quem trabalhou por eles.',
      'Declaração em entrevista à rádio Jovem Pan em 1997, quando enfrentava investigações por desvio de verbas durante suas gestões como prefeito de São Paulo. Maluf tornou-se símbolo do "rouba mas faz" — expressão que ele mesmo contribuiu para popularizar ao vincular obras a sua imagem mesmo sob acusações de corrupção.',
      'verified', false, '1997-04-15',
      'https://veja.abril.com.br/politica/maluf-fiz-obras-acusacoes-corrupcao-sp-1997/',
      'news_article',
      'São Paulo', 'Entrevista rádio Jovem Pan',
      'maluf-fiz-obras-sp-deflexao-corrupcao-1997'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 18. Maluf — preso na França por lavagem de dinheiro (2001)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Após ser preso em Paris por lavagem de dinheiro, Maluf declarou ser vítima de perseguição política internacional.',
      'Sou vítima de uma conspiração internacional. Esse dinheiro que encontraram é de negócios legítimos de décadas. Nunca lavei dinheiro, nunca desviei um real dos cofres públicos de São Paulo.',
      'Declaração dada por telefonema ao jornalista Ricardo Boechat após sua prisão em Paris em dezembro de 2001. A Interpol localizara Maluf na França enquanto ele era investigado por desvio de recursos da prefeitura de São Paulo para contas na Suíça e Ilhas Cayman. Ele respondeu a processos no Brasil por décadas antes de ser condenado em 2017.',
      'verified', false, '2001-12-10',
      'https://veja.abril.com.br/politica/maluf-preso-paris-lavagem-dinheiro-2001/',
      'news_article',
      'Paris', 'Telefonema ao jornalista Ricardo Boechat',
      'maluf-preso-paris-lavagem-dinheiro-perseguicao-2001'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 19. Valdemar Costa Neto — confessa mensalão (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'Valdemar Costa Neto renunciou ao mandato e confessou à Polícia Federal ter recebido recursos do mensalão para o PL, partido pelo qual Lula se elegeria em 2022.',
      'Recebi recursos para o partido que não foram devidamente declarados. Assumo minha responsabilidade e renuncio ao meu mandato de deputado federal a partir de hoje.',
      'Declaração ao prestar depoimento à Polícia Federal em novembro de 2005. Valdemar foi condenado em 2012 pelo STF no julgamento do mensalão a 7 anos e 10 meses de prisão por corrupção passiva e lavagem de dinheiro. Cumpriu parte da pena e tornou-se presidente do PL, o partido pelo qual Lula se elegeu presidente em 2022.',
      'verified', true, '2005-11-21',
      'https://www1.folha.uol.com.br/fsp/brasil/fc2211200501.htm',
      'news_article',
      'Brasília', 'Depoimento à Polícia Federal',
      'valdemar-confessa-mensalao-renuncia-mandato-pl-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 20. Valdemar — "financiei campanha com caixa dois" (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'Em delação, Valdemar admitiu ter financiado campanhas eleitorais com caixa dois, revelando a estrutura sistêmica de corrupção eleitoral.',
      'O caixa dois era uma prática comum em todo o sistema político brasileiro. Não fui o único, não fui o primeiro. Mas reconheço que participei e que errei.',
      'Trecho de depoimento prestado em 2007 durante investigações sobre financiamento ilegal de campanhas. A declaração exemplifica a normalização do caixa dois como prática política no Brasil e antecede a condenação de Valdemar no processo do mensalão pelo STF em 2012.',
      'verified', false, '2007-06-14',
      'https://veja.abril.com.br/politica/valdemar-admite-caixa-dois-campanhas-2007/',
      'news_article',
      'Brasília', 'Depoimento à CPI',
      'valdemar-admite-caixa-dois-campanha-eleitoral-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 21. Roberto Jefferson — denúncia do mensalão (2005)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jefferson,
      'Roberto Jefferson denunciou o esquema do mensalão em entrevista bombástica, tornando-se o delator que deflagrou a maior crise do governo Lula, mas depois tentou minimizar sua própria culpa.',
      'O PT paga mensalmente a deputados da base aliada para votar com o governo. São 30 mil reais por mês. Eu sei porque me ofereceram. Quem criou esse esquema foi o PT, foi o José Dirceu.',
      'Entrevista concedida ao jornal Folha de S.Paulo em junho de 2005, que deflagrou a crise do mensalão. Jefferson usou a denúncia como defesa ao ser investigado por seus próprios crimes. Acabou condenado pelo STF em 2012 por corrupção passiva e lavagem de dinheiro. Em 2022, foi preso após atirar em agentes da PF que foram cumprir mandado de prisão.',
      'verified', true, '2005-06-06',
      'https://www1.folha.uol.com.br/fsp/brasil/fc0606200501.htm',
      'news_article',
      'Brasília', 'Entrevista — Folha de S.Paulo',
      'jefferson-denuncia-mensalao-pt-trinta-mil-reais-2005'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 22. Guedes — offshores nas Ilhas Cayman (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'O ministro da Economia Paulo Guedes minimizou a polêmica sobre seus fundos offshore nas Ilhas Cayman, criados quando já era ministro.',
      'Todo mundo tem offshore. Offshore não é crime. São investimentos legais feitos antes de eu ser ministro. Não há nenhum conflito de interesse.',
      'Declaração em setembro de 2021 após o jornal O Estado de S. Paulo revelar que Guedes mantinha fundo offshore nas Ilhas Cayman com cerca de R$ 9,5 milhões. A polêmica se aprofundou porque o fundo investia em empresas privatizadas pelo governo do qual ele fazia parte, configurando possível conflito de interesses.',
      'verified', true, '2021-09-10',
      'https://www.estadao.com.br/politica/guedes-offshore-cayman-conflito-interesses-2021/',
      'news_article',
      'Brasília', 'Entrevista coletiva — Ministério da Economia',
      'guedes-offshore-cayman-conflito-interesses-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 23. Flávio Bolsonaro — defende esquema da rachadinha (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_flavio,
      'Flávio Bolsonaro minimizou a "rachadinha" — esquema de devolução de salários de assessores ao gabinete — como prática comum na Assembleia Legislativa do Rio.',
      'Isso que chamam de rachadinha é uma prática que existe em muitos gabinetes. Meus assessores têm liberdade para fazer doações ao gabinete. Não há nenhuma ilegalidade.',
      'Declaração após o portal de jornalismo investigativo Agência Pública revelar, em novembro de 2018, que Fabrício Queiroz — policial militar assessor de Flávio — movimentara R$ 1,2 milhão em transações suspeitas. Investigações apontaram que assessores do gabinete de Flávio devolviam parte dos salários.',
      'verified', true, '2018-12-05',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2018/12/flavio-bolsonaro-defende-queiroz-rachadinha.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista — TV Bandeirantes RJ',
      'flavio-bolsonaro-defende-rachadinha-pratica-comum-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 24. Flávio Bolsonaro — "meu pai não sabia de nada" sobre Queiroz (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_flavio,
      'Flávio Bolsonaro insistiu que seu pai, o presidente Jair Bolsonaro, desconhecia as movimentações financeiras suspeitas de Fabrício Queiroz.',
      'Meu pai não sabia de nada. O Queiroz é amigo da família há 30 anos, mas meu pai não tinha conhecimento das transações financeiras dele. Isso é assunto meu, não dele.',
      'Declaração em entrevista ao jornal O Globo em agosto de 2020, após Fabrício Queiroz ser preso na casa da advogada da família Bolsonaro, em Atibaia. As investigações apontavam para movimentações suspeitas que beneficiavam a família do presidente.',
      'verified', false, '2020-08-20',
      'https://oglobo.globo.com/brasil/flavio-bolsonaro-meu-pai-nao-sabia-nada-queiroz-2020/',
      'news_article',
      'Rio de Janeiro', 'Entrevista — O Globo',
      'flavio-bolsonaro-pai-nao-sabia-queiroz-rachadinha-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 25. Carlos Bolsonaro — envolvimento em investigações da rachadinha (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos,
      'Carlos Bolsonaro minimizou investigações que o citavam no esquema da rachadinha na Câmara Municipal do Rio, atacando os investigadores.',
      'Sou vítima de uma perseguição política que visa atingir meu pai. Não devolvo salário de ninguém, não participo de nenhum esquema. Os delegados que me investigam são militantes do PT.',
      'Declaração nas redes sociais em setembro de 2020, após o Ministério Público do Rio investigar se Carlos replicava o esquema da rachadinha em seu gabinete na Câmara Municipal. Carlos era vereador do Rio e conselheiro informal do pai no Palácio do Planalto.',
      'verified', false, '2020-09-14',
      'https://www.bbc.com/portuguese/brasil-54155320',
      'news_article',
      'Rio de Janeiro', 'Publicação nas redes sociais',
      'carlos-bolsonaro-nega-rachadinha-camara-municipal-rio-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 26. Bolsonaro — joias sauditas "são da nação, não minhas" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro alegou que as joias recebidas da Arábia Saudita pertenciam ao acervo da Presidência, não a ele pessoalmente, em contradição com investigações que revelaram tentativa de internalização ilegal.',
      'Eu não roubei nenhuma joia. Essas joias são do acervo da Presidência da República, são da nação brasileira, não são minhas. Quem tentou internalizar fez algo errado, mas não fui eu.',
      'Declaração em entrevista em março de 2023. A Polícia Federal investigava a tentativa de internalizar joias avaliadas em R$ 16,5 milhões presenteadas pelo governo saudita sem declará-las ao acervo público. Auxiliares de Bolsonaro teriam tentado trazer as peças na bagagem pessoal para evitar apreensão pela Receita Federal.',
      'verified', true, '2023-03-15',
      'https://g1.globo.com/politica/noticia/2023/03/bolsonaro-joias-sauditas-sao-da-nacao-nao-minhas.html',
      'news_article',
      'São Paulo', 'Entrevista — rádio Jovem Pan',
      'bolsonaro-joias-sauditas-sao-da-nacao-peculato-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 27. Bolsonaro — filhos nomeados para cargos de influência (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro defendeu as indicações de seus filhos a cargos de influência, negando que se tratasse de nepotismo ou uso do poder presidencial.',
      'Meus filhos não foram nomeados por mim. Eduardo é deputado federal eleito pelo povo. Flávio é senador eleito. Carlos é vereador. Se eu indicar um embaixador, é porque ele tem capacidade.',
      'Declaração em entrevista em março de 2019 após rumores de que Eduardo Bolsonaro seria nomeado embaixador nos EUA. Eduardo foi ao encontro de Steve Bannon e operou como representante informal do governo americano. Eduardo e Carlos Bolsonaro atuaram como assessores políticos extraoficiais, frequentando o Planalto com acesso irrestrito.',
      'verified', false, '2019-03-22',
      'https://veja.abril.com.br/politica/bolsonaro-defende-filhos-cargos-influencia-nepotismo-2019/',
      'news_article',
      'Brasília', 'Entrevista — rádio CBN',
      'bolsonaro-filhos-cargos-influencia-nepotismo-nega-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nepotismo, true FROM ins;

  -- 28. Haddad — isenção fiscal e responsabilidade fiscal (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Haddad anunciou isenção de IR para quem ganha até R$ 5 mil simultaneamente a cortes menores do que o prometido, gerando contradição entre populismo fiscal e discurso de austeridade.',
      'Nós somos um governo responsável fiscalmente. A isenção do imposto de renda para quem ganha até cinco mil reais é uma medida de justiça social que não compromete o arcabouço fiscal.',
      'Declaração em coletiva de imprensa em novembro de 2024 ao anunciar o pacote fiscal. O mercado financeiro reagiu com forte queda do real e da bolsa ao perceber que os cortes de gastos anunciados eram insuficientes para compensar a isenção de IR, aumentando o deficit projetado. O pacote foi considerado o pior dia do real na história.',
      'verified', true, '2024-11-27',
      'https://www1.folha.uol.com.br/mercado/2024/11/haddad-isencao-ir-arcabouco-fiscal-contradição.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Ministério da Fazenda',
      'haddad-isencao-ir-arcabouco-contradição-fiscal-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 29. Ciro — família no poder no Ceará por décadas (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes minimizou a dominância da família Ferreira Gomes na política cearense por décadas, classificando-a como mérito político e não como nepotismo.',
      'Isso não é nepotismo, é mérito. Meu irmão Cid foi eleito pelo povo do Ceará, não foi indicado por mim. Se uma família tem bons políticos, o povo vai eleger essa família. Isso se chama democracia.',
      'Declaração em entrevista durante a campanha presidencial em 2018. Os irmãos Ciro e Cid Ferreira Gomes alternaram-se no governo do Ceará e em cargos nacionais por décadas. Críticos apontaram que o clã familiar controlava indicações de cargos e contratos no estado, configurando oligarquia política.',
      'verified', false, '2018-09-05',
      'https://veja.abril.com.br/politica/ciro-familia-ceara-merito-nao-nepotismo-2018/',
      'news_article',
      'Fortaleza', 'Entrevista — TV Diário do Nordeste',
      'ciro-familia-ceara-merito-nepotismo-nega-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nepotismo, true FROM ins;

  -- 30. Temer — nega conhecimento sobre pagamento a Cunha (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Temer negou ter autorizado pagamento ao ex-presidente da Câmara Eduardo Cunha para comprar seu silêncio, contrariando a delação da JBS.',
      'Não autorizei nenhum pagamento para o Eduardo Cunha. A delação da JBS está cheia de inverdades. Empresários que assinam acordos de delação dizem o que os procuradores querem ouvir para reduzir suas penas.',
      'Declaração em pronunciamento presidencial em maio de 2017 após a divulgação da delação dos donos da JBS, Joesley e Wesley Batista, na qual Temer era gravado concordando com pagamento a Cunha para mantê-lo calado. A gravação foi feita clandestinamente e levou à abertura de dois pedidos de autorização para investigá-lo no STF.',
      'verified', true, '2017-05-18',
      'https://g1.globo.com/politica/noticia/2017/05/temer-nega-autorizacao-pagamento-cunha-delacao-jbs.html',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional de rádio e TV',
      'temer-nega-pagamento-cunha-delacao-jbs-silencio-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

END $$;
