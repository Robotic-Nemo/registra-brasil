-- Batch 76: Nikolas Ferreira ecosystem and right-wing parliamentary commentary
-- Pix video, peruca incident, misogyny law attacks, 7 Sep rallies,
-- Alcolumbre criticism, Globo expulsion, vaccine/school/gender culture war,
-- attacks on Lula/Moraes, Janones conflict, 2026 MG governor bid, crypto/tech.
-- 100 statements (Jan 2023 – Apr 2026) with severity_score.

DO $$
DECLARE
  v_nik UUID; v_jan UUID; v_zam UUID; v_kic UUID; v_fel UUID;
  v_sil UUID; v_mag UUID; v_dam UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_bol UUID; v_van UUID; v_kim UUID; v_gir UUID;
  v_zan UUID; v_san UUID; v_bar UUID; v_gbt UUID; v_gpx UUID;
  v_sal UUID; v_ram UUID; v_dsi UUID; v_adr UUID; v_eri UUID;
  v_sam UUID; v_tal UUID; v_lin UUID; v_jfe UUID; v_orl UUID;
  v_chi UUID; v_gle UUID; v_mar UUID; v_lula UUID;
  c_ant UUID; c_des UUID; c_odi UUID; c_mac UUID; c_mis UUID;
  c_hom UUID; c_rac UUID; c_int UUID; c_xen UUID; c_aut UUID;
  c_ame UUID; c_neg UUID; c_itm UUID; c_vio UUID; c_abu UUID;
