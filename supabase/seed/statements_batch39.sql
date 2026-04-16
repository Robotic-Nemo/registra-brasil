-- Batch 39: Corrida presidencial 2026 — Flávio Bolsonaro candidato, Lula
-- reeleição, Tarcísio, Pablo Marçal, Eduardo, Nikolas, Gleisi, Ciro,
-- Moro, Hugo Motta, Michelle, e outros atores políticos
-- (Ago 2025 – Abr 2026) — 50 declarações

DO $$
DECLARE
  v_fla UUID; v_bol UUID; v_edu UUID; v_tar UUID;
  v_mar UUID; v_nik UUID; v_lula UUID; v_gle UUID;
  v_cir UUID; v_mor UUID; v_mot UUID; v_mic UUID;
  v_had UUID; v_dam UUID; v_jan UUID; v_mou UUID;
  v_car UUID; v_cai UUID; v_rat UUID; v_rom UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_aut UUID;
  c_ame UUID; c_neg UUID; c_odi UUID; c_cor UUID;
  c_irr UUID; c_vio UUID; c_mac UUID; c_int UUID;
BEGIN
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mot FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_rat FROM politicians WHERE slug = 'ratinho-junior';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';

  -- 1. Flávio anuncia que Bolsonaro o escolheu como candidato à presidência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro anuncia que foi escolhido pelo pai como candidato à presidência em 2026.',
      'Meu pai me escolheu para dar continuidade ao seu projeto de Brasil. Aceito essa missão com honra e responsabilidade. Serei o candidato do presidente Bolsonaro, do PL e de todos os brasileiros que querem um país livre.',
      'Anúncio oficial de Flávio Bolsonaro em coletiva de imprensa em Brasília, em 5 de dezembro de 2025. Jair Bolsonaro transmitiu a decisão por meio de seus advogados da Papudinha.',
      'verified', true, '2025-12-05',
      'https://www.folha.uol.com.br/poder/2025/12/flavio-bolsonaro-anuncia-candidatura-presidente-2026.shtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa — sede do PL', 'flavio-anuncia-candidatura-presidente-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 2. Flávio diz que candidatura é irreversível
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que sua candidatura presidencial é irreversível e que nada vai impedi-lo.',
      'Minha candidatura é irreversível. Não tem força no mundo que me faça recuar. O povo quer um Bolsonaro na presidência e vai ter. Se não pode ser meu pai, serei eu. E vou ganhar.',
      'Entrevista de Flávio Bolsonaro ao podcast Flow em dezembro de 2025, reafirmando sua candidatura e descartando possibilidade de desistência.',
      'verified', false, '2025-12-10',
      'https://www.uol.com.br/noticias/politica/2025/12/flavio-candidatura-irreversivel-presidente.htm',
      'news_article',
      'São Paulo', 'Podcast Flow', 'flavio-candidatura-irreversivel-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 3. Flávio promete que perseguidos vão subir a rampa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio diz que quando vencer, os perseguidos políticos vão subir a rampa do Planalto com ele.',
      'Quando eu vencer, os perseguidos vão subir a rampa comigo. Todos que foram presos, cassados, exilados por defender o Brasil vão subir a rampa do Planalto comigo no dia 1° de janeiro de 2027. Essa é minha promessa.',
      'Discurso de Flávio Bolsonaro em convenção do PL em São Paulo em janeiro de 2026. A fala foi interpretada como promessa de anistia e reversão de condenações.',
      'verified', true, '2026-01-18',
      'https://www.estadao.com.br/politica/flavio-perseguidos-subir-rampa-planalto-convencao-pl/',
      'news_article',
      'São Paulo', 'Convenção do PL', 'flavio-perseguidos-subir-rampa-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 4. Flávio defende fim da reeleição presidencial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro defende fim da reeleição presidencial e mandato único de 5 anos.',
      'Defendo o fim da reeleição presidencial. Um mandato único de 5 anos. A reeleição distorce a democracia porque o presidente governante usa a máquina pública para se reeleger. Lula está fazendo isso agora.',
      'Entrevista de Flávio Bolsonaro à CNN Brasil em fevereiro de 2026. A proposta foi vista como estratégia para impedir a reeleição de Lula.',
      'verified', false, '2026-02-05',
      'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-fim-reeleicao-mandato-unico/',
      'news_article',
      'Brasília', 'CNN Brasil — entrevista', 'flavio-fim-reeleicao-mandato-unico-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 5. Flávio discursa no CPAC Texas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro discursa no CPAC Texas pedindo apoio internacional contra o governo Lula.',
      'Brazil needs the support of the free world. My father is a political prisoner. The left is destroying our democracy. I am running for president to save Brazil and I ask for the support of every freedom-loving person in this room.',
      'Discurso de Flávio Bolsonaro na CPAC (Conservative Political Action Conference) no Texas em março de 2026. O senador usou o evento para internacionalizar sua candidatura.',
      'verified', true, '2026-03-02',
      'https://www.poder360.com.br/internacional/flavio-bolsonaro-cpac-texas-apoio-internacional/',
      'news_article',
      'Dallas, Texas', 'CPAC 2026', 'flavio-cpac-texas-apoio-internacional-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 6. Tarcísio admite possibilidade de candidatura presidencial
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio diz que não descarta candidatura presidencial se for a melhor opção para a direita.',
      'Não descarto nada. Se for o melhor caminho para a direita, estou disponível. Mas primeiro preciso entregar resultados em São Paulo. Meu foco hoje é o governo estadual.',
      'Entrevista de Tarcísio de Freitas à Folha de S.Paulo em agosto de 2025, quando especulações sobre sua candidatura presidencial atingiam o auge.',
      'verified', false, '2025-08-15',
      'https://www.folha.uol.com.br/poder/2025/08/tarcisio-nao-descarta-candidatura-presidencial.shtml',
      'news_article',
      'São Paulo', 'Folha de S.Paulo — entrevista', 'tarcisio-nao-descarta-presidencial-ago-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Tarcísio desiste e diz que vai se reeleger em SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio confirma que não será candidato a presidente e vai buscar reeleição em São Paulo.',
      'Meu compromisso é com São Paulo. Vou buscar a reeleição para governador. São Paulo precisa de continuidade e estabilidade. Não seria correto abandonar o estado no meio do caminho.',
      'Coletiva de imprensa de Tarcísio de Freitas no Palácio dos Bandeirantes em setembro de 2025, encerrando especulações sobre candidatura presidencial.',
      'verified', false, '2025-09-05',
      'https://g1.globo.com/sp/sao-paulo/noticia/2025/09/tarcisio-confirma-reeleicao-sp-descarta-presidencia.ghtml',
      'news_article',
      'São Paulo', 'Palácio dos Bandeirantes — coletiva', 'tarcisio-confirma-reeleicao-sp-set-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 8. Tarcísio apoia candidatura de Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio declara apoio a Flávio Bolsonaro para presidente e diz que juntos vencerão Lula.',
      'Declaro meu apoio à candidatura de Flávio Bolsonaro para presidente. É o nome certo para unir a direita e vencer Lula em 2026. São Paulo e Brasil caminharão juntos rumo a um governo sério e responsável.',
      'Declaração de Tarcísio de Freitas em evento do PL em janeiro de 2026, formalizando apoio à candidatura de Flávio Bolsonaro.',
      'verified', false, '2026-01-25',
      'https://www.uol.com.br/noticias/politica/2026/01/tarcisio-apoia-flavio-bolsonaro-presidente.htm',
      'news_article',
      'São Paulo', 'Evento do PL', 'tarcisio-apoia-flavio-presidente-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 9. Pablo Marçal confirma candidatura presidencial pelo PRTB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal confirma candidatura à presidência pelo PRTB e diz que vai revolucionar a política.',
      'Confirmo minha candidatura à presidência da República pelo PRTB. Vou fazer na política o que fiz nos negócios: revolucionar. O Brasil precisa de um empresário de verdade, não de político profissional.',
      'Anúncio de Pablo Marçal em live no Instagram em outubro de 2025, confirmando candidatura presidencial após quase vencer a eleição para prefeito de São Paulo.',
      'verified', false, '2025-10-10',
      'https://www.metropoles.com/brasil/pablo-marcal-confirma-candidatura-presidente-prtb',
      'social_media_post',
      'São Paulo', 'Live no Instagram', 'marcal-confirma-candidatura-presidente-prtb-out-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 10. Marçal depois apoia Flávio e desiste da candidatura própria
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal desiste de candidatura e anuncia apoio a Flávio Bolsonaro para unir a direita.',
      'A direita precisa estar unida para vencer Lula. Por isso, estou abrindo mão da minha candidatura para apoiar Flávio Bolsonaro. Não é hora de dividir, é hora de somar. Vou colocar minha estrutura digital à disposição da campanha.',
      'Anúncio de Pablo Marçal em entrevista ao podcast Inteligência Ltda em fevereiro de 2026, oficializando apoio a Flávio Bolsonaro.',
      'verified', false, '2026-02-20',
      'https://www.cnnbrasil.com.br/politica/marcal-desiste-apoia-flavio-bolsonaro-presidente/',
      'news_article',
      'São Paulo', 'Podcast Inteligência Ltda', 'marcal-desiste-apoia-flavio-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 11. Eduardo diz que concorreria se pai não puder
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz que concorreria à presidência se o pai e Flávio não pudessem.',
      'Se meu pai e meu irmão não puderem concorrer, eu estou pronto. A família Bolsonaro não vai abandonar o Brasil. Sempre haverá um Bolsonaro disponível para liderar a direita.',
      'Entrevista de Eduardo Bolsonaro a canal conservador no YouTube em setembro de 2025, quando ainda não havia definição sobre a candidatura do PL.',
      'verified', false, '2025-09-25',
      'https://www.poder360.com.br/eleicoes/eduardo-bolsonaro-concorreria-presidente-familia/',
      'news_article',
      'Estados Unidos', 'Canal conservador no YouTube', 'eduardo-concorreria-presidente-familia-set-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 12. Eduardo diz que eleições podem não acontecer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro sugere que eleições de 2026 podem não acontecer se governo Lula cancelá-las.',
      'Não tenho certeza de que as eleições vão acontecer. Esse governo é capaz de tudo. Podem inventar um pretexto para cancelar as eleições se as pesquisas mostrarem que vão perder. Precisamos estar preparados para qualquer cenário.',
      'Declaração de Eduardo Bolsonaro em entrevista à Revista Oeste em novembro de 2025. A fala gerou críticas por sugerir que o governo Lula poderia cancelar eleições.',
      'verified', false, '2025-11-05',
      'https://www.cartacapital.com.br/politica/eduardo-bolsonaro-eleicoes-podem-nao-acontecer/',
      'news_article',
      'Estados Unidos', 'Revista Oeste — entrevista', 'eduardo-eleicoes-podem-nao-acontecer-nov-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 13. Lula diz que 2026 é verdade contra mentira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula define eleição de 2026 como disputa entre verdade e mentira e pede combate às fake news.',
      'A eleição de 2026 será verdade contra mentira. É isso. De um lado, o trabalho que estamos fazendo pelo Brasil. Do outro, fake news, IA manipulada, influenciadores pagos. O povo vai ter que escolher entre a realidade e a ficção.',
      'Discurso de Lula em evento do PT em março de 2026, inaugurando oficialmente o tom da campanha pela reeleição e alertando para o uso de inteligência artificial na disseminação de desinformação.',
      'verified', true, '2026-03-15',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2026-03/lula-2026-verdade-contra-mentira-fake-news',
      'news_article',
      'São Paulo', 'Evento do PT', 'lula-2026-verdade-contra-mentira-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Lula alerta sobre fake news e IA nas eleições
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula alerta que inteligência artificial será usada para criar fake news nas eleições de 2026.',
      'A inteligência artificial vai ser a maior arma da extrema-direita em 2026. Vão criar vídeos falsos meus, vão criar áudios falsos, vão manipular tudo. O Brasil precisa se preparar para essa guerra digital.',
      'Declaração de Lula em reunião ministerial em fevereiro de 2026, pedindo que o governo adote medidas contra deepfakes e desinformação eleitoral.',
      'verified', false, '2026-02-25',
      'https://www.folha.uol.com.br/poder/2026/02/lula-alerta-inteligencia-artificial-fake-news-eleicoes.shtml',
      'news_article',
      'Brasília', 'Palácio do Planalto — reunião ministerial', 'lula-alerta-ia-fake-news-eleicoes-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Lula critica influenciadores digitais da direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa influenciadores digitais de serem mercenários pagos para espalhar mentiras.',
      'Esses influenciadores digitais são mercenários. São pagos para espalhar mentira. Não têm compromisso com a verdade, só com o dinheiro. O povo precisa aprender a desconfiar de quem ganha a vida fazendo vídeo no celular.',
      'Entrevista de Lula à TV Globo em março de 2026, criticando o papel de influenciadores digitais na polarização política e na disseminação de desinformação.',
      'verified', false, '2026-03-20',
      'https://g1.globo.com/politica/noticia/2026/03/lula-influenciadores-mercenarios-fake-news.ghtml',
      'news_article',
      'Brasília', 'TV Globo — entrevista', 'lula-influenciadores-mercenarios-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 16. Nikolas diz que 2026 vai ser guerra
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que 2026 vai ser guerra e que a direita precisa estar pronta para o combate.',
      'Esse ano vai ser guerra. A esquerda vai usar tudo que tem: máquina pública, Judiciário, mídia. Mas nós temos o povo. E o povo é mais forte que qualquer máquina. A direita precisa estar pronta para o maior combate político da história do Brasil.',
      'Vídeo de Nikolas Ferreira publicado em suas redes sociais em abril de 2026, definindo o tom belicista para as eleições. O vídeo alcançou milhões de visualizações.',
      'verified', true, '2026-04-05',
      'https://www.uol.com.br/noticias/politica/2026/04/nikolas-2026-guerra-direita-combate.htm',
      'social_media_post',
      'Belo Horizonte', 'Vídeo em redes sociais', 'nikolas-2026-guerra-combate-abr-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 17. Nikolas ataca Lula e diz que governo destruiu economia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que Lula destruiu a economia e que o povo não aguenta mais pagar a conta.',
      'Lula destruiu a economia brasileira. Inflação disparando, dólar nas alturas, o povo sem conseguir comprar comida. E ele rindo, fazendo piada, viajando de jatinho. O povo não aguenta mais pagar a conta desse governo incompetente.',
      'Discurso de Nikolas Ferreira na tribuna da Câmara em março de 2026, atacando o governo Lula na economia como parte da ofensiva eleitoral do PL.',
      'verified', false, '2026-03-10',
      'https://www.estadao.com.br/politica/nikolas-lula-destruiu-economia-povo-conta/',
      'news_article',
      'Brasília', 'Câmara dos Deputados — tribuna', 'nikolas-lula-destruiu-economia-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Gleisi anuncia missão de construir alianças para Lula 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que missão do PT é construir a maior aliança da história para reeleger Lula.',
      'Nossa missão é construir a maior aliança política da história do Brasil para reeleger o presidente Lula em 2026. Vamos conversar com todos os partidos democráticos. A reeleição de Lula é a garantia da democracia.',
      'Discurso de Gleisi Hoffmann em encontro nacional do PT em novembro de 2025, apresentando a estratégia eleitoral para 2026.',
      'verified', false, '2025-11-20',
      'https://www.pt.org.br/gleisi-alianca-reeleger-lula-2026-encontro-nacional/',
      'news_article',
      'Brasília', 'Encontro Nacional do PT', 'gleisi-alianca-reeleger-lula-2026-nov-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 19. Gleisi anuncia candidatura ao Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann anuncia candidatura ao Senado pelo Paraná e diz que vai enfrentar bolsonarismo no sul.',
      'Anuncio minha candidatura ao Senado pelo Paraná. Vou enfrentar o bolsonarismo no sul do Brasil. O Paraná precisa de uma senadora que defenda a democracia, os trabalhadores e o SUS, não que pregue ódio e divisão.',
      'Anúncio de Gleisi Hoffmann em convenção do PT no Paraná em janeiro de 2026. A presidente do PT disputaria o Senado contra candidato apoiado pelo PL.',
      'verified', false, '2026-01-10',
      'https://www.poder360.com.br/eleicoes/gleisi-candidatura-senado-parana-enfrentar-bolsonarismo/',
      'news_article',
      'Curitiba', 'Convenção PT Paraná', 'gleisi-candidatura-senado-parana-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 20. Ciro Gomes sai do PDT e vai para o PSDB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes deixa o PDT chamando-o de puxadinho do PT e ingressa no PSDB.',
      'Saio do PDT que virou puxadinho do PT. O PDT de Brizola morreu. Ingressei no PSDB porque acredito que o Brasil precisa de uma alternativa de centro que não seja nem o petismo incompetente nem o bolsonarismo fascista.',
      'Coletiva de imprensa de Ciro Gomes anunciando sua filiação ao PSDB em outubro de 2025, após anos de desgaste com a cúpula do PDT.',
      'verified', true, '2025-10-05',
      'https://www.folha.uol.com.br/poder/2025/10/ciro-gomes-sai-pdt-puxadinho-pt-ingressa-psdb.shtml',
      'news_article',
      'São Paulo', 'Sede do PSDB — coletiva', 'ciro-sai-pdt-puxadinho-pt-psdb-out-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 21. Ciro ataca Lula e Bolsonaro como farinha do mesmo saco
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes diz que Lula e bolsonarismo são farinha do mesmo saco e que Brasil precisa de terceira via.',
      'Lula e bolsonarismo são farinha do mesmo saco. Um é populismo de esquerda, outro é populismo de direita. Os dois destroem o Brasil. O país precisa de uma terceira via séria, com propostas concretas e não com demagogia barata.',
      'Discurso de Ciro Gomes em filiação ao PSDB, definindo seu posicionamento como alternativa aos dois polos da política brasileira.',
      'verified', false, '2025-10-05',
      'https://www.cnnbrasil.com.br/politica/ciro-lula-bolsonarismo-farinha-mesmo-saco-terceira-via/',
      'news_article',
      'São Paulo', 'Sede do PSDB — filiação', 'ciro-lula-bolsonarismo-farinha-mesmo-saco-out-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Sergio Moro ingressa no PL para disputar governo do Paraná
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sergio Moro anuncia filiação ao PL e candidatura ao governo do Paraná em 2026.',
      'Estou me filiando ao PL e serei candidato a governador do Paraná. O Paraná merece um governo sério, focado em segurança e combate à corrupção. Vou levar para o estado a experiência que tive na Lava Jato.',
      'Anúncio de Sergio Moro em coletiva de imprensa em Curitiba em dezembro de 2025, formalizando ingresso no PL e candidatura ao governo estadual.',
      'verified', false, '2025-12-15',
      'https://www.estadao.com.br/politica/moro-filia-pl-candidato-governador-parana/',
      'news_article',
      'Curitiba', 'Sede do PL Paraná — coletiva', 'moro-filia-pl-governador-parana-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 23. Moro diz que Lava Jato está sendo desmontada pelo governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Moro acusa governo Lula de desmontar o combate à corrupção e reverter conquistas da Lava Jato.',
      'O governo Lula está desmontando sistematicamente tudo que construímos no combate à corrupção. A Lava Jato está sendo destruída, os condenados estão sendo soltos, e o crime organizado está celebrando. Isso não pode continuar.',
      'Discurso de Moro em evento do PL no Paraná em janeiro de 2026, usando o combate à corrupção como principal bandeira de campanha.',
      'verified', false, '2026-01-20',
      'https://www.poder360.com.br/justica/moro-lula-desmontando-lava-jato-corrupcao/',
      'news_article',
      'Curitiba', 'Evento do PL Paraná', 'moro-lula-desmontando-lava-jato-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 24. Hugo Motta eleito presidente da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta diz ao ser eleito presidente da Câmara que tem nojo de ditadura e vai defender a democracia.',
      'Tenho nojo de ditadura. Podem contar comigo para defender a democracia. A Câmara dos Deputados será uma casa de diálogo, não de confronto. Vamos legislar para o povo, não para partidos.',
      'Discurso de posse de Hugo Motta como presidente da Câmara dos Deputados em fevereiro de 2025, após ser eleito com 444 votos.',
      'verified', false, '2025-02-01',
      'https://g1.globo.com/politica/noticia/2025/02/hugo-motta-eleito-presidente-camara-nojo-ditadura.ghtml',
      'news_article',
      'Brasília', 'Câmara dos Deputados — posse', 'hugo-motta-eleito-camara-nojo-ditadura-fev-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 25. Hugo Motta defende equilíbrio entre poderes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mot,
      'Hugo Motta pede harmonia entre poderes e diz que Congresso não aceita pressão de nenhum lado.',
      'O Congresso Nacional não aceita pressão nem do Executivo nem do Judiciário. Vamos defender nossa autonomia e trabalhar pela harmonia entre os poderes. Quem pressionar vai encontrar resistência.',
      'Declaração de Hugo Motta em entrevista à CNN Brasil em março de 2025, posicionando-se como mediador entre os poderes durante a crise institucional.',
      'verified', false, '2025-03-15',
      'https://www.cnnbrasil.com.br/politica/hugo-motta-harmonia-poderes-congresso-autonomia/',
      'news_article',
      'Brasília', 'CNN Brasil — entrevista', 'motta-harmonia-poderes-congresso-mar-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 26. Michelle Bolsonaro descarta candidatura e apoia Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro descarta candidatura própria e declara apoio total a Flávio para presidente.',
      'Meu lugar agora é ao lado da minha família. Não serei candidata. Meu apoio total é ao Flávio, que foi escolhido pelo presidente para levar adiante nosso projeto. Vou percorrer o Brasil inteiro pedindo voto para o Flávio.',
      'Entrevista de Michelle Bolsonaro à Record TV em janeiro de 2026, encerrando especulações sobre sua candidatura e formalizando apoio ao enteado.',
      'verified', false, '2026-01-08',
      'https://www.uol.com.br/noticias/politica/2026/01/michelle-descarta-candidatura-apoia-flavio.htm',
      'news_article',
      'Brasília', 'Record TV — entrevista', 'michelle-descarta-candidatura-apoia-flavio-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 27. Michelle diz que Lula destruiu a família brasileira
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro acusa Lula de destruir a família brasileira com pautas progressistas.',
      'Lula está destruindo a família brasileira. Ele quer impor ideologia de gênero nas escolas, quer liberar drogas, quer destruir os valores cristãos. Em 2026, vamos defender a família brasileira com o Flávio na presidência.',
      'Discurso de Michelle Bolsonaro em congresso evangélico em fevereiro de 2026, usando pautas de costumes para mobilizar eleitorado conservador.',
      'verified', false, '2026-02-15',
      'https://www.metropoles.com/brasil/michelle-lula-destruir-familia-ideologia-genero',
      'news_article',
      'Goiânia', 'Congresso evangélico', 'michelle-lula-destruir-familia-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Haddad defende legado econômico do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad diz que economia brasileira cresceu apesar dos ataques e que oposição mente sobre dados.',
      'A economia brasileira cresceu, o emprego voltou, a inflação está controlada. A oposição mente descaradamente sobre os dados econômicos. Todos os indicadores mostram que o governo Lula está no caminho certo.',
      'Coletiva de imprensa do ministro Fernando Haddad no Ministério da Fazenda em março de 2026, respondendo a críticas da oposição sobre a economia.',
      'verified', false, '2026-03-05',
      'https://agenciabrasil.ebc.com.br/economia/noticia/2026-03/haddad-economia-cresceu-oposicao-mente-dados',
      'news_article',
      'Brasília', 'Ministério da Fazenda — coletiva', 'haddad-economia-cresceu-oposicao-mente-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 29. Janones promete campanha agressiva contra Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones promete campanha digital agressiva contra Flávio Bolsonaro e diz que vai expor toda a família.',
      'Vou expor toda a família Bolsonaro. Rachadinhas, mansões, contas no exterior. O Flávio acha que vai ser presidente? Vai ser desmascarado. Minha campanha digital vai mostrar quem são os Bolsonaro de verdade.',
      'Live de André Janones no Instagram em janeiro de 2026, inaugurando a ofensiva digital do PT contra a candidatura de Flávio Bolsonaro.',
      'verified', false, '2026-01-15',
      'https://www.cartacapital.com.br/politica/janones-campanha-agressiva-flavio-bolsonaro-expor/',
      'social_media_post',
      'Belo Horizonte', 'Live no Instagram', 'janones-campanha-agressiva-flavio-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 30. Damares diz que mulheres evangélicas elegerão Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves diz que as mulheres evangélicas serão o motor da eleição de Flávio Bolsonaro.',
      'As mulheres evangélicas vão eleger Flávio Bolsonaro presidente. Somos a maioria silenciosa que vai decidir essa eleição. Vamos votar pela família, pela fé, pelos nossos filhos. Lula não nos representa.',
      'Discurso de Damares Alves em evento de mulheres evangélicas do PL em março de 2026, mobilizando o eleitorado feminino conservador.',
      'verified', false, '2026-03-08',
      'https://www.gospelprime.com.br/damares-mulheres-evangelicas-eleger-flavio-2026/',
      'news_article',
      'São Paulo', 'Evento mulheres evangélicas do PL', 'damares-mulheres-evangelicas-flavio-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 31. Flávio ataca Lula e diz que governo é o mais corrupto da história
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que governo Lula é o mais corrupto da história e promete acabar com impunidade.',
      'O governo Lula é o mais corrupto da história do Brasil. Bilhões desviados em emendas, ministérios aparelhados, corrupção institucionalizada. Quando eu for presidente, vou acabar com essa impunidade. Os corruptos vão para a cadeia.',
      'Discurso de Flávio Bolsonaro em comício do PL no Rio de Janeiro em março de 2026, intensificando ataques ao governo Lula.',
      'verified', false, '2026-03-18',
      'https://www.poder360.com.br/eleicoes/flavio-governo-lula-mais-corrupto-historia/',
      'news_article',
      'Rio de Janeiro', 'Comício do PL', 'flavio-governo-lula-mais-corrupto-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 32. Marçal diz que vai trazer voto jovem para Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal promete trazer voto jovem para Flávio e diz que esquerda perdeu a juventude.',
      'A juventude brasileira é de direita. A esquerda perdeu os jovens. Minha missão é trazer esses milhões de jovens para votar no Flávio. Com minha audiência digital e o projeto do Flávio, vamos ganhar essa eleição.',
      'Entrevista de Pablo Marçal ao podcast PodPah em março de 2026, explicando seu papel na campanha de Flávio Bolsonaro.',
      'verified', false, '2026-03-12',
      'https://www.uol.com.br/noticias/politica/2026/03/marcal-voto-jovem-flavio-esquerda-perdeu.htm',
      'news_article',
      'São Paulo', 'Podcast PodPah', 'marcal-voto-jovem-flavio-esquerda-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 33. Lula diz que não vai permitir que golpistas voltem ao poder
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que não permitirá que filhos de golpista cheguem à presidência e pede mobilização.',
      'Não vamos permitir que o filho de um golpista condenado chegue à presidência da República. O Brasil não merece isso. O povo precisa se mobilizar para defender a democracia nas urnas em 2026.',
      'Discurso de Lula em ato do Dia do Trabalhador em maio de 2025, fazendo referência direta à possibilidade de candidatura de um Bolsonaro à presidência.',
      'verified', false, '2025-05-01',
      'https://www.folha.uol.com.br/poder/2025/05/lula-nao-permitir-filho-golpista-presidencia.shtml',
      'news_article',
      'São Paulo', 'Ato do Dia do Trabalhador', 'lula-nao-permitir-filho-golpista-mai-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 34. Flávio diz que vai libertar todos os presos políticos no primeiro dia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio promete libertar todos os presos políticos no primeiro dia de governo.',
      'No primeiro dia do meu governo, vou assinar decreto libertando todos os presos políticos. Meu pai, os patriotas do 8 de janeiro, todos. Ninguém mais vai ser preso por defender o Brasil.',
      'Discurso de Flávio Bolsonaro em evento do PL em Goiânia em fevereiro de 2026. Juristas questionaram a legalidade da promessa.',
      'verified', true, '2026-02-22',
      'https://www.estadao.com.br/politica/flavio-libertar-presos-politicos-primeiro-dia/',
      'news_article',
      'Goiânia', 'Evento do PL', 'flavio-libertar-presos-politicos-primeiro-dia-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 35. Ronaldo Caiado posiciona-se como alternativa na direita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Caiado diz que é alternativa na direita e critica dynastia Bolsonaro.',
      'O Brasil não precisa de dinastia. A direita precisa de renovação, não de herança política. Estou me colocando como alternativa para quem quer uma direita moderna, sem culto à personalidade.',
      'Entrevista de Ronaldo Caiado à Folha de S.Paulo em dezembro de 2025, posicionando-se como alternativa a Flávio Bolsonaro na direita.',
      'verified', false, '2025-12-08',
      'https://www.folha.uol.com.br/poder/2025/12/caiado-alternativa-direita-critica-dinastia-bolsonaro.shtml',
      'news_article',
      'Goiânia', 'Folha de S.Paulo — entrevista', 'caiado-alternativa-direita-dinastia-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 36. Ratinho Junior avalia cenário para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rat,
      'Ratinho Junior diz que está avaliando cenário mas que prioridade é entregar governo no Paraná.',
      'Estou avaliando o cenário político para 2026. Há muita gente me pedindo para ser candidato a algo maior. Mas minha prioridade é entregar um bom governo aqui no Paraná. Toda decisão será tomada no momento certo.',
      'Entrevista de Ratinho Junior à Gazeta do Povo em novembro de 2025, alimentando especulações sobre candidatura a vice-presidente ou ao Senado.',
      'verified', false, '2025-11-15',
      'https://www.gazetadopovo.com.br/politica/ratinho-junior-cenario-2026-prioridade-parana/',
      'news_article',
      'Curitiba', 'Gazeta do Povo — entrevista', 'ratinho-junior-cenario-2026-prioridade-nov-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 37. Mourão critica Flávio e diz que PL precisa de candidato com experiência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Mourão critica escolha de Flávio e diz que partido precisa de candidato com experiência executiva.',
      'Com todo respeito ao Flávio, o país precisa de alguém com experiência executiva para ser presidente. Ser filho de presidente não é qualificação. O PL tem quadros preparados. Precisamos pensar no que é melhor para o Brasil, não para uma família.',
      'Entrevista de Hamilton Mourão ao Estadão em dezembro de 2025, discordando publicamente da escolha de Flávio Bolsonaro como candidato.',
      'verified', false, '2025-12-10',
      'https://www.estadao.com.br/politica/mourao-critica-flavio-experiencia-executiva/',
      'news_article',
      'Brasília', 'Estadão — entrevista', 'mourao-critica-flavio-experiencia-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 38. Nikolas defende Flávio e ataca Mourão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende Flávio e diz que Mourão deveria ter ficado calado e apoiado a família.',
      'Mourão deveria ter ficado calado. O presidente Bolsonaro escolheu Flávio e ponto final. Quem não respeita a decisão do líder está traindo o movimento. Mourão já traiu uma vez, não vai trair de novo.',
      'Vídeo de Nikolas Ferreira em suas redes sociais em dezembro de 2025, respondendo às críticas de Mourão a Flávio Bolsonaro.',
      'verified', false, '2025-12-12',
      'https://www.metropoles.com/brasil/nikolas-defende-flavio-ataca-mourao-traidor',
      'social_media_post',
      'Belo Horizonte', 'Vídeo em redes sociais', 'nikolas-defende-flavio-ataca-mourao-dez-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 39. Flávio diz que rachadinhas são mentira e processo é perseguição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio diz que caso das rachadinhas é mentira inventada para impedir sua candidatura.',
      'As rachadinhas são uma mentira inventada pela esquerda e pela mídia para me impedir de ser presidente. Fui absolvido em todas as instâncias que analisaram o caso com seriedade. Não vão me parar com fake news.',
      'Entrevista de Flávio Bolsonaro à Jovem Pan em janeiro de 2026, respondendo a questionamentos sobre o caso das rachadinhas ressuscitado pela oposição.',
      'verified', false, '2026-01-22',
      'https://jovenpan.uol.com.br/noticias/politica/flavio-rachadinhas-mentira-perseguicao-candidatura.html',
      'news_article',
      'São Paulo', 'Jovem Pan — entrevista', 'flavio-rachadinhas-mentira-perseguicao-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 40. Carlos Bolsonaro coordena redes sociais da campanha de Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro diz que vai comandar a maior operação digital da história das eleições brasileiras.',
      'Vou comandar a maior operação digital da história das eleições no Brasil. Temos milhões de seguidores, milhares de criadores de conteúdo. A esquerda não tem chance contra nós nas redes. A internet é nossa.',
      'Entrevista de Carlos Bolsonaro a canal no YouTube em fevereiro de 2026, assumindo coordenação das redes sociais da campanha de Flávio.',
      'verified', false, '2026-02-10',
      'https://www.cartacapital.com.br/politica/carlos-bolsonaro-operacao-digital-eleicoes-flavio/',
      'news_article',
      'Rio de Janeiro', 'Canal no YouTube', 'carlos-operacao-digital-campanha-flavio-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Lula diz que vai vencer com o voto dos mais pobres
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que vai vencer 2026 com o voto dos mais pobres que sabem quem cuida deles.',
      'Vou vencer essa eleição com o voto do povo pobre, do trabalhador, da dona de casa que sabe quem botou comida na mesa dela. O pobre sabe quem cuida dele. Não é a direita que corta Bolsa Família.',
      'Discurso de Lula em inauguração de casas populares no Nordeste em abril de 2026, consolidando estratégia de campanha focada em programas sociais.',
      'verified', false, '2026-04-02',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2026-04/lula-vencer-voto-pobres-trabalhadores',
      'news_article',
      'Recife', 'Inauguração casas populares', 'lula-vencer-voto-pobres-trabalhadores-abr-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 42. Flávio propõe armar população e acabar com desarmamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro promete revogar o Estatuto do Desarmamento se eleito presidente.',
      'Vou revogar o Estatuto do Desarmamento. O cidadão de bem tem direito de se defender. Enquanto o bandido tem arma, o trabalhador está desprotegido. No meu governo, o povo vai poder se armar para defender sua família.',
      'Discurso de Flávio Bolsonaro em feira de armas e munições em São Paulo em março de 2026, reforçando pauta armamentista da campanha.',
      'verified', false, '2026-03-22',
      'https://www.cnnbrasil.com.br/politica/flavio-revogar-desarmamento-armar-populacao/',
      'news_article',
      'São Paulo', 'Feira de armas SHOT Show Brasil', 'flavio-revogar-desarmamento-armar-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 43. Gleisi acusa direita de tentar eleger golpista por procuração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi diz que direita tenta eleger golpista por procuração colocando filho de Bolsonaro na presidência.',
      'A direita está tentando eleger um golpista por procuração. Não conseguiram dar o golpe, agora querem o poder pela porta dos fundos colocando o filho do condenado na presidência. O povo não vai cair nessa.',
      'Discurso de Gleisi Hoffmann em plenário do Senado em março de 2026, atacando diretamente a candidatura de Flávio Bolsonaro.',
      'verified', false, '2026-03-25',
      'https://www.poder360.com.br/congresso/gleisi-direita-golpista-procuracao-flavio/',
      'news_article',
      'Brasília', 'Senado Federal — plenário', 'gleisi-golpista-procuracao-flavio-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 44. Nikolas diz que vai ser vice de Flávio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que aceitaria ser vice-presidente na chapa de Flávio Bolsonaro.',
      'Se o Flávio me convidar para ser vice, eu aceito. Seria uma honra representar a juventude conservadora brasileira. Juntos, vamos trazer a energia que falta na política e derrotar a esquerda.',
      'Entrevista de Nikolas Ferreira ao podcast Os Sócios em fevereiro de 2026, alimentando especulações sobre a composição da chapa do PL.',
      'verified', false, '2026-02-28',
      'https://www.uol.com.br/noticias/politica/2026/02/nikolas-vice-flavio-chapa-pl.htm',
      'news_article',
      'Belo Horizonte', 'Podcast Os Sócios', 'nikolas-vice-flavio-chapa-pl-fev-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 45. Ciro diz que Flávio não tem preparo para governar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes diz que Flávio não tem preparo intelectual para governar e que é apenas nome de família.',
      'Flávio Bolsonaro não tem o menor preparo intelectual para governar o Brasil. Não tem currículo, não tem projeto, não tem competência. Só tem o sobrenome. O Brasil não é uma monarquia para ter sucessão familiar.',
      'Entrevista de Ciro Gomes ao canal Metrópoles em janeiro de 2026, criticando a candidatura de Flávio Bolsonaro e apresentando-se como alternativa preparada.',
      'verified', false, '2026-01-28',
      'https://www.metropoles.com/brasil/ciro-flavio-nao-tem-preparo-intelectual-governar',
      'news_article',
      'São Paulo', 'Canal Metrópoles — entrevista', 'ciro-flavio-sem-preparo-governar-jan-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 46. Romário apoia Flávio e diz que país precisa de sangue novo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rom,
      'Romário declara apoio a Flávio e diz que Brasil precisa de sangue novo na presidência.',
      'Apoio o Flávio Bolsonaro para presidente. O Brasil precisa de sangue novo, de alguém que tenha coragem de enfrentar o establishment. Flávio tem essa coragem e tem o apoio do maior líder popular do Brasil, que é o presidente Bolsonaro.',
      'Declaração de Romário em evento do PL no Rio de Janeiro em março de 2026. O senador formalizou apoio à candidatura de Flávio.',
      'verified', false, '2026-03-05',
      'https://www.estadao.com.br/politica/romario-apoia-flavio-sangue-novo-presidencia/',
      'news_article',
      'Rio de Janeiro', 'Evento do PL Rio', 'romario-apoia-flavio-sangue-novo-mar-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 47. Flávio promete reformar STF e limitar poderes dos ministros
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro promete reformar o STF, limitar mandatos e acabar com inquéritos de ofício.',
      'Vou propor uma reforma completa do STF. Mandato com prazo fixo, fim dos inquéritos de ofício, fim da censura judicial. Os ministros do Supremo não são deuses. São servidores públicos que devem prestar contas ao povo.',
      'Entrevista de Flávio Bolsonaro ao Estadão em abril de 2026, apresentando propostas de reforma do Judiciário como eixo central da campanha.',
      'verified', true, '2026-04-01',
      'https://www.estadao.com.br/politica/flavio-reformar-stf-limitar-poderes-ministros/',
      'news_article',
      'Brasília', 'Estadão — entrevista', 'flavio-reformar-stf-limitar-poderes-abr-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 48. Lula diz que opositores querem destruir instituições
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula diz que direita quer destruir instituições brasileiras e que reformar STF é código para golpe.',
      'Quando a direita fala em reformar o STF, ela quer dizer destruir o STF. Quando fala em liberdade, quer dizer impunidade para golpistas. Não vamos deixar que destruam as instituições que protegem a democracia brasileira.',
      'Discurso de Lula em cerimônia no Palácio do Planalto em abril de 2026, respondendo às propostas de Flávio Bolsonaro para reforma do Judiciário.',
      'verified', false, '2026-04-05',
      'https://g1.globo.com/politica/noticia/2026/04/lula-direita-destruir-stf-codigo-golpe.ghtml',
      'news_article',
      'Brasília', 'Palácio do Planalto — cerimônia', 'lula-direita-destruir-stf-codigo-golpe-abr-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 49. Marçal ataca classe política e diz que empresários devem governar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal diz que políticos profissionais destruíram o Brasil e que empresários precisam assumir o poder.',
      'Os políticos profissionais destruíram o Brasil. Esquerda, direita, centro, todos iguais. O Brasil precisa ser governado por empresários que sabem gerar riqueza, não por parasitas que só sabem gastar dinheiro público.',
      'Live de Pablo Marçal em outubro de 2025, antes de anunciar apoio a Flávio, quando ainda defendia candidatura própria como outsider político.',
      'verified', false, '2025-10-20',
      'https://www.folha.uol.com.br/poder/2025/10/marcal-politicos-destruiram-brasil-empresarios-governar.shtml',
      'social_media_post',
      'São Paulo', 'Live no Instagram', 'marcal-politicos-destruiram-empresarios-out-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Flávio encerra primeiro grande comício prometendo reconstruir o Brasil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro em comício promete reconstruir o Brasil e libertar o país do petismo.',
      'Vou reconstruir o Brasil que o PT destruiu. Vou libertar os presos políticos, vou reformar o Judiciário, vou devolver a liberdade ao povo brasileiro. Meu pai começou essa revolução e eu vou terminá-la. O Brasil será livre novamente.',
      'Discurso de Flávio Bolsonaro no encerramento de seu primeiro grande comício de pré-campanha em Brasília em abril de 2026, reunindo milhares de apoiadores na Esplanada dos Ministérios.',
      'verified', true, '2026-04-13',
      'https://www.cnnbrasil.com.br/politica/flavio-comicio-brasilia-reconstruir-brasil-libertar/',
      'news_article',
      'Brasília', 'Comício na Esplanada dos Ministérios', 'flavio-comicio-reconstruir-brasil-libertar-abr-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

END $$;
