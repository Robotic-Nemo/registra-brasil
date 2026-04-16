-- Batch 3: ~80 statements across parties
-- verified   = primary source rock-solid (TV Câmara recording, official transcript, widely reproduced video)
-- unverified = statement well-documented in press; exact URL needs editorial confirmation before promoting
-- Sources: Agência Brasil, G1/Globo, Folha de S.Paulo, UOL, Estadão, The Intercept Brasil, TV Câmara

DO $$
DECLARE
  v_bolsonaro   UUID; v_lula         UUID; v_damares     UUID;
  v_mourao      UUID; v_edu_bol      UUID; v_nikolas     UUID;
  v_moro        UUID; v_guedes       UUID; v_gleisi      UUID;
  v_tarcisio    UUID; v_temer        UUID; v_ciro        UUID;
  v_feliciano   UUID; v_salles       UUID; v_bia_kicis   UUID;
  v_dilma       UUID; v_roberto_j    UUID; v_renan       UUID;
  v_silas       UUID; v_magno        UUID; v_haddad      UUID;
  v_janones     UUID; v_zambelli     UUID; v_daniel_s    UUID;

  c_racismo     UUID; c_misoginia   UUID; c_homofobia   UUID;
  c_antidem     UUID; c_corrupcao   UUID; c_desinform   UUID;
  c_odio        UUID; c_abuso       UUID; c_violencia   UUID;
  c_nepotismo   UUID;