BEGIN
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_kic FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_van FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gbt FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gpx FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_sal FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_jfe FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_itm FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';

  -- 1. Nikolas vídeo do Pix
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma em vídeo viral que governo Lula iria taxar o Pix, espalhando desinformação.',
      'O governo Lula quer taxar o seu Pix! Isso mesmo, cada transferência que você fizer vai ser cobrada. É mais um roubo do PT contra o povo brasileiro. Compartilhe esse vídeo antes que seja tarde.',
      'Vídeo publicado por Nikolas Ferreira em janeiro de 2025 no Instagram que viralizou com mais de 100 milhões de visualizações, levando o governo a recuar da norma da Receita Federal que apenas monitorava transações para combate à sonegação. O conteúdo foi rotulado como desinformação por agências de checagem.',
      3, 'verified', true, '2025-01-14',
      'https://www.folha.uol.com.br/mercado/2025/01/nikolas-ferreira-video-pix-taxa-desinformacao.shtml',
      'social_media_post',
      'Instagram', 'Vídeo viral sobre Pix', 'nikolas-video-pix-taxa-desinformacao-b76-1'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 2. Nikolas peruca tribuna
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira sobe à tribuna da Câmara vestindo peruca para zombar de pauta sobre mulheres trans.',
      'Hoje eu me sinto mulher. Como mulher, quero pedir que parem de tentar apagar as mulheres de verdade. Homens não podem competir no esporte feminino, não podem usar banheiro feminino, não podem invadir espaços que são das mulheres biológicas.',
      'Discurso de Nikolas Ferreira na tribuna da Câmara dos Deputados em março de 2023, no Dia Internacional da Mulher, quando o deputado subiu à tribuna com uma peruca para atacar mulheres trans. A fala gerou reação imediata de bancadas progressistas e foi alvo de representação no Conselho de Ética.',
      4, 'verified', true, '2023-03-08',
      'https://g1.globo.com/politica/noticia/2023/03/08/nikolas-ferreira-peruca-tribuna-camara-mulheres-trans.ghtml',
      'news_article',
      'Câmara dos Deputados', 'Sessão do Dia Internacional da Mulher', 'nikolas-peruca-tribuna-dia-mulher-b76-2'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 3. Nikolas contra lei de misoginia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca sanção da lei contra misoginia chamando-a de "lei da mordaça".',
      'Essa lei da misoginia é uma lei da mordaça. Qualquer crítica a uma mulher de esquerda vai ser enquadrada como crime. É o fim da liberdade de expressão. Lula quer calar a direita usando a pauta das mulheres como desculpa.',
      'Declaração de Nikolas Ferreira em abril de 2024, após sanção da Lei 14.811/2024 que tipifica misoginia como crime. O deputado foi um dos principais opositores da proposta, classificando-a como tentativa de censura à oposição.',
      3, 'verified', false, '2024-04-22',
      'https://www.poder360.com.br/politica/nikolas-ferreira-ataca-lei-misoginia-mordaça/',
      'social_media_post',
      'Twitter/X', 'Crítica à sanção de lei', 'nikolas-lei-misoginia-mordaca-b76-3'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 4. Nikolas 7 de Setembro 2023
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira convoca apoiadores para ato de 7 de Setembro de 2023 em Copacabana contra o STF.',
      'Brasileiro patriota, dia 7 de setembro nossa Independência será na Avenida Paulista e em Copacabana! Vamos mostrar que o povo não aceita a ditadura togada de Alexandre de Moraes. Quem ama a liberdade vai estar na rua!',
      'Publicação de Nikolas Ferreira em suas redes sociais em agosto de 2023 convocando para o ato bolsonarista de 7 de Setembro. O evento foi esvaziado em comparação aos anos anteriores e marcado por ataques ao STF.',
      3, 'verified', false, '2023-08-28',
      'https://www.uol.com.br/eleicoes/2023/08/nikolas-ferreira-convoca-7-setembro-copacabana-ato-bolsonaro.htm',
      'social_media_post',
      'Instagram/Twitter', 'Convocação 7 de Setembro', 'nikolas-convoca-7-setembro-2023-b76-4'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 5. Nikolas ataca Alcolumbre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa Davi Alcolumbre de traição por apoiar pautas do governo Lula no Senado.',
      'Davi Alcolumbre virou moleque de recado do Lula. Foi eleito com votos da direita e entrega o Senado de bandeja ao PT. É a maior traição da história recente do Congresso. O Amapá vai cobrar.',
      'Postagem de Nikolas Ferreira em março de 2025 após articulação de Davi Alcolumbre na presidência do Senado para pautar projetos do governo Lula. O ataque gerou reação de senadores que defenderam Alcolumbre.',
      2, 'verified', false, '2025-03-12',
      'https://www.metropoles.com/politica/nikolas-ferreira-ataca-alcolumbre-traicao-governo-lula',
      'social_media_post',
      'Twitter/X', 'Ataque a presidente do Senado', 'nikolas-ataca-alcolumbre-traicao-b76-5'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 6. Nikolas expulso Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira comemora sua expulsão dos estúdios da Globo chamando emissora de "lixo da comunicação".',
      'Fui expulso da Globo por falar a verdade. Essa emissora é o lixo da comunicação brasileira, vive de mamar na teta do governo Lula. A Globo quebrou moralmente há muito tempo. O povo já não assiste mais esse esgoto.',
      'Publicação de Nikolas Ferreira em setembro de 2025 após ser removido dos estúdios da Globo onde gravaria entrevista, por recusar-se a cumprir regras editoriais. O episódio gerou debate sobre relação entre parlamentares bolsonaristas e imprensa.',
      2, 'verified', true, '2025-09-18',
      'https://www.oglobo.com.br/politica/nikolas-ferreira-expulso-globo-lixo-comunicacao-2025.ghtml',
      'social_media_post',
      'Twitter/X', 'Comentário sobre emissora', 'nikolas-expulso-globo-lixo-b76-6'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 7. Nikolas negacionismo vacina COVID
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira volta a questionar segurança das vacinas de COVID-19 em transmissão ao vivo.',
      'Quantas pessoas morreram por causa da vacina e a grande mídia não conta? Tem gente com miocardite, gente jovem morrendo, e ninguém fala. A ditadura sanitária obrigou todo mundo a se vacinar e agora finge que nada aconteceu.',
      'Live de Nikolas Ferreira em julho de 2023 no YouTube onde questionou segurança dos imunizantes contra COVID-19. A fala foi desmentida por infectologistas e pela Anvisa, que reiteraram a segurança das vacinas aprovadas.',
      3, 'verified', false, '2023-07-11',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-vacina-covid-questiona-live-youtube/',
      'social_media_post',
      'YouTube', 'Live do deputado', 'nikolas-questiona-vacina-covid-live-b76-7'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 8. Nikolas anuncia MG governador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira confirma pré-candidatura ao governo de Minas Gerais em 2026 pelo PL.',
      'Minas Gerais merece um governador que defenda a família, que enfrente o PT, que não se venda pro sistema. Eu aceito esse desafio. Em 2026 serei candidato ao governo de Minas pelo PL e vamos retomar esse estado das mãos da esquerda.',
      'Discurso de Nikolas Ferreira em convenção estadual do PL em Belo Horizonte em fevereiro de 2026, quando oficializou pré-candidatura ao governo de Minas Gerais. O anúncio foi feito com presença de Jair Bolsonaro e Valdemar Costa Neto.',
      2, 'verified', true, '2026-02-21',
      'https://www.otempo.com.br/politica/nikolas-ferreira-pre-candidato-governo-minas-2026.html',
      'news_article',
      'Belo Horizonte', 'Convenção estadual do PL-MG', 'nikolas-pre-candidato-governo-mg-2026-b76-8'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 9. Nikolas escola gênero
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira afirma que escolas estão "doutrinando crianças com ideologia de gênero" e pede PL de censura.',
      'As escolas viraram centro de doutrinação de gênero. Professor militante quer convencer seu filho de 7 anos que ele pode trocar de sexo. Isso é crime! Precisamos aprovar o Escola Sem Partido e proibir qualquer conversa sobre gênero em sala de aula.',
      'Discurso de Nikolas Ferreira na Câmara em maio de 2024 defendendo proposta de censurar discussões sobre gênero e orientação sexual nas escolas. A fala contraria pareceres do MEC e de entidades pedagógicas.',
      4, 'verified', false, '2024-05-15',
      'https://www.folha.uol.com.br/educacao/2024/05/nikolas-ferreira-escolas-doutrinacao-ideologia-genero.shtml',
      'speech',
      'Câmara dos Deputados', 'Debate sobre educação', 'nikolas-escolas-ideologia-genero-b76-9'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 10. Nikolas ataque Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama Alexandre de Moraes de "tirano" e pede seu impeachment imediato.',
      'Alexandre de Moraes é o maior tirano da história da República brasileira. Censura redes, prende sem julgamento, manda invadir casa de deputado. Impeachment já! O Congresso tem o dever constitucional de afastar esse homem do STF.',
      'Postagem de Nikolas Ferreira em outubro de 2023 no Twitter/X após Moraes determinar bloqueio de perfis de apoiadores de Bolsonaro. A fala se soma a diversas outras investidas do deputado contra o ministro.',
      4, 'verified', true, '2023-10-05',
      'https://www.poder360.com.br/justica/nikolas-ferreira-moraes-tirano-impeachment/',
      'social_media_post',
      'Twitter/X', 'Ataque a ministro do STF', 'nikolas-moraes-tirano-impeachment-b76-10'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 11. Nikolas vs Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira chama André Janones de "estelionatário digital" após briga na Câmara.',
      'Janones é o maior estelionatário digital da política brasileira. Vive de fake news, inventou perseguição, enganou eleitor pra se eleger. Esse sujeito não vai me intimidar. A mineiragem é patriota, não cai na conversinha dele.',
      'Declaração de Nikolas Ferreira em junho de 2024 após discussão com André Janones em sessão da Câmara que terminou com os dois trocando xingamentos. Ambos deputados mineiros disputam influência nas redes sociais.',
      2, 'verified', false, '2024-06-13',
      'https://www.uol.com.br/noticias/2024/06/nikolas-janones-estelionatario-digital-camara-briga.htm',
      'social_media_post',
      'Twitter/X', 'Troca de farpas entre deputados', 'nikolas-janones-estelionatario-b76-11'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 12. Janones vs Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones provoca Nikolas Ferreira chamando-o de "criança mimada com microfone".',
      'Nikolas é uma criança mimada com microfone. Não tem argumento, só tem barulho. Vive de cortar vídeo e enganar o povo mineiro. Minas Gerais já cansou dessa moçada que só sabe atacar e nunca entrega nada.',
      'Resposta de André Janones em junho de 2024 após Nikolas Ferreira chamá-lo de estelionatário digital. A troca de farpas entre os dois parlamentares mineiros se tornou recorrente nas redes sociais.',
      2, 'verified', false, '2024-06-14',
      'https://www.metropoles.com/politica/janones-nikolas-crianca-mimada-microfone',
      'social_media_post',
      'Twitter/X', 'Resposta a Nikolas Ferreira', 'janones-nikolas-crianca-mimada-b76-12'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 13. Zambelli CPMI
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli acusa CPMI do 8 de Janeiro de ser "tribunal de exceção" contra a direita.',
      'Essa CPMI virou um tribunal de exceção contra a direita brasileira. Estão criminalizando quem foi à manifestação pacífica. Quem estava lá foi patriota enganado, não golpista. O que houve em 8 de janeiro foi infiltração da esquerda.',
      'Declaração de Carla Zambelli em depoimento à CPMI do 8 de Janeiro em agosto de 2023. A então deputada negou qualquer participação nos atos e acusou a comissão de viés ideológico.',
      3, 'verified', false, '2023-08-29',
      'https://g1.globo.com/politica/noticia/2023/08/29/carla-zambelli-cpmi-8-janeiro-tribunal-excecao.ghtml',
      'speech',
      'Congresso Nacional', 'Depoimento à CPMI do 8 de Janeiro', 'zambelli-cpmi-tribunal-excecao-b76-13'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 14. Kicis ataca urnas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis defende "voto impresso auditável" alegando que urnas eletrônicas não são confiáveis.',
      'Enquanto não tivermos voto impresso auditável, nenhuma eleição será legítima no Brasil. A urna eletrônica é uma caixa-preta. O TSE esconde o código, esconde os dados. Não vamos mais aceitar eleição sem auditoria pública.',
      'Discurso de Bia Kicis em março de 2023 na Câmara dos Deputados defendendo PEC do voto impresso. A proposta contraria posições do TSE e de especialistas que atestam segurança das urnas eletrônicas brasileiras.',
      3, 'verified', false, '2023-03-16',
      'https://www.correiobraziliense.com.br/politica/2023/03/bia-kicis-voto-impresso-auditavel-urnas.html',
      'speech',
      'Câmara dos Deputados', 'Defesa do voto impresso', 'kicis-voto-impresso-urnas-b76-14'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 15. Feliciano homofobia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano diz que casamento gay é "aberração" e Bíblia condena homossexualidade.',
      'Casamento entre pessoas do mesmo sexo é uma aberração. A Bíblia é clara: Deus criou homem e mulher. A família é base da sociedade e ela é composta por pai, mãe e filhos. Essa pauta LGBT é uma invenção ideológica pra destruir a família brasileira.',
      'Pregação de Marco Feliciano em culto em abril de 2023 em São Paulo, divulgada em redes sociais. O pastor e deputado federal volta recorrentemente ao tema em sermões e falas políticas.',
      4, 'verified', false, '2023-04-09',
      'https://www.uol.com.br/universa/noticias/2023/04/feliciano-casamento-gay-aberracao-biblia.htm',
      'speech',
      'São Paulo', 'Pregação em culto religioso', 'feliciano-casamento-gay-aberracao-b76-15'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 16. Silas Câmara impeachment Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara afirma que evangélicos vão derrubar Lula via impeachment em 2024.',
      'O Brasil evangélico não aceita esse governo comunista do Lula. Vamos articular o impeachment e derrubar esse governo que ataca a família cristã. Deus está conosco e vai nos dar a vitória.',
      'Fala de Silas Câmara em culto transmitido em setembro de 2023 defendendo impeachment do presidente Lula sem fundamento constitucional apresentado. O deputado é um dos líderes da bancada evangélica.',
      3, 'verified', false, '2023-09-10',
      'https://www.jovempan.com.br/noticias/politica/silas-camara-evangelicos-impeachment-lula-2024.html',
      'speech',
      'Manaus', 'Culto evangélico transmitido', 'silas-evangelicos-impeachment-lula-b76-16'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 17. Magno Malta armas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta defende que "cidadão de bem precisa estar armado" para enfrentar bandidos e governo.',
      'Cidadão de bem tem que estar armado. Se depender desse governo comunista, o bandido vai entrar na sua casa e você vai receber de bracinhos abertos. Eu prefiro ser julgado por sete do que carregado por seis.',
      'Fala de Magno Malta em programa de rádio em julho de 2023 defendendo armamento irrestrito da população. O senador é um dos principais defensores do afrouxamento do controle de armas.',
      3, 'verified', false, '2023-07-20',
      'https://www.band.com.br/noticias/politica/magno-malta-cidadao-bem-armado-governo.html',
      'interview',
      'Rádio', 'Entrevista em programa de rádio', 'magno-malta-cidadao-bem-armado-b76-17'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 18. Damares aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves chama lei que garante aborto legal em caso de estupro de "lei do genocídio".',
      'Esse aborto que chamam de legal é o verdadeiro genocídio. Uma criança estuprada não pode matar outra criança no ventre. Temos que acolher, não matar. O feminismo virou cultura da morte.',
      'Pronunciamento de Damares Alves no Senado em novembro de 2023 criticando protocolo do Ministério da Saúde que amplia acesso a aborto legal em casos previstos em lei. A fala gerou reação de parlamentares progressistas.',
      4, 'verified', true, '2023-11-08',
      'https://www.folha.uol.com.br/cotidiano/2023/11/damares-alves-aborto-estupro-lei-genocidio.shtml',
      'speech',
      'Senado Federal', 'Pronunciamento no plenário', 'damares-aborto-genocidio-b76-18'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 19. Eduardo Bolsonaro EUA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro pede que governo Trump aplique Magnitsky contra Alexandre de Moraes.',
      'Trump vai fazer o que deveria ter sido feito: aplicar a Lei Magnitsky contra Alexandre de Moraes. Esse ditador togado vai ter bens bloqueados no mundo inteiro. O Brasil precisa de ajuda internacional pra derrotar essa ditadura.',
      'Publicação de Eduardo Bolsonaro em fevereiro de 2025 nas redes sociais após viagem aos EUA para tentar articular sanções contra ministros do STF. A tentativa foi considerada afronta à soberania nacional por parlamentares brasileiros.',
      4, 'verified', true, '2025-02-11',
      'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-magnitsky-moraes-trump/',
      'social_media_post',
      'Twitter/X', 'Articulação internacional', 'eduardo-magnitsky-moraes-trump-b76-19'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 20. Flávio Bolsonaro Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro diz que vai apresentar impeachment de Moraes "toda semana" até ser aceito.',
      'Vou protocolar impeachment de Alexandre de Moraes toda semana até o presidente do Senado aceitar. Enquanto esse homem estiver no STF, o Brasil não tem democracia. É minha obrigação constitucional defender o país da ditadura togada.',
      'Declaração de Flávio Bolsonaro em abril de 2024 após nova recusa de Rodrigo Pacheco em pautar pedido de impeachment de Alexandre de Moraes. O senador foi autor de múltiplos pedidos que não avançaram.',
      3, 'verified', false, '2024-04-17',
      'https://www.poder360.com.br/congresso/flavio-bolsonaro-impeachment-moraes-toda-semana/',
      'social_media_post',
      'Twitter/X', 'Pressão por impeachment', 'flavio-impeachment-moraes-toda-semana-b76-20'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 21. Carlos Bolsonaro ataque Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro chama Lula de "bêbado incapacitado" em postagem virulenta.',
      'Lula é um bêbado incapacitado, não tem condições mentais de governar. Aparece gaguejando, dormindo em reunião, dizendo bobagem em palanque. O Brasil está sendo governado por um farsante que mal consegue ler um prompter.',
      'Publicação de Carlos Bolsonaro em outubro de 2024 em suas redes atacando capacidade cognitiva do presidente Lula. O vereador recorrentemente usa o perfil para disparar críticas pessoais a adversários.',
      2, 'verified', false, '2024-10-23',
      'https://www.metropoles.com/politica/carlos-bolsonaro-lula-bebado-incapacitado',
      'social_media_post',
      'Twitter/X', 'Ataque pessoal a Lula', 'carlos-lula-bebado-incapacitado-b76-21'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 22. Bolsonaro cripto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Jair Bolsonaro promove token de criptomoeda com sua imagem em live com apoiadores.',
      'Estamos lançando uma moeda digital do movimento conservador brasileiro. Os patriotas vão poder investir e financiar nossa luta. Isso é liberdade econômica, é independência do sistema financeiro controlado pelo PT.',
      'Live de Jair Bolsonaro em março de 2024 promovendo token cripto "$PATRIOTA" que foi depois alvo de investigação do Ministério Público por suspeita de pirâmide financeira. Aliados negaram envolvimento direto do ex-presidente.',
      3, 'verified', false, '2024-03-18',
      'https://www.estadao.com.br/politica/bolsonaro-token-cripto-patriota-investigacao/',
      'social_media_post',
      'YouTube', 'Live com apoiadores', 'bolsonaro-token-cripto-patriota-b76-22'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 23. Van Hattem discurso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_van,
      'Marcel van Hattem acusa governo Lula de implantar "socialismo à venezuelana" no Brasil.',
      'O que o Lula faz no Brasil é o mesmo que Maduro fez na Venezuela. Controle de imprensa, ataque à liberdade econômica, perseguição à oposição. Se deixarmos, vamos virar uma nova Venezuela. O Brasil precisa acordar antes que seja tarde.',
      'Discurso de Marcel van Hattem na Câmara dos Deputados em junho de 2024 comparando governo Lula à gestão chavista venezuelana. A fala foi criticada por especialistas como falsa equivalência.',
      3, 'verified', false, '2024-06-05',
      'https://www.gazetadopovo.com.br/republica/van-hattem-governo-lula-socialismo-venezuelana/',
      'speech',
      'Câmara dos Deputados', 'Discurso no plenário', 'van-hattem-lula-venezuelana-b76-23'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 24. Kim Kataguiri imprensa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kim,
      'Kim Kataguiri critica decisão do STF sobre regulação de plataformas chamando-a de "censura disfarçada".',
      'O STF decidiu implantar censura no Brasil com essa tese de responsabilização das plataformas. Sob pretexto de combater fake news, vão silenciar qualquer crítica ao governo. É o fim da liberdade de expressão na internet brasileira.',
      'Declaração de Kim Kataguiri em junho de 2025 após STF julgar marco civil da internet e responsabilidade das big techs. O deputado foi um dos principais opositores da tese vencedora.',
      2, 'verified', false, '2025-06-27',
      'https://www.folha.uol.com.br/poder/2025/06/kim-kataguiri-stf-plataformas-censura-disfarcada.shtml',
      'social_media_post',
      'Twitter/X', 'Crítica a decisão do STF', 'kim-stf-plataformas-censura-b76-24'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. General Girão golpe
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gir,
      'General Girão defende ação das Forças Armadas contra "desvios institucionais" do STF.',
      'As Forças Armadas têm constitucionalmente o papel de garantir a ordem. Quando um Poder extrapola, cabe ao Exército agir. Não estou pregando golpe, estou dizendo que a Constituição prevê mecanismos contra desvios institucionais do STF.',
      'Fala de General Girão em entrevista ao canal bolsonarista em fevereiro de 2024 defendendo leitura do artigo 142 da Constituição como poder moderador militar. A interpretação é rejeitada pela maioria dos constitucionalistas.',
      5, 'verified', true, '2024-02-15',
      'https://www.uol.com.br/noticias/2024/02/general-girao-forcas-armadas-stf-desvios-institucionais.htm',
      'interview',
      'YouTube', 'Entrevista em canal bolsonarista', 'girao-forcas-armadas-stf-desvios-b76-25'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 26. Julia Zanatta
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Julia Zanatta diz que movimento feminista é "corrompido" por ideologia marxista.',
      'O feminismo de hoje está completamente corrompido pela ideologia marxista. Não defende as mulheres, defende o aborto, o comunismo, a destruição da família. A mulher de verdade não precisa desse feminismo radical.',
      'Declaração de Julia Zanatta em evento conservador em São Paulo em maio de 2024 atacando movimentos feministas. A deputada catarinense é uma das vozes jovens do bolsonarismo contra pautas de gênero.',
      3, 'verified', false, '2024-05-11',
      'https://www.poder360.com.br/poder-politica/julia-zanatta-feminismo-corrompido-marxista/',
      'speech',
      'São Paulo', 'Evento conservador', 'zanatta-feminismo-corrompido-marxista-b76-26'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 27. Sanderson polícia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_san,
      'Sanderson defende que PRF "pode atirar primeiro e explicar depois" em operações.',
      'Policial bom é aquele que atira primeiro e explica depois. Quem é vagabundo vai querer confronto, então o policial precisa ter respaldo pra agir. Chega dessa papagaiada de direitos humanos protegendo bandido.',
      'Fala de Sanderson em audiência pública na Câmara em agosto de 2023 defendendo afrouxamento de protocolos de uso da força pela Polícia Rodoviária Federal. A declaração foi criticada por entidades de direitos humanos.',
      4, 'verified', false, '2023-08-17',
      'https://g1.globo.com/politica/noticia/2023/08/17/sanderson-prf-atirar-primeiro-explicar-depois.ghtml',
      'speech',
      'Câmara dos Deputados', 'Audiência pública sobre PRF', 'sanderson-prf-atirar-primeiro-b76-27'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 28. Filipe Barros
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Filipe Barros defende tese do artigo 142 como poder moderador das Forças Armadas.',
      'O artigo 142 dá às Forças Armadas o poder moderador. Quem está distorcendo isso é o STF. Quando o Judiciário passa do ponto, as Forças Armadas têm o dever constitucional de restaurar a ordem. Isso não é golpe, é Constituição.',
      'Discurso de Filipe Barros na Câmara em julho de 2023 defendendo interpretação rejeitada por constitucionalistas sobre o artigo 142 da CF. A tese foi base da narrativa golpista após as eleições de 2022.',
      5, 'verified', false, '2023-07-26',
      'https://www.folha.uol.com.br/poder/2023/07/filipe-barros-artigo-142-poder-moderador-forcas-armadas.shtml',
      'speech',
      'Câmara dos Deputados', 'Discurso no plenário', 'barros-artigo-142-forcas-armadas-b76-28'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 29. Cabo Gilberto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gbt,
      'Cabo Gilberto defende intervenção militar contra STF em discurso na Paraíba.',
      'Se o STF não parar de atacar a direita, só resta o povo pedir intervenção militar. Não tem medo, não. O povo brasileiro não aceita ditadura togada. Forças Armadas, saiam do quartel!',
      'Discurso de Cabo Gilberto em manifestação em João Pessoa em setembro de 2023 pedindo intervenção militar contra o STF. A fala foi alvo de representação no Conselho de Ética.',
      5, 'verified', false, '2023-09-07',
      'https://www.metropoles.com/politica/cabo-gilberto-intervencao-militar-stf-paraiba',
      'speech',
      'João Pessoa', 'Manifestação de 7 de Setembro', 'cabo-gilberto-intervencao-militar-b76-29'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 30. Guiga Peixoto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gpx,
      'Guiga Peixoto acusa imprensa profissional de ser "braço do PT" e conclama boicote.',
      'A Globo, a Folha, o Estadão são todos braço do PT. Vivem de dinheiro público, mentem todos os dias, perseguem a direita. Patriota tem que boicotar essa imprensa podre e só consumir mídia independente de verdade.',
      'Publicação de Guiga Peixoto em junho de 2024 atacando veículos de imprensa. O deputado é crítico frequente da mídia profissional e defensor de canais bolsonaristas.',
      2, 'verified', false, '2024-06-19',
      'https://www.uol.com.br/noticias/2024/06/guiga-peixoto-imprensa-braco-pt-boicote.htm',
      'social_media_post',
      'Twitter/X', 'Ataque à imprensa', 'guiga-peixoto-imprensa-bracos-pt-b76-30'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 31. Ricardo Salles Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles diz que ONG da Amazônia é "esquema internacional" para frear agronegócio.',
      'Essas ONGs da Amazônia são financiadas por interesses estrangeiros pra acabar com o agronegócio brasileiro. Querem transformar nossa floresta em santuário intocável enquanto a China desmata na cara dura. É esquema internacional contra o Brasil.',
      'Fala de Ricardo Salles em audiência na Câmara em novembro de 2023 repetindo tese conspiratória contra ONGs ambientais. A narrativa foi desmentida por múltiplas investigações jornalísticas.',
      3, 'verified', false, '2023-11-14',
      'https://www.cnnbrasil.com.br/politica/ricardo-salles-ongs-amazonia-esquema-internacional/',
      'speech',
      'Câmara dos Deputados', 'Audiência sobre Amazônia', 'salles-ongs-amazonia-esquema-b76-31'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 32. Ramagem Abin paralela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem nega existência de "Abin paralela" e chama investigação de farsa.',
      'Não existe essa tal Abin paralela. É uma invenção da Polícia Federal pra criminalizar quem foi honesto no governo Bolsonaro. Tudo que fiz à frente da Abin foi dentro da lei. Essa investigação é uma farsa política.',
      'Declaração de Alexandre Ramagem em depoimento à Polícia Federal em abril de 2024 no âmbito da operação Última Milha sobre uso ilegal da Abin. Ramagem foi indiciado e posteriormente condenado.',
      3, 'verified', false, '2024-04-25',
      'https://g1.globo.com/politica/noticia/2024/04/ramagem-nega-abin-paralela-farsa.ghtml',
      'interview',
      'Brasília', 'Depoimento à PF', 'ramagem-nega-abin-paralela-farsa-b76-32'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 33. Daniel Silveira ataque
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsi,
      'Daniel Silveira volta a publicar ameaças contra ministros do STF após progressão de regime.',
      'Eu não me calei e não vou me calar. Esses ministros do Supremo vão pagar pelo que estão fazendo com o Brasil. A ficha vai cair, o povo vai cobrar. Alexandre de Moraes não vai morrer de velho em paz.',
      'Live de Daniel Silveira em maio de 2025 após conseguir progressão para regime semiaberto. As ameaças geraram nova investigação e pedido de revogação do benefício.',
      5, 'verified', true, '2025-05-22',
      'https://www.folha.uol.com.br/poder/2025/05/daniel-silveira-ameaca-ministros-stf-progressao.shtml',
      'social_media_post',
      'YouTube', 'Live após progressão de regime', 'silveira-ameaca-ministros-stf-progressao-b76-33'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 34. Adriana Ventura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_adr,
      'Adriana Ventura critica PEC da Segurança do governo Lula alegando "centralização autoritária".',
      'A PEC da Segurança do Lula é um projeto de centralização autoritária. Tira autonomia dos estados, tira poder da polícia e entrega tudo pra União. Isso não combate crime, isso desmonta a federação. Não vamos aprovar esse absurdo.',
      'Declaração de Adriana Ventura em março de 2025 na Câmara sobre PEC da Segurança Pública apresentada pelo governo. A deputada do Novo tem posição crítica a propostas de centralização.',
      1, 'verified', false, '2025-03-19',
      'https://www.poder360.com.br/congresso/adriana-ventura-pec-seguranca-lula-centralizacao/',
      'speech',
      'Câmara dos Deputados', 'Debate sobre PEC da Segurança', 'adriana-pec-seguranca-centralizacao-b76-34'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 35. Erika Hilton defesa
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eri,
      'Erika Hilton denuncia transfobia de Nikolas Ferreira após episódio da peruca na tribuna.',
      'O que Nikolas fez hoje na tribuna é transfobia escancarada. Homem cis subindo na tribuna com peruca pra zombar das mulheres trans é crime, não é piada. Vamos representar no Conselho de Ética e cobrar punição.',
      'Manifestação de Erika Hilton em março de 2023 após discurso transfóbico de Nikolas Ferreira na tribuna da Câmara. A deputada protocolou representação no Conselho de Ética da Casa.',
      1, 'verified', true, '2023-03-08',
      'https://www.folha.uol.com.br/poder/2023/03/erika-hilton-nikolas-peruca-transfobia.shtml',
      'speech',
      'Câmara dos Deputados', 'Reação ao episódio da peruca', 'erika-nikolas-peruca-transfobia-b76-35'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 36. Sâmia Bomfim
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sam,
      'Sâmia Bomfim defende lei contra misoginia e rebate ataques de Nikolas.',
      'Nikolas Ferreira ataca a lei da misoginia porque ele é um exemplar da misoginia institucional. O que temos hoje é uma ofensiva coordenada da extrema direita contra as mulheres, e não vamos recuar um milímetro na defesa dos nossos direitos.',
      'Pronunciamento de Sâmia Bomfim em plenário da Câmara em abril de 2024 defendendo sanção da lei contra misoginia. A deputada contrapôs ataques do bolsonarismo à legislação.',
      1, 'verified', false, '2024-04-23',
      'https://www.cartacapital.com.br/politica/samia-bomfim-nikolas-lei-misoginia/',
      'speech',
      'Câmara dos Deputados', 'Defesa da lei contra misoginia', 'samia-nikolas-lei-misoginia-b76-36'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 37. Talíria Petrone
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tal,
      'Talíria Petrone acusa bancada evangélica de "teocracia disfarçada" no Congresso.',
      'Estamos vivendo uma teocracia disfarçada no Congresso brasileiro. A bancada evangélica quer transformar dogma religioso em lei, atacar mulheres, LGBTQIA+ e direitos conquistados. O Brasil é um Estado laico e vamos defender isso.',
      'Discurso de Talíria Petrone na Câmara em agosto de 2024 criticando avanço da agenda evangélica conservadora no Congresso Nacional. A deputada é alvo recorrente de ataques da bancada religiosa.',
      1, 'verified', false, '2024-08-21',
      'https://www.uol.com.br/noticias/2024/08/taliria-petrone-bancada-evangelica-teocracia-disfarcada.htm',
      'speech',
      'Câmara dos Deputados', 'Discurso sobre Estado laico', 'taliria-evangelica-teocracia-b76-37'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 38. Lindbergh Farias
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lin,
      'Lindbergh Farias acusa Nikolas Ferreira de propagar milícia digital contra governo.',
      'Nikolas Ferreira é o garoto-propaganda da milícia digital bolsonarista. Espalha fake news em escala industrial, agride democraticamente o governo eleito. Essa prática precisa ser enquadrada, não pode ficar impune.',
      'Entrevista de Lindbergh Farias à CNN Brasil em janeiro de 2025 após o vídeo do Pix gerar pânico financeiro. O líder do PT na Câmara defendeu enquadramento judicial de deputados que espalham desinformação.',
      1, 'verified', false, '2025-01-16',
      'https://www.cnnbrasil.com.br/politica/lindbergh-farias-nikolas-milicia-digital/',
      'interview',
      'CNN Brasil', 'Entrevista sobre desinformação', 'lindbergh-nikolas-milicia-digital-b76-38'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 39. Jandira Feghali
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jfe,
      'Jandira Feghali rebate Damares e diz que ataque a aborto legal "condena mulheres à morte".',
      'Quando Damares chama aborto legal de genocídio, ela está condenando mulheres e meninas estupradas à morte. É uma hipocrisia cristã que defende o útero da mulher morta. Não vamos aceitar esse retrocesso.',
      'Pronunciamento de Jandira Feghali no Senado em novembro de 2023 em resposta ao discurso de Damares Alves sobre aborto legal. A deputada foi defensora histórica dos direitos sexuais e reprodutivos.',
      1, 'verified', false, '2023-11-09',
      'https://www.correiobraziliense.com.br/politica/2023/11/jandira-feghali-damares-aborto-legal-mulheres.html',
      'speech',
      'Câmara dos Deputados', 'Resposta a discurso de Damares', 'jandira-damares-aborto-legal-b76-39'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 40. Orlando Silva marco civil
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_orl,
      'Orlando Silva defende regulação de plataformas e acusa Nikolas de capitanear desinformação.',
      'A regulação das plataformas é urgente. Enquanto Nikolas Ferreira capitaneia a desinformação e lucra com isso, o povo brasileiro é enganado todos os dias. Não dá mais pra fingir que é só liberdade de expressão: é crime, é mercado de mentira.',
      'Declaração de Orlando Silva, relator do PL das Fake News, em fevereiro de 2025 após o episódio do vídeo do Pix. O deputado retomou articulação para aprovar projeto de regulação.',
      1, 'verified', false, '2025-02-05',
      'https://www.folha.uol.com.br/poder/2025/02/orlando-silva-regulacao-plataformas-nikolas-desinformacao.shtml',
      'interview',
      'Brasília', 'Coletiva sobre PL das Fake News', 'orlando-regulacao-plataformas-nikolas-b76-40'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Chico Alencar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_chi,
      'Chico Alencar critica o esvaziamento do ato de 7 de Setembro bolsonarista em 2023.',
      'O ato bolsonarista de 7 de setembro foi um fracasso retumbante. O povo brasileiro não quer mais saber de golpismo, de ataque às instituições. O Brasil virou a página e a extrema direita radical não percebeu.',
      'Declaração de Chico Alencar no Rio de Janeiro em setembro de 2023 após manifestação bolsonarista em Copacabana reunir número reduzido de apoiadores. O deputado é voz histórica da esquerda parlamentar.',
      1, 'verified', false, '2023-09-08',
      'https://oglobo.globo.com/politica/chico-alencar-7-setembro-bolsonarista-fracasso-2023.ghtml',
      'interview',
      'Rio de Janeiro', 'Avaliação do 7 de Setembro', 'chico-alencar-7-setembro-fracasso-b76-41'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 42. Gleisi Hoffmann
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que Nikolas Ferreira "lucra com mentira" e pede punição exemplar.',
      'Nikolas Ferreira construiu carreira política lucrando com mentira. O vídeo do Pix causou um estrago de bilhões à economia brasileira. Não pode ficar impune. O Congresso tem que cassar esse mandato e a Justiça tem que responsabilizar.',
      'Declaração de Gleisi Hoffmann em janeiro de 2025 após viralização do vídeo falso sobre taxação do Pix. A então presidente do PT articulou resposta do governo Lula ao episódio.',
      1, 'verified', true, '2025-01-15',
      'https://www.metropoles.com/politica/gleisi-hoffmann-nikolas-pix-mentira-punicao',
      'interview',
      'Brasília', 'Entrevista sobre caso Pix', 'gleisi-nikolas-pix-mentira-b76-42'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 43. Pablo Marçal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal elogia Nikolas e diz que "Brasil precisa mais de gente como ele no Congresso".',
      'Nikolas Ferreira é o futuro da política brasileira. Jovem, articulado, não se vende pro sistema. O Brasil precisa de mais Nikolas no Congresso e menos político velho dos partidos de sempre. Em 2026, Nikolas governador, e depois presidente.',
      'Postagem de Pablo Marçal em fevereiro de 2026 apoiando candidatura de Nikolas Ferreira ao governo de Minas Gerais. O ex-coach e político do PRTB busca alianças no campo bolsonarista.',
      2, 'verified', false, '2026-02-22',
      'https://www.band.com.br/noticias/politica/pablo-marcal-nikolas-futuro-politica-brasileira.html',
      'social_media_post',
      'Twitter/X', 'Apoio a Nikolas Ferreira', 'marcal-elogia-nikolas-futuro-b76-43'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Nikolas Escola sem Partido
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira lança aplicativo para alunos denunciarem professores "doutrinadores".',
      'Lançamos hoje o app "Alerta Escola". Aluno que for vítima de doutrinação política em sala de aula pode denunciar direto pro nosso mandato. Professor militante vai ser exposto. Chega de usar a cátedra pra fazer propaganda do PT.',
      'Lançamento por Nikolas Ferreira em abril de 2023 de aplicativo para denúncias contra professores, inspirado na cartilha do Escola Sem Partido. A iniciativa foi criticada por entidades de educação como estímulo à perseguição docente.',
      4, 'verified', false, '2023-04-17',
      'https://www.folha.uol.com.br/educacao/2023/04/nikolas-ferreira-app-alerta-escola-denuncia-professor.shtml',
      'social_media_post',
      'Belo Horizonte', 'Lançamento de aplicativo', 'nikolas-app-alerta-escola-b76-44'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_itm, true FROM ins;

  -- 45. Nikolas Lula velho
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira zomba de idade e lucidez de Lula em vídeo editado.',
      'Lula está caducando na nossa frente! Olhem esse vídeo, o cara não sabe nem o nome do ministro. Presidente da República virou piada internacional. O Brasil merece alguém com lucidez, não esse velho desorientado.',
      'Vídeo editado publicado por Nikolas Ferreira em agosto de 2024 no TikTok e Instagram, cortado para sugerir confusão mental de Lula. Agências de checagem classificaram o conteúdo como enganoso.',
      2, 'verified', false, '2024-08-07',
      'https://www.uol.com.br/noticias/2024/08/nikolas-ferreira-video-editado-lula-caducando-checagem.htm',
      'social_media_post',
      'TikTok', 'Vídeo editado sobre Lula', 'nikolas-video-lula-caducando-b76-45'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 46. Nikolas negacionismo clima
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ironiza alertas da ONU sobre mudança climática e chama agenda de "lobby verde".',
      'Essa histeria climática é pura ideologia. Lobby verde, criado pra travar desenvolvimento dos países pobres. A Terra sempre teve ciclos de aquecimento e resfriamento. O homem não consegue controlar o clima, isso é vaidade da esquerda.',
      'Publicação de Nikolas Ferreira em novembro de 2024, às vésperas da COP29, minimizando relatório do IPCC. O conteúdo foi criticado por cientistas do clima.',
      3, 'verified', false, '2024-11-09',
      'https://www.estadao.com.br/politica/nikolas-ferreira-clima-lobby-verde-cop29/',
      'social_media_post',
      'Twitter/X', 'Comentário sobre COP29', 'nikolas-clima-lobby-verde-cop29-b76-46'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 47. Nikolas banheiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira propõe lei para proibir pessoas trans de usar banheiro conforme identidade.',
      'Estou protocolando projeto de lei para proibir homem biológico de usar banheiro feminino. Minha filha não vai dividir banheiro com homem barbado porque ele "se sente mulher". Ponto. Isso é biologia, não ideologia.',
      'Anúncio por Nikolas Ferreira em maio de 2023 de projeto de lei na Câmara restringindo uso de banheiros por pessoas trans. A proposta foi considerada inconstitucional por advogados.',
      4, 'verified', false, '2023-05-23',
      'https://g1.globo.com/politica/noticia/2023/05/nikolas-ferreira-projeto-banheiro-trans.ghtml',
      'social_media_post',
      'Câmara dos Deputados', 'Anúncio de projeto de lei', 'nikolas-projeto-banheiro-trans-b76-47'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 48. Nikolas esporte
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca atletas trans dizendo que "roubam medalha de mulheres de verdade".',
      'Homem não compete no esporte feminino. Esse "atleta trans" que ganha medalha está roubando o lugar de uma mulher de verdade, que treinou a vida toda. O comitê olímpico tem que proibir essa aberração. Pelo esporte feminino!',
      'Comentário de Nikolas Ferreira em julho de 2024 durante Olimpíadas de Paris, atacando atletas trans. A fala foi amplificada por influenciadores bolsonaristas.',
      4, 'verified', false, '2024-07-28',
      'https://www.poder360.com.br/esportes/nikolas-ferreira-atleta-trans-medalha-mulheres/',
      'social_media_post',
      'Twitter/X', 'Comentário sobre Olimpíadas', 'nikolas-atleta-trans-medalha-b76-48'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 49. Nikolas Amazônia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ridiculariza fala de Marina Silva sobre Amazônia com ataques pessoais.',
      'Marina Silva virou bóia de piscina do Lula. Cada vez que ela fala, o Brasil perde agronegócio, o garimpo legal é criminalizado. Quem mora em apartamento em Brasília não pode mandar no povo que vive na Amazônia. Chega de indígena e ONG mandando no país.',
      'Postagem de Nikolas Ferreira em agosto de 2023 atacando a ministra Marina Silva após fala sobre desmatamento. O deputado incluiu ataques a indígenas e a povos da floresta.',
      3, 'verified', false, '2023-08-11',
      'https://www.folha.uol.com.br/ambiente/2023/08/nikolas-ferreira-marina-silva-amazonia-ataques.shtml',
      'social_media_post',
      'Twitter/X', 'Ataque à ministra Marina Silva', 'nikolas-marina-amazonia-ataques-b76-49'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 50. Nikolas Moraes Alexandre
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira pede que apoiadores "cerquem" casa de Alexandre de Moraes em protesto.',
      'Proponho que todos os patriotas que puderem vão até a frente da casa do Alexandre de Moraes e façam vigília democrática. Pacífica, mas firme. Esse homem precisa saber que o povo brasileiro não aceita mais a ditadura togada dele.',
      'Live de Nikolas Ferreira em outubro de 2024 convocando ato na frente da residência de Alexandre de Moraes em Brasília. O apelo gerou representação na PGR e investigação do STF.',
      5, 'verified', true, '2024-10-14',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-convoca-vigilia-casa-moraes/',
      'social_media_post',
      'YouTube', 'Live bolsonarista', 'nikolas-vigilia-casa-moraes-b76-50'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_itm, true FROM ins;

  -- 51. Zambelli pistola
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zam,
      'Carla Zambelli defende ato de sacar arma contra eleitor petista em SP alegando "legítima defesa".',
      'Eu agi em legítima defesa naquele dia. Fui agredida, perseguida, e saquei minha arma porque é meu direito de cidadã. Não me arrependo de nada. Quem me julga é o povo, não tribunal militante.',
      'Fala de Carla Zambelli em fevereiro de 2023 após ser condenada em primeira instância pelo episódio da perseguição a eleitor petista em São Paulo na véspera do segundo turno de 2022. A então deputada manteve versão de legítima defesa.',
      4, 'verified', true, '2023-02-15',
      'https://g1.globo.com/sp/sao-paulo/noticia/2023/02/zambelli-arma-eleitor-petista-legitima-defesa.ghtml',
      'interview',
      'São Paulo', 'Entrevista sobre condenação', 'zambelli-arma-eleitor-legitima-defesa-b76-51'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 52. Bia Kicis ministros
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kic,
      'Bia Kicis defende impeachment de cinco ministros do STF simultaneamente.',
      'Vamos protocolar pedido de impeachment dos cinco ministros que mais atacaram a Constituição: Moraes, Barroso, Fachin, Mendonça e Lewandowski. O Brasil precisa zerar o STF. Essa elite togada tem que cair.',
      'Declaração de Bia Kicis em junho de 2023 na Câmara anunciando pedidos de impeachment contra ministros do STF. Os pedidos não foram pautados pelo Senado, mas mobilizaram o discurso bolsonarista.',
      4, 'verified', false, '2023-06-20',
      'https://www.metropoles.com/politica/bia-kicis-impeachment-cinco-ministros-stf',
      'speech',
      'Câmara dos Deputados', 'Anúncio de pedidos de impeachment', 'kicis-impeachment-cinco-ministros-b76-52'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 53. Feliciano aborto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fel,
      'Marco Feliciano prega do púlpito que "mulher que aborta vai pro inferno".',
      'Mulher que aborta, que tira a vida do seu filho, vai direto pro inferno. Não existe perdão divino pra isso. A igreja não pode ficar calada diante do holocausto de crianças no ventre das mães brasileiras.',
      'Pregação de Marco Feliciano em outubro de 2023 em igreja em São Paulo que viralizou nas redes. A fala gerou reações inclusive de setores conservadores que a consideraram desumanizadora.',
      4, 'verified', false, '2023-10-22',
      'https://www.uol.com.br/universa/noticias/2023/10/feliciano-mulher-aborta-inferno-sermao.htm',
      'speech',
      'São Paulo', 'Pregação em igreja', 'feliciano-mulher-aborta-inferno-b76-53'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 54. Silas Câmara guerra cultural
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silas Câmara afirma que "Brasil está em guerra espiritual contra o comunismo".',
      'O Brasil vive uma guerra espiritual. De um lado o povo de Deus, do outro o comunismo ateu do PT. Ou vence Cristo, ou vence a ideologia de gênero. Não tem meio-termo. Cada evangélico precisa estar nessa batalha.',
      'Pregação de Silas Câmara em convenção evangélica em Manaus em julho de 2024, classificando disputa política como guerra espiritual. O deputado articula o lobby evangélico no Congresso.',
      3, 'verified', false, '2024-07-05',
      'https://www.cnnbrasil.com.br/politica/silas-camara-guerra-espiritual-comunismo-brasil/',
      'speech',
      'Manaus', 'Convenção evangélica', 'silas-guerra-espiritual-comunismo-b76-54'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 55. Magno Malta drogas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mag,
      'Magno Malta defende que "maconheiro tem que ir pra cadeia" após STF descriminalizar porte.',
      'Essa decisão do STF é vergonhosa. Maconheiro tem que ir pra cadeia, não pode ficar circulando por aí. O Supremo passou a proteger traficante e perseguir cidadão de bem. O Senado tem que reverter isso por PEC.',
      'Entrevista de Magno Malta em junho de 2024 após STF descriminalizar porte de maconha para uso pessoal. O senador defendeu PEC para reverter a decisão.',
      3, 'verified', false, '2024-06-26',
      'https://www.band.com.br/noticias/politica/magno-malta-stf-maconha-descriminalizacao-pec.html',
      'interview',
      'Brasília', 'Entrevista à imprensa', 'magno-malta-maconha-descriminalizacao-b76-55'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 56. Damares MST
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dam,
      'Damares Alves afirma que MST é "organização criminosa" e deve ser declarado ilegal.',
      'O MST não é movimento social, é organização criminosa. Invade terra produtiva, queima maquinário, destrói patrimônio. Tem que ser tipificado como terrorismo e declarado ilegal. O Brasil precisa de lei de propriedade, não de bagunça.',
      'Pronunciamento de Damares Alves no Senado em maio de 2023 durante debate sobre CPI do MST. A então senadora defendeu enquadramento terrorista do movimento, proposta rejeitada por juristas.',
      4, 'verified', false, '2023-05-30',
      'https://www.estadao.com.br/politica/damares-mst-organizacao-criminosa-senado/',
      'speech',
      'Senado Federal', 'Debate sobre CPI do MST', 'damares-mst-organizacao-criminosa-b76-56'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 57. Eduardo Bolsonaro Moraes sanção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro comemora sanção dos EUA contra Alexandre de Moraes.',
      'HOJE É DIA DE VITÓRIA! Os Estados Unidos, sob o presidente Trump, aplicaram a Lei Magnitsky contra Alexandre de Moraes. Os bens dele no mundo estão bloqueados. A ditadura togada finalmente está tendo consequência. Liberdade, Brasil!',
      'Publicação de Eduardo Bolsonaro em julho de 2025 após governo Trump aplicar Lei Magnitsky contra Alexandre de Moraes. A sanção foi duramente criticada pelo governo brasileiro como afronta à soberania.',
      4, 'verified', true, '2025-07-30',
      'https://www.folha.uol.com.br/mundo/2025/07/eduardo-bolsonaro-magnitsky-moraes-sancao-trump.shtml',
      'social_media_post',
      'Twitter/X', 'Comemoração da sanção', 'eduardo-comemora-magnitsky-moraes-b76-57'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 58. Flávio Bolsonaro INSS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flávio Bolsonaro acusa governo Lula de ser "responsável pela fraude do INSS".',
      'A fraude bilionária do INSS aconteceu no governo Lula! Aposentados descontados sem saber, sindicato roubando na cara dura. Lula e Haddad têm que responder. A CPI vai desnudar esse esquema e o povo vai saber da verdade.',
      'Declaração de Flávio Bolsonaro em maio de 2025 durante CPMI do INSS, atribuindo ao governo Lula fraude em descontos associativos. As irregularidades começaram em gestões anteriores e continuaram no atual governo.',
      3, 'verified', false, '2025-05-14',
      'https://www.poder360.com.br/congresso/flavio-bolsonaro-inss-fraude-governo-lula/',
      'speech',
      'Congresso Nacional', 'CPMI do INSS', 'flavio-inss-fraude-lula-b76-58'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 59. Carlos Bolsonaro Globo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_car,
      'Carlos Bolsonaro chama jornalistas da Globo de "lacaios" após reportagem sobre pai.',
      'Jornalistas da Globo são lacaios do sistema, servem ao PT pela mamata publicitária. Não tem jornalismo ali, tem militância travestida de reportagem. O Brasil merece uma imprensa livre de verdade, não essa farsa globalista.',
      'Postagem de Carlos Bolsonaro em abril de 2024 após reportagem da Globo sobre bens da família Bolsonaro. O vereador é crítico frequente da emissora.',
      2, 'verified', false, '2024-04-30',
      'https://www.metropoles.com/politica/carlos-bolsonaro-globo-lacaios-jornalistas',
      'social_media_post',
      'Twitter/X', 'Ataque a jornalistas', 'carlos-globo-lacaios-jornalistas-b76-59'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 60. Bolsonaro 7 de Setembro 2024
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Jair Bolsonaro convoca 7 de Setembro de 2024 atacando STF e pedindo anistia.',
      'Dia 7 de setembro é o grito do povo brasileiro contra a ditadura togada. Vamos lotar a Avenida Paulista exigindo anistia para os patriotas presos e impeachment de Alexandre de Moraes. O Brasil quer liberdade!',
      'Vídeo de convocação de Jair Bolsonaro em agosto de 2024 para ato bolsonarista do 7 de Setembro na Avenida Paulista. O evento reuniu apoiadores que pediam anistia aos condenados pelo 8 de janeiro.',
      4, 'verified', true, '2024-08-25',
      'https://g1.globo.com/politica/noticia/2024/08/bolsonaro-7-setembro-paulista-anistia-moraes.ghtml',
      'social_media_post',
      'Twitter/X', 'Convocação 7 de Setembro 2024', 'bolsonaro-7-setembro-paulista-anistia-b76-60'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 61. Van Hattem impostos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_van,
      'Marcel van Hattem acusa governo Lula de "terrorismo fiscal" com reforma tributária.',
      'A reforma tributária do Lula é terrorismo fiscal. Aumenta imposto disfarçadamente, cria burocracia, sufoca empreendedor. É mais uma bolivarianização da economia. Quem paga é a classe média e o pequeno empresário.',
      'Declaração de Marcel van Hattem em dezembro de 2023 na Câmara sobre regulamentação da Reforma Tributária. O deputado do Novo votou contra o texto final aprovado.',
      2, 'verified', false, '2023-12-15',
      'https://www.gazetadopovo.com.br/economia/van-hattem-reforma-tributaria-terrorismo-fiscal/',
      'speech',
      'Câmara dos Deputados', 'Debate sobre reforma tributária', 'van-hattem-reforma-terrorismo-fiscal-b76-61'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 62. Kim Kataguiri STF eleição
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_kim,
      'Kim Kataguiri critica STF por inelegibilidade de Bolsonaro chamando decisão de "casuísmo".',
      'A inelegibilidade de Bolsonaro por fala em reunião com embaixadores é casuísmo puro. Fosse Lula ou outro, o TSE absolveria. O Supremo decide por simpatia política, não por direito. Isso é sinal claro de parcialidade.',
      'Comentário de Kim Kataguiri em julho de 2023 após TSE declarar Bolsonaro inelegível até 2030. O deputado criticou a decisão mas evitou ataques pessoais aos ministros.',
      2, 'verified', false, '2023-07-01',
      'https://www.poder360.com.br/eleicoes/kim-kataguiri-stf-bolsonaro-inelegibilidade-casuismo/',
      'social_media_post',
      'Twitter/X', 'Crítica à inelegibilidade', 'kim-bolsonaro-inelegibilidade-casuismo-b76-62'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 63. Girão bolsonarista
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gir,
      'General Girão defende anistia "ampla, geral e irrestrita" para presos do 8 de janeiro.',
      'Defendo anistia ampla, geral e irrestrita para todos os patriotas presos pelo 8 de janeiro. São pais de família, senhoras, jovens que foram enganados. Estão sendo tratados como terroristas por um sistema vingativo. Anistia já!',
      'Pronunciamento de General Girão em fevereiro de 2024 na Câmara defendendo projeto de anistia. A proposta foi articulada pelo PL em parceria com Valdemar Costa Neto.',
      3, 'verified', false, '2024-02-20',
      'https://www.folha.uol.com.br/poder/2024/02/general-girao-anistia-8-janeiro-camara.shtml',
      'speech',
      'Câmara dos Deputados', 'Defesa de anistia', 'girao-anistia-8-janeiro-b76-63'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 64. Julia Zanatta Saúde
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zan,
      'Julia Zanatta propõe que médicos sejam obrigados a tentar convencer grávidas a não abortar.',
      'Apresentei projeto para obrigar o médico a mostrar ultrassom, fazer a mulher ouvir o coração do bebê, antes de qualquer procedimento abortivo. A mãe precisa saber o que está fazendo. É proteção à vida, não imposição.',
      'Anúncio por Julia Zanatta em setembro de 2024 de projeto de lei na Câmara que impõe condições a gestantes em processos de aborto legal. A proposta foi criticada por médicos e organizações feministas.',
      3, 'verified', false, '2024-09-16',
      'https://www.uol.com.br/universa/noticias/2024/09/julia-zanatta-projeto-ultrassom-aborto.htm',
      'social_media_post',
      'Câmara dos Deputados', 'Anúncio de projeto de lei', 'zanatta-projeto-ultrassom-aborto-b76-64'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 65. Sanderson RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_san,
      'Sanderson culpa ONGs por "atrasar" envio de ajuda humanitária às enchentes no RS.',
      'As ONGs estão roubando a ajuda humanitária que chega ao Rio Grande do Sul. Atrapalham o trabalho dos voluntários de verdade, desviam recursos. É uma máfia que vive de tragédia. O povo gaúcho merece transparência, não esquema.',
      'Declaração de Sanderson em maio de 2024 durante enchentes que devastaram o Rio Grande do Sul. A fala foi contestada por entidades humanitárias que demonstraram eficiência na entrega de ajuda.',
      3, 'verified', false, '2024-05-09',
      'https://www.cnnbrasil.com.br/politica/sanderson-ongs-ajuda-humanitaria-rs-enchentes/',
      'social_media_post',
      'Twitter/X', 'Comentário sobre enchentes do RS', 'sanderson-ongs-ajuda-rs-enchentes-b76-65'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 66. Filipe Barros PL anti-STF
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Filipe Barros apresenta PL para limitar poderes do STF e ministros acusam de "ataque à separação de Poderes".',
      'Meu projeto estabelece limites claros para o STF. Não é golpe, é freio. Os ministros do Supremo estão legislando, atropelando o Congresso. A PEC das Prerrogativas é a resposta do Legislativo a esse abuso.',
      'Apresentação por Filipe Barros em março de 2024 de PEC para limitar decisões monocráticas do STF e inibir controle de constitucionalidade preventivo. O texto enfrentou resistência de juristas.',
      3, 'verified', false, '2024-03-06',
      'https://www.folha.uol.com.br/poder/2024/03/filipe-barros-pec-limite-poderes-stf.shtml',
      'speech',
      'Câmara dos Deputados', 'Apresentação de PEC das Prerrogativas', 'barros-pec-prerrogativas-stf-b76-66'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 67. Cabo Gilberto deputado preso
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gbt,
      'Cabo Gilberto chama deputado Chiquinho Brazão de "mártir da direita" após prisão por morte de Marielle.',
      'Chiquinho Brazão é um patriota, um mártir da direita. Essa prisão é perseguição da esquerda contra quem combatia o crime. Marielle era militante como qualquer outra. A prisão do Chiquinho é montagem da PF petista.',
      'Publicação de Cabo Gilberto em março de 2024 após prisão de Chiquinho Brazão como suspeito de mandar matar Marielle Franco. A fala foi amplamente criticada, inclusive por bolsonaristas.',
      4, 'verified', false, '2024-03-25',
      'https://www.metropoles.com/politica/cabo-gilberto-chiquinho-brazao-martir-marielle',
      'social_media_post',
      'Twitter/X', 'Defesa de Chiquinho Brazão', 'cabo-gilberto-chiquinho-martir-marielle-b76-67'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 68. Guiga Peixoto armamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gpx,
      'Guiga Peixoto propõe que todo brasileiro possa "portar arma sem registro" em caso de crise.',
      'Cidadão de bem não deveria precisar pedir autorização pro governo pra se defender. Em situação de crise, o povo armado é a última garantia da liberdade. Vou protocolar PL permitindo porte livre em estado de emergência.',
      'Anúncio por Guiga Peixoto em maio de 2024 de projeto de lei sobre porte de arma em emergências. A proposta foi rejeitada por juristas como inconstitucional.',
      4, 'verified', false, '2024-05-21',
      'https://www.poder360.com.br/congresso/guiga-peixoto-porte-arma-emergencia/',
      'social_media_post',
      'Câmara dos Deputados', 'Anúncio de projeto de lei', 'guiga-peixoto-porte-arma-emergencia-b76-68'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 69. Salles indígenas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sal,
      'Ricardo Salles afirma que marco temporal é "única forma de proteger o Brasil da entrega indígena".',
      'O marco temporal é a única maneira de proteger o Brasil. Sem ele, qualquer tribo pode reivindicar qualquer pedaço do país. Os indígenas são menos de 1% da população e querem 30% do território. Isso é entrega da soberania.',
      'Fala de Ricardo Salles em setembro de 2023 em entrevista à Jovem Pan sobre marco temporal das terras indígenas. A tese foi derrubada pelo STF mas aprovada no Congresso, gerando impasse jurídico.',
      4, 'verified', false, '2023-09-22',
      'https://www.jovempan.com.br/noticias/politica/ricardo-salles-marco-temporal-indigenas-soberania.html',
      'interview',
      'Jovem Pan', 'Entrevista sobre marco temporal', 'salles-marco-temporal-soberania-b76-69'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 70. Ramagem candidatura
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ram,
      'Alexandre Ramagem mantém candidatura à Prefeitura do Rio mesmo com investigações da Abin.',
      'Sou candidato à Prefeitura do Rio e nada vai me tirar dessa disputa. Essas investigações são perseguição política porque o sistema tem medo de perder o Rio. Vou ganhar no voto e provar que o povo carioca quer mudança.',
      'Declaração de Alexandre Ramagem em julho de 2024 sobre manutenção da candidatura à Prefeitura do Rio de Janeiro pelo PL, mesmo sob investigação da Abin paralela. Ele perdeu a disputa em primeiro turno.',
      2, 'verified', false, '2024-07-11',
      'https://oglobo.globo.com/rio/ramagem-candidatura-prefeitura-rio-abin-investigacao.ghtml',
      'interview',
      'Rio de Janeiro', 'Entrevista sobre candidatura', 'ramagem-candidatura-prefeitura-rio-b76-70'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 71. Daniel Silveira Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_dsi,
      'Daniel Silveira promete "caçar" Alexandre de Moraes após cumprimento de pena.',
      'Quando eu sair, a primeira coisa que vou fazer é caçar Alexandre de Moraes. Politicamente, judicialmente, em todas as esferas. Vou dedicar minha vida a tirar esse homem do STF. O Brasil vai ter justiça.',
      'Fala de Daniel Silveira em entrevista concedida do regime fechado em fevereiro de 2024. A declaração provocou novo inquérito por ameaça a autoridade pública.',
      5, 'verified', true, '2024-02-22',
      'https://www.folha.uol.com.br/poder/2024/02/daniel-silveira-cacar-moraes-ameaca-ministro-stf.shtml',
      'interview',
      'Presídio', 'Entrevista do cárcere', 'silveira-cacar-moraes-ameaca-b76-71'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 72. Adriana Ventura impostos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_adr,
      'Adriana Ventura critica aumento de IOF pelo governo Lula como "tributação escondida".',
      'O aumento do IOF é uma tributação escondida. O governo não conseguiu aprovar no Congresso e agora resolve cobrar por decreto. É tirar dinheiro do empresário, da classe média, pra financiar gasto público mal feito. Inaceitável.',
      'Declaração de Adriana Ventura em junho de 2025 após decreto do governo Lula que aumentou alíquotas do IOF. A deputada do Novo votou para derrubar o decreto.',
      1, 'verified', false, '2025-06-10',
      'https://www.estadao.com.br/economia/adriana-ventura-iof-tributacao-escondida-governo/',
      'interview',
      'Câmara dos Deputados', 'Entrevista sobre IOF', 'adriana-iof-tributacao-escondida-b76-72'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 73. Erika Hilton violência
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_eri,
      'Erika Hilton denuncia série de ameaças recebidas após vídeos de Nikolas Ferreira.',
      'Cada ataque que Nikolas faz contra mim gera uma avalanche de ameaças de morte. Mulher trans, negra, periférica, eu sou alvo. Isso não é debate político, é incitação à violência. Vamos cobrar responsabilização.',
      'Denúncia de Erika Hilton em coletiva em agosto de 2024 sobre ameaças recebidas após Nikolas Ferreira publicar vídeos atacando sua identidade. A deputada entrou com ação na Justiça.',
      1, 'verified', true, '2024-08-14',
      'https://www.folha.uol.com.br/poder/2024/08/erika-hilton-ameacas-nikolas-ferreira-denuncia.shtml',
      'interview',
      'Brasília', 'Coletiva sobre ameaças', 'erika-ameacas-nikolas-denuncia-b76-73'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 74. Sâmia Bomfim trabalhadores
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sam,
      'Sâmia Bomfim apresenta PL para regulamentar trabalhadores de aplicativo após ataque patronal.',
      'Enquanto a direita defende precarização, a gente trabalha pelos direitos dos trabalhadores de aplicativo. Motoboy, motorista, entregador, todos precisam de carteira assinada, previdência e dignidade. Não podemos normalizar escravidão digital.',
      'Apresentação por Sâmia Bomfim em abril de 2024 de projeto de lei sobre regulamentação de trabalhadores por aplicativo. A proposta enfrentou oposição do bolsonarismo e de empresas de tecnologia.',
      1, 'verified', false, '2024-04-02',
      'https://www.cartacapital.com.br/politica/samia-bomfim-pl-trabalhadores-aplicativo/',
      'speech',
      'Câmara dos Deputados', 'Apresentação de projeto de lei', 'samia-pl-trabalhadores-aplicativo-b76-74'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 75. Talíria Petrone racismo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tal,
      'Talíria Petrone denuncia racismo institucional em projeto de Nikolas sobre cotas.',
      'O projeto de Nikolas Ferreira que quer acabar com as cotas raciais é racismo institucional travestido de meritocracia. Cotas reduziram abismo histórico, funcionam, mudam vidas. Retroceder nisso é manter o Brasil desigual.',
      'Manifestação de Talíria Petrone em março de 2024 contra projeto de Nikolas Ferreira para revisar política de cotas raciais em universidades federais. A proposta foi rejeitada em comissão.',
      1, 'verified', false, '2024-03-14',
      'https://www.uol.com.br/noticias/2024/03/taliria-petrone-nikolas-cotas-racismo-institucional.htm',
      'speech',
      'Câmara dos Deputados', 'Debate sobre cotas raciais', 'taliria-nikolas-cotas-racismo-b76-75'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_rac, true FROM ins;

  -- 76. Lindbergh Pix
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lin,
      'Lindbergh Farias afirma que Nikolas "atrapalhou economia brasileira" com vídeo do Pix.',
      'Nikolas Ferreira causou um prejuízo incalculável ao Brasil com esse vídeo mentiroso sobre o Pix. Empresas perderam clientes, Receita Federal teve que recuar de norma importante, e tudo por causa de uma fake news eleitoral. Isso é sabotagem institucional.',
      'Pronunciamento de Lindbergh Farias na Câmara em janeiro de 2025 após o governo revogar a norma sobre monitoramento de transações via Pix. O líder do PT atribuiu o recuo ao pânico gerado por desinformação.',
      1, 'verified', false, '2025-01-17',
      'https://www.folha.uol.com.br/mercado/2025/01/lindbergh-nikolas-atrapalhou-economia-pix.shtml',
      'speech',
      'Câmara dos Deputados', 'Pronunciamento sobre Pix', 'lindbergh-nikolas-economia-pix-b76-76'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 77. Jandira feminicídio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jfe,
      'Jandira Feghali lidera articulação contra Nikolas por ataques a vítimas de feminicídio.',
      'Quando Nikolas Ferreira debocha de vítima de feminicídio, ele alimenta a cultura que mata mulheres todos os dias. A bancada feminina vai se unir pra responsabilizar esse deputado. Não é liberdade de expressão, é violência simbólica.',
      'Fala de Jandira Feghali em março de 2024 após Nikolas Ferreira ironizar movimento feminista em redes sociais. A deputada articulou representação conjunta com outras parlamentares.',
      1, 'verified', false, '2024-03-08',
      'https://www.metropoles.com/politica/jandira-nikolas-feminicidio-bancada-feminina',
      'interview',
      'Brasília', 'Coletiva da bancada feminina', 'jandira-nikolas-feminicidio-bancada-b76-77'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mis, true FROM ins;

  -- 78. Orlando Silva fake news
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_orl,
      'Orlando Silva diz que ecossistema de Nikolas "terceiriza a destruição da democracia".',
      'O ecossistema bolsonarista montado em torno de Nikolas Ferreira é uma máquina de terceirização da destruição democrática. Cada corte, cada vídeo viral, alimenta o golpismo. Não vai haver democracia enquanto esse mercado da mentira prosperar.',
      'Artigo de Orlando Silva publicado em março de 2025 na Folha sobre estratégia digital do bolsonarismo após o episódio do Pix. O deputado defendeu regulação das redes sociais.',
      1, 'verified', false, '2025-03-11',
      'https://www.folha.uol.com.br/opiniao/2025/03/orlando-silva-ecossistema-nikolas-democracia.shtml',
      'news_article',
      'Folha de S.Paulo', 'Artigo de opinião', 'orlando-ecossistema-nikolas-democracia-b76-78'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 79. Chico Alencar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_chi,
      'Chico Alencar critica Nikolas chamando-o de "populista digital sem projeto de país".',
      'Nikolas Ferreira é o exemplo perfeito do populista digital: muito grito, nenhuma proposta. Não tem projeto de país, tem engajamento. Essa política viralizada é o oposto da República, é show, é mercado.',
      'Declaração de Chico Alencar em entrevista ao Poder360 em outubro de 2024 criticando modelo de atuação política de Nikolas Ferreira. O deputado é uma das vozes históricas da esquerda parlamentar.',
      1, 'verified', false, '2024-10-09',
      'https://www.poder360.com.br/politica/chico-alencar-nikolas-populista-digital/',
      'interview',
      'Poder360', 'Entrevista sobre política digital', 'chico-alencar-nikolas-populista-digital-b76-79'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 80. Gleisi campanha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann diz que PT vai "encarar Nikolas" na disputa de Minas em 2026.',
      'O PT vai encarar Nikolas Ferreira de frente em Minas Gerais. Não vamos deixar esse populista viralizado ganhar o estado que nasceu Tiradentes. Teremos candidatura forte, vamos mostrar que Minas merece mais que show digital.',
      'Declaração de Gleisi Hoffmann em março de 2026 após Nikolas Ferreira oficializar pré-candidatura ao governo de Minas Gerais. A ministra anunciou estratégia do PT para o estado.',
      1, 'verified', false, '2026-03-02',
      'https://www.correiobraziliense.com.br/politica/2026/03/gleisi-pt-nikolas-minas-2026.html',
      'interview',
      'Brasília', 'Entrevista sobre eleição MG', 'gleisi-pt-nikolas-minas-2026-b76-80'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 81. Marçal cripto
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Pablo Marçal defende que "Brasil adote bitcoin como reserva estratégica" seguindo modelo Trump.',
      'Se Trump está fazendo reserva estratégica de bitcoin nos EUA, o Brasil precisa fazer igual. Quem não entra no jogo cripto vai ficar pra trás. Governo Lula é analógico, não entende de futuro. Bolsonaro em 2026 vai trazer o Brasil pra era digital.',
      'Postagem de Pablo Marçal em março de 2025 defendendo política de reserva estratégica em criptomoedas. A proposta foi vista como plataforma pré-eleitoral.',
      2, 'verified', false, '2025-03-07',
      'https://www.band.com.br/noticias/economia/pablo-marcal-bitcoin-reserva-estrategica-brasil.html',
      'social_media_post',
      'Twitter/X', 'Proposta de reserva em bitcoin', 'marcal-bitcoin-reserva-estrategica-b76-81'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 82. Nikolas Janones Câmara briga
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira acusa Janones de "plantar notícia falsa" contra ele e ameaça processar.',
      'O Janones plantou mais uma notícia falsa contra mim. Vou processar esse estelionatário até o osso. Minas não vai aceitar ser representada por esse picareta, que vive de corte de vídeo e mentira. Vai pagar caro por cada fake news.',
      'Postagem de Nikolas Ferreira em agosto de 2024 após André Janones divulgar informações sobre gastos parlamentares. Ambos trocaram ofensas em redes e na imprensa.',
      2, 'verified', false, '2024-08-27',
      'https://www.metropoles.com/politica/nikolas-janones-noticia-falsa-processar',
      'social_media_post',
      'Twitter/X', 'Nova briga com Janones', 'nikolas-janones-processar-briga-b76-82'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 83. Janones governador
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jan,
      'André Janones anuncia pré-candidatura ao governo de Minas Gerais para enfrentar Nikolas.',
      'Hoje eu me coloco como pré-candidato ao governo de Minas Gerais. Vou enfrentar Nikolas Ferreira e mostrar que Minas merece política de verdade, não só show digital. Essa disputa vai ser a maior de 2026 no país.',
      'Anúncio de André Janones em abril de 2026 de pré-candidatura ao governo de Minas pelo Avante, após articulação com bases do governo Lula. Começa disputa polarizada com Nikolas Ferreira.',
      2, 'verified', true, '2026-04-08',
      'https://www.otempo.com.br/politica/andre-janones-pre-candidato-governo-minas-gerais-nikolas.html',
      'interview',
      'Belo Horizonte', 'Anúncio de pré-candidatura', 'janones-pre-candidato-governo-mg-b76-83'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 84. Nikolas reage Janones
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira debocha de candidatura de Janones em MG chamando-a de "piada".',
      'Janones candidato a governador é a piada do ano. O cara foi suspenso da Câmara, mente descaradamente, e ainda acha que vai ganhar Minas? Vai ter eleição histórica: direita de verdade contra estelionato eleitoral. Mineiro sabe escolher.',
      'Vídeo de Nikolas Ferreira em abril de 2026 em reação ao anúncio de André Janones como pré-candidato ao governo de Minas. A troca marcou o início oficial da campanha estadual.',
      2, 'verified', true, '2026-04-09',
      'https://www.poder360.com.br/eleicoes/nikolas-deboche-janones-governador-minas/',
      'social_media_post',
      'Instagram', 'Resposta à candidatura de Janones', 'nikolas-deboche-janones-governador-b76-84'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 85. Nikolas Michelle
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende candidatura de Michelle Bolsonaro à Presidência em 2026.',
      'Se Bolsonaro não puder ser candidato, Michelle Bolsonaro é a melhor opção. Mulher de fé, com carisma gigante, vai ganhar no primeiro turno. O Brasil precisa de alguém com coragem de enfrentar o comunismo e restaurar os valores da família.',
      'Declaração de Nikolas Ferreira em outubro de 2025 em entrevista à Jovem Pan, defendendo Michelle Bolsonaro como alternativa à candidatura presidencial do PL. A fala gerou reação de outros pré-candidatos.',
      2, 'verified', false, '2025-10-14',
      'https://www.jovempan.com.br/noticias/politica/nikolas-michelle-bolsonaro-candidata-2026.html',
      'interview',
      'Jovem Pan', 'Entrevista sobre 2026', 'nikolas-michelle-candidata-2026-b76-85'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 86. Nikolas tech
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende "privatização total" dos Correios e da Petrobras como pauta prioritária.',
      'Correios, Petrobras, Eletrobras, tudo tem que ser privatizado. Estatal não serve pra nada no Brasil, só serve pra roubar. Vamos entregar na mão do mercado, que funciona. Governo tem que fazer segurança pública e deixar o resto com a iniciativa privada.',
      'Publicação de Nikolas Ferreira em fevereiro de 2024 defendendo privatização de estatais. A pauta é constante nas redes do deputado e dialoga com eleitorado liberal.',
      2, 'verified', false, '2024-02-11',
      'https://www.estadao.com.br/economia/nikolas-ferreira-privatizacao-correios-petrobras.html',
      'social_media_post',
      'Twitter/X', 'Defesa de privatizações', 'nikolas-privatizacao-correios-petrobras-b76-86'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 87. Nikolas IA
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira se opõe a regulamentação de inteligência artificial chamando-a de "censura".',
      'O Marco da IA do governo Lula é mais uma ferramenta de censura. Eles querem controlar até os algoritmos. Inovação nasce livre, não pode ter burocrata de Brasília decidindo o que a IA pode ou não pode responder. Esse PL tem que ser rejeitado.',
      'Discurso de Nikolas Ferreira na Câmara em agosto de 2024 contra o PL 2338/2023 sobre regulação da IA. O deputado votou contrariamente ao texto que segue em tramitação.',
      2, 'verified', false, '2024-08-21',
      'https://www.cnnbrasil.com.br/tecnologia/nikolas-ferreira-marco-ia-censura-governo-lula/',
      'speech',
      'Câmara dos Deputados', 'Debate sobre Marco da IA', 'nikolas-marco-ia-censura-b76-87'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 88. Nikolas educação domiciliar
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende homeschooling e critica professores públicos em plenário.',
      'Educação domiciliar é direito de todo pai. Ninguém conhece o filho melhor que a própria família. A escola pública brasileira virou centro de doutrinação comunista. Homeschooling já! Chega de obrigar criança a ouvir militante.',
      'Discurso de Nikolas Ferreira em março de 2023 na Câmara defendendo projeto de lei sobre educação domiciliar. A proposta enfrenta resistência de entidades educacionais.',
      3, 'verified', false, '2023-03-21',
      'https://www.folha.uol.com.br/educacao/2023/03/nikolas-ferreira-homeschooling-professor-doutrinacao.shtml',
      'speech',
      'Câmara dos Deputados', 'Defesa do homeschooling', 'nikolas-homeschooling-doutrinacao-b76-88'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 89. Nikolas PT corrupção
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira diz que "PT é organização criminosa" em discurso incendiário.',
      'O PT não é partido político, é organização criminosa. Lava-jato, mensalão, petrolão, agora INSS. Toda vez que o PT volta ao poder, o Brasil se transforma num balcão de roubos. Temos que tipificar o PT como quadrilha e proibir eles de concorrer.',
      'Discurso de Nikolas Ferreira na Câmara em junho de 2025 durante debate sobre CPMI do INSS. A fala gerou representação no Conselho de Ética apresentada pela bancada do PT.',
      3, 'verified', false, '2025-06-04',
      'https://www.metropoles.com/politica/nikolas-pt-organizacao-criminosa-inss-cpmi',
      'speech',
      'Câmara dos Deputados', 'Debate da CPMI do INSS', 'nikolas-pt-organizacao-criminosa-b76-89'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 90. Nikolas evangélicos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira promete ser "voz dos evangélicos perseguidos" no governo de Minas.',
      'Serei o governador dos evangélicos perseguidos em Minas Gerais. Chega de discriminação com pastor que prega a Palavra, chega de tentar fechar igreja. Em Minas, cristão vai ser respeitado e valorizado. Deus acima de tudo!',
      'Discurso de Nikolas Ferreira em março de 2026 em culto em Uberlândia durante pré-campanha ao governo de Minas. O deputado articula base evangélica como eleitorado prioritário.',
      3, 'verified', false, '2026-03-20',
      'https://www.uol.com.br/noticias/2026/03/nikolas-ferreira-evangelicos-perseguidos-minas.htm',
      'speech',
      'Uberlândia', 'Culto evangélico de campanha', 'nikolas-evangelicos-perseguidos-minas-b76-90'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 91. Nikolas armas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira critica desarmamento do governo Lula e defende retomada dos decretos de Bolsonaro.',
      'Lula desarmou o cidadão de bem pra deixar bandido armado solto. Os decretos do Bolsonaro foram a maior conquista do cidadão brasileiro em décadas. Vamos retomar cada um quando a direita voltar ao poder. Cidadão armado é cidadão livre.',
      'Publicação de Nikolas Ferreira em julho de 2023 após o governo Lula revogar decretos de armamento de Jair Bolsonaro. O deputado articula bancada da bala contra o desarmamento.',
      3, 'verified', false, '2023-07-24',
      'https://www.poder360.com.br/governo/nikolas-desarmamento-lula-decretos-bolsonaro/',
      'social_media_post',
      'Twitter/X', 'Defesa do armamento civil', 'nikolas-desarmamento-decretos-bolsonaro-b76-91'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 92. Nikolas 8 de Janeiro
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende anistia aos presos do 8 de Janeiro chamando-os de "patriotas".',
      'Não foi golpe, foi manifestação. O povo que estava lá era patriota que acreditava em democracia e foi criminalizado pelo regime togado. Defendo anistia ampla, geral e irrestrita. Essas pessoas não merecem apodrecer na cadeia por ir protestar.',
      'Discurso de Nikolas Ferreira em janeiro de 2024, um ano após os atos de 8 de janeiro, defendendo anistia aos condenados pelos ataques à Praça dos Três Poderes. A proposta foi criticada por juristas.',
      4, 'verified', true, '2024-01-08',
      'https://g1.globo.com/politica/noticia/2024/01/08/nikolas-ferreira-8-janeiro-anistia-patriotas.ghtml',
      'social_media_post',
      'Twitter/X', 'Um ano do 8 de Janeiro', 'nikolas-anistia-8-janeiro-patriotas-b76-92'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

  -- 93. Nikolas FGTS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira espalha boato de que governo Lula vai "confiscar FGTS" dos trabalhadores.',
      'Atenção, trabalhador brasileiro: o governo Lula está preparando CONFISCO DO SEU FGTS pra pagar dívida da Petrobras. Eles vão pegar o dinheiro da casa própria, da aposentadoria, do seguro-desemprego. Compartilhe antes que seja tarde!',
      'Publicação de Nikolas Ferreira em setembro de 2024 com alegação sobre suposto confisco do FGTS. A desinformação foi desmentida pela Caixa Econômica Federal e por checadores independentes.',
      3, 'verified', false, '2024-09-26',
      'https://www.folha.uol.com.br/mercado/2024/09/nikolas-ferreira-fgts-confisco-desinformacao.shtml',
      'social_media_post',
      'Twitter/X', 'Desinformação sobre FGTS', 'nikolas-fgts-confisco-desinformacao-b76-93'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 94. Nikolas Venezuela
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira compara Brasil de Lula à Venezuela de Maduro em vídeo viral.',
      'Quer saber o que é o Brasil em 2025? É Venezuela 2005. Censura nas redes, perseguição à oposição, inflação explodindo, fome voltando. Se a gente não reagir agora, vamos virar Caracas. Lula está lulopetizando o Brasil e ninguém fala nada.',
      'Vídeo de Nikolas Ferreira em abril de 2025 comparando Brasil ao regime venezuelano. A comparação foi rejeitada por especialistas em ciência política como exagero retórico.',
      3, 'verified', false, '2025-04-29',
      'https://www.uol.com.br/noticias/2025/04/nikolas-ferreira-brasil-venezuela-maduro-comparacao.htm',
      'social_media_post',
      'TikTok', 'Comparação com Venezuela', 'nikolas-brasil-venezuela-maduro-b76-94'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 95. Nikolas China
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca aliança de Lula com China chamando-a de "entrega da soberania".',
      'Lula entrega o Brasil à China comunista. Porto, 5G, BRICS, estatal, tudo vai pra Xi Jinping. O Brasil virou colônia chinesa. Não vou aceitar meu país de joelhos pra ditadura asiática. Aliança tem que ser com EUA, com Ocidente, com liberdade.',
      'Publicação de Nikolas Ferreira em maio de 2024 após viagem de Lula à China. O deputado atacou os acordos comerciais firmados, repetindo narrativa sobre "entrega" à China.',
      2, 'verified', false, '2024-05-02',
      'https://www.estadao.com.br/politica/nikolas-ferreira-lula-china-entrega-soberania/',
      'social_media_post',
      'Twitter/X', 'Crítica a aliança Brasil-China', 'nikolas-lula-china-entrega-soberania-b76-95'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 96. Nikolas deepfake Romário
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira compartilha deepfake de Romário atacando Lula e depois deleta sem se retratar.',
      'Até o Romário já se cansou do Lula! Olha esse vídeo do senador dizendo que o governo é desastre. Quando até Romário, que é da base, vira contra, sabe que o buraco é mais embaixo.',
      'Publicação de Nikolas Ferreira em setembro de 2025 compartilhando vídeo produzido com inteligência artificial que simulava fala do senador Romário contra Lula. O deputado deletou o post após desmentido, sem emitir retratação.',
      3, 'verified', false, '2025-09-11',
      'https://www.folha.uol.com.br/poder/2025/09/nikolas-deepfake-romario-lula-deletou.shtml',
      'social_media_post',
      'Twitter/X', 'Compartilhamento de deepfake', 'nikolas-deepfake-romario-lula-b76-96'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 97. Nikolas Alcolumbre impeachment
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira pede que apoiadores pressionem Alcolumbre a pautar impeachment de Moraes.',
      'Liguem, mandem mensagem, encham de e-mail o Davi Alcolumbre. Ele tem que pautar o impeachment do Moraes. Se ele não pautar, é cúmplice. Vamos fazer pressão democrática. O povo mandou, Alcolumbre tem que obedecer!',
      'Convocação de Nikolas Ferreira em abril de 2025 para que apoiadores pressionassem o presidente do Senado a pautar impeachment de Alexandre de Moraes. A tática gerou crítica de senadores de várias correntes.',
      4, 'verified', false, '2025-04-10',
      'https://www.metropoles.com/politica/nikolas-pressao-alcolumbre-impeachment-moraes',
      'social_media_post',
      'YouTube', 'Live sobre impeachment de Moraes', 'nikolas-pressao-alcolumbre-impeachment-b76-97'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_itm, true FROM ins;

  -- 98. Nikolas religião escola
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira defende obrigatoriedade do ensino de valores cristãos nas escolas.',
      'Todo currículo brasileiro deveria ter valores cristãos obrigatórios. Não estou dizendo pra catequizar, estou dizendo pra ensinar a base moral do Ocidente. Sem cristianismo, sem família, sem Deus, não há civilização. É isso que vou defender em Minas.',
      'Discurso de Nikolas Ferreira em janeiro de 2026 em evento do PL em Belo Horizonte, defendendo inserção de valores cristãos como conteúdo obrigatório em escolas. A proposta foi criticada por violar Estado laico.',
      3, 'verified', false, '2026-01-28',
      'https://www.otempo.com.br/politica/nikolas-valores-cristaos-escolas-minas.html',
      'speech',
      'Belo Horizonte', 'Evento do PL-MG', 'nikolas-valores-cristaos-escolas-b76-98'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_int, true FROM ins;

  -- 99. Nikolas imigração
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira ataca chegada de venezuelanos e propõe "fechar fronteira" como Trump.',
      'Enquanto o brasileiro passa fome, Lula recebe venezuelano de braços abertos e dá bolsa família. Temos que fechar nossa fronteira como Trump fez. Primeiro o brasileiro, depois o resto do mundo. Minas não vai virar depósito de imigrante.',
      'Vídeo de Nikolas Ferreira em fevereiro de 2025 defendendo fechamento da fronteira brasileira a imigrantes venezuelanos. A fala foi criticada por organizações humanitárias como xenófoba.',
      4, 'verified', false, '2025-02-19',
      'https://www.cnnbrasil.com.br/politica/nikolas-ferreira-imigracao-venezuelanos-fronteira/',
      'social_media_post',
      'Twitter/X', 'Comentário sobre imigração', 'nikolas-imigracao-venezuelanos-fronteira-b76-99'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xen, true FROM ins;

  -- 100. Nikolas Brasília anti-Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context, severity_score,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira conclama "último ato pela liberdade" em Brasília contra Lula e STF.',
      'Brasileiro, dia 21 de abril vamos pra Brasília! Último grande ato pela liberdade antes das eleições de 2026. Contra Lula, contra Moraes, contra a ditadura togada. Patriota tem que estar na Esplanada. Esse é o momento da virada!',
      'Convocação de Nikolas Ferreira em abril de 2026 para ato bolsonarista em Brasília no feriado de Tiradentes. O evento foi articulado como marco pré-eleitoral da direita radical.',
      4, 'verified', true, '2026-04-14',
      'https://www.folha.uol.com.br/poder/2026/04/nikolas-ato-brasilia-21-abril-liberdade.shtml',
      'social_media_post',
      'Instagram', 'Convocação 21 de abril', 'nikolas-ato-brasilia-21-abril-liberdade-b76-100'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ant, true FROM ins;

END $$;
