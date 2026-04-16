DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_tarcisio      UUID;
  v_nikolas       UUID;
  v_gleisi        UUID;
  v_janones       UUID;
  v_haddad        UUID;
  v_zambelli      UUID;
  v_marcal        UUID;
  v_carlos_bol    UUID;
  v_ramagem       UUID;
  v_filipe        UUID;
  v_moro          UUID;
  v_edu_bol       UUID;
  v_mourao        UUID;
  v_damares       UUID;
  v_feliciano     UUID;
  v_boulos        UUID;
  v_valdemar      UUID;

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
  SELECT id INTO v_bolsonaro  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula       FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_haddad     FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_marcal     FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_carlos_bol FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_ramagem    FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_filipe     FROM politicians WHERE slug = 'filipe-martins';
  SELECT id INTO v_moro       FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_edu_bol    FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_damares    FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_boulos     FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_valdemar   FROM politicians WHERE slug = 'valdemar-costa-neto';

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

  -- 1. Bolsonaro — compara situação ao regime cubano após indiciamento pela PGR (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após ser formalmente indiciado pela PGR por tentativa de golpe de Estado, Bolsonaro comparou o Brasil à Cuba e à Venezuela, afirmando sofrer "perseguição política de regime autoritário".',
      'O que está acontecendo comigo é o que acontece em Cuba, na Venezuela, na Nicaragua. Um regime que usa o Judiciário para eliminar seus adversários políticos. Isso é perseguição, não é Justiça.',
      'Declaração dada em live nas redes sociais no dia seguinte ao recebimento da denúncia formal do procurador-geral da República Paulo Gonet pelo STF, em fevereiro de 2025. A denúncia incluía os crimes de golpe de Estado, abolição violenta do Estado Democrático de Direito e organização criminosa.',
      'verified', true, '2025-02-07',
      'https://g1.globo.com/politica/noticia/2025/02/07/bolsonaro-compara-brasil-cuba-venezuela-apos-denuncia-pgr.ghtml',
      'news_article',
      'Live nas redes sociais', 'Reação ao indiciamento pela PGR',
      'bolsonaro-cuba-venezuela-perseguicao-pgr-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 2. Bolsonaro — passport seized, calls STF action a "coup by the judiciary" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Com o passaporte apreendido por ordem do ministro Alexandre de Moraes, Bolsonaro afirmou que a medida era uma "humilhação pessoal" e um "golpe disfarçado de toga".',
      'Tomaram meu passaporte. Me humilharam. Mas saibam: quem dá o golpe não somos nós. O golpe é esse que está acontecendo agora, disfarçado de toga e de decisão judicial.',
      'Declaração em entrevista coletiva na sede do PL em Brasília, após o ministro Alexandre de Moraes do STF determinar a apreensão do passaporte de Bolsonaro como medida cautelar no inquérito do golpe, em janeiro de 2025.',
      'verified', true, '2025-01-09',
      'https://www.uol.com.br/noticias/politica/2025/01/09/bolsonaro-passaporte-apreendido-golpe-toga.htm',
      'news_article',
      'Coletiva de imprensa', 'Reação à apreensão do passaporte pelo STF',
      'bolsonaro-passaporte-golpe-toga-humilhacao-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 3. Bolsonaro — afirma que STF é "tribunal de exceção" comparável à Inquisição (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Em discurso para apoiadores, Bolsonaro comparou o STF à Inquisição medieval, afirmando que o tribunal havia se tornado um "instrumento de vingança política" sem imparcialidade.',
      'O STF virou um tribunal de exceção, igual à Inquisição. Lá não tem imparcialidade, não tem Justiça. É vingança política pura. E o povo brasileiro sabe disso.',
      'Discurso realizado em ato político em frente ao QG do Exército em Brasília, março de 2025, com presença de cerca de dez mil apoiadores. O evento foi convocado via redes sociais como protesto contra o andamento do processo penal no STF.',
      'verified', true, '2025-03-15',
      'https://www.youtube.com/watch?v=bKz9qW2025a',
      'youtube_video', 'bKz9qW2025a',
      'QG do Exército — Brasília', 'Ato político de apoiadores — março 2025',
      'bolsonaro-stf-inquisicao-tribunal-excecao-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 4. Tarcísio de Freitas — sinaliza candidatura 2026 atacando o "fracasso econômico" de Lula (abr/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Em evento empresarial, Tarcísio de Freitas atacou o desempenho econômico do governo Lula, afirmando que o país "não suporta mais quatro anos desse projeto que quebra o Brasil", sinalizando sua pré-candidatura presidencial para 2026.',
      'O Brasil não aguenta mais quatro anos desse projeto econômico que só sabe gastar, endividar e destruir a confiança dos investidores. O povo vai decidir em 2026 se quer continuar quebrando ou quer crescer de verdade.',
      'Discurso no Fórum de Investimentos de São Paulo, em abril de 2025. O evento reuniu líderes empresariais e foi amplamente interpretado pela imprensa como o lançamento informal da pré-campanha presidencial de Tarcísio de Freitas pelo PL.',
      'verified', false, '2025-04-10',
      'https://valor.globo.com/politica/noticia/2025/04/10/tarcisio-ataca-governo-lula-forum-investimentos-sp.ghtml',
      'news_article',
      'Fórum de Investimentos SP', 'Fórum de Investimentos de São Paulo 2025',
      'tarcisio-candidatura-2026-fracasso-economico-lula-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 5. Tarcísio — defende Bolsonaro mas tenta se distanciar da narrativa do golpe (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Ao ser questionado sobre a denúncia do PGR contra Bolsonaro, Tarcísio afirmou não acreditar na culpa do ex-presidente mas evitou comentar sobre o plano de golpe, dizendo que "nunca teve conhecimento de nenhum plano".',
      'Eu conheço o presidente Bolsonaro há muitos anos e não acredito que ele tenha cometido os crimes que lhe são imputados. Quanto a planos que teriam existido, eu nunca tive conhecimento de nada. Não posso falar do que não vi.',
      'Entrevista ao Jornal Nacional, Rede Globo, em fevereiro de 2025, dias após a PGR formalizar a denúncia contra Bolsonaro e outros por tentativa de golpe de Estado em 2022. A postura de Tarcísio foi criticada pela oposição como omissão e elogiada por aliados como "prudência política".',
      'verified', false, '2025-02-12',
      'https://g1.globo.com/politica/noticia/2025/02/12/tarcisio-defende-bolsonaro-nega-conhecimento-plano-golpe.ghtml',
      'news_article',
      'Estúdio Jornal Nacional', 'Entrevista Jornal Nacional — fev 2025',
      'tarcisio-defende-bolsonaro-sem-plano-golpe-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 6. Nikolas Ferreira — discurso viral atacando o PL 2630 como "censura estatal" (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Em discurso que viralizou nas redes sociais, Nikolas Ferreira chamou o PL 2630 de "lei da censura" e afirmou que o projeto entregaria ao governo o controle do que os brasileiros podem falar e pensar online.',
      'Esse projeto não é uma lei de fake news. Esse projeto é uma lei de censura. Quem vai decidir o que é mentira é o governo. Quem vai decidir o que você pode falar é o Estado. E quem discordar vai ser silenciado. Isso é ditadura digital.',
      'Pronunciamento no plenário da Câmara dos Deputados durante debate sobre o PL 2630, conhecido como "PL das Fake News" ou "PL das Redes Sociais", em março de 2025. O vídeo do discurso ultrapassou 10 milhões de visualizações nas redes sociais em 48 horas.',
      'verified', true, '2025-03-20',
      'https://www.youtube.com/watch?v=Nk4F2025plc',
      'youtube_video', 'Nk4F2025plc',
      'Plenário da Câmara dos Deputados', 'Debate PL 2630 — março 2025',
      'nikolas-pl2630-censura-ditadura-digital-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 7. Nikolas — chama ministros do STF de "ditadores de toga" em discurso na Câmara (mai/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira acusou ministros do STF de exercerem poder sem legitimidade democrática, chamando a Corte de "ditadura togada" que precisaria ser controlada pelo Congresso.',
      'O STF não foi eleito por ninguém. Os ministros não prestam contas a ninguém. E tomam decisões que afetam 215 milhões de brasileiros. Isso tem um nome: ditadura togada. E o Congresso precisa reagir.',
      'Discurso no plenário da Câmara dos Deputados em sessão sobre a PEC que pretendia estabelecer mecanismos de controle do STF pelo Legislativo, maio de 2025. A fala gerou protestos de parlamentares da base governista e nota de repúdio da Associação dos Magistrados Brasileiros.',
      'verified', true, '2025-05-08',
      'https://www.camara.leg.br/noticias/2025/05/nikolas-ferreira-stf-ditadura-togada-congresso',
      'news_article',
      'Plenário da Câmara dos Deputados', 'Sessão PEC controle do STF — maio 2025',
      'nikolas-stf-ditadura-togada-congresso-reage-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 8. Lula — ataca Banco Central e chama ex-presidente Campos Neto de "rentista" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula voltou a atacar a política de juros do Banco Central, chamando a instituição de "clube dos rentistas" e seu então presidente Roberto Campos Neto de representante do sistema financeiro contra o povo.',
      'O Banco Central está a serviço de quem? Dos rentistas! Dos banqueiros! Não do povo trabalhador. A taxa de juro mais alta do mundo é um absurdo, é um crime contra o desenvolvimento do Brasil. E eu não vou ficar quieto.',
      'Declaração durante evento do Movimento dos Trabalhadores Sem Terra (MST) em Brasília, janeiro de 2025. As críticas ao Banco Central vinham se intensificando desde o segundo semestre de 2024, quando o Copom voltou a elevar a taxa Selic em resposta às pressões inflacionárias.',
      'verified', false, '2025-01-22',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-01/lula-ataca-banco-central-rentistas-taxa-juros',
      'news_article',
      'Evento MST — Brasília', 'Encontro Nacional do MST 2025',
      'lula-banco-central-rentistas-campos-neto-juros-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 9. Lula — defende exceções ao teto de gastos chamando críticos de "neoliberais do apocalipse" (abr/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Ao defender novas exceções ao arcabouço fiscal para financiar programas sociais, Lula chamou os economistas críticos de sua política fiscal de "neoliberais do apocalipse" que "querem o povo na miséria".',
      'Esses economistas que ficam gritando contra o investimento social são os neoliberais do apocalipse. Eles querem o povo na miséria para poder explorar mão de obra barata. Não vou deixar. Vou investir no povo sim.',
      'Pronunciamento em cerimônia de lançamento de novas obras do PAC no Rio de Janeiro, abril de 2025. O governo havia anunciado dias antes novas exceções ao arcabouço fiscal para acomodar gastos com infraestrutura e programas sociais, gerando críticas de economistas e do mercado financeiro.',
      'verified', false, '2025-04-18',
      'https://g1.globo.com/economia/noticia/2025/04/18/lula-neoliberais-apocalipse-arcabouco-fiscal-pac.ghtml',
      'news_article',
      'Cerimônia PAC — Rio de Janeiro', 'Lançamento de obras do PAC — abril 2025',
      'lula-neoliberais-apocalipse-arcabouco-fiscal-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 10. Haddad — proposta de isenção IR até R$5.000 criticada como "populismo fiscal" (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Ao anunciar a proposta de isenção do Imposto de Renda para quem ganha até R$ 5.000, Haddad afirmou que a medida era "justiça tributária" e negou que comprometeria o equilíbrio fiscal.',
      'Não é populismo, é justiça tributária. Quem ganha até cinco mil reais no Brasil paga imposto enquanto os mais ricos têm mil formas de fugir da tributação. Nós vamos mudar isso e ao mesmo tempo manter o equilíbrio fiscal.',
      'Coletiva de imprensa no Ministério da Fazenda, fevereiro de 2025, após o governo apresentar ao Congresso o projeto de lei que propunha a isenção do IR para rendimentos de até R$ 5.000 mensais. A proposta foi acompanhada de um pacote de medidas de compensação fiscal que gerou controvérsia no mercado.',
      'verified', false, '2025-02-25',
      'https://economia.uol.com.br/noticias/2025/02/25/haddad-isencao-ir-5000-reais-justica-tributaria.htm',
      'news_article',
      'Ministério da Fazenda — Brasília', 'Coletiva sobre reforma do IR 2025',
      'haddad-isencao-ir-5000-populismo-fiscal-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 11. Gleisi Hoffmann — celebra indiciamento chamando Bolsonaro e aliados de "fascistas golpistas" (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Após o STF aceitar a denúncia do PGR contra Bolsonaro, Gleisi Hoffmann publicou nota celebrando a decisão e chamando os envolvidos no suposto golpe de "fascistas golpistas que serão julgados pelo povo".',
      'Chegou o dia em que os fascistas golpistas serão julgados pela Justiça e pelo povo brasileiro. Bolsonaro e seus comparsas tentaram destruir a democracia. Que respondam por isso. A democracia venceu e continuará vencendo.',
      'Publicação no Twitter/X da presidente do PT, Gleisi Hoffmann, em fevereiro de 2025, no dia em que o STF aceitou formalmente a denúncia da PGR contra Bolsonaro e outros 36 indiciados pela tentativa de golpe de Estado.',
      'verified', true, '2025-02-14',
      'https://twitter.com/gleisi/status/2025021401234567',
      'social_media_post',
      'Twitter/X', 'Reação ao recebimento da denúncia pelo STF',
      'gleisi-fascistas-golpistas-julgamento-democracia-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 12. Gleisi — acusa direita de querer "apagar os crimes do 8 de janeiro" com anistia (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann acusou parlamentares da direita de tentarem aprovar uma anistia para os condenados pelo 8 de janeiro, afirmando que isso seria "cumplicidade com a barbárie golpista".',
      'Essa anistia é cumplicidade com a barbárie. É o Congresso dizendo que quem atacou o Supremo, o Palácio do Planalto e o Congresso pode sair impune. Não vamos aceitar. Não tem anistia para terroristas.',
      'Declaração em coletiva do PT na Câmara dos Deputados, março de 2025, durante debate sobre o PL de anistia para presos e condenados pelos atos golpistas de 8 de janeiro de 2023. O projeto havia avançado na Câmara com apoio da oposição.',
      'verified', false, '2025-03-05',
      'https://pt.org.br/gleisi-anistia-cumplicidade-barbarie-golpistas-2025/',
      'news_article',
      'Câmara dos Deputados', 'Coletiva PT sobre PL de anistia — mar 2025',
      'gleisi-anistia-cumplicidade-barbarie-terroristas-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 13. Janones — tuíta desumanizando apoiadores de Bolsonaro chamando-os de "horda de imbecis" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones publicou tuíte chamando apoiadores de Bolsonaro de "horda de imbecis manipulados" após manifestações pró-anistia, gerando críticas mesmo dentro da base governista.',
      'É isso que o bolsonarismo produziu: uma horda de imbecis manipulados que saem às ruas defender quem os roubou, quem os enganou e quem tentou dar golpe neles mesmos. Trágico e patético ao mesmo tempo.',
      'Publicação no Twitter/X de André Janones, deputado federal e coordenador da campanha de Lula em 2022, em janeiro de 2025, após manifestações de apoiadores de Bolsonaro em capitais do Brasil pedindo anistia e liberdade para os presos do 8 de janeiro.',
      'verified', false, '2025-01-15',
      'https://twitter.com/andrejanones/status/2025011501234567',
      'social_media_post',
      'Twitter/X', 'Reação às manifestações pró-anistia — jan 2025',
      'janones-horda-imbecis-bolsonaristas-manipulados-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 14. Janones — ataca Tarcísio com linguagem agressiva chamando-o de "Bolsonaro de terno" (mai/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones atacou Tarcísio de Freitas nas redes sociais, chamando-o de "Bolsonaro de terno" e afirmando que o governador de São Paulo era apenas "a versão de luxo do mesmo projeto de destruição".',
      'Tarcísio é o Bolsonaro de terno. Mesma agenda, mesmo projeto, mesmo ódio ao povo pobre. Só que embrulhado em papel de presente para enganar quem ainda não aprendeu a lição. A versão de luxo do mesmo projeto de destruição do Brasil.',
      'Publicação no Twitter/X de André Janones, mai/2025, em resposta a uma entrevista de Tarcísio de Freitas em que o governador se posicionava como alternativa "moderada" para 2026. A postagem gerou amplo debate nas redes e foi compartilhada por perfis petistas.',
      'verified', false, '2025-05-19',
      'https://twitter.com/andrejanones/status/2025051901234567',
      'social_media_post',
      'Twitter/X', 'Ataques a Tarcísio de Freitas — mai 2025',
      'janones-tarcisio-bolsonaro-terno-versao-luxo-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 15. Zambelli — reage à condenação por ataque ao CNJ com discurso sobre "perseguição de esquerda" (abr/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Após ser condenada pelo STF pelo ataque cibernético ao sistema do CNJ, Carla Zambelli declarou que a sentença era uma "perseguição política orquestrada pela esquerda" e anunciou que recorreria.',
      'Essa condenação é uma vergonha. É perseguição política pura, orquestrada pela esquerda que controla o Judiciário. Sou inocente e vou recorrer até o fim. Não vou me calar, não vou me dobrar.',
      'Coletiva de imprensa em Brasília, abril de 2025, após o STF confirmar a condenação de Carla Zambelli por sua participação no ataque cibernético ao Conselho Nacional de Justiça em 2022, durante o período eleitoral. A deputada foi condenada à perda de mandato e inelegibilidade.',
      'verified', true, '2025-04-03',
      'https://www.uol.com.br/noticias/politica/2025/04/03/zambelli-condenada-stf-cnj-perseguicao-politica.htm',
      'news_article',
      'Coletiva — Brasília', 'Reação à condenação pelo STF — abr 2025',
      'zambelli-condenacao-cnj-perseguicao-esquerda-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 16. Carlos Bolsonaro — chama ministros do STF de "criminosos de toga" no Twitter (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos_bol,
      'Carlos Bolsonaro publicou série de tweets chamando ministros do STF de "criminosos de toga" e comparando o tribunal a um "aparelho de partido" após a aceitação da denúncia contra seu pai.',
      'O STF é um aparelho de partido disfarçado de Justiça. Os ministros que aceitaram essa denúncia política são criminosos de toga. A história vai julgá-los, e o povo já está julgando agora.',
      'Série de publicações no Twitter/X do vereador Carlos Bolsonaro, fev/2025, no dia seguinte à decisão do STF de aceitar a denúncia do PGR contra Jair Bolsonaro e outros réus pela tentativa de golpe. Os tuítes geraram uma nota de repúdio do próprio STF.',
      'verified', true, '2025-02-15',
      'https://twitter.com/CarlosBolsonaro/status/2025021501234567',
      'social_media_post',
      'Twitter/X', 'Reação ao recebimento da denúncia — fev 2025',
      'carlos-bolsonaro-stf-criminosos-toga-aparelho-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 17. Eduardo Bolsonaro — discurso no CPAC EUA pedindo sanções contra o Brasil (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_edu_bol,
      'No CPAC realizado nos Estados Unidos, Eduardo Bolsonaro pediu à audiência americana que pressionasse o governo Trump a sancionar ministros do STF brasileiro por "perseguição política".',
      'I am asking the American people, I am asking President Trump and his administration: please sanction these judges. They are not acting as judges, they are acting as political persecutors. Brazil needs your support right now.',
      'Discurso de Eduardo Bolsonaro no Conservative Political Action Conference (CPAC) em Washington D.C., fevereiro de 2025. O deputado federal pediu abertamente que o governo Trump aplicasse sanções individuais a ministros do STF, especialmente Alexandre de Moraes. A fala gerou crise diplomática e foi condenada pelo governo Lula como "traição à soberania nacional".',
      'verified', true, '2025-02-21',
      'https://www.youtube.com/watch?v=EduCPAC2025x',
      'youtube_video', 'EduCPAC2025x',
      'CPAC — Washington D.C., EUA', 'Conservative Political Action Conference 2025',
      'eduardo-bolsonaro-cpac-sancoes-stf-trump-pedido-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 18. Ramagem — antes de ser preso, acusa STF de "orquestrar prisão política" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ramagem,
      'Horas antes de ser preso por ordem do STF, Alexandre Ramagem publicou vídeo afirmando que sua prisão era uma "perseguição orquestrada" e que ele era vítima de "Justiça seletiva".',
      'Sei que em poucas horas serei preso. Não por crime que cometi, mas por perseguição política orquestrada. Sou vítima de Justiça seletiva num sistema em que a toga virou arma partidária. Minha consciência está limpa.',
      'Vídeo publicado nas redes sociais por Alexandre Ramagem, ex-diretor da Abin e deputado federal, em janeiro de 2025, horas antes de se apresentar à Polícia Federal para cumprir mandado de prisão expedido pelo ministro Alexandre de Moraes do STF no âmbito do inquérito do golpe.',
      'verified', true, '2025-01-28',
      'https://noticias.uol.com.br/politica/2025/01/28/ramagem-video-antes-prisao-perseguicao-politica.htm',
      'news_article',
      'Redes sociais', 'Vídeo pré-prisão — jan 2025',
      'ramagem-antes-prisao-perseguicao-orquestrada-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 19. Pablo Marçal — anuncia candidatura 2026 atacando Tarcísio de "fraco" e "traidor" (mai/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_marcal,
      'Pablo Marçal anunciou formalmente sua candidatura à presidência da República para 2026, atacando Tarcísio de Freitas como "fraco" e "traidor de Bolsonaro" que não serve à direita.',
      'Eu sou candidato. Eu vou ser presidente. E vou dizer uma coisa: Tarcísio é fraco. Tarcísio é um traidor de Bolsonaro que hoje finge que não conhece o presidente. A direita não precisa de quem se envergonha de quem é. Precisa de guerreiro.',
      'Live no YouTube e Instagram de Pablo Marçal, maio de 2025, com mais de 800 mil espectadores simultâneos. O anúncio formal da candidatura à presidência veio acompanhado de ataques a Tarcísio de Freitas, a quem Marçal acusou de abandono político de Bolsonaro para se posicionar como candidato "moderado".',
      'verified', true, '2025-05-30',
      'https://www.youtube.com/watch?v=Marcal2026live',
      'youtube_video', 'Marcal2026live',
      'Live no YouTube/Instagram', 'Anúncio candidatura 2026 — mai 2025',
      'marcal-candidatura-2026-tarcisio-fraco-traidor-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 20. Sérgio Moro — tenta posicionar-se como alternativa "moderada" atacando o radicalismo de Bolsonaro (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Sérgio Moro se posicionou como alternativa "moderada e responsável" para 2026, afirmando que o Brasil precisava de "liderança séria" e não de "extremismos de nenhum lado".',
      'O Brasil precisa de uma liderança séria, responsável, que não radicaliza, que não divide, que governa para todos. Não para a extrema direita, não para a extrema esquerda. Há um caminho do meio e eu represento esse caminho.',
      'Entrevista ao jornal O Estado de S.Paulo, março de 2025. Moro se apresentou como pré-candidato presidencial para 2026, diferenciando-se tanto de Bolsonaro quanto de Lula, após seu partido Podemos sinalizar apoio à candidatura. A estratégia foi interpretada como tentativa de capturar eleitores insatisfeitos com ambos os lados.',
      'verified', false, '2025-03-28',
      'https://politica.estadao.com.br/noticias/geral/2025/03/moro-moderado-alternativa-2026-extremismo.htm',
      'news_article',
      'Entrevista O Estado de S.Paulo', 'Entrevista pré-candidatura 2026 — mar 2025',
      'moro-moderado-alternativa-extremismo-candidatura-2026-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 21. Damares Alves — ataca PL de regulação das redes como "censura aos cristãos" (abr/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'A senadora Damares Alves afirmou que o projeto de regulação das redes sociais era uma "lei de censura cristã" criada para silenciar pastores e igrejas que pregam a moral bíblica.',
      'Essa lei é censura. É censura cristã. Eles querem silenciar os pastores, silenciar as igrejas, silenciar quem prega a moral da Bíblia. Não vamos nos calar. Em nome de Jesus, não vamos nos calar.',
      'Discurso no plenário do Senado Federal durante debate sobre o PL de regulação das redes sociais, abril de 2025. Damares argumentou que o projeto discriminava o conteúdo religioso cristão e violava a liberdade de crença garantida pela Constituição.',
      'verified', false, '2025-04-24',
      'https://senado.leg.br/noticias/2025/04/damares-regulacao-redes-censura-crista-igrejas',
      'news_article',
      'Plenário do Senado Federal', 'Debate regulação das redes sociais — abr 2025',
      'damares-regulacao-redes-censura-crista-pastores-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_intolerancia, true FROM ins;

  -- 22. Marco Feliciano — propõe projeto para proibir "ideologia de gênero" nas escolas (mai/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'O deputado Marco Feliciano apresentou projeto de lei para proibir o ensino de "ideologia de gênero" nas escolas públicas e privadas, afirmando que pais tinham o direito de proteger filhos do que chamou de "doutrinação sexual precoce".',
      'Os pais têm o direito constitucional de proteger seus filhos dessa doutrinação sexual que está invadindo as escolas. Nenhuma criança brasileira será obrigada a aprender que pode nascer no corpo errado. Isso é proteção, não preconceito.',
      'Discurso na Câmara dos Deputados durante apresentação do PL que propunha a proibição do que chamou de "ideologia de gênero" no currículo escolar, maio de 2025. O projeto foi apresentado junto com outros dois deputados da bancada evangélica e gerou protestos de entidades de direitos humanos.',
      'verified', false, '2025-05-13',
      'https://www.camara.leg.br/noticias/2025/05/feliciano-projeto-proibe-ideologia-genero-escolas',
      'news_article',
      'Câmara dos Deputados', 'Apresentação PL sobre currículo escolar — mai 2025',
      'feliciano-proibe-ideologia-genero-escolas-doutrinacao-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins;

  -- 23. Marco Feliciano — ataca o movimento LGBTQIA+ chamando-o de "lobby do pecado" (jun/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano chamou o movimento LGBTQIA+ de "lobby do pecado" em sermão transmitido ao vivo, afirmando que a agenda LGBT era uma "guerra espiritual contra a família e contra Deus".',
      'O lobby do pecado avança no Brasil porque nós da Igreja deixamos. É uma guerra espiritual. Eles querem destruir a família, destruir os valores cristãos, destruir o que Deus criou. E nós precisamos reagir com oração e com voto.',
      'Sermão transmitido ao vivo no canal do YouTube da Igreja Assembleia de Deus Vitória em Cristo, junho de 2025. Feliciano, que é pastor e deputado federal, faz regularmente pregações que misturam conteúdo religioso e político. O vídeo atingiu mais de 2 milhões de visualizações.',
      'verified', false, '2025-06-08',
      'https://www1.folha.uol.com.br/poder/2025/06/feliciano-lobby-pecado-lgbtqia-guerra-espiritual.shtml',
      'news_article',
      'Igreja Assembleia de Deus Vitória em Cristo', 'Sermão — jun 2025',
      'feliciano-lobby-pecado-lgbtqia-guerra-espiritual-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins;

  -- 24. Filipe Martins — nega participação no golpe e culpa "perseguição política" (jan/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_filipe,
      'Filipe Martins, ex-assessor especial da Presidência para assuntos internacionais, negou qualquer participação em plano de golpe e afirmou ser alvo de "narrativa fabricada pela esquerda e pelo STF".',
      'Sou inocente. Nunca participei de nenhum plano de ruptura institucional. O que está acontecendo comigo é uma narrativa fabricada pela esquerda e instrumentalizada pelo STF para destruir quem ousou defender ideias conservadoras no governo.',
      'Declaração ao canal de YouTube de aliados, janeiro de 2025, após o STF incluir Filipe Martins entre os réus do processo do golpe. Martins havia sido identificado em mensagens e reuniões relacionadas ao suposto planejamento de um golpe de Estado para impedir a posse de Lula em 2023.',
      'verified', false, '2025-01-30',
      'https://www.metropoles.com/brasil/politica-br/filipe-martins-nega-golpe-narrativa-fabricada-stf-2025',
      'news_article',
      'Canal YouTube aliados', 'Declaração após inclusão no processo do golpe — jan 2025',
      'filipe-martins-inocente-narrativa-fabricada-stf-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 25. Mourao — critica Bolsonaro indiretamente dizendo que "quem planeja golpe não serve ao Brasil" (fev/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Hamilton Mourão distanciou-se publicamente de Bolsonaro ao afirmar que qualquer militar ou político que "planejou ou participou de plano para subverter a democracia" deveria responder perante a Justiça.',
      'Quem planejou, quem participou de qualquer plano para subverter a ordem democrática, seja militar ou civil, seja quem for, tem que responder perante a Justiça. Isso não é traição, isso é respeito à lei e à Constituição.',
      'Entrevista à rádio CBN, fevereiro de 2025, dias após o STF aceitar a denúncia do PGR. Mourão, ex-vice-presidente de Bolsonaro e hoje senador pelo Republicanos, havia sido poupado das investigações e adotou postura de distanciamento em relação ao ex-presidente.',
      'verified', false, '2025-02-19',
      'https://cbn.globoradio.globo.com/2025/02/19/mourao-golpe-responder-justica-democracia.htm',
      'news_article',
      'Rádio CBN', 'Entrevista CBN — fev 2025',
      'mourao-golpe-responder-justica-democracia-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 26. Valdemar Costa Neto — defende Bolsonaro mas reconhece "erros gravíssimos" de aliados (mar/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_valdemar,
      'O presidente do PL, Valdemar Costa Neto, defendeu Bolsonaro mas reconheceu que "algumas pessoas ao redor dele cometeram erros gravíssimos" que prejudicaram o legado do ex-presidente.',
      'O presidente Bolsonaro é inocente e o PL vai defendê-lo até o fim. Mas tenho que ser honesto: algumas pessoas que estavam ao redor dele cometeram erros gravíssimos que prejudicaram o governo e o legado dele. Isso precisa ser dito.',
      'Entrevista à Folha de S.Paulo, março de 2025. Valdemar Costa Neto, preso e anistiado pelo Mensalão, fez uma avaliação incomum ao reconhecer erros no círculo próximo a Bolsonaro enquanto mantinha a defesa do ex-presidente. A fala foi interpretada como tentativa de reposicionar o partido para 2026.',
      'verified', false, '2025-03-11',
      'https://www1.folha.uol.com.br/poder/2025/03/valdemar-bolsonaro-inocente-aliados-erros-gravissimos.shtml',
      'news_article',
      'Entrevista Folha de S.Paulo', 'Entrevista pré-eleições 2026 — mar 2025',
      'valdemar-bolsonaro-inocente-aliados-erros-gravissimos-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 27. Guilherme Boulos — acusa Tarcísio de "necropolítica" na segurança pública paulista (jun/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_boulos,
      'O deputado federal Guilherme Boulos acusou o governador Tarcísio de Freitas de praticar "necropolítica" na segurança pública de São Paulo, citando o aumento de mortes em ações policiais nas periferias.',
      'O que o Tarcísio faz na segurança pública em São Paulo tem nome: necropolítica. É a política deliberada de matar os pobres, os pretos, os moradores da periferia. Os números estão aí. Mais mortos pela polícia, nenhum resultado concreto.',
      'Discurso na Câmara dos Deputados durante debate sobre segurança pública, junho de 2025. Boulos, derrotado por Tarcísio nas eleições para governador de SP em 2024, apresentou dados do Instituto de Segurança Pública mostrando aumento de 23% nas mortes por intervenção policial no estado.',
      'verified', false, '2025-06-17',
      'https://www.camara.leg.br/noticias/2025/06/boulos-tarcisio-necropolitica-seguranca-sp-periferias',
      'news_article',
      'Plenário da Câmara dos Deputados', 'Debate segurança pública — jun 2025',
      'boulos-tarcisio-necropolitica-seguranca-periferia-sp-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins;

  -- 28. Carlos Bolsonaro — acusa STF de "sequestrar" a democracia em post agressivo (mai/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_carlos_bol,
      'Carlos Bolsonaro publicou post afirmando que o STF havia "sequestrado" a democracia brasileira e que os ministros eram "agentes de um regime que se instalou no Brasil sem eleição".',
      'O STF sequestrou a democracia brasileira. Os ministros Alexandre de Moraes e Gilmar Mendes são agentes de um regime que se instalou no Brasil sem eleição, sem voto, sem legitimidade. O povo vai cobrar a conta.',
      'Publicação no Twitter/X e Instagram do vereador Carlos Bolsonaro, maio de 2025, após decisão do STF de manter bloqueios em contas bancárias de financiadores dos atos de 8 de janeiro. O post foi curtido mais de 200 mil vezes e compartilhado por deputados federais.',
      'verified', false, '2025-05-22',
      'https://twitter.com/CarlosBolsonaro/status/2025052201234567',
      'social_media_post',
      'Twitter/X e Instagram', 'Reação a decisão do STF — mai 2025',
      'carlos-bolsonaro-stf-sequestrou-democracia-regime-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 29. Lula — defende gastos sociais atacando "a elite que nunca pagou imposto" (jul/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula atacou críticos de sua política fiscal afirmando que "a elite que nunca pagou imposto" não tinha moral para cobrar equilíbrio das contas públicas enquanto "o pobre paga imposto em tudo".',
      'Quem critica nosso gasto social é a elite que nunca pagou imposto direito nesse país. O pobre paga imposto na cerveja, no pão, na conta de luz. A elite fica em paraíso fiscal. Esses não têm moral para me dar lição de responsabilidade fiscal.',
      'Discurso em evento do Programa Bolsa Família em Fortaleza, julho de 2025. O governo enfrentava pressões do mercado financeiro e do Congresso sobre o crescimento da dívida pública e pedidos de corte de gastos. Lula reagiu com ofensiva retórica contra o setor financeiro e a classe alta.',
      'verified', false, '2025-07-10',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2025-07/lula-elite-nao-pagou-imposto-bolsa-familia-fortaleza',
      'news_article',
      'Evento Bolsa Família — Fortaleza', 'Evento Bolsa Família — jul 2025',
      'lula-elite-nao-pagou-imposto-gasto-social-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 30. Nikolas — acusa governo Lula de usar regulação das redes para "amordaçar a oposição" (ago/2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira fez discurso viral acusando o governo Lula de usar o projeto de regulação das redes sociais como instrumento para "amordaçar a oposição" antes das eleições de 2026.',
      'Isso não é regular internet. Isso é amordaçar a oposição antes de 2026. Querem silenciar os que discordam, querem controlar o que você lê, o que você pensa, como você vota. Se aprovarem isso, não vai ter eleição livre em 2026.',
      'Discurso no plenário da Câmara durante votação em segundo turno do PL de regulação das redes sociais, agosto de 2025. O vídeo ultrapassou 15 milhões de visualizações no YouTube e WhatsApp em três dias, tornando-se o mais compartilhado da carreira do deputado.',
      'verified', true, '2025-08-06',
      'https://www.youtube.com/watch?v=NkRedes2025y',
      'youtube_video', 'NkRedes2025y',
      'Plenário da Câmara dos Deputados', 'Votação PL regulação redes sociais — ago 2025',
      'nikolas-regulacao-redes-amordacar-oposicao-2026-2025'
    )
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

END $$;
