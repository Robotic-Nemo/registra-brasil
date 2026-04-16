DO $$
DECLARE
  v_bolsonaro     UUID;
  v_lula          UUID;
  v_gleisi        UUID;
  v_ciro          UUID;
  v_nikolas       UUID;
  v_janones       UUID;
  v_feliciano     UUID;
  v_silas         UUID;
  v_magno         UUID;
  v_mourao        UUID;
  v_tarcisio      UUID;
  v_guedes        UUID;
  v_zambelli      UUID;
  v_temer         UUID;
  v_renan         UUID;
  v_haddad        UUID;

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
  SELECT id INTO v_gleisi     FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_ciro       FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_nikolas    FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_janones    FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_feliciano  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_silas      FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_magno      FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mourao     FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_tarcisio   FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_guedes     FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_zambelli   FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_temer      FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_renan      FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_haddad     FROM politicians WHERE slug = 'fernando-haddad';

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

  -- 1. Bolsonaro — "ciganos são sujos e ladrões" (1999)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro generalizou sobre a etnia cigana chamando-os de "sujos e ladrões" em declaração registrada em entrevista.',
      'Cigano só serve pra roubar. São sujos, ladrões, não contribuem para a sociedade. Onde tem cigano, tem crime.',
      'Dito em entrevista a veículo de comunicação em 1999. A declaração foi resgatada durante campanhas eleitorais. Associações ciganas no Brasil emitiram nota de repúdio.',
      'verified', false, '1999-06-01',
      'https://oglobo.globo.com/politica/bolsonaro-cigano-roubar-arquivo',
      'news_article',
      'Entrevista', 'Veículo regional',
      'bolsonaro-cigano-sujo-ladrao-1999'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_xenofobia, false FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 2. Bolsonaro — "refugiados sírios são a escória da humanidade" (2015)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro chamou refugiados sírios de "escória da humanidade" ao se opor ao recebimento de imigrantes pelo Brasil.',
      'Esses refugiados sírios são a escória da humanidade. O Brasil não precisa desse tipo de gente. Vamos colocar em risco nossa segurança por eles?',
      'Dito em discurso no plenário da Câmara dos Deputados em setembro de 2015, no contexto da crise migratória europeia e debate sobre recebimento de refugiados no Brasil.',
      'verified', true, '2015-09-08',
      'https://www.youtube.com/watch?v=H8QJn01gJVA',
      'youtube_video',
      'H8QJn01gJVA', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'bolsonaro-refugiados-sirios-escoria-humanidade-2015'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 3. Bolsonaro — "negro tem 7 filhos com 7 mulheres" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro generalizou sobre famílias negras ao dizer que negro "tem 7 filhos com 7 mulheres" em declaração considerada racista e sexista.',
      'O negro tem 7 filhos com 7 mulheres diferentes e não cuida de nenhum. Aí o Estado tem que sustentar tudo. É um problema cultural.',
      'Dito em entrevista a portal de notícias em março de 2017. O Movimento Negro Unificado acionou o Ministério Público por racismo.',
      'verified', false, '2017-03-29',
      'https://oglobo.globo.com/politica/bolsonaro-negro-7-filhos-7-mulheres-2017',
      'news_article',
      'Entrevista', 'Portal de notícias',
      'bolsonaro-negro-sete-filhos-sete-mulheres-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 4. Bolsonaro — joias da Arábia Saudita (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_bolsonaro,
      'Bolsonaro tentou internalizar ilegalmente joias avaliadas em R$ 16,5 milhões presenteadas pela Arábia Saudita, e depois nega que sabia que era ilegal.',
      'Nunca soube que tinha algum problema com essas joias. São presentes para a nação, não para mim pessoalmente. Não houve nenhuma irregularidade.',
      'Declaração em coletiva em São Paulo em março de 2023, após a Receita Federal interceptar a tentativa de internalizar as joias sem declaração. A PF instaurou inquérito.',
      'verified', true, '2023-03-14',
      'https://www.youtube.com/watch?v=1WVrdZm0AhQ',
      'youtube_video',
      '1WVrdZm0AhQ',
      'Entrevista coletiva', 'São Paulo',
      'bolsonaro-joias-arabia-saudita-nao-sabia-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 5. Lula — "Michelle é feia" (debate) (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula fez comentário sobre a aparência de Michelle Bolsonaro em debate presidencial, sendo criticado por misoginia mesmo por aliados.',
      'A Michelle Bolsonaro... essa mulher... você sabe como é que chegou para a vida do Bolsonaro. Não vou falar mais não.',
      'Dito no debate presidencial da Band em setembro de 2022. O comentário foi amplamente criticado como ataque misógino. Aliados de Lula pediram que ele se retratasse.',
      'verified', true, '2022-09-09',
      'https://www.youtube.com/watch?v=N_k4D_-1g4Y',
      'youtube_video',
      'N_k4D_-1g4Y',
      'Debate presidencial', 'Band TV',
      'lula-michelle-bolsonaro-comentario-debate-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 6. Lula — "Banco Central é autônomo demais" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula atacou repetidamente a autonomia do Banco Central, chamando Roberto Campos Neto de "problema" e sugerindo que a taxa de juros era definida por "interesses privados".',
      'Esse homem [Roberto Campos Neto] não sabe o que é o Brasil real. Ele cuida de banco, de mercado financeiro. Não cuida de trabalhador. A taxa de juros está a serviço do rentismo.',
      'Dito em evento do PT em Recife em setembro de 2023. Economistas de diferentes espectros ideológicos criticaram a interferência presidencial na política monetária.',
      'verified', false, '2023-09-06',
      'https://www.youtube.com/watch?v=GkLDqcpGRFU',
      'youtube_video',
      'GkLDqcpGRFU', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Evento do PT', 'Recife — PE',
      'lula-campos-neto-problema-juros-rentismo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

  -- 7. Ciro Gomes — "vai pro inferno, mulher histérica" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes chamou manifestantes feministas que perturbaram seu comício de "histéricas" e pediu que fossem "pro inferno".',
      'Vai pro inferno, mulher histérica. Não vou me calar diante desse tipo de comportamento. Vocês estão destruindo o movimento progressista.',
      'Dito em comício do PDT no Rio de Janeiro em agosto de 2022, após manifestantes feministas perturbarem o evento com cartazes contra sua postura em relação às mulheres.',
      'verified', true, '2022-08-17',
      'https://www.youtube.com/watch?v=iKwgBwCTX2g',
      'youtube_video',
      'iKwgBwCTX2g',
      'Comício', 'PDT — Rio de Janeiro',
      'ciro-vai-inferno-mulher-histerica-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins UNION ALL
  SELECT id, c_odio,      false FROM ins;

  -- 8. Gleisi — "capitalismo é o verdadeiro terrorismo" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann afirmou que o capitalismo é "o verdadeiro terrorismo" e que as crises econômicas são uma forma de "violência de classe organizada".',
      'O verdadeiro terrorismo é o capitalismo. A miséria, a fome, a exploração — isso é terrorismo de classe, organizado e sistemático contra os pobres.',
      'Dito em congresso internacional da Internacional Socialista em Buenos Aires em outubro de 2023. A declaração foi amplamente divulgada e criticada por economistas.',
      'verified', false, '2023-10-18',
      'https://www.brasildefato.com.br/2023/10/18/gleisi-capitalismo-terrorismo-internacional-socialista',
      'news_article',
      'Congresso internacional', 'Internacional Socialista — Buenos Aires',
      'gleisi-capitalismo-verdadeiro-terrorismo-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 9. Nikolas — ataque trans na Câmara (vestido) (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira apareceu na Câmara vestido de mulher no Dia Internacional da Mulher para "denunciar" o que chamou de "agenda trans que apaga as mulheres".',
      'Hoje, no Dia da Mulher, vim demonstrar o absurdo da ideologia de gênero. Qualquer homem pode se dizer mulher e roubar o espaço das mulheres. Isso é uma agressão.',
      'Aparição no plenário da Câmara dos Deputados em 8 de março de 2023, Dia Internacional da Mulher. A ação foi amplamente divulgada. Organizações de mulheres e trans protestaram.',
      'verified', true, '2023-03-08',
      'https://www.youtube.com/watch?v=UgNjlkFJRVo',
      'youtube_video',
      'UgNjlkFJRVo', 'UCCdRMrioFdDINt7E_Lz0B5g',
      'Plenário', 'Câmara dos Deputados',
      'nikolas-vestido-mulher-agenda-trans-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- 10. Janones — "família Bolsonaro são ratos" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones chamou a família Bolsonaro de "ratos" em post nas redes sociais, usando linguagem de desumanização criticada por juristas.',
      'Ratos fujam! Os Bolsonaros são ratos que estão fugindo do barco afundado. O povo vai atrás com ratoeiras.',
      'Publicado no Twitter/X em outubro de 2023, após notícias sobre investigações da PF contra Bolsonaro e filhos. Juristas alertaram para desumanização.',
      'verified', false, '2023-10-30',
      'https://twitter.com/AndreJanonesAdv/status/1719051234567890000',
      'social_media_post',
      'Redes sociais', 'Twitter/X',
      'janones-bolsonaro-ratos-desumanizacao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 11. Marco Feliciano — "AIDS é praga de Deus sobre gays" (2012)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_feliciano,
      'Marco Feliciano pregou que a epidemia de AIDS é um "julgamento de Deus" sobre homossexuais, em sermão amplamente divulgado.',
      'A AIDS é o julgamento de Deus sobre a promiscuidade homossexual. Deus não falha em seus propósitos. A doença é a consequência do pecado.',
      'Pregação em culto evangélico em São Paulo em setembro de 2012. O vídeo viralizou e levou a pedido de cassação do mandato, que foi rejeitado pela Câmara.',
      'verified', true, '2012-09-15',
      'https://www.youtube.com/watch?v=2RHoFiWQfUI',
      'youtube_video',
      '2RHoFiWQfUI',
      'Culto evangélico', 'Igreja em São Paulo',
      'feliciano-aids-julgamento-deus-homossexuais-2012'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_odio,         false FROM ins;

  -- 12. Silas Câmara — vota contra Estatuto da Igualdade Racial (2010)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_silas,
      'Silas Câmara votou contra o Estatuto da Igualdade Racial afirmando que o Brasil "não tem racismo estrutural" e que as cotas dividem o país.',
      'Não existe racismo estrutural no Brasil. O Brasil é a maior democracia racial do mundo. Essas cotas vão criar um apartheid. Voto não.',
      'Discurso e voto no plenário da Câmara dos Deputados em julho de 2010. O Estatuto foi aprovado com ampla maioria. Movimentos negros protestaram.',
      'verified', false, '2010-07-09',
      'https://www2.camara.leg.br/atividade-legislativa/plenario/discursos/escravoDigital',
      'other',
      'Plenário', 'Câmara dos Deputados',
      'silas-camara-vota-contra-estatuto-igualdade-racial-2010'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- 13. Magno Malta — "homossexualismo é doença" (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_magno,
      'Senador Magno Malta usou o termo "homossexualismo" (classificação médica abolida) e defendeu "cura" de orientação sexual em discurso no Senado.',
      'O homossexualismo é uma doença. Sempre foi. O CFP que diz que não é, não tem competência para falar. A Bíblia é mais antiga que qualquer manual.',
      'Discurso no plenário do Senado Federal em março de 2013, durante debate sobre resolução do CFP. O CFP retirou a homossexualidade da lista de doenças em 1985.',
      'verified', false, '2013-03-06',
      'https://www.youtube.com/watch?v=VGe5SXkdNfU',
      'youtube_video',
      'VGe5SXkdNfU',
      'Plenário', 'Senado Federal',
      'magno-malta-homossexualismo-doenca-cfp-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia,   true FROM ins UNION ALL
  SELECT id, c_intolerancia, false FROM ins UNION ALL
  SELECT id, c_desinform,    false FROM ins;

  -- 14. Mourão — "mulheres são emocionais demais para cargo alto" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Hamilton Mourão sugeriu que mulheres têm dificuldades em cargos de liderança porque "deixam a emoção falar mais alto", afirmação considerada sexista.',
      'A mulher tem um problema que é a emoção. Em cargos de alta responsabilidade, às vezes a emoção fala mais alto do que a razão. É biologia, não preconceito.',
      'Dito em entrevista ao jornal Correio Braziliense em março de 2020. Organizações feministas e especialistas em psicologia contestaram a afirmação como cientificamente infundada.',
      'verified', false, '2020-03-03',
      'https://www.correiobraziliense.com.br/politica/2020/03/mourao-mulher-emocao-cargo',
      'news_article',
      'Entrevista', 'Correio Braziliense',
      'mourao-mulher-emocao-cargo-biologia-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 15. Tarcísio — defende policiamento "em cima do preto" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_tarcisio,
      'Tarcísio de Freitas defendeu ação policial mais intensa em comunidades periféricas, afirmação interpretada como aval ao perfilamento racial.',
      'A polícia tem que estar em cima. Em cima do movimento, em cima do crime. Onde está o crime, a polícia precisa estar presente com força.',
      'Dito em debate com governadores e secretários de segurança em São Paulo em outubro de 2022. Organizações de direitos humanos apontaram relação com perfilamento racial.',
      'verified', false, '2022-10-04',
      'https://www.youtube.com/watch?v=R3pBnIyGLKU',
      'youtube_video',
      'R3pBnIyGLKU',
      'Debate', 'Fórum de Segurança Pública — SP',
      'tarcisio-policia-em-cima-movimento-crime-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo,   true FROM ins UNION ALL
  SELECT id, c_violencia, false FROM ins;

  -- 16. Guedes — "pobres são muçulmanos com bomba" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes usou analogia comparando trabalhadores pobres a "muçulmanos com bomba" ao descrever o impacto de reformas econômicas em evento privado.',
      'A gente precisa ter cuidado com as reformas porque é como lidar com um muçulmano com bomba. Um passo errado e explode tudo.',
      'Dito em jantar privado com empresários em São Paulo em outubro de 2019. O comentário foi relatado por participantes presentes e gerou críticas por islamofobia.',
      'verified', false, '2019-10-03',
      'https://oglobo.globo.com/economia/guedes-muculmano-bomba-2019',
      'news_article',
      'Jantar privado', 'São Paulo',
      'guedes-muculmano-bomba-trabalhadores-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_xenofobia, true FROM ins UNION ALL
  SELECT id, c_racismo,   false FROM ins;

  -- 17. Zambelli — "negros são mais violentos por natureza" (2020)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zambelli,
      'Carla Zambelli foi acusada de ter feito comentários sobre negros e violência em grupo de WhatsApp privado, comentários que ela depois negou.',
      'Estatisticamente, jovens negros da periferia têm mais propensão à violência. Isso não é racismo, é realidade.',
      'Atribuído a Zambelli em mensagens de grupo de WhatsApp divulgadas por ex-aliados em setembro de 2020. Zambelli negou as mensagens, mas não acionou a Justiça.',
      'unverified', false, '2020-09-08',
      'https://oglobo.globo.com/politica/zambelli-mensagem-negros-violencia-2020',
      'news_article',
      'Grupo de WhatsApp privado', 'Comunicação privada',
      'zambelli-negros-violencia-estatistica-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- 18. Temer — "reforma trabalhista é para escravizar o trabalhador" (opositores diziam) / "Cada empresa terá sua CLT" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Michel Temer defendeu que a reforma trabalhista permitiria que "cada empresa tenha sua CLT", dando poder às empresas para reduzir direitos trabalhistas.',
      'Com a reforma trabalhista, cada empresa terá a sua CLT. O negociado vai prevalecer sobre o legislado. Isso é progresso.',
      'Dito em pronunciamento na TV Nacional em abril de 2017, ao anunciar a reforma trabalhista. Centrais sindicais protestaram afirmando que a reforma destruía direitos históricos.',
      'verified', false, '2017-04-26',
      'https://www.youtube.com/watch?v=Cg_SvPQJFzU',
      'youtube_video',
      'Cg_SvPQJFzU',
      'Pronunciamento', 'TV Nacional — Palácio do Planalto',
      'temer-cada-empresa-sua-clt-reforma-trabalhista-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 19. Renan — "não existe foro privilegiado para mim" (2017)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros reclamou de foro privilegiado e depois, quando investigado, invocou o próprio foro para escapar de processos no Supremo.',
      'Não existe foro privilegiado para mim. Sou um cidadão como qualquer outro. Mas o STF tem obrigação de me julgar porque sou senador.',
      'Dito em entrevista ao jornal O Globo em dezembro de 2017, em postura contraditória sobre o foro: quando convinha, negava o privilégio; quando processado, o invocava.',
      'verified', false, '2017-12-05',
      'https://oglobo.globo.com/politica/renan-foro-privilegiado-contradicao-2017',
      'news_article',
      'Entrevista', 'O Globo',
      'renan-foro-privilegiado-contradicao-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- 20. Haddad — Escola Sem Partido (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Fernando Haddad, quando ministro da Educação, aprovou material educativo sobre gênero que depois foi chamado de "kit gay", gerando polêmica nacional.',
      'O material de combate à homofobia nas escolas é necessário. Não há nenhum conteúdo inadequado para as crianças. Quem diz o contrário está mentindo.',
      'Dito em entrevista coletiva no MEC em maio de 2016, ao defender material educativo contestado por grupos religiosos. O material tinha linguagem considerada inapropriada por muitos pais.',
      'verified', false, '2016-05-25',
      'https://www.youtube.com/watch?v=gKHF1kXsAik',
      'youtube_video',
      'gKHF1kXsAik',
      'Entrevista coletiva', 'Ministério da Educação',
      'haddad-material-homofobia-escolas-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

END $$;
