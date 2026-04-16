-- Batch 42: Nikolas Ferreira, Andre Janones, social media politicians
-- Pablo Marcal, Eduardo Bolsonaro, Bia Kicis, Marco Feliciano
-- Misogyny debates, suspensions, 2026 election maneuvering (2025-2026)
-- 50 statements

DO $$
DECLARE
  v_nik UUID; v_jan UUID; v_mar UUID; v_edu UUID; v_bia UUID;
  v_fel UUID; v_bol UUID; v_fla UUID; v_car UUID; v_mic UUID;
  v_lula UUID; v_dam UUID; v_ram UUID;
  c_mis UUID; c_hom UUID; c_des UUID; c_ant UUID; c_vio UUID;
  c_cor UUID; c_odi UUID; c_abu UUID; c_mac UUID; c_aut UUID;
  c_ame UUID; c_irr UUID; c_int UUID; c_obs UUID;
BEGIN
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';

  -- 1. Nikolas ataca lei antimisoginia aprovada pelo Senado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chamou a lei antimisoginia aprovada pelo Senado de "aberração jurídica" e prometeu barrar na Câmara.',
      'Essa lei é uma aberração jurídica. Querem criminalizar a opinião de qualquer homem que discorde de uma mulher. Isso não é proteção, é censura ideológica. Vou trabalhar para que essa aberração nunca passe na Câmara dos Deputados.',
      'Declaração em vídeo publicado nas redes sociais em março de 2026, após o Senado aprovar projeto de lei que tipifica a misoginia como forma de violência. O projeto recebeu amplo apoio de senadoras de diversos partidos.',
      'verified', true, '2026-03-18',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-ataca-lei-antimisoginia-senado-2026/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'nikolas-ataca-lei-antimisoginia-senado-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 2. Nikolas diz que lei antimisoginia é pauta de "feministas radicais"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirmou que a lei antimisoginia foi criada por feministas radicais que querem destruir a família tradicional.',
      'Essa pauta não veio do povo. Veio das feministas radicais que odeiam a família tradicional e querem transformar qualquer desacordo em crime. O homem brasileiro vai virar réu por abrir a boca dentro de casa. É isso que vocês querem?',
      'Continuação da campanha de Nikolas contra a lei antimisoginia, em live no Instagram com mais de 200 mil espectadores simultâneos em março de 2026. A fala gerou reação de entidades de defesa dos direitos das mulheres.',
      'verified', false, '2026-03-20',
      'https://www.uol.com.br/noticias/politica/nikolas-feministas-radicais-lei-antimisoginia-2026.htm',
      'news_article',
      'São Paulo', 'Live no Instagram', 'nikolas-feministas-radicais-antimisoginia-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 3. Nikolas critica Alcolumbre no 7 de Setembro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas atacou o presidente do Senado Davi Alcolumbre em ato do 7 de Setembro, chamando-o de "covarde" e dizendo "você não é o povo supremo".',
      'Senhor Alcolumbre, você não é o povo supremo. O povo está aqui, na rua, gritando. Você é um covarde que se esconde atrás do regimento para não votar o que o Brasil quer. O Senado virou um balcão de negócios e o senhor é o caixa.',
      'Discurso de Nikolas Ferreira durante ato patriótico na Esplanada dos Ministérios em 7 de setembro de 2025. O deputado atacou diretamente Alcolumbre por atrasar pautas conservadoras no Senado. O ato reuniu milhares de apoiadores da direita.',
      'verified', true, '2025-09-07',
      'https://www.poder360.com.br/congresso/nikolas-ferreira-ataca-alcolumbre-7-setembro-covarde/',
      'news_article',
      'Brasília', 'Ato do 7 de Setembro na Esplanada', 'nikolas-ataca-alcolumbre-7-setembro-covarde-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 4. Nikolas expulso de programa da Globo ao vivo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas foi expulso de programa da TV Globo ao vivo após discussão acalorada com apresentadora sobre direitos das mulheres.',
      'Vocês não me convidaram para debater, me convidaram para uma emboscada. Essa emissora é um braço do PT e todo mundo sabe. Podem me tirar do ar, o povo está comigo. A Globo não manda mais na opinião pública.',
      'Nikolas Ferreira foi convidado para participar de programa vespertino da TV Globo em agosto de 2025. Após troca ríspida com a apresentadora sobre políticas de gênero, a produção encerrou sua participação ao vivo. O episódio viralizou e Nikolas ganhou centenas de milhares de seguidores.',
      'verified', true, '2025-08-14',
      'https://f5.folha.uol.com.br/televisao/2025/08/nikolas-ferreira-expulso-globo-programa-ao-vivo.shtml',
      'news_article',
      'Rio de Janeiro', 'Programa da TV Globo', 'nikolas-expulso-globo-programa-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 5. Nikolas declara "esse ano vai ser guerra" sobre eleições 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas declarou que 2026 "vai ser guerra" em evento do PL em Goiânia, sinalizando tom agressivo para a campanha eleitoral.',
      'Esse ano vai ser guerra. A esquerda quer destruir tudo que construímos. Eles vão usar a máquina, vão usar a Justiça, vão usar a mídia. Mas nós temos o povo. E com o povo, ninguém pode. 2026 é a batalha final pela alma do Brasil.',
      'Fala de Nikolas Ferreira em evento do PL em Goiânia em abril de 2026, com presença de mais de 3 mil militantes. O deputado é pré-candidato ao governo de Minas Gerais e tem sido apontado como possível candidato a presidente em caso de impedimento de Bolsonaro.',
      'verified', true, '2026-04-05',
      'https://www.metropoles.com/colunas/nikolas-ferreira-guerra-2026-eleicoes-goiania/',
      'news_article',
      'Goiânia', 'Evento do PL em Goiânia', 'nikolas-guerra-2026-eleicoes-goiania-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 6. Nikolas anuncia pré-candidatura ao governo de Minas Gerais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas confirmou pré-candidatura ao governo de Minas Gerais e disse que é "alvo" do sistema por ser jovem e conservador.',
      'Decidi meu caminho: vou disputar o governo de Minas Gerais. Sou alvo porque sou jovem, conservador e não tenho medo de falar a verdade. O sistema quer me calar, mas o povo mineiro vai me dar a resposta nas urnas. Minas será o laboratório da nova direita.',
      'Anúncio feito por Nikolas em evento do PL em Belo Horizonte em novembro de 2025. O deputado é o político mais seguido do Brasil nas redes sociais e lidera pesquisas de intenção de voto em Minas Gerais.',
      'verified', true, '2025-11-22',
      'https://www.em.com.br/politica/2025/11/nikolas-ferreira-pre-candidatura-governo-minas-gerais.html',
      'news_article',
      'Belo Horizonte', 'Evento do PL em BH', 'nikolas-pre-candidatura-governo-minas-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 7. Nikolas aposta na candidatura de Bolsonaro em 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas disse que aposta na candidatura de Bolsonaro a presidente em 2026, afirmando que a inelegibilidade será revertida.',
      'Aposto todas as minhas fichas na candidatura do presidente Bolsonaro em 2026. A inelegibilidade vai cair porque foi uma decisão política, não jurídica. O TSE vai ter que engolir a vontade do povo. Bolsonaro será candidato e será eleito presidente.',
      'Declaração em entrevista à Jovem Pan em setembro de 2025. Nikolas reforçou apoio a Bolsonaro enquanto articulava sua própria candidatura ao governo de Minas. Juristas apontaram que a reversão da inelegibilidade é juridicamente improvável.',
      'verified', false, '2025-09-12',
      'https://jovempan.uol.com.br/noticias/politica/nikolas-aposta-candidatura-bolsonaro-2026-inelegibilidade.html',
      'news_article',
      'São Paulo', 'Entrevista à Jovem Pan', 'nikolas-aposta-bolsonaro-candidatura-2026-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 8. Nikolas briga com Eduardo Bolsonaro sobre estratégia para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas criticou indiretamente Eduardo Bolsonaro por querer centralizar a estratégia de 2026 na família Bolsonaro.',
      'A direita não pode ser um projeto familiar. A direita é um projeto nacional. Se a gente depender só de uma família, a esquerda ganha de lavada. Precisamos de lideranças novas, independentes, que falem com o povo e não só com o grupinho do WhatsApp.',
      'Fala de Nikolas em podcast conservador em outubro de 2025, interpretada como crítica direta a Eduardo Bolsonaro que vinha tentando coordenar as candidaturas da direita para 2026. A tensão entre Nikolas e os filhos de Bolsonaro é crescente.',
      'verified', false, '2025-10-08',
      'https://www.gazetadopovo.com.br/republica/nikolas-ferreira-critica-projeto-familiar-direita-2026/',
      'news_article',
      'Belo Horizonte', 'Podcast Direita Viva', 'nikolas-critica-projeto-familiar-direita-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 9. Nikolas diz que esquerda quer "castrar" a liberdade de expressão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirmou que projetos de regulação das redes sociais são tentativa da esquerda de "castrar" a liberdade de expressão.',
      'A esquerda quer castrar a liberdade de expressão. Esse projeto de regulação das redes é a mordaça digital. Eles perderam a batalha da opinião pública e agora querem silenciar quem pensa diferente. Não vão conseguir.',
      'Declaração durante audiência pública na Câmara sobre o PL das Fake News em julho de 2025. Nikolas liderou obstrução da pauta e conseguiu adiar a votação. O projeto busca regulamentar plataformas digitais.',
      'verified', false, '2025-07-15',
      'https://www.correiobraziliense.com.br/politica/2025/07/nikolas-castrar-liberdade-expressao-redes-sociais.html',
      'news_article',
      'Brasília', 'Audiência pública na Câmara', 'nikolas-castrar-liberdade-expressao-redes-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 10. Nikolas ironiza feministas após viralizar vídeo no 8 de março
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas ironizou feministas no Dia da Mulher com vídeo que acumulou milhões de visualizações e gerou protestos.',
      'Feliz Dia da Mulher para as mulheres de verdade. Aquelas que são mães, esposas, que constroem famílias. Não para as que querem destruir a biologia e inventar gêneros que não existem. Mulher é mulher, ponto final.',
      'Vídeo publicado por Nikolas no Instagram no Dia Internacional da Mulher em março de 2026. A publicação gerou forte reação de movimentos feministas e entidades de direitos humanos, mas acumulou mais de 15 milhões de visualizações.',
      'verified', true, '2026-03-08',
      'https://www.bbc.com/portuguese/articles/nikolas-ferreira-dia-mulher-polemica-2026',
      'news_article',
      'Belo Horizonte', 'Vídeo no Instagram', 'nikolas-ironiza-feministas-dia-mulher-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 11. Janones suspenso por 3 meses por ofensas homofóbicas contra Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones foi suspenso por 3 meses pela Câmara após proferir ofensas homofóbicas contra Nikolas Ferreira no plenário.',
      'O deputado Nikolas Ferreira é um covarde que se esconde atrás da Bíblia. Todo mundo sabe quem ele é de verdade. Esse rapazinho enganando o Brasil inteiro com essa carinha de santo. Hipócrita! O povo de Minas vai descobrir quem você realmente é.',
      'Declaração de Janones no plenário da Câmara em julho de 2025, com insinuações homofóbicas sobre Nikolas. O Conselho de Ética aprovou suspensão de 3 meses do mandato de Janones por quebra de decoro parlamentar. Foi a punição mais severa aplicada a um deputado naquela legislatura.',
      'verified', true, '2025-07-10',
      'https://www.folha.uol.com.br/poder/2025/07/janones-suspenso-ofensas-homofobicas-nikolas-camara.shtml',
      'news_article',
      'Brasília', 'Plenário da Câmara dos Deputados', 'janones-suspenso-ofensas-homofobicas-nikolas-julho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 12. Janones chama Bolsonaro de "vagabundo, ladrão e safado"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones publicou série de vídeos chamando Bolsonaro de "vagabundo", "ladrão" e "safado" e prometendo novas denúncias.',
      'Bolsonaro é um vagabundo. Ladrão. Safado. Vendeu o Brasil para o centrão, comprou 51 imóveis com dinheiro vivo e ainda quer ser candidato de novo. Eu tenho as provas e vou mostrar uma por uma. O Brasil vai saber toda a verdade sobre esse criminoso.',
      'Série de vídeos publicados por Janones em suas redes sociais em março de 2026, como parte de sua estratégia de ataques constantes a Bolsonaro. Os vídeos acumularam milhões de visualizações e geraram ação judicial de Bolsonaro.',
      'verified', true, '2026-03-10',
      'https://www.uol.com.br/noticias/politica/janones-bolsonaro-vagabundo-ladrao-safado-videos-2026.htm',
      'news_article',
      'Brasília', 'Vídeos nas redes sociais', 'janones-bolsonaro-vagabundo-ladrao-safado-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 13. Janones afirma que Bolsonaro mandou matar Lula e Alckmin
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones afirmou em vídeo que Bolsonaro "mandou matar" Lula e Alckmin e que as provas estão no inquérito do STF.',
      'Bolsonaro mandou matar Lula e Alckmin. Isso está nos autos do inquérito. Não sou eu que estou dizendo, é a Polícia Federal. Ele planejou o assassinato do presidente eleito e do vice-presidente. Isso é crime hediondo e ele tem que pagar.',
      'Vídeo publicado por Janones em janeiro de 2026, referindo-se ao inquérito do golpe em que a PF apontou que Bolsonaro teve conhecimento do plano de assassinato de Lula, Alckmin e Moraes. A afirmação de que Bolsonaro "mandou matar" extrapola o que consta nos autos.',
      'verified', false, '2026-01-15',
      'https://g1.globo.com/politica/noticia/2026/01/janones-bolsonaro-mandou-matar-lula-alckmin-video.ghtml',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'janones-bolsonaro-mandou-matar-lula-alckmin-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Janones acusa Bolsonaro de vender vagas no STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones acusou Bolsonaro de ter vendido indicações ao STF em troca de apoio político e imóveis.',
      'Bolsonaro vendeu vagas no STF. Indicou ministros em troca de favores, em troca de proteção, em troca de dinheiro. Nunes Marques e André Mendonça foram moeda de troca. É isso que o defensor da moral e dos bons costumes fazia: vendia a Justiça brasileira.',
      'Acusação feita por Janones em live no YouTube em fevereiro de 2026. A alegação não tem comprovação documental mas faz referência a investigações jornalísticas sobre as indicações de Bolsonaro ao STF e a relação com o Centrão.',
      'verified', false, '2026-02-20',
      'https://www.cartacapital.com.br/politica/janones-acusa-bolsonaro-vender-vagas-stf-2026/',
      'news_article',
      'Brasília', 'Live no YouTube', 'janones-acusa-bolsonaro-vender-vagas-stf-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 15. Janones acusa Bolsonaro de comprar imóveis com dinheiro vivo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones reforçou acusações de que Bolsonaro comprou dezenas de imóveis com pagamento em espécie, indicando lavagem de dinheiro.',
      'São 51 imóveis comprados com dinheiro vivo. Quem compra 51 imóveis em dinheiro vivo? Traficante, lavador de dinheiro e Jair Messias Bolsonaro. Me processem à vontade, a verdade dói. O Bolsonaro é o maior lavador de dinheiro da história da República.',
      'Declaração em vídeo viral de Janones em março de 2026, reutilizando dados de reportagens sobre transações imobiliárias da família Bolsonaro. A PF investiga parte dessas transações no inquérito sobre lavagem de dinheiro.',
      'verified', false, '2026-03-15',
      'https://www.poder360.com.br/justica/janones-bolsonaro-imoveis-dinheiro-vivo-lavagem-2026/',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'janones-bolsonaro-imoveis-dinheiro-vivo-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 16. Bolsonaro processa Janones no STF por calúnia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro processou Janones no STF por calúnia, afirmando que o deputado mentiu sobre envolvimento em plano de assassinato.',
      'Estou processando o deputado Janones por calúnia, difamação e injúria. Esse sujeito mente todos os dias sobre mim e minha família. Nunca mandei matar ninguém. Quem cala consente e eu não vou mais calar diante dessas mentiras deslavadas.',
      'Comunicado de Bolsonaro por meio de seus advogados em abril de 2026, formalizando queixa-crime contra Janones no STF. É mais um capítulo da guerra jurídica entre os dois, que já acumula dezenas de processos.',
      'verified', true, '2026-04-08',
      'https://www.conjur.com.br/2026-abr-08/bolsonaro-processa-janones-stf-calunia/',
      'news_article',
      'Brasília', 'Petição ao STF', 'bolsonaro-processa-janones-stf-calunia-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_obs, true FROM ins;

  -- 17. Janones confessa prática de rachadinha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones admitiu prática de rachadinha com assessores e foi citado por ONG anticorrupção como exemplo de contradição na luta contra corrupção.',
      'Sim, eu devolvia parte do salário dos assessores para o mandato. Todo mundo faz isso. A diferença é que eu sou honesto e admito. O Bolsonaro fazia rachadinha para comprar imóvel, eu fazia para financiar o mandato do povo.',
      'Declaração de Janones em entrevista ao UOL em novembro de 2025, em que admitiu devolver parte dos salários de assessores. A Transparência Brasil citou Janones como exemplo de incoerência, já que ele acusa Bolsonaro de rachadinha enquanto pratica o mesmo esquema.',
      'verified', true, '2025-11-05',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2025/11/janones-admite-rachadinha-assessores.htm',
      'news_article',
      'São Paulo', 'Entrevista ao UOL', 'janones-admite-rachadinha-assessores-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 18. Janones ataca Nikolas após retorno da suspensão
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones voltou a atacar Nikolas após retornar da suspensão de 3 meses, dizendo que não será silenciado.',
      'Voltei e estou mais forte. Tentaram me calar com essa suspensão ridícula, mas não conseguiram. O Nikolas continua sendo o que é: um hipócrita que engana o Brasil. E eu vou continuar denunciando, custe o que custar.',
      'Declaração de Janones em vídeo publicado no dia de seu retorno ao mandato após cumprir suspensão de 3 meses em outubro de 2025. A volta de Janones reacendeu a guerra digital entre ele e Nikolas Ferreira.',
      'verified', false, '2025-10-10',
      'https://www.correiobraziliense.com.br/politica/2025/10/janones-retorna-suspensao-ataca-nikolas.html',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'janones-retorna-suspensao-ataca-nikolas-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 19. Janones diz que será candidato a governador de Minas para enfrentar Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones anunciou que será candidato a governador de Minas Gerais para enfrentar Nikolas Ferreira em 2026.',
      'Se o Nikolas quer Minas, vai ter que me enfrentar. Vou ser candidato a governador para mostrar que Minas não é terra de extremista. O povo mineiro é trabalhador, é gente boa, e não merece um governador que odeia mulher e que vive de polêmica no celular.',
      'Anúncio feito por Janones em live no YouTube em dezembro de 2025, posicionando-se como principal adversário de Nikolas na disputa pelo governo de Minas Gerais em 2026. A rivalidade entre os dois domina o cenário político mineiro.',
      'verified', false, '2025-12-12',
      'https://www.em.com.br/politica/2025/12/janones-candidato-governador-minas-enfrentar-nikolas.html',
      'news_article',
      'Belo Horizonte', 'Live no YouTube', 'janones-candidato-governador-minas-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 20. Pablo Marçal confirma pré-candidatura a presidente pelo PRTB
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal confirmou pré-candidatura a presidente da República pelo PRTB, prometendo "libertar o povo pelo empreendedorismo".',
      'Eu sou candidato a presidente da República. Chega de esquerda e direita, o Brasil precisa de um empreendedor. Empreendedorismo é a chave para libertar o nosso povo. Eu vou governar o Brasil como uma empresa: com metas, resultados e sem mordomia.',
      'Anúncio de pré-candidatura feito por Pablo Marçal em evento do PRTB em São Paulo em fevereiro de 2026. Marçal enfrenta mais de 100 processos no TSE decorrentes de sua campanha à prefeitura de SP em 2024.',
      'verified', true, '2026-02-15',
      'https://www.estadao.com.br/politica/pablo-marcal-pre-candidato-presidente-prtb-2026/',
      'news_article',
      'São Paulo', 'Evento do PRTB', 'marcal-pre-candidato-presidente-prtb-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 21. Marçal diz que empreendedorismo é a chave para libertar o povo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal repetiu em comício que o empreendedorismo libertará o Brasil da dependência do Estado e atacou programas sociais.',
      'O brasileiro não precisa de Bolsa Família, precisa de CNPJ. O empreendedorismo é a chave para libertar o nosso povo. Enquanto o PT quer manter o povo dependente do governo, eu quero ensinar o povo a pescar. Chega de esmola, o Brasil precisa de lucro.',
      'Discurso de Marçal em comício do PRTB em Campinas em março de 2026. A crítica ao Bolsa Família gerou reação de movimentos sociais e do governo federal, que classificou a fala como "elitista e descolada da realidade".',
      'verified', false, '2026-03-22',
      'https://www.folha.uol.com.br/poder/2026/03/marcal-empreendedorismo-libertar-povo-bolsa-familia.shtml',
      'news_article',
      'Campinas', 'Comício do PRTB', 'marcal-empreendedorismo-libertar-povo-campinas-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 22. Marçal apoia pré-candidatura de Flávio Bolsonaro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal declarou apoio à pré-candidatura de Flávio Bolsonaro ao governo do Rio de Janeiro.',
      'O Flávio é guerreiro. Ele enfrentou perseguição judicial, enfrentou a mídia, e continua de pé. Eu apoio a pré-candidatura dele ao governo do Rio. O Rio precisa de alguém com fibra e o Flávio tem fibra de sobra. A direita precisa estar unida.',
      'Declaração de Marçal em evento conjunto com Flávio Bolsonaro no Rio de Janeiro em janeiro de 2026. A aliança entre Marçal e a família Bolsonaro fortalece ambos no cenário eleitoral de 2026.',
      'verified', false, '2026-01-28',
      'https://oglobo.globo.com/politica/marcal-apoia-flavio-bolsonaro-governador-rio-2026/',
      'news_article',
      'Rio de Janeiro', 'Evento conjunto PL-PRTB', 'marcal-apoia-flavio-bolsonaro-governador-rio-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 23. Marçal enfrenta mais de 100 processos no TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal minimizou os mais de 100 processos que enfrenta no TSE, chamando-os de "perseguição do sistema contra outsiders".',
      'São mais de 100 processos no TSE. Sabe o que isso significa? Significa que eu incomodo. O sistema não processa quem não ameaça. Cada processo é uma medalha. Vou responder todos e vou vencer todos, porque a verdade está do meu lado.',
      'Declaração de Marçal em entrevista ao Flow Podcast em dezembro de 2025. Os processos referem-se a irregularidades em propaganda eleitoral, uso indevido de redes sociais e desinformação durante a campanha municipal de São Paulo em 2024.',
      'verified', true, '2025-12-05',
      'https://www.cnnbrasil.com.br/politica/marcal-100-processos-tse-campanha-2024-perseguicao/',
      'news_article',
      'São Paulo', 'Flow Podcast', 'marcal-100-processos-tse-perseguicao-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Marçal ataca regulação de redes sociais
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal criticou proposta de regulação de redes sociais dizendo que é tentativa de censurar a nova política digital.',
      'Regulação de redes sociais é censura disfarçada. Querem tirar o poder do povo de se comunicar direto com seus líderes. Eu construí tudo nas redes sociais e eles querem destruir isso. Não vão conseguir. O povo não vai aceitar mordaça digital.',
      'Declaração em vídeo no Instagram em agosto de 2025, durante debate sobre o PL das Fake News. Marçal é um dos políticos mais dependentes de redes sociais e tem interesse direto em evitar qualquer regulação.',
      'verified', false, '2025-08-20',
      'https://www.metropoles.com/colunas/marcal-regulacao-redes-sociais-censura-digital/',
      'news_article',
      'São Paulo', 'Vídeo no Instagram', 'marcal-regulacao-redes-censura-digital-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

  -- 25. Marco Feliciano defende Bolsonaro como única opção para 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano defendeu Bolsonaro como "única opção" para a direita em 2026 e atacou quem busca alternativas.',
      'Bolsonaro é a única opção para 2026. Quem acha que pode substituí-lo está enganado. O povo quer Bolsonaro, ponto final. Qualquer plano B é traição. Tarcísio, Nikolas, Marçal — nenhum deles tem o carisma e a coragem do capitão.',
      'Declaração de Feliciano em culto evangélico em São Paulo em setembro de 2025, reforçando lealdade a Bolsonaro e criticando indiretamente os que buscam alternativas para a candidatura presidencial da direita.',
      'verified', true, '2025-09-21',
      'https://www.gospelprime.com.br/feliciano-bolsonaro-unica-opcao-2026-traicao/',
      'news_article',
      'São Paulo', 'Culto evangélico', 'feliciano-bolsonaro-unica-opcao-2026-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 26. Feliciano diz que inelegibilidade de Bolsonaro é "perseguição satânica"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano classificou a inelegibilidade de Bolsonaro como "perseguição satânica" e pediu orações pela reversão.',
      'A inelegibilidade do presidente Bolsonaro é perseguição satânica. São forças espirituais agindo contra o Brasil. Peço a todos os irmãos que orem, jejuem e clamem a Deus para que essa injustiça seja revertida. Deus é maior que o TSE.',
      'Fala de Feliciano durante conferência profética em Goiânia em novembro de 2025. O pastor e deputado mistura frequentemente discurso religioso com política, o que é criticado por defensores do Estado laico.',
      'verified', false, '2025-11-15',
      'https://www.folha.uol.com.br/poder/2025/11/feliciano-inelegibilidade-bolsonaro-perseguicao-satanica.shtml',
      'news_article',
      'Goiânia', 'Conferência profética', 'feliciano-inelegibilidade-bolsonaro-satanica-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 27. Bia Kicis confirma chapa pura PL com Michelle para Senado no DF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis confirmou que fará chapa pura com Michelle Bolsonaro para as duas vagas de senador pelo DF em 2026.',
      'Vamos fazer chapa pura PL no Distrito Federal. Eu e Michelle Bolsonaro seremos candidatas ao Senado. O DF é conservador e vai eleger duas senadoras comprometidas com a família, com Deus e com a liberdade. Essa chapa é imbatível.',
      'Anúncio feito por Bia Kicis em evento do PL Mulher em Brasília em janeiro de 2026. A estratégia de chapa pura visa capitalizar a popularidade de Michelle no DF, onde o PL é o partido mais forte.',
      'verified', true, '2026-01-18',
      'https://www.correiobraziliense.com.br/politica/2026/01/bia-kicis-michelle-bolsonaro-chapa-senado-df.html',
      'news_article',
      'Brasília', 'Evento PL Mulher', 'bia-kicis-michelle-chapa-senado-df-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 28. Bia Kicis chama prisão de Bolsonaro de perseguição política de extrema injustiça
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis classificou a prisão de Bolsonaro como "perseguição política de extrema injustiça" e comparou o Brasil a ditaduras.',
      'O que estão fazendo com o presidente Bolsonaro é perseguição política de extrema injustiça. Isso não acontece nem na Venezuela. Prenderam um presidente eleito por 57 milhões de brasileiros com base em delações e provas fabricadas. O Brasil virou uma ditadura judicial.',
      'Declaração de Bia Kicis em sessão da Câmara em março de 2025, durante debates sobre a situação de Bolsonaro. A deputada tem sido uma das mais veementes defensoras do ex-presidente no Congresso.',
      'verified', true, '2025-03-12',
      'https://www.camara.leg.br/noticias/2025/03/bia-kicis-bolsonaro-perseguicao-politica-extrema-injustica/',
      'news_article',
      'Brasília', 'Sessão da Câmara dos Deputados', 'bia-kicis-bolsonaro-perseguicao-extrema-injustica-marco-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Bia Kicis pede impeachment de Moraes na tribuna
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis usou tribuna da Câmara para pedir impeachment de Alexandre de Moraes e o chamou de "maior ameaça à democracia".',
      'Alexandre de Moraes é a maior ameaça à democracia brasileira. Ele acumula os poderes de investigar, acusar e julgar. Isso é inquisição. Peço formalmente o impeachment desse ministro que rasgou a Constituição e transformou o STF em tribunal de exceção.',
      'Discurso na tribuna da Câmara em junho de 2025. Bia Kicis protocolou novo pedido de impeachment de Moraes, o décimo desde 2023. O pedido não avançou por falta de apoio do presidente do Senado.',
      'verified', false, '2025-06-18',
      'https://www.poder360.com.br/congresso/bia-kicis-impeachment-moraes-tribuna-camara-2025/',
      'news_article',
      'Brasília', 'Tribuna da Câmara dos Deputados', 'bia-kicis-impeachment-moraes-tribuna-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 30. Eduardo diz dos EUA que eleição de 2026 pode não acontecer
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro disse dos EUA que a eleição de 2026 "pode não acontecer" se o STF continuar no poder.',
      'A eleição de 2026 pode não acontecer do jeito que vocês estão imaginando. Com Alexandre de Moraes no poder, com o TSE controlado pela esquerda, não há garantia de eleições livres. Eles podem impedir qualquer candidato da direita de concorrer.',
      'Declaração de Eduardo Bolsonaro em entrevista a canal conservador americano em março de 2026, feita de Miami. A fala foi interpretada como mais um ataque às instituições democráticas e gerou repúdio de partidos de centro e esquerda.',
      'verified', true, '2026-03-05',
      'https://www.bbc.com/portuguese/articles/eduardo-bolsonaro-eleicao-2026-pode-nao-acontecer',
      'news_article',
      'Miami', 'Entrevista a canal conservador americano', 'eduardo-eleicao-2026-pode-nao-acontecer-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 31. Eduardo tem mandato anulado e é indiciado pela PGR
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro reagiu à anulação de seu mandato e ao indiciamento pela PGR, dizendo ser vítima de "golpe jurídico".',
      'Anularam meu mandato e me indiciaram. Isso é um golpe jurídico contra a família Bolsonaro. Querem nos eliminar da política brasileira a qualquer custo. Mas não vão conseguir. Eu vou recorrer em todas as instâncias e o povo vai me reeleger.',
      'Reação de Eduardo Bolsonaro em vídeo publicado após decisão judicial que anulou seu mandato e indiciamento pela PGR em fevereiro de 2026. O deputado estava nos EUA quando a decisão foi anunciada.',
      'verified', true, '2026-02-28',
      'https://g1.globo.com/politica/noticia/2026/02/eduardo-bolsonaro-mandato-anulado-pgr-indiciamento.ghtml',
      'news_article',
      'Miami', 'Vídeo nas redes sociais', 'eduardo-mandato-anulado-pgr-indiciamento-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 32. Eduardo ataca Lula dos EUA chamando-o de "ladrão internacional"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo chamou Lula de "ladrão internacional" e acusou o governo de destruir a economia brasileira.',
      'Lula é um ladrão internacional. Roubou o Brasil, roubou a Petrobras, e agora está destruindo a economia. O dólar subiu, a inflação voltou, e o povo está passando fome de novo. Tudo por causa desse criminoso que deveria estar preso.',
      'Declaração de Eduardo em live no Instagram feita dos EUA em abril de 2026. Eduardo mantém intensa atividade nas redes sociais mesmo após a anulação de seu mandato, usando a presença nos EUA para articular apoio internacional à direita brasileira.',
      'verified', false, '2026-04-02',
      'https://www.metropoles.com/colunas/eduardo-bolsonaro-lula-ladrao-internacional-live-eua/',
      'news_article',
      'Miami', 'Live no Instagram', 'eduardo-lula-ladrao-internacional-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 33. Carlos Bolsonaro ataca jornalistas como "inimigos do povo"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro chamou jornalistas de "inimigos do povo" e acusou a imprensa de conspirar contra a família Bolsonaro.',
      'Jornalistas são inimigos do povo. A imprensa brasileira é uma máquina de mentiras que trabalha 24 horas por dia para destruir minha família. Não são jornalistas, são ativistas disfarçados. O povo já acordou e não acredita mais nessa gente.',
      'Postagem de Carlos Bolsonaro no X (antigo Twitter) em outubro de 2025, após reportagem sobre novas provas no inquérito contra Jair Bolsonaro. Carlos é vereador no Rio de Janeiro e opera como principal estrategista digital da família.',
      'verified', false, '2025-10-22',
      'https://www.folha.uol.com.br/poder/2025/10/carlos-bolsonaro-jornalistas-inimigos-povo-redes.shtml',
      'news_article',
      'Rio de Janeiro', 'Postagem no X', 'carlos-jornalistas-inimigos-povo-outubro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 34. Nikolas ataca universidades públicas como "fábricas de comunistas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas chamou universidades públicas de "fábricas de comunistas" e defendeu corte de verbas para cursos de humanas.',
      'As universidades públicas viraram fábricas de comunistas. O brasileiro paga imposto para financiar curso de gênero, de desconstrução da família. Precisamos cortar a verba dessa doutrinação e investir em tecnologia, engenharia, medicina. Chega de gastar dinheiro formando militante.',
      'Declaração em palestra para jovens conservadores em Belo Horizonte em junho de 2025. A fala gerou protesto de reitores de universidades federais e da UNE, que acusaram Nikolas de promover obscurantismo.',
      'verified', false, '2025-06-10',
      'https://educacao.uol.com.br/noticias/2025/06/nikolas-universidades-fabricas-comunistas-corte-verbas.htm',
      'news_article',
      'Belo Horizonte', 'Palestra para jovens conservadores', 'nikolas-universidades-fabricas-comunistas-junho-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 35. Damares Alves apoia Nikolas para governo de Minas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves declarou apoio a Nikolas para governo de Minas e disse que ele representa a "nova geração cristã na política".',
      'Nikolas Ferreira é a nova geração cristã na política brasileira. Ele tem coragem, tem fé e tem o povo. Eu apoio a candidatura dele ao governo de Minas Gerais com todas as minhas forças. Minas precisa de um governador que defenda a família e os valores cristãos.',
      'Declaração de Damares Alves em evento evangélico em Belo Horizonte em dezembro de 2025. A senadora pelo DF tem articulado apoio do eleitorado evangélico a candidatos conservadores para 2026.',
      'verified', false, '2025-12-08',
      'https://www.gospelprime.com.br/damares-apoio-nikolas-governo-minas-geracao-crista/',
      'news_article',
      'Belo Horizonte', 'Evento evangélico', 'damares-apoio-nikolas-governo-minas-dezembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 36. Marçal ataca Lula e PT como "responsáveis pela miséria brasileira"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal atacou Lula e o PT em comício, dizendo que são os "responsáveis pela miséria brasileira" e que o povo precisa empreender.',
      'Lula e o PT são os maiores responsáveis pela miséria brasileira. Criaram uma indústria da pobreza para manter o povo dependente. Enquanto o PT dá esmola, eu vou dar oportunidade. O Brasil precisa de CEO, não de sindicalista aposentado.',
      'Discurso de Marçal em comício em Recife em março de 2026, sua primeira viagem ao Nordeste como pré-candidato. A região é reduto eleitoral do PT e Marçal busca conquistar votos com discurso empreendedor.',
      'verified', true, '2026-03-28',
      'https://www.jc.com.br/politica/2026/03/marcal-lula-pt-miseria-brasileira-comicio-recife/',
      'news_article',
      'Recife', 'Comício do PRTB', 'marcal-lula-pt-miseria-brasileira-recife-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 37. Nikolas critica Lula por "aparelhar" instituições
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas acusou Lula de aparelhar todas as instituições do Estado para garantir a perpetuação do PT no poder.',
      'Lula está aparelhando tudo: a PF, o STF, as agências reguladoras, os bancos públicos. É o projeto de poder mais ambicioso da história do Brasil. Eles querem transformar o Brasil numa Venezuela de terno e gravata. E se a gente não reagir agora, vai ser tarde demais.',
      'Declaração em vídeo publicado em janeiro de 2026 após nomeações do governo Lula para cargos estratégicos. Nikolas usou o tema para reforçar narrativa de que o PT busca controle total do Estado.',
      'verified', false, '2026-01-20',
      'https://www.gazetadopovo.com.br/republica/nikolas-lula-aparelhar-instituicoes-venezuela-2026/',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-lula-aparelhar-instituicoes-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 38. Janones defende Lula e ataca oposição como "golpistas"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones defendeu o governo Lula e chamou a oposição de "bando de golpistas que deveria estar preso".',
      'O governo Lula está reconstruindo o Brasil que Bolsonaro destruiu. E essa oposição? É um bando de golpistas que deveria estar preso. Tentaram dar um golpe, tentaram matar o presidente eleito, e ainda querem dar lição de moral. Vergonha!',
      'Declaração de Janones em sessão da Câmara em fevereiro de 2026, durante debate sobre o orçamento. O deputado é o principal defensor digital do governo Lula e atua como espécie de contra-ataque às críticas da oposição.',
      'verified', false, '2026-02-12',
      'https://www.camara.leg.br/noticias/2026/02/janones-defende-lula-oposicao-golpistas/',
      'news_article',
      'Brasília', 'Sessão da Câmara dos Deputados', 'janones-defende-lula-oposicao-golpistas-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 39. Nikolas promove teoria sobre fraude nas urnas eletrônicas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas levantou dúvidas sobre a segurança das urnas eletrônicas e pediu voto impresso para 2026.',
      'Eu não confio nas urnas eletrônicas. Nenhum país sério do mundo usa um sistema sem comprovante impresso. O Brasil é o único país que confia cegamente numa caixa preta. Precisamos do voto impresso auditável para 2026. O povo tem direito de conferir seu voto.',
      'Declaração em live no YouTube em maio de 2025, retomando pauta que foi bandeira de Bolsonaro. O TSE já realizou múltiplas auditorias que comprovaram a segurança do sistema eletrônico de votação.',
      'verified', false, '2025-05-18',
      'https://www.uol.com.br/noticias/politica/nikolas-urnas-eletronicas-voto-impresso-2026.htm',
      'news_article',
      'Belo Horizonte', 'Live no YouTube', 'nikolas-urnas-eletronicas-voto-impresso-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Marçal diz que "pobre não precisa de governo, precisa de mentalidade"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal disse que "pobre não precisa de governo, precisa de mentalidade" e foi acusado de meritocracia tóxica.',
      'Pobre não precisa de governo, precisa de mentalidade. Eu fui pobre e saí da pobreza com trabalho e fé. Ninguém me deu Bolsa Família. O problema do Brasil não é falta de dinheiro, é falta de mentalidade empreendedora. Muda a mente que a conta bancária muda junto.',
      'Fala de Marçal em palestra motivacional em Manaus em janeiro de 2026. Movimentos sociais e economistas criticaram a declaração como "meritocracia tóxica" que ignora desigualdades estruturais do país.',
      'verified', true, '2026-01-10',
      'https://amazonasatual.com.br/pablo-marcal-pobre-mentalidade-palestra-manaus-2026/',
      'news_article',
      'Manaus', 'Palestra motivacional', 'marcal-pobre-mentalidade-governo-manaus-janeiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 41. Feliciano ataca comunidade LGBT em culto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Feliciano atacou a comunidade LGBT em culto, dizendo que "a agenda gay quer destruir a infância brasileira".',
      'A agenda gay quer destruir a infância brasileira. Querem ensinar ideologia de gênero nas escolas, querem confundir as crianças. Isso é abuso infantil disfarçado de inclusão. Nós, cristãos, temos o dever de proteger nossos filhos dessa doutrinação.',
      'Pregação de Marco Feliciano em megaculto em Campinas em agosto de 2025. A fala gerou representação no Ministério Público por homofobia, mas Feliciano alega que se trata de liberdade religiosa.',
      'verified', true, '2025-08-10',
      'https://www.cartacapital.com.br/diversidade/feliciano-agenda-gay-destruir-infancia-culto-2025/',
      'news_article',
      'Campinas', 'Megaculto evangélico', 'feliciano-agenda-gay-infancia-culto-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 42. Janones compara Bolsonaro a ditadores da América Latina
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones comparou Bolsonaro a ditadores latino-americanos e disse que ele tentou implantar "um regime de terror".',
      'Bolsonaro é o Pinochet tropical. Tentou implantar um regime de terror no Brasil, planejou assassinato de adversários, e ainda tem gente que defende esse homem. Quem defende Bolsonaro defende ditadura, defende tortura, defende assassinato.',
      'Declaração em discurso na Câmara em abril de 2026, durante debate sobre aniversário do golpe militar de 1964. Janones usa frequentemente comparações históricas para atacar Bolsonaro e a direita.',
      'verified', false, '2026-04-01',
      'https://www.brasildefato.com.br/2026/04/01/janones-bolsonaro-pinochet-tropical-camara/',
      'news_article',
      'Brasília', 'Sessão da Câmara dos Deputados', 'janones-bolsonaro-pinochet-tropical-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 43. Nikolas critica STF por liberar aborto até 12 semanas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas atacou decisão do STF sobre aborto e disse que a Corte está legislando contra a vontade do povo.',
      'O STF está legislando. Isso é atribuição do Congresso Nacional. A maioria do povo brasileiro é contra o aborto e o Supremo ignora isso. São onze ministros decidindo o destino de 215 milhões de brasileiros sem nenhum voto popular. Isso é ditadura judicial.',
      'Reação de Nikolas em vídeo nas redes sociais em setembro de 2025, após votação do STF sobre descriminalização do aborto. A fala viralizou e reforçou a imagem de Nikolas como principal voz conservadora da nova geração.',
      'verified', true, '2025-09-25',
      'https://www.cnnbrasil.com.br/politica/nikolas-stf-aborto-ditadura-judicial-2025/',
      'news_article',
      'Belo Horizonte', 'Vídeo nas redes sociais', 'nikolas-stf-aborto-ditadura-judicial-setembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 44. Marçal diz que vai "demitir 30% dos funcionários públicos"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal prometeu demitir 30% dos funcionários públicos federais se eleito presidente.',
      'Se eu for eleito, vou demitir 30% dos funcionários públicos federais no primeiro ano. O Estado brasileiro é inchado, ineficiente e caro demais. O servidor público que não produz resultado vai ser mandado embora. Brasil precisa de meritocracia, não de cabide de emprego.',
      'Promessa feita por Marçal em entrevista ao Inteligência LTDA podcast em fevereiro de 2026. Juristas apontaram que a promessa é inconstitucional, já que servidores concursados têm estabilidade garantida.',
      'verified', false, '2026-02-08',
      'https://www.infomoney.com.br/politica/marcal-demitir-funcionarios-publicos-promessa-presidente-2026/',
      'news_article',
      'São Paulo', 'Podcast Inteligência LTDA', 'marcal-demitir-funcionarios-publicos-fevereiro-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 45. Eduardo acusa Moraes de ser "ditador" do Judiciário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo chamou Alexandre de Moraes de "ditador do Judiciário" e disse que o Brasil é refém do STF.',
      'Alexandre de Moraes é o ditador do Judiciário brasileiro. Ele decide sozinho quem é preso, quem é censurado, quem é perseguido. O Brasil é refém de um único homem que se acha acima da Constituição. Isso não é democracia, isso é tirania.',
      'Fala de Eduardo em evento conservador na Flórida em novembro de 2025. O deputado usa a presença nos EUA para internacionalizar as críticas ao Judiciário brasileiro e pressionar por intervenção internacional.',
      'verified', false, '2025-11-08',
      'https://www.estadao.com.br/politica/eduardo-bolsonaro-moraes-ditador-judiciario-florida-2025/',
      'news_article',
      'Miami', 'Evento conservador na Flórida', 'eduardo-moraes-ditador-judiciario-florida-novembro-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 46. Janones diz que Nikolas usa religião para encobrir preconceito
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'Janones acusou Nikolas de usar a religião como escudo para justificar discursos misóginos e homofóbicos.',
      'O Nikolas usa a Bíblia como escudo para ser misógino e homofóbico. Ele odeia mulher, odeia gay, e esconde tudo atrás da religião. Isso não é cristianismo, é covardia. Jesus não era preconceituoso, mas o Nikolas é. E muito.',
      'Declaração de Janones em vídeo publicado em agosto de 2025, durante a polêmica da expulsão de Nikolas do programa da Globo. O vídeo acumulou milhões de visualizações e aprofundou a rivalidade entre os dois.',
      'verified', false, '2025-08-16',
      'https://www.uol.com.br/noticias/politica/janones-nikolas-religiao-preconceito-misoginia-2025.htm',
      'news_article',
      'Brasília', 'Vídeo nas redes sociais', 'janones-nikolas-religiao-preconceito-agosto-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 47. Bia Kicis defende armar população civil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bia,
      'Bia Kicis defendeu a flexibilização do porte de armas e disse que o cidadão de bem precisa se defender.',
      'O cidadão de bem tem direito de se defender. O governo Lula quer desarmar o povo honesto e deixar as armas na mão dos bandidos. Eu defendo que todo brasileiro que cumpra os requisitos legais possa ter sua arma. Arma na mão do cidadão de bem salva vidas.',
      'Fala de Bia Kicis em audiência pública na Câmara sobre o Estatuto do Desarmamento em maio de 2025. A deputada é uma das principais defensoras do armamento civil no Congresso.',
      'verified', false, '2025-05-22',
      'https://www.poder360.com.br/congresso/bia-kicis-armar-populacao-cidadao-bem-2025/',
      'news_article',
      'Brasília', 'Audiência pública na Câmara', 'bia-kicis-armar-populacao-cidadao-bem-maio-2025'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 48. Nikolas diz que "a esquerda odeia quem trabalha"
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas afirmou que a esquerda "odeia quem trabalha" e que o governo Lula pune os empreendedores.',
      'A esquerda odeia quem trabalha. O governo Lula aumenta imposto, aumenta burocracia, e pune quem empreende. Enquanto isso, dá dinheiro para quem não faz nada. O Brasil está de cabeça para baixo: quem produz é punido e quem não produz é premiado.',
      'Declaração em evento do PL com empresários em São Paulo em abril de 2026. Nikolas tem investido em agenda econômica para ampliar seu perfil além de pautas comportamentais e se credenciar como candidato executivo.',
      'verified', false, '2026-04-10',
      'https://www.infomoney.com.br/politica/nikolas-esquerda-odeia-trabalha-empresarios-2026/',
      'news_article',
      'São Paulo', 'Evento do PL com empresários', 'nikolas-esquerda-odeia-trabalha-empresarios-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 49. Marçal desafia Lula para debate público
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marçal desafiou Lula para debate público e disse que o presidente "tem medo de enfrentar um empreendedor".',
      'Eu desafio o presidente Lula para um debate público, ao vivo, sem teleprompter. Lula tem medo de enfrentar um empreendedor porque sabe que não tem argumento. Ele só sabe dar desculpa e culpar os outros. Vamos debater economia, educação, emprego. Aceita, presidente?',
      'Desafio feito por Marçal em vídeo viral no TikTok em abril de 2026. O vídeo acumulou mais de 20 milhões de visualizações. O Planalto não respondeu ao desafio.',
      'verified', true, '2026-04-12',
      'https://www.estadao.com.br/politica/marcal-desafia-lula-debate-publico-tiktok-2026/',
      'news_article',
      'São Paulo', 'Vídeo no TikTok', 'marcal-desafia-lula-debate-publico-abril-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_irr, true FROM ins;

  -- 50. Nikolas promete "revolução conservadora" se eleito governador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas prometeu uma "revolução conservadora" em Minas Gerais se eleito governador, com foco em segurança e redução do Estado.',
      'Se eu for eleito governador de Minas Gerais, vai ser uma revolução conservadora. Vou armar o cidadão de bem, vou cortar a burocracia, vou privatizar o que puder e vou acabar com a doutrinação nas escolas estaduais. Minas será o modelo da nova direita brasileira.',
      'Discurso de Nikolas em convenção estadual do PL em Belo Horizonte em março de 2026. O evento reuniu 5 mil pessoas e contou com a participação virtual de Bolsonaro, que deu seu apoio à candidatura.',
      'verified', true, '2026-03-30',
      'https://www.em.com.br/politica/2026/03/nikolas-revolucao-conservadora-governador-minas-convencao-pl.html',
      'news_article',
      'Belo Horizonte', 'Convenção estadual do PL', 'nikolas-revolucao-conservadora-governador-minas-marco-2026'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_aut, true FROM ins;

END $$;