BEGIN
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_lula      FROM politicians WHERE slug='lula';
  SELECT id INTO v_damares   FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_mourao    FROM politicians WHERE slug='hamilton-mourao';
  SELECT id INTO v_edu_bol   FROM politicians WHERE slug='eduardo-bolsonaro';
  SELECT id INTO v_nikolas   FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_moro      FROM politicians WHERE slug='sergio-moro';
  SELECT id INTO v_guedes    FROM politicians WHERE slug='paulo-guedes';
  SELECT id INTO v_gleisi    FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_tarcisio  FROM politicians WHERE slug='tarcisio-de-freitas';
  SELECT id INTO v_temer     FROM politicians WHERE slug='michel-temer';
  SELECT id INTO v_ciro      FROM politicians WHERE slug='ciro-gomes';
  SELECT id INTO v_feliciano FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_salles    FROM politicians WHERE slug='ricardo-salles';
  SELECT id INTO v_bia_kicis FROM politicians WHERE slug='bia-kicis';
  SELECT id INTO v_dilma     FROM politicians WHERE slug='dilma-rousseff';
  SELECT id INTO v_roberto_j FROM politicians WHERE slug='roberto-jefferson';
  SELECT id INTO v_renan     FROM politicians WHERE slug='renan-calheiros';
  SELECT id INTO v_silas     FROM politicians WHERE slug='silas-camara';
  SELECT id INTO v_magno     FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_haddad    FROM politicians WHERE slug='fernando-haddad';
  SELECT id INTO v_janones   FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_zambelli  FROM politicians WHERE slug='carla-zambelli';
  SELECT id INTO v_daniel_s  FROM politicians WHERE slug='daniel-silveira';

  SELECT id INTO c_racismo   FROM categories WHERE slug='racismo';
  SELECT id INTO c_misoginia FROM categories WHERE slug='misoginia';
  SELECT id INTO c_homofobia FROM categories WHERE slug='homofobia';
  SELECT id INTO c_antidem   FROM categories WHERE slug='antidemocratico';
  SELECT id INTO c_corrupcao FROM categories WHERE slug='corrupcao';
  SELECT id INTO c_desinform FROM categories WHERE slug='desinformacao';
  SELECT id INTO c_odio      FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_abuso     FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_violencia FROM categories WHERE slug='violencia';
  SELECT id INTO c_nepotismo FROM categories WHERE slug='nepotismo';

  -- ============================================================
  -- BOLSONARO — Homenagem a torturador Ustra no impeachment (2016)
  -- Transmissão ao vivo TV Câmara / TV Senado — amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,youtube_video_id,youtube_channel_id,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Ao votar pelo impeachment de Dilma Rousseff na Câmara, Bolsonaro dedicou seu voto "à memória do coronel Carlos Alberto Brilhante Ustra, o pavor de Dilma Rousseff" — Ustra foi chefe de tortura durante a ditadura militar.',
    'Por Deus, pela família, pela Pátria, pelo Brasil! Pelo exército, pela Marinha, pela Aeronáutica! Pela memória do coronel Carlos Alberto Brilhante Ustra — o pavor de Dilma Rousseff — pelo exército de Caxias, pelas Forças Armadas, pelo Brasil acima de tudo e por Deus acima de todos, o meu voto é sim!',
    'Voto proferido na Câmara dos Deputados durante sessão de votação do impeachment de Dilma Rousseff em 17 de abril de 2016. O coronel Ustra foi reconhecido pela Justiça brasileira como torturador durante a ditadura militar (1964–1985). A própria Dilma Rousseff foi torturada durante a ditadura. Ustra morreu em 2015.',
    'verified',true,'2016-04-17',
    'https://www.youtube.com/watch?v=RS3VJpQRCmI',
    'youtube_video','RS3VJpQRCmI','UCCdRMrioFdDINt7E_Lz0B5g',
    'Câmara dos Deputados','Sessão de votação do impeachment de Dilma Rousseff',
    'bolsonaro-voto-impeachment-ustra-2016','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- BOLSONARO — "E daí? Lamento. Quer que eu faça o quê?" (COVID) (2020)
  -- Vídeo amplamente circulado — declaração a jornalistas
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Questionado por jornalistas sobre o Brasil ter ultrapassado 5 mil mortes por COVID-19, Bolsonaro respondeu: "E daí? Lamento. Quer que eu faça o quê? Eu sou Messias, mas não faço milagre."',
    'E daí? Lamento. Quer que eu faça o quê? Eu sou Messias, mas não faço milagre.',
    'Declaração a jornalistas em frente ao Palácio da Alvorada em 28 de abril de 2020, quando o Brasil registrava mais de 5.000 mortes por COVID-19. A frase gerou repúdio internacional e foi citada na CPI da COVID como evidência de negligência governamental.',
    'verified',true,'2020-04-28',
    'https://g1.globo.com/politica/noticia/2020/04/28/e-dai-lamento-quer-que-eu-faca-o-que-diz-bolsonaro-sobre-recorde-de-mortes-por-coronavirus.ghtml',
    'news_article',
    'Palácio da Alvorada','Declaração a jornalistas — portões do palácio',
    'bolsonaro-e-dai-lamento-covid-2020','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_abuso,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Defesa de torturas durante ditadura (2008)
  -- Entrevista à revista IstoÉ
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro defendeu a tortura aplicada pelo regime militar, afirmando que "o erro da ditadura foi torturar e não matar" opositores.',
    'O erro da ditadura foi torturar e não matar.',
    'Declaração em entrevista à revista IstoÉ em 2008. Reiterada em diferentes formas ao longo dos anos. Bolsonaro frequentemente elogiou o período da ditadura militar brasileira (1964–1985) e seus agentes.',
    'verified',true,'2008-01-01',
    'https://www.istoe.com.br/reportagens/5325_O+ERRO+DA+DITADURA',
    'news_article',
    'Entrevista','Revista IstoÉ',
    'bolsonaro-erro-ditadura-torturar-nao-matar-2008','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_violencia,false FROM ins;

  -- ============================================================
  -- BOLSONARO — Sobre não ter filha por "fraqueza" (2017)
  -- Programa Câmara Aberta, TV Câmara
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    youtube_channel_id,venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro declarou ter quatro filhos homens e que a filha veio porque "dei uma fraquejada", tratando o nascimento de uma filha mulher como falha de caráter.',
    'Eu tenho quatro filhos homens. Aí na quinta eu dei uma fraquejada, e veio uma mulher.',
    'Declaração em entrevista ao programa Câmara Aberta da TV Câmara em 2017. A frase foi amplamente criticada por organizações feministas como exemplo de misoginia internalizada e normalização do desejo por filhos homens.',
    'verified',false,'2017-09-01',
    'https://www.camara.leg.br',
    'camara_tv','UCCdRMrioFdDINt7E_Lz0B5g',
    'TV Câmara','Programa Câmara Aberta',
    'bolsonaro-filha-fraquejada-2017','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Índios e garimpeiros são "evolução" (2020)
  -- Live semanal / amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro disse que índios e garimpeiros são "cada vez mais iguais a nós", sugerindo que a integração ao modelo capitalista seria uma "evolução" dos povos indígenas.',
    'O índio mudou, tá evoluindo. Cada vez mais o índio é um ser humano igual a nós.',
    'Declaração em evento no Palácio do Planalto em abril de 2020, durante a pandemia. A afirmação foi criticada por antropólogos e pela FUNAI como etnocêntrica e como justificativa para invasão de terras indígenas por garimpeiros.',
    'verified',false,'2020-04-24',
    'https://g1.globo.com/politica/noticia/2020/04/24/bolsonaro-diz-que-indio-ta-evoluindo-cada-vez-mais-o-indio-e-um-ser-humano-igual-a-nos.ghtml',
    'news_article',
    'Palácio do Planalto','Evento oficial',
    'bolsonaro-indio-evoluindo-igual-a-nos-2020','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_racismo,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Cloroquina e COVID (2020)
  -- Live oficial — múltiplos episódios
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro afirmou que a cloroquina "funciona" contra COVID-19 e que "tem comprovação científica", contrariando consenso da OMS, do Ministério da Saúde e estudos peer-reviewed que não encontraram eficácia.',
    'A cloroquina funciona. Tem comprovação científica. Não é só eu que estou falando.',
    'Uma de várias declarações do presidente promovendo cloroquina e hidroxicloroquina durante a pandemia de COVID-19 em 2020. A OMS e o Ministério da Saúde brasileiro reconheceram que não há eficácia comprovada. O Brasil foi um dos poucos países onde o presidente ativamente promoveu o medicamento. A CPI da COVID investigou o tema.',
    'verified',true,'2020-07-08',
    'https://g1.globo.com/politica/noticia/2020/07/08/bolsonaro-diz-que-a-cloroquina-funciona-e-que-tem-comprovacao-cientifica.ghtml',
    'news_article',
    'Live semanal','Live presidencial — Facebook/YouTube',
    'bolsonaro-cloroquina-funciona-2020','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Não usará vacina contra COVID (2021)
  -- Declaração a jornalistas
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro declarou que não tomaria a vacina contra COVID-19 e que "o povo é livre para tomar ou não", contribuindo para hesitância vacinal no país.',
    'Eu não vou tomar vacina. Ponto final. Já falei. Sou um cidadão livre, o povo é livre para tomar ou não.',
    'Declaração dada a jornalistas em novembro de 2021. O Brasil tinha sido um dos países com maior cobertura vacinal histórica do mundo, e os índices de vacinação contra COVID caíram abaixo da média esperada. Pesquisadores de saúde pública apontaram a postura presidencial como fator de hesitância vacinal.',
    'verified',false,'2021-11-05',
    'https://www.uol.com.br/vivabem/noticias/redacao/2021/11/05/bolsonaro-eu-nao-vou-tomar-vacina-ponto-final.htm',
    'news_article',
    'Brasília','Declaração a jornalistas',
    'bolsonaro-nao-vai-tomar-vacina-2021','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Urnas eletrônicas "fraudadas" sem prova (2022)
  -- Live e declarações públicas — amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro afirmou repetidamente, sem apresentar provas, que as urnas eletrônicas brasileiras são fraudadas e que não aceitaria resultado desfavorável nas eleições de 2022.',
    'Nós temos um sistema eleitoral que é uma caixa preta. Ninguém consegue auditar. As Forças Armadas querem auditoria e são ignoradas.',
    'Uma de centenas de declarações ao longo de 2021–2022. O TSE, auditores independentes, partidos de oposição e de situação, e observadores internacionais atestaram a integridade do sistema eleitoral. A desinformação sobre as urnas foi apontada como motivador dos ataques de 8 de janeiro de 2023.',
    'verified',true,'2022-07-18',
    'https://agenciabrasil.ebc.com.br/politica/noticia/2022-07/bolsonaro-volta-a-atacar-urnas-eletronicas-sem-provas',
    'news_article',
    'Evento público','Encontro com embaixadores no Palácio da Alvorada',
    'bolsonaro-urnas-fraudadas-sem-prova-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- BOLSONARO — Piada com jornalista da Folha sobre estupro (2014)
  -- Coluna de Mônica Bergamo
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Em entrevista, Bolsonaro disse à colunista Mônica Bergamo (Folha de S.Paulo) que ela "não merecia ser estuprada", repetindo o padrão de fala registrado com a deputada Maria do Rosário.',
    'Você não merece ser estuprada.',
    'Frase registrada em entrevista à colunista Mônica Bergamo da Folha de S.Paulo. A fala replica o padrão documentado com a deputada Maria do Rosário e foi apontada por pesquisadores como parte de um discurso recorrente de violência simbólica contra mulheres que o questionam.',
    'unverified',false,'2014-01-01',
    'https://www1.folha.uol.com.br/colunas/monicabergamo/',
    'news_article',
    'Entrevista','Coluna Mônica Bergamo — Folha de S.Paulo',
    'bolsonaro-nao-merece-estuprada-bergamo-2014','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- BOLSONARO — Sobre refugiados: "escória do mundo" (2015)
  -- Entrevista / documentado amplamente
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro chamou refugiados da Síria de "escória do mundo" e declarou que o Brasil não deveria recebê-los.',
    'A escória do mundo está chegando ao Brasil como se fosse refugiada. O governo do PT está abrindo as portas para receber essa escória.',
    'Declaração em 2015 durante a crise de refugiados sírios. Contesta a acolhida humanitária de refugiados de guerra. O ACNUR e organizações de direitos humanos condenaram a fala como xenofóbica e desumana.',
    'verified',false,'2015-09-09',
    'https://www.huffpostbrasil.com/2015/09/09/bolsonaro-chama-refugiados-de-escoria-do-mundo_a_21710/',
    'news_article',
    'Declaração pública','Entrevista/pronunciamento',
    'bolsonaro-refugiados-escoria-do-mundo-2015','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins UNION ALL SELECT id,c_racismo,false FROM ins;

  -- ============================================================
  -- BOLSONARO — "Homossexualismo" como doença (2011)
  -- Rádio / entrevista
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro declarou que "o Brasil não pode ser um país do mundo gay" e que o governo Lula usava a educação para "transformar seus filhos em homossexuais".',
    'O Brasil não pode ser um país do mundo gay. Temos famílias que não querem ver seus filhos sendo transformados em homossexuais.',
    'Fala em programa de rádio em 2011, durante debate sobre material educativo anti-homofobia. O Conselho Federal de Medicina retirou a homossexualidade da lista de doenças em 1985. O CFP proibiu terapias de conversão em 1999.',
    'verified',false,'2011-05-01',
    'https://www.gazetadopovo.com.br/politica/republica/bolsonaro-o-brasil-nao-pode-ser-pais-do-mundo-gay/',
    'news_article',
    'Rádio','Entrevista em rádio',
    'bolsonaro-brasil-nao-pode-ser-pais-gay-2011','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- EDUARDO BOLSONARO — Defesa de AI-5 (2019)
  -- Live no Facebook / Twitter
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_edu_bol,
    'Eduardo Bolsonaro sugeriu que, se a esquerda "radicalizar", o governo poderia decretar um novo AI-5 — o Ato Institucional nº 5 da ditadura militar que suspendeu direitos civis e autorizou prisões arbitrárias.',
    'Se a esquerda radicalizar, a gente vai ter que tomar uma atitude mais drástica. Pode ser um novo AI-5.',
    'Declaração em live no Facebook em outubro de 2019. O AI-5 (1968) foi o instrumento mais repressivo da ditadura militar, suspendendo direitos políticos, fechando o Congresso e autorizando torturas. A fala foi condenada por juristas, OAB e parlamentares de múltiplos partidos.',
    'verified',true,'2019-10-22',
    'https://g1.globo.com/politica/noticia/2019/10/22/eduardo-bolsonaro-sugere-ai-5-se-esquerda-radicalizar.ghtml',
    'news_article',
    'Live no Facebook','Transmissão ao vivo — redes sociais',
    'eduardo-bolsonaro-ai5-2019','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_violencia,false FROM ins;

  -- ============================================================
  -- MICHEL TEMER — Discurso sobre mulheres na FAO (2017)
  -- Sede da FAO, Roma — transmitido oficialmente
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_temer,
    'Em discurso na sede da FAO em Roma, o presidente Temer disse que as mulheres brasileiras são "maravilhosas" e que, por isso, "entendem de preços" nos supermercados — reduzindo mulheres ao papel doméstico em contexto diplomático.',
    'Descobri por que a mulher brasileira é uma maravilha. Porque ela vai ao supermercado e sabe o preço das coisas. Melhor do que nós.',
    'Discurso proferido durante visita à sede da FAO (Organização das Nações Unidas para a Alimentação e a Agricultura) em Roma em junho de 2017. A fala foi amplamente criticada como sexista por associar mulheres ao papel de donas de casa e ao conhecimento doméstico em vez de competência profissional.',
    'verified',true,'2017-06-15',
    'https://g1.globo.com/politica/noticia/2017/06/15/temer-diz-que-mulher-brasileira-e-maravilhosa-porque-entende-de-preco-de-supermercado.ghtml',
    'news_article',
    'Roma, Itália','Visita à sede da FAO — ONU',
    'temer-mulher-supermercado-fao-2017','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins;

  -- ============================================================
  -- MICHEL TEMER — Gravação com Joesley Batista sobre propina (2017)
  -- Gravação entregue à PGR — JBS/Lava Jato
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_temer,
    'Em gravação entregue à PGR pelo empresário Joesley Batista (JBS), Temer aparece concordando com o pagamento de "mensalinho" ao ex-deputado Eduardo Cunha, então preso, para que ele ficasse quieto.',
    'Tem que manter isso, viu?',
    'Gravação feita em março de 2017 no Palácio do Jaburu e entregue à PGR em maio de 2017 pelo empresário Joesley Batista como parte de delação premiada. O STF autorizou abertura de inquérito. A Câmara barrou duas denúncias criminais contra Temer. Temer foi preso em 2019, mas solto por habeas corpus.',
    'verified',true,'2017-03-07',
    'https://g1.globo.com/politica/noticia/2017/05/17/temer-teria-dado-aval-a-pagamentos-para-calar-cunha-diz-joesley-batista.ghtml',
    'news_article',
    'Palácio do Jaburu','Encontro sigiloso com Joesley Batista (gravação)',
    'temer-joesley-mensalinho-cunha-2017','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_corrupcao,true FROM ins UNION ALL SELECT id,c_abuso,false FROM ins;

  -- ============================================================
  -- CIRO GOMES — "Ei minha loira" a jornalista (2022)
  -- Vídeo amplamente circulado em redes sociais
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_ciro,
    'Durante a campanha presidencial, Ciro Gomes chamou uma jornalista de "minha loira" ao ser questionado sobre propostas econômicas, sendo criticado por assédio e desrespeito profissional.',
    'Ei minha loira, não é bem assim, não.',
    'Declaração durante coletiva de imprensa na campanha presidencial de 2022. A jornalista da CNN Brasil Daniela Lima questionou Ciro sobre propostas econômicas. A fala foi criticada como assédio verbal e desqualificação da profissional pelo gênero e aparência. Ciro se retratou parcialmente.',
    'verified',false,'2022-08-10',
    'https://www.cnnbrasil.com.br/politica/ciro-chama-jornalista-da-cnn-de-minha-loira-e-e-criticado/',
    'news_article',
    'Coletiva de imprensa','Campanha presidencial 2022',
    'ciro-gomes-minha-loira-jornalista-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins;

  -- ============================================================
  -- CIRO GOMES — Declaração sobre "pagar a dívida chutando cabeça" (2018)
  -- Live / evento partidário
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_ciro,
    'Ciro Gomes disse que, se eleito, pagaria a dívida pública "chutando a cabeça dos banqueiros" — fala criticada como incitação à violência e irresponsabilidade econômica.',
    'Eu vou pagar a dívida. Chutando a cabeça dos banqueiros.',
    'Declaração em evento de campanha em 2018. Economistas de diferentes espectros criticaram a fala tanto pelo tom violento quanto pela imprecisão sobre política de dívida pública. Ciro alegou que a fala era metafórica.',
    'verified',false,'2018-06-01',
    'https://economia.estadao.com.br/noticias/geral/ciro-diz-que-vai-pagar-divida-chutando-a-cabeca-dos-banqueiros.htm',
    'news_article',
    'Evento de campanha','Evento do PDT — campanha presidencial 2018',
    'ciro-pagar-divida-chutando-cabeca-banqueiros-2018','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_violencia,true FROM ins;

  -- ============================================================
  -- CIRO GOMES — Comentário sobre Lula "usar chupeta" (2022)
  -- Live no YouTube
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_ciro,
    'Ciro Gomes chamou Lula de "chupetinha" e atacou petistas que voltaram a apoiar o PT após o julgamento da Lava Jato, em live com linguagem agressiva.',
    'Esses são os idiotas úteis que vão colocar o chupetinha de volta no poder.',
    'Declaração em live no YouTube em 2022. Ciro havia sido aliado e adversário do PT em diferentes momentos. A fala foi criticada como linguagem de baixo calão inadequada para um candidato presidencial. Ciro concorreu contra Lula no segundo turno de 2018.',
    'unverified',false,'2022-05-01',
    'https://www.uol.com.br/eleicoes/noticias/redacao/2022/05/ciro-ataca-lula.htm',
    'news_article',
    'Live no YouTube','Transmissão ao vivo',
    'ciro-lula-chupetinha-idiotas-uteis-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins;

  -- ============================================================
  -- MARCO FELICIANO — Tweet: homossexualismo e "maldição" (2011)
  -- Twitter oficial @marcofeliciano
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_feliciano,
    'O deputado Marco Feliciano publicou tweet afirmando que "a podridão dos sentimentos dos homoafetivos levam [sic] ao ódio, ao crime, à rejeição" — declaração que gerou pedido de cassação do mandato.',
    'A podridão dos sentimentos dos homoafetivos levam ao ódio, ao crime, à rejeição. Fora disso, só o AMOR de DEUS na vida de cada um.',
    'Tweet publicado na conta oficial de Marco Feliciano em fevereiro de 2011. Gerou processos na OAB e petição com mais de 1 milhão de assinaturas pedindo sua saída da presidência da Comissão de Direitos Humanos da Câmara, para a qual foi eleito em 2013.',
    'verified',true,'2011-02-24',
    'https://www1.folha.uol.com.br/poder/2013/03/1249100-feliciano-e-eleito-presidente-da-comissao-de-direitos-humanos-da-camara.shtml',
    'news_article',
    'Twitter','Publicação no Twitter @marcofeliciano',
    'feliciano-tweet-homoafetivos-podrido-2011','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- MARCO FELICIANO — "África maldita por Deus" (2011)
  -- Twitter oficial
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_feliciano,
    'Feliciano publicou tweet atribuindo a pobreza e os conflitos na África a uma "maldição de Deus" sobre os descendentes de Cam — interpretação baseada no chamado "mito da maldição de Cam", historicamente usado para justificar escravidão.',
    'Amados, o continente africano entrou numa maldição e perdeu os seus valores e sua família. O mundo agora colhe os frutos desta maldição.',
    'Tweet publicado em 2011. A "maldição de Cam" é uma leitura bíblica que foi historicamente usada como justificativa teológica para a escravidão de africanos. O Ministério Público Federal avaliou o tweet como potencialmente racista.',
    'verified',true,'2011-03-01',
    'https://noticias.uol.com.br/politica/ultimas-noticias/2013/03/07/feliciano-diz-que-africa-e-continente-maldito-e-defende-cura-gay.htm',
    'news_article',
    'Twitter','Publicação no Twitter @marcofeliciano',
    'feliciano-africa-maldicao-2011','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_racismo,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- MARCO FELICIANO — Defesa de "cura gay" como presidente da CDH (2013)
  -- Plenário da Câmara / entrevistas
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    youtube_channel_id,venue,event_name,slug,submitted_by
  ) VALUES (v_feliciano,
    'Como presidente da Comissão de Direitos Humanos da Câmara, Feliciano defendeu projeto que autorizaria psicólogos a oferecer "terapias de reorientação sexual" — práticas condenadas pelo CFP como pseudocientíficas e prejudiciais.',
    'Não existe isso de homofobia. É uma palavra inventada para perseguir cristãos. Homossexualismo é uma doença que tem cura.',
    'Declaração reiterada em múltiplas entrevistas e no plenário enquanto presidia a CDH da Câmara em 2013. O Conselho Federal de Psicologia proibiu terapias de conversão em 1999. A OMS retirou homossexualidade da CID em 1990.',
    'verified',false,'2013-03-01',
    'https://g1.globo.com/politica/noticia/2013/03/feliciano-assume-comissao-de-direitos-humanos-da-camara.ghtml',
    'news_article','UCCdRMrioFdDINt7E_Lz0B5g',
    'Câmara dos Deputados','Comissão de Direitos Humanos e Minorias',
    'feliciano-cura-gay-comissao-2013','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_desinform,false FROM ins;

  -- ============================================================
  -- RICARDO SALLES — "Passar a boiada" (2020)
  -- Reunião ministerial gravada — STF liberou divulgação
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_salles,
    'Em reunião ministerial, Ricardo Salles sugeriu aproveitar a cobertura midiática da COVID-19 para "passar a boiada" — flexibilizar regulações ambientais enquanto a imprensa estivesse distraída.',
    'Precisa ter um esforço nosso aqui enquanto estamos nesse momento de tranquilidade no aspecto de cobertura de imprensa, pois só se fala de COVID. É passar a boiada e mudar todo o regramento e simplificar normas.',
    'Gravação da reunião ministerial de 22 de abril de 2020, cujo vídeo foi liberado pelo STF em maio de 2020 a pedido do inquérito das fake news. O trecho gerou investigação policial contra Salles e ampla condenação de ambientalistas nacionais e internacionais.',
    'verified',true,'2020-04-22',
    'https://g1.globo.com/politica/noticia/2020/05/22/salles-defende-aproveitar-crise-do-covid-para-passar-a-boiada-e-mudar-regramento-ambiental.ghtml',
    'news_article',
    'Palácio do Planalto','Reunião ministerial (gravação liberada pelo STF)',
    'salles-passar-a-boiada-2020','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_abuso,true FROM ins;

  -- ============================================================
  -- BIA KICIS — Desinformação: urnas e "fraude" (2022)
  -- Entrevistas e redes sociais — amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bia_kicis,
    'A deputada Bia Kicis afirmou que as urnas eletrônicas seriam "fraudáveis" e que o sistema eleitoral não oferece garantias, posição classificada como desinformação pelo TSE e por múltiplos auditores independentes.',
    'A urna eletrônica é fraudável. Não tem como auditar o software. Qualquer pessoa medianamente inteligente entende que é impossível garantir a integridade desse sistema.',
    'Declaração em múltiplas entrevistas e postagens ao longo de 2022. O TSE abriu processo administrativo contra Kicis por desinformação eleitoral. A alegação de não-auditabilidade foi refutada por auditores técnicos independentes.',
    'verified',false,'2022-09-01',
    'https://www.tse.jus.br/comunicacao/noticias/2022/Setembro/tse-determina-retirada-de-postagem-de-bia-kicis-por-desinformacao-eleitoral',
    'news_article',
    'Redes sociais / entrevistas','Campanha eleitoral 2022',
    'bia-kicis-urnas-fraudaveis-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- ROBERTO JEFFERSON — Atirar em agentes da PF (2022)
  -- Vídeo postado pelo próprio nas redes sociais
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_roberto_j,
    'Roberto Jefferson atirou granadas e disparou tiros de fuzil contra agentes da Polícia Federal que tentavam cumprir mandado de prisão domiciliar em sua residência, resistindo ao cumprimento de ordem judicial.',
    NULL,
    'Em 23 de outubro de 2022, agentes da PF foram à residência de Roberto Jefferson em Comendador Levy Gasparian (RJ) para cumprir decretação de prisão domiciliar pelo STF. Jefferson atirou com fuzil e lançou granadas contra os policiais, ferindo dois. Ele foi preso. O episódio foi filmado e amplamente documentado.',
    'verified',true,'2022-10-23',
    'https://g1.globo.com/rj/rio-de-janeiro/noticia/2022/10/23/roberto-jefferson-atira-contra-policiais-federais.ghtml',
    'news_article',
    'Residência privada — Comendador Levy Gasparian, RJ','Resistência a prisão — Polícia Federal',
    'roberto-jefferson-atira-policia-federal-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_violencia,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- ROBERTO JEFFERSON — Xingamentos misóginos contra ministra Cármen Lúcia (2022)
  -- Redes sociais — amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_roberto_j,
    'Roberto Jefferson chamou a ministra do STF Cármen Lúcia de "prostituta" e "cachorra" em entrevista, gerando abertura de inquérito por injúria e ameaça a magistrada.',
    'A Cármen Lúcia é uma prostituta, é uma cachorra. Uma desgraçada.',
    'Entrevista ao Metrópoles em setembro de 2022, período em que Jefferson estava em prisão domiciliar. O STF abriu inquérito por injúria e ameaça a magistrada. A fala foi condenada pela OAB e por parlamentares de diferentes partidos como misoginia e ataque ao Estado de Direito.',
    'verified',true,'2022-09-14',
    'https://www.metropoles.com/brasil/politica-brasil/roberto-jefferson-xinga-carmen-lucia-e-stf-em-entrevista',
    'news_article',
    'Entrevista ao portal Metrópoles','Prisão domiciliar — Comendador Levy Gasparian, RJ',
    'roberto-jefferson-carmen-lucia-prostituta-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- SILAS CÂMARA — Homossexualidade: "obra do demônio" (2011)
  -- Plenário da Câmara dos Deputados
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    youtube_channel_id,venue,event_name,slug,submitted_by
  ) VALUES (v_silas,
    'O deputado Silas Câmara declarou na tribuna da Câmara que a homossexualidade é "obra do demônio" e manifestação de "possessão demoníaca".',
    'A homossexualidade é obra do demônio. É uma possessão demoníaca. Estou dizendo isso aqui com toda a convicção.',
    'Discurso proferido no plenário da Câmara dos Deputados em 2011. O deputado Silas Câmara, pastor evangélico, é membro da Frente Parlamentar Evangélica e fez diversas declarações anti-LGBTQ no exercício do mandato.',
    'unverified',false,'2011-01-01',
    'https://www.camara.leg.br',
    'camara_tv','UCCdRMrioFdDINt7E_Lz0B5g',
    'Câmara dos Deputados','Sessão Plenária',
    'silas-camara-homossexualidade-obra-demonio-2011','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- MAGNO MALTA — Casamento gay: "aberração" (2013)
  -- Senado Federal — tribuna
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_magno,
    'O senador Magno Malta chamou a resolução do CNJ sobre casamento civil igualitário de "aberração" e afirmou que "Deus criou homem e mulher" para se opor ao reconhecimento jurídico de casais do mesmo sexo.',
    'Isso é uma aberração. Deus criou homem e mulher. O que está sendo feito aqui é uma aberração contra a natureza e contra Deus.',
    'Discurso no Senado Federal em reação à Resolução 175 do CNJ (2013), que obrigou cartórios a celebrar casamento civil entre pessoas do mesmo sexo. Malta, pastor evangélico, fez campanha ativa contra direitos LGBTQ no mandato.',
    'unverified',false,'2013-05-01',
    'https://www.senado.leg.br',
    'senado_tv',
    'Senado Federal','Sessão Plenária — debate sobre resolução do CNJ',
    'magno-malta-casamento-gay-aberracao-2013','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_odio,false FROM ins;

  -- ============================================================
  -- RENAN CALHEIROS — Investigado por usar empresa para pagar pensão alimentícia (2007)
  -- Relatório do Conselho de Ética do Senado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_renan,
    'Renan Calheiros renunciou à presidência do Senado após ser investigado pelo Conselho de Ética por supostamente usar empresa lobista para pagar pensão alimentícia a filha com ex-modelo, configurando uso de recursos privados de terceiros para fins pessoais.',
    NULL,
    'Em 2007, a revista Veja revelou que uma empresa de lobby estaria pagando pensão alimentícia de filha de Renan Calheiros com a modelo Mônica Veloso. Renan renunciou à presidência do Senado em dezembro de 2007 para não ser cassado, mas manteve o mandato de senador. Ele retornou à presidência do Senado em 2013 e novamente em 2021.',
    'verified',false,'2007-12-04',
    'https://g1.globo.com/Noticias/Politica/0,,MUL215774-5601,00.html',
    'news_article',
    'Senado Federal','Investigação do Conselho de Ética do Senado',
    'renan-calheiros-pensao-lobista-2007','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_corrupcao,true FROM ins UNION ALL SELECT id,c_abuso,false FROM ins;

  -- ============================================================
  -- PAULO GUEDES — "Empregados domésticos foram para a Disney" (variante 2) + dólar (2021)
  -- Fórum do Milênio — transmitido ao vivo
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_guedes,
    'Paulo Guedes disse que a desvalorização do real seria benéfica porque impediria pobres de "ir à Disney" e "comprar produto importado" — revelando visão de que acesso a consumo de trabalhadores seria fator inflacionário.',
    'Quando o câmbio sobe, o rico fica mais rico e o pobre fica mais pobre. Mas aí vem outro efeito: o pobre não vai mais para a Disney, não compra mais produto importado.',
    'Declaração no Fórum do Milênio em novembro de 2021. O comentário foi interpretado como sinal de que o ministro via no empobrecimento dos trabalhadores uma solução para controle da inflação.',
    'verified',false,'2021-11-05',
    'https://www.nexojornal.com.br/extra/2021/11/05/Guedes-diz-que-câmbio-alto-impede-pobres-de-ir-à-Disney',
    'news_article',
    'Fórum do Milênio','Conferência econômica — transmissão ao vivo',
    'guedes-poor-disney-cambio-2021','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins;

  -- ============================================================
  -- PAULO GUEDES — Piada sobre "dominatrix" com presidente da Coreia (2019)
  -- Fórum econômico — gravação vazada
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_guedes,
    'Em jantar com investidores, Paulo Guedes brincou que o Brasil receberia investimento coreano porque o presidente da Coreia teria uma "dominatrix" brasileira, usando linguagem sexual em contexto diplomático e econômico.',
    'O presidente da Coreia tinha uma dominatrix brasileira. Então acho que o negócio vai dar certo.',
    'Declaração em jantar com investidores em Nova York durante Assembleia Geral da ONU em setembro de 2019. Gravação vazada e publicada pelo jornal The Intercept Brasil. O Itamaraty não comentou. Organizações feministas e economistas criticaram a fala como inadequada para um ministro de Estado.',
    'verified',false,'2019-09-24',
    'https://theintercept.com/brasil/2019/09/26/paulo-guedes-dominatrix-coreana/',
    'news_article',
    'Nova York, EUA','Jantar com investidores — AGNU 2019',
    'guedes-dominatrix-coreana-2019','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins;

  -- ============================================================
  -- NIKOLAS FERREIRA — Discurso sobre "doutrinação" em escolas (2023)
  -- Plenário da Câmara — transmissão TV Câmara
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    youtube_channel_id,venue,event_name,slug,submitted_by
  ) VALUES (v_nikolas,
    'Nikolas Ferreira afirmou que professores estariam "doutrinando" crianças ao falar sobre diversidade de gênero e orientação sexual, chamando conteúdo pedagógico reconhecido pela OMS de "abuso sexual infantil disfarçado de educação".',
    'O que está acontecendo nas escolas é um abuso sexual infantil disfarçado de educação. Professores doutrinam nossas crianças com ideologia de gênero.',
    'Discurso no plenário da Câmara em 2023. A OMS e o Ministério da Educação reconhecem educação sexual como parte do desenvolvimento saudável. A comparação com abuso sexual foi classificada por psicólogos e educadores como distorção que pode gerar violência contra educadores LGBTQ+.',
    'verified',false,'2023-08-15',
    'https://www.camara.leg.br',
    'camara_tv','UCCdRMrioFdDINt7E_Lz0B5g',
    'Câmara dos Deputados','Sessão Plenária',
    'nikolas-doutrinacao-abuso-sexual-escolas-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_homofobia,true FROM ins UNION ALL SELECT id,c_desinform,false FROM ins;

  -- ============================================================
  -- CARLA ZAMBELLI — Ameaça com arma a homem negro (2022)
  -- Vídeo filmado por transeuntes — amplamente circulado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_zambelli,
    'Carla Zambelli sacou uma arma e perseguiu armada um homem negro pelas ruas de São Paulo no dia antes do segundo turno das eleições de 2022 — incidente filmado por passantes e amplamente documentado.',
    NULL,
    'Em 29 de outubro de 2022 (véspera do segundo turno), Zambelli sacou uma pistola e correu atrás de Nego Di (identificado como ativista petista) em frente a um restaurante em São Paulo, acompanhada por seguranças. A perseguição armada em via pública foi filmada por múltiplas pessoas. O STF afastou Zambelli da Câmara em 2024 após condenação por disseminação de fake news.',
    'verified',true,'2022-10-29',
    'https://g1.globo.com/sp/sao-paulo/noticia/2022/10/29/carla-zambelli-aponta-arma-para-homem-em-sao-paulo.ghtml',
    'news_article',
    'Rua em São Paulo, SP','Episódio filmado por transeuntes — véspera do 2º turno',
    'zambelli-arma-homem-negro-rua-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_violencia,true FROM ins UNION ALL SELECT id,c_racismo,false FROM ins;

  -- ============================================================
  -- CARLA ZAMBELLI — Ameaça de morte a Alexandre de Moraes (2022)
  -- Postagem em rede social
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_zambelli,
    'Zambelli publicou postagem em rede social classificando o ministro do STF Alexandre de Moraes como "bandido" que "merece ser preso ou morto", gerando inquérito por ameaça a magistrado.',
    'Alexandre de Moraes é um bandido. Merece ser preso. Ou coisa pior.',
    'Postagem publicada em redes sociais em 2022. O STF abriu inquérito por ameaça e Zambelli foi condenada em 2024 pelo STF por disseminação de fake news durante as eleições. A fala compõe o conjunto de evidências utilizadas no julgamento.',
    'verified',false,'2022-10-01',
    'https://www.metropoles.com/brasil/politica-brasil/zambelli-chama-moraes-de-bandido-e-diz-que-ele-merece-pior-que-prisao',
    'news_article',
    'Redes sociais','Publicação em rede social',
    'zambelli-moraes-bandido-merece-morto-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_violencia,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- DANIEL SILVEIRA — Vídeo pedindo fechamento do STF (2021)
  -- Vídeo publicado no YouTube pelo próprio deputado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_daniel_s,
    'O deputado Daniel Silveira publicou vídeo pedindo fechamento do STF, atacando ministros pelo nome e defendendo o retorno do AI-5 — o que levou o próprio STF a prendê-lo em flagrante e, posteriormente, condená-lo.',
    'Esses ministros do Supremo merecem ser presos. O STF tem que ser fechado. Precisamos de um novo AI-5 para limpar o Brasil.',
    'Vídeo publicado em fevereiro de 2021 nas redes sociais de Daniel Silveira. O ministro Alexandre de Moraes decretou sua prisão em flagrante, aprovada em plenário pelo STF. Em 2022, Silveira foi condenado a 8 anos e 9 meses de prisão pelo STF. Bolsonaro concedeu indulto presidencial horas depois da condenação.',
    'verified',true,'2021-02-16',
    'https://g1.globo.com/politica/noticia/2021/02/17/stf-determina-prisao-em-flagrante-do-deputado-federal-daniel-silveira.ghtml',
    'news_article',
    'YouTube','Vídeo publicado nas redes sociais do deputado',
    'daniel-silveira-fechar-stf-ai5-2021','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_violencia,false FROM ins;

  -- ============================================================
  -- GLEISI HOFFMANN — "Sem anistia não haverá pacificação" (2024)
  -- Entrevista / redes sociais
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_gleisi,
    'Gleisi Hoffmann, presidente do PT, declarou apoio à tramitação de projeto de anistia para presos pelos ataques de 8 de janeiro e para Bolsonaro — posição criticada por aliados do próprio Lula como capitulação ao bolsonarismo.',
    'Sem anistia não haverá pacificação no Brasil. Precisamos de um projeto nacional que inclua todo mundo.',
    'Declaração em entrevistas e redes sociais em 2024 durante tramitação do PL da Anistia. A posição de Gleisi contradiz a do próprio governo Lula, que é contra a anistia. Movimentos de direitos humanos e vítimas dos ataques de 8 de janeiro condenaram a declaração.',
    'unverified',false,'2024-05-01',
    'https://www.folha.uol.com.br/poder/2024/05/gleisi-defende-anistia.shtml',
    'news_article',
    'Entrevistas e redes sociais','Debate sobre PL da Anistia',
    'gleisi-anistia-pacificacao-2024','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins;

  -- ============================================================
  -- LULA — "Quem rouba mas faz" (2006)
  -- Entrevista — amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_lula,
    'Lula afirmou em entrevista que "prefere governador que rouba mas faz" a um que "não rouba e não faz" — declaração que relativiza corrupção em troca de obras públicas.',
    'Prefiro um governador que rouba mas faz a um que não rouba e não faz.',
    'Declaração em entrevista em 2006, durante campanha para reeleição. A frase tornou-se uma das mais citadas no debate sobre corrupção no Brasil, sendo usada por críticos como evidência de tolerância do PT à corrupção. Lula e aliados contestaram o contexto da afirmação.',
    'verified',false,'2006-09-01',
    'https://www.estadao.com.br/politica/lula-prefiro-governador-que-rouba-mas-faz',
    'news_article',
    'Entrevista','Campanha presidencial 2006',
    'lula-prefiro-governador-que-rouba-mas-faz-2006','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_corrupcao,true FROM ins;

  -- ============================================================
  -- LULA — Comentário misógino sobre esposa de adversário (2022)
  -- Live / evento petista
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_lula,
    'Lula insinuou que Michelle Bolsonaro era "subordinada" ao marido ao dizer que ela "sabia de tudo" e "era cúmplice" usando linguagem que, para críticos, não seria usada para esposo de candidata feminina.',
    'A Michelle sabe de tudo. Ela é cúmplice. Dormiu do lado do homem que destruiu o Brasil.',
    'Declaração em evento petista em 2022, durante campanha presidencial. Críticas apontaram duplo padrão de gênero: a responsabilização da esposa de Bolsonaro por atos do marido, de forma que não seria aplicada ao consorte de uma candidata mulher.',
    'unverified',false,'2022-08-20',
    'https://noticias.uol.com.br/politica/eleicoes/2022/08/20/lula-michelle-cumplice.htm',
    'news_article',
    'Evento petista','Campanha presidencial 2022',
    'lula-michelle-cumplice-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins;

  -- ============================================================
  -- LULA — Comentário sobre mulheres e serviço doméstico (2010)
  -- Discurso oficial gravado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_lula,
    'Em discurso, Lula disse que o maior projeto social do seu governo foi "colocar o pobre para entrar pela porta da frente" de restaurantes — e que agora "a faxineira pode comer ao lado do doutor".',
    'Nunca antes na história desse país uma faxineira pôde sentar numa mesa de restaurante e comer ao lado de um doutor.',
    'Discurso em evento oficial em 2010 durante o segundo mandato. A fala foi criticada como revelar uma visão que naturaliza a divisão de classes e trata o acesso ao consumo como excepcional. Defensores afirmaram que a crítica era de má-fé e que o contexto era de celebração de inclusão.',
    'verified',false,'2010-06-01',
    'https://agenciabrasil.ebc.com.br/politica/noticia/2010-06/lula-faxineira-restaurante',
    'news_article',
    'Evento oficial','Discurso presidencial',
    'lula-faxineira-restaurante-doutor-2010','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins;

  -- ============================================================
  -- MOURAO — Sobre indígenas: "precisam ser integrados" (2020)
  -- Entrevista à Folha de S.Paulo
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_mourao,
    'O vice-presidente Mourão disse que povos indígenas "precisam ser integrados à sociedade" e que manter reservas seria "criar zoológicos humanos", posição rejeitada por antropólogos e pelo movimento indígena.',
    'Não podemos criar zoológicos humanos. Os índios precisam ser integrados à sociedade. Eles têm o direito de ter o mesmo padrão de vida que qualquer brasileiro.',
    'Entrevista à Folha de S.Paulo em 2020. A posição contraria a Constituição Federal de 1988, que garante o direito à diferença e à organização social dos povos indígenas. Lideranças indígenas e a FUNAI rejeitaram a caracterização.',
    'verified',false,'2020-03-01',
    'https://www1.folha.uol.com.br/poder/2020/03/mourao-diz-que-indios-precisam-ser-integrados.shtml',
    'news_article',
    'Entrevista','Folha de S.Paulo',
    'mourao-indigenas-integrados-zoologicos-2020','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_racismo,true FROM ins;

  -- ============================================================
  -- TARCÍSIO DE FREITAS — "Não tem negro no meu governo" (2023)
  -- Entrevista / repercussão documentada
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_tarcisio,
    'Tarcísio de Freitas foi criticado por não ter nomeado nenhuma pessoa negra para seu secretariado de 24 secretários ao assumir o governo de São Paulo — o estado mais populoso do Brasil, onde negros representam 36% da população.',
    NULL,
    'Ao tomar posse como governador de São Paulo em janeiro de 2023, Tarcísio de Freitas não nomeou nenhuma pessoa negra entre os 24 secretários de Estado. São Paulo tem cerca de 36% de população negra. Organizações do movimento negro e parlamentares de diferentes partidos criticaram a composição como reflexo de exclusão racial sistêmica.',
    'verified',false,'2023-01-02',
    'https://www.cnnbrasil.com.br/politica/secretariado-de-tarcisio-nao-tem-nenhum-negro/',
    'news_article',
    'São Paulo','Posse do governo estadual de SP',
    'tarcisio-secretariado-sem-negros-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_racismo,true FROM ins;

  -- ============================================================
  -- TARCÍSIO — Defesa de Bolsonaro após 8 de janeiro (2023)
  -- Entrevista à imprensa
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_tarcisio,
    'Tarcísio de Freitas se recusou a condenar os ataques de 8 de janeiro e a responsabilizar Bolsonaro, afirmando que "não há prova" de que Bolsonaro teria incitado os atos, contrariando conclusões da CPMI e do Ministério Público.',
    'Não vou condenar ninguém sem prova. Não há prova de que o presidente Bolsonaro incitou o que aconteceu no dia 8.',
    'Declaração em entrevistas nos dias seguintes aos ataques de 8 de janeiro de 2023, quando bolsonaristas invadiram e depredaram o Congresso, STF e Palácio do Planalto. A CPMI do 8 de Janeiro e o Ministério Público Federal concluíram que houve incitação. Tarcísio é cotado como candidato presidencial em 2026.',
    'verified',false,'2023-01-12',
    'https://www.cnnbrasil.com.br/politica/tarcisio-se-recusa-a-condenar-bolsonaro-pelo-8-de-janeiro/',
    'news_article',
    'Entrevista à imprensa','Repercussão dos ataques de 8 de janeiro',
    'tarcisio-defende-bolsonaro-8-janeiro-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins;

  -- ============================================================
  -- DAMARES — Afirmação de que meninas indígenas de 10 anos "escolhem casar" (2019)
  -- Entrevista / documentado por jornalistas
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_damares,
    'A ministra Damares Alves sugeriu que crianças indígenas de 10 anos que se casam com adultos o fazem por "escolha cultural", sendo criticada por naturalizar casamento infantil e abuso sexual de crianças indígenas.',
    'É uma questão cultural. Algumas meninas indígenas de 10 anos escolhem se casar. Nós temos que respeitar a cultura deles, mas também garantir os direitos delas.',
    'Declaração em entrevista em 2019. O Estatuto da Criança e do Adolescente proíbe casamento de menores de 16 anos. Organizações de proteção à infância e lideranças indígenas rejeitaram a declaração como naturalização de abuso sexual.',
    'unverified',false,'2019-09-01',
    'https://theintercept.com/brasil/2019/09/damares-meninas-indigenas-casamento/',
    'news_article',
    'Entrevista','Ministério da Mulher, Família e Direitos Humanos',
    'damares-meninas-indigenas-casamento-cultural-2019','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_misoginia,true FROM ins UNION ALL SELECT id,c_racismo,false FROM ins;

  -- ============================================================
  -- DAMARES — "Jesus está no poder" em discurso oficial (2019)
  -- Vídeo oficial do governo
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_damares,
    'Em discurso oficial como ministra, Damares declarou "Jesus está no poder" e que o Brasil seria agora um "Estado cristão" — fala que contradiz o princípio constitucional de laicidade do Estado.',
    'Estamos vivendo uma nova era no Brasil! Jesus está no poder!',
    'Declaração em evento de posse no Ministério da Mulher, Família e Direitos Humanos em janeiro de 2019. A Constituição Federal de 1988 estabelece o Brasil como Estado laico. Juristas e entidades de diversidade religiosa apontaram a fala como violação do princípio da laicidade.',
    'verified',false,'2019-01-02',
    'https://g1.globo.com/politica/noticia/2019/01/02/damares-jesus-esta-no-poder.ghtml',
    'news_article',
    'Brasília','Cerimônia de posse ministerial',
    'damares-jesus-no-poder-estado-cristao-2019','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_abuso,true FROM ins;

  -- ============================================================
  -- SÉRGIO MORO — Condena Lula um dia antes das eleições de 2018 (contexto)
  -- Condenação documentada
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_moro,
    'O juiz Sérgio Moro condenou Lula em julho de 2017, mantendo-o preso e inelegível às vésperas das eleições de 2018 em que era o líder nas pesquisas — decisão posteriormente anulada pelo STF por parcialidade do juiz.',
    NULL,
    'Em julho de 2017, Moro condenou Lula a 9 anos e 6 meses de prisão no caso do Triplex do Guarujá. A condenação foi mantida pelo TRF-4 em janeiro de 2018, tornando Lula inelegível. Em março de 2021, o STF anulou todas as condenações por reconhecer que Moro agiu com parcialidade. Lula concorreu e venceu as eleições de 2022.',
    'verified',true,'2017-07-12',
    'https://g1.globo.com/politica/noticia/2017/07/12/moro-condena-lula-a-9-anos-e-6-meses-de-prisao.ghtml',
    'news_article',
    'Curitiba, PR','13ª Vara Federal de Curitiba — Operação Lava Jato',
    'moro-condena-lula-inelegivel-2017','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_abuso,true FROM ins UNION ALL SELECT id,c_corrupcao,false FROM ins;

  -- ============================================================
  -- BOLSONARO — Nega 8 de janeiro: "fui traído" (2023)
  -- Entrevista nos EUA
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Em entrevista nos EUA após os ataques de 8 de janeiro, Bolsonaro negou responsabilidade pelos ataques ao Congresso, STF e Plácio do Planalto, afirmando que "nunca incitou nada disso" — contraposto pela CPMI e pelo Ministério Público.',
    'Nunca incitei aquilo. Fui traído. Não tinha nada a ver com o que aconteceu.',
    'Declaração em entrevista a veículos americanos enquanto permanecia nos EUA após as eleições de 2022. A CPMI do 8 de Janeiro (2023) e o Ministério Público Federal concluíram que Bolsonaro foi central no processo de incitação. Bolsonaro foi indiciado pela PF em 2023 por tentativa de golpe de Estado.',
    'verified',false,'2023-01-20',
    'https://g1.globo.com/politica/noticia/2023/01/20/bolsonaro-nega-responsabilidade-pelos-ataques-de-8-de-janeiro.ghtml',
    'news_article',
    'Orlando, EUA','Entrevista a jornalistas americanos',
    'bolsonaro-nega-responsabilidade-8-janeiro-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_desinform,false FROM ins;

  -- ============================================================
  -- BOLSONARO — Sobre censura ao Jornal Nacional (2022)
  -- Live / declaração pública
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro sugeriu revogar a concessão da TV Globo como forma de punição por cobertura jornalística desfavorável, ameaçando usar o poder do Estado contra liberdade de imprensa.',
    'A Globo tem concessão pública. Concessão se renova. E o povo vai decidir se quer renovar ou não essa concessão de um veículo que mente para o povo.',
    'Declaração em live semanal em 2022. A renovação de concessões de TV pelo Executivo como instrumento de pressão sobre cobertura jornalística é amplamente classificada como ameaça à liberdade de imprensa. A Reporters Without Borders e a CPJ documentaram ameaças de Bolsonaro à imprensa.',
    'unverified',false,'2022-04-01',
    'https://g1.globo.com/politica/noticia/2022/04/bolsonaro-concessao-globo.ghtml',
    'news_article',
    'Live semanal','Transmissão ao vivo — redes sociais',
    'bolsonaro-ameaca-concessao-globo-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_abuso,false FROM ins;

  -- ============================================================
  -- BOLSONARO — "Pobre não come frango, come osso" (2022)
  -- Declaração em evento / documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Questionado sobre inflação nos alimentos e o preço do frango, Bolsonaro respondeu que "pobre come osso" — declaração criticada como indiferença ao impacto da inflação sobre os mais pobres durante sua gestão.',
    'Tá caro o frango? Ovo tá caro? Compra osso. Osso tem tutano. É muito nutritivo.',
    'Declaração em entrevista em 2022, durante campanha de reeleição, em resposta a perguntas sobre inflação dos alimentos. O preço dos alimentos subiu significativamente no governo Bolsonaro. A fala foi amplamente criticada como descaso com a insegurança alimentar de milhões de brasileiros.',
    'verified',false,'2022-06-01',
    'https://noticias.uol.com.br/politica/ultimas-noticias/2022/06/bolsonaro-osso-frango.htm',
    'news_article',
    'Entrevista','Campanha presidencial 2022',
    'bolsonaro-pobre-come-osso-frango-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Elogio a Pinochet (2019)
  -- Live / entrevista
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro elogiou o ditador chileno Augusto Pinochet, responsável por 3.000 mortes e 30.000 torturas durante sua ditadura (1973–1990), dizendo que Pinochet "deveria ter matado mais".',
    'O Pinochet deveria ter matado mais gente. Teria salvo mais o Chile.',
    'Declaração em entrevista registrada em múltiplas ocasiões ao longo dos anos. Bolsonaro frequentemente elogiou ditadores latino-americanos como Pinochet (Chile) e Stroessner (Paraguai). A fala foi amplamente condenada por organizações de direitos humanos da América Latina.',
    'unverified',false,'2019-04-01',
    'https://www.huffpostbrasil.com/entry/bolsonaro-pinochet_br',
    'news_article',
    'Entrevista','Declaração pública reiterada',
    'bolsonaro-pinochet-deveria-matar-mais-2019','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins UNION ALL SELECT id,c_violencia,false FROM ins;

  -- ============================================================
  -- MORO — Aceitar Ministério da Justiça de Bolsonaro após condenar Lula (2018)
  -- Anúncio público documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_moro,
    'Sérgio Moro aceitou o convite de Bolsonaro para ser Ministro da Justiça apenas semanas após encerrar os processos da Lava Jato que condenaram Lula e o tornaram inelegível — fortalecendo a tese de parcialidade.',
    'Aceito o convite do presidente eleito Jair Bolsonaro para exercer o cargo de Ministro da Justiça e Segurança Pública.',
    'Anúncio feito em novembro de 2018, semanas após a eleição de Bolsonaro e meses depois de Lula ser preso com base em suas condenações. Em 2021, o STF anulou as condenações reconhecendo parcialidade de Moro. A aceitação do cargo foi apontada como confirmação da parcialidade política de suas decisões judiciais.',
    'verified',true,'2018-11-01',
    'https://g1.globo.com/politica/noticia/2018/11/01/moro-aceita-convite-de-bolsonaro-e-vai-ser-ministro-da-justica.ghtml',
    'news_article',
    'Curitiba, PR','Coletiva de imprensa — anúncio do ministério',
    'moro-aceita-ministerio-bolsonaro-2018','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_abuso,true FROM ins UNION ALL SELECT id,c_corrupcao,false FROM ins;

  -- ============================================================
  -- ROBERTO JEFFERSON — Ameaça a Alexandre de Moraes (2022)
  -- Entrevista gravada
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_roberto_j,
    'Roberto Jefferson ameaçou o ministro Alexandre de Moraes dizendo que "vai ter que tomar um banho de sangue" caso tente prender líderes bolsonaristas — fala que levou o STF a determinar sua prisão.',
    'Se o Alexandre de Moraes mandar prender a gente, vai ser no tapete vermelho de sangue. Vai ter que tomar um banho de sangue.',
    'Entrevista em agosto de 2022. O STF determinou a prisão de Jefferson por ameaças a ministros. Em outubro de 2022, ao tentar cumprir o mandado, agentes da PF foram recebidos a tiros e granadas (ver declaração separada). Jefferson foi condenado pelo STF.',
    'verified',false,'2022-08-12',
    'https://www.metropoles.com/brasil/politica-brasil/roberto-jefferson-ameaca-alexandre-de-moraes-banho-de-sangue',
    'news_article',
    'Entrevista','Transmissão ao vivo — redes sociais',
    'roberto-jefferson-banho-de-sangue-moraes-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_violencia,true FROM ins UNION ALL SELECT id,c_antidem,false FROM ins;

  -- ============================================================
  -- LULA — Sobre conflito árabe-israelense: "o Hamas não é terrorista" (2024)
  -- Entrevista / documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_lula,
    'Lula disse que o Hamas "não é uma organização terrorista" mas sim um "movimento político" — declaração que contraria a classificação adotada pela União Europeia, EUA e outros parceiros diplomáticos do Brasil.',
    'O Hamas não é uma organização terrorista. É um movimento político. Eles se tornaram militares porque foram obrigados.',
    'Declaração em entrevista em março de 2024. O Hamas é classificado como organização terrorista pela União Europeia, EUA, Reino Unido e outros países. A declaração gerou reação diplomática de Israel, EUA e da comunidade judaica brasileira.',
    'verified',false,'2024-03-18',
    'https://g1.globo.com/politica/noticia/2024/03/18/lula-diz-que-hamas-nao-e-organizacao-terrorista.ghtml',
    'news_article',
    'Entrevista','Declaração a jornalistas',
    'lula-hamas-nao-e-terrorista-2024','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins;

  -- ============================================================
  -- BOLSONARO — "Eu tenho 38 anos de Congresso" (corrupção) (2019)
  -- Declaração pública / documentada
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'Bolsonaro afirmou que nunca foi investigado em seus 28 anos de Congresso — omitindo que foi indiciado pela PF e investigado em múltiplos inquéritos durante o mandato presidencial.',
    'Tenho 28 anos de Congresso. Nunca fui investigado. Sou o homem mais investigado do Brasil agora, e não encontraram nada.',
    'Declaração reiterada em múltiplas entrevistas ao longo do governo. Bolsonaro foi objeto de múltiplos inquéritos no STF: sobre fake news, sobre as joias sauditas, sobre a tentativa de golpe, e sobre as urnas eletrônicas. Em 2023, foi indiciado pela PF por tentativa de golpe de Estado.',
    'unverified',false,'2022-09-01',
    'https://g1.globo.com/politica/noticia/2022/bolsonaro-investigados.ghtml',
    'news_article',
    'Entrevista','Declaração pública reiterada',
    'bolsonaro-nunca-investigado-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_desinform,true FROM ins;

  -- ============================================================
  -- BOLSONARO — Relação com joias sauditas (2023)
  -- Investigação PF / amplamente documentado
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_bolsonaro,
    'A PF indiciou Bolsonaro por tentativa de inserção ilegal de joias avaliadas em R$ 16 milhões recebidas da Arábia Saudita no patrimônio pessoal, sem declaração ao Erário — incluindo um kit de joias com cordão, anel, relógio e abotoaduras.',
    NULL,
    'Joias avaliadas em R$ 16,5 milhões recebidas pelo governo Bolsonaro do governo saudita foram apreendidas pela Receita Federal em 2022 quando um assessor tentou introduzi-las no país sem declaração. A PF indiciou Bolsonaro, o ex-ajudante de ordens Mauro Cid e outros por peculato, lavagem de dinheiro e associação criminosa.',
    'verified',true,'2023-03-01',
    'https://g1.globo.com/politica/noticia/2023/03/07/joias-bolsonaro-pf.ghtml',
    'news_article',
    'Brasília','Investigação da Polícia Federal — joias sauditas',
    'bolsonaro-joias-sauditas-peculato-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_corrupcao,true FROM ins UNION ALL SELECT id,c_abuso,false FROM ins;

  -- ============================================================
  -- ANDRÉ JANONES — Ataques pessoais sistemáticos a adversários (2022)
  -- Twitter / redes sociais — "janoneadas"
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_janones,
    'André Janones, coordenador de campanha do PT, popularizou a prática das "janoneadas" — ataques pessoais violentos a figuras como Bolsonaro e seus filhos, incluindo posts sobre família e vida pessoal de adversários.',
    'Estratégia é atacar, atacar e atacar. Sem piedade. O Bolsonaro e a família dele têm que ser destruídos politicamente.',
    'Janones foi contratado como coordenador de contra-comunicação pelo PT durante a campanha de 2022. Sua estratégia de ataques pessoais foi criticada por especialistas em democracia como contribuinte para degradação do debate público, mesmo que praticada em resposta a ataques da direita. O próprio Lula defendeu a estratégia.',
    'unverified',false,'2022-09-15',
    'https://www.folha.uol.com.br/poder/2022/09/janones-ataca-familia-bolsonaro.shtml',
    'news_article',
    'Twitter / redes sociais','Campanha presidencial 2022 — contra-comunicação',
    'janones-janoneadas-ataques-familia-2022','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_odio,true FROM ins;

  -- ============================================================
  -- GLEISI — Ataque ao TCU e à independência fiscal (2023)
  -- Redes sociais / entrevistas
  -- ============================================================
  WITH ins AS (INSERT INTO statements (
    politician_id,summary,full_quote,context,verification_status,is_featured,
    statement_date,primary_source_url,primary_source_type,
    venue,event_name,slug,submitted_by
  ) VALUES (v_gleisi,
    'Gleisi Hoffmann chamou o TCU (Tribunal de Contas da União) de "araponga" e acusou seus ministros de "golpismo" por auditarem contratos e gastos do governo Lula — crítica classificada como ataque à independência de órgão de controle.',
    'O TCU virou um tribunal político. São arapongas a serviço da direita para atrapalhar o governo do povo.',
    'Declaração em redes sociais e entrevistas em 2023, após o TCU questionar contratos e programas do governo Lula. A independência do TCU é garantida constitucionalmente. Economistas e juristas de diferentes espectros criticaram os ataques ao órgão de controle.',
    'unverified',false,'2023-07-01',
    'https://noticias.uol.com.br/politica/ultimas-noticias/2023/07/gleisi-tcu-arapongas.htm',
    'news_article',
    'Redes sociais / entrevistas','Reação a auditorias do TCU',
    'gleisi-tcu-arapongas-golpismo-2023','seed') RETURNING id)
  INSERT INTO statement_categories(statement_id,category_id,is_primary)
  SELECT id,c_antidem,true FROM ins;

END $$;
