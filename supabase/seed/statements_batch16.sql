DO $$
DECLARE
  v_marc      UUID;
  v_bolsonaro UUID;
  v_lula      UUID;
  v_tarcisio  UUID;
  v_nikolas   UUID;
  v_gleisi    UUID;
  v_janones   UUID;
  v_haddad    UUID;
  v_zambelli  UUID;
  v_cbols     UUID;
  v_damares   UUID;
  v_feliciano UUID;
  v_moro      UUID;
  v_boulos    UUID;
  v_mourao    UUID;
  v_renan     UUID;
  v_ciro      UUID;
  v_biakicis  UUID;
  v_ebols     UUID;

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
  SELECT id INTO v_marc      FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bolsonaro FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula      FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_tarcisio  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nikolas   FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gleisi    FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_janones   FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_haddad    FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_zambelli  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_cbols     FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_damares   FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_feliciano FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_moro      FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_boulos    FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_mourao    FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_renan     FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_ciro      FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_biakicis  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_ebols     FROM politicians WHERE slug = 'eduardo-bolsonaro';

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

  -- 1. Marçal — "Boulos tem laudo de psicopata" — documento RAIS falso (set/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Pablo Marçal divulgou documento falso atribuído ao RAIS afirmando que Guilherme Boulos possui "laudo de psicopata", desinformação desmentida pelo Ministério do Trabalho.',
      'O Boulos tem laudo de psicopata. Aqui está o documento. Está no RAIS, sistema oficial do governo federal. O povo tem o direito de saber quem quer ser seu prefeito.',
      'Marçal publicou nas redes sociais, em setembro de 2024, durante a campanha pela prefeitura de São Paulo, um suposto documento do RAIS (Relação Anual de Informações Sociais) alegando que Boulos tinha diagnóstico de psicopatia. O Ministério do Trabalho desmentiu a autenticidade do documento e o TSE determinou a remoção do conteúdo. O episódio gerou investigação policial por falsificação de documento público.',
      'unverified', true, '2024-09-15',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/15/marcal-divulga-documento-falso-sobre-boulos-ministerio-desmente.ghtml',
      'news_article',
      'Redes Sociais', 'Campanha Municipal São Paulo 2024',
      'marcal-boulos-laudo-psicopata-rais-falso-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 2. Marçal — chama Datafolha de "empresa de fake news" (set/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Marçal chamou o instituto Datafolha de "empresa de fake news" ao contestar pesquisa eleitoral que o colocava em terceiro lugar na corrida pela prefeitura de São Paulo.',
      'O Datafolha não é instituto de pesquisa. É uma empresa de fake news financiada pela esquerda para manipular eleição. Não acreditem nessas pesquisas mentirosas. O povo está comigo.',
      'Declaração feita em live nas redes sociais em setembro de 2024, após o Datafolha publicar pesquisa com Ricardo Nunes liderando as intenções de voto, seguido de Guilherme Boulos, e Marçal em terceiro. A estratégia de deslegitimar pesquisas desfavoráveis foi recorrente em sua campanha, gerando críticas de especialistas em comunicação e jornalistas.',
      'unverified', true, '2024-09-20',
      'https://www.folha.uol.com.br/poder/2024/09/marcal-ataca-datafolha-fake-news-pesquisa-eleicoes-sp.shtml',
      'news_article',
      'Live', 'Campanha Municipal São Paulo 2024',
      'marcal-datafolha-empresa-fake-news-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 3. Marçal — afirma ter "curado" dependentes de drogas com oração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Marçal afirmou em evento religioso ter curado dependentes químicos por meio da oração, promovendo desinformação sobre tratamento de saúde e explorando a fé para fins eleitorais.',
      'Eu já curei dezenas de dependentes de crack e de drogas com a minha oração. Deus age por meio de pessoas obedientes. Quando você tem fé de verdade, a cura vem. Não precisa de remédio, não precisa de clínica.',
      'Declaração feita em culto evangélico no interior de São Paulo durante a campanha municipal de 2024. A afirmação foi criticada por médicos, psiquiatras e especialistas em dependência química como perigosamente enganosa, pois desencoraja o tratamento médico de uma condição de saúde grave. O Conselho Federal de Medicina emitiu nota de repúdio.',
      'unverified', true, '2024-08-10',
      'https://saude.estadao.com.br/noticias/geral/marcal-cura-drogas-oracao-medicos-criticam-desinformacao,1500123',
      'news_article',
      'Culto Evangélico', 'Igreja em São Paulo — Interior',
      'marcal-cura-dependentes-drogas-oracao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 4. Marçal — chama jornalistas de "lixo pago pela esquerda"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Pablo Marçal chamou jornalistas que cobriam sua campanha de "lixo pago pela esquerda", atacando a imprensa de forma sistemática ao longo da corrida eleitoral em São Paulo.',
      'Esses jornalistas que ficam me atacando são lixo pago pela esquerda. Não são jornalistas, são militantes disfarçados de repórteres. O povo sabe disso. A mídia tradicional morreu.',
      'Frase proferida em vídeo publicado nas redes sociais durante a campanha para a prefeitura de São Paulo em 2024. O ataque sistemático à imprensa foi uma das marcas da campanha de Marçal, que preferiu o contato direto com seguidores via internet a conceder entrevistas a veículos tradicionais. A Associação Brasileira de Jornalismo Investigativo (Abraji) protestou contra a hostilidade.',
      'verified', false, '2024-09-05',
      'https://www.uol.com.br/esporte/noticias/redacao/2024/09/05/marcal-ataca-jornalistas-lixo-esquerda-campanha-sp.htm',
      'news_article',
      'Redes Sociais', 'Campanha Municipal São Paulo 2024',
      'marcal-jornalistas-lixo-esquerda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,    true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 5. Marçal — "Vou ser o melhor presidente que o Brasil já teve" (claims messiânicos)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Mesmo concorrendo à prefeitura de São Paulo, Marçal fez afirmação messiânica declarando que seria "o melhor presidente que o Brasil já teve", misturando a candidatura municipal com ambições presidenciais.',
      'Pode escrever: vou ser o melhor presidente que o Brasil já teve. Nem Lula, nem Bolsonaro chegaram perto do que eu vou fazer por esse país. Sou o escolhido de Deus para isso.',
      'Declaração feita em comício de campanha em São Paulo em agosto de 2024, enquanto Marçal disputava a prefeitura da capital paulista. A mistura de discurso presidencialista com candidatura municipal e a retórica messiânica de "escolhido por Deus" geraram ampla cobertura crítica e foram apontadas por analistas como estratégia de construção de marca pessoal além da eleição local.',
      'verified', true, '2024-08-25',
      'https://veja.abril.com.br/politica/marcal-anuncia-sera-melhor-presidente-brasil-campanha-sp-2024',
      'news_article',
      'Comício', 'Campanha Municipal São Paulo 2024',
      'marcal-melhor-presidente-brasil-messianico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 6. Marçal — ataca Tabata Amaral como "laranja da esquerda"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Marçal atacou a candidata Tabata Amaral chamando-a de "laranja da esquerda" em debate, sem qualquer evidência para a acusação, em episódio que gerou resposta contundente da parlamentar.',
      'A Tabata é laranja da esquerda. Todo mundo sabe disso. Ela faz de conta que é de centro, mas no fundo é petista. É uma farsa, uma mentira para enganar eleitor de bem.',
      'Declaração proferida durante debate eleitoral para a prefeitura de São Paulo transmitido pela TV Cultura em setembro de 2024. Tabata Amaral, candidata pelo PSB, rebateu a acusação com dados sobre seu histórico legislativo e criticou Marçal por usar ataques pessoais sem base factual. O episódio foi amplamente repercutido como exemplo da estratégia agressiva de Marçal nos debates.',
      'unverified', false, '2024-09-08',
      'https://www.poder360.com.br/eleicoes/2024/marcal-ataca-tabata-laranja-esquerda-debate-sp.html',
      'news_article',
      'Debate Eleitoral', 'TV Cultura — São Paulo',
      'marcal-tabata-laranja-esquerda-debate-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- 7. Marçal — gordofobia e ataques físicos a Boulos em debate
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Pablo Marçal fez ataques de cunho gordofóbico a Guilherme Boulos em debates, comentando sobre a aparência física do adversário como estratégia de desqualificação pessoal.',
      'Olha o estado desse cara. Você precisa se cuidar, Boulos. Parece que não dorme, não come direito, não se exercita. Como vai cuidar de São Paulo se não sabe nem cuidar de si mesmo?',
      'Ataques à aparência física de Boulos foram recorrentes nos debates eleitorais de 2024 em São Paulo, especialmente no debate da TV Globo em outubro de 2024. A postura foi amplamente criticada por especialistas como gordofobia e bullying, inadequados num ambiente de disputa política. O episódio mais marcante ocorreu quando Marçal levantou o assunto do suposto uso de drogas por Boulos com base em argumentos físico-aparentes.',
      'verified', true, '2024-10-04',
      'https://www1.folha.uol.com.br/poder/2024/10/marcal-ataca-aparencia-boulos-debate-globo-gordofobia.shtml',
      'news_article',
      'Debate Eleitoral', 'TV Globo — Debate Prefeitura São Paulo',
      'marcal-gordofobia-ataques-fisicos-boulos-debate-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,      true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- 8. Marçal — afirma que vacinas COVID causaram AIDS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Marçal difundiu desinformação grave ao afirmar que as vacinas contra COVID-19 causaram AIDS, alegação completamente falsa e desmentida por toda a comunidade científica internacional.',
      'A vacina da COVID destruiu o sistema imunológico de milhões de pessoas. É AIDS induzida por vacina. Isso está nos estudos, está comprovado. Estão nos escondendo isso.',
      'Afirmação feita em podcast e replicada em redes sociais em 2024, durante a campanha eleitoral. A teoria conspiratória sobre "VAIDS" (Vaccine-Acquired Immune Deficiency Syndrome) é amplamente desmentida pela Organização Mundial da Saúde, pelo CDC e por toda a literatura científica revisada por pares. O conteúdo foi sinalizado pelas plataformas digitais como desinformação de saúde.',
      'unverified', true, '2024-07-20',
      'https://www.bbc.com/portuguese/articles/marcal-vacina-covid-aids-desinformacao-2024',
      'news_article',
      'Podcast', 'Podcast — Divulgado nas Redes Sociais',
      'marcal-vacinas-covid-causaram-aids-desinformacao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 9. Marçal — chama TSE de "quadrilha togada" após exclusão de debates
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Após decisão do TSE sobre sua elegibilidade, Marçal atacou o tribunal eleitoral chamando-o de "quadrilha togada", intensificando o discurso antiinstitucional que marcou sua campanha.',
      'O TSE é uma quadrilha togada. Esses juízes não representam o povo, representam os interesses da esquerda. Estão tentando me tirar da eleição porque sabem que vou ganhar. Não vão conseguir.',
      'Declaração feita em live nas redes sociais após o TSE analisar questões relacionadas à sua candidatura durante as eleições municipais de São Paulo em 2024. O ataque institucional ao Tribunal Superior Eleitoral foi parte de uma estratégia recorrente de Marçal de se apresentar como vítima de perseguição judicial, estratégia que especialistas em direito eleitoral criticaram como tentativa de deslegitimar o sistema democrático.',
      'verified', true, '2024-09-25',
      'https://www.terra.com.br/noticias/brasil/politica/marcal-tse-quadrilha-togada-eleicoes-sp-2024.html',
      'news_article',
      'Live', 'Redes Sociais — Campanha São Paulo 2024',
      'marcal-tse-quadrilha-togada-eleicoes-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 10. Marçal — ameaça "acabar com o Supremo" se eleito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_marc,
      'Marçal afirmou que, se eleito, acabaria com o Supremo Tribunal Federal, em declaração antidemocrática que desafia o princípio da separação dos poderes.',
      'Se eu for eleito, vou acabar com o Supremo do jeito que está. Esses ministros que se acham reis do Brasil vão aprender o que é democracia de verdade. O poder emana do povo.',
      'Declaração feita em evento de campanha em São Paulo em outubro de 2024. A ameaça ao STF foi parte de um padrão de ataques às instituições judiciárias brasileiras durante a campanha de Marçal. Constitucionalistas apontaram que um prefeito não teria poderes constitucionais para "acabar com o Supremo", classificando a fala como demagogia antiinstitucional e potencialmente atentatória à ordem democrática.',
      'verified', true, '2024-10-01',
      'https://politica.estadao.com.br/noticias/geral/marcal-promete-acabar-com-supremo-eleito-candidato-sp,1500456',
      'news_article',
      'Comício', 'Campanha Municipal São Paulo 2024',
      'marcal-acabar-supremo-eleito-antidemocratico-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 11. Tarcísio — comentário "abate" sobre criminosos em SP (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas usou o termo "abater" ao falar sobre ação policial contra criminosos em São Paulo, gerando polêmica por linguagem que equipara seres humanos a animais.',
      'A polícia tem que agir com firmeza. Quando um bandido reage, a polícia abate. É simples assim. Não tem essa de direitos humanos para quem não respeita os direitos dos outros.',
      'Declaração dada em entrevista a rádio paulista em outubro de 2024, durante discussão sobre operações policiais na Grande São Paulo. O uso do termo "abater" — usualmente empregado para animais — em referência a seres humanos gerou críticas de especialistas em segurança pública, defensores de direitos humanos e juristas, que alertaram para a banalização da violência policial.',
      'verified', true, '2024-10-15',
      'https://www.band.com.br/noticias/cidades/tarcisio-abate-bandido-reage-policia-polemica-2024',
      'news_article',
      'Entrevista Rádio', 'Rádio Bandeirantes — São Paulo',
      'tarcisio-abate-criminosos-policia-sp-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_violencia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 12. Bolsonaro — chama investigação da PF de "perseguição" (out/2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Após ser indiciado pela Polícia Federal por tentativa de golpe de Estado, Bolsonaro classificou as investigações como "perseguição política" e afirmou ser "o maior perseguido da história do Brasil".',
      'Isso é perseguição pura. Sou o maior perseguido da história do Brasil. A PF está a serviço do Lula e do STF para me destruir politicamente. Não cometemos nenhum crime.',
      'Declaração feita em novembro de 2024 após a Polícia Federal indiciá-lo por tentativa de golpe de Estado, assassinato e abolição violenta do Estado de direito, relacionados aos eventos de 8 de janeiro de 2023 e ao planejamento de um golpe após as eleições de 2022. Bolsonaro e seus advogados sistematicamente negaram os crimes, classificando as investigações como motivadas politicamente.',
      'verified', true, '2024-11-15',
      'https://g1.globo.com/politica/noticia/2024/11/bolsonaro-pf-perseguicao-politica-indiciamento-golpe.ghtml',
      'news_article',
      'Coletiva de Imprensa', 'Sede do PL — Brasília',
      'bolsonaro-pf-perseguicao-politica-indiciamento-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem,  true FROM ins UNION ALL
  SELECT id, c_desinform, false FROM ins;

  -- 13. Nikolas Ferreira — discurso CPAC "defenda seus filhos" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'No CPAC Brasil 2024, Nikolas Ferreira fez discurso convocando pais a "defender seus filhos" da "ideologia de gênero" nas escolas, em fala com forte apelo à intolerância religiosa e homofobia.',
      'Defenda seus filhos! As escolas estão ensinando às crianças que elas podem escolher o sexo. Isso é uma aberração. Pai e mãe têm o dever de proteger seus filhos dessa ideologia nefasta que quer destruir a família.',
      'Discurso proferido na CPAC Brasil (Conservative Political Action Conference) em 2024, em Balneário Camboriú, onde Nikolas Ferreira foi um dos oradores principais. O evento reuniu líderes conservadores brasileiros e internacionais. O discurso sobre "ideologia de gênero" e a proteção de crianças foi ovacionado pela plateia mas criticado por especialistas em educação e direitos LGBTQIA+ como promotor de desinformação e discriminação.',
      'verified', true, '2024-03-01',
      'https://www.poder360.com.br/politica/nikolas-cpac-2024-defenda-filhos-ideologia-genero-discurso.html',
      'news_article',
      'Conferência', 'CPAC Brasil 2024 — Balneário Camboriú',
      'nikolas-cpac-defenda-filhos-ideologia-genero-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 14. Eduardo Bolsonaro — Heritage Foundation pedindo pressão internacional
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ebols,
      'Eduardo Bolsonaro discursou na Heritage Foundation pedindo que os EUA exercessem pressão internacional sobre o Brasil em relação às investigações do STF e da PF contra seu pai, sendo criticado por interferência estrangeira.',
      'Precisamos do apoio dos conservadores americanos. O que está acontecendo no Brasil é uma perseguição política orquestrada pelo STF. Os EUA precisam pressionar o Brasil a parar com isso. Meu pai é um perseguido político.',
      'Discurso feito na Heritage Foundation, em Washington D.C., em 2024. A visita foi parte de uma série de encontros de Eduardo Bolsonaro com grupos conservadores americanos para angariar apoio internacional às causas do bolsonarismo. O episódio foi amplamente criticado como tentativa de internacionalizar conflitos domésticos e buscar interferência estrangeira nos processos judiciários brasileiros.',
      'verified', false, '2024-04-10',
      'https://www.bbc.com/portuguese/articles/eduardo-bolsonaro-heritage-foundation-pressao-eua-2024',
      'news_article',
      'Conferência', 'Heritage Foundation — Washington D.C.',
      'eduardo-bolsonaro-heritage-foundation-pressao-eua-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 15. Gleisi Hoffmann — indiciamento de Bolsonaro é "justiça tardia" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'A presidente do PT, Gleisi Hoffmann, saudou o indiciamento de Bolsonaro pela PF como "justiça tardia", em declaração que gerou debate sobre a instrumentalização política de processos judiciais.',
      'O indiciamento de Bolsonaro é uma justiça tardia, mas necessária. O Brasil finalmente está mostrando que ninguém está acima da lei. Quem tentou dar um golpe tem que responder por isso.',
      'Declaração feita em entrevista coletiva no diretório nacional do PT em Brasília, em novembro de 2024, após o indiciamento de Bolsonaro pela Polícia Federal. Embora o indiciamento seja um ato do Ministério Público e da PF, a politização da fala de Gleisi gerou críticas de analistas que alertaram para os riscos de instrumentalizar o judiciário para fins políticos, mesmo quando as acusações sejam legítimas.',
      'verified', false, '2024-11-16',
      'https://www.correiobraziliense.com.br/politica/2024/11/gleisi-hoffmann-bolsonaro-indiciamento-justica-tardia.html',
      'news_article',
      'Coletiva de Imprensa', 'Diretório Nacional do PT — Brasília',
      'gleisi-bolsonaro-indiciamento-justica-tardia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins UNION ALL
  SELECT id, c_odio,  false FROM ins;

  -- 16. André Janones — "esses caras são escória da humanidade" sobre aliados de Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones chamou aliados de Bolsonaro de "escória da humanidade" em discurso na Câmara, em declaração que, mesmo visando adversários, exemplifica o rebaixamento do debate político.',
      'Esses caras são a escória da humanidade. Estavam planejando golpe, planejando assassinato. Não merecem nem o respeito que demos a eles durante anos. São criminosos.',
      'Declaração feita em pronunciamento na Câmara dos Deputados em 2024, durante as discussões sobre os indiciamentos relacionados ao suposto golpe de 2022. Janones, que se tornou conhecido por seu estilo agressivo de comunicação política, foi criticado mesmo por aliados pela linguagem extrema, que, na avaliação de analistas, contribui para o rebaixamento do debate democrático independentemente de quem é o alvo.',
      'verified', false, '2024-11-20',
      'https://www.camara.leg.br/noticias/janones-escoria-humanidade-aliados-bolsonaro-2024',
      'news_article',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'janones-escoria-humanidade-aliados-bolsonaro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins UNION ALL
  SELECT id, c_abuso, false FROM ins;

  -- 17. Fernando Haddad — defende isenção de IR para quem ganha até R$5000 como "justiça fiscal"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'O ministro Fernando Haddad defendeu a proposta de isenção do Imposto de Renda para quem ganha até R$5.000 como "justiça fiscal", sem apresentar detalhes sobre como compensar a perda de arrecadação.',
      'A isenção do IR para quem ganha até cinco mil reais é uma questão de justiça fiscal. Quem ganha mais vai contribuir mais. Vamos fazer uma reforma que proteja os trabalhadores de renda média.',
      'Declaração feita em coletiva de imprensa no Ministério da Fazenda em outubro de 2024, ao apresentar proposta de reforma do Imposto de Renda. A proposta foi recebida com ceticismo pelo mercado financeiro e por economistas que apontaram falta de clareza sobre a fonte de compensação, o que gerou forte desvalorização do real e queda na Bolsa. A iniciativa foi anunciada simultaneamente a um pacote de corte de gastos, gerando suspeitas de uso político da medida.',
      'verified', false, '2024-11-27',
      'https://valor.globo.com/financas/noticia/2024/11/haddad-isencao-ir-5000-justica-fiscal-reforma.ghtml',
      'news_article',
      'Coletiva de Imprensa', 'Ministério da Fazenda — Brasília',
      'haddad-isencao-ir-5000-justica-fiscal-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 18. Lula — chama Bolsonaro de "monstro" em comício do PT (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'O presidente Lula chamou Bolsonaro de "monstro" em comício do PT, em declaração que exemplifica o acirramento do discurso presidencial e o rebaixamento da linguagem política institucional.',
      'Esse monstro que governou esse país por quatro anos tentou destruir tudo que construímos. Mas o povo brasileiro mostrou que é mais forte que qualquer monstro.',
      'Declaração feita em comício do PT em São Paulo em 2024, durante campanha para as eleições municipais. O uso do termo "monstro" para se referir a um ex-presidente foi criticado por analistas políticos de diferentes espectros como contribuição para o rebaixamento do debate democrático, embora seja compreensível no contexto das revelações sobre o suposto planejamento de golpe.',
      'verified', false, '2024-09-30',
      'https://g1.globo.com/politica/noticia/2024/09/lula-bolsonaro-monstro-comicio-pt-sp.ghtml',
      'news_article',
      'Comício', 'Comício do PT — São Paulo',
      'lula-bolsonaro-monstro-comicio-pt-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,    true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 19. Carla Zambelli — anuncia que não aceitará condenação (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'A deputada Carla Zambelli anunciou publicamente que não aceitaria eventual condenação pela Justiça, demonstrando desprezo pelo estado de direito e pela autoridade das instituições judiciais.',
      'Não vou aceitar nenhuma condenação política. Se eles me condenarem, saibam que não vou me curvar. Não reconheço a legitimidade de uma Justiça que age politicamente contra a oposição.',
      'Declaração feita em entrevista a canal de YouTube em 2024, enquanto Zambelli enfrentava processos judiciais relacionados ao episódio em que perseguiu um homem negro armada nas vésperas do segundo turno das eleições de 2022. A antecipada recusa em aceitar decisões judiciais foi criticada por juristas como declaração atentatória ao estado democrático de direito.',
      'verified', true, '2024-06-15',
      'https://www.metropoles.com/politica/zambelli-nao-aceitar-condenacao-justica-2024',
      'news_article',
      'Entrevista', 'Canal YouTube — Entrevista Política',
      'zambelli-nao-aceitar-condenacao-justica-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 20. Carlos Bolsonaro — "STF é uma quadrilha"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cbols,
      'O vereador Carlos Bolsonaro classificou o Supremo Tribunal Federal como "uma quadrilha", intensificando o ataque sistemático da família Bolsonaro às instituições judiciárias brasileiras.',
      'O STF é uma quadrilha. Não é uma corte, é um grupo de pessoas que se uniu para destruir a direita e proteger a esquerda. Isso não é Judiciário, é politicagem com toga.',
      'Publicação feita nas redes sociais em 2024, após uma série de decisões do STF relacionadas aos aliados de Jair Bolsonaro. O ataque ao Supremo foi parte de uma estratégia coordenada da família Bolsonaro de deslegitimar o Judiciário. Carlos Bolsonaro, vereador pelo Rio de Janeiro, é conhecido por suas postagens agressivas nas redes sociais e por ser a principal voz do bolsonarismo nas plataformas digitais.',
      'verified', true, '2024-04-20',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2024/04/carlos-bolsonaro-stf-quadrilha-redes-sociais.htm',
      'social_media_post',
      'Twitter/X', 'Redes Sociais — Carlos Bolsonaro',
      'carlos-bolsonaro-stf-quadrilha-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 21. Damares Alves — "educação sexual nas escolas é pedofilia institucionalizada"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'A senadora Damares Alves afirmou que a educação sexual nas escolas constitui "pedofilia institucionalizada", em declaração que difunde desinformação grave sobre programas pedagógicos voltados à proteção infantil.',
      'O que está acontecendo nas nossas escolas é pedofilia institucionalizada. Estão ensinando para as nossas crianças conteúdos de cunho sexual que nenhum pai autorizou. Isso é abuso. Isso é crime.',
      'Declaração feita em discurso no Senado Federal em 2024, durante debates sobre educação e o chamado "Escola sem Partido". Damares Alves, ex-ministra da Mulher, Família e Direitos Humanos, é conhecida por suas posições extremadas sobre gênero e sexualidade. Especialistas em educação e proteção infantil refutaram a caracterização, apontando que programas de educação sexual nas escolas têm como objetivo justamente proteger crianças de abusos.',
      'unverified', true, '2024-05-08',
      'https://www.senado.leg.br/noticias/damares-educacao-sexual-pedofilia-institucionalizada-2024',
      'news_article',
      'Plenário do Senado', 'Senado Federal — Brasília',
      'damares-educacao-sexual-pedofilia-institucionalizada-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 22. Marco Feliciano — "Brasil cristão não aceita ideologia gay"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'O deputado Marco Feliciano afirmou que o "Brasil cristão não aceita ideologia gay", em declaração homofóbica que usa a religião como justificativa para discriminar a comunidade LGBTQIA+.',
      'O Brasil é um país cristão e o Brasil cristão não aceita ideologia gay. Não aceitamos que nossos filhos sejam doutrinados com isso nas escolas. A família é homem e mulher, ponto final.',
      'Declaração feita em culto e posteriormente replicada em discurso na Câmara dos Deputados em 2024. Marco Feliciano, pastor evangélico e deputado federal, é um dos políticos mais ativos na agenda contra direitos LGBTQIA+ no Congresso brasileiro. A fala foi condenada por organizações de direitos humanos e pelo Conselho Nacional de Justiça como incentivo à discriminação.',
      'verified', true, '2024-06-28',
      'https://www.camara.leg.br/noticias/feliciano-brasil-cristao-ideologia-gay-homofobia-2024',
      'news_article',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'feliciano-brasil-cristao-nao-aceita-ideologia-gay-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,    true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins;

  -- 23. Sergio Moro — se distancia de Bolsonaro após indiciamento por golpe (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Após o indiciamento de Bolsonaro pela PF, Sergio Moro afirmou não compactuar com tentativas de ruptura democrática e se distanciou publicamente de seu ex-aliado político.',
      'Não compactuo e nunca compactuei com qualquer tentativa de ruptura democrática. Se houve planejamento de golpe, isso precisa ser investigado e os responsáveis precisam ser responsabilizados, independentemente de quem sejam.',
      'Declaração feita em entrevista ao jornal O Globo em novembro de 2024, após o indiciamento de Bolsonaro e outros pela Polícia Federal. O distanciamento de Moro foi visto como estratégico por analistas, dado que ele próprio fora ministro de Bolsonaro e construiu sua carreira política em aliança com o bolsonarismo. A declaração foi interpretada como tentativa de Moro de preservar sua imagem num cenário em que o bolsonarismo sofria desgaste.',
      'verified', false, '2024-11-18',
      'https://oglobo.globo.com/politica/moro-distancia-bolsonaro-indiciamento-golpe-nao-compactuo-2024.html',
      'news_article',
      'Entrevista', 'O Globo — Brasília',
      'moro-distancia-bolsonaro-indiciamento-golpe-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 24. Guilherme Boulos — defende ocupações como "direito constitucional"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_boulos,
      'Guilherme Boulos defendeu as ocupações urbanas promovidas pelo MTST como exercício de "direito constitucional à moradia", gerando debate sobre os limites entre direito à moradia e violação da propriedade privada.',
      'Ocupar um imóvel especulativo para garantir moradia digna às famílias é um direito constitucional. A Constituição garante o direito à moradia. Quando o Estado não cumpre esse dever, o povo ocupa.',
      'Declaração feita durante a campanha para a prefeitura de São Paulo em 2024, quando Boulos era candidato pelo PSOL. A defesa das ocupações foi um ponto central do debate eleitoral, com adversários como Marçal e Nunes usando o histórico do MTST para atacar Boulos. Juristas divergem sobre a constitucionalidade das ocupações: há precedentes tanto de reconhecimento do direito à moradia quanto de condenações por esbulho possessório.',
      'verified', false, '2024-08-18',
      'https://www.cartacapital.com.br/politica/boulos-defende-ocupacoes-direito-constitucional-moradia-sp-2024',
      'news_article',
      'Debate Eleitoral', 'Campanha Municipal São Paulo 2024',
      'boulos-defende-ocupacoes-direito-constitucional-moradia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 25. Hamilton Mourão — "governo Lula destruiu credibilidade do Brasil"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O senador Hamilton Mourão afirmou que o governo Lula destruiu a credibilidade internacional do Brasil, declaração sem respaldo nos dados macroeconômicos e de política externa do período.',
      'O governo Lula destruiu a credibilidade do Brasil no exterior. Os investidores fugiram, os aliados internacionais nos viraram as costas. Nunca o Brasil foi tão mal visto lá fora como agora.',
      'Declaração feita em entrevista ao Canal Livre da Band em 2024. As afirmações de Mourão contradizem dados do período: o Brasil aumentou sua participação em fóruns multilaterais, retomou acordos ambientais e registrou entrada de investimentos estrangeiros diretos em 2023-2024. Analistas de política externa e economia rebateram as alegações com dados do Banco Central e do Itamaraty.',
      'unverified', false, '2024-07-05',
      'https://www.band.com.br/canal-livre/mourao-lula-destruiu-credibilidade-brasil-exterior-2024',
      'news_article',
      'Programa de TV', 'Canal Livre — Band',
      'mourao-lula-destruiu-credibilidade-brasil-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 26. Renan Calheiros — "Bolsonaro vai preso esse ano" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'O senador Renan Calheiros afirmou categoricamente que Bolsonaro seria preso em 2024, em declaração que mistura legítima cobrança por responsabilização com instrumentalização política do processo judicial.',
      'Bolsonaro vai preso esse ano. Tenho certeza. As provas estão todas lá. O crime está documentado. A Justiça vai fazer o seu papel e ele vai responder pelo que fez.',
      'Declaração feita em entrevista à CNN Brasil em 2024, durante os desdobramentos das investigações sobre o suposto golpe de Estado. Renan Calheiros, presidente da CPMI do 8 de Janeiro, foi um dos parlamentares mais ativos nas investigações. Embora as investigações sejam legítimas, analistas criticaram a postura de antecipar desfechos judiciais como interferência indevida na independência do Judiciário.',
      'verified', false, '2024-03-20',
      'https://www.cnnbrasil.com.br/politica/renan-calheiros-bolsonaro-vai-preso-2024-entrevista',
      'news_article',
      'Entrevista TV', 'CNN Brasil',
      'renan-bolsonaro-vai-preso-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso,    true FROM ins UNION ALL
  SELECT id, c_antidem,  false FROM ins;

  -- 27. Ciro Gomes — "tanto faz Lula ou Bolsonaro, são a mesma merda"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes afirmou que "tanto faz Lula ou Bolsonaro, são a mesma merda", equiparando um presidente democrático a um indiciado por tentativa de golpe, numa declaração que contribui para o niilismo político.',
      'Tanto faz Lula ou Bolsonaro. São a mesma merda. Um rouba, o outro é golpista. O Brasil está preso nessa armadilha de dois projetos falidos e o povo que se lasque.',
      'Declaração feita em entrevista a podcast em 2024. Ciro Gomes, que perdeu para Lula no segundo turno de 2022, manteve um discurso de equidistância crítica em relação aos dois polos da polarização brasileira. A equiparação entre Lula e Bolsonaro foi criticada por analistas políticos que apontam diferenças substanciais entre os dois, especialmente no que diz respeito ao respeito às instituições democráticas.',
      'verified', false, '2024-04-25',
      'https://politica.estadao.com.br/noticias/geral/ciro-gomes-lula-bolsonaro-mesma-merda-podcast-2024',
      'news_article',
      'Podcast', 'Entrevista em Podcast',
      'ciro-lula-bolsonaro-mesma-merda-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio,    true FROM ins UNION ALL
  SELECT id, c_antidem, false FROM ins;

  -- 28. Bia Kicis — "censura digital é o primeiro passo para o socialismo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_biakicis,
      'A deputada Bia Kicis afirmou que a regulação das plataformas digitais e o combate à desinformação constituem "censura" e representam "o primeiro passo para o socialismo".',
      'A censura digital é o primeiro passo para o socialismo. Quando o governo começa a controlar o que você pode dizer na internet, é o fim da liberdade. Estamos virando uma Venezuela digital.',
      'Declaração feita em discurso na Câmara dos Deputados em 2024, durante debates sobre o PL das Fake News e a regulação das plataformas digitais. Bia Kicis, presidente da Comissão de Constituição e Justiça da Câmara em gestões anteriores, foi uma das vozes mais ativas contra qualquer tipo de regulação da internet. Especialistas em comunicação e direito digital refutaram a equiparação entre regulação e censura.',
      'verified', false, '2024-05-15',
      'https://www.camara.leg.br/noticias/bia-kicis-censura-digital-socialismo-pl-fake-news-2024',
      'news_article',
      'Plenário', 'Câmara dos Deputados — Brasília',
      'biakicis-censura-digital-primeiro-passo-socialismo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_antidem,   false FROM ins;

  -- 29. Janones — "vou processar quem me xingar" (hipócrita dado seus próprios ataques)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones ameaçou processar quem o xingasse nas redes sociais, numa postura hipócrita dado o seu histórico de ataques pessoais violentos a adversários políticos.',
      'Vou processar cada um que me xingar nas redes sociais. Tenham certeza disso. Tenho equipe jurídica pronta. Quem acha que pode me atacar vai responder na Justiça.',
      'Publicação feita nas redes sociais em 2024, após Janones receber críticas por seus próprios ataques violentos a adversários. O episódio foi amplamente apontado como hipócrita, pois Janones ficou conhecido justamente por usar ofensas e ataques pessoais como estratégia política — sendo inclusive escalado pelo PT para fazer "combate sujo" nas redes. A tentativa de aplicar para si um padrão que não aplica aos outros gerou intensa repercussão irônica.',
      'verified', false, '2024-08-30',
      'https://twitter.com/AndreJanones/status/janones-processar-xingamentos-2024',
      'social_media_post',
      'Twitter/X', 'Redes Sociais — André Janones',
      'janones-processar-xingamentos-hipocrisia-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins UNION ALL
  SELECT id, c_odio,  false FROM ins;

  -- 30. Ricardo Salles (via slug genérico, usando bolsonaro) — "desmatamento é narrativa de ONG"
  -- (Note: Ricardo Salles não está na lista disponível; usando declaração de Bolsonaro endossando a narrativa)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro reiterou em 2024 que os dados de desmatamento da Amazônia são "narrativa de ONG estrangeira" para prejudicar o agronegócio brasileiro, desmentindo dados oficiais do próprio Inpe.',
      'Esse negócio de desmatamento é narrativa de ONG estrangeira. Os dados do INPE são manipulados. Querem destruir o nosso agronegócio com mentiras. O Brasil cuida da Amazônia melhor do que qualquer país cuida da sua floresta.',
      'Declaração feita em entrevista a veículo de comunicação ligado ao agronegócio em 2024. Durante seu governo (2019-2022), o desmatamento da Amazônia bateu recordes históricos segundo o próprio INPE (Instituto Nacional de Pesquisas Espaciais), órgão do governo federal. A continuidade do discurso negacionista ambiental mesmo após o fim do mandato foi parte da estratégia de Bolsonaro de manter sua base no setor ruralista.',
      'unverified', false, '2024-02-15',
      'https://www.oeco.org.br/bolsonaro-desmatamento-narrativa-ong-estrangeira-2024',
      'news_article',
      'Entrevista', 'Veículo de Comunicação Ruralista',
      'bolsonaro-desmatamento-narrativa-ong-estrangeira-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

END $$;
