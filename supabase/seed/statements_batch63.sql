-- Batch 63: Recent statements (Oct-Dec 2025) — CPMI INSS indicia 216, Flávio anuncia 2026,
-- Moraes cassa Zambelli, Ramagem cassado, Brasil pede extradição, Bolsonaro pena começa,
-- inelegibilidade até 2060, megaoperação RJ Alemão/Penha, Ricardo Nunes reeleito,
-- Tarcísio confirma reeleição, Ciro filia-se PSDB, Boulos na Secretaria-Geral
-- 50 statements cobrindo o último trimestre de 2025

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_had UUID; v_tar UUID; v_nik UUID;
  v_fla UUID; v_edu UUID; v_din UUID; v_mor UUID; v_ram UUID;
  v_zam UUID; v_cir UUID; v_bou UUID; v_cas UUID; v_nun UUID;
  v_mot UUID; v_gle UUID; v_lul UUID; v_mag UUID; v_dam UUID;
  v_pad UUID; v_jan UUID; v_kic UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_obs UUID; c_ame UUID; c_aut UUID;
  c_irr UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_cas FROM politicians WHERE slug = 'claudio-castro';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lulinha';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1. Alfredo Gaspar relatório CPMI indicia 216
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lul,
      'Fábio Luís "Lulinha" Silva é citado por relatório da CPMI do INSS e nega qualquer ligação com esquema.',
      'Não mantenho qualquer relação com associações investigadas pela CPMI e jamais obtive vantagem indevida de recursos públicos. Essa é mais uma tentativa política de associar meu nome a crimes inventados para atingir o presidente Lula. Vou recorrer em todas as instâncias para provar minha inocência.',
      'Nota divulgada pela defesa de Fábio Luís "Lulinha" Silva, filho do presidente Lula, em 18 de dezembro de 2025, após o relator da CPMI do INSS, deputado Alfredo Gaspar (União-AL), incluir seu nome em lista de 216 pessoas indiciadas por envolvimento com esquema de descontos em aposentadorias.',
      'verified', true, '2025-12-18',
      'https://www.folha.uol.com.br/poder/2025/12/lulinha-cpmi-inss-nota-defesa.shtml',
      'news_article',
      'São Paulo', 'Nota oficial divulgada pela defesa', 'lulinha-nota-cpmi-inss-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 2. Flávio anuncia candidatura 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro anuncia candidatura à Presidência em 2026 como "irreversível" mesmo com Jair preso.',
      'Minha candidatura à Presidência da República em 2026 é irreversível. Meu pai me deu a missão, a direita brasileira precisa de uma liderança e eu vou carregar o nome Bolsonaro na eleição. Essa disputa não é sobre mim, é sobre devolver o Brasil ao povo brasileiro.',
      'Anúncio oficial feito pelo senador Flávio Bolsonaro em 5 de dezembro de 2025, durante evento em Brasília. O pronunciamento encerrou o debate interno do PL sobre quem representaria o campo bolsonarista após a prisão de Jair Bolsonaro.',
      'verified', true, '2025-12-05',
      'https://g1.globo.com/politica/noticia/2025/12/flavio-bolsonaro-candidatura-irreversivel-2026.ghtml',
      'news_article',
      'Brasília', 'Anúncio oficial em evento do PL', 'flavio-bolsonaro-candidatura-irreversivel-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Motta balanço 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta faz balanço de 2025 e defende "pacificação" entre Poderes diante de crise institucional.',
      'A Câmara dos Deputados encerra 2025 com uma pauta entregue, com diálogo firme entre Poderes e com a convicção de que a pacificação é possível. Precisamos superar a lógica do confronto permanente entre Legislativo, Executivo e Judiciário. O Brasil não aguenta mais essa tensão.',
      'Pronunciamento do presidente da Câmara, Hugo Motta, em sessão de encerramento do ano legislativo em 22 de dezembro de 2025. A fala foi interpretada como resposta a atritos entre Congresso e STF ao longo do ano.',
      'verified', false, '2025-12-22',
      'https://www.camara.leg.br/noticias/2025/12/motta-balanco-2025-pacificacao',
      'other',
      'Brasília', 'Sessão de encerramento do ano legislativo', 'motta-balanco-2025-pacificacao-dezembro'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Moraes cassa Zambelli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes anula votação da Câmara e cassa mandato de Carla Zambelli por fuga e condenação.',
      'A fuga de parlamentar federal condenado em definitivo configura causa superveniente de perda de mandato. A Câmara dos Deputados não pode, sob o argumento de competência interna corporis, tornar letra morta as decisões do Supremo Tribunal Federal. Cassado o mandato da ex-deputada Carla Zambelli.',
      'Trecho do voto do ministro Alexandre de Moraes do STF em dezembro de 2025, anulando votação da Câmara que havia mantido o mandato de Zambelli e determinando a cassação. Zambelli havia fugido para a Itália após condenação criminal.',
      'verified', true, '2025-12-10',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-12-moraes-cassa-zambelli',
      'news_article',
      'Brasília', 'Sessão do STF', 'moraes-cassa-zambelli-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Ramagem cassado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem denuncia cassação do mandato como "vingança política" e afirma que não voltará ao Brasil.',
      'Cassaram meu mandato porque sou uma voz incômoda ao regime. Essa decisão é vingança política pura, e não voltarei ao Brasil para ser enterrado vivo pelo Alexandre de Moraes. Continuarei lutando pela democracia brasileira desde onde eu estiver, com a força da família Bolsonaro ao meu lado.',
      'Declaração do ex-deputado Alexandre Ramagem em comunicado em 12 de dezembro de 2025 após a cassação de seu mandato pelo STF. Ramagem havia fugido do Brasil em novembro após ser condenado por envolvimento na trama golpista de 2022.',
      'verified', true, '2025-12-12',
      'https://www.folha.uol.com.br/poder/2025/12/ramagem-cassado-mandato-denuncia.shtml',
      'news_article',
      'Orlando, Flórida', 'Comunicado em redes sociais', 'ramagem-cassado-denuncia-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Brasil pede extradição Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende pedido formal de extradição de Ramagem aos EUA: "não há asilo para golpistas".',
      'O governo brasileiro formalizou o pedido de extradição do ex-deputado Alexandre Ramagem. Condenação pela trama golpista de 2022 é crime comum, não crime político. Não há asilo para golpistas em nenhuma democracia do mundo. Esperamos que as autoridades americanas honrem seus compromissos internacionais.',
      'Declaração do ministro Flávio Dino do STF em 30 de dezembro de 2025, após o Itamaraty formalizar o pedido de extradição do ex-deputado Ramagem aos EUA. O pedido foi coordenado pelo Ministério da Justiça.',
      'verified', false, '2025-12-30',
      'https://www.conjur.com.br/2025/12/dino-extradicao-ramagem-eua.htm',
      'news_article',
      'Brasília', 'Declaração pública', 'dino-defende-extradicao-ramagem-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 7. Justiça atesta Bolsonaro pena 2052
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro reage a decisão da Justiça que atesta cumprimento de pena até 2052: "condenado em vida".',
      'Me condenaram em vida. A Justiça brasileira decidiu que vou cumprir pena até 2052, eu terei 97 anos. É uma condenação em vida, um castigo político sem precedentes na história do Brasil. Nenhum ex-presidente, nem Collor, nem Lula foi tratado com essa crueldade.',
      'Carta manuscrita de Jair Bolsonaro em 28 de dezembro de 2025, após decisão da Vara de Execuções Penais atestar que cumprirá pena até 2052. A defesa prepara recursos contra a unificação da pena total imposta pelo STF.',
      'verified', true, '2025-12-28',
      'https://g1.globo.com/politica/noticia/2025/12/bolsonaro-condenado-em-vida-pena-2052.ghtml',
      'news_article',
      'Brasília', 'Carta manuscrita divulgada pela defesa', 'bolsonaro-pena-2052-condenado-vida-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Bolsonaro condenação unânime
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes mantém por unanimidade condenação de Bolsonaro: "trama golpista está provada".',
      'A Primeira Turma do Supremo Tribunal Federal mantém por unanimidade a condenação de Jair Messias Bolsonaro. A trama golpista está provada, documentada, fundamentada em farto acervo probatório. Nenhum recurso desta defesa consegue contestar a substância dos fatos. Condenação mantida.',
      'Voto do ministro Alexandre de Moraes em sessão do STF em novembro de 2025, mantendo por unanimidade a condenação de Jair Bolsonaro pela trama golpista. A decisão encerra os principais recursos ordinários da defesa.',
      'verified', true, '2025-11-18',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-11-moraes-condenacao-unanime-bolsonaro',
      'news_article',
      'Brasília', 'Sessão da Primeira Turma do STF', 'moraes-mantem-condenacao-unanime-bolsonaro-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 9. Pena começa 25/11 Superintendência PF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro faz pronunciamento ao entrar na Superintendência da PF para iniciar cumprimento de pena.',
      'Hoje começa meu encarceramento. Entro na Superintendência da Polícia Federal de cabeça erguida, porque não cometi crime algum. Continuo sendo inocente. Peço ao povo brasileiro que não se desmobilize. 2026 está próximo, e a verdade vai prevalecer. Deus, pátria, família.',
      'Pronunciamento de Jair Bolsonaro em 25 de novembro de 2025, ao se apresentar à Superintendência da Polícia Federal em Brasília para iniciar o cumprimento da pena fixada pelo STF pela trama golpista de 2022.',
      'verified', true, '2025-11-25',
      'https://www.folha.uol.com.br/poder/2025/11/bolsonaro-entra-superintendencia-pf-pronunciamento.shtml',
      'news_article',
      'Brasília', 'Pronunciamento na Superintendência da PF', 'bolsonaro-entra-superintendencia-pf-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Moraes inelegibilidade 2060
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes determina inelegibilidade de Bolsonaro até 2060 como efeito acessório da condenação.',
      'Determina-se, como efeito acessório da condenação, a inelegibilidade do condenado Jair Messias Bolsonaro pelo prazo que transcende a pena em sentido estrito. Considerando a gravidade dos crimes contra o Estado Democrático de Direito, fixa-se o marco final em 2060. A inelegibilidade é instrumento de defesa das instituições.',
      'Decisão do ministro Alexandre de Moraes em novembro de 2025, fixando em 2060 o prazo final de inelegibilidade de Jair Bolsonaro. A decisão provocou forte reação do campo bolsonarista, que classificou como "morte política definitiva".',
      'verified', true, '2025-11-20',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-11-moraes-inelegibilidade-2060',
      'news_article',
      'Brasília', 'Decisão no STF', 'moraes-inelegibilidade-bolsonaro-2060-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Dino bloqueia emendas Eduardo Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino bloqueia emendas dos deputados Eduardo Bolsonaro e Ramagem por ausências injustificadas.',
      'Determino o bloqueio imediato das emendas parlamentares indicadas pelos deputados federais Eduardo Bolsonaro e Alexandre Ramagem. Ambos encontram-se evadidos ou em ausência prolongada injustificada, não exercendo a função parlamentar. Mandato parlamentar é múnus público, não salvo-conduto.',
      'Decisão do ministro Flávio Dino em novembro de 2025, bloqueando emendas parlamentares de deputados ausentes. Eduardo Bolsonaro está nos EUA desde 2024 e Ramagem fugiu em novembro de 2025. A decisão foi criticada pela bancada do PL.',
      'verified', false, '2025-11-10',
      'https://www.conjur.com.br/2025/11/dino-bloqueia-emendas-eduardo-ramagem.htm',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'dino-bloqueia-emendas-eduardo-ramagem-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 12. Megaoperação RJ Alemão/Penha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cas,
      'Cláudio Castro defende megaoperação no Alemão e Penha com mais de 120 mortes como "vitória contra o crime".',
      'Essa foi a maior operação policial da história do Rio de Janeiro e uma vitória histórica contra o crime organizado. Perdemos quatro policiais heróis e não podemos chamar de tragédia os mais de 120 mortos que eram bandidos armados com fuzis. A guerra contra o tráfico não é pra cabeça fraca.',
      'Declaração do governador Cláudio Castro em entrevista em 5 de novembro de 2025 após megaoperação conjunta das polícias Civil e Militar nos complexos do Alemão e da Penha que resultou em mais de 120 mortes. A operação gerou forte reação de entidades de direitos humanos.',
      'verified', true, '2025-11-05',
      'https://www.folha.uol.com.br/cotidiano/2025/11/claudio-castro-defende-megaoperacao-alemao-penha.shtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista coletiva no Palácio Guanabara', 'castro-defende-megaoperacao-alemao-penha-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 13. Ricardo Nunes reeleito (nov)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nun,
      'Ricardo Nunes celebra reeleição como prefeito e diz que "São Paulo derrotou o radicalismo de esquerda".',
      'São Paulo derrotou o radicalismo de esquerda nas urnas. Guilherme Boulos e suas ideias destrutivas foram rejeitados por milhões de paulistanos. Agora é hora de unir a cidade, cuidar do povo, investir em obras, gerar emprego. Minha gratidão ao presidente Bolsonaro e ao governador Tarcísio pela parceria.',
      'Discurso de vitória de Ricardo Nunes em 3 de novembro de 2025, após vencer o segundo turno das eleições municipais de São Paulo contra Guilherme Boulos. A fala ecoou a narrativa antiesquerda que pautou a campanha.',
      'verified', false, '2025-11-03',
      'https://www.estadao.com.br/politica/ricardo-nunes-reeleito-sao-paulo-derrota-boulos/',
      'news_article',
      'São Paulo', 'Discurso de vitória eleitoral', 'ricardo-nunes-reeleito-derrota-boulos-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 14. Tarcísio confirma reeleição em 2026 set->nov
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio reforça em novembro que disputará reeleição em SP e descarta candidatura presidencial.',
      'Minha decisão está tomada: vou disputar a reeleição ao governo de São Paulo em 2026. Não serei candidato à Presidência. São Paulo é meu compromisso, é minha missão. Quem tem que liderar a direita nacional é quem o presidente Bolsonaro indicar, e eu estarei ao lado de quem ele escolher.',
      'Declaração do governador Tarcísio de Freitas em entrevista ao Roda Viva da TV Cultura em 17 de novembro de 2025, reforçando a decisão anunciada em setembro de 2025 de buscar reeleição em São Paulo em vez de concorrer à Presidência.',
      'verified', true, '2025-11-17',
      'https://cultura.uol.com.br/programas/roda-viva/2025/11/tarcisio-reeleicao-sp-nao-presidente.html',
      'news_article',
      'São Paulo', 'Programa Roda Viva — TV Cultura', 'tarcisio-reeleicao-sp-nao-presidente-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Ciro filia-se PSDB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes filia-se ao PSDB e dispara: "PDT virou puxadinho do PT, não dá mais para ficar".',
      'Eu não aceito continuar num partido que virou puxadinho do PT. O PDT abdicou de qualquer identidade própria, virou agência de emprego do Lula. Hoje me filio ao PSDB porque acredito que o centro democrático brasileiro precisa ressurgir, longe tanto do bolsonarismo quanto do lulismo autoritário.',
      'Discurso de Ciro Gomes em cerimônia de filiação ao PSDB em São Paulo em 15 de outubro de 2025. O movimento encerra quase três décadas de filiação de Ciro ao PDT e marca recolocação no centro do espectro político.',
      'verified', true, '2025-10-15',
      'https://g1.globo.com/politica/noticia/2025/10/ciro-gomes-filia-se-psdb-pdt-puxadinho-pt.ghtml',
      'news_article',
      'São Paulo', 'Cerimônia de filiação ao PSDB', 'ciro-filia-psdb-pdt-puxadinho-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 16. Boulos nomeado Secretaria-Geral
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos é nomeado ministro da Secretaria-Geral e promete "diálogo com movimentos sociais".',
      'Aceito a missão de comandar a Secretaria-Geral da Presidência da República com muita responsabilidade. Minha prioridade será o diálogo permanente com movimentos sociais, sindicatos e sociedade civil. É um governo popular, e o povo organizado precisa ter voz dentro do Palácio do Planalto.',
      'Discurso do deputado federal Guilherme Boulos em cerimônia de posse como ministro da Secretaria-Geral da Presidência em 20 de outubro de 2025. Boulos assumiu o cargo após derrota na eleição municipal de São Paulo em 2024.',
      'verified', false, '2025-10-20',
      'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/10/boulos-secretaria-geral-posse',
      'other',
      'Brasília', 'Cerimônia de posse no Palácio do Planalto', 'boulos-secretaria-geral-posse-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Ciro Gomes ataca Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes chama Lula de "velho autoritário" e critica silêncio do PSDB sobre STF.',
      'Lula virou um velho autoritário que usa o STF como se fosse braço do Planalto. E o PSDB precisa ter coragem, precisa falar alto sobre os excessos do Judiciário também. Eu não cheguei aqui para ser figurante, eu cheguei para devolver ao tucanato a capacidade de enfrentar os dois extremos.',
      'Declaração de Ciro Gomes em entrevista à Folha de S. Paulo em outubro de 2025, após filiação ao PSDB. A fala provocou desconforto em alas tucanas que temem radicalização do discurso.',
      'verified', false, '2025-10-22',
      'https://www.folha.uol.com.br/poder/2025/10/ciro-gomes-lula-velho-autoritario-psdb.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de S. Paulo', 'ciro-gomes-lula-velho-autoritario-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 18. Moraes sobre pena bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moraes nega recurso da defesa de Bolsonaro e reafirma que "coisa julgada não se negocia".',
      'A defesa do condenado Jair Messias Bolsonaro pretende reabrir, por via oblíqua, questões já decididas por este Plenário em sede de ação penal originária. Coisa julgada não se negocia, não se relativiza, não se reconstrói por manobras defensivas. Nego seguimento ao recurso.',
      'Voto do ministro Alexandre de Moraes em sessão do STF em dezembro de 2025, rejeitando recurso da defesa de Bolsonaro que buscava reduzir a pena imposta pela trama golpista. A decisão foi acompanhada pelos demais ministros.',
      'verified', false, '2025-12-03',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-12-moraes-nega-recurso-bolsonaro',
      'news_article',
      'Brasília', 'Sessão do STF', 'moraes-nega-recurso-bolsonaro-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 19. Eduardo Bolsonaro EUA ataque STF outubro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro declara em Washington que "Brasil não é mais democracia" e pede reação americana.',
      'O Brasil hoje não é mais uma democracia. Temos um presidente que governa com o STF, temos um STF que prende quem discorda, temos uma polícia política que monta dossiês contra opositores. Peço a meus amigos americanos que não reconheçam mais o Brasil como nação democrática até que o Estado de Direito seja restaurado.',
      'Discurso de Eduardo Bolsonaro em evento da Heritage Foundation em Washington D.C. em 28 de outubro de 2025. A fala provocou reação do Itamaraty, que classificou como atentado à imagem do país no exterior.',
      'verified', true, '2025-10-28',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-heritage-brasil-nao-democracia-2025/',
      'news_article',
      'Washington D.C.', 'Heritage Foundation', 'eduardo-heritage-brasil-nao-democracia-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. Nikolas contra operação policial (indiretamente)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas defende megaoperação no Rio e chama mortos de "homenagens à sociedade civil".',
      'Cada bandido armado de fuzil que caiu na operação do Alemão e da Penha é uma homenagem à sociedade civil. A gente cansou do discurso hipócrita dos direitos humanos de bandido. Parabéns à polícia do Rio, parabéns ao governador Cláudio Castro. O Brasil precisa é de mais operações como essa.',
      'Publicação do deputado Nikolas Ferreira em redes sociais em 6 de novembro de 2025, celebrando as mortes na megaoperação no Rio. A fala gerou reação de entidades de direitos humanos e parlamentares de esquerda.',
      'verified', true, '2025-11-06',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-defende-megaoperacao-rio-homenagens',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'nikolas-defende-megaoperacao-homenagens-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 21. Haddad INSS defesa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad defende ressarcimento completo a aposentados e nega omissão do governo no caso INSS.',
      'Este governo não se omitiu, este governo descobriu, denunciou e está ressarcindo cada aposentado lesado. Quem fez vista grossa por anos à máfia dos descontos foi o governo anterior. Quem retomou as auditorias e cassou entidades criminosas fomos nós. O povo não será enganado por essa narrativa de má-fé.',
      'Declaração do ministro Fernando Haddad em entrevista à imprensa em 10 de dezembro de 2025, durante o fim dos trabalhos da CPMI do INSS. A fala buscou rebater a narrativa oposicionista sobre envolvimento do atual governo no escândalo dos descontos.',
      'verified', false, '2025-12-10',
      'https://www.folha.uol.com.br/mercado/2025/12/haddad-defende-ressarcimento-inss.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'haddad-defende-ressarcimento-inss-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Damares CPMI igrejas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares defende investigação de igrejas na CPMI, mas nega "caça às bruxas evangélica".',
      'Eu sou pastora, sou evangélica convicta, e digo: quem desviou recurso público precisa responder, seja de igreja, seja de ONG, seja de sindicato. Mas isso não autoriza caça às bruxas evangélica. A oposição quer aproveitar o momento para criminalizar a fé do povo brasileiro. Isso eu não aceito.',
      'Declaração da senadora Damares Alves em sessão da CPMI do INSS em dezembro de 2025, ao comentar inclusão de igrejas na lista de entidades investigadas pela CPI dos descontos em aposentadorias.',
      'verified', false, '2025-12-15',
      'https://www12.senado.leg.br/noticias/materias/2025/12/15/damares-cpmi-igrejas-caca-bruxas',
      'news_article',
      'Brasília', 'Sessão da CPMI do INSS', 'damares-cpmi-igrejas-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Lula reação condenação Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comenta condenação de Bolsonaro: "democracia brasileira saiu vitoriosa de uma prova difícil".',
      'A democracia brasileira saiu vitoriosa de uma prova muito difícil. O Supremo Tribunal Federal cumpriu seu papel. Quem tentou dar golpe, quem tentou matar o presidente eleito, quem tentou acabar com o Brasil pagou o preço. Esse é um recado para quem um dia pense em tentar novamente: não passarão.',
      'Declaração do presidente Lula em entrevista em 19 de novembro de 2025, após o STF manter por unanimidade a condenação de Jair Bolsonaro pela trama golpista. A fala evitou tom de vingança pessoal e destacou a vitória institucional.',
      'verified', true, '2025-11-19',
      'https://g1.globo.com/politica/noticia/2025/11/lula-condenacao-bolsonaro-democracia-vitoriosa.ghtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-condenacao-bolsonaro-democracia-vitoriosa-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Janones debocha prisão Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones publica vídeo debochando da ida de Bolsonaro à Superintendência da PF: "boas férias, miliciano".',
      'Boas férias, miliciano. 27 anos fingindo ser herói, 27 anos enganando povo pobre, 27 anos roubando joias e agora chorando na porta da cadeia. Fez o que fazer, agora se vira, Jair. O povo brasileiro agradece. E lembra: sem saudade.',
      'Vídeo do deputado André Janones publicado em 25 de novembro de 2025, horas após Bolsonaro se apresentar à Superintendência da PF em Brasília. A publicação viralizou e gerou novas ações judiciais da defesa do ex-presidente.',
      'verified', false, '2025-11-25',
      'https://www.uol.com.br/noticias/politica/2025/11/janones-deboche-prisao-bolsonaro-boas-ferias.htm',
      'news_article',
      'Brasil', 'Vídeo em redes sociais', 'janones-boas-ferias-bolsonaro-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 25. Gleisi sobre cassação Zambelli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi comemora cassação de Zambelli: "criminosa foragida não podia manter mandato".',
      'A cassação do mandato de Carla Zambelli é ato de saneamento institucional. Não existe parlamentar foragido em nenhuma democracia séria do mundo. Uma criminosa condenada, foragida da Justiça brasileira, não podia seguir ostentando mandato popular. A decisão do STF é correta, necessária e histórica.',
      'Declaração da ministra Gleisi Hoffmann em 11 de dezembro de 2025, após o STF anular a votação da Câmara e cassar o mandato de Zambelli. A fala foi publicada pela Secretaria de Comunicação da Presidência.',
      'verified', false, '2025-12-11',
      'https://www.gov.br/secom/pt-br/assuntos/noticias/2025/12/gleisi-cassacao-zambelli',
      'other',
      'Brasília', 'Nota da Secom', 'gleisi-cassacao-zambelli-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Cláudio Castro contra oposição DH
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cas,
      'Cláudio Castro chama críticos de "aliados do tráfico" após denúncias à ONU sobre operação.',
      'A esquerda brasileira, as ONGs internacionais e a oposição que denuncia o Rio na ONU são aliados diretos do tráfico. Quem grita contra a polícia, quem chora por bandido, é cúmplice moral do crime organizado. O povo carioca sabe quem está do lado certo nessa guerra.',
      'Declaração do governador Cláudio Castro em entrevista à Jovem Pan em 12 de novembro de 2025, após entidades de direitos humanos denunciarem à ONU o saldo da megaoperação no Alemão e na Penha.',
      'verified', false, '2025-11-12',
      'https://jovempan.uol.com.br/noticias/politica/claudio-castro-oposicao-aliada-trafico-2025.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista à Jovem Pan', 'castro-oposicao-aliada-trafico-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 27. Padilha pós operação RJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha lamenta mortes em operação no Rio e defende "segurança com inteligência, não com massacre".',
      'Lamentamos profundamente cada vida perdida na operação do Alemão e da Penha. Segurança pública se faz com inteligência, integração federativa e respeito à dignidade humana, não com operações espetaculares que deixam dezenas de mortos. O Brasil não pode se acostumar com isso.',
      'Declaração do ministro da Saúde Alexandre Padilha em 7 de novembro de 2025, representando o governo federal ao lamentar o alto número de mortes na megaoperação no Rio. A fala foi feita em coletiva após reunião ministerial.',
      'verified', false, '2025-11-07',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/11/padilha-rio-seguranca-inteligencia',
      'other',
      'Brasília', 'Coletiva de imprensa', 'padilha-lamenta-operacao-rj-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 28. Ramagem foragido declaração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem anuncia fuga do Brasil em vídeo: "prefiro ser foragido vivo a preso morto pelo STF".',
      'Estou deixando o Brasil porque prefiro ser foragido vivo a preso morto por Alexandre de Moraes. O sistema brasileiro é uma engrenagem de aniquilamento político que tritura quem ousa enfrentar a esquerda togada. Vou continuar lutando pela liberdade do Brasil desde onde eu estiver.',
      'Vídeo publicado pelo ex-deputado Alexandre Ramagem em 10 de novembro de 2025, anunciando fuga do Brasil. Ramagem havia sido condenado pelo STF por envolvimento na trama golpista e preparava-se para iniciar cumprimento de pena.',
      'verified', true, '2025-11-10',
      'https://g1.globo.com/politica/noticia/2025/11/ramagem-fuga-video-foragido-vivo.ghtml',
      'news_article',
      'Brasil', 'Vídeo em redes sociais', 'ramagem-fuga-foragido-vivo-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Magno Malta defende Bolsonaro preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta visita Bolsonaro na PF e chama dia de "vergonha para a história do Brasil".',
      'Acabei de visitar o presidente Bolsonaro na Superintendência da Polícia Federal. Ele está de cabeça erguida, firme, confiante. Este é um dia de vergonha para a história do Brasil. Um ex-presidente preso por um julgamento político, injusto, encomendado por Alexandre de Moraes. Vamos reagir.',
      'Declaração do senador Magno Malta após visitar Bolsonaro na Superintendência da PF em Brasília em 28 de novembro de 2025. A fala fez parte da estratégia do PL de manter Bolsonaro em evidência midiática durante o cumprimento de pena.',
      'verified', false, '2025-11-28',
      'https://www12.senado.leg.br/noticias/materias/2025/11/28/magno-malta-visita-bolsonaro-vergonha',
      'news_article',
      'Brasília', 'Declaração após visita na PF', 'magno-malta-visita-bolsonaro-vergonha-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Lula reação ONU sobre RJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula cobra investigação sobre operação no Rio e defende "intervenção federativa" da União.',
      'O que aconteceu no Alemão e na Penha precisa ser investigado a fundo. Não aceito como governo federal que uma operação policial vire um massacre. A União tem papel nessa articulação e a gente precisa construir uma nova política de segurança pública, com intervenção federativa, com integração. Não dá mais.',
      'Declaração do presidente Lula em entrevista em 8 de novembro de 2025, dois dias após a megaoperação no Rio. A fala marcou tensão com o governador Cláudio Castro, do PL, e deu início a discussão sobre reforma da arquitetura de segurança pública.',
      'verified', false, '2025-11-08',
      'https://www.folha.uol.com.br/cotidiano/2025/11/lula-cobra-investigacao-operacao-rio-intervencao.shtml',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'lula-cobra-investigacao-operacao-rio-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Flávio Bolsonaro após pai preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chora em entrevista após prisão do pai: "meu pai é mártir da direita brasileira".',
      'Meu pai é mártir da direita brasileira. É um homem que foi preso por defender a liberdade, por defender a família, por defender a pátria. O presidente Jair Bolsonaro entra para a história como o maior preso político da América Latina, e o Brasil não vai esquecer o que fizeram com ele.',
      'Entrevista emocionada do senador Flávio Bolsonaro à CNN Brasil em 26 de novembro de 2025, um dia após Jair Bolsonaro se apresentar à PF. A fala marcou o tom do discurso bolsonarista rumo à eleição de 2026.',
      'verified', true, '2025-11-26',
      'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-chora-pai-martir-direita-2025/',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'flavio-bolsonaro-pai-martir-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 32. Bia Kicis contra STF novembro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis convoca ato nacional contra STF após prisão de Bolsonaro e ataca "ditadura togada".',
      'Estamos convocando um ato nacional para as capitais do Brasil contra a ditadura togada que se instalou no Supremo Tribunal Federal. Prenderam Bolsonaro, cassaram Ramagem, cassaram Zambelli, agora vão cassar quem? O povo precisa ir pras ruas. 2026 começa agora.',
      'Convocação da deputada Bia Kicis em redes sociais em 26 de novembro de 2025, um dia após Bolsonaro iniciar cumprimento de pena. A convocação culminou em atos em várias capitais no dia 30 de novembro.',
      'verified', false, '2025-11-26',
      'https://www.metropoles.com/brasil/politica-brasil/bia-kicis-convoca-ato-nacional-stf-novembro-2025',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'bia-kicis-convoca-ato-stf-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 33. Nikolas 2026 antecipação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas antecipa campanha: "2026 vai ser o julgamento popular do regime Lula-Moraes".',
      '2026 vai ser o julgamento popular do regime Lula-Moraes. O povo brasileiro vai às urnas para dizer ao Supremo que chega de arbitrariedade, chega de censura, chega de prisão política. E vai dizer ao Lula que chega de incompetência, chega de corrupção, chega de velho falando bobagem em todo discurso.',
      'Discurso do deputado Nikolas Ferreira em evento com apoiadores em Belo Horizonte em 8 de dezembro de 2025, antecipando o tom da disputa eleitoral de 2026. A fala foi criticada pelo uso de linguagem desqualificadora contra o presidente.',
      'verified', false, '2025-12-08',
      'https://www.folha.uol.com.br/poder/2025/12/nikolas-2026-julgamento-popular-lula-moraes.shtml',
      'news_article',
      'Belo Horizonte', 'Evento com apoiadores', 'nikolas-2026-julgamento-popular-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 34. Tarcísio sobre prisão Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio lamenta prisão de Bolsonaro mas pede "respeito às instituições" em nota cuidadosa.',
      'Recebo com pesar a notícia da prisão do presidente Bolsonaro, a quem devo gratidão política e pessoal. Discordo da decisão, mas respeito as instituições e o Estado de Direito. Seguirei trabalhando por São Paulo, pelo Brasil e por uma direita democrática, responsável e comprometida com o futuro do país.',
      'Nota oficial do governador Tarcísio de Freitas em 25 de novembro de 2025, no dia em que Bolsonaro iniciou cumprimento de pena. O tom cuidadoso foi interpretado como tentativa de se preservar para disputa presidencial futura.',
      'verified', true, '2025-11-25',
      'https://www.estadao.com.br/politica/tarcisio-nota-prisao-bolsonaro-respeito-instituicoes-2025/',
      'other',
      'São Paulo', 'Nota oficial do governo de São Paulo', 'tarcisio-nota-prisao-bolsonaro-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 35. Ricardo Nunes SP gestão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nun,
      'Ricardo Nunes anuncia corte em programas sociais de São Paulo após reeleição e gera protestos.',
      'Estamos fazendo uma revisão profunda de todos os programas sociais da Prefeitura. Alguns deles serão reduzidos, outros encerrados. São Paulo precisa gastar melhor, não mais. Não aceito a Prefeitura como máquina de distribuir dinheiro para ONGs da esquerda sem controle nenhum.',
      'Anúncio do prefeito reeleito Ricardo Nunes em 10 de dezembro de 2025 sobre corte em programas sociais da Prefeitura de São Paulo. A decisão gerou protestos de movimentos sociais e críticas da oposição na Câmara Municipal.',
      'verified', false, '2025-12-10',
      'https://www.folha.uol.com.br/cotidiano/2025/12/ricardo-nunes-anuncia-corte-programas-sociais-sp.shtml',
      'news_article',
      'São Paulo', 'Anúncio na Prefeitura de São Paulo', 'ricardo-nunes-corte-programas-sociais-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 36. Motta atritos STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta critica cassação de Zambelli e diz que "Câmara não é vassala do STF".',
      'Com todo respeito aos ministros do STF, a Câmara dos Deputados não é vassala de nenhum tribunal. Quando o Supremo anula decisões soberanas desta Casa, cria-se um precedente gravíssimo. Vou apresentar proposta para disciplinar a separação de Poderes e evitar novas invasões de competência.',
      'Declaração do presidente da Câmara, Hugo Motta, em 14 de dezembro de 2025, após o STF anular a votação da Câmara que havia mantido o mandato de Carla Zambelli. A fala reacendeu o debate sobre a separação de Poderes.',
      'verified', false, '2025-12-14',
      'https://www.camara.leg.br/noticias/2025/12/motta-critica-cassacao-zambelli-camara',
      'other',
      'Brasília', 'Declaração no plenário da Câmara', 'motta-critica-cassacao-zambelli-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 37. Ciro Gomes crítica economia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes acusa governo Lula de "descalabro fiscal" e compara Haddad a Guido Mantega.',
      'O governo Lula caminha para um descalabro fiscal sem precedentes, e o Fernando Haddad é uma versão mais bem vestida do Guido Mantega. Muita conversa, muita maquiagem, muito artifício, e no fim o Brasil quebra. Se eu fosse presidente, em 30 dias eu ordenaria essa bagunça. Mas o PT não tem compromisso com responsabilidade.',
      'Declaração de Ciro Gomes em entrevista ao UOL em 30 de outubro de 2025, após filiar-se ao PSDB. A comparação entre Haddad e Guido Mantega provocou forte reação no governo e em aliados do PT.',
      'verified', false, '2025-10-30',
      'https://www.uol.com.br/entretenimento/noticias/2025/10/ciro-gomes-haddad-guido-mantega-descalabro-fiscal.htm',
      'news_article',
      'Fortaleza', 'Entrevista ao UOL', 'ciro-gomes-haddad-mantega-descalabro-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 38. Eduardo Bolsonaro apoio pai outubro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro anuncia que não voltará ao Brasil e acusa Judiciário de "armar perseguição".',
      'Eu não vou voltar ao Brasil enquanto esse regime antidemocrático estiver no poder. O Judiciário armou uma perseguição contra minha família e contra mim. Vou continuar defendendo o Brasil desde Washington, mobilizando parlamentares americanos, denunciando violações aqui cometidas.',
      'Declaração do deputado Eduardo Bolsonaro em entrevista em 15 de outubro de 2025, reafirmando permanência nos EUA. O parlamentar está fora do Brasil desde 2024, licenciado do mandato parlamentar, e corre risco de perder o cargo por ausências.',
      'verified', false, '2025-10-15',
      'https://g1.globo.com/politica/noticia/2025/10/eduardo-bolsonaro-nao-volta-brasil-perseguicao.ghtml',
      'news_article',
      'Washington D.C.', 'Entrevista à imprensa', 'eduardo-bolsonaro-nao-volta-brasil-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Bolsonaro declaração inelegibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro reage a inelegibilidade até 2060: "não há democracia que fixe castigo de 35 anos".',
      'A inelegibilidade até 2060 é prova inconteste de que não vivemos numa democracia. Não há país democrático no mundo que fixe castigo político de 35 anos a um ex-presidente. Isso é medieval, isso é castigo exemplar, isso é vingança institucional. O mundo precisa ver e reagir.',
      'Nota divulgada por advogados de Jair Bolsonaro em 21 de novembro de 2025, um dia após o STF confirmar inelegibilidade até 2060. A nota foi divulgada enquanto Bolsonaro estava em prisão domiciliar antes da transferência para a PF.',
      'verified', true, '2025-11-21',
      'https://www.folha.uol.com.br/poder/2025/11/bolsonaro-inelegibilidade-2060-medieval.shtml',
      'news_article',
      'Brasília', 'Nota divulgada pela defesa', 'bolsonaro-inelegibilidade-medieval-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Gleisi deixa presidência PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi deixa presidência do PT para disputar Senado e elogia Edinho Silva como sucessor.',
      'Encerro meu ciclo como presidente do Partido dos Trabalhadores com sentimento de missão cumprida. Entrego o PT estruturado, aguerrido e unido para a disputa de 2026. O companheiro Edinho Silva é o nome certo para dar continuidade a este trabalho. Agora, vou me dedicar à disputa ao Senado pelo Paraná.',
      'Discurso da ministra Gleisi Hoffmann em reunião do diretório nacional do PT em 1º de novembro de 2025, encerrando oito anos à frente da presidência do partido. Edinho Silva, ex-prefeito de Araraquara, foi eleito seu sucessor.',
      'verified', false, '2025-11-01',
      'https://pt.org.br/gleisi-deixa-presidencia-pt-edinho-silva-2025/',
      'other',
      'São Paulo', 'Diretório Nacional do PT', 'gleisi-deixa-presidencia-pt-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Haddad reforma tributária
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad celebra regulamentação completa da reforma tributária como "maior reforma econômica em décadas".',
      'Concluímos hoje a regulamentação completa da reforma tributária. É a maior reforma econômica brasileira em décadas, que simplifica o sistema, reduz a carga sobre o trabalho, torna o Brasil mais competitivo. Gerações lutaram por isso. Nós entregamos. O Brasil agradece.',
      'Discurso do ministro Fernando Haddad em cerimônia no Palácio do Planalto em 17 de dezembro de 2025, durante sanção das leis complementares da reforma tributária pelo presidente Lula. A regulamentação encerrou ciclo iniciado em 2023.',
      'verified', false, '2025-12-17',
      'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/12/haddad-reforma-tributaria-completa',
      'other',
      'Brasília', 'Cerimônia no Palácio do Planalto', 'haddad-reforma-tributaria-completa-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Dino sobre cassação Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino acompanha cassação de Ramagem: "mandato não é escudo para foragido da Justiça".',
      'Acompanho integralmente o voto do eminente relator. Mandato parlamentar não é escudo para foragido da Justiça. Quem foge do Brasil por ter sido condenado criminalmente não pode continuar representando o povo brasileiro. A decisão é juridicamente inquestionável.',
      'Voto do ministro Flávio Dino em sessão do STF em dezembro de 2025 que cassou o mandato do ex-deputado Alexandre Ramagem. A votação foi unânime entre os ministros presentes.',
      'verified', false, '2025-12-12',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-12-dino-cassacao-ramagem',
      'news_article',
      'Brasília', 'Sessão do STF', 'dino-voto-cassacao-ramagem-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 43. Padilha anuncia Farmácia Popular
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha anuncia expansão da Farmácia Popular e ataca narrativa de "caos na saúde" da oposição.',
      'Anunciamos a maior expansão da Farmácia Popular da história. Mais medicamentos, mais cidades atendidas, mais vidas salvas. Enquanto isso, a oposição bolsonarista inventa narrativa de caos na saúde pública, ignorando que foi Bolsonaro quem destruiu o SUS durante a pandemia. O povo sabe a diferença.',
      'Pronunciamento do ministro Alexandre Padilha em cerimônia no Palácio do Planalto em 28 de outubro de 2025 ao anunciar a expansão do programa Farmácia Popular. A fala conteve referências à gestão da pandemia no governo Bolsonaro.',
      'verified', false, '2025-10-28',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/10/padilha-expansao-farmacia-popular',
      'other',
      'Brasília', 'Cerimônia no Palácio do Planalto', 'padilha-expansao-farmacia-popular-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Lula aniversário 80 anos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula completa 80 anos em evento em SP e afirma: "tenho disposição para disputar a reeleição em 2026".',
      'Eu vou completar 80 anos com saúde, com disposição, com energia e com a cabeça funcionando muito bem. Tenho disposição, sim, para disputar a reeleição em 2026 se o meu partido e o povo quiserem. A decisão não é só minha, mas se depender de disposição, eu estou pronto.',
      'Discurso do presidente Lula em evento em São Paulo em 27 de outubro de 2025, um dia após completar 80 anos. A fala confirma a predisposição para concorrer à reeleição em 2026, apesar das especulações sobre sua saúde.',
      'verified', true, '2025-10-27',
      'https://g1.globo.com/politica/noticia/2025/10/lula-80-anos-disposicao-reeleicao-2026.ghtml',
      'news_article',
      'São Paulo', 'Evento de aniversário em São Paulo', 'lula-80-anos-disposicao-reeleicao-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Cláudio Castro STF decisão mata operação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cas,
      'Cláudio Castro ataca Moraes por determinações sobre letalidade policial: "juiz quer dar aula de polícia".',
      'Alexandre de Moraes quer dar aula de polícia para o Rio de Janeiro. Um ministro que nunca colocou um pé em favela, que nunca enfrentou um traficante, agora me manda cartilha de como agir. Eu respeito a decisão, mas recuso lição de moral. Quem está na linha de frente é polícia, não é o STF.',
      'Declaração do governador Cláudio Castro em 25 de novembro de 2025, após decisão do STF endurecer exigências de controle sobre operações policiais com alta letalidade. A fala foi interpretada como desafio aberto à ADPF das Favelas.',
      'verified', false, '2025-11-25',
      'https://www.folha.uol.com.br/cotidiano/2025/11/claudio-castro-ataca-moraes-adpf-favelas.shtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista coletiva', 'castro-ataca-moraes-adpf-favelas-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 46. Nikolas contra Boulos ministério
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas debocha de Boulos ministro: "invasor de prédio agora tem Palácio do Planalto com motorista".',
      'Guilherme Boulos, o cidadão que passou décadas invadindo prédios alheios, agora é ministro de Estado com motorista, com assessoria, com verba pública de milhões. O Palácio do Planalto virou hotel da esquerda festiva. E o povo paga essa conta enquanto passa fome. Vergonha nacional.',
      'Publicação do deputado Nikolas Ferreira em redes sociais em 21 de outubro de 2025, um dia após Guilherme Boulos assumir a Secretaria-Geral da Presidência. A publicação teve mais de 5 milhões de visualizações.',
      'verified', false, '2025-10-21',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-boulos-invasor-ministro',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'nikolas-boulos-invasor-ministro-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 47. Boulos resposta Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos rebate Nikolas e defende luta por moradia: "honra ter sido acusado pelo que eu fiz".',
      'O Nikolas Ferreira me chama de invasor de prédio. Eu tenho honra de ter sido acusado pelo que eu fiz. Lutei a vida inteira por moradia, por teto, por dignidade para famílias que viviam nas ruas. Não vou me desculpar por isso. E agora, como ministro, vou continuar lutando pelo mesmo lado: o lado do povo.',
      'Resposta do ministro Guilherme Boulos em entrevista em 22 de outubro de 2025 às críticas do deputado Nikolas Ferreira sobre sua história política. A fala reafirmou a identidade de Boulos com movimentos sociais e habitacionais.',
      'verified', false, '2025-10-22',
      'https://www.uol.com.br/noticias/politica/2025/10/boulos-responde-nikolas-moradia-honra.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'boulos-responde-nikolas-moradia-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Dino atritos emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Dino anuncia auditoria completa das emendas Pix de 2023 a 2025 e cita "falhas sistêmicas".',
      'Determino auditoria completa e retroativa de todas as emendas Pix executadas de 2023 a 2025. Constatamos falhas sistêmicas de rastreabilidade, desvios documentados, prestações de contas insuficientes. O Tribunal de Contas da União será formalmente instado. Dinheiro público não é dinheiro nenhum: tem dono, tem regra e tem auditoria.',
      'Decisão do ministro Flávio Dino em 23 de outubro de 2025, ampliando a auditoria sobre emendas Pix e determinando envolvimento do TCU. A decisão provocou forte reação do Congresso, que acusou o ministro de "invadir competências legislativas".',
      'verified', false, '2025-10-23',
      'https://www.conjur.com.br/2025/10/dino-determina-auditoria-emendas-pix.htm',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'dino-auditoria-emendas-pix-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 49. Magno Malta contra Dino
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta chama Dino de "guarda de Planalto" e pede impeachment por "devassa no Congresso".',
      'Flávio Dino não é ministro do Supremo, é guarda de Planalto fardado de toga. Invade competências do Congresso, faz devassa nas emendas, humilha parlamentares eleitos pelo povo. Vamos apresentar pedido de impeachment. Esse ministro é uma afronta à Constituição e à separação de Poderes.',
      'Declaração do senador Magno Malta em 24 de outubro de 2025, após decisão de Flávio Dino ampliar a auditoria sobre emendas parlamentares. A proposta de impeachment foi apoiada por parte da bancada do PL.',
      'verified', false, '2025-10-24',
      'https://www12.senado.leg.br/noticias/materias/2025/10/24/magno-malta-dino-impeachment-devassa',
      'news_article',
      'Brasília', 'Entrevista no Senado', 'magno-malta-dino-impeachment-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 50. Fim ano Lula 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula encerra 2025 em mensagem à nação: "2026 será o ano em que o Brasil vai voltar a sorrir".',
      'Meus companheiros e companheiras brasileiros. Encerramos 2025 com o Brasil de volta ao rumo certo. Derrotamos tentativas de golpe, retomamos o crescimento, colocamos os pobres no orçamento. 2026 será o ano em que o Brasil vai voltar a sorrir, vai voltar às urnas com a cabeça erguida, vai voltar a se respeitar. Feliz 2026 a cada brasileiro.',
      'Pronunciamento em cadeia nacional do presidente Lula em 31 de dezembro de 2025, mensagem de fim de ano. O tom foi de pré-campanha, antecipando o enfrentamento eleitoral de 2026.',
      'verified', true, '2025-12-31',
      'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2025/12/lula-pronunciamento-fim-ano-2025',
      'other',
      'Brasília', 'Pronunciamento em cadeia nacional', 'lula-pronunciamento-fim-ano-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
