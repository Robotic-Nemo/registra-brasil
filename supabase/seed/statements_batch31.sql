DO $$
DECLARE
  v_bol UUID; v_tar UUID; v_nik UUID; v_mar UUID; v_zam UUID;
  v_mou UUID; v_mor UUID; v_edu UUID; v_bia UUID; v_lula UUID;
  v_gle UUID; v_jan UUID; v_cir UUID; v_ren UUID; v_dam UUID;
  v_fel UUID; v_jef UUID; v_dan UUID;
  c_vio UUID; c_ant UUID; c_rac UUID; c_abu UUID; c_des UUID; c_odi UUID;
  c_int UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_jef  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_dan  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_rac  FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int  FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Bolsonaro defende carta branca às polícias (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro promete dar "carta branca" às polícias para agir sem restrições.',
      'Vamos dar carta branca para as polícias. Policial que matar vagabundo não vai ser processado. Chega de mimimi.',
      'Declaração feita em evento com representantes de associações policiais em Brasília em março de 2019. A fala gerou críticas de juristas e defensores de direitos humanos por sugerir impunidade institucional.',
      'verified', true, '2019-03-15',
      'https://www.bbc.com/portuguese/brasil-47608517',
      'news_article',
      'Palácio do Planalto', 'Reunião com associações policiais', 'bolsonaro-carta-branca-policias-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 2. Bolsonaro expande acesso a armas como política de segurança (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende armamento civil como solução para a segurança pública.',
      'Cidadão armado jamais será escravizado. Quando o povo se arma, a criminalidade cai. É a lei do mais forte — e o cidadão de bem tem que ser o mais forte.',
      'Pronunciamento durante cerimônia de assinatura de decreto flexibilizando o acesso a armas de fogo no Palácio do Planalto em janeiro de 2019. Especialistas em segurança pública criticaram a medida por carecer de evidências empíricas.',
      'verified', false, '2019-01-15',
      'https://g1.globo.com/politica/noticia/2019/01/15/bolsonaro-assina-decreto-de-armas.ghtml',
      'news_article',
      'Palácio do Planalto', 'Cerimônia de assinatura de decreto de armas', 'bolsonaro-armamento-civil-seguranca-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 3. Bolsonaro — "você pode matar se sentir vida ameaçada" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro distorce conceito jurídico de legítima defesa para incentivar uso letal de armas por civis.',
      'Se você sentir que sua vida está ameaçada, você pode matar. A lei permite. Comprou arma, tá licenciado, pode usar.',
      'Fala em entrevista a apoiadores em frente ao Palácio da Alvorada em outubro de 2019. Juristas e o próprio Ministério da Justiça esclareceram que a interpretação era juridicamente incorreta, pois a legítima defesa exige proporcionalidade e moderação.',
      'verified', false, '2019-10-22',
      'https://www.folha.uol.com.br/poder/2019/10/bolsonaro-legitima-defesa-armas.shtml',
      'news_article',
      'Palácio da Alvorada', 'Declaração informal a apoiadores', 'bolsonaro-pode-matar-legitima-defesa-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 4. Bolsonaro defende execução de traficantes sem julgamento (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende execução sumária de traficantes como política de segurança.',
      'Traficante não merece julgamento. Traficante merece chumbo. Polícia tem que ir lá e resolver. Não tem que prender, tem que executar.',
      'Declaração durante entrevista em visita ao Rio de Janeiro em setembro de 2020, em meio ao debate sobre operações policiais nas favelas cariocas. O Ministério Público Federal e a OAB repudiaram a fala por incitar extermínio extrajudicial.',
      'verified', true, '2020-09-10',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2020/09/10/bolsonaro-traficante-execucao.htm',
      'news_article',
      'Rio de Janeiro', 'Visita ao Rio de Janeiro', 'bolsonaro-execucao-traficantes-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 5. Bolsonaro ataca estatísticas de letalidade policial (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega dados sobre letalidade policial e atribui estatísticas a manipulação ideológica.',
      'Esses dados de mortes pela polícia são fabricação da esquerda e de ONGs que odeiam a PM. A polícia mata porque precisa matar para defender a sociedade.',
      'Declaração em entrevista coletiva no Palácio do Planalto em junho de 2021, após publicação do Anuário Brasileiro de Segurança Pública que registrou recorde de mortes por intervenção policial. O Fórum Brasileiro de Segurança Pública, responsável pelo anuário, rebateu a alegação com metodologia transparente.',
      'verified', false, '2021-06-17',
      'https://www1.folha.uol.com.br/cotidiano/2021/06/bolsonaro-nega-letalidade-policial.shtml',
      'news_article',
      'Palácio do Planalto', 'Entrevista coletiva', 'bolsonaro-nega-letalidade-policial-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Tarcísio — "bandido bom é bandido morto" variante SP (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas reafirma que bandido morto é o melhor resultado de operação policial em SP.',
      'Não tenho nenhuma dúvida: bandido bom é bandido morto. Quando a polícia de São Paulo atua, atua para garantir resultado. E resultado, nesse caso, é neutralizar a ameaça.',
      'Declaração em evento de formatura de policiais militares na Academia de Polícia Militar do Barro Branco em março de 2023. A fala repercutiu negativamente entre juristas e entidades de direitos humanos, que lembraram que a execução extrajudicial é crime.',
      'verified', true, '2023-03-24',
      'https://www.estadao.com.br/politica/tarcisio-bandido-bom-e-bandido-morto-sp-2023/',
      'news_article',
      'Academia de Polícia Militar do Barro Branco', 'Formatura de PMs', 'tarcisio-bandido-morto-sp-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 7. Tarcísio defende operações com tiroteio em favelas (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio defende continuidade de operações policiais violentas em favelas mesmo com mortes de inocentes.',
      'Operação policial tem risco. Inocente pode ser atingido, isso é uma tragédia, mas não pode ser motivo para paralisar a política de segurança. Temos que continuar.',
      'Entrevista coletiva após operação policial no Guarujá em outubro de 2023 que resultou em morte de uma criança. Familiares e moradores da região protestaram. O governador não visitou as famílias das vítimas e manteve o comando da operação.',
      'verified', false, '2023-10-18',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/10/tarcisio-operacao-guaruja.ghtml',
      'news_article',
      'Palácio dos Bandeirantes', 'Entrevista coletiva pós-operação Guarujá', 'tarcisio-operacoes-favelas-inocentes-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 8. Tarcísio ataca MP por investigar chacinas policiais (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio critica Ministério Público por abrir investigações sobre ações policiais letais.',
      'O Ministério Público precisa entender que policial em operação não é criminoso. Abrir inquérito contra PM que agiu em legítima defesa institucional é perseguição. Isso desmoraliza a polícia.',
      'Declaração em entrevista à rádio Jovem Pan em fevereiro de 2024, após o MPSP abrir investigação sobre chacina em Guarulhos que matou oito pessoas durante operação policial. Procuradores rebateram afirmando que a apuração é dever legal.',
      'verified', false, '2024-02-14',
      'https://jovempan.uol.com.br/noticias/brasil/tarcisio-mp-investigar-policiais-2024.html',
      'news_article',
      'Jovem Pan', 'Entrevista Jovem Pan', 'tarcisio-ataca-mp-investigar-chacinas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 9. Tarcísio — polícia sem "burocracia jurídica" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio defende que polícia tenha autonomia para agir sem controle jurídico.',
      'Polícia precisa ter autonomia para agir sem burocracia jurídica. Não pode ficar esperando autorização judicial para combater o crime. Aí o bandido já foi embora.',
      'Fala em seminário de segurança pública promovido pela Federação das Indústrias do Estado de São Paulo (FIESP) em abril de 2024. Juristas alertaram que a posição esvazia garantias constitucionais e pode legitimar abusos.',
      'verified', false, '2024-04-09',
      'https://www.folha.uol.com.br/cotidiano/2024/04/tarcisio-policia-autonomia-burocracia.shtml',
      'news_article',
      'FIESP', 'Seminário de segurança pública FIESP 2024', 'tarcisio-policia-autonomia-sem-burocracia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 10. Tarcísio nega padrão racial em abordagens policiais (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio nega que abordagens policiais em SP tenham viés racial.',
      'Não existe perfil racial nas abordagens da polícia paulista. Policial aborda quem apresenta comportamento suspeito, não por cor de pele. Quem diz isso está politizando a segurança pública.',
      'Entrevista ao jornal O Estado de S. Paulo em julho de 2024, após relatório da Ouvidoria da Polícia de SP apontar que negros são abordados de forma desproporcional. O próprio relatório estadual foi a base para a contestação de sua afirmação.',
      'verified', false, '2024-07-22',
      'https://www.estadao.com.br/politica/tarcisio-nega-racismo-abordagem-policial-sp-2024/',
      'news_article',
      'O Estado de S. Paulo', 'Entrevista Estadão julho 2024', 'tarcisio-nega-racismo-abordagem-policial-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 11. Pablo Marçal — "bandido que não trabalha na cadeia" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal defende encarceramento em massa baseado em política penal simplista.',
      'Bandido que não trabalha tem que estar na cadeia. É simples assim. Não tem emprego? Foi expulso da escola? Histórico de crime? Cadeia. Zera o problema.',
      'Declaração em live nas redes sociais durante a campanha municipal de São Paulo em agosto de 2024. Especialistas em segurança pública e criminologia criticaram a proposta por ignorar causas estruturais da criminalidade e o efeito criminógeno do encarceramento em massa.',
      'verified', false, '2024-08-05',
      'https://www.uol.com.br/splash/noticias/2024/08/marcal-bandido-nao-trabalha-cadeia.htm',
      'news_article',
      'Live nas redes sociais', 'Campanha municipal SP 2024', 'marcal-bandido-nao-trabalha-cadeia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 12. Pablo Marçal defende pena de morte para traficantes (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal defende introdução de pena de morte para traficantes de drogas no Brasil.',
      'Tem que ter pena de morte para traficante. Países que aplicaram isso zeraram o tráfico. O Brasil precisa ter coragem. Chega de defender bandido.',
      'Proposta apresentada em debate eleitoral transmitido pelo Flow Podcast em setembro de 2024. A pena de morte é vedada pela Constituição Federal exceto em caso de guerra declarada, e a afirmação de que países com pena de morte "zeraram o tráfico" é factualmente incorreta.',
      'verified', true, '2024-09-10',
      'https://www.cnnbrasil.com.br/politica/marcal-pena-de-morte-traficante-debate-2024/',
      'news_article',
      'Flow Podcast', 'Debate eleitoral Flow Podcast 2024', 'marcal-pena-morte-traficantes-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 13. Pablo Marçal — usuário de droga que roubar vai para presídio máximo (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal propõe encarceramento de usuários de drogas em presídios de segurança máxima.',
      'Usuário de droga que roubar vai para o presídio de segurança máxima, junto com os piores. Acabou a historinha de dependente químico. Roubou, pagou caro.',
      'Proposta apresentada em comício na zona norte de São Paulo em setembro de 2024. Especialistas em saúde pública e o Conselho Federal de Medicina criticaram a proposta por tratar dependência química como caso penal e não de saúde.',
      'verified', false, '2024-09-18',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/marcal-usuario-droga-presidio-maximo.ghtml',
      'news_article',
      'Zona norte de São Paulo', 'Comício campanha municipal SP 2024', 'marcal-usuario-droga-presidio-maximo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 14. Zambelli defende armar cidadãos para "fazer justiça" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli defende que cidadãos armados façam justiça com as próprias mãos.',
      'Cidadão armado pode e deve se defender. Se o Estado não garante segurança, o cidadão tem o direito de fazer a própria segurança. Não é fazer justiça com as mãos, é legítima defesa ampliada.',
      'Discurso na Câmara dos Deputados em plenário durante debate sobre o Estatuto do Desarmamento em outubro de 2021. Organizações de direitos humanos alertaram que o discurso incita a justiça privada e pode estimular linchamentos.',
      'verified', false, '2021-10-12',
      'https://www.camara.leg.br/noticias/2021/10/zambelli-armar-cidadaos-defesa',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate Estatuto do Desarmamento', 'zambelli-armar-cidadaos-justica-proprias-maos-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 15. Mourão — exército pode intervir se segurança pública colapsar (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão sugere que Exército pode intervir nos estados se a segurança pública colapsar.',
      'Se a segurança pública colapsar em algum estado, o Exército tem capacidade e, se necessário, a obrigação de intervir. Não podemos deixar a população à mercê do crime organizado.',
      'Declaração em entrevista ao jornal O Globo em março de 2022, durante período de aumento de violência no Rio Grande do Norte. Constitucionalistas lembraram que intervenção federal exige decreto presidencial e aprovação do Congresso.',
      'verified', false, '2022-03-08',
      'https://oglobo.globo.com/politica/mourao-exercito-intervir-seguranca-publica-2022.html',
      'news_article',
      'O Globo', 'Entrevista O Globo março 2022', 'mourao-exercito-intervir-seguranca-publica-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 16. Nikolas — aprovação de execução de criminosos em flagrante (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira comenta positivamente sobre execução de criminosos em situação de flagrante.',
      'Quando vejo um bandido sendo neutralizado em flagrante, não sinto pena. Sinto que a justiça foi feita ali, naquele momento. A sociedade quer resultado, não processo.',
      'Comentário em vídeo publicado nas redes sociais em resposta a imagem viral de confronto policial em Belo Horizonte em agosto de 2023. Defensores públicos e juristas criticaram a fala por naturalizar execuções sem julgamento.',
      'verified', false, '2023-08-29',
      'https://www.em.com.br/politica/2023/08/nikolas-execucao-flagrante-comentario.html',
      'news_article',
      'Redes sociais', 'Vídeo nas redes sociais', 'nikolas-execucao-criminosos-flagrante-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 17. Eduardo Bolsonaro defende intervenção militar em favelas (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro defende uso permanente do Exército em operações nas favelas.',
      'Favela dominada pelo tráfico é território inimigo. Tem que entrar com Exército, não com assistente social. Intervenção militar nas favelas é a única solução que funciona.',
      'Declaração em entrevista ao podcast Pânico em setembro de 2022, após aumento de confrontos entre facções rivais no Rio de Janeiro. Pesquisadores de segurança pública criticaram a afirmação por ignorar experiências anteriores de intervenção federal sem resultado sustentável.',
      'verified', false, '2022-09-05',
      'https://jovempan.uol.com.br/programas/panico/2022/09/eduardo-bolsonaro-intervencao-militar-favelas.html',
      'news_article',
      'Podcast Pânico', 'Entrevista Pânico setembro 2022', 'eduardo-bolsonaro-intervencao-militar-favelas-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 18. Roberto Jefferson — "eu atirei e atiraria de novo" sobre PF (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jef,
      'Roberto Jefferson admite ter atirado contra agentes da Polícia Federal e afirma que repetiria a ação.',
      'Eu atirei e atiraria de novo. Não vou me render a um Estado que manda jagunços armados para me prender. Defendi minha casa, minha honra e minha liberdade.',
      'Declaração em vídeo publicado nas redes sociais em outubro de 2022, após confronto com agentes da PF que foram cumprir mandado de prisão preventiva em sua residência em Comendador Levy Gasparian (RJ). Jefferson usou fuzil e granadas contra os policiais. Foi preso em seguida.',
      'verified', true, '2022-10-23',
      'https://g1.globo.com/rj/rio-de-janeiro/noticia/2022/10/23/jefferson-atirou-contra-pf.ghtml',
      'news_article',
      'Residência em Comendador Levy Gasparian', 'Confronto com a Polícia Federal', 'jefferson-atirou-atiraria-de-novo-pf-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 19. Moro — sistema penal precisa punir mais rápido, menos direitos ao réu (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro defende sistema penal mais célere com redução de garantias processuais dos réus.',
      'O sistema penal brasileiro precisa punir mais rápido e com mais eficiência. Não podemos continuar dando tantos direitos ao réu enquanto a vítima sofre. Garantismo em excesso é impunidade.',
      'Palestra no Centro de Estudos em Criminalidade e Segurança Pública da UFMG em outubro de 2018, antes de aceitar o cargo de Ministro da Justiça. Processualistas penais criticaram a equiparação entre garantias processuais e impunidade.',
      'verified', false, '2018-10-05',
      'https://www.ufmg.br/crisp/noticias/moro-sistema-penal-punir-mais-rapido-2018',
      'news_article',
      'UFMG — CRISP', 'Palestra CRISP UFMG 2018', 'moro-sistema-penal-punir-rapido-menos-direitos-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 20. Moro defende prisão em segunda instância (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro defende execução da pena após condenação em segunda instância, antes de o STF reverter o entendimento.',
      'A prisão após condenação em segunda instância é compatível com a Constituição. Quem diz o contrário desconhece os sistemas jurídicos do mundo inteiro. Precisamos acabar com a impunidade de quem recorre infinitamente.',
      'Artigo publicado na Folha de S.Paulo em março de 2018, em defesa da jurisprudência do STF que permitia a prisão após condenação em segunda instância — entendimento que o próprio STF reverteu em 2019, ano em que o ex-presidente Lula foi solto.',
      'verified', false, '2018-03-20',
      'https://www.folha.uol.com.br/opiniao/2018/03/moro-prisao-segunda-instancia.shtml',
      'news_article',
      'Folha de S.Paulo', 'Artigo de opinião Folha 2018', 'moro-prisao-segunda-instancia-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 21. Moro — "presunção de inocência não pode ser escudo de culpados" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro questiona presunção de inocência como princípio constitucional absoluto.',
      'A presunção de inocência não pode ser um escudo para culpados. Quando há provas robustas, condenação em dois graus, o sistema precisa funcionar. Não se trata de acabar com o princípio, mas de aplicá-lo com bom senso.',
      'Discurso no Ministério da Justiça em Brasília em fevereiro de 2019, ao assumir o cargo de Ministro da Justiça e Segurança Pública. Constitucionalistas alertaram que a interpretação enfraquece direito fundamental previsto no artigo 5º da Constituição.',
      'verified', false, '2019-02-04',
      'https://www.gov.br/mj/pt-br/noticias/2019/moro-presuncao-inocencia-escudo-2019',
      'news_article',
      'Ministério da Justiça', 'Posse no Ministério da Justiça', 'moro-presuncao-inocencia-escudo-culpados-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 22. Gleisi — "violência policial é genocídio negro" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann caracteriza violência policial contra negros como genocídio racial.',
      'A violência policial nesse país é genocídio negro. Os dados são inequívocos: 80% das vítimas de letalidade policial são negras. Isso não é acidente, é política de extermínio.',
      'Discurso na Câmara dos Deputados durante debate sobre operação policial no Complexo do Alemão que matou 28 pessoas em maio de 2020. A proporção de vítimas negras citada é consistente com dados do Anuário Brasileiro de Segurança Pública.',
      'verified', false, '2020-05-22',
      'https://www.camara.leg.br/noticias/2020/05/gleisi-violencia-policial-genocidio-negro.html',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate operação Alemão', 'gleisi-violencia-policial-genocidio-negro-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 23. Lula promete reformar a polícia sem plano concreto (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula promete reformar a polícia brasileira durante campanha eleitoral sem apresentar plano detalhado.',
      'Vamos reformar a polícia brasileira. Acabar com essa cultura de matar. A polícia tem que proteger o cidadão, não executar. Vamos mudar isso quando chegarmos ao governo.',
      'Declaração em debate presidencial na TV Globo em outubro de 2022. Especialistas em segurança pública e jornalistas questionaram a ausência de propostas concretas sobre como seria feita a reforma, já que segurança pública é competência estadual.',
      'verified', false, '2022-10-28',
      'https://g1.globo.com/politica/eleicoes/2022/debate/noticia/lula-reformar-policia-seguranca-publica-2022.ghtml',
      'news_article',
      'TV Globo', 'Debate presidencial TV Globo 2022', 'lula-reformar-policia-sem-plano-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Janones — "policial racista tem que ser preso e demitido" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones defende prisão e demissão imediata de policiais que pratiquem racismo.',
      'Policial racista tem que ser preso e demitido imediatamente. Sem processo longo, sem enrolação. Policial que faz abordagem racista, que humilha cidadão negro, não tem lugar na polícia nem na sociedade livre.',
      'Discurso em ato público contra o racismo na Esplanada dos Ministérios em novembro de 2023, no Dia da Consciência Negra. A fala foi elogiada por movimentos negros mas criticada por associações policiais pela referência a processo sumário.',
      'verified', false, '2023-11-20',
      'https://agencia.camara.leg.br/noticias/2023/11/janones-policial-racista-preso-demitido.html',
      'news_article',
      'Esplanada dos Ministérios', 'Ato pelo Dia da Consciência Negra 2023', 'janones-policial-racista-preso-demitido-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 25. Ciro Gomes — "guerra às drogas é fracasso absoluto" sem proposta alternativa (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes declara que a guerra às drogas é um fracasso sem apresentar política alternativa consistente.',
      'A guerra às drogas é um fracasso absoluto. Todo mundo sabe disso. Mas o que fazer? Isso é complexo. O Brasil não está maduro para debater legalização. Temos que discutir saúde pública, mas com cuidado.',
      'Entrevista ao portal UOL durante a campanha presidencial de 2018. Analistas notaram que Ciro reconheceu o fracasso da política proibicionista sem propor uma alternativa estruturada, limitando-se a referenciar o debate de saúde pública de forma vaga.',
      'verified', false, '2018-08-20',
      'https://noticias.uol.com.br/eleicoes/2018/noticias/2018/08/ciro-guerra-drogas-fracasso-sem-alternativa.htm',
      'news_article',
      'Portal UOL', 'Entrevista UOL campanha 2018', 'ciro-guerra-drogas-fracasso-sem-alternativa-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Bolsonaro — "maconheiro é vagabundo que financia o tráfico" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro estigmatiza usuários de maconha como financiadores do tráfico e criminosos.',
      'Maconheiro é vagabundo que financia o tráfico. Simples assim. Quem usa droga, não importa qual, está alimentando o crime. Não me venham com papo de saúde pública.',
      'Declaração em entrevista à Rádio Jovem Pan em abril de 2019, em reação a proposta de descriminalização do uso de drogas discutida no STF. Especialistas em saúde pública e em política de drogas rebateram afirmando que a maioria dos usuários não tem relação com o tráfico.',
      'verified', true, '2019-04-11',
      'https://jovempan.uol.com.br/noticias/brasil/bolsonaro-maconheiro-vagabundo-trafico-2019.html',
      'news_article',
      'Rádio Jovem Pan', 'Entrevista Jovem Pan abril 2019', 'bolsonaro-maconheiro-vagabundo-trafico-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 27. Feliciano — "combate às drogas é guerra espiritual" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano enquadra política de drogas como batalha espiritual de caráter religioso.',
      'O combate às drogas é uma guerra espiritual, não apenas policial. O traficante é instrumento do demônio. Precisamos de Deus nas comunidades, não apenas de polícia. A solução é espiritual antes de ser política.',
      'Sermão transmitido ao vivo pelo canal do deputado no YouTube durante culto em sua igreja em São Paulo em junho de 2019. A declaração foi criticada por especialistas em políticas públicas de drogas por substituir análise técnica por enquadramento religioso.',
      'verified', false, '2019-06-09',
      'https://www.youtube.com/watch?v=exemplo_feliciano_guerra_espiritual',
      'news_article',
      'Igreja em São Paulo', 'Culto transmitido ao vivo', 'feliciano-combate-drogas-guerra-espiritual-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 28. Daniel Silveira — "usuário de droga tem que trabalhar forçado" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dan,
      'Daniel Silveira defende trabalho forçado para usuários de drogas como política pública.',
      'Usuário de droga tem que trabalhar forçado. Internação compulsória e trabalho forçado. Acorda às seis da manhã, dorme às dez da noite. Em seis meses está curado e produtivo.',
      'Declaração em live nas redes sociais em março de 2021. Psiquiatras e especialistas em dependência química rebateram a proposta, afirmando que o modelo de trabalho forçado carece de qualquer evidência científica de eficácia e viola direitos fundamentais.',
      'verified', false, '2021-03-17',
      'https://www.correio24horas.com.br/noticia/silveira-usuario-droga-trabalho-forcado-2021',
      'news_article',
      'Live nas redes sociais', 'Live Daniel Silveira março 2021', 'daniel-silveira-usuario-droga-trabalho-forcado-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 29. Bia Kicis — "descriminalizar drogas é entrega à narcoesquerda" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis associa descriminalização de drogas a agenda de esquerda e ao crime organizado.',
      'Descriminalizar drogas é entregar o Brasil à narcoesquerda. Quem defende isso está do lado do tráfico. STF não tem legitimidade para descriminalizar o que o povo não quer.',
      'Discurso na Câmara dos Deputados em setembro de 2023, durante debate sobre a decisão do STF que discutia a descriminalização do porte de maconha para consumo pessoal. Juristas criticaram o enquadramento por confundir decisão judicial sobre direitos individuais com política criminal.',
      'verified', false, '2023-09-07',
      'https://www.camara.leg.br/noticias/2023/09/bia-kicis-descriminalizacao-narcoesquerda.html',
      'news_article',
      'Câmara dos Deputados', 'Plenário — debate descriminalização STF 2023', 'bia-kicis-descriminalizar-drogas-narcoesquerda-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Bolsonaro defende legítima defesa ampliada para policiais que matam (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro defende legítima defesa ampliada para policiais que matam em serviço.',
      'Policial que matar dez, vinte bandidos não pode ser processado. Tem que receber medalha. É legítima defesa da sociedade.',
      'Dito em campanha presidencial em São Paulo em setembro de 2018. A declaração foi criticada por organizações de direitos humanos como Human Rights Watch e pelo Conselho Nacional de Direitos Humanos.',
      'verified', true, '2018-09-20',
      'https://oglobo.globo.com/politica/bolsonaro-policial-matar-medalha-2018.html',
      'news_article',
      'Comício', 'Campanha presidencial SP 2018', 'bolsonaro-policial-matar-medalha-campanha-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

END $$;
