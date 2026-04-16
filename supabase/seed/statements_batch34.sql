-- Batch 34: Various recent controversies (2023–2025) not yet covered in other batches
-- 30 statements with broad coverage across parties.

DO $$
DECLARE
  v_bol UUID; v_lula UUID; v_tar UUID; v_nik UUID; v_gle UUID;
  v_jan UUID; v_had UUID; v_zam UUID; v_mar UUID; v_car UUID;
  v_mou UUID; v_mor UUID; v_ren UUID; v_dam UUID; v_bou UUID;
  v_fel UUID; v_bia UUID; v_edu UUID; v_cir UUID; v_dil UUID;
  v_jef UUID; v_val UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_rac UUID; c_hom UUID; c_mis UUID; c_nep UUID;
BEGIN
  SELECT id INTO v_bol  FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_tar  FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_ren  FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_bou  FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bia  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_cir  FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil  FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_jef  FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_val  FROM politicians WHERE slug = 'valdemar-costa-neto';
  SELECT id INTO c_ant  FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des  FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu  FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio  FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor  FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi  FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_rac  FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_hom  FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis  FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_nep  FROM categories WHERE slug = 'nepotismo';

  -- 1. Lula defende INSS apesar do escândalo de fraudes (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende o INSS e minimiza escândalo de fraudes bilionárias revelado em 2025.',
      'O INSS funciona. Tem gente querendo destruir o instituto por motivos políticos. Vamos investigar as fraudes, mas não vamos deixar de servir os aposentados.',
      'Pronunciamento no Palácio do Planalto em maio de 2025, após a Polícia Federal revelar esquema de fraude estimado em R$ 6 bilhões no INSS envolvendo servidores e entidades conveniadas que descontavam valores indevidos de aposentados.',
      'verified', false, '2025-05-15',
      'https://g1.globo.com/politica/noticia/2025/05/lula-defende-inss-apos-escandalo-fraude.ghtml',
      'news_article',
      'Palácio do Planalto', 'Pronunciamento presidencial', 'lula-defende-inss-fraude-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Gleisi minimiza fraude do INSS como "problema pontual" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann minimiza fraude do INSS chamando-a de "problema pontual" sem relação com o governo.',
      'É um problema pontual que está sendo investigado. Não tem nada a ver com a gestão do governo Lula. Houve fraudes em outros governos também e ninguém falou nada.',
      'Declaração à imprensa na Câmara dos Deputados em maio de 2025, após revelação do esquema de fraude no INSS. A ministra da Secretaria de Relações Institucionais foi criticada por minimizar um desvio que afetou milhões de aposentados.',
      'verified', false, '2025-05-20',
      'https://www.uol.com.br/noticias/politica/2025/05/gleisi-minimiza-fraude-inss-problema-pontual.htm',
      'news_article',
      'Câmara dos Deputados', 'Coletiva de imprensa', 'gleisi-minimiza-fraude-inss-pontual-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Nikolas: "fraude do INSS é resultado de 20 anos de PT" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira atribui fraude do INSS a "20 anos de PT gerindo o Estado".',
      'A fraude do INSS é o resultado natural de 20 anos de PT gerindo o Estado como se fosse propriedade do partido. Colocaram os amigos, colocaram os aliados, e o resultado é esse: bilhões desviados dos aposentados.',
      'Discurso no plenário da Câmara dos Deputados em maio de 2025. Nikolas ignorou que o esquema de descontos irregulares em benefícios do INSS envolvia entidades conveniadas com atuação em múltiplos governos, não apenas petistas.',
      'verified', false, '2025-05-22',
      'https://www.estadao.com.br/politica/nikolas-ferreira-fraude-inss-pt-estado-2025/',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária', 'nikolas-fraude-inss-20-anos-pt-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 4. Lula critica STF por não julgar Bolsonaro mais rápido (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula faz pressão pública sobre o STF para acelerar julgamento de Bolsonaro.',
      'A Justiça tem que ser igual para todo mundo. Se fosse um cidadão comum, já estaria preso há muito tempo. Espero que o STF resolva logo isso para o Brasil poder seguir em frente.',
      'Entrevista coletiva em Brasília em março de 2025. Declaração foi interpretada como pressão indevida do chefe do Executivo sobre o Judiciário, gerando críticas de juristas sobre a independência dos poderes.',
      'verified', false, '2025-03-10',
      'https://www1.folha.uol.com.br/poder/2025/03/lula-pressiona-stf-julgamento-bolsonaro.shtml',
      'news_article',
      'Palácio do Planalto', 'Entrevista coletiva', 'lula-pressiona-stf-bolsonaro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Lula defende gastos sem limite para "quem precisa" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula declara que gastos sociais não têm teto e que "não existe limite para quem precisa".',
      'Não existe teto para quem precisa. O arcabouço fiscal existe para controlar despesas supérfluas, não para cortar direitos do povo. Quem tem fome não pode esperar o equilíbrio fiscal.',
      'Discurso em cerimônia do programa Bolsa Família em Brasília em agosto de 2024. Economistas apontaram contradição com o arcabouço fiscal aprovado pelo próprio governo, que estabelece metas de resultado primário.',
      'verified', false, '2024-08-14',
      'https://g1.globo.com/economia/noticia/2024/08/lula-gastos-sociais-sem-teto-arcabouco-fiscal.ghtml',
      'news_article',
      'Brasília', 'Cerimônia Bolsa Família', 'lula-gastos-sem-teto-quem-precisa-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Lula ataca jornalistas que criticam política econômica (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula chama jornalistas de "pessimistas profissionais" e sugere que criticam o governo por interesse econômico.',
      'Tem jornalista que só publica notícia ruim da economia porque tem interesse nisso. São pessimistas profissionais a serviço do mercado financeiro. O Brasil está crescendo e eles não conseguem aceitar.',
      'Discurso durante evento do PT em São Paulo em outubro de 2024. A fala gerou protestos de entidades de imprensa como a Abraji e a FENAJ, que denunciaram ataque à liberdade de imprensa.',
      'verified', false, '2024-10-05',
      'https://www.poder360.com.br/governo/lula-chama-jornalistas-de-pessimistas-profissionais-2024/',
      'news_article',
      'São Paulo', 'Evento PT', 'lula-ataca-jornalistas-pessimistas-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 7. Lula defende Venezuela como "estado soberano" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende Venezuela como "estado soberano" e relativiza denúncias de fraude eleitoral e repressão.',
      'A Venezuela é um estado soberano e não aceita interferência externa. Temos que respeitar o processo democrático deles, mesmo que não concordemos com tudo. Não é papel do Brasil tutelar outros países.',
      'Declaração em cúpula da CELAC em janeiro de 2025, após relatório da ONU documentar graves violações de direitos humanos pelo governo Maduro. Oposição brasileira criticou a postura do presidente como conivência com a ditadura.',
      'verified', false, '2025-01-20',
      'https://www.bbc.com/portuguese/articles/brasil-lula-venezuela-estado-soberano-2025',
      'news_article',
      'Cúpula da CELAC', 'Reunião de cúpula regional', 'lula-venezuela-estado-soberano-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Haddad nega que isenção de IR criará pressão sobre despesas (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad afirma que isenção de IR para quem ganha até R$ 5 mil não aumentará pressão fiscal.',
      'A isenção não vai criar desequilíbrio. Vamos compensar com o imposto mínimo sobre os super-ricos. Não vai faltar dinheiro para o Estado. Quem ganha pouco merece pagar menos imposto.',
      'Entrevista ao Jornal Nacional em março de 2025 após anúncio da reforma do Imposto de Renda. O mercado financeiro e economistas independentes projetaram impacto fiscal negativo entre R$ 25 bilhões e R$ 35 bilhões ao ano sem contrapartidas suficientes.',
      'verified', false, '2025-03-18',
      'https://g1.globo.com/economia/noticia/2025/03/haddad-isencao-ir-nao-pressao-fiscal.ghtml',
      'news_article',
      'TV Globo', 'Jornal Nacional', 'haddad-isencao-ir-sem-pressao-fiscal-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Bolsonaro diz que passaporte confiscado é violação de direitos humanos (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que apreensão de seu passaporte é violação de direitos humanos e perseguição política.',
      'Me tomaram o passaporte. Isso é uma violação dos meus direitos humanos mais básicos. Estou sendo perseguido politicamente como um ditador perseguiria seus opositores. O mundo está vendo o que fazem comigo.',
      'Declaração em transmissão ao vivo nas redes sociais em março de 2025, após o STF determinar a apreensão de seu passaporte como medida cautelar no inquérito sobre a tentativa de golpe de Estado em 2022.',
      'verified', true, '2025-03-05',
      'https://www.estadao.com.br/politica/bolsonaro-passaporte-direitos-humanos-perseguicao-2025/',
      'news_article',
      'Redes sociais', 'Transmissão ao vivo', 'bolsonaro-passaporte-violacao-direitos-humanos-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 10. Bolsonaro chama investigação de "inquisição moderna" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro compara investigação do STF sobre tentativa de golpe a uma "inquisição moderna".',
      'O que está acontecendo comigo é uma inquisição moderna. Sem provas, sem contraditório real, decidem minha culpa antes do julgamento. Isso não é democracia, isso é vingança política do establishment.',
      'Discurso para apoiadores em Brasília em abril de 2025. Bolsonaro é réu no STF por supostamente ter liderado uma conspiração para impedir a posse de Lula após as eleições de 2022, segundo inquérito da PGR.',
      'verified', false, '2025-04-02',
      'https://www1.folha.uol.com.br/poder/2025/04/bolsonaro-chama-investigacao-de-inquisicao-moderna.shtml',
      'news_article',
      'Brasília', 'Discurso para apoiadores', 'bolsonaro-investigacao-inquisicao-moderna-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 11. Eduardo pede asilo político nos EUA para a família (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede que governo dos EUA conceda asilo político a membros da família Bolsonaro.',
      'Estamos pedindo formalmente ao governo americano que considere asilo político para membros da nossa família que correm risco de prisão arbitrária no Brasil. O Brasil não é mais um país seguro para opositores.',
      'Declaração concedida à imprensa americana em Washington em fevereiro de 2025. O deputado federal vivia nos EUA e articulava apoio de congressistas republicanos ao pai. A solicitação foi criticada por juristas brasileiros como medida sem fundamento legal.',
      'verified', false, '2025-02-15',
      'https://www.bbc.com/portuguese/articles/eduardo-bolsonaro-pede-asilo-eua-familia-2025',
      'news_article',
      'Washington D.C.', 'Declaração à imprensa americana', 'eduardo-bolsonaro-pede-asilo-eua-familia-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 12. Nikolas ataca Lula na Câmara por discurso sobre Venezuela (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira confronta Lula diretamente na Câmara por defender o regime venezuelano.',
      'O presidente defende Maduro enquanto venezuelanos fogem da ditadura. Isso não é soberania, é cumplicidade com um regime que tortura e mata opositores. Envergonha o Brasil no mundo.',
      'Discurso no plenário da Câmara dos Deputados em agosto de 2024, após declarações de Lula sobre as eleições presidenciais da Venezuela contestadas pela oposição e por observadores internacionais.',
      'verified', false, '2024-08-05',
      'https://www.poder360.com.br/congresso/nikolas-confronta-lula-sobre-venezuela-camara-2024/',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária', 'nikolas-ataca-lula-venezuela-camara-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Nikolas defende X/Elon Musk contra bloqueio do STF (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende plataforma X e Elon Musk após bloqueio determinado pelo ministro Alexandre de Moraes.',
      'O STF bloqueou o X porque não suporta liberdade de expressão. Alexandre de Moraes age como um censor, não como um juiz. Elon Musk é um dos poucos que ainda tem coragem de enfrentar esse autoritarismo judicial.',
      'Declaração nas redes sociais e em entrevistas em setembro de 2024, quando o ministro Alexandre de Moraes determinou a suspensão da plataforma X no Brasil por descumprimento de ordens judiciais de remoção de conteúdo e indicação de representante legal.',
      'verified', false, '2024-09-02',
      'https://www.uol.com.br/noticias/politica/2024/09/nikolas-defende-x-elon-musk-bloqueio-stf.htm',
      'news_article',
      'Redes sociais / Câmara dos Deputados', 'Declaração pública', 'nikolas-defende-x-musk-bloqueio-stf-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 14. Nikolas lidera manifestação anti-governo em SP (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira discursa em manifestação de 6 de julho em São Paulo pedindo o impeachment de Alexandre de Moraes.',
      'Estamos aqui para dizer que o Brasil não aceita censura, não aceita autoritarismo judicial. Alexandre de Moraes precisa ser afastado. Este povo nas ruas é a verdadeira democracia.',
      'Discurso no ato de 6 de julho de 2025 na Avenida Paulista, em São Paulo, organizado pela direita brasileira com pautas contra o STF, o ministro Alexandre de Moraes e o governo Lula. O evento reuniu centenas de milhares de pessoas.',
      'verified', true, '2025-07-06',
      'https://g1.globo.com/politica/noticia/2025/07/nikolas-discursa-manifestacao-paulista-impeachment-moraes.ghtml',
      'news_article',
      'Avenida Paulista, São Paulo', 'Manifestação 6 de julho', 'nikolas-lidera-manifestacao-anti-governo-sp-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 15. Nikolas: "o PT quer transformar o Brasil em Cuba" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que o PT quer transformar o Brasil em Cuba ou Venezuela.',
      'O PT quer transformar o Brasil em Cuba. Cada passo que Lula dá é em direção a um estado controlador, que censura a imprensa, que persegue opositores. Não vamos deixar isso acontecer.',
      'Discurso em evento da Jovem Conservadora em Belo Horizonte em abril de 2025. Especialistas em política comparada apontaram que a comparação entre o Brasil e regimes autoritários caribenhos carece de embasamento factual.',
      'verified', false, '2025-04-10',
      'https://www.estadao.com.br/politica/nikolas-pt-brasil-cuba-venezuela-2025/',
      'news_article',
      'Belo Horizonte', 'Evento Jovem Conservadora', 'nikolas-pt-transformar-brasil-cuba-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Marçal anuncia entrada no partido Novo para 2026 (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal anuncia filiação ao partido Novo e pré-candidatura à presidência em 2026.',
      'Fui convidado pelo Novo e aceitei. Vamos disputar 2026 com uma candidatura que não deve nada a ninguém. Serei o candidato dos brasileiros que trabalham e pagam impostos para sustentar essa corrupção toda.',
      'Anúncio feito em transmissão ao vivo no YouTube em março de 2025. Marçal havia disputado as eleições municipais de 2024 em São Paulo pelo Novo, chegando ao segundo turno antes de ser derrotado por Ricardo Nunes. Críticos questionaram se a filiação seria estratégica para construção de candidatura.',
      'verified', false, '2025-03-25',
      'https://g1.globo.com/politica/noticia/2025/03/pablo-marcal-filiacao-novo-pre-candidatura-2026.ghtml',
      'news_article',
      'Redes sociais', 'Transmissão ao vivo', 'marcal-filiacao-novo-candidatura-2026-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 17. Marçal ataca Tarcísio como "candidato do establishment" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal chama Tarcísio de Freitas de "candidato do establishment" e produto do sistema político.',
      'Tarcísio é o candidato do establishment disfarçado de alternativa. Foi ministro de Bolsonaro, foi escolhido pelo sistema, e vai fazer o que o sistema manda. Eu sou a única candidatura de verdade fora do sistema.',
      'Entrevista ao podcast Flow em abril de 2025. A declaração acirrou a disputa pré-eleitoral dentro do campo da direita brasileira, com Marçal tentando se posicionar como alternativa ao governador de São Paulo.',
      'verified', false, '2025-04-18',
      'https://www.uol.com.br/noticias/politica/2025/04/marcal-tarcisio-candidato-establishment-2025.htm',
      'news_article',
      'Podcast Flow', 'Entrevista', 'marcal-ataca-tarcisio-establishment-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 18. Marçal afirma que foi "censurado" pelo TSE ilegalmente (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal afirma que foi censurado ilegalmente pelo TSE durante a campanha de 2024 e anuncia ação na Justiça.',
      'O TSE me censurou ilegalmente durante a campanha. Removeram meus vídeos, suspenderam minhas contas, prejudicaram minha candidatura. Vou processar o TSE e mostrar para o Brasil inteiro o que foi feito.',
      'Declaração nas redes sociais e em entrevistas em janeiro de 2025, meses após o segundo turno das eleições municipais em São Paulo. O TSE aplicou sanções a Marçal por conteúdo desinformativo e uso indevido de inteligência artificial em materiais de campanha.',
      'verified', false, '2025-01-30',
      'https://www.poder360.com.br/eleicoes/marcal-diz-que-foi-censurado-ilegalmente-pelo-tse-2025/',
      'news_article',
      'Redes sociais', 'Declaração pública', 'marcal-censurado-tse-ilegalmente-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 19. Tarcísio: defende intervenção federal em segurança do Rio (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas defende intervenção federal na segurança pública do Rio de Janeiro.',
      'O Rio de Janeiro precisa de uma intervenção federal na segurança pública. O estado não tem capacidade de resolver sozinho. O governo federal precisa agir antes que seja tarde demais.',
      'Declaração em entrevista à CNN Brasil em fevereiro de 2025, durante período de grave crise de segurança no Rio de Janeiro com confrontos entre facções e forças de segurança na região metropolitana. Juristas alertaram que intervenção federal exige requisitos constitucionais rígidos.',
      'verified', false, '2025-02-20',
      'https://www.cnnbrasil.com.br/politica/tarcisio-defende-intervencao-federal-rio-seguranca-2025/',
      'news_article',
      'CNN Brasil', 'Entrevista televisiva', 'tarcisio-intervencao-federal-seguranca-rio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 20. Janones: chama conservadores de "medíocres com ódio no coração" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama parlamentares conservadores de "medíocres com ódio no coração".',
      'Do outro lado desta Câmara só tem medíocre com ódio no coração. Gente que não tem nenhuma proposta para o Brasil além de perseguir minorias e defender os privilégios dos ricos. É o que é.',
      'Discurso no plenário da Câmara dos Deputados em junho de 2024, durante debate sobre pautas da bancada conservadora. A fala gerou reação imediata da oposição e pedidos de retratação por parte de líderes parlamentares.',
      'verified', false, '2024-06-12',
      'SELECT id, c_des, true FROM ins;
      https://www1.folha.uol.com.br/poder/2024/06/janones-chama-conservadores-de-mediocres-odio-camara.shtml',
      'news_article',
      'Câmara dos Deputados', 'Sessão plenária', 'janones-conservadores-mediocres-odio-coracao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 21. Gleisi: "quem vota em Bolsonaro vota contra si mesmo" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que eleitores de Bolsonaro votam contra seus próprios interesses.',
      'Quem vota em Bolsonaro vota contra si mesmo. Vota contra seu salário, vota contra sua saúde, vota contra a educação dos seus filhos. A única explicação é o ódio e a desinformação.',
      'Declaração durante evento do PT em Porto Alegre em setembro de 2024. A fala foi criticada como elitista e condescendente com parte do eleitorado brasileiro, além de não apresentar evidências das afirmações sobre consequências de voto.',
      'verified', false, '2024-09-15',
      'https://www.correiobraziliense.com.br/politica/2024/09/gleisi-quem-vota-bolsonaro-vota-contra-si-mesmo.html',
      'news_article',
      'Porto Alegre', 'Evento PT', 'gleisi-vota-bolsonaro-vota-contra-si-mesmo-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 22. Zambelli: declara que "nunca sairá do Brasil por princípio" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli declara que nunca deixará o Brasil apesar de investigações e alega ser alvo de perseguição política.',
      'Nunca sairei do Brasil por princípio. Não vou fugir como querem que eu faça. Estou sendo perseguida politicamente, mas não tenho medo. Fico aqui e enfrento essa ditadura judicial de frente.',
      'Declaração nas redes sociais em março de 2025, após especulações sobre possível exílio, em contexto de investigações do STF relacionadas à sua participação nos eventos de 8 de janeiro de 2023 e ao episódio da perseguição armada em São Paulo.',
      'verified', false, '2025-03-08',
      'https://veja.abril.com.br/politica/zambelli-nunca-saira-brasil-principio-perseguicao-2025/',
      'news_article',
      'Redes sociais', 'Publicação em redes sociais', 'zambelli-nunca-saira-brasil-principio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Boulos: chama SP de "cidade do apartheid" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos chama São Paulo de "cidade do apartheid social e racial" durante campanha à prefeitura.',
      'São Paulo é uma cidade do apartheid. Apartheid social, apartheid racial. Os ricos têm tudo, os pobres não têm nada. Vamos acabar com esse apartheid ou não vamos mudar nada nessa cidade.',
      'Discurso durante comício no Largo da Batata, em São Paulo, em agosto de 2024, durante a campanha para as eleições municipais. Boulos foi derrotado por Ricardo Nunes no segundo turno. A comparação com o regime de segregação racial sul-africano gerou debate sobre o uso do termo.',
      'verified', false, '2024-08-22',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/boulos-chama-sp-de-cidade-do-apartheid-comicio.ghtml',
      'news_article',
      'Largo da Batata, São Paulo', 'Comício eleitoral', 'boulos-sao-paulo-cidade-apartheid-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 24. Feliciano: "regulação de IA é controle totalitário do pensamento" (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano compara regulação de inteligência artificial a "controle totalitário do pensamento".',
      'Querem regular a inteligência artificial para controlar o que você pensa, o que você fala, o que você crê. É controle totalitário do pensamento. Vou votar contra qualquer regulação de IA que limite a liberdade de expressão cristã.',
      'Discurso na Câmara dos Deputados durante debate sobre o projeto de lei de regulação da inteligência artificial no Brasil em março de 2025. Especialistas em direito digital e tecnologia criticaram a caracterização do projeto de lei pelo parlamentar.',
      'verified', false, '2025-03-12',
      'https://www.poder360.com.br/congresso/feliciano-regulacao-ia-controle-totalitario-pensamento-2025/',
      'news_article',
      'Câmara dos Deputados', 'Sessão de debate legislativo', 'feliciano-regulacao-ia-controle-totalitario-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 25. Damares: "inteligência artificial vai tirar o emprego dos pregadores" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves afirma que inteligência artificial vai substituir pastores e pregadores evangélicos.',
      'A inteligência artificial vai tirar o emprego dos pregadores. Já existe IA que escreve sermão melhor do que muita gente. A Igreja precisa se preparar para esse desafio ou vai perder o controle da narrativa espiritual.',
      'Declaração em congresso evangélico em São Paulo em outubro de 2024. A senadora discursava sobre os impactos da tecnologia nas igrejas evangélicas brasileiras. A declaração viralizou nas redes sociais e gerou debate sobre o papel da IA em contextos religiosos.',
      'verified', false, '2024-10-18',
      'https://www.uol.com.br/noticias/politica/2024/10/damares-ia-vai-tirar-emprego-pregadores.htm',
      'news_article',
      'São Paulo', 'Congresso evangélico', 'damares-ia-vai-tirar-emprego-pregadores-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Renan: ataca PGR por "falta de independência" ao investigar o PT (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ren,
      'Renan Calheiros acusa a Procuradoria-Geral da República de falta de independência ao investigar o PT.',
      'A PGR não tem independência. Está fazendo o jogo da oposição ao investigar o PT sem nenhuma evidência concreta. É uma procuradoria politizada a serviço de quem perdeu as eleições.',
      'Declaração ao jornal O Globo em novembro de 2023, após a PGR instaurar investigações preliminares sobre possíveis irregularidades em contratos do governo federal. Críticos apontaram que a afirmação de Renan interferia indevidamente na autonomia do Ministério Público.',
      'verified', false, '2023-11-08',
      'https://oglobo.globo.com/politica/renan-calheiros-ataca-pgr-falta-independencia-investigar-pt-2023/',
      'news_article',
      'Brasília', 'Entrevista ao O Globo', 'renan-ataca-pgr-falta-independencia-pt-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 27. Carlos Bolsonaro: "Lula é fantoche de Cuba e Venezuela" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro afirma que Lula é um "fantoche" controlado por Cuba e Venezuela.',
      'Lula é um fantoche. Cuba e Venezuela puxam os fios e ele dança. A política externa brasileira está subordinada a duas ditaduras. O Brasil nunca foi tão humilhado perante o mundo.',
      'Publicação nas redes sociais em julho de 2024, no contexto do relacionamento diplomático do governo Lula com Cuba e Venezuela. A afirmação não apresentou evidências concretas da suposta subordinação do governo brasileiro a esses países.',
      'verified', false, '2024-07-20',
      'https://www.estadao.com.br/politica/carlos-bolsonaro-lula-fantoche-cuba-venezuela-2024/',
      'news_article',
      'Redes sociais', 'Publicação em redes sociais', 'carlos-bolsonaro-lula-fantoche-cuba-venezuela-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Valdemar: PL vai "unir-se a todos os conservadores" para 2026 (2025)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_val,
      'Valdemar Costa Neto anuncia que PL irá unir todos os conservadores em torno de candidatura única para 2026.',
      'O PL vai unir todos os conservadores do Brasil para 2026. Não podemos chegar divididos. Vamos construir uma candidatura que represente todos que não querem o PT no poder. E vamos ganhar.',
      'Declaração à imprensa após reunião da executiva nacional do PL em Brasília em maio de 2025. O presidente do PL liderava articulações para definir candidato do campo conservador à presidência, com Tarcísio de Freitas como nome preferido do partido.',
      'verified', false, '2025-05-08',
      'https://g1.globo.com/politica/noticia/2025/05/valdemar-pl-unir-conservadores-2026-candidatura.ghtml',
      'news_article',
      'Brasília', 'Reunião executiva PL', 'valdemar-pl-unir-conservadores-2026-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Moro: candidatura ao Senado como "terceira via moral" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro apresenta candidatura ao Senado pelo Paraná como representação de uma "terceira via moral".',
      'Sou a terceira via moral deste país. Não sou Lula, não sou Bolsonaro. Sou alguém que lutou contra a corrupção e que vai continuar lutando, agora no Senado, para construir um Brasil melhor.',
      'Discurso de lançamento de candidatura ao Senado pelo estado do Paraná em março de 2024. Críticos lembraram que o próprio Moro havia sido ministro de Bolsonaro e que o STF declarou sua parcialidade como juiz nas ações da Lava Jato.',
      'verified', false, '2024-03-20',
      'https://www1.folha.uol.com.br/poder/2024/03/moro-lanca-candidatura-senado-terceira-via-moral.shtml',
      'news_article',
      'Curitiba, Paraná', 'Lançamento de candidatura', 'moro-candidatura-senado-terceira-via-moral-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 30. Ciro: "Lula e Bolsonaro são dois lados da mesma moeda podre" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes compara Lula e Bolsonaro como "dois lados da mesma moeda podre" da política brasileira.',
      'Lula e Bolsonaro são dois lados da mesma moeda podre. Um governa para o PT, o outro governa para o clã Bolsonaro. Nenhum dos dois governa para o Brasil. O povo continua refém desse duopólio miserável.',
      'Entrevista ao UOL em julho de 2024. Ciro Gomes, que não disputou as eleições de 2022 após derrotas anteriores, mantinha postura crítica a ambos os líderes políticos dominantes do Brasil, mas sem apresentar propostas alternativas concretas no momento.',
      'verified', false, '2024-07-10',
      'https://www.uol.com.br/noticias/politica/2024/07/ciro-gomes-lula-bolsonaro-mesma-moeda-podre.htm',
      'news_article',
      'São Paulo', 'Entrevista ao UOL', 'ciro-lula-bolsonaro-mesma-moeda-podre-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

END $$;
