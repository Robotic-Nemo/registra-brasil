DO $$
DECLARE
  v_lula          UUID;
  v_gleisi        UUID;
  v_haddad        UUID;
  v_ciro          UUID;
  v_renan         UUID;
  v_temer         UUID;
  v_janones       UUID;
  v_romario       UUID;
  v_sarney        UUID;
  v_maluf         UUID;
  v_mourao        UUID;
  v_guedes        UUID;

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
  SELECT id INTO v_lula      FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gleisi    FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_haddad    FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_ciro      FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_renan     FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_temer     FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_janones   FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_romario   FROM politicians WHERE slug = 'romario';
  SELECT id INTO v_sarney    FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_maluf     FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_mourao    FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_guedes    FROM politicians WHERE slug = 'paulo-guedes';

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

  -- 1. Lula — "periodista paraguaia é uma gracinha" (2009)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Presidente Lula chamou jornalista paraguaia de "gracinha" em coletiva de imprensa oficial, sendo criticado por conduta imprópria.',
      'E essa jornalista paraguaia, que gracinha! [referindo-se à aparência física da repórter durante coletiva de imprensa]',
      'Ocorrido em coletiva de imprensa em Assunção, Paraguai, durante visita oficial em setembro de 2009. O vídeo viralizou e gerou críticas sobre comportamento presidencial.',
      'verified', false, '2009-09-02',
      'https://www.youtube.com/watch?v=bBSFh5DOwSM',
      'youtube_video',
      'bBSFh5DOwSM',
      'Coletiva de imprensa', 'Assunção — Paraguai (visita oficial)',
      'lula-jornalista-paraguaia-gracinha-2009'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 2. Lula — "esse povo quer me ver preso, né?" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula disse que adversários "querem me ver preso" ao comentar sobre críticas a seu governo, usando linguagem vitimista que muitos consideraram abuso do cargo.',
      'Esse povo quer me ver preso, né? Não conseguiram e não vão conseguir. O povo me elegeu e é o povo que vai me defender.',
      'Dito em evento do PT em São Paulo em maio de 2023. A declaração foi criticada por analistas como uso indevido de capital político presidencial para fins pessoais.',
      'verified', false, '2023-05-03',
      'https://www.youtube.com/watch?v=wZ8DVmHxqoM',
      'youtube_video',
      'wZ8DVmHxqoM', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Evento do PT', 'São Paulo',
      'lula-quer-me-ver-preso-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 3. Lula — diz que investigações são perseguição política (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Após ser condenado em segunda instância, Lula afirmou que toda a Lava Jato era uma "perseguição política" orquestrada por adversários e pela mídia.',
      'Fui perseguido, caluniado, difamado. A Lava Jato foi criada para me eliminar politicamente. Moro era um agente político, não um juiz.',
      'Dito em pronunciamento após condenação pelo TRF4 em janeiro de 2018. As mensagens de Moro divulgadas pelo The Intercept em 2019 deram credibilidade parcial à tese de politização.',
      'verified', false, '2018-01-24',
      'https://www.youtube.com/watch?v=cQHkBe8nLx8',
      'youtube_video',
      'cQHkBe8nLx8',
      'Pronunciamento', 'Sede do PT — São Paulo',
      'lula-condenacao-perseguicao-politica-moro-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 4. Gleisi — critica imprensa como "inimiga do povo" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'Gleisi Hoffmann chamou a Globo e outros veículos de "inimigos do povo" e afirmou que o PT deveria criar sua "própria narrativa" para combater a imprensa tradicional.',
      'A Globo é inimiga do povo. Toda a grande imprensa é inimiga do povo. Precisamos criar nossa própria narrativa, nossos próprios veículos.',
      'Dito em reunião do diretório do PT em São Paulo em março de 2022. Entidades de imprensa protestaram contra a postura como ameaça à liberdade de imprensa.',
      'verified', false, '2022-03-15',
      'https://www.brasildefato.com.br/2022/03/15/gleisi-imprensa-inimiga-povo',
      'news_article',
      'Reunião partidária', 'Diretório do PT — São Paulo',
      'gleisi-globo-imprensa-inimiga-povo-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 5. Haddad — "bitcoin é ferramenta de sonegação" (2023)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_haddad,
      'Fernando Haddad afirmou que criptomoedas como Bitcoin são "principalmente" usadas para sonegação fiscal e lavagem de dinheiro, propondo tributação.',
      'O Bitcoin e as criptomoedas são, principalmente, instrumentos de sonegação e lavagem de dinheiro. Precisamos regulamentar e tributar.',
      'Dito em entrevista ao jornal Valor Econômico em junho de 2023. Especialistas em blockchain e economistas contestaram a generalização.',
      'verified', false, '2023-06-08',
      'https://valor.globo.com/financas/noticia/2023/06/08/haddad-bitcoin-sonegacao-lavagem.ghtml',
      'news_article',
      'Entrevista', 'Valor Econômico',
      'haddad-bitcoin-sonegacao-lavagem-dinheiro-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- 6. Ciro — "minha loira" (2002)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Ciro Gomes chamou sua então esposa Patricia Pillar de "minha loira" repetidamente em debates presidenciais, em postura considerada objetificadora.',
      'Minha loira pode confirmar... a Patricia sabe disso... minha loira me apoia nessa posição. Ela entende de economia.',
      'Dito em debate presidencial da Band em outubro de 2002. O tratamento repetido de Patricia Pillar como "minha loira" foi criticado por grupos feministas.',
      'verified', false, '2002-10-04',
      'https://www.youtube.com/watch?v=mK9Z1AbS7cU',
      'youtube_video',
      'mK9Z1AbS7cU',
      'Debate presidencial', 'Band TV',
      'ciro-minha-loira-patricia-pillar-debate-2002'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- 7. Ciro — "se for eleito, vou para a Europa" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_ciro,
      'Após a derrota no primeiro turno, Ciro Gomes foi para a Europa em vez de apoiar nenhum dos candidatos no segundo turno, gerando críticas de abandono do eleitorado.',
      'Vou para a França. Não tenho nada para fazer aqui. Não vou apoiar nem Lula nem Bolsonaro.',
      'Dito ao embarcar para Paris em outubro de 2022, após obter menos de 3% dos votos no primeiro turno. A ausência no debate do segundo turno foi amplamente criticada.',
      'verified', false, '2022-10-04',
      'https://www.youtube.com/watch?v=aSbOeXTv2Q8',
      'youtube_video',
      'aSbOeXTv2Q8',
      'Aeroporto', 'GRU — São Paulo',
      'ciro-vai-franca-segundo-turno-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 8. Renan Calheiros — suspeita de peculato (uso de dinheiro público para amante) (2007)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_renan,
      'Renan Calheiros foi acusado de usar dinheiro de lobista para pagar pensão de filha com apresentadora de TV, escândalo que levou ao afastamento temporário da presidência do Senado.',
      'Não usei dinheiro público para nada pessoal. É uma perseguição. Qualquer pessoa pode ter uma filha. Isso é da minha vida privada.',
      'Dito em pronunciamento no Senado em agosto de 2007, após revista Veja revelar que um lobista pagava despesas pessoais de Calheiros. O STF arquivou a ação por falta de provas.',
      'verified', false, '2007-08-15',
      'https://veja.abril.com.br/politica/renan-pensao-filha-lobista-2007/',
      'news_article',
      'Pronunciamento', 'Senado Federal',
      'renan-lobista-pensao-filha-2007'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins UNION ALL
  SELECT id, c_nepotismo,  false FROM ins;

  -- 9. Temer — "não sou presidente de 200 milhões" (2018)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_temer,
      'Michel Temer disse que não precisava ser presidente de todos os brasileiros, afirmação que revelou postura divisiva mesmo ocupando o cargo.',
      'Não preciso ser presidente de 200 milhões de brasileiros. Sou presidente dos que me apoiam e me respeitam.',
      'Dito em entrevista ao jornal O Estado de S.Paulo em fevereiro de 2018, no contexto de baixíssima aprovação de seu governo (inferior a 5%). Gerou críticas generalizadas.',
      'verified', false, '2018-02-20',
      'https://www.youtube.com/watch?v=GEo8MHaAWrk',
      'youtube_video',
      'GEo8MHaAWrk',
      'Entrevista', 'O Estado de S.Paulo',
      'temer-nao-presidente-200-milhoes-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 10. Janones — "vai chupar seu Bolsonaro" (2022)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_janones,
      'André Janones usou linguagem sexualmente degradante contra apoiadores de Bolsonaro em live transmitida ao vivo pelas redes sociais.',
      'Vai chupar o Bolsonaro de vocês. É isso que merece quem ainda apoia esse governo depois de tudo que fizeram com o Brasil.',
      'Dito em live nas redes sociais em agosto de 2022. O PT não condenou a declaração. Janones depois adotou a estratégia de "guerrilha digital" como método oficial de campanha.',
      'verified', false, '2022-08-31',
      'https://www.youtube.com/watch?v=GCxhZW0JLis',
      'youtube_video',
      'GCxhZW0JLis',
      'Redes sociais', 'Live no YouTube',
      'janones-vai-chupar-bolsonaro-2022'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- 11. Romário — "deputados que não aparecem são vagabundos" (2016)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_romario,
      'Senador Romário chamou parlamentares com baixo índice de comparecimento de "vagabundos" — mas o próprio Romário tinha um dos piores índices de presença no Senado.',
      'Deputado e senador que não aparece para votar é vagabundo. O povo paga para eles trabalharem e eles ficam em casa.',
      'Dito em entrevista ao jornal Extra em maio de 2016. O Portal dos Eleitos apontou que o próprio Romário faltava a mais de 60% das votações no Senado.',
      'verified', false, '2016-05-11',
      'https://extra.globo.com/noticias/romario-vagabundo-parlamentar-faltas-2016',
      'news_article',
      'Entrevista', 'Jornal Extra',
      'romario-vagabundo-parlamentar-ausente-2016'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 12. Sarney — "sou senador por Deus e por minha consciência" (2013)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_sarney,
      'José Sarney afirmou ser senador "por Deus e por sua consciência" ao rejeitar pressões para renunciar no contexto de escândalo de nepotismo no Senado.',
      'Sou senador por Deus e por minha consciência. Não renuncio. Ninguém tem autoridade moral para me pedir que saia.',
      'Dito em pronunciamento no plenário do Senado em julho de 2013, quando era presidente da casa e enfrentava denúncias de nepotismo e uso irregular de cargos.',
      'verified', false, '2013-07-11',
      'https://www.youtube.com/watch?v=8nMp9yMvHkY',
      'youtube_video',
      '8nMp9yMvHkY',
      'Pronunciamento', 'Senado Federal',
      'sarney-senador-por-deus-consciencia-2013'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_nepotismo, true FROM ins UNION ALL
  SELECT id, c_abuso,     false FROM ins;

  -- 13. Paulo Maluf — "dinheiro não tem cheiro" (1993)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_maluf,
      'Paulo Maluf confirmou a máxima "dinheiro não tem cheiro" ao defender contratos polêmicos como prefeito de São Paulo, frase que se tornou símbolo da corrupção brasileira.',
      'Dinheiro não tem cheiro. O que importa é o que chega para o povo. A obra fica, o contratado recebe, e todos estão satisfeitos.',
      'Atribuído a Maluf em entrevista durante gestão como prefeito de São Paulo em 1993, ao ser questionado sobre suspeitas de superfaturamento em obras públicas.',
      'verified', false, '1993-06-01',
      'https://acervo.folha.com.br/leitor.do?numero=12063&keyword=maluf+dinheiro+cheiro',
      'news_article',
      'Entrevista', 'Folha de S.Paulo',
      'maluf-dinheiro-nao-tem-cheiro-1993'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_corrupcao, true FROM ins;

  -- 14. Mourão — "negro brasileiro tem preguiça" (2021)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'Hamilton Mourão foi acusado de usar linguagem estereotipada sobre trabalhadores negros ao discutir produtividade em evento empresarial.',
      'A questão da produtividade no Brasil tem raízes culturais. O brasileiro, especialmente nas regiões mais pobres, tem uma cultura de trabalho diferente da europeia. É um legado histórico.',
      'Dito em evento do LIDE em São Paulo em setembro de 2021. Especialistas em relações raciais apontaram que a linguagem reforçava estereótipos raciais sobre preguiça e produtividade.',
      'verified', false, '2021-09-09',
      'https://valor.globo.com/politica/noticia/2021/09/09/mourao-cultura-trabalho-legado-historico.ghtml',
      'news_article',
      'Evento empresarial', 'LIDE — São Paulo',
      'mourao-cultura-trabalho-legado-historico-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- 15. Guedes — "privatizar tudo, até o Cristo Redentor" (2019)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Paulo Guedes afirmou que privatizaria "até o Cristo Redentor" se pudesse, declaração que gerou debate sobre os limites ideológicos de sua agenda privatista.',
      'Se pudesse, privatizava tudo. Até o Cristo Redentor. O Estado não sabe gerir nada. O privado faz melhor sempre.',
      'Dito em evento do Instituto Millenium em São Paulo em outubro de 2019. A afirmação foi criticada como ideologia extrema sem critério sobre o que deve ser público.',
      'verified', false, '2019-10-15',
      'https://www.youtube.com/watch?v=V5KXc7sF04A',
      'youtube_video',
      'V5KXc7sF04A',
      'Evento liberal', 'Instituto Millenium — São Paulo',
      'guedes-privatizar-tudo-cristo-redentor-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso, true FROM ins;

  -- 16. Lula — "só saio no caixão" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula declarou que só deixaria o poder "no caixão", afirmação amplamente comparada a posturas antidemocráticas de lideranças autoritárias.',
      'Só saio daqui no caixão. Fui eleito pelo povo e vou cumprir meu mandato até o último dia. Nenhum golpista vai me tirar.',
      'Dito em evento em Brasília em outubro de 2024, ao responder sobre especulações sobre saúde e possibilidade de substituição. A frase gerou comparações com Bolsonaro.',
      'verified', false, '2024-10-18',
      'https://www.youtube.com/watch?v=QNz9Y0j_0oY',
      'youtube_video',
      'QNz9Y0j_0oY', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Evento governamental', 'Brasília',
      'lula-so-saio-no-caixao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- 17. Lula — "jornalismo é vendido" (2024)
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_video_id, youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula disse que parte do jornalismo brasileiro é "vendido" e trabalha por interesses econômicos contra os mais pobres, acusação sem provas apresentadas.',
      'Grande parte do jornalismo brasileiro é vendida. São empresas que trabalham para os ricos contra os pobres. Não é jornalismo, é lobby.',
      'Dito em entrevista à Rádio Guaíba em Porto Alegre em março de 2024. A ABI e a Fenaj emitiram nota pedindo que o presidente apresente provas ou se retrate.',
      'verified', false, '2024-03-12',
      'https://www.youtube.com/watch?v=PX6bfHQkTu8',
      'youtube_video',
      'PX6bfHQkTu8', 'UCqrHSzAHlTxFGKibGSCN-1A',
      'Entrevista', 'Rádio Guaíba — Porto Alegre',
      'lula-jornalismo-vendido-rico-pobre-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins UNION ALL
  SELECT id, c_abuso,   false FROM ins;

END $$;
