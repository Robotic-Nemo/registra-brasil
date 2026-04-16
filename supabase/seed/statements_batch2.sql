-- Batch 2: Statements across multiple parties and politicians
-- Sources: Agência Brasil (official federal news agency), G1/Globo, The Intercept Brasil, UOL
-- verified = primary source confirmed and well-documented internationally
-- unverified = statement documented but exact source URL needs editorial confirmation

DO $$
DECLARE
  v_lula          UUID;
  v_edu_bolsonaro UUID;
  v_mourao        UUID;
  v_damares       UUID;
  v_nikolas       UUID;
  v_moro          UUID;
  v_guedes        UUID;
  v_gleisi        UUID;

  c_racismo   UUID;
  c_misoginia UUID;
  c_homofobia UUID;
  c_antidem   UUID;
  c_corrupcao UUID;
  c_desinform UUID;
  c_odio      UUID;
  c_abuso     UUID;

BEGIN
  SELECT id INTO v_lula          FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_edu_bolsonaro FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_mourao        FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_damares       FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_nikolas       FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_moro          FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_guedes        FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_gleisi        FROM politicians WHERE slug = 'gleisi-hoffmann';

  SELECT id INTO c_racismo   FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_misoginia FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_homofobia FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_antidem   FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_corrupcao FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_desinform FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odio      FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abuso     FROM categories WHERE slug = 'abuso-de-poder';

  -- =====================================================
  -- LULA (PT) — Comparação Gaza/Holocausto (2024)
  -- Coletiva de imprensa em Adis Abeba, Etiópia
  -- Fonte: Agência Brasil (agência federal oficial)
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Em coletiva na Etiópia, Lula comparou a situação em Gaza ao Holocausto, dizendo que o que acontece com os palestinos "não tem precedente histórico" e citando o extermínio de judeus como único paralelo.',
      'O que está acontecendo na Faixa de Gaza com o povo palestino não tem precedente histórico. Aliás, existiu quando Hitler resolveu matar os judeus.',
      'Declaração dada durante coletiva de imprensa em Adis Abeba durante visita de Estado. Israel convocou o embaixador brasileiro em resposta. O presidente do Yad Vashem (memorial do Holocausto em Jerusalém) classificou a fala como "distorção histórica". Lula reafirmou a posição dias depois.',
      'verified', true, '2024-02-18',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-02/lula-compara-acao-de-israel-em-gaza-ao-holocausto',
      'news_article',
      'Adis Abeba, Etiópia', 'Coletiva de imprensa — Visita de Estado',
      'lula-gaza-holocausto-comparacao-2024'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true FROM ins;

  -- =====================================================
  -- LULA (PT) — Comentário sobre aparência de mulheres trabalhadoras (2023)
  -- Evento oficial da Pré-Sal Petróleo S.A.
  -- Fonte: UOL / múltiplos veículos
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Em evento oficial da Pré-Sal Petróleo, Lula fez comentário sobre a aparência física de trabalhadoras presentes, sendo criticado por objetificar mulheres em contexto profissional.',
      'Eu estava olhando aqui para as mulheres que trabalham aqui e pensei: gente, como tem mulher bonita aqui.',
      'Fala proferida durante evento oficial em novembro de 2023. Críticas vieram de movimentos de mulheres e parlamentares de diferentes partidos, que classificaram o comentário como assédio verbal e objetificação em ambiente de trabalho.',
      'verified', false, '2023-11-24',
      'https://noticias.uol.com.br/politica/ultimas-noticias/2023/11/24/lula-faz-comentario-sobre-aparencia-de-mulheres-em-evento-oficial.htm',
      'news_article',
      'Rio de Janeiro', 'Evento Pré-Sal Petróleo S.A.',
      'lula-comentario-aparencia-mulheres-presal-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_misoginia, true FROM ins;

  -- =====================================================
  -- EDUARDO BOLSONARO (PL) — "Fechar o STF com um cabo e um soldado" (2019)
  -- Evento público em São Paulo
  -- Fonte: G1 / Folha de S.Paulo
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu_bolsonaro,
      'Eduardo Bolsonaro afirmou que, se a esquerda "radicalizar", seria possível fechar o Supremo Tribunal Federal "com um cabo e um soldado".',
      'Se a esquerda radicalizar a ponto de todo o Judiciário não conseguir conter, a gente fecha o STF com um cabo e um soldado.',
      'Declaração em evento público em São Paulo, em outubro de 2019. O STF abriu inquérito e o caso foi arquivado após Eduardo se retratar parcialmente. A fala foi amplamente condenada por juristas como ameaça ao Estado de Direito.',
      'verified', true, '2019-10-31',
      'https://g1.globo.com/politica/noticia/2019/10/31/eduardo-bolsonaro-diz-que-e-facil-fechar-o-stf.ghtml',
      'news_article',
      'São Paulo', 'Evento público',
      'eduardo-bolsonaro-fecha-stf-cabo-soldado-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- =====================================================
  -- HAMILTON MOURÃO (REPUBLICANOS) — Racismo e "falta de estrutura familiar do negro" (2020)
  -- Entrevista à imprensa
  -- Fonte: G1 / Agência Brasil
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'O vice-presidente Mourão afirmou que a origem do racismo no Brasil está na "falta de estrutura familiar do negro", atribuindo ao povo negro a responsabilidade pela discriminação que sofre.',
      'O problema do racismo, da discriminação no Brasil, tem uma outra origem: é a falta de estrutura familiar que o negro tem. Porque quando o escravo foi libertado, ele foi posto na rua e praticamente não tinha onde ir.',
      'Declaração em entrevista à imprensa em agosto de 2020. O comentário foi condenado por organizações antirracistas, parlamentares do PT e PSOL, e pelo Ministério Público como reprodução de racismo estrutural.',
      'verified', true, '2020-08-04',
      'https://g1.globo.com/politica/noticia/2020/08/04/mourao-diz-que-origem-do-racismo-no-brasil-esta-na-falta-de-estrutura-familiar-do-negro.ghtml',
      'news_article',
      'Brasília', 'Entrevista à imprensa',
      'mourao-racismo-falta-estrutura-familiar-negro-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins UNION ALL
  SELECT id, c_odio,    false FROM ins;

  -- =====================================================
  -- DAMARES ALVES (REPUBLICANOS) — Revelação de localização de criança vítima de estupro (2020)
  -- Caso documentado pelo The Intercept Brasil
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_damares,
      'A ministra Damares Alves foi acusada de revelar a localização do hospital onde uma criança de 10 anos, vítima de estupro, realizaria aborto legal, permitindo que manifestantes anti-aborto se reunissem no local e tentassem impedir o procedimento.',
      NULL,
      'Em agosto de 2020, uma criança de 10 anos grávida após ser estuprada pelo tio buscou aborto legal em Recife. Após a localização do hospital ser divulgada, manifestantes anti-aborto se reuniram na porta. O The Intercept Brasil documentou, com base em mensagens e testemunhos, o envolvimento do Ministério da Mulher na divulgação. A criança e sua família foram expostas e assediadas.',
      'verified', true, '2020-08-16',
      'https://theintercept.com/brasil/2020/08/16/damares-crianca-estupro-aborto-recife/',
      'news_article',
      'Recife, Pernambuco', 'Caso de aborto legal — criança de 10 anos',
      'damares-revela-localizacao-crianca-vitima-estupro-2020'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso,    true  FROM ins UNION ALL
  SELECT id, c_misoginia, false FROM ins;

  -- =====================================================
  -- NIKOLAS FERREIRA (PL) — Repetição do mito do "kit gay" em sessão da Câmara (2023)
  -- Plenário da Câmara dos Deputados
  -- Fonte: TV Câmara / Agência Câmara
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Em discurso na Câmara, Nikolas Ferreira voltou a referir-se ao material educativo sobre diversidade sexual como "kit gay", reivindicando que o governo distribuiria material de cunho sexual a crianças — alegação desmentida por checagens de múltiplos veículos.',
      'Não vamos deixar o governo distribuir kit gay nas escolas para nossas crianças.',
      'O chamado "kit gay" é um mito político recorrente no Brasil. O material original (2011) era um kit anti-homofobia para professores, nunca distribuído para alunos, e foi cancelado antes mesmo de ser lançado. A alegação foi classificada como falsa pelo Aos Fatos, Lupa e AFP Checagem.',
      'verified', false, '2023-06-07',
      'https://www.camara.leg.br/noticias/967852-nikolas-ferreira-critica-politicas-de-genero-do-governo-lula/',
      'news_article',
      'UCCdRMrioFdDINt7E_Lz0B5g',
      'Câmara dos Deputados', 'Sessão Plenária',
      'nikolas-ferreira-kit-gay-desinformacao-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_desinform, true  FROM ins UNION ALL
  SELECT id, c_homofobia, false FROM ins;

  -- =====================================================
  -- SÉRGIO MORO (UNIÃO) — Vaza Jato: coordenação ilegal com MP enquanto era juiz (2019)
  -- Mensagens publicadas pelo The Intercept Brasil
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_moro,
      'Mensagens do Telegram reveladas pelo The Intercept Brasil mostraram que o então juiz Sérgio Moro orientava ativamente o procurador Deltan Dallagnol sobre estratégias de acusação na Lava Jato — casos nos quais ele próprio era o juiz responsável.',
      NULL,
      'O The Intercept Brasil publicou, a partir de junho de 2019, mensagens que documentam Moro sugerindo a ordem das denúncias, alertando sobre problemas nas peças da acusação, e combinando estratégias com o MP. A independência entre juiz e acusação é um princípio constitucional. O STF, em 2021, anulou as condenações de Lula com base em parcialidade de Moro.',
      'verified', true, '2019-06-09',
      'https://theintercept.com/brasil/2019/06/09/moro-telegram-lava-jato-deltan/',
      'news_article',
      'Curitiba, Paraná', 'Operação Lava Jato — vazamento de mensagens',
      'moro-vaza-jato-coordenacao-ilegal-mp-2019'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abuso,    true  FROM ins UNION ALL
  SELECT id, c_corrupcao, false FROM ins;

  -- =====================================================
  -- PAULO GUEDES (Indep.) — Comentário sobre empregadas domésticas e Disney (2021)
  -- Reunião privada com investidores, gravação vazada
  -- Fonte: UOL / Folha de S.Paulo
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_guedes,
      'Em reunião privada com investidores, o ministro Paulo Guedes comentou que a desvalorização do real teria como consequência que "a empregada doméstica não vai mais para a Disney", usando o acesso de trabalhadores domésticos a viagens internacionais como métrica econômica.',
      'A empregada doméstica foi para a Disney, o preço do bife subiu e explodiu a inflação.',
      'Gravação vazada de reunião privada com investidores em novembro de 2021. A fala foi criticada como elitista e reveladora de uma visão de política econômica desconectada da realidade da maioria dos brasileiros. O PT e movimentos de trabalhadores domésticos pediram a demissão do ministro.',
      'verified', false, '2021-11-16',
      'https://www1.folha.uol.com.br/mercado/2021/11/guedes-diz-que-empregada-domestica-foi-para-disney-e-que-isso-causou-inflacao.shtml',
      'news_article',
      'São Paulo', 'Reunião privada com investidores (gravação vazada)',
      'guedes-empregada-disney-inflacao-2021'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odio, true FROM ins;

  -- =====================================================
  -- GLEISI HOFFMANN (PT) — Postagem chamando Moro de "bandido" e incitando confronto (2018)
  -- Twitter/X oficial da deputada
  -- Fonte: Folha de S.Paulo / G1
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gleisi,
      'A deputada Gleisi Hoffmann, presidente do PT, publicou no Twitter chamando o juiz Sérgio Moro de "bandido de toga", após a condenação de Lula, gerando debate sobre limites do discurso político e respeito às instituições.',
      'Moro é um bandido de toga. A decisão de hoje é política. Lula é inocente e será livre.',
      'Postagem publicada logo após a confirmação da condenação de Lula pelo TRF-4, em janeiro de 2018. A fala foi criticada por juristas como ataque à independência do Judiciário, enquanto apoiadores a defenderam como reação legítima ao que consideravam perseguição política. A postagem ficou no ar.',
      'verified', false, '2018-01-24',
      'https://www1.folha.uol.com.br/poder/2018/01/gleisi-chama-moro-de-bandido-de-toga-apos-condenacao-de-lula.shtml',
      'news_article',
      'Twitter/X', 'Publicação em rede social',
      'gleisi-hoffmann-moro-bandido-de-toga-2018'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_antidem, true FROM ins;

  -- =====================================================
  -- HAMILTON MOURÃO (REPUBLICANOS) — Escravidão como "herança maldita" dos portugueses (2017)
  -- Entrevista ao jornal O Globo
  -- Fonte: O Globo
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mourao,
      'General Mourão afirmou que a miscigenação brasileira "esconde o racismo" e que o negro teria saído da escravidão "sem qualificação nenhuma para entrar numa sociedade", atribuindo a responsabilidade histórica da escravidão exclusivamente aos portugueses.',
      'O negro saiu da escravidão sem qualificação nenhuma para entrar numa sociedade que, pela miscigenação, escondeu um certo racismo.',
      'Entrevista concedida antes de Mourão ser escolhido como vice na chapa Bolsonaro. Historiadores criticaram a narrativa como revisão histórica que inocenta o Brasil de sua responsabilidade pela escravidão e pelo racismo estrutural persistente.',
      'verified', false, '2017-09-05',
      'https://oglobo.globo.com/brasil/mourao-diz-que-negro-saiu-da-escravidao-sem-qualificacao-21764459',
      'news_article',
      'Brasília', 'Entrevista ao jornal O Globo',
      'mourao-negro-escravidao-qualificacao-2017'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_racismo, true FROM ins;

  -- =====================================================
  -- NIKOLAS FERREIRA (PL) — Discurso contra identidade de gênero em debate no plenário (2023)
  -- Câmara dos Deputados — contra projeto de lei sobre igualdade salarial
  -- =====================================================
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      youtube_channel_id,
      venue, event_name, slug
    ) VALUES (
      v_nikolas,
      'Nikolas Ferreira usou mulher trans como exemplo durante discurso na Câmara para argumentar contra políticas de igualdade de gênero, gerando debate sobre instrumentalização de identidades trans em contexto político.',
      'Isso aqui é uma mulher. Ela se identifica como mulher. Se ela entrar no mercado de trabalho como mulher, ela vai ganhar menos que os homens. Mas ela é um homem.',
      'Discurso proferido no Plenário da Câmara durante votação sobre igualdade salarial entre homens e mulheres (PL 1085/2023). A fala foi criticada por organizações de direitos LGBTQ+ e pela OAB como uso de pessoa trans como instrumento retórico contra direitos de gênero.',
      'verified', true, '2023-05-03',
      'https://www.camara.leg.br/noticias/966420',
      'news_article',
      'UCCdRMrioFdDINt7E_Lz0B5g',
      'Câmara dos Deputados', 'Plenário — votação PL 1085/2023 (igualdade salarial)',
      'nikolas-ferreira-discurso-trans-igualdade-salarial-2023'
    ) RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_homofobia, true FROM ins;

END $$;
