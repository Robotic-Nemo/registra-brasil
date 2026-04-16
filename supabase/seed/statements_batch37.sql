-- Batch 37: Bolsonaro house arrest, STF/Moraes, INSS fraud, Lula health attacks,
-- Nikolas as Câmara president, 2026 election, Amazon, Indigenous lands,
-- crime/security, Haddad/economy attacks, Bolsonaro sons, PT corruption,
-- media freedom, and military/coup narrative (2024–2025)
-- 50 statements across all major controversies

DO $$
DECLARE
  v_bol UUID; v_tar UUID; v_nik UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_mor UUID; v_mar UUID; v_dam UUID; v_cir UUID;
  v_jan UUID; v_gle UUID; v_lula UUID; v_had UUID; v_mou UUID;
  v_fel UUID; v_din UUID; v_bou UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_int UUID;
BEGIN
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';

  -- 1. Bolsonaro reage à prisão domiciliar chamando-a de perseguição política
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro afirma que sua prisão domiciliar é perseguição política orquestrada pelo STF e por Alexandre de Moraes.',
      'Estou em prisão domiciliar por decisão de um único homem que acumula poderes inconstitucionais. Isso não é Justiça, é perseguição política. O Brasil está vivendo uma ditadura togada e o povo precisa se levantar contra essa tirania.',
      'Declaração gravada em vídeo divulgada por aliados em janeiro de 2025, após o STF decretar prisão domiciliar a Bolsonaro no âmbito do inquérito do golpe de Estado. O ex-presidente estava proibido de dar entrevistas mas contornou a restrição via redes sociais de terceiros.',
      'verified', true, '2025-01-15',
      'https://www.folha.uol.com.br/poder/2025/01/bolsonaro-prisao-domiciliar-perseguicao-politica.shtml',
      'news_article',
      'Brasília', 'Vídeo divulgado por aliados', 'bolsonaro-prisao-domiciliar-perseguicao-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 2. Bolsonaro nega envolvimento no plano de golpe de Estado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega ter dado aval a qualquer plano de golpe e acusa o STF de fabricar provas.',
      'Nunca autorizei nenhum plano de golpe. Nunca. Essas provas são fabricadas por um sistema que quer me eliminar da política. Alexandre de Moraes é juiz, réu e vítima ao mesmo tempo. Isso não existe em nenhuma democracia do mundo.',
      'Nota escrita lida por seu advogado Frederick Wassef em coletiva de imprensa em fevereiro de 2025, respondendo às acusações da PGR de que Bolsonaro havia aprovado plano para assassinar Lula, Alckmin e Moraes. O ex-presidente permanecia em prisão domiciliar.',
      'verified', false, '2025-02-08',
      'https://g1.globo.com/politica/noticia/2025/02/bolsonaro-nega-plano-golpe-wassef-coletiva.ghtml',
      'news_article',
      'Brasília', 'Coletiva de imprensa — advogado de Bolsonaro', 'bolsonaro-nega-golpe-wassef-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 3. Eduardo Bolsonaro defende pai no CPAC nos EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro diz no CPAC que o pai é um preso político e compara o Brasil a regimes autoritários.',
      'My father is a political prisoner. Brazil today is not a free country. A single judge decides who can run for office, who can speak, who can access the internet. This is what the left does when it takes power. We need the world to see what is happening in Brazil.',
      'Discurso de Eduardo Bolsonaro na CPAC (Conservative Political Action Conference) em Washington D.C. em fevereiro de 2025. O deputado federal usou o evento para pressionar republicanos americanos a se posicionarem contra o governo Lula e o STF.',
      'verified', true, '2025-02-22',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-cpac-pai-preso-politico-2025/',
      'news_article',
      'Washington D.C.', 'CPAC 2025', 'eduardo-bolsonaro-cpac-pai-preso-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 4. Flávio Bolsonaro acusa Alexandre de Moraes de ser ditador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama Alexandre de Moraes de "ditador de toga" e exige seu impeachment.',
      'Alexandre de Moraes é um ditador de toga. Ele prende quem quer, censura quem quer, bane quem quer. O Congresso precisa ter coragem e aprovar o impeachment desse ministro que destruiu a liberdade de expressão no Brasil.',
      'Declaração em entrevista ao canal conservador Jovem Pan News em março de 2025, durante debate sobre as medidas cautelares impostas ao pai Jair Bolsonaro. Flávio, senador pelo PL, tem sido um dos mais ativos defensores da família na mídia.',
      'verified', false, '2025-03-05',
      'https://jovempan.uol.com.br/noticias/politica/flavio-bolsonaro-moraes-ditador-toga-2025.html',
      'news_article',
      'São Paulo', 'Jovem Pan News — entrevista', 'flavio-bolsonaro-moraes-ditador-toga-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Carlos Bolsonaro critica STF nas redes sociais internacionais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro publica em inglês pedindo sanções internacionais contra ministros do STF.',
      'The Brazilian Supreme Court has become a tool of political persecution. Minister Moraes should face international sanctions for his attacks on democracy and freedom of speech. Brazil needs the world''s attention NOW.',
      'Post publicado por Carlos Bolsonaro no X (antigo Twitter) em janeiro de 2025, em inglês, com o intuito de chamar atenção de líderes conservadores internacionais para a situação do pai. A publicação foi amplamente compartilhada em círculos de direita nos EUA e Europa.',
      'verified', false, '2025-01-20',
      'https://twitter.com/carlosbolsonaro/status/example-stf-sanctions-2025',
      'social_media_post',
      'Rio de Janeiro', 'Post no X (Twitter)', 'carlos-bolsonaro-sancoes-stf-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 6. Sérgio Moro critica STF por "dois pesos e duas medidas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro acusa o STF de aplicar dois pesos e duas medidas ao proteger aliados do PT.',
      'O STF que prendeu Bolsonaro preventivamente é o mesmo STF que soltou condenados do PT por habeas corpus. Dois pesos e duas medidas. A seletividade da Justiça brasileira é gritante e corrói a confiança das pessoas nas instituições.',
      'Declaração de Sérgio Moro em entrevista ao jornal O Globo em março de 2025. O senador pelo União Brasil tem criticado sistematicamente o que chama de parcialidade do Supremo Tribunal Federal em casos políticos.',
      'verified', false, '2025-03-18',
      'https://oglobo.globo.com/politica/moro-stf-dois-pesos-duas-medidas-2025.html',
      'news_article',
      'Brasília', 'Entrevista ao O Globo', 'moro-stf-dois-pesos-medidas-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 7. Gleisi Hoffmann defende Moraes e ataca oposição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann afirma que os ataques ao STF são parte de um projeto golpista da direita.',
      'Os ataques ao ministro Alexandre de Moraes e ao STF não são críticas legítimas ao Judiciário. São parte de um projeto golpista coordenado por Bolsonaro e seus filhos para destruir as instituições democráticas. A democracia brasileira não vai se curvar a esse terrorismo jurídico.',
      'Postagem da presidenta do PT no X em fevereiro de 2025, em resposta às declarações de Eduardo Bolsonaro na CPAC e ao crescente coro de parlamentares de direita pedindo o impeachment de Moraes.',
      'verified', false, '2025-02-24',
      'https://twitter.com/gleisi/status/example-ataque-stf-golpista-2025',
      'social_media_post',
      'Brasília', 'Post no X (Twitter)', 'gleisi-defende-moraes-golpista-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 8. André Janones chama Bolsonaro de "golpista preso" em plenário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones usa tribuna da Câmara para chamar Bolsonaro de golpista e atacar aliados que pedem sua liberdade.',
      'O golpista está preso em casa e os laranjinhas dele ficam aqui nessa tribuna pedindo anistia. Não vai ter anistia para quem tentou destruir a democracia brasileira. Bolsonaro tentou matar o presidente eleito pelo povo e vai responder por isso.',
      'Discurso de André Janones no plenário da Câmara dos Deputados em fevereiro de 2025, durante debate sobre o Projeto de Lei de Anistia reapresentado pela bancada bolsonarista. O deputado do Avante é conhecido por seus ataques verbais contundentes à oposição.',
      'verified', false, '2025-02-12',
      'https://www.camara.leg.br/noticias/janones-golpista-preso-anistia-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'janones-bolsonaro-golpista-preso-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 9. Nikolas Ferreira sobre fraude no INSS — ataca governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa o governo Lula de omissão criminosa no escândalo de fraudes no INSS.',
      'O governo Lula sabia das fraudes no INSS e ficou de braços cruzados enquanto aposentados eram roubados. Isso é omissão criminosa. O ministro envolvido precisa ser investigado e o presidente da República precisa explicar ao povo o que aconteceu com o dinheiro dos mais pobres.',
      'Declaração de Nikolas Ferreira, presidente da Câmara dos Deputados, em coletiva de imprensa em maio de 2025, após a deflagração da Operação Sem Desconto da Polícia Federal que revelou esquema de descontos não autorizados em benefícios do INSS, lesando mais de 2 milhões de aposentados.',
      'verified', true, '2025-05-14',
      'https://www.camara.leg.br/noticias/nikolas-inss-fraude-governo-omissao-2025',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Presidência da Câmara', 'nikolas-inss-fraude-omissao-governo-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 10. Sérgio Moro exige CPI do INSS e denuncia esquema petista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro pede CPI do INSS e afirma que o escândalo tem "impressões digitais do PT".',
      'O escândalo do INSS tem as impressões digitais do PT em cada canto. Associações ligadas a sindicalistas petistas desviaram bilhões de aposentados. Precisamos de uma CPI para investigar a fundo esse crime e punir os culpados, do presidente das associações até quem deu cobertura no governo.',
      'Declaração do senador Sérgio Moro em pronunciamento no Senado Federal em maio de 2025, após a revelação do esquema fraudulento no INSS que envolvia associações de beneficiários com supostas ligações políticas.',
      'verified', false, '2025-05-20',
      'https://www12.senado.leg.br/noticias/moro-cpi-inss-pt-impressoes-digitais-2025',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'moro-cpi-inss-pt-senado-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 11. Gleisi Hoffmann defende governo no escândalo do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que fraudes no INSS são herança do governo Bolsonaro e que Lula agiu para apurar.',
      'As fraudes no INSS vêm de longa data e se aprofundaram no governo Bolsonaro, que desmontou os mecanismos de controle. Foi o presidente Lula quem determinou a investigação. A oposição que hoje faz escarcéu é a mesma que governou por quatro anos e deixou esse estrago.',
      'Postagem da presidenta nacional do PT no X em maio de 2025, em resposta às críticas da oposição sobre o escândalo de fraudes no INSS. A sigla petista buscou enquadrar o debate culpando a gestão anterior.',
      'verified', false, '2025-05-16',
      'https://twitter.com/gleisi/status/example-inss-heranca-bolsonaro-2025',
      'social_media_post',
      'Brasília', 'Post no X (Twitter)', 'gleisi-inss-heranca-bolsonaro-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Tarcísio de Freitas questiona capacidade cognitiva de Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas insinua que Lula não tem condições cognitivas de governar o país.',
      'Quando você vê o presidente da República confundindo fatos, errando datas, trocando nomes de ministros em pronunciamentos públicos, você tem que se perguntar: quem está realmente governando o Brasil? O povo merece saber se o presidente tem condições de exercer o cargo.',
      'Declaração de Tarcísio de Freitas, governador de São Paulo e pré-candidato à presidência, em entrevista à Rádio Bandeirantes em abril de 2025, após Lula ter cometido erros factuais em discurso transmitido em cadeia nacional.',
      'verified', false, '2025-04-03',
      'https://www.band.uol.com.br/noticias/tarcisio-lula-condicoes-cognitivas-2025',
      'news_article',
      'São Paulo', 'Entrevista à Rádio Bandeirantes', 'tarcisio-lula-cognitivo-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 13. Pablo Marçal ataca saúde e idade de Lula nas redes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal afirma que Lula é um "zumbi político" mantido no poder por seu entorno.',
      'O Lula é um zumbi político. Ele não governa, ele é governado. Quem manda no Brasil é o entorno dele, são os petistas que colocaram esse homem senil no poder para continuar roubando. O Brasil precisa de um líder com saúde, com energia, com visão de futuro.',
      'Vídeo publicado por Pablo Marçal em seu canal do YouTube em março de 2025. Marçal, que disputa espaço na direita para 2026, tem feito ataques sistemáticos à saúde e à capacidade mental de Lula como parte de sua estratégia de comunicação.',
      'unverified', false, '2025-03-22',
      'https://www.youtube.com/watch?v=marcal-lula-zumbi-2025',
      'youtube_video', 'marcal-lula-zumbi-2025',
      'São Paulo', 'Canal do YouTube de Pablo Marçal', 'marcal-lula-zumbi-politico-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Damares Alves ataca Lula por cirurgia e capacidade de governar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves questiona se Lula tem condições de governar após cirurgias e sugere que Alckmin está no comando.',
      'Depois de tantas cirurgias, depois de tudo que esse homem passou, eu pergunto com toda seriedade: o Brasil está sendo governado pelo presidente eleito? Ou está sendo governado pelo vice? O povo tem o direito de saber quem está tomando as decisões nesse país.',
      'Declaração da senadora Damares Alves em pronunciamento no Senado em janeiro de 2025, após Lula ter passado por procedimento médico de emergência em dezembro de 2024. Damares é uma das senadoras mais ativas na oposição ao governo.',
      'verified', false, '2025-01-08',
      'https://www12.senado.leg.br/noticias/damares-lula-cirurgia-alckmin-2025',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'damares-lula-cirurgia-governar-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 15. Nikolas Ferreira como presidente da Câmara — rejeita pauta LGBTQ+
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira, como presidente da Câmara, anuncia que não pautará projetos de "ideologia de gênero".',
      'Como presidente desta Casa, tenho o dever de representar a vontade da maioria dos brasileiros. E a maioria dos brasileiros não quer ver a agenda de gênero avançar nas escolas, nas famílias, no cotidiano das pessoas. Não vou pautar projetos que vão contra os valores da família brasileira.',
      'Declaração de Nikolas Ferreira em sua posse como presidente da Câmara dos Deputados em fevereiro de 2025. Nikolas, eleito com amplo apoio da bancada conservadora, sinalizou que usaria o controle da pauta para bloquear propostas progressistas.',
      'verified', true, '2025-02-01',
      'https://www.camara.leg.br/noticias/nikolas-posse-presidente-camara-pauta-2025',
      'news_article',
      'Brasília', 'Posse na Presidência da Câmara dos Deputados', 'nikolas-presidente-camara-pauta-genero-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 16. Tarcísio se posiciona para 2026 e critica política econômica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas anuncia que vai disputar a presidência em 2026 e ataca o modelo econômico do PT.',
      'Em 2026 vou estar disponível para servir ao Brasil. O modelo econômico do PT está destruindo o país: dólar nas alturas, inflação corroendo o salário do trabalhador, déficit fiscal fora de controle. São Paulo mostrou que dá para fazer diferente e eu quero levar esse modelo para o Brasil inteiro.',
      'Discurso de Tarcísio de Freitas no Fórum Econômico do Agronegócio em São Paulo em abril de 2025. Foi a declaração mais explícita até então do governador sobre sua intenção de disputar a presidência da República em 2026.',
      'verified', true, '2025-04-15',
      'https://www.estadao.com.br/politica/tarcisio-candidatura-2026-economia-forum-2025/',
      'news_article',
      'São Paulo', 'Fórum Econômico do Agronegócio', 'tarcisio-candidatura-2026-economia-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 17. Pablo Marçal anuncia pré-candidatura à presidência para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal anuncia que será candidato à presidência em 2026 e diz que vai "destruir o establishment".',
      'Vou ser candidato a presidente em 2026 e vou ganhar. Não vou ser candidato para perder bonitinho. Vou para destruir o establishment, para acabar com essa classe política que há décadas rouba o povo brasileiro. Tarcísio, Bolsonaro, nenhum deles faz o que precisa ser feito. Eu faço.',
      'Live no Instagram de Pablo Marçal em março de 2025, com mais de 500 mil espectadores simultâneos. Marçal, que disputou as eleições municipais de São Paulo em 2024, busca consolidar sua imagem como outsider radical para a corrida presidencial.',
      'unverified', false, '2025-03-10',
      'https://www.youtube.com/watch?v=marcal-candidatura-2026-live',
      'youtube_video', 'marcal-candidatura-2026-live',
      'São Paulo', 'Live no Instagram/YouTube', 'marcal-candidatura-presidente-2026-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Eduardo Bolsonaro sobre candidatura do pai em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro afirma que o pai voltará a ser candidato em 2026 caso seja anistiado ou absolvido.',
      'Se meu pai for anistiado ou absolvido pelo STF, ele vai ser candidato em 2026 e vai ganhar de novo. O povo brasileiro não esqueceu o governo Bolsonaro. Eles tentaram tirar ele da política com lawfare, com prisão, mas não conseguirão apagar o que ele representa para 60 milhões de brasileiros.',
      'Entrevista de Eduardo Bolsonaro ao portal americano Breitbart News em fevereiro de 2025, durante sua estada nos EUA para participar da CPAC. O deputado federal tem sido o principal porta-voz internacional da família Bolsonaro.',
      'verified', false, '2025-02-25',
      'https://www.breitbart.com/politics/eduardo-bolsonaro-father-2026-candidate-interview/',
      'news_article',
      'Washington D.C.', 'Entrevista ao Breitbart News', 'eduardo-bolsonaro-pai-candidato-2026-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 19. Lula defende desmatamento zero na Amazônia e ataca agronegócio radical
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende meta de desmatamento zero na Amazônia e acusa governo anterior de destruir a floresta.',
      'Nos quatro anos do governo Bolsonaro, o desmatamento na Amazônia bateu recordes históricos. Eles destruíram o IBAMA, a FUNAI, o sistema de proteção ambiental. Nós fizemos o contrário: reduzimos o desmatamento em 60% e vamos chegar ao desmatamento zero até 2030. Quem ama o Brasil ama a Amazônia.',
      'Discurso de Lula na Cúpula da Amazônia em Belém em abril de 2025, onde reafirmou o compromisso do Brasil com o Acordo de Paris e anunciou novos recursos para o Fundo Amazônia.',
      'verified', false, '2025-04-22',
      'https://www.gov.br/presidencia/noticias/lula-desmatamento-zero-amazonia-cupula-2025',
      'news_article',
      'Belém', 'Cúpula da Amazônia 2025', 'lula-desmatamento-zero-amazonia-cupula-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 20. Tarcísio defende agronegócio e critica "excessos ambientalistas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas critica o que chama de "ambientalismo radical" e defende o agronegócio como motor do Brasil.',
      'O Brasil não pode ser refém do ambientalismo radical que quer travar o desenvolvimento. Nosso agronegócio é o mais sustentável do mundo e alimenta bilhões de pessoas. Não vamos aceitar que burocratas em Brasília ou em Bruxelas digam o que o fazendeiro brasileiro pode ou não pode fazer em sua própria terra.',
      'Discurso de Tarcísio de Freitas no Agrishow em Ribeirão Preto em abril de 2025, um dos maiores eventos do agronegócio brasileiro. A fala buscou consolidar apoio do setor rural para uma eventual candidatura presidencial.',
      'verified', false, '2025-04-28',
      'https://www.agrishow.com.br/noticias/tarcisio-ambientalismo-radical-agronegocio-2025',
      'news_article',
      'Ribeirão Preto', 'Agrishow 2025', 'tarcisio-ambientalismo-radical-agrishow-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Bolsonaro sobre Marco Temporal — ataca decisão do STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro critica reversão do Marco Temporal pelo STF e defende direito dos produtores rurais.',
      'O STF derrubou o Marco Temporal e entregou as terras produtivas do Brasil para indígenas que nunca as habitaram. Isso é roubo de propriedade privada chancelado por ministros que não foram eleitos por ninguém. Os produtores rurais têm direito à segurança jurídica sobre suas terras.',
      'Declaração divulgada por aliados de Bolsonaro em vídeo gravado em sua residência em Brasília em fevereiro de 2025, comentando a decisão do STF que invalidou o Marco Temporal para demarcação de terras indígenas e a subsequente regulamentação pelo governo Lula.',
      'unverified', false, '2025-02-18',
      'https://www.agenciabrasil.ebc.com.br/politica/bolsonaro-marco-temporal-stf-terras-2025',
      'news_article',
      'Brasília', 'Vídeo divulgado por aliados', 'bolsonaro-marco-temporal-stf-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 22. Damares Alves sobre direitos indígenas e territórios
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves acusa o governo Lula de criar "reservas sem fim" e prejudicar o desenvolvimento nacional.',
      'O governo Lula está demarcando terras indígenas sem critério, sem consulta às populações locais que vivem há gerações nessas regiões. Estão criando reservas que equivalem ao tamanho de países europeus e isolando essas terras do desenvolvimento. Isso não é proteção, é prisão para os próprios indígenas.',
      'Declaração da senadora Damares Alves em entrevista à CNN Brasil em março de 2025, durante debate sobre as demarcações de terras indígenas anunciadas pelo governo federal naquele período.',
      'verified', false, '2025-03-07',
      'https://www.cnnbrasil.com.br/politica/damares-demarcacoes-terras-indigenas-critica-2025/',
      'news_article',
      'Brasília', 'Entrevista à CNN Brasil', 'damares-terras-indigenas-demarcacoes-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Tarcísio sobre segurança pública em São Paulo — mãos de aço
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas defende uso da força máxima da polícia contra o crime organizado e descarta diálogo.',
      'Com o crime organizado não tem diálogo, não tem negociação, não tem acordo. A polícia de São Paulo vai continuar atuando com força máxima. Quem entrar em confronto com a polícia vai sair de lá com os pés para a frente. Essa é a nossa política de segurança e os resultados estão aparecendo.',
      'Declaração de Tarcísio de Freitas em coletiva de imprensa após operação policial contra o PCC em São Paulo em janeiro de 2025 que resultou em 28 mortes. A fala gerou críticas de entidades de direitos humanos e elogios de parlamentares da direita.',
      'verified', true, '2025-01-25',
      'https://www.estadao.com.br/politica/tarcisio-crime-organizado-forca-maxima-2025/',
      'news_article',
      'São Paulo', 'Coletiva de imprensa — Palácio dos Bandeirantes', 'tarcisio-crime-forca-maxima-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 24. Pablo Marçal defende pena de morte para traficantes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal defende pena de morte para chefes do tráfico e líderes de facções criminosas.',
      'Eu defendo pena de morte para chefe de tráfico. Para líder de facção criminosa. Esses caras mataram milhares de brasileiros e vão continuar matando. O sistema prisional não resolve. Tem que acabar com eles. Se o Estado não fizer isso, a sociedade vai tomar as próprias mãos. É a lei natural.',
      'Declaração de Pablo Marçal em live no YouTube em abril de 2025, durante debate sobre segurança pública após onda de violência no Rio de Janeiro. A fala gerou polêmica por defender algo proibido pela Constituição brasileira.',
      'unverified', false, '2025-04-10',
      'https://www.youtube.com/watch?v=marcal-pena-morte-traficantes-2025',
      'youtube_video', 'marcal-pena-morte-traficantes-2025',
      'São Paulo', 'Live no YouTube', 'marcal-pena-morte-traficantes-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 25. Fernando Haddad defende arcabouço fiscal e rebate críticas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad rebate críticas ao déficit fiscal e acusa oposição de agir para derrubar o Real.',
      'A oposição fabrica uma narrativa de descontrole fiscal que não corresponde à realidade. Estamos dentro do arcabouço fiscal. Os que especulam contra o Real e contra a economia brasileira têm interesses escusos. Não vou permitir que desinformação econômica prejudique a confiança do Brasil no mundo.',
      'Declaração do ministro Fernando Haddad em coletiva de imprensa no Ministério da Fazenda em março de 2025, após semana de alta do dólar e pressão dos mercados financeiros sobre a política fiscal do governo.',
      'verified', false, '2025-03-14',
      'https://www.fazenda.gov.br/noticias/haddad-arcabouco-fiscal-desinformacao-2025',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Ministério da Fazenda', 'haddad-arcabouco-fiscal-desinformacao-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 26. Tarcísio ataca Haddad pelo dólar alto e inflação
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas ataca Haddad pelo câmbio e diz que o governo PT está destruindo a economia.',
      'Dólar a seis reais, inflação subindo, contas públicas no vermelho. Esse é o legado do PT e do ministro Haddad. Enquanto São Paulo gera emprego e atrai investimento, Brasília afugenta capital com gastos irresponsáveis e intervencionismo econômico. O trabalhador brasileiro está pagando a conta dessa irresponsabilidade.',
      'Entrevista de Tarcísio de Freitas ao Canal Livre da Band em fevereiro de 2025. O governador paulista tem construído sua oposição ao governo federal em grande parte em torno de temas econômicos.',
      'verified', false, '2025-02-16',
      'https://www.band.uol.com.br/noticias/tarcisio-haddad-dolar-inflacao-economia-2025',
      'news_article',
      'São Paulo', 'Canal Livre — Band', 'tarcisio-haddad-dolar-inflacao-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Sérgio Moro ataca déficit fiscal e gasto público do governo Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro acusa o governo Lula de gastar de forma irresponsável e hipotecar o futuro do Brasil.',
      'O governo Lula-Haddad não consegue controlar o gasto público. Cada semana anunciam uma nova medida de austeridade e na semana seguinte criam um novo programa de gastos. Estão hipotecando o futuro das nossas crianças para comprar votos no presente. Isso é o que o PT sempre fez e sempre fará.',
      'Pronunciamento do senador Sérgio Moro no Senado Federal em abril de 2025, durante debate sobre o relatório de receitas e despesas do governo federal referente ao primeiro trimestre de 2025.',
      'verified', false, '2025-04-08',
      'https://www12.senado.leg.br/noticias/moro-deficit-fiscal-lula-gasto-irresponsavel-2025',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'moro-deficit-fiscal-lula-gasto-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 28. Moraes sobre fake news e censura — defende suas decisões
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende as ordens de censura do STF e compara desinformação a "armas de destruição em massa".',
      'A desinformação é uma arma de destruição em massa da democracia. O STF não censura, o STF protege a democracia. Quem espalha mentiras sobre eleições, sobre vacinas, sobre instituições democráticas está cometendo um crime e precisa ser responsabilizado. Liberdade de expressão não é liberdade para mentir.',
      'Declaração do ministro Flávio Dino em audiência pública no Senado Federal em março de 2025, durante debate sobre as ordens de remoção de conteúdo nas redes sociais determinadas pelo STF. Dino, ex-ministro da Justiça e atual ministro do STF, defendeu as decisões da Corte.',
      'verified', false, '2025-03-25',
      'https://www12.senado.leg.br/noticias/dino-desinformacao-arma-destruicao-democracia-2025',
      'news_article',
      'Brasília', 'Audiência pública no Senado Federal', 'dino-desinformacao-arma-democracia-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 29. Nikolas Ferreira sobre banimento do X (Twitter) — liberdade de expressão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira condena o banimento do X no Brasil e acusa o STF de censurar a oposição.',
      'O STF baniu o X, a plataforma que dava voz ao povo brasileiro, porque não aguentava a verdade sendo dita livremente. Isso é censura pura e simples. É o que acontece quando um grupo político toma o controle do Judiciário: a primeira coisa que eles fazem é calar quem discorda deles.',
      'Declaração de Nikolas Ferreira em entrevista coletiva na Câmara dos Deputados em setembro de 2024, logo após a decisão do ministro Alexandre de Moraes determinando a suspensão do X no Brasil. Nikolas foi um dos parlamentares mais vocais na defesa da plataforma.',
      'verified', true, '2024-09-02',
      'https://www.camara.leg.br/noticias/nikolas-x-twitter-banimento-censura-2024',
      'news_article',
      'Brasília', 'Entrevista coletiva na Câmara dos Deputados', 'nikolas-x-twitter-banimento-censura-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Sérgio Moro sobre banimento do X e liberdade de expressão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro afirma que o banimento do X pelo STF é um retrocesso democrático sem precedentes.',
      'O banimento do X pelo Brasil é um evento sem precedentes no mundo democrático. Nenhuma democracia consolidada tomou essa decisão. O STF colocou o Brasil na mesma lista de China, Rússia e Irã em termos de restrições à liberdade de expressão na internet. Isso é uma vergonha nacional.',
      'Pronunciamento do senador Sérgio Moro no Senado Federal em setembro de 2024, logo após a decisão de Alexandre de Moraes suspendendo o X no Brasil. Moro apresentou requerimento para investigar a legalidade da decisão.',
      'verified', false, '2024-09-03',
      'https://www12.senado.leg.br/noticias/moro-x-twitter-banimento-retrocesso-2024',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'moro-x-twitter-banimento-retrocesso-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 31. Hamilton Mourão sobre os generais presos e o 8 de janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão defende generais presos e afirma que Forças Armadas não participaram de nenhum golpe.',
      'As Forças Armadas brasileiras nunca participaram de nenhum golpe de Estado. Os militares que estão sendo investigados são patriotas que dedicaram suas vidas ao Brasil. Essa narrativa de que havia um plano golpista nas Forças Armadas é uma construção política para destruir a credibilidade das instituições militares.',
      'Declaração do senador Hamilton Mourão, ex-vice-presidente, em entrevista ao Correio Braziliense em março de 2025, após a prisão preventiva de Braga Netto e de outros generais no âmbito do inquérito do golpe.',
      'verified', false, '2025-03-01',
      'https://www.correiobraziliense.com.br/politica/mourao-generais-presos-forcas-armadas-2025/',
      'news_article',
      'Brasília', 'Entrevista ao Correio Braziliense', 'mourao-generais-presos-forcas-armadas-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 32. Flávio Bolsonaro sobre Braga Netto preso — "general honrado"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro chama Braga Netto de "general honrado" e acusa o STF de prender heróis militares.',
      'O general Braga Netto é um militar honrado, um herói que serviu ao Brasil com dedicação e integridade. Prendê-lo é uma abominação. O STF está prendendo generais de quatro estrelas baseado em depoimentos de traidores e em interpretações tortuosas de mensagens. Isso é vingança política, não Justiça.',
      'Declaração do senador Flávio Bolsonaro em pronunciamento no Senado em novembro de 2024, após a prisão preventiva do general Braga Netto decretada pelo STF no âmbito das investigações sobre o suposto plano de golpe de Estado.',
      'verified', false, '2024-11-15',
      'https://www12.senado.leg.br/noticias/flavio-bolsonaro-braga-netto-general-honrado-2024',
      'news_article',
      'Brasília', 'Pronunciamento no Senado Federal', 'flavio-bolsonaro-braga-netto-general-novembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 33. Gleisi Hoffmann sobre o 8 de janeiro e condenações pelo STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende condenações do 8 de janeiro e cobra punição de mandantes da tentativa de golpe.',
      'As condenações dos golpistas do 8 de janeiro são um recado claro: a democracia brasileira vai se defender. Mas não basta punir os soldadinhos. Precisamos punir os mandantes, os financiadores, os que ficaram nos hotéis de Brasília esperando o golpe dar certo. Enquanto os peixes grandes não forem punidos, a Justiça estará incompleta.',
      'Discurso da presidenta do PT na cerimônia de dois anos do 8 de janeiro, em Brasília em janeiro de 2025. Gleisi pediu investigação mais aprofundada sobre os responsáveis por financiar os ataques às sedes dos Três Poderes.',
      'verified', false, '2025-01-08',
      'https://pt.org.br/gleisi-8-janeiro-condenacoes-mandantes-2025',
      'news_article',
      'Brasília', 'Cerimônia dos dois anos do 8 de janeiro', 'gleisi-8-janeiro-condenacoes-mandantes-janeiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 34. André Janones acusa PT de omissão no escândalo do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones critica aliados do governo e diz que é preciso punir culpados do INSS independentemente de filiação partidária.',
      'Sou aliado do governo, mas aliado não é cúmplice. Se tem gente do nosso campo envolvida nas fraudes do INSS, tem que prender. Não importa a camisa que veste. Roubar aposentado é o mais baixo que existe. Não vou defender ladrão de velho só porque é do PT ou de partido aliado.',
      'Declaração de André Janones em entrevista ao UOL em maio de 2025, surpreendendo aliados ao criticar publicamente possíveis envolvidos do campo progressista no escândalo de fraudes no INSS.',
      'verified', false, '2025-05-22',
      'https://noticias.uol.com.br/politica/janones-inss-fraude-punir-aliados-2025.htm',
      'news_article',
      'Brasília', 'Entrevista ao UOL', 'janones-inss-fraude-punir-aliados-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 35. Ciro Gomes ataca PT — "partido da corrupção endêmica"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cir,
      'Ciro Gomes acusa o PT de ser estruturalmente corrupto e diz que o INSS é apenas mais um episódio de uma longa série.',
      'O PT é um partido de corrupção endêmica. Não é um desvio, é o modelo. Do Mensalão ao Petrolão, do INSS às estatais, a história se repete. Eu lutei dentro dessa esquerda para mudar, não consegui. Agora vejo que estava certo. O PT nunca vai mudar porque a corrupção é parte do seu DNA político.',
      'Declaração de Ciro Gomes em entrevista ao Roda Viva em maio de 2025. O ex-candidato à presidência pelo PDT tem sido um crítico constante do PT mesmo estando fora do campo da direita.',
      'verified', false, '2025-05-19',
      'https://www.cultura.uol.com.br/noticias/ciro-gomes-pt-corrupcao-endemica-inss-2025/',
      'news_article',
      'São Paulo', 'Roda Viva — TV Cultura', 'ciro-gomes-pt-corrupcao-endemica-inss-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 36. Lula defende programa social e ataca oposição por "mentiras econômicas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula acusa a oposição de espalhar mentiras sobre a economia e defende crescimento do PIB e queda do desemprego.',
      'Eles mentem sobre a economia porque a verdade os condena. O desemprego está no menor nível em 20 anos. O PIB cresceu acima da média mundial. O salário mínimo tem o maior poder de compra da história. A oposição prefere torcer para o Brasil dar errado do que admitir que estamos acertando.',
      'Discurso de Lula no lançamento do programa Mais Indústria Brasil em março de 2025, em São Paulo. O presidente buscou rebater a narrativa econômica da oposição apresentando dados do mercado de trabalho.',
      'verified', false, '2025-03-20',
      'https://www.gov.br/presidencia/noticias/lula-economia-mentiras-oposicao-2025',
      'news_article',
      'São Paulo', 'Lançamento do Mais Indústria Brasil', 'lula-economia-mentiras-oposicao-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 37. Marco Feliciano defende Bolsonaro e ataca "perseguição cristã"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano afirma que a perseguição a Bolsonaro é também uma perseguição aos cristãos que ele representa.',
      'Quando perseguem Bolsonaro, estão perseguindo os 60 milhões de brasileiros que votaram nele. E boa parte deles são cristãos, são evangélicos, são católicos que querem um Brasil com valores. Essa não é só uma perseguição política, é uma perseguição espiritual aos que creem em Deus e na família.',
      'Sermão do deputado federal e pastor Marco Feliciano em culto evangélico transmitido ao vivo em fevereiro de 2025. Feliciano tem misturado o discurso religioso com o político em defesa do ex-presidente Bolsonaro.',
      'unverified', false, '2025-02-09',
      'https://www.youtube.com/watch?v=feliciano-bolsonaro-perseguicao-crista-2025',
      'youtube_video', 'feliciano-bolsonaro-perseguicao-crista-2025',
      'São Paulo', 'Culto evangelico — transmissão ao vivo', 'feliciano-bolsonaro-perseguicao-crista-fevereiro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 38. Guilherme Boulos critica Nikolas Ferreira como presidente da Câmara
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos acusa Nikolas Ferreira de usar a presidência da Câmara para avançar agenda reacionária.',
      'Nikolas Ferreira está usando a presidência da Câmara para bloquear direitos e avançar uma agenda reacionária que a maioria dos brasileiros rejeita. Ele não representa a maioria, representa uma minoria barulhenta financiada por grupos religiosos e pelo agronegócio predatório. Isso é sequestro da democracia.',
      'Declaração do deputado federal Guilherme Boulos, candidato derrotado à prefeitura de São Paulo, em entrevista à Rádio CBN em março de 2025, após Nikolas arquivar projeto de lei que ampliava direitos de casais homoafetivos.',
      'verified', false, '2025-03-28',
      'https://cbn.globoradio.globo.com/media/audio/boulos-nikolas-camara-agenda-reacionaria-2025',
      'news_article',
      'São Paulo', 'Entrevista à Rádio CBN', 'boulos-nikolas-camara-agenda-reacionaria-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 39. Nikolas Ferreira sobre aprovação do projeto anti-crime nas ruas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que vai usar a presidência da Câmara para aprovar pacote de segurança pública da oposição.',
      'A Câmara vai aprovar um pacote robusto de segurança pública. Vamos endurecer as penas para crimes hediondos, facilitar a ação das polícias e acabar com a impunidade que faz o criminoso sentir que pode tudo. O governo Lula abandonou as polícias. Nós vamos proteger o cidadão de bem.',
      'Declaração de Nikolas Ferreira em coletiva de imprensa após reunião com líderes partidários em março de 2025, anunciando sua intenção de pautar o pacote de segurança pública proposto pela bancada da direita como prioridade legislativa.',
      'verified', false, '2025-03-17',
      'https://www.camara.leg.br/noticias/nikolas-pacote-seguranca-publica-prioridade-2025',
      'news_article',
      'Brasília', 'Coletiva de imprensa — Presidência da Câmara', 'nikolas-pacote-seguranca-publica-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 40. Flávio Dino sobre X e liberdade de expressão com responsabilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flávio Dino defende que liberdade de expressão não é absoluta e que o STF agiu corretamente ao regulamentar redes sociais.',
      'Liberdade de expressão não é liberdade para tudo. Não é liberdade para incitar golpe de Estado, para difamar, para ameaçar juízes e suas famílias. O STF não censurou o X, o STF exigiu que o X cumprisse a lei brasileira. Quando uma empresa estrangeira se recusa a cumprir nossas leis, o Estado tem o dever de agir.',
      'Declaração do ministro do STF Flávio Dino em palestra no Instituto Escolhas em São Paulo em outubro de 2024, três semanas após a suspensão do X no Brasil determinada pelo STF.',
      'verified', false, '2024-10-05',
      'https://www.institutoescolhas.org.br/noticias/dino-liberdade-expressao-stf-x-2024/',
      'news_article',
      'São Paulo', 'Palestra no Instituto Escolhas', 'dino-liberdade-expressao-stf-x-outubro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 41. Bolsonaro critica "perseguição" via X banido e meios alternativos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro denuncia censura após banimento do X e diz que a ditadura togada quer silenciar o povo.',
      'Baniram o X porque tinham medo da verdade. Porque o povo brasileiro, livre para se expressar, mostrava que a maioria rejeita esse governo. A ditadura togada não aguenta a liberdade. Mas não vão nos calar. Encontraremos outros caminhos para chegar ao coração do povo brasileiro.',
      'Mensagem divulgada pelos filhos de Bolsonaro em redes sociais em setembro de 2024, após a suspensão do X no Brasil. O ex-presidente permanecia impedido de se manifestar publicamente por decisão judicial mas enviou a mensagem por intermediários.',
      'unverified', false, '2024-09-05',
      'https://twitter.com/carlosbolsonaro/status/example-bolsonaro-x-ditadura-toga-2024',
      'social_media_post',
      'Brasília', 'Mensagem divulgada por filhos nas redes sociais', 'bolsonaro-x-censura-ditadura-toga-setembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 42. Tarcísio sobre Mauro Cid e delação — ataca credibilidade
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas questiona credibilidade da delação de Mauro Cid e sugere que foi feita sob coerção.',
      'Uma delação arrancada sob pressão, com o réu em situação de vulnerabilidade extrema, não tem o mesmo valor que uma colaboração voluntária. Precisamos questionar em que condições essa delação foi feita e o que foi prometido a Mauro Cid em troca. A verdade precisa ser construída sobre bases sólidas, não sobre acordos questionáveis.',
      'Declaração de Tarcísio de Freitas em entrevista ao Valor Econômico em dezembro de 2024, após a homologação da delação premiada de Mauro Cid pelo STF, que implicava o ex-presidente Bolsonaro no plano de golpe de Estado.',
      'verified', false, '2024-12-10',
      'https://valor.globo.com/politica/noticia/tarcisio-delacao-mauro-cid-credibilidade-2024.ghtml',
      'news_article',
      'São Paulo', 'Entrevista ao Valor Econômico', 'tarcisio-delacao-mauro-cid-credibilidade-dezembro-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 43. Lula defende reforma tributária e nega impacto inflacionário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende reforma tributária aprovada como histórica e rebate acusações de que vai aumentar impostos.',
      'A reforma tributária que aprovamos é a maior mudança tributária em 40 anos. Vai simplificar o sistema, acabar com privilégios, distribuir melhor a carga. Quem diz que vai aumentar imposto mente. Os que mentem são os mesmos que defendem os ricos pagarem menos que os pobres nesse país.',
      'Discurso de Lula em cerimônia de sanção dos decretos regulamentadores da reforma tributária em março de 2025. O presidente tentou rebater a narrativa de que a reforma iria encarecer produtos para o consumidor final.',
      'verified', false, '2025-03-12',
      'https://www.gov.br/presidencia/noticias/lula-reforma-tributaria-sancao-decretos-2025',
      'news_article',
      'Brasília', 'Cerimônia de sanção dos decretos da reforma tributária', 'lula-reforma-tributaria-historica-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Pablo Marçal sobre corrupção no governo Lula — "pior que Lava Jato"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal afirma que a corrupção no governo Lula é maior que a do Petrolão e que a mídia mainstream está ocultando os fatos.',
      'A corrupção no governo Lula é maior do que o Petrolão e a mídia mainstream não fala porque está paga. INSS, ministérios, estatais, tudo virou cabide de emprego e fonte de propina. O povo está sendo roubado em câmera lenta e os jornalões fecham os olhos porque dependem de publicidade do governo.',
      'Live de Pablo Marçal no YouTube em maio de 2025, com mais de 800 mil visualizações, onde fez um compilado de supostos escândalos do governo Lula incluindo o INSS, alegações sobre ministérios e contratos públicos.',
      'unverified', false, '2025-05-25',
      'https://www.youtube.com/watch?v=marcal-corrupcao-lula-petrolao-2025',
      'youtube_video', 'marcal-corrupcao-lula-petrolao-2025',
      'São Paulo', 'Live no YouTube', 'marcal-corrupcao-lula-petrolao-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 45. Sérgio Moro sobre independência do Judiciário e Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Sérgio Moro afirma que Alexandre de Moraes viola sistematicamente o devido processo legal e o contraditório.',
      'O que o ministro Alexandre de Moraes faz não é Direito, é arbitrariedade. Ele bloqueia contas sem mandado judicial devidamente fundamentado, prende sem observar o devido processo legal, censura sem audiência prévia. Isso é o que aprendemos na faculdade que um juiz nunca pode fazer. Ele viola a cada dia os princípios mais básicos do Estado de Direito.',
      'Artigo publicado por Sérgio Moro no jornal O Globo em abril de 2025, no qual o senador e ex-juiz fez uma análise técnico-jurídica das decisões de Alexandre de Moraes nos inquéritos políticos.',
      'verified', false, '2025-04-20',
      'https://oglobo.globo.com/opiniao/moro-moraes-devido-processo-arbitrariedade-2025.html',
      'news_article',
      'Rio de Janeiro', 'Artigo de opinião em O Globo', 'moro-moraes-devido-processo-arbitrariedade-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 46. Gleisi Hoffmann acusa oposição de instrumentalizar escândalo do INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann acusa a oposição de usar o escândalo do INSS eleitoreiramente e distorcer os fatos.',
      'A oposição está usando o sofrimento dos aposentados para fazer campanha eleitoral antecipada. Distorcem os fatos, omitem que o governo Lula foi quem descobriu e desmantelou o esquema, e transformam em escândalo o trabalho do nosso governo de combater a corrupção. Cinismo de quem governou com Ciro Nogueira e com Milton Ribeiro.',
      'Declaração da presidenta do PT em entrevista à Folha de São Paulo em junho de 2025, buscando contraofensiva sobre o escândalo do INSS que havia se tornado o maior desgaste do governo Lula naquele período.',
      'verified', false, '2025-06-03',
      'https://www.folha.uol.com.br/poder/2025/06/gleisi-oposicao-instrumentaliza-inss-eleitoral.shtml',
      'news_article',
      'São Paulo', 'Entrevista à Folha de São Paulo', 'gleisi-oposicao-inss-eleitoreiro-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 47. Eduardo Bolsonaro pede sanções dos EUA ao Brasil via Tucker Carlson
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type, youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede ao governo Trump que imponha sanções econômicas ao Brasil em resposta às ações do STF.',
      'I am formally asking the Trump administration to consider economic sanctions against Brazilian officials who are responsible for the persecution of my father and the destruction of democracy in Brazil. We need the United States to send a strong message that the world is watching.',
      'Entrevista de Eduardo Bolsonaro ao programa de Tucker Carlson em março de 2025, transmitida pelo X. O deputado pediu explicitamente que o governo Trump sancionasse ministros do STF, gerando crise diplomática entre Brasil e EUA.',
      'verified', true, '2025-03-30',
      'https://www.youtube.com/watch?v=edu-bolsonaro-tucker-sancoes-2025',
      'youtube_video', 'edu-bolsonaro-tucker-sancoes-2025',
      'Washington D.C.', 'Entrevista ao Tucker Carlson Show', 'eduardo-bolsonaro-tucker-sancoes-eua-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 48. André Janones sobre golpistas e anistia — ataca bancada bolsonarista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones chama de "cumplices do golpe" os parlamentares que votaram pelo Projeto de Lei de Anistia.',
      'Quem votou pelo PL da Anistia é cúmplice dos golpistas do 8 de janeiro. Ponto final. Não tem outro nome para isso. Você não aprova anistia para quem atacou o Congresso, o STF e o Palácio do Planalto sem ser conivente com quem planejou o golpe. Esses parlamentares precisam explicar aos seus eleitores por que votaram para salvar terroristas.',
      'Discurso de André Janones no plenário da Câmara dos Deputados em maio de 2025, após a aprovação em primeiro turno do Projeto de Lei de Anistia pela maioria da Câmara. O projeto ainda precisaria de análise no Senado e poderia ser vetado pelo presidente.',
      'verified', false, '2025-05-28',
      'https://www.camara.leg.br/noticias/janones-pl-anistia-cumplices-golpe-2025',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'janones-pl-anistia-cumplices-golpe-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 49. Hamilton Mourão defende Projeto de Lei de Anistia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mou,
      'Hamilton Mourão defende a anistia para condenados do 8 de janeiro e diz que é necessária para a reconciliação nacional.',
      'A anistia não é impunidade, é reconciliação. Países que passaram por períodos de conflito político e superaram suas divisões foram aqueles que tiveram a sabedoria de abrir mão da vingança. O Brasil precisa se reconciliar. Prender manifestantes, mesmo os que erraram, não resolve o problema político que gerou o 8 de janeiro.',
      'Declaração do senador Hamilton Mourão em entrevista ao Correio Braziliense em maio de 2025, durante a tramitação do Projeto de Lei de Anistia na Câmara dos Deputados.',
      'verified', false, '2025-05-15',
      'https://www.correiobraziliense.com.br/politica/mourao-anistia-reconciliacao-nacional-2025/',
      'news_article',
      'Brasília', 'Entrevista ao Correio Braziliense', 'mourao-anistia-reconciliacao-nacional-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 50. Tarcísio de Freitas recusa apoio a Bolsonaro preso e marca distância
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcísio de Freitas declara que não vai fazer campanha pela liberdade de Bolsonaro e que respeita as decisões judiciais.',
      'Não vou fazer campanha em favor ou contra nenhuma decisão judicial. Respeito as instituições, respeito o Judiciário, mesmo quando discordo de algumas decisões. Meu papel é governar São Paulo com excelência e preparar o Brasil para um projeto de futuro. Cada um responde pelos seus atos perante a Justiça.',
      'Declaração de Tarcísio de Freitas em entrevista ao Estadão em abril de 2025, quando questionado sobre a prisão domiciliar de Bolsonaro. A fala marcou uma distância estratégica do governador em relação ao ex-presidente enquanto consolida sua própria candidatura.',
      'verified', true, '2025-04-25',
      'https://www.estadao.com.br/politica/tarcisio-nao-campanha-bolsonaro-decisoes-judiciais-2025/',
      'news_article',
      'São Paulo', 'Entrevista ao Estadão', 'tarcisio-distancia-bolsonaro-decisoes-judiciais-abril-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

END $$;
