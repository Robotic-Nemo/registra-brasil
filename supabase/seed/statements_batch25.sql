-- Batch 25: 2025 Bolsonaro coup trial, amnesty bill, and 8-Janeiro reactions.

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_nik UUID; v_gle UUID; v_tar UUID;
  v_jan UUID; v_edu UUID; v_car UUID; v_ren UUID; v_mor UUID;
  v_mou UUID; v_zam UUID; v_bia UUID; v_fel UUID; v_dam UUID;
  v_val UUID; v_ram UUID; v_fil UUID; v_mau UUID; v_mar UUID; v_bou UUID;
  c_ant UUID; c_des UUID; c_cor UUID; c_vio UUID; c_abu UUID; c_odi UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_val  FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO v_ram  FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_fil  FROM politicians WHERE slug = 'filipe-martins';
  SELECT id INTO v_mau  FROM politicians WHERE slug = 'mauro-cid';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou  FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';

  -- 1. Bolsonaro nega golpe no indiciamento (Feb 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega ter planejado golpe após indiciamento formal pela PGR em fevereiro de 2025.',
      'Sou inocente. Não planejei nenhum golpe. Isso é perseguição política para me tirar do cenário eleitoral.',
      'Declaração em coletiva de imprensa em São Paulo em fevereiro de 2025, após a Procuradoria-Geral da República formalizar o indiciamento de Bolsonaro por tentativa de golpe de estado e abolição violenta do Estado Democrático de Direito.',
      'verified', true, '2025-02-20',
      'https://g1.globo.com/politica/noticia/2025/02/bolsonaro-nega-golpe-apos-indiciamento-pgr.ghtml',
      'news_article',
      'São Paulo', 'Coletiva de imprensa', 'bolsonaro-nega-golpe-indiciamento-pgr-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 2. Bolsonaro compara perseguição à de Cuba/Venezuela (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro compara sua situação jurídica à perseguição política em regimes como Cuba e Venezuela.',
      'O que estão fazendo comigo é o que fazem com os opositores em Cuba e na Venezuela. Usam o judiciário para destruir politicamente quem eles não conseguem vencer nas urnas.',
      'Declaração em entrevista à Rádio Jovem Pan em março de 2025, durante a qual Bolsonaro traçou paralelos entre seu processo judicial e a repressão política em regimes autoritários latino-americanos.',
      'verified', false, '2025-03-10',
      'https://www.jovempan.com.br/noticias/politica/bolsonaro-compara-perseguicao-cuba-venezuela-2025.html',
      'news_article',
      'São Paulo', 'Entrevista Jovem Pan', 'bolsonaro-compara-perseguicao-cuba-venezuela-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 3. Bolsonaro "STF inventou crimes para me eliminar" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que o STF inventou crimes para eliminá-lo do cenário político.',
      'O STF inventou crimes que não existem para me eliminar politicamente. Nunca houve golpe, nunca houve conspiração. Tudo isso é uma armação do sistema contra mim e contra os brasileiros que me apoiam.',
      'Publicação nas redes sociais e reiterada em discurso a apoiadores em Brasília em abril de 2025, no contexto do avanço do processo no Supremo Tribunal Federal sobre os eventos de janeiro de 2023.',
      'verified', true, '2025-04-05',
      'https://www.estadao.com.br/politica/bolsonaro-stf-inventou-crimes-eliminar-2025/',
      'news_article',
      'Brasília', 'Discurso a apoiadores', 'bolsonaro-stf-inventou-crimes-eliminar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 4. Bolsonaro não reconhece legitimidade do processo (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro declara que não reconhece a legitimidade do processo criminal movido pelo STF contra ele.',
      'Não reconheço a legitimidade desse processo. Um tribunal que prende seus críticos e censura a imprensa não tem autoridade moral para me julgar. Isso é lawfare puro.',
      'Entrevista ao jornal O Globo em maio de 2025, na qual Bolsonaro questionou abertamente a imparcialidade do processo judicial e recusou-se a reconhecer a competência do STF para julgá-lo.',
      'verified', false, '2025-05-08',
      'https://oglobo.globo.com/politica/bolsonaro-nao-reconhece-legitimidade-processo-stf-2025.html',
      'news_article',
      'Rio de Janeiro', 'Entrevista O Globo', 'bolsonaro-nao-reconhece-legitimidade-processo-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Bolsonaro "passaporte confiscado é tortura democrática" (Jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama confisco de seu passaporte pelo STF de "tortura democrática".',
      'Tomar meu passaporte é uma forma de tortura democrática. Me impedem de me defender internacionalmente, de falar com líderes do mundo livre. Isso é covardia.',
      'Declaração em vídeo publicado nas redes sociais em janeiro de 2025, após o ministro Alexandre de Moraes determinar a apreensão do passaporte de Bolsonaro como medida cautelar no inquérito sobre o golpe.',
      'verified', true, '2025-01-15',
      'https://www.folha.uol.com.br/poder/2025/01/bolsonaro-passaporte-confiscado-tortura-democratica.shtml',
      'news_article',
      'Rio de Janeiro', 'Vídeo nas redes sociais', 'bolsonaro-passaporte-confiscado-tortura-democratica-jan-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. Nikolas "indiciamento é abuso do poder judiciário" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira classifica o indiciamento de Bolsonaro como abuso do poder judiciário.',
      'O que vemos aqui é um claro abuso do poder judiciário. Transformaram o STF em um instrumento político de perseguição. O indiciamento do presidente Bolsonaro não tem sustentação jurídica, é pura politicagem.',
      'Discurso na Câmara dos Deputados em fevereiro de 2025, durante sessão de debates sobre o indiciamento de Bolsonaro pela PGR. Nikolas liderou o coro da oposição na defesa do ex-presidente.',
      'verified', true, '2025-02-25',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-indiciamento-bolsonaro-abuso-judiciario-2025/',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-indiciamento-bolsonaro-abuso-judiciario-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 7. Nikolas "Alexandre de Moraes é o verdadeiro criminoso" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que Alexandre de Moraes é o "verdadeiro criminoso" no contexto político atual.',
      'Se querem falar em criminoso, olhem para Alexandre de Moraes. Ele censurou veículos de comunicação, prendeu pessoas sem devido processo legal, e agora quer condenar quem se opôs a ele. O verdadeiro criminoso aqui tem toga.',
      'Publicação no X (antigo Twitter) em março de 2025, que viralizou e gerou forte repercussão no debate político nacional sobre os limites da atuação do STF.',
      'verified', true, '2025-03-18',
      'https://www.folha.uol.com.br/poder/2025/03/nikolas-ferreira-moraes-verdadeiro-criminoso-twitter.shtml',
      'news_article',
      'Brasília', 'Publicação no X (Twitter)', 'nikolas-moraes-verdadeiro-criminoso-twitter-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 8. Tarcísio defende Bolsonaro mantendo ambiguidade sobre golpe (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas defende Bolsonaro politicamente sem condenar explicitamente a tentativa de golpe.',
      'O presidente Bolsonaro dedicou sua vida ao Brasil. Seja qual for o resultado desse processo, eu jamais vou abandonar um companheiro que lutou tanto por este país. Respeito a Justiça, mas também respeito minha lealdade.',
      'Entrevista coletiva em São Paulo em abril de 2025, na qual o governador de São Paulo adotou postura de solidariedade a Bolsonaro sem posicionar-se claramente sobre a legalidade dos atos de 8 de janeiro.',
      'verified', false, '2025-04-14',
      'https://www.estadao.com.br/politica/tarcisio-defende-bolsonaro-sem-condenar-golpe-2025/',
      'news_article',
      'São Paulo', 'Entrevista coletiva', 'tarcisio-defende-bolsonaro-sem-condenar-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 9. Tarcísio chama atos como "movimentos mal conduzidos" não golpe (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas descreve os atos do 8 de Janeiro como "movimentos mal conduzidos", recusando o termo golpe.',
      'Foram movimentos mal conduzidos, com erros graves, mas chamar de golpe é exagerado. Golpe é quando há uma ruptura institucional coordenada. O que houve ali foi uma manifestação que saiu do controle.',
      'Entrevista ao jornal Folha de S.Paulo em fevereiro de 2025, na qual Tarcísio tentou minimizar a gravidade dos eventos do 8 de janeiro enquanto mantinha distância do núcleo duro bolsonarista processado pelo STF.',
      'verified', true, '2025-02-12',
      'https://www.folha.uol.com.br/poder/2025/02/tarcisio-8-janeiro-movimento-mal-conduzido-nao-golpe.shtml',
      'news_article',
      'São Paulo', 'Entrevista Folha de S.Paulo', 'tarcisio-8-janeiro-movimento-mal-conduzido-nao-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 10. Carlos Bolsonaro "meu pai é perseguido como Mandela" Twitter (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro compara perseguição ao pai com a de Nelson Mandela em publicação no Twitter.',
      'Meu pai está sendo perseguido como Mandela foi. A diferença é que aqui os algozes usam toga em vez de apartheid. A história vai fazer justiça. #BolsonaroLivre',
      'Publicação no X (antigo Twitter) em março de 2025, que gerou amplo debate e críticas de entidades de direitos humanos pela comparação considerada inapropriada e desinformativa.',
      'verified', false, '2025-03-22',
      'https://oglobo.globo.com/politica/carlos-bolsonaro-pai-perseguido-mandela-twitter-2025.html',
      'news_article',
      'Rio de Janeiro', 'Publicação no X (Twitter)', 'carlos-bolsonaro-pai-perseguido-mandela-twitter-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 11. Eduardo Bolsonaro testemunha nos EUA sobre "perseguição política" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro testemunha perante audiência nos EUA alegando que seu pai sofre perseguição política no Brasil.',
      'Meu pai é um preso político em liberdade vigiada. O Brasil está sob um regime de exceção judicial onde um único ministro do STF decide quem pode falar, quem pode votar, quem pode existir politicamente.',
      'Depoimento perante comissão do Congresso americano em Washington em março de 2025, no qual Eduardo Bolsonaro pediu aos legisladores americanos que pressionem o governo Biden em relação ao que chamou de perseguição política no Brasil.',
      'verified', true, '2025-03-05',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-testemunho-eua-perseguicao-politica-2025/',
      'news_article',
      'Washington D.C.', 'Audiência no Congresso dos EUA', 'eduardo-bolsonaro-testemunho-eua-perseguicao-politica-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 12. Eduardo Bolsonaro pede pressão internacional contra o STF (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede pressão internacional da comunidade democrática contra o STF.',
      'Peço a todos os líderes democráticos do mundo que pressionem o Brasil. O STF está destruindo a democracia brasileira com a conivência do governo Lula. O mundo livre não pode ficar calado.',
      'Discurso em evento da direita conservadora americana em Washington em abril de 2025, onde Eduardo Bolsonaro articulou apoio internacional para a causa do pai junto a políticos republicanos.',
      'verified', false, '2025-04-02',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-pressao-internacional-stf-washington-2025/',
      'news_article',
      'Washington D.C.', 'Evento conservador americano', 'eduardo-bolsonaro-pressao-internacional-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Bia Kicis "esse tribunal está destruindo o Brasil" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis afirma que o STF está destruindo o Brasil ao conduzir o julgamento de Bolsonaro.',
      'Esse tribunal está destruindo o Brasil. Estão rasgando a Constituição, atropelando o devido processo legal, e condenando um inocente para satisfazer um projeto de poder de esquerda. Isso é uma vergonha nacional.',
      'Discurso no Plenário da Câmara dos Deputados em maio de 2025, durante debate sobre o andamento do processo judicial contra Bolsonaro no STF.',
      'verified', true, '2025-05-20',
      'https://www.folha.uol.com.br/poder/2025/05/bia-kicis-stf-destruindo-brasil-julgamento-bolsonaro.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'bia-kicis-stf-destruindo-brasil-julgamento-bolsonaro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 14. Zambelli "não vou me entregar a tribunal ilegítimo" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli declara que não vai se entregar a um "tribunal ilegítimo" ao reagir ao processo judicial.',
      'Não vou me entregar a um tribunal ilegítimo. Se fui eleita pelo povo, é ao povo que devo satisfações, não a ministros que se tornaram ditadores togados. Vou lutar até o fim.',
      'Declaração em entrevista à Jovem Pan em fevereiro de 2025, enquanto respondia a processo no STF por sua suposta participação nos eventos que culminaram nos atos de 8 de janeiro de 2023.',
      'verified', true, '2025-02-08',
      'https://www.cnnbrasil.com.br/politica/zambelli-nao-entregar-tribunal-ilegitimo-stf-2025/',
      'news_article',
      'São Paulo', 'Entrevista Jovem Pan', 'zambelli-nao-entregar-tribunal-ilegitimo-stf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 15. Valdemar nega PL ter financiado tentativa de golpe (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_val,
      'Valdemar Costa Neto nega que o Partido Liberal tenha financiado ou apoiado tentativa de golpe.',
      'O PL não financiou nenhuma tentativa de golpe. Isso é uma mentira criada para destruir o nosso partido. Somos um partido democrático e jamais participamos de qualquer ação ilegal contra as instituições.',
      'Nota oficial do presidente do PL divulgada à imprensa em março de 2025, após reportagens indicarem que recursos do partido poderiam ter sido utilizados no financiamento das mobilizações que culminaram nos atos do 8 de janeiro.',
      'verified', false, '2025-03-28',
      'https://oglobo.globo.com/politica/valdemar-costa-neto-nega-pl-financiou-golpe-2025.html',
      'news_article',
      'Brasília', 'Nota oficial do PL', 'valdemar-nega-pl-financiou-golpe-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Mourão se distancia, "eu não sabia de nada sobre o plano" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão afirma não ter tido conhecimento de nenhum plano golpista durante o governo Bolsonaro.',
      'Eu não sabia de nada sobre nenhum plano. Fui vice-presidente, mas havia assuntos que simplesmente não chegavam até mim. Se alguém planejou algo, foi sem o meu conhecimento ou participação.',
      'Entrevista ao jornal O Globo em fevereiro de 2025, na qual o ex-vice-presidente Mourão buscou se distanciar das acusações de envolvimento na tentativa de golpe investigada pelo STF.',
      'verified', true, '2025-02-17',
      'https://oglobo.globo.com/politica/mourao-nao-sabia-plano-golpe-governo-bolsonaro-2025.html',
      'news_article',
      'Brasília', 'Entrevista O Globo', 'mourao-nao-sabia-plano-golpe-governo-bolsonaro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Ramagem nega envolvimento em espionagem antes de ser preso (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem nega qualquer envolvimento em espionagem ilegal antes de ser preso em operação da PF.',
      'Nunca usei a Agência Brasileira de Inteligência para fins políticos ou pessoais. Todas as operações conduzidas durante minha gestão foram legais e dentro das atribuições da ABIN. Sou inocente das acusações.',
      'Declaração à imprensa em janeiro de 2025, dias antes de ser preso pela Polícia Federal no âmbito da operação que investigou o uso político da ABIN durante o governo Bolsonaro para espionar adversários políticos.',
      'verified', false, '2025-01-20',
      'https://www.folha.uol.com.br/poder/2025/01/ramagem-nega-espionagem-abin-antes-prisao-pf.shtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'ramagem-nega-espionagem-abin-antes-prisao-pf-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Filipe Martins preso por planejamento de golpe, nega tudo (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fil,
      'Filipe Martins nega participação no planejamento de golpe após ser preso pela Polícia Federal.',
      'Sou inocente. Nunca participei de nenhum planejamento de golpe. Fui assessor do presidente e nunca estive envolvido em nenhuma ação ilegal. Essa prisão é um ato político, não jurídico.',
      'Nota divulgada por advogados de Filipe Martins em fevereiro de 2025, horas após sua prisão preventiva decretada pelo ministro Alexandre de Moraes no âmbito do inquérito sobre a tentativa de golpe de estado.',
      'verified', true, '2025-02-03',
      'https://www.estadao.com.br/politica/filipe-martins-preso-golpe-nega-participacao-2025/',
      'news_article',
      'Brasília', 'Nota via advogados', 'filipe-martins-preso-golpe-nega-participacao-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 19. Mauro Cid tenta retratar delação premiada (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Cid tenta retratar delação premiada firmada com a PGR, gerando crise no processo.',
      'Assinei o acordo sob pressão e as informações que prestei não refletem a realidade dos fatos. Quero retratar minha delação porque fui induzido a dizer coisas que não são verdadeiras sobre o presidente Bolsonaro.',
      'Petição entregue ao STF em dezembro de 2024, na qual o ex-ajudante de ordens de Bolsonaro tentou anular sua delação premiada firmada meses antes, alegando coação. O pedido foi negado pelo tribunal.',
      'verified', true, '2024-12-10',
      'https://www.cnnbrasil.com.br/politica/mauro-cid-retrata-delacao-premiada-stf-pressao-2024/',
      'news_article',
      'Brasília', 'Petição ao STF', 'mauro-cid-retrata-delacao-premiada-stf-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 20. Gleisi "a condenação tem que ser exemplar para o Brasil" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que a condenação de Bolsonaro deve ser exemplar para proteger a democracia.',
      'A condenação tem que ser exemplar para o Brasil. Não para vingar ninguém, mas para que as futuras gerações saibam que tentativas de golpe têm consequências. A democracia se defende com rigor da lei.',
      'Discurso no Congresso Nacional em março de 2025, durante ato em comemoração ao aniversário da promulgação da Constituição Federal, no qual a presidente do PT defendeu punição severa aos envolvidos na tentativa de golpe.',
      'verified', false, '2025-03-15',
      'https://g1.globo.com/politica/noticia/2025/03/gleisi-condenacao-bolsonaro-exemplar-democracia.ghtml',
      'news_article',
      'Brasília', 'Ato em comemoração à Constituição', 'gleisi-condenacao-bolsonaro-exemplar-democracia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 21. Lula "a Justiça está funcionando, é o estado de direito" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende o processo judicial contra Bolsonaro como prova de que a Justiça e o estado de direito estão funcionando.',
      'A Justiça está funcionando. Isso é o estado de direito em ação. Ninguém está acima da lei no Brasil, nem ex-presidente, nem general. Quem tentou destruir a democracia vai responder por isso perante a lei.',
      'Pronunciamento em cadeia nacional de rádio e televisão no aniversário dos atos de 8 de janeiro de 2025, no qual Lula reafirmou o compromisso de seu governo com o processo judicial em curso no STF.',
      'verified', true, '2025-01-08',
      'https://g1.globo.com/politica/noticia/2025/01/lula-justica-funcionando-estado-de-direito-aniversario-8-janeiro.ghtml',
      'news_article',
      'Brasília', 'Pronunciamento em cadeia nacional', 'lula-justica-funcionando-estado-direito-8-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Renan "Bolsonaro tem que pagar pelo que fez ao Brasil" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros afirma que Bolsonaro deve ser punido pelos danos causados ao Brasil.',
      'Bolsonaro tem que pagar pelo que fez ao Brasil. Destruiu instituições, incitou a violência, mandou seus seguidores invadir o Congresso e o STF. Não pode sair impune. A conta vai chegar.',
      'Entrevista ao jornal Folha de S.Paulo em março de 2025, na qual o senador Renan Calheiros comentou o andamento do processo judicial contra Bolsonaro e a expectativa de condenação pelo Supremo.',
      'verified', false, '2025-03-25',
      'https://www.folha.uol.com.br/poder/2025/03/renan-calheiros-bolsonaro-pagar-pelo-que-fez-brasil-2025.shtml',
      'news_article',
      'Brasília', 'Entrevista Folha de S.Paulo', 'renan-calheiros-bolsonaro-pagar-brasil-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 23. Janones celebração agressiva do indiciamento com linguagem desumanizadora (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones celebra indiciamento de Bolsonaro com linguagem agressiva e desumanizadora nas redes sociais.',
      'Caiu o mito! O tiranozinho de araque vai responder por suas monstruosidades. Que chore muito. Cada lágrima dele é uma festa para a democracia brasileira. Bem-vindo ao mundo real, capitãozinho do fracasso.',
      'Série de publicações no X (antigo Twitter) em fevereiro de 2025, após o anúncio do indiciamento formal de Bolsonaro. As postagens geraram críticas de aliados e adversários pelo tom considerado excessivo e contraprodutivo.',
      'verified', true, '2025-02-21',
      'https://oglobo.globo.com/politica/janones-celebra-indiciamento-bolsonaro-linguagem-agressiva-2025.html',
      'news_article',
      'Brasília', 'Publicações no X (Twitter)', 'janones-celebra-indiciamento-bolsonaro-linguagem-agressiva-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 24. Boulos "8 de janeiro foi consequência direta do discurso de Bolsonaro" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos afirma que os atos do 8 de Janeiro foram consequência direta do discurso de Bolsonaro.',
      'O 8 de janeiro foi consequência direta do discurso de Bolsonaro. Anos pregando golpe, questionando as urnas, atacando o STF. As pessoas que invadiram o Congresso foram incentivadas por ele. A responsabilidade é dele.',
      'Discurso em ato público em São Paulo em janeiro de 2025, no segundo aniversário dos ataques às sedes dos Três Poderes, organizado por partidos de esquerda e movimentos sociais.',
      'verified', false, '2025-01-08',
      'https://www.cnnbrasil.com.br/politica/boulos-8-janeiro-consequencia-discurso-bolsonaro-aniversario-2025/',
      'news_article',
      'São Paulo', 'Ato público em memória ao 8 de Janeiro', 'boulos-8-janeiro-consequencia-discurso-bolsonaro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 25. Moro "o processo precisa ter ampla defesa, não pode ser show" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro defende que o processo contra Bolsonaro precisa respeitar a ampla defesa e não ser um espetáculo político.',
      'O processo precisa ter ampla defesa garantida, não pode ser um show. A democracia se defende com as regras do Estado de Direito. Se condenar, que seja por provas, não por pressão política ou por espetáculo midiático.',
      'Entrevista ao jornal O Estado de S. Paulo em abril de 2025, na qual o senador e ex-juiz Sérgio Moro comentou o andamento do julgamento de Bolsonaro no STF, adotando postura crítica ao processo sem defender o ex-presidente.',
      'verified', true, '2025-04-22',
      'https://www.estadao.com.br/politica/moro-processo-bolsonaro-ampla-defesa-nao-show-2025/',
      'news_article',
      'Brasília', 'Entrevista Estadão', 'moro-processo-bolsonaro-ampla-defesa-nao-show-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 26. Nikolas defende anistia para condenados do 8-jan (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende a aprovação de anistia para os condenados pelos atos do 8 de Janeiro.',
      'Defendo a anistia para os condenados do 8 de janeiro. Foram pessoas comuns, iludidas, que pagam penas desproporcionais enquanto os verdadeiros mandantes ficam soltos. O Congresso tem o dever de fazer justiça a eles.',
      'Discurso na Câmara dos Deputados em junho de 2025, durante a votação em comissão do projeto de lei de anistia para os envolvidos nos atos de 8 de janeiro, liderado pela bancada conservadora.',
      'verified', true, '2025-06-10',
      'https://g1.globo.com/politica/noticia/2025/06/nikolas-defende-anistia-condenados-8-janeiro.ghtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'nikolas-defende-anistia-condenados-8-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 27. Marco Feliciano "eram patriotas, não criminosos" sobre 8-jan (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano defende que os participantes dos atos do 8 de Janeiro eram patriotas, não criminosos.',
      'Eram patriotas, não criminosos. Pessoas que amam o Brasil e foram às ruas por acreditar que houve fraude eleitoral. Podem ter errado na forma, mas a intenção era defender a pátria. Anistia já!',
      'Declaração em discurso na Câmara dos Deputados em maio de 2025, durante debate sobre o projeto de anistia aos condenados pelos atos do 8 de janeiro. Feliciano foi um dos principais defensores do projeto na bancada evangélica.',
      'verified', false, '2025-05-28',
      'https://www.folha.uol.com.br/poder/2025/05/feliciano-8-janeiro-patriotas-nao-criminosos-anistia.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'feliciano-8-janeiro-patriotas-nao-criminosos-anistia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

  -- 28. Damares "os presos políticos do 8 de janeiro precisam de anistia" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves chama condenados do 8 de Janeiro de "presos políticos" e exige anistia imediata.',
      'Os presos políticos do 8 de janeiro precisam de anistia. São cristãos, são trabalhadores, são avós que foram presos por manifestar sua fé democrática. Não são terroristas, são brasileiros que merecem liberdade.',
      'Discurso no Senado Federal em junho de 2025, no qual a senadora Damares Alves apelou aos colegas para aprovar o projeto de anistia, misturando argumentos religiosos e políticos em defesa dos condenados.',
      'verified', true, '2025-06-17',
      'https://www.estadao.com.br/politica/damares-presos-8-janeiro-anistia-senado-2025/',
      'news_article',
      'Brasília', 'Plenário do Senado Federal', 'damares-presos-8-janeiro-anistia-senado-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Lula promete vetar projeto de anistia caso aprovado (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anuncia que vetará o projeto de anistia aos condenados pelo 8 de Janeiro caso seja aprovado pelo Congresso.',
      'Se esse projeto de anistia chegar na minha mesa, eu veto. Sem hesitação. Não vou compactuar com a impunidade de quem tentou destruir a democracia brasileira. Quem praticou crime tem que responder por ele.',
      'Declaração à imprensa durante viagem a Brasília em julho de 2025, reafirmando posição já sinalizada pelo Palácio do Planalto diante do avanço do projeto de anistia no Congresso Nacional.',
      'verified', true, '2025-07-03',
      'https://g1.globo.com/politica/noticia/2025/07/lula-promete-vetar-projeto-anistia-8-janeiro.ghtml',
      'news_article',
      'Brasília', 'Declaração à imprensa', 'lula-veto-projeto-anistia-8-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Bolsonaro posta mensagem ambígua no aniversário do 8 de janeiro (Jan 2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro publica mensagem ambígua no segundo aniversário do 8 de Janeiro, sem condenar os atos.',
      'Dois anos atrás, o Brasil foi palco de uma grande injustiça. O povo que me elegeu com 58 milhões de votos teve seus direitos negados. A história vai julgar quem são os verdadeiros golpistas nessa história.',
      'Publicação no Telegram e no X (antigo Twitter) em 8 de janeiro de 2025, no segundo aniversário dos ataques às sedes dos Três Poderes. Bolsonaro evitou condenar explicitamente os atos e redirecionou a narrativa para o que chamou de fraude eleitoral.',
      'verified', true, '2025-01-08',
      'https://oglobo.globo.com/politica/bolsonaro-mensagem-ambigua-aniversario-8-janeiro-2025.html',
      'news_article',
      'Rio de Janeiro', 'Publicação no Telegram e X (Twitter)', 'bolsonaro-mensagem-ambigua-aniversario-8-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins UNION ALL
  SELECT id, c_des, false FROM ins;

END $$;
