-- Batch 62: Very recent statements (Jan-Apr 2026) — Ramagem preso nos EUA,
-- Lula sanciona Lei Antifacção, Zambelli extradição Itália, Bolsonaro Papudinha,
-- Nikolas contra lei antimisoginia, CPMI INSS, Mercosul-UE, confusões de Lula,
-- Tarcísio apoia Flávio, Gleisi candidata ao Senado, e outros
-- 50 statements cobrindo os quatro primeiros meses de 2026

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_had UUID; v_tar UUID; v_nik UUID;
  v_fla UUID; v_edu UUID; v_din UUID; v_jan UUID; v_ram UUID;
  v_zam UUID; v_mag UUID; v_gle UUID; v_bou UUID; v_dam UUID;
  v_mor UUID; v_mot UUID; v_kic UUID; v_pad UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID; c_obs UUID; c_ame UUID; c_aut UUID;
  c_mis UUID; c_mac UUID; c_neg UUID; c_irr UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
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
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';

  -- 1. Ramagem preso pelo ICE em Orlando
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem, foragido da Justiça brasileira, alega perseguição política após ser preso pelo ICE em Orlando.',
      'Eu não sou criminoso, sou um perseguido político. O que está acontecendo comigo é um recado do regime brasileiro para todos que ousaram enfrentar Alexandre de Moraes. Fui recebido nos Estados Unidos como refugiado e vão provar minha inocência.',
      'Declaração do ex-deputado federal Alexandre Ramagem (PL-RJ), condenado pelo STF por envolvimento na trama golpista de 2022, após ser detido pelo ICE em Orlando no dia 13 de abril de 2026. Ramagem havia fugido do Brasil para escapar da prisão e foi solto 48 horas depois por decisão de uma corte migratória americana em 15 de abril.',
      'verified', true, '2026-04-13',
      'https://www.folha.uol.com.br/mundo/2026/04/ramagem-preso-ice-orlando-perseguicao-politica.shtml',
      'news_article',
      'Orlando, Flórida', 'Comunicado após detenção pelo ICE', 'ramagem-preso-ice-orlando-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Bolsonaro reage à prisão de Ramagem
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro chama prisão de Ramagem nos EUA de "perseguição política internacional" orquestrada por Lula.',
      'A prisão de Ramagem nos Estados Unidos é mais um capítulo dessa perseguição política sem limites. O governo Lula está exportando a ditadura togada para o mundo. Ramagem é um patriota, um servidor da pátria, e está sendo tratado como criminoso porque ousou defender o Brasil.',
      'Comunicado de Jair Bolsonaro divulgado por sua defesa em 14 de abril de 2026, um dia após Ramagem ser detido pelo ICE em Orlando. Bolsonaro segue preso na Papudinha cumprindo pena pela trama golpista de 2022, com acesso restrito à comunicação externa.',
      'verified', true, '2026-04-14',
      'https://g1.globo.com/politica/noticia/2026/04/bolsonaro-reacao-prisao-ramagem-perseguicao.ghtml',
      'news_article',
      'Brasília', 'Comunicado via defesa', 'bolsonaro-reacao-prisao-ramagem-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Flávio Dino cobra plano facções Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino cobra do Executivo plano nacional contra o avanço das facções criminosas na Amazônia.',
      'A Amazônia está sendo colonizada por facções criminosas que lucram com o garimpo ilegal, o desmatamento e o narcotráfico. O Estado brasileiro precisa apresentar um plano sério, com inteligência, presença territorial e integração entre União, estados e municípios. Não basta retórica ambiental.',
      'Manifestação do ministro Flávio Dino em decisão monocrática no STF em 13 de abril de 2026, dando prazo de 60 dias para o governo federal apresentar plano estruturado de combate ao crime organizado na região amazônica, no âmbito da ADPF das Amazônias.',
      'verified', false, '2026-04-13',
      'https://www.conjur.com.br/2026/04/dino-cobra-plano-faccoes-amazonia.htm',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'dino-cobra-plano-faccoes-amazonia-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 4. Janones ataca Bolsonaro em vídeo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones ataca Bolsonaro em vídeo viralizado e é processado pela defesa do ex-presidente no STF.',
      'Bolsonaro é um covarde que passou a vida inteira fingindo ser herói. Esse cara nunca teve coragem de nada, só de roubar joia, de fugir para os Estados Unidos e de mandar matar o Brasil. Preso é pouco para o que ele fez com esse país.',
      'Vídeo publicado por André Janones em suas redes sociais em 6 de abril de 2026 que gerou ação judicial da defesa de Bolsonaro no STF por calúnia e difamação. O deputado federal é conhecido pelo estilo agressivo e viralizado de comunicação política.',
      'verified', false, '2026-04-06',
      'https://www.uol.com.br/noticias/politica/2026/04/janones-ataca-bolsonaro-video-processo-stf.htm',
      'news_article',
      'Brasil', 'Vídeo em redes sociais', 'janones-video-ataca-bolsonaro-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 5. Nikolas em Goiânia "esse ano vai ser guerra"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma em ato em Goiânia que "esse ano vai ser guerra" contra a esquerda nas eleições.',
      'Esse ano vai ser guerra! Não é política mais, é guerra. A gente vai pra cima dessa esquerda criminosa que destruiu o Brasil, que prendeu o Bolsonaro, que humilha o povo brasileiro. 2026 é a nossa última chance e nós não vamos dar mole.',
      'Discurso do deputado federal Nikolas Ferreira (PL-MG) em ato bolsonarista em Goiânia no dia 11 de abril de 2026, reunindo milhares de apoiadores. A fala provocou reação de entidades civis e de parlamentares governistas pelo tom bélico.',
      'verified', true, '2026-04-11',
      'https://www.folha.uol.com.br/poder/2026/04/nikolas-goiania-esse-ano-vai-ser-guerra.shtml',
      'news_article',
      'Goiânia', 'Ato bolsonarista', 'nikolas-goiania-guerra-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 6. Lula em Fortaleza ITA discurso incoerente
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz discurso confuso em Fortaleza misturando assuntos e gera preocupação sobre sua saúde mental.',
      'O ITA, o Instituto Tecnológico da Aeronáutica, é uma das joias... é uma das coisas, vamos dizer assim, que o Brasil tem de mais importante, que nós não podemos deixar perder, porque se perder a gente perde, a gente não tem como recuperar, porque a tecnologia é coisa que se perde e não volta.',
      'Trecho do discurso do presidente Lula durante evento em Fortaleza em abril de 2026. Jornalistas presentes e vídeos viralizados nas redes sociais destacaram trechos confusos e sem fio narrativo, alimentando críticas da oposição sobre a capacidade cognitiva do presidente aos 80 anos.',
      'verified', false, '2026-04-08',
      'https://www.estadao.com.br/politica/lula-fortaleza-ita-discurso-incoerente-abril-2026/',
      'news_article',
      'Fortaleza', 'Evento público em Fortaleza', 'lula-fortaleza-ita-discurso-incoerente-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Bia Kicis no DF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis diz em ato no DF que o STF "confisca a democracia" e precisa ser desmontado em 2027.',
      'O STF hoje é uma ditadura de 11 homens e mulheres que confiscaram a democracia brasileira. Em 2027, com um presidente eleito pelo povo, nós vamos ao Congresso e vamos desmontar essa corte. Vamos limitar mandatos, vamos limitar poderes e vamos devolver ao povo o que é do povo.',
      'Declaração da deputada federal Bia Kicis (PL-DF) em ato político em Brasília em 4 de abril de 2026, ao lado da vice-governadora Celina Leão. A fala defende alterações estruturais no Supremo que especialistas classificam como ameaças à independência do Judiciário.',
      'verified', false, '2026-04-04',
      'https://www.correiobraziliense.com.br/politica/2026/04/bia-kicis-stf-confisca-democracia-df.html',
      'news_article',
      'Brasília', 'Ato político com Celina Leão', 'bia-kicis-stf-confisca-democracia-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 8. Magno Malta CPMI "decisão política"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta diz que fim da CPMI do INSS sem relatório foi "decisão política" para proteger o governo.',
      'O encerramento da CPMI do INSS sem relatório final foi uma decisão política, pura e simples. A base do governo não quis levar adiante porque as investigações estavam apontando para dentro do Planalto. É uma vergonha, uma afronta ao povo que foi roubado nos descontos ilegais.',
      'Declaração do senador Magno Malta (PL-ES) em entrevista no Senado em 30 de março de 2026, dois dias após a CPMI do INSS encerrar os trabalhos sem aprovação do relatório final. A comissão investigava descontos ilegais em aposentadorias que atingiram milhões de beneficiários.',
      'verified', false, '2026-03-30',
      'https://www12.senado.leg.br/noticias/materias/2026/03/30/magno-malta-cpmi-inss-decisao-politica',
      'news_article',
      'Brasília', 'Entrevista no Senado', 'magno-malta-cpmi-inss-decisao-politica-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 9. Itália decide extraditar Zambelli
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli diz que extradição decidida pela Itália é "sentença de morte política" do regime brasileiro.',
      'A decisão do tribunal italiano de me extraditar é uma sentença de morte política. Eu vou voltar para o Brasil para ser enterrada viva por Alexandre de Moraes. Peço aos brasileiros que não esqueçam que sou uma perseguida política, uma mulher que ousou enfrentar o sistema.',
      'Reação da ex-deputada Carla Zambelli em comunicado em 26 de março de 2026, após a Corte de Apelação de Roma autorizar sua extradição para o Brasil. Zambelli havia fugido em 2024 após condenação pelo STF no caso da perseguição armada em São Paulo às vésperas do segundo turno de 2022.',
      'verified', true, '2026-03-26',
      'https://g1.globo.com/mundo/noticia/2026/03/italia-decide-extraditar-carla-zambelli.ghtml',
      'news_article',
      'Roma', 'Comunicado após decisão da corte italiana', 'zambelli-extradicao-italia-sentenca-politica-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 10. Nikolas contra lei antimisoginia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas classifica como "aberração" lei antimisoginia aprovada pelo Senado que pune ataques online contra mulheres.',
      'Essa lei antimisoginia é uma aberração jurídica que criminaliza a opinião. Qualquer crítica a uma ministra, a uma deputada, a uma jornalista da esquerda vai virar crime de misoginia. É censura disfarçada de proteção. É o fim da liberdade de expressão no Brasil.',
      'Declaração do deputado Nikolas Ferreira em sessão da Câmara em 28 de março de 2026, após o Senado aprovar projeto de lei que tipifica como crime os ataques misóginos sistemáticos em ambiente digital. O texto segue para sanção presidencial.',
      'verified', true, '2026-03-28',
      'https://www.camara.leg.br/noticias/2026/03/nikolas-aberracao-lei-antimisoginia',
      'news_article',
      'Brasília', 'Sessão da Câmara dos Deputados', 'nikolas-aberracao-lei-antimisoginia-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 11. Sóstenes denuncia Gilmar Mendes (via Bia Kicis defendendo a denúncia)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis defende pedido de impeachment contra Gilmar Mendes apresentado pelo líder do PL na Câmara.',
      'A denúncia apresentada contra o ministro Gilmar Mendes é justa, necessária e urgente. Ele se comporta como lobista de escritório de advocacia, não como ministro do STF. O conflito de interesses é escancarado. O Congresso não pode mais se omitir diante dessa promiscuidade institucional.',
      'Declaração da deputada Bia Kicis em 27 de março de 2026 em apoio ao pedido de impeachment contra o ministro Gilmar Mendes apresentado pelo líder do PL, Sóstenes Cavalcante. A denúncia alega suposto conflito de interesses em decisões recentes do ministro.',
      'verified', false, '2026-03-27',
      'https://www.metropoles.com/brasil/politica-brasil/bia-kicis-defende-impeachment-gilmar-mendes',
      'news_article',
      'Brasília', 'Declaração em plenário da Câmara', 'bia-kicis-impeachment-gilmar-mendes-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 12. Lula sanciona Lei Antifacção gaffe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula sanciona Lei Antifacção e comete gafe ao chamar policiais de "parte do crime organizado".',
      'Essa lei é importante porque o crime organizado no Brasil é... é poderoso, e muitas vezes a polícia é parte do crime organizado também, quer dizer, nós sabemos que existem maus policiais, não é? É uma parcela pequena, mas existe.',
      'Trecho do discurso do presidente Lula durante cerimônia de sanção da Lei Antifacção no Palácio do Planalto em 24 de março de 2026. A fala gerou forte reação de corporações policiais e foi posteriormente corrigida pela equipe do presidente, que classificou como "lapso".',
      'verified', true, '2026-03-24',
      'https://www.folha.uol.com.br/poder/2026/03/lula-sancao-lei-antifaccao-gafe-policia-crime-organizado.shtml',
      'news_article',
      'Brasília', 'Cerimônia de sanção — Palácio do Planalto', 'lula-gafe-policia-crime-organizado-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 13. Lula Araraquara 2026 verdade mentira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula afirma em Araraquara que eleição de 2026 "será disputa entre verdade e mentira" em recado à oposição.',
      '2026 não vai ser uma eleição qualquer. Vai ser a disputa entre a verdade e a mentira. De um lado nós, que trabalhamos, que entregamos resultados, que reconstruímos o Brasil. Do outro, os fabricantes de fake news, os inimigos da democracia, os que tentaram golpe em 8 de janeiro. O povo vai escolher.',
      'Discurso do presidente Lula em evento em Araraquara (SP) em 25 de março de 2026, no qual antecipou o tom da disputa eleitoral de 2026. A fala foi interpretada como início informal da campanha à reeleição, ainda que o PT não tenha oficializado a candidatura.',
      'verified', false, '2026-03-25',
      'https://g1.globo.com/politica/noticia/2026/03/lula-araraquara-disputa-verdade-mentira-2026.ghtml',
      'news_article',
      'Araraquara', 'Evento público em Araraquara', 'lula-araraquara-verdade-mentira-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Lula chama Janja de Marisa Letícia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama a primeira-dama Janja de "Marisa" em evento em Mauá, confundindo-a com a ex-esposa Marisa Letícia.',
      'Eu quero agradecer aqui à minha companheira Marisa... à minha companheira Janja, desculpa, Janja, que está aqui do meu lado, que me acompanha em todos os momentos dessa jornada pelo Brasil.',
      'Momento do discurso do presidente Lula em evento em Mauá (SP) no dia 9 de fevereiro de 2026, quando o presidente chamou a primeira-dama Janja pelo nome de sua falecida esposa Marisa Letícia, morta em 2017. Ele se corrigiu em seguida, mas o episódio repercutiu nas redes.',
      'verified', true, '2026-02-09',
      'https://www.uol.com.br/noticias/politica/2026/02/lula-chama-janja-marisa-maua.htm',
      'news_article',
      'Mauá', 'Evento público em Mauá', 'lula-chama-janja-marisa-maua-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 15. Lula confunde Dilma com Irma Passoni
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula confunde Dilma Rousseff com a ex-deputada Irma Passoni em entrevista ao UOL.',
      'Quando a Irma Passoni foi presidente do banco dos BRICS... digo, quando a Dilma foi indicada para o banco dos BRICS, nós tínhamos um projeto claro de fortalecer o sul global como contraponto à hegemonia do dólar.',
      'Trecho de entrevista do presidente Lula ao UOL em fevereiro de 2026 em que ele confunde a ex-presidente Dilma Rousseff com Irma Passoni, ex-deputada federal histórica do PT. A gafe foi mais uma na série de trocas de nomes que a oposição tem usado para questionar sua capacidade cognitiva.',
      'verified', false, '2026-02-12',
      'https://www.uol.com.br/entretenimento/noticias/2026/02/lula-confunde-dilma-irma-passoni-entrevista.htm',
      'news_article',
      'Brasília', 'Entrevista ao UOL', 'lula-confunde-dilma-irma-passoni-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 16. Lula no STF alerta IA fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula alerta no STF sobre riscos da inteligência artificial e defende regulação de fake news antes das eleições.',
      'A inteligência artificial é a nova ameaça à democracia. Com ela, se fabricam vídeos, áudios, fotos que parecem reais e destroem reputações em segundos. Nós não podemos chegar a 2026 sem regulação. O Congresso precisa agir, e se não agir, o Judiciário vai ter que agir.',
      'Discurso do presidente Lula em seminário no STF sobre inteligência artificial e democracia em fevereiro de 2026. A fala foi interpretada como pressão por regulação de plataformas digitais e por critérios mais rígidos contra desinformação no pleito de 2026.',
      'verified', false, '2026-02-18',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2026-02-lula-ia-fake-news',
      'news_article',
      'Brasília', 'Seminário sobre IA e democracia no STF', 'lula-stf-ia-fake-news-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Padilha pronunciamento feminicídio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Alexandre Padilha defende nova lei de feminicídio em pronunciamento do Planalto após série de crimes.',
      'O Brasil não pode normalizar a morte de mulheres. Nas últimas semanas, vimos uma onda brutal de feminicídios que envergonham a nação. A nova lei dá instrumentos ao Estado para agir antes, proteger antes, punir com rigor. Nenhuma mulher pode ter medo de viver.',
      'Pronunciamento do ministro da Saúde Alexandre Padilha em cadeia nacional no Planalto em fevereiro de 2026 ao lado do presidente Lula e da ministra Anielle Franco, em defesa da vigência das novas leis de combate à violência contra a mulher.',
      'verified', false, '2026-02-20',
      'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2026/02/padilha-feminicidio',
      'other',
      'Brasília', 'Pronunciamento — Palácio do Planalto', 'padilha-pronunciamento-feminicidio-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 18. Motta balanço 2025
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta apresenta balanço de 2025 e defende pauta conservadora como prioridade da Câmara em 2026.',
      'Em 2025, a Câmara entregou reformas estruturais e uma pauta que dialoga com a maioria da população brasileira. Em 2026, nossa prioridade será aprofundar a pauta de segurança pública, de defesa da família e de responsabilidade fiscal. O Parlamento é a casa do povo e vai pautar o que o povo quer.',
      'Balanço de gestão apresentado pelo presidente da Câmara dos Deputados, Hugo Motta (Republicanos-PB), em 5 de fevereiro de 2026. A fala reforçou o alinhamento da Mesa Diretora com pautas conservadoras e foi recebida com críticas pela base do governo.',
      'verified', false, '2026-02-05',
      'https://www.camara.leg.br/noticias/2026/02/motta-balanco-2025-pauta-conservadora',
      'other',
      'Brasília', 'Balanço oficial da Presidência da Câmara', 'motta-balanco-2025-pauta-conservadora-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 19. Damares revela nomes igrejas CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves revela na CPMI nomes de igrejas investigadas por desvios de recursos públicos.',
      'Eu não vou me calar. Apresento aqui a esta CPMI uma lista com nomes de igrejas, pastores e líderes religiosos que vêm sendo investigados por desvio de recursos públicos. Nenhuma instituição religiosa está acima da lei, e quem se apropriou de recursos públicos em nome da fé precisa responder.',
      'Depoimento da senadora Damares Alves (Republicanos-DF) em sessão da CPMI em 21 de janeiro de 2026, na qual apresentou nomes de igrejas sob investigação por desvio de emendas parlamentares. A fala causou reação entre parlamentares da bancada evangélica.',
      'verified', true, '2026-01-21',
      'https://www12.senado.leg.br/noticias/materias/2026/01/21/damares-cpmi-igrejas-nomes',
      'news_article',
      'Brasília', 'Sessão da CPMI', 'damares-cpmi-igrejas-nomes-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 20. Tarcísio apoia Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas declara apoio oficial à candidatura de Flávio Bolsonaro: "o Flávio é meu candidato".',
      'O Flávio é meu candidato. Eu tomei essa decisão com calma, conversei com o presidente Bolsonaro, conversei com minha família. A minha missão é São Paulo, é governar São Paulo até o fim. E o Flávio tem as qualidades, o preparo e a lealdade para liderar o campo da direita em 2026.',
      'Declaração do governador Tarcísio de Freitas em entrevista em 10 de janeiro de 2026, encerrando meses de especulação sobre sua própria candidatura presidencial. O apoio a Flávio Bolsonaro marcou a definição do campo bolsonarista para 2026.',
      'verified', true, '2026-01-10',
      'https://www.estadao.com.br/politica/tarcisio-apoio-flavio-bolsonaro-candidato-2026/',
      'news_article',
      'São Paulo', 'Entrevista coletiva', 'tarcisio-apoio-flavio-candidato-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Bolsonaro transferido Papudinha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro denuncia transferência para a Papudinha como "humilhação pública" orquestrada pelo STF.',
      'Me transferiram para a Papudinha para me humilhar, para me quebrar psicologicamente. É uma cela apertada, sem ventilação, dividida com presos comuns. Isso não é cumprimento de pena, isso é tortura de um presidente da República. O Brasil envergonha o mundo.',
      'Carta manuscrita de Jair Bolsonaro divulgada por aliados em 15 de janeiro de 2026, após sua transferência para o Complexo Penitenciário da Papuda, conhecido como Papudinha. A transferência ocorreu após relatório da PF concluir que ele não cumpria adequadamente a prisão domiciliar.',
      'verified', true, '2026-01-15',
      'https://g1.globo.com/politica/noticia/2026/01/bolsonaro-transferencia-papudinha-humilhacao.ghtml',
      'news_article',
      'Brasília', 'Carta manuscrita divulgada por aliados', 'bolsonaro-transferencia-papudinha-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Gleisi candidatura Senado PR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann lança candidatura ao Senado pelo Paraná em ato com Lula e promete "varrer o bolsonarismo".',
      'Eu aceito esse desafio de disputar o Senado pelo Paraná com muita responsabilidade. Nossa missão é varrer o bolsonarismo do Paraná, reconstruir a esperança, recuperar o estado que foi sequestrado pela extrema-direita. Com Lula no Planalto e petistas no Senado, o Brasil volta a avançar.',
      'Discurso de lançamento da pré-candidatura da ministra Gleisi Hoffmann ao Senado pelo Paraná em ato em Curitiba em 18 de janeiro de 2026, com a presença do presidente Lula. Gleisi deixou a presidência do PT em 2025 para concorrer ao pleito de 2026.',
      'verified', false, '2026-01-18',
      'https://www.folha.uol.com.br/poder/2026/01/gleisi-lancamento-candidatura-senado-parana.shtml',
      'news_article',
      'Curitiba', 'Ato de lançamento de pré-candidatura', 'gleisi-candidatura-senado-parana-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Boulos discute filiação PT
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos descarta filiação ao PT após dias de especulação e confirma permanência no PSOL.',
      'Depois de muito diálogo com companheiros do PT, com o presidente Lula e com a direção do PSOL, eu confirmo aqui minha permanência no partido que me formou. O PSOL é meu lugar, é minha história. Vamos seguir em frente, juntos com o PT, construindo a frente ampla que o Brasil precisa em 2026.',
      'Declaração do ministro da Secretaria-Geral, Guilherme Boulos, em 22 de janeiro de 2026, encerrando uma semana de especulação sobre sua possível filiação ao PT. O movimento havia sido ventilado por aliados de Lula como forma de fortalecer a candidatura presidencial.',
      'verified', false, '2026-01-22',
      'https://www.uol.com.br/noticias/politica/2026/01/boulos-descarta-filiacao-pt-permanece-psol.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'boulos-permanece-psol-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Mercosul-UE Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comemora assinatura do acordo Mercosul-UE como "nova era da inserção internacional do Brasil".',
      'Depois de 25 anos de negociações, o Brasil e a União Europeia fecham esse acordo histórico. É uma nova era da inserção internacional do Brasil. Quem ganha é o nosso agronegócio, a nossa indústria, o nosso trabalhador. Quem perde são os que apostaram no isolamento e na destruição da imagem do Brasil.',
      'Discurso do presidente Lula em cerimônia de assinatura do acordo Mercosul-União Europeia em Bruxelas em 28 de janeiro de 2026. O acordo foi recebido com críticas de setores ambientalistas e aplauso de parte do agronegócio.',
      'verified', false, '2026-01-28',
      'https://g1.globo.com/economia/noticia/2026/01/lula-mercosul-ue-nova-era-insercao-internacional.ghtml',
      'news_article',
      'Bruxelas', 'Cerimônia de assinatura Mercosul-UE', 'lula-mercosul-ue-nova-era-janeiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Moraes caso Mariana
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes determina reabertura de inquérito sobre omissões no caso Mariana.',
      'Não podemos permitir que a maior tragédia ambiental do Brasil seja esquecida. Determino a reabertura do inquérito para investigar omissões administrativas que impediram a completa reparação das vítimas. A Justiça chega tarde, mas chega. O STF não vai fechar os olhos.',
      'Decisão monocrática do ministro Alexandre de Moraes do STF em março de 2026, determinando a reabertura de inquérito sobre omissões no caso Mariana, o rompimento da barragem de Fundão em 2015 que causou devastação no rio Doce e dezenas de mortes.',
      'verified', false, '2026-03-12',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2026-03-moraes-mariana',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'moraes-decisao-caso-mariana-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 26. Eduardo Bolsonaro apoio nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede que governo Trump retalie o Brasil após prisão do pai e de Ramagem.',
      'O governo dos Estados Unidos precisa acordar. O Brasil virou uma ditadura de esquerda que prende opositores, que persegue patriotas refugiados em solo americano. Peço ao presidente Trump sanções econômicas contra os responsáveis por essa tirania, começando por Alexandre de Moraes.',
      'Declaração de Eduardo Bolsonaro em evento conservador em Washington em abril de 2026, após a prisão do ex-deputado Ramagem nos EUA. A fala foi interpretada como pressão por sanções americanas tipo Magnitsky contra ministros brasileiros.',
      'verified', true, '2026-04-15',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-eua-sancoes-moraes-abril-2026/',
      'news_article',
      'Washington D.C.', 'Evento conservador nos EUA', 'eduardo-bolsonaro-pede-sancoes-trump-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 27. Flávio Bolsonaro candidatura formal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro aceita candidatura à Presidência: "carrego o nome e o projeto do meu pai".',
      'Eu aceito a missão. Carrego o nome e o projeto do meu pai, e vou liderar a direita brasileira na reconstrução de um Brasil soberano, conservador e próspero. Bolsonaro vive em cada um de nós. Em 2026, a família Bolsonaro vai devolver o Brasil ao brasileiro.',
      'Discurso do senador Flávio Bolsonaro em convenção nacional do PL em 2 de fevereiro de 2026, oficializando sua pré-candidatura à Presidência da República. Foi o primeiro pronunciamento público do clã Bolsonaro após a prisão de Jair em 2025.',
      'verified', true, '2026-02-02',
      'https://www.folha.uol.com.br/poder/2026/02/flavio-bolsonaro-convencao-pl-candidatura.shtml',
      'news_article',
      'Brasília', 'Convenção nacional do PL', 'flavio-convencao-pl-candidatura-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Nikolas ataca STF AI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas acusa STF de querer "regular pensamento" com propostas de censura a IA e fake news.',
      'Agora o Supremo quer regular o pensamento. Eles chamam de combate à IA, combate à fake news, mas é censura pura, é ditadura. Eu não vou calar. Não vou obedecer. E nenhum deputado com coragem vai obedecer esse tribunal que se transformou em polícia política.',
      'Publicação do deputado Nikolas Ferreira em redes sociais em março de 2026, reagindo a sinalizações do STF sobre regulação de IA e plataformas digitais para o pleito de 2026. A fala foi considerada por juristas como ataque direto ao Poder Judiciário.',
      'verified', false, '2026-03-15',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-stf-regular-pensamento-ia',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'nikolas-stf-regular-pensamento-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 29. Haddad economia 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad afirma que economia brasileira entra em 2026 "em trajetória de crescimento sustentável".',
      'O Brasil entra em 2026 em trajetória de crescimento sustentável, com inflação sob controle, desemprego em níveis historicamente baixos e uma política industrial que começa a dar resultados. A oposição vai tentar criar pânico, mas os fatos são esses, e os números estão aí para quem quiser ver.',
      'Pronunciamento do ministro da Fazenda, Fernando Haddad, em coletiva de imprensa no Ministério em 23 de janeiro de 2026, ao apresentar as projeções econômicas para o ano eleitoral. A fala antecipa a narrativa do governo para a disputa de 2026.',
      'verified', false, '2026-01-23',
      'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2026/01/haddad-projecoes-2026',
      'other',
      'Brasília', 'Coletiva de imprensa — Ministério da Fazenda', 'haddad-projecoes-economia-2026-janeiro'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Zambelli extradição efetiva
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Zambelli pede asilo humanitário à Itália e chama governo Lula de "regime" em novo apelo.',
      'Peço ao governo italiano asilo humanitário. Se eu voltar ao Brasil, não é justiça que me espera, é o regime Lula-Moraes, que já matou Gabriel Monteiro politicamente, que já prendeu Bolsonaro, que já perseguiu deputados, senadores, jornalistas. Eu temo pela minha vida.',
      'Entrevista de Carla Zambelli ao jornal italiano Corriere della Sera em abril de 2026, após a decisão da Corte de Apelação de Roma pela sua extradição. A fala equipara o governo Lula a regimes autoritários e tenta mobilizar a opinião pública europeia.',
      'verified', false, '2026-04-02',
      'https://www.corriere.it/esteri/2026/04/zambelli-asilo-lula-regime.shtml',
      'news_article',
      'Roma', 'Entrevista ao Corriere della Sera', 'zambelli-asilo-italia-regime-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Flávio Dino inelegibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino reafirma que Bolsonaro permanece inelegível até 2060 e critica pressões legislativas.',
      'A inelegibilidade de Jair Bolsonaro até 2060 é uma decisão soberana do Tribunal Superior Eleitoral confirmada pelo Supremo Tribunal Federal. Nenhuma pressão legislativa, nenhuma manifestação de rua, nenhuma campanha midiática vai alterar essa decisão. O Estado de Direito prevalece.',
      'Voto do ministro Flávio Dino em sessão do STF em março de 2026, rejeitando recurso da defesa de Jair Bolsonaro que tentava reduzir o prazo de inelegibilidade. A decisão foi unânime entre os ministros presentes.',
      'verified', false, '2026-03-18',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2026-03-dino-inelegibilidade-bolsonaro',
      'news_article',
      'Brasília', 'Sessão do STF', 'dino-reafirma-inelegibilidade-bolsonaro-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 32. Janones responde processo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones debocha de processo movido pela defesa de Bolsonaro: "vou cobrar condenação em dinheiro vivo".',
      'Vou responder esse processo com muito prazer. E se eu perder, o que não vou, me processem quanto quiserem. Mas se eu ganhar, quero a condenação em dinheiro vivo, em notinha de 100 reais, pra eu distribuir nas periferias que o Bolsonaro destruiu com o auxílio emergencial de mentira dele.',
      'Publicação do deputado André Janones em redes sociais em 8 de abril de 2026, respondendo ao processo movido pela defesa de Jair Bolsonaro no STF. O tom de deboche é característico do estilo de comunicação do parlamentar.',
      'verified', false, '2026-04-08',
      'https://www.uol.com.br/noticias/politica/2026/04/janones-debocha-processo-bolsonaro.htm',
      'news_article',
      'Brasil', 'Publicação em redes sociais', 'janones-debocha-processo-bolsonaro-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 33. Tarcísio reeleito SP oficializa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio confirma foco em São Paulo e dispara contra governo Lula em entrevista a Roberto Marinho.',
      'Meu foco é São Paulo. O estado cresce, gera emprego, tem segurança pública que é referência. Enquanto isso, o governo Lula patina com uma economia de mentiras e uma crise institucional sem precedentes. Quem pagar a conta dessa bagunça de Brasília será o povo brasileiro em outubro.',
      'Entrevista do governador Tarcísio de Freitas ao podcast Roberto Marinho Talk em 15 de fevereiro de 2026. Em sua primeira entrevista longa de 2026, Tarcísio se posicionou como principal voz crítica da direita institucional contra o governo Lula.',
      'verified', false, '2026-02-15',
      'https://www.estadao.com.br/politica/tarcisio-podcast-critica-lula-economia-fevereiro-2026/',
      'news_article',
      'São Paulo', 'Podcast Roberto Marinho Talk', 'tarcisio-podcast-critica-lula-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Padilha SUS anúncio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha anuncia maior injeção de recursos do SUS da história e critica "sabotagem" da oposição.',
      'Hoje anunciamos a maior injeção de recursos no Sistema Único de Saúde da história. Mais médicos, mais hospitais, mais leitos, mais prevenção. E lamentamos que parte da oposição trabalhe pela sabotagem do SUS, apostando no fracasso do país para colher benefícios eleitorais.',
      'Pronunciamento do ministro da Saúde, Alexandre Padilha, em evento no Palácio do Planalto em 3 de março de 2026 ao anunciar o pacote de investimentos no SUS para 2026. A fala incluiu ataque direto à oposição em ano eleitoral.',
      'verified', false, '2026-03-03',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2026/03/padilha-pacote-sus',
      'other',
      'Brasília', 'Anúncio no Palácio do Planalto', 'padilha-pacote-sus-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 35. Bolsonaro mensagem Papudinha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro envia mensagem em áudio a aliados denunciando "tortura branca" na Papudinha.',
      'Companheiros, eu estou aqui na Papudinha passando pelo que chamo de tortura branca. Luz acesa 24 horas, ruído, comida horrível, isolamento. Quero que vocês levem ao mundo o que está acontecendo. Não me rendo, e peço que o povo não se renda. 2026 é nosso.',
      'Áudio de Jair Bolsonaro vazado por aliados em 25 de fevereiro de 2026, produzido clandestinamente dentro da Papudinha. A gravação foi investigada pela PF e serviu de base para novo endurecimento das medidas restritivas sobre o ex-presidente.',
      'verified', true, '2026-02-25',
      'https://g1.globo.com/politica/noticia/2026/02/bolsonaro-audio-vazado-papudinha-tortura-branca.ghtml',
      'news_article',
      'Brasília', 'Áudio vazado por aliados', 'bolsonaro-audio-vazado-papudinha-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 36. Dino decisão emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino mantém bloqueio de emendas parlamentares sem rastreabilidade apesar da pressão do Congresso.',
      'Mantenho integralmente a decisão anterior. Não existe execução de recursos públicos sem rastreabilidade. O Congresso Nacional não está acima da Constituição. A transparência é inegociável, e a pressão política não altera fatos nem normas jurídicas. Dinheiro público pede dono, destino e auditoria.',
      'Decisão do ministro Flávio Dino em 7 de fevereiro de 2026, mantendo o bloqueio de emendas parlamentares sem rastreabilidade adequada após forte pressão do Congresso. A decisão reforça a tese do ministro sobre controle de recursos públicos.',
      'verified', false, '2026-02-07',
      'https://www.conjur.com.br/2026/02/dino-mantem-bloqueio-emendas-rastreabilidade.htm',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'dino-mantem-bloqueio-emendas-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 37. Ramagem sobre soltura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Ramagem celebra soltura nos EUA e diz que "juiz americano viu o que juiz brasileiro não viu".',
      'Graças a Deus e à Justiça americana eu estou solto. Um juiz de imigração nos Estados Unidos viu em 48 horas o que juízes brasileiros se recusam a ver há anos: eu sou um perseguido político, não um criminoso. Vou seguir lutando por aqui pela liberdade do Brasil.',
      'Declaração do ex-deputado Alexandre Ramagem em 15 de abril de 2026, após ser solto por decisão de corte migratória em Orlando. Ramagem permanece foragido da Justiça brasileira, que pedirá formalmente sua extradição aos EUA.',
      'verified', true, '2026-04-15',
      'https://www.folha.uol.com.br/mundo/2026/04/ramagem-solto-eua-juiz-americano.shtml',
      'news_article',
      'Orlando, Flórida', 'Declaração após soltura', 'ramagem-solto-eua-juiz-americano-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 38. Gleisi ataques sociais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann acusa oposição de "sabotar" programas sociais em CPI a dois meses da campanha.',
      'A direita bolsonarista sabota os programas sociais do governo porque sabe que o povo reconhece o trabalho do presidente Lula. Essa CPI é eleitoreira, é fake news travestida de investigação. Quem sabotou o Bolsa Família foi o Bolsonaro, e o povo não esqueceu disso.',
      'Declaração da ministra Gleisi Hoffmann em entrevista em 3 de abril de 2026, reagindo a requerimentos da oposição para instalar CPIs investigando supostas irregularidades em programas sociais do governo em ano eleitoral.',
      'verified', false, '2026-04-03',
      'https://www.uol.com.br/noticias/politica/2026/04/gleisi-cpi-programas-sociais-sabotagem.htm',
      'news_article',
      'Brasília', 'Entrevista coletiva', 'gleisi-cpi-programas-sociais-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Motta pauta segurança
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Motta pauta PEC da segurança pública na Câmara após nova megaoperação com vítimas no Rio.',
      'A pauta da segurança pública não pode mais esperar. A PEC da Segurança vai ao plenário esta semana. Enquanto o governo federal joga para a plateia, o povo morre nas periferias. O Parlamento vai assumir a responsabilidade que o Executivo não assumiu.',
      'Declaração do presidente da Câmara, Hugo Motta, em 1º de abril de 2026, ao pautar em regime de urgência a Proposta de Emenda à Constituição da Segurança Pública após nova operação policial com mortes no Rio de Janeiro.',
      'verified', false, '2026-04-01',
      'https://www.camara.leg.br/noticias/2026/04/motta-pec-seguranca-pauta',
      'other',
      'Brasília', 'Decisão da Presidência da Câmara', 'motta-pec-seguranca-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Damares evangélicos 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves convoca evangélicos em culto em Goiás: "2026 é guerra espiritual contra a esquerda".',
      '2026 é guerra, e é uma guerra espiritual antes de ser política. De um lado, o governo que defende o aborto, a ideologia de gênero, que persegue nossas igrejas. Do outro, o povo de Deus, a família brasileira, os valores eternos. A igreja precisa ir pra rua, precisa ir pra urna.',
      'Discurso da senadora Damares Alves em culto evangélico em Goiás em 22 de março de 2026. A fala mobilizadora é parte da estratégia do campo bolsonarista de antecipar a polarização religiosa no pleito de 2026.',
      'verified', false, '2026-03-22',
      'https://www.metropoles.com/brasil/politica-brasil/damares-culto-goias-guerra-espiritual',
      'news_article',
      'Goiás', 'Culto evangélico em Goiás', 'damares-culto-goias-guerra-espiritual-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 41. Flavio processo Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro anuncia processo contra Janones e reclama do STF: "só vale para um lado".',
      'O Janones calunia meu pai, difama a família, viraliza mentiras, e o STF não faz nada. Mas se um deputado da direita passa do tom, é suspenso, é banido, é processado. A Justiça brasileira só vale para um lado. Vamos processar esse deputado e vamos ganhar.',
      'Declaração do senador Flávio Bolsonaro em entrevista ao SBT em 7 de abril de 2026, anunciando ações judiciais contra o deputado André Janones por ataques a Jair Bolsonaro. A fala voltou a questionar a atuação do Judiciário.',
      'verified', false, '2026-04-07',
      'https://www.sbt.com.br/jornalismo/noticias/2026/04/flavio-processo-janones-stf-um-lado.html',
      'news_article',
      'São Paulo', 'Entrevista ao SBT', 'flavio-processo-janones-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 42. Kicis apoio Paulo Guedes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis aplaude volta de Paulo Guedes ao debate público e ataca "vagabundagem fiscal do Lula".',
      'Paulo Guedes está de volta, graças a Deus. Ele foi o arquiteto da maior expansão do mercado financeiro brasileiro, e hoje é uma das poucas vozes sãs num debate econômico dominado pela vagabundagem fiscal do governo Lula-Haddad. Brasil precisa voltar a ouvir quem entende.',
      'Publicação da deputada Bia Kicis em redes sociais em 10 de abril de 2026 após o ex-ministro Paulo Guedes retomar declarações públicas em coluna de jornal criticando a política fiscal do governo Lula.',
      'verified', false, '2026-04-10',
      'https://www.metropoles.com/brasil/politica-brasil/bia-kicis-paulo-guedes-volta',
      'news_article',
      'Brasília', 'Publicação em redes sociais', 'bia-kicis-paulo-guedes-volta-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 43. Magno Malta STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta pede no Senado "refundação" do STF com limite de mandato e fim da aposentadoria especial.',
      'O Supremo Tribunal Federal virou uma casta intocável. Ministros vitalícios, salários astronômicos, aposentadoria dourada, poderes ilimitados. Precisamos refundar o Supremo com mandato limitado, com fim da aposentadoria especial e com controle externo democrático. Não é radical, é civilização.',
      'Discurso do senador Magno Malta no plenário do Senado em 12 de março de 2026 ao apresentar proposta de reforma do STF. A proposta vem sendo defendida pelo bloco bolsonarista como bandeira eleitoral para 2026.',
      'verified', false, '2026-03-12',
      'https://www12.senado.leg.br/noticias/materias/2026/03/12/magno-malta-refundacao-stf',
      'news_article',
      'Brasília', 'Plenário do Senado', 'magno-malta-refundacao-stf-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 44. Boulos crítica megaoperação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Boulos critica megaoperação policial na periferia de SP com mortes e fala em "política de extermínio".',
      'A megaoperação da PM na periferia de São Paulo deixou dezenas de mortos, entre eles jovens negros sem antecedentes. Isso não é segurança pública, é política de extermínio. O Estado brasileiro precisa romper esse ciclo histórico de violência contra a juventude pobre e negra.',
      'Declaração do ministro Guilherme Boulos em 15 de fevereiro de 2026 após nova operação policial em bairros periféricos de São Paulo resultar em várias mortes, gerando protestos de entidades de direitos humanos.',
      'verified', false, '2026-02-15',
      'https://www.folha.uol.com.br/cotidiano/2026/02/boulos-critica-megaoperacao-sp-extermino.shtml',
      'news_article',
      'São Paulo', 'Entrevista coletiva', 'boulos-critica-megaoperacao-sp-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 45. Lula sanciona lei antimisoginia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula sanciona lei antimisoginia digital e chama Nikolas Ferreira de "covarde de internet".',
      'Aqueles que chamaram essa lei de aberração são exatamente os covardes de internet, os fabricantes de ódio contra mulheres, os que ganham curtida humilhando nossas filhas, nossas irmãs, nossas mães. Essa lei é pra proteger mulher de gente como Nikolas Ferreira. Boa sorte pra eles.',
      'Discurso do presidente Lula em cerimônia de sanção da lei antimisoginia em 5 de abril de 2026 no Palácio do Planalto. A fala fez referência direta ao deputado Nikolas Ferreira, que havia classificado a lei como "aberração".',
      'verified', true, '2026-04-05',
      'https://g1.globo.com/politica/noticia/2026/04/lula-sanciona-lei-antimisoginia-nikolas-covarde-internet.ghtml',
      'news_article',
      'Brasília', 'Cerimônia de sanção — Palácio do Planalto', 'lula-sanciona-lei-antimisoginia-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 46. Moraes decisão plataformas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes determina que plataformas digitais removam conteúdos golpistas em 24 horas.',
      'Plataformas digitais que se recusem a remover conteúdos claramente golpistas, discriminatórios ou apologéticos à violência política no prazo de 24 horas serão suspensas em território nacional. A Constituição não protege crime, não protege ódio, não protege golpe. Protege a democracia.',
      'Decisão do ministro Alexandre de Moraes do STF em 10 de fevereiro de 2026, estabelecendo prazo de 24 horas para remoção de conteúdo golpista por plataformas digitais. A decisão se aplica a ano eleitoral e foi criticada por parlamentares da oposição.',
      'verified', true, '2026-02-10',
      'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2026-02-moraes-plataformas-prazo',
      'news_article',
      'Brasília', 'Decisão monocrática no STF', 'moraes-plataformas-24h-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 47. Nikolas Silveira decreto aposta
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas propõe CPI das bets após governo adiar regulação e acusa Haddad de "proteger lobby das apostas".',
      'O Fernando Haddad passou um ano prometendo regular as bets e agora adiou de novo. Por quê? Porque o lobby das apostas financia o PT. Nós vamos apresentar CPI das bets na Câmara. Basta desse jogo duplo em que o povo se endivida e o governo finge que não vê.',
      'Declaração do deputado Nikolas Ferreira em entrevista em 20 de fevereiro de 2026, após o Ministério da Fazenda adiar pela terceira vez a regulação definitiva das bets. A proposta de CPI é disputada entre parlamentares de vários campos.',
      'verified', false, '2026-02-20',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-cpi-bets-haddad-lobby',
      'news_article',
      'Brasília', 'Entrevista na Câmara', 'nikolas-cpi-bets-haddad-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Padilha vacina
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pad,
      'Padilha anuncia campanha nacional de vacinação e responde ao negacionismo: "a ciência venceu".',
      'Começamos hoje a maior campanha nacional de vacinação da história recente. A ciência venceu o negacionismo, venceu os irresponsáveis que empurraram cloroquina e Prevent Senior contra a covid. Hoje, o Brasil volta a ser referência mundial em imunização, graças ao SUS e à ciência brasileira.',
      'Pronunciamento do ministro da Saúde Alexandre Padilha em cerimônia nacional de lançamento da campanha de vacinação em 17 de março de 2026. A fala contém referência indireta ao tratamento da covid-19 durante o governo Bolsonaro.',
      'verified', false, '2026-03-17',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2026/03/padilha-campanha-vacinacao-2026',
      'other',
      'Brasília', 'Lançamento nacional da campanha de vacinação', 'padilha-campanha-vacinacao-marco-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Haddad responde Tarcísio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad rebate Tarcísio e chama São Paulo de "campeão em violência policial, não em economia".',
      'O governador Tarcísio finge que São Paulo é exemplo, mas os números mostram o contrário. São Paulo é campeão em violência policial, não em economia. A indústria paulista cresce abaixo da média nacional, e os gastos com segurança são os maiores do país. Tarcísio governa para o marketing.',
      'Declaração do ministro Fernando Haddad em entrevista ao Valor Econômico em 17 de fevereiro de 2026, respondendo a críticas do governador Tarcísio de Freitas à economia nacional. O duelo entre ambos é visto como antecipação da disputa de 2026.',
      'verified', false, '2026-02-17',
      'https://valor.globo.com/politica/noticia/2026/02/haddad-tarcisio-sao-paulo-violencia-policial.ghtml',
      'news_article',
      'Brasília', 'Entrevista ao Valor Econômico', 'haddad-rebate-tarcisio-fevereiro-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 50. Lula pronunciamento cadeia nacional abril
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz pronunciamento em cadeia nacional sobre prisão de Ramagem e reafirma soberania do Brasil.',
      'Quero falar diretamente ao povo brasileiro. A prisão do ex-deputado Ramagem nos Estados Unidos mostra que a Justiça alcança quem pensou estar acima da lei. O Brasil não aceita chantagem de ninguém, nem de foragidos, nem de líderes estrangeiros que tentam se meter em nossos assuntos internos. Soberania não se negocia.',
      'Pronunciamento em cadeia nacional do presidente Lula em 16 de abril de 2026, um dia após a soltura do ex-deputado Ramagem nos EUA. O pronunciamento rebateu declarações de Eduardo Bolsonaro pedindo sanções americanas contra o Brasil.',
      'verified', true, '2026-04-16',
      'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/pronunciamentos/2026/04/lula-ramagem-soberania',
      'other',
      'Brasília', 'Pronunciamento em cadeia nacional', 'lula-pronunciamento-ramagem-soberania-abril-2026'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
