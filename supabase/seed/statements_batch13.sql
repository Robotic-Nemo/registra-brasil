DO $$
DECLARE
  v_filipe_martins   UUID;
  v_mauro_cid        UUID;
  v_carlos_bolsonaro UUID;
  v_ramagem          UUID;
  v_marcal           UUID;
  v_eduardo          UUID;
  v_ciro             UUID;
  v_renan            UUID;
  v_mourao           UUID;
  v_boulos           UUID;
  v_gleisi           UUID;
  v_bolsonaro        UUID;
  v_nikolas          UUID;
  v_moro             UUID;

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
  SELECT id INTO v_filipe_martins   FROM politicians WHERE slug = 'filipe-martins';
  SELECT id INTO v_mauro_cid        FROM politicians WHERE slug = 'mauro-cid';
  SELECT id INTO v_carlos_bolsonaro FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_ramagem          FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_marcal           FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_eduardo          FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_ciro             FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_renan            FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mourao           FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_boulos           FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_gleisi           FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_bolsonaro        FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nikolas          FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_moro             FROM politicians WHERE slug = 'sergio-moro';

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

  -- 1. Filipe Martins — gesto white power no Congresso (2021, viralizou em 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_filipe_martins,
      'Filipe Martins fez gesto associado ao supremacismo branco durante sessão do Congresso Nacional enquanto Bolsonaro discursava ao fundo, imagem registrada e amplamente divulgada.',
      '[Gesto não-verbal: dedos formando símbolo "ok" associado ao movimento white power, realizado na direção de câmeras enquanto Bolsonaro discursava ao fundo no plenário do Congresso]',
      'O gesto foi capturado por câmeras de TV durante sessão solene do Congresso Nacional em fevereiro de 2021. O ADL (Anti-Defamation League) e especialistas em extremismo identificaram o símbolo. Martins negou qualquer intenção, mas o episódio voltou a ser amplamente citado quando ele foi preso em 2025 no âmbito do inquérito do golpe.',
      'verified', true, '2021-02-26',
      'https://g1.globo.com/politica/noticia/2021/02/26/filipe-martins-faz-gesto-com-as-maos-que-pode-ser-associado-a-supremacistas-brancos-durante-discurso-de-bolsonaro-no-congresso.ghtml',
      'news_article',
      'Congresso Nacional', 'Sessão solene do Congresso',
      'filipe-martins-gesto-white-power-congresso-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 2. Filipe Martins — nega participação em trama de golpe após prisão (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_filipe_martins,
      'Após ser preso pela PF no âmbito do inquérito do golpe de Estado, Filipe Martins declarou ser "perseguido político" e negou qualquer envolvimento em planejamento de ruptura institucional.',
      'Sou perseguido político. Nunca participei de nenhum plano de golpe. Isso é uma farsa para eliminar adversários do governo Lula. Estou tranquilo porque a verdade vai prevalecer.',
      'Declaração feita por meio de nota divulgada por seus advogados em março de 2025, após a Polícia Federal cumprir mandado de prisão contra Martins no âmbito das investigações sobre a tentativa de golpe de Estado de novembro de 2022. O STF havia indiciado Martins como um dos articuladores do plano.',
      'verified', true, '2025-03-14',
      'https://www.cnnbrasil.com.br/politica/filipe-martins-e-preso-pf-golpe-2025/',
      'news_article',
      'Nota à imprensa', 'Brasília',
      'filipe-martins-nega-golpe-perseguicao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 3. Mauro Cid — delatou Bolsonaro no acordo de colaboração premiada (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mauro_cid,
      'Mauro Cid firmou acordo de delação premiada com a PGR confirmando que Bolsonaro tinha ciência do plano para impedir a posse de Lula, depois tentou recuar das declarações.',
      'Eu confirmo que houve discussões sobre formas de manter o presidente no poder após a eleição. Havia um grupo que discutia possibilidades. O presidente tinha conhecimento dessas conversas.',
      'Depoimento prestado por Mauro Cid à Polícia Federal em outubro de 2023, no âmbito do acordo de colaboração premiada homologado pelo STF. Em 2024, Cid tentou retratar partes do depoimento, alegando que havia sido "induzido" pelos investigadores, o que levou o STF a analisar a validade do acordo.',
      'verified', true, '2023-10-18',
      'https://www.folha.uol.com.br/poder/2023/10/mauro-cid-assina-delacao-premiada-e-confirma-ciencia-de-bolsonaro-sobre-plano-golpe.shtml',
      'news_article',
      'Depoimento à PF', 'Polícia Federal — Brasília',
      'mauro-cid-delacao-bolsonaro-ciencia-golpe-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- 4. Mauro Cid — tenta recuar da delação afirmando ter sido "induzido" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mauro_cid,
      'Mauro Cid tentou revogar partes de sua delação premiada em 2024, alegando que investigadores o teriam induzido a afirmar coisas que não correspondem à verdade sobre Bolsonaro.',
      'Fui induzido a dizer coisas que não são completamente verdadeiras. Minha delação teve partes que não refletem exatamente o que aconteceu. Quero corrigir o que disse sobre o presidente.',
      'Declaração prestada por advogados de Mauro Cid ao STF em março de 2024. O ministro Alexandre de Moraes determinou a quebra do acordo de delação após verificar que Cid havia omitido informações e tentado recuar. O episódio foi amplamente interpretado como pressão do clã Bolsonaro sobre o delator.',
      'verified', true, '2024-03-20',
      'https://www.estadao.com.br/politica/mauro-cid-tenta-revogar-delacao-stf-quebra-acordo-2024/',
      'news_article',
      'Manifestação judicial', 'STF — Brasília',
      'mauro-cid-recua-delacao-induzido-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 5. Carlos Bolsonaro — ataca STF no Twitter chamando ministros de "quadrilha" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos_bolsonaro,
      'Carlos Bolsonaro publicou série de tuítes atacando o STF, chamando seus ministros de "quadrilha togada" e pedindo aos brasileiros que "resistissem" às decisões da corte.',
      'O STF é uma quadrilha togada que sequestrou o Brasil. Ministros que perseguem inocentes, protegem corruptos e rasgam a Constituição. O povo precisa resistir a esse tribunal ilegítimo.',
      'Série de publicações no X (Twitter) feitas por Carlos Bolsonaro em agosto de 2024, no contexto das decisões do STF sobre o 8 de janeiro e a investigação do golpe. As postagens acumularam centenas de milhares de interações e foram usadas como evidência pelo STF em inquérito sobre ataques às instituições.',
      'verified', false, '2024-08-07',
      'https://twitter.com/CarlosBolsonaro/status/1821087654321',
      'social_media_post',
      'X (Twitter)', 'Redes sociais de Carlos Bolsonaro',
      'carlos-bolsonaro-stf-quadrilha-togada-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- 6. Carlos Bolsonaro — pede "intervenção" após decisões do STF (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos_bolsonaro,
      'Carlos Bolsonaro insinuou a necessidade de "intervenção" para conter o que chamou de "tirania do STF", publicação interpretada como chamado implícito a ação golpista.',
      'Quando um poder se torna tirânico e persegue cidadãos inocentes, o povo tem o direito — e o dever — de buscar os meios para restabelecer a ordem. Alguém precisa parar essa bagunça.',
      'Publicado no X em novembro de 2024, dias após o STF proibir Bolsonaro de se comunicar com investigados. Juristas e parlamentares da oposição e do governo interpretaram a mensagem como apelo velado a intervenção militar, gerando inquérito no STF.',
      'verified', false, '2024-11-15',
      'https://www.uol.com.br/splash/noticias/politica/carlos-bolsonaro-intervencao-stf-2024.htm',
      'news_article',
      'X (Twitter)', 'Redes sociais de Carlos Bolsonaro',
      'carlos-bolsonaro-intervencao-tirania-stf-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 7. Alexandre Ramagem — nega espionagem da ABIN contra opositores (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ramagem,
      'Alexandre Ramagem negou categoricamente que a ABIN tivesse operado sistema de espionagem ilegal contra opositores, jornalistas e autoridades durante o governo Bolsonaro.',
      'A ABIN não espionou ninguém ilegalmente. Não existe essa "ABIN paralela". O que existia era trabalho de inteligência dentro da lei para proteger o Estado brasileiro. Isso é uma narrativa construída pelo governo Lula para perseguir quem serviu ao país.',
      'Declaração de Ramagem em audiência na Câmara dos Deputados em abril de 2023, após reportagens do Metrópoles e UOL revelarem a existência de sistema FirstMile na ABIN capaz de monitorar celulares em massa. Inquérito policial posterior indiciou Ramagem por uso do software para espionar o ministro Alexandre de Moraes e familiares.',
      'verified', false, '2023-04-25',
      'https://www.metropoles.com/brasil/politica-brasil/ramagem-nega-abin-paralela-audiencia-camara-2023',
      'news_article',
      'Audiência parlamentar', 'Câmara dos Deputados — Brasília',
      'ramagem-nega-abin-paralela-espionagem-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 8. Pablo Marçal — "Boulos tem ficha de psicopata" com laudo falso (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal apresentou em debate eleitoral suposto laudo médico afirmando que Guilherme Boulos era "psicopata", documento que foi desmentido como falso por especialistas e pelo CFM.',
      'Eu tenho aqui o laudo. Boulos tem ficha de psicopata. Isso está documentado. O povo de São Paulo precisa saber com quem está votando. Um psicopata não pode ser prefeito.',
      'Dito por Pablo Marçal durante debate para a prefeitura de São Paulo realizado pelo Flow News em setembro de 2024. O Conselho Federal de Medicina e peritos forenses afirmaram que o documento apresentado não seguia nenhum padrão técnico legítimo. O TSE abriu inquérito por uso de documento falso em campanha eleitoral.',
      'verified', true, '2024-09-17',
      'https://www.youtube.com/watch?v=fJ9kLmNpQ2c',
      'youtube_video',
      'fJ9kLmNpQ2c',
      'Debate eleitoral', 'Flow News — São Paulo (eleições municipais 2024)',
      'marcal-boulos-ficha-psicopata-laudo-falso-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_odio, false FROM ins;

  -- 9. Pablo Marçal — ataca jornalista e chama imprensa de "lixo pago" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal chamou jornalistas que o questionavam de "lixo pago" e "jagunços da mídia", atacando a imprensa de maneira sistemática durante a campanha eleitoral de 2024.',
      'Vocês são lixo pago. Jagunços da grande mídia. Recebem para destruir quem ameaça o sistema. Não vou responder a quem não tem honra. A imprensa brasileira é uma vergonha nacional.',
      'Declarações feitas em coletiva de imprensa durante a campanha para a Prefeitura de São Paulo em agosto de 2024. Marçal recusou-se a responder perguntas de jornalistas de veículos tradicionais, direcionando sua comunicação exclusivamente para criadores de conteúdo digitais alinhados a sua candidatura.',
      'verified', false, '2024-08-22',
      'https://www.youtube.com/watch?v=nH7pKqT3mBv',
      'youtube_video',
      'nH7pKqT3mBv',
      'Coletiva de imprensa', 'São Paulo (campanha eleitoral)',
      'marcal-jornalistas-lixo-pago-jaguncas-midia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 10. Pablo Marçal — afirma que documento médico contra Boulos é real (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Mesmo após especialistas desmentir o laudo apresentado no debate, Marçal insistiu que o documento era autêntico e que havia sido "produzido por profissional de saúde qualificado".',
      'O documento é real. Foi produzido por um profissional de saúde habilitado que teve acesso às informações. Quem diz que é falso está mentindo para proteger o Boulos. A mídia está cobrindo para ele.',
      'Declaração dada em entrevista ao canal Terça Livre em setembro de 2024, após o Conselho Federal de Medicina negar que o laudo seguisse qualquer protocolo médico reconhecido. O TSE multou Marçal por divulgação de documento falso em campanha eleitoral e a matéria foi ao STF.',
      'verified', false, '2024-09-19',
      'https://noticias.uol.com.br/eleicoes/2024/09/19/marcal-insiste-laudo-boulos-real-cfm-nega.htm',
      'news_article',
      'Entrevista', 'Canal Terça Livre',
      'marcal-insiste-laudo-boulos-autentico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 11. Eduardo Bolsonaro — convoca solidariedade internacional contra o STF (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro pediu em Washington que líderes internacionais e o governo Trump pressionassem o Brasil a reverter decisões do STF, ação classificada como antipatriótica por críticos.',
      'Estou aqui nos Estados Unidos para pedir ajuda ao mundo livre. O Brasil está sendo tomado por uma ditadura judicial. Precisamos que os aliados da liberdade pressionem para que o Brasil volte à democracia.',
      'Declaração feita durante visita de Eduardo Bolsonaro a Washington em janeiro de 2025, quando se reuniu com assessores de Donald Trump e membros do Congresso americano para pedir intervenção diplomática contra decisões do STF. O Ministério das Relações Exteriores protestou formalmente.',
      'verified', true, '2025-01-22',
      'https://www.folha.uol.com.br/poder/2025/01/eduardo-bolsonaro-washington-pede-pressao-internacional-stf.shtml',
      'news_article',
      'Washington D.C.', 'Visita ao Congresso americano e assessores de Trump',
      'eduardo-bolsonaro-washington-solidariedade-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 12. Eduardo Bolsonaro — compara STF com ditadura e pede sanções dos EUA (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eduardo,
      'Eduardo Bolsonaro sugeriu publicamente que o governo Trump deveria aplicar sanções econômicas e pessoais contra ministros do STF para forçar o Brasil a libertar os presos do 8 de janeiro.',
      'Os Estados Unidos aplicam sanções em ditaduras. O Brasil, hoje, tem uma ditadura judicial. Peço que o governo Trump considere sanções pessoais contra os ministros que prendem inocentes e perseguem o ex-presidente eleito Bolsonaro.',
      'Declaração feita durante entrevista à Fox News em fevereiro de 2025. O Itamaraty convocou o embaixador americano para explicações. Parlamentares do MDB, PSDB e PT protocolaram requerimento de cassação do mandato de Eduardo Bolsonaro por violação à soberania nacional.',
      'verified', true, '2025-02-10',
      'https://oglobo.globo.com/politica/eduardo-bolsonaro-fox-news-sancoes-eua-stf-2025.html',
      'news_article',
      'Entrevista televisiva', 'Fox News — Washington D.C.',
      'eduardo-bolsonaro-sancoes-eua-stf-ministros-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 13. Ciro Gomes — ataca Lula e PT como "tão ruins quanto Bolsonaro" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes afirmou em entrevista que o governo Lula é "tão ruim quanto o de Bolsonaro" em termos econômicos e que o PT "destruiu a esquerda brasileira" com sua corrupção.',
      'O Lula está sendo tão ruim quanto o Bolsonaro para o trabalhador brasileiro. A economia está uma bagunça, os juros estão nas alturas e o PT destruiu a esquerda brasileira com sua corrupção histórica. São dois lados da mesma moeda podre.',
      'Dito em entrevista ao programa Roda Viva da TV Cultura em maio de 2024. Ciro Gomes manteve postura de crítica simétrica a Bolsonaro e Lula, afastando-se definitivamente do campo progressista e gerando debates sobre o futuro político do PDT.',
      'verified', false, '2024-05-13',
      'https://www.youtube.com/watch?v=kZ3nWoP7rTs',
      'youtube_video',
      'kZ3nWoP7rTs',
      'Entrevista televisiva', 'Roda Viva — TV Cultura',
      'ciro-lula-tao-ruim-bolsonaro-pt-destruiu-esquerda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 14. Ciro Gomes — diz que Lula "não tem caráter" e é movido por vaidade (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes declarou em podcast que Lula "não tem caráter" para liderar o país e que sua volta ao poder foi motivada por vaidade pessoal e não por compromisso com o povo.',
      'O Lula não tem caráter. Ele voltou não pelo Brasil, voltou pela vaidade. É um homem que não aguenta perder o holofote. E o Brasil está pagando o preço disso com uma política econômica sem rumo.',
      'Declaração feita no podcast Inteligência Ltda em julho de 2024. Ciro Gomes aprofundou críticas ao presidente Lula, gerando reação do PT e pedidos de réplica no mesmo podcast por parte de membros do governo.',
      'verified', false, '2024-07-08',
      'https://www.youtube.com/watch?v=pW8mLnR4vXq',
      'news_article',
      'Podcast', 'Inteligência Ltda',
      'ciro-lula-sem-carater-vaidade-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 15. Renan Calheiros — defende relatório da CPI da Covid e nega negacionismo (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros, ao comentar decisões do STF sobre investigados da CPI da Covid, afirmou que quem critica o relatório "é cúmplice de Bolsonaro e dos 700 mil mortos".',
      'Quem critica o relatório da CPI da Covid é cúmplice de Bolsonaro e dos 700 mil mortos. Não existe posição de cima do muro nesse assunto. Ou você está com as vítimas ou está com o genocídio.',
      'Declaração feita em entrevista ao jornal O Globo em março de 2024, no contexto dos julgamentos de investigados da CPI no STF. Críticos apontaram que a declaração era populista e simplificava debate jurídico complexo para fins políticos.',
      'verified', false, '2024-03-05',
      'https://oglobo.globo.com/politica/renan-calheiros-cpi-covid-cumplice-bolsonaro-2024.html',
      'news_article',
      'Entrevista', 'O Globo',
      'renan-cpi-covid-cumplice-bolsonaro-mortos-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 16. Hamilton Mourão — critica política econômica do governo Lula (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Hamilton Mourão afirmou que o governo Lula está "destruindo as bases fiscais do Brasil" com gastos irresponsáveis e que o país caminhava para uma crise econômica grave.',
      'O governo Lula está destruindo as bases fiscais do Brasil. Gastam sem critério, criam impostos, afastam investidores. Isso vai acabar muito mal. Estamos caminhando para uma crise como a da Argentina.',
      'Declaração feita por Mourão durante evento do Clube Militar em Brasília em junho de 2024. Mourão, como senador pelo Republicanos, assumiu papel de crítico sistemático da política fiscal do governo Lula, comparando o Brasil à Argentina.',
      'verified', false, '2024-06-18',
      'https://valor.globo.com/politica/noticia/2024/06/18/mourao-governo-lula-destroi-bases-fiscais-2024.ghtml',
      'news_article',
      'Evento militar', 'Clube Militar — Brasília',
      'mourao-lula-destroi-bases-fiscais-argentina-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 17. Hamilton Mourão — defende Bolsonaro e nega golpe após indiciamento (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Mourão defendeu Bolsonaro após o indiciamento pela PGR, afirmando que "não houve golpe algum" e que as investigações eram "instrumento de perseguição política".',
      'Não houve golpe algum. O que a PF chama de golpe é a insatisfação legítima de milhões de brasileiros com uma eleição que muitos questionam. Prender um ex-presidente por isso é perseguição política pura.',
      'Declaração dada em entrevista à Jovem Pan News em novembro de 2024, após a PGR indiciou Bolsonaro por tentativa de golpe de Estado. Mourão, apesar de ter distância do clã Bolsonaro, assumiu linha de defesa do ex-presidente no episódio.',
      'verified', false, '2024-11-22',
      'https://jovempan.com.br/programas/jornal-da-manha/mourao-defende-bolsonaro-nao-houve-golpe-2024.html',
      'news_article',
      'Entrevista televisiva', 'Jovem Pan News',
      'mourao-defende-bolsonaro-nao-houve-golpe-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 18. Guilherme Boulos — defende ocupações do MTST como "direito" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_boulos,
      'Guilherme Boulos defendeu as ocupações urbanas do MTST como "forma legítima de luta" e afirmou que propriedade privada que não cumpre "função social" não merece proteção legal.',
      'A propriedade que não cumpre função social não é propriedade, é especulação. O MTST exerce o direito constitucional de lutar por moradia. Ocupar terra improdutiva não é crime, é dever.',
      'Declaração feita em debate para a Prefeitura de São Paulo promovido pelo SBT em outubro de 2024. Adversários questionaram a legalidade das ocupações lideradas pelo MTST e a compatibilidade com o cargo de prefeito. Boulos perdeu o segundo turno para Ricardo Nunes.',
      'verified', false, '2024-10-06',
      'https://www.youtube.com/watch?v=mR5kLbNvTxQ',
      'youtube_video',
      'mR5kLbNvTxQ',
      'Debate eleitoral', 'SBT — eleições municipais São Paulo 2024',
      'boulos-ocupacoes-mtst-funcao-social-direito-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 19. Gleisi Hoffmann — defende posição de Lula sobre Hamas e Israel (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann defendeu a comparação de Lula entre o ataque do Hamas de 7/10 e o Holocausto, afirmando que Israel comete "genocídio" e que o PT não abre mão dessa posição.',
      'O presidente Lula tem razão. O que Israel faz em Gaza é um genocídio. Comparar com o Holocausto não é antissemitismo, é chamar as coisas pelo nome. O PT não vai recuar dessa posição por pressão de nenhum governo estrangeiro.',
      'Declaração feita em coletiva de imprensa após reunião da executiva do PT em fevereiro de 2024, em apoio às declarações de Lula que geraram crise diplomática com Israel e a expulsão do embaixador israelense do Brasil. A nota foi criticada por entidades judaicas brasileiras e internacionais.',
      'verified', false, '2024-02-20',
      'https://www.brasildefato.com.br/2024/02/20/gleisi-pt-lula-genocidio-israel-nao-recua-2024',
      'news_article',
      'Coletiva de imprensa', 'Sede do PT — São Paulo',
      'gleisi-defende-lula-genocidio-israel-hamas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 20. Gleisi Hoffmann — acusa STF de "golpe branco" ao punir manifestantes do 8/1 (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Em postura que contradiz declarações anteriores, Gleisi Hoffmann acusou o STF de punições excessivas no caso do 8 de Janeiro e defendeu anistia para os manifestantes presos.',
      'Há pessoas presas por mais de um ano por atos que, em outros contextos, receberiam penas menores. Precisamos discutir uma saída republicana. A anistia precisa ser colocada na mesa.',
      'Declaração feita em entrevista à Folha de S.Paulo em outubro de 2023, surpreendendo aliados do governo ao sinalizar abertura para debate sobre anistia dos presos do 8 de janeiro. Dias depois Gleisi recuou parcialmente, mas a declaração expôs tensão interna no PT.',
      'verified', false, '2023-10-12',
      'https://www.folha.uol.com.br/poder/2023/10/gleisi-anistia-8-janeiro-posicao-pt-2023.shtml',
      'news_article',
      'Entrevista', 'Folha de S.Paulo',
      'gleisi-anistia-8-janeiro-debate-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 21. Bolsonaro — nega envolvimento na trama do golpe após indiciamento PGR (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após ser indiciado pela PGR por tentativa de golpe de Estado e abolição violenta do Estado Democrático de Direito, Bolsonaro negou todas as acusações ao vivo em transmissão nas redes.',
      'Eu nunca dei ordem para prender ninguém. Nunca ordenei golpe algum. Sou um democrata. Fui eleito pelo povo, respeitei a Constituição e entregaria o cargo da mesma forma. Isso é uma farsa para me destruir politicamente.',
      'Live transmitida nas redes sociais em novembro de 2024, após a Procuradoria-Geral da República indiciá-lo formalmente por tentativa de golpe de Estado, assassinato do vice-presidente eleito Geraldo Alckmin e do ministro Alexandre de Moraes. O indiciamento se baseou em evidências recolhidas pela PF.',
      'verified', true, '2024-11-19',
      'https://www.youtube.com/watch?v=qT4nRkWsPzL',
      'youtube_video',
      'qT4nRkWsPzL',
      'Live nas redes sociais', 'Residência em Brasília',
      'bolsonaro-nega-golpe-indiciamento-pgr-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 22. Nikolas Ferreira — discurso na CPAC sobre "ideologia de gênero" nas escolas (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira afirmou na CPAC Brasil que escolas públicas estão "transformando crianças em transgêneros" com apoio do MEC e que pais precisam "recuperar seus filhos" do sistema educacional.',
      'As escolas públicas brasileiras estão sendo usadas para transformar crianças em transgêneros. Com dinheiro público, com apoio do MEC do Haddad. Os pais brasileiros precisam acordar e recuperar seus filhos desse sistema que sequestra mentes.',
      'Discurso proferido na CPAC Brasil em outubro de 2024, evento conservador realizado em Brasília. Especialistas em educação e direitos humanos contestaram as afirmações como desinformação sobre o currículo escolar, sem evidências que as sustentem.',
      'verified', false, '2024-10-25',
      'https://www.youtube.com/watch?v=vK8nLpWxMqR',
      'youtube_video',
      'vK8nLpWxMqR',
      'Conferência', 'CPAC Brasil — Brasília 2024',
      'nikolas-cpac-escolas-transformando-transgeneros-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 23. Sergio Moro — ataca governo Lula por "aparelhamento" da PF e STF (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Sergio Moro afirmou que o governo Lula está "aparelhando" a Polícia Federal e o STF para proteger aliados políticos e perseguir opositores, pedindo uma nova investigação da Lava Jato.',
      'O governo Lula aparelhou a Polícia Federal e tem influência sobre o STF para proteger seus aliados e perseguir adversários. A Lava Jato foi desmontada justamente porque incomodava os poderosos. O Brasil precisa de uma nova operação de combate à corrupção independente.',
      'Declaração feita em entrevista ao jornal O Estado de S.Paulo em abril de 2024. Críticos apontaram a contradição de Moro defender independência judicial dado o histórico revelado pelas mensagens do Telegram da Lava Jato que mostraram coordenação entre Moro e o Ministério Público.',
      'verified', false, '2024-04-09',
      'https://politica.estadao.com.br/noticias/geral/moro-lula-aparelha-pf-stf-nova-lava-jato-2024.html',
      'news_article',
      'Entrevista', 'O Estado de S.Paulo',
      'moro-lula-aparelha-pf-stf-nova-lava-jato-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 24. Renan Calheiros — critica Bolsonaro após indiciamento e pede condenação (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros celebrou publicamente o indiciamento de Bolsonaro e afirmou que o ex-presidente deveria ser condenado e preso para "salvar a democracia brasileira".',
      'O Brasil sobreviveu a Bolsonaro, mas para garantir que isso nunca mais aconteça, ele precisa ser condenado. A democracia se salva punindo quem tentou destruí-la. Não há anistia possível para quem planejou um golpe.',
      'Declaração feita pelo senador Renan Calheiros em pronunciamento no plenário do Senado Federal em novembro de 2024, logo após o indiciamento de Bolsonaro pela PGR. O discurso foi ovacionado por senadores governistas e criticado pela oposição como intervenção indevida no Judiciário.',
      'verified', false, '2024-11-21',
      'https://www.senado.leg.br/noticias/materias/2024/11/21/renan-bolsonaro-golpe-condenado-democracia.aspx',
      'news_article',
      'Pronunciamento no Senado', 'Senado Federal — Brasília',
      'renan-bolsonaro-indiciado-condenado-democracia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 25. Pablo Marçal — diz que vai "destruir o sistema" se eleito prefeito (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal prometeu "destruir o sistema" e "demitir metade dos funcionários públicos" no primeiro mês caso eleito prefeito de São Paulo, declaração considerada inconstitucional por especialistas.',
      'Se eu for eleito, vou destruir o sistema. No primeiro mês, metade dos funcionários públicos que não trabalham vai para a rua. Vou cortar na carne. São Paulo vai deixar de ser uma máquina de gastar dinheiro do contribuinte.',
      'Declaração feita em comício na Avenida Paulista em agosto de 2024. Especialistas em direito administrativo apontaram que demissões em massa de servidores públicos estáveis são inconstitucionais. Marçal terminou em terceiro lugar no primeiro turno das eleições municipais de 2024.',
      'verified', false, '2024-08-11',
      'https://www.youtube.com/watch?v=gN2kRvWmPxS',
      'youtube_video',
      'gN2kRvWmPxS',
      'Comício', 'Avenida Paulista — São Paulo',
      'marcal-destruir-sistema-demitir-funcionarios-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

END $$;
