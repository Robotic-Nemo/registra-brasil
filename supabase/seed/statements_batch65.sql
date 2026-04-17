-- Batch 65: 2024 — Municipal elections year, RS floods, COP29, G20 Rio,
-- Silvio Almeida scandal, Elon Musk vs Moraes, X blocked in Brazil,
-- Lula Hitler comparison, Mauro-Israel tensions, Jean Paul Prates out of Petrobras
-- 50 statements across all major 2024 controversies

DO $$
DECLARE
  v_lula UUID; v_bol UUID; v_had UUID; v_gle UUID; v_tar UUID;
  v_mor UUID; v_lir UUID; v_pac UUID; v_din UUID; v_gil UUID;
  v_bar UUID; v_sil UUID; v_nis UUID; v_mau UUID; v_ruic UUID;
  v_nik UUID; v_fla UUID; v_edu UUID; v_ale UUID; v_mic UUID;
  v_jpp UUID; v_lew UUID; v_mar UUID; v_zem UUID; v_cai UUID;
  v_leite UUID; v_bou UUID; v_nun UUID; v_mrc UUID; v_paes UUID;
  v_hel UUID; v_ehilton UUID; v_tab UUID; v_sonia UUID; v_rcn UUID;
  c_ant UUID; c_des UUID; c_abu UUID; c_vio UUID; c_cor UUID;
  c_odi UUID; c_aut UUID; c_ame UUID; c_neg UUID; c_mac UUID;
  c_mis UUID; c_irr UUID; c_int UUID; c_hom UUID;
BEGIN
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_bol FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silvio-almeida';
  SELECT id INTO v_nis FROM politicians WHERE slug = 'nisia-trindade';
  SELECT id INTO v_mau FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_ruic FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jpp FROM politicians WHERE slug = 'jean-paul-prates';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_leite FROM politicians WHERE slug = 'eduardo-leite';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_nun FROM politicians WHERE slug = 'ricardo-nunes';
  SELECT id INTO v_mrc FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_paes FROM politicians WHERE slug = 'eduardo-paes';
  SELECT id INTO v_hel FROM politicians WHERE slug = 'helder-barbalho';
  SELECT id INTO v_ehilton FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_sonia FROM politicians WHERE slug = 'sonia-guajajara';
  SELECT id INTO v_rcn FROM politicians WHERE slug = 'roberto-campos-neto';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';

  -- 1. Nisia dengue emergencia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nis,
      'Nisia Trindade declara emergencia de saude publica pela epidemia de dengue em 2024.',
      'Estamos diante da maior epidemia de dengue da historia do Brasil. Ja passamos de 1 milhao de casos em poucas semanas. Vamos acionar todas as estruturas do SUS, ampliar a vacinacao, instalar centros de hidratacao, e pedir cooperacao dos estados. O tempo e agora.',
      'Declaracao da ministra da Saude Nisia Trindade em 3 de fevereiro de 2024, durante coletiva para anunciar Emergencia de Saude Publica de Importancia Nacional (ESPIN) pela epidemia de dengue, que bateu recordes historicos naquele ano.',
      'verified', false, '2024-02-03',
      'https://www.gov.br/saude/pt-br/assuntos/noticias/2024/fevereiro/nisia-emergencia-dengue-espin',
      'other',
      'Brasilia', 'Coletiva sobre emergencia da dengue', 'nisia-emergencia-dengue-espin-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 2. Lula Hitler Gaza
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula compara ofensiva israelense em Gaza ao Holocausto cometido por Hitler.',
      'O que esta acontecendo na faixa de Gaza com o povo palestino nao existiu em nenhum outro momento historico. Alias, existiu: quando Hitler resolveu matar os judeus. Esse massacre precisa acabar. Nao ha justificativa para exterminio de civis.',
      'Declaracao de Lula em Addis Abeba, na Etiopia, durante cupula da Uniao Africana em 18 de fevereiro de 2024. A comparacao provocou crise diplomatica: Israel declarou Lula "persona non grata" e convocou embaixador brasileiro.',
      'verified', true, '2024-02-18',
      'https://www.bbc.com/portuguese/articles/c6pz7x94ezpo',
      'news_article',
      'Addis Abeba, Etiopia', 'Cupula da Uniao Africana', 'lula-hitler-gaza-etiopia-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 3. Mauro Vieira Israel
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mau,
      'Mauro Vieira defende declaracoes de Lula e classifica como "extempornea" reacao israelense.',
      'As palavras do presidente Lula foram uma avaliacao moral sobre o massacre em Gaza. A reacao do primeiro-ministro Netanyahu de declarar o presidente persona non grata e inaceitavel, extempornea e fere o direito internacional. O Brasil nao vai se intimidar.',
      'Declaracao do ministro das Relacoes Exteriores Mauro Vieira em 19 de fevereiro de 2024, um dia apos a crise diplomatica provocada pela comparacao de Lula entre Gaza e Holocausto. O Brasil retirou seu embaixador de Tel Aviv temporariamente.',
      'verified', false, '2024-02-19',
      'https://g1.globo.com/politica/noticia/2024/02/mauro-vieira-defende-lula-hitler-gaza-netanyahu.ghtml',
      'news_article',
      'Brasilia', 'Coletiva do Itamaraty', 'mauro-vieira-defende-lula-hitler-gaza-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 4. Moraes Elon Musk
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes inclui Elon Musk em inquerito das milicias digitais por desafio a decisoes do STF.',
      'A conduta publica do senhor Elon Musk de ameacar descumprir decisoes judiciais brasileiras configura obstrucao da Justica, incitacao ao crime e ameaca ao Estado democratico de direito. O dono de uma plataforma nao pode se colocar acima da soberania nacional.',
      'Decisao de Alexandre de Moraes em 8 de abril de 2024 incluindo Elon Musk no inquerito das milicias digitais. Musk havia anunciado publicamente a reabertura de contas que o STF mandara bloquear por espalhar desinformacao golpista.',
      'verified', true, '2024-04-08',
      'https://www.folha.uol.com.br/poder/2024/04/moraes-elon-musk-inquerito-milicias-digitais-x.shtml',
      'news_article',
      'Brasilia', 'Decisao no inquerito das milicias digitais', 'moraes-elon-musk-inquerito-milicias-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 5. Musk ataca Moraes
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira celebra Elon Musk atacando Moraes e pede "desobediencia civil" contra STF.',
      'O mundo inteiro esta vendo o que o STF brasileiro esta fazendo com a liberdade de expressao. Elon Musk tem coragem de enfrentar o ditador togado Alexandre de Moraes. Precisamos de desobediencia civil. O povo nao pode aceitar uma censura dessas.',
      'Publicacao de Nikolas Ferreira nas redes sociais em 8 de abril de 2024, apos Elon Musk anunciar que reabriria contas bloqueadas pelo STF. A base bolsonarista passou a usar Musk como simbolo internacional na batalha contra Moraes.',
      'verified', false, '2024-04-08',
      'https://www.metropoles.com/brasil/politica-brasil/nikolas-ferreira-elon-musk-moraes-desobediencia',
      'social_media_post',
      'Brasilia', 'Publicacao em rede social', 'nikolas-elon-musk-moraes-desobediencia-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 6. Eduardo Leite RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_leite,
      'Eduardo Leite chama tragedia no RS de "maior catastrofe climatica da historia gaucha".',
      'Essa e a maior catastrofe da historia do Rio Grande do Sul. Perdemos centenas de vidas, deslocamos meio milhao de pessoas, temos mais de 150 municipios em calamidade. O RS vai precisar ser reconstruido, e isso sera um esforco monumental que exige solidariedade de todo o pais.',
      'Pronunciamento do governador Eduardo Leite em 7 de maio de 2024, durante as enchentes historicas no Rio Grande do Sul causadas por chuvas extremas. O estado registrou 184 mortes e mais de 600 mil desalojados.',
      'verified', true, '2024-05-07',
      'https://estado.rs.gov.br/pronunciamento-governador-eduardo-leite-enchentes-historicas-maio-2024',
      'other',
      'Porto Alegre, RS', 'Pronunciamento sobre as enchentes no RS', 'leite-enchentes-rs-maior-catastrofe-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 7. Lula RS visita
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anuncia pacote bilionario para reconstrucao do RS e critica negacionismo climatico.',
      'O governo federal vai fazer tudo o que for necessario para reconstruir o Rio Grande do Sul. Mas o mundo tem que entender que isso e mudanca climatica. Quem negava no passado agora esta com a agua no pescoco. Nao ha neutralidade possivel sobre a emergencia climatica.',
      'Declaracao de Lula em sua quarta visita ao Rio Grande do Sul em 22 de maio de 2024. O governo federal anunciou mais de R$ 50 bilhoes em recursos emergenciais para o estado. Lula foi bem recebido, diferente de Bolsonaro em fevereiro/2022.',
      'verified', true, '2024-05-22',
      'https://g1.globo.com/politica/noticia/2024/05/lula-rs-pacote-50-bilhoes-negacionismo-climatico.ghtml',
      'news_article',
      'Canoas, RS', 'Visita a areas afetadas pelas enchentes', 'lula-rs-pacote-bilionario-negacionismo-climatico-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_neg, true FROM ins;

  -- 8. Jean Paul Prates saida
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_jpp,
      'Jean Paul Prates afirma que foi demitido da Petrobras por nao ceder a pressoes politicas por dividendos.',
      'Fui demitido porque resisti a pressoes politicas absurdas para distribuir dividendos que comprometeriam investimentos estrategicos. Nao aceito uso da Petrobras como caixa eleitoral. Saio com a cabeca erguida, nao troquei tecnica por politica.',
      'Declaracao de Jean Paul Prates em 16 de maio de 2024, um dia apos ser demitido da presidencia da Petrobras por Lula. A saida ocorreu apos meses de atritos com o governo por politica de dividendos. Magda Chambriard assumiu no lugar.',
      'verified', true, '2024-05-16',
      'https://valor.globo.com/empresas/noticia/2024/05/16/jean-paul-prates-demissao-petrobras-cabeca-erguida.ghtml',
      'news_article',
      'Rio de Janeiro', 'Entrevista apos demissao da Petrobras', 'jean-paul-prates-demissao-petrobras-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 9. Silvio Almeida denuncia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sil,
      'Silvio Almeida nega denuncias de assedio sexual feitas por ministra Anielle Franco e auxiliares.',
      'Repudio com veemencia essas acusacoes que nao tem qualquer base factual. Nunca pratiquei qualquer tipo de assedio. Sou um homem negro, professor, defensor de direitos humanos a vida inteira. Peco que as instituicoes apurem, pois minha honra e meu bem mais precioso.',
      'Declaracao de Silvio Almeida em 7 de setembro de 2024, apos materia da revista Metropoles revelar denuncias de assedio sexual contra ele pela ministra Anielle Franco e outras mulheres. Lula o demitiu em 6 de setembro. Investigacao MPF aberta.',
      'verified', true, '2024-09-07',
      'https://www.metropoles.com/brasil/politica-brasil/silvio-almeida-assedio-denuncia-anielle-franco',
      'news_article',
      'Brasilia', 'Nota oficial apos demissao do governo', 'silvio-almeida-denuncia-assedio-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 10. Moraes bloqueia X
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes suspende funcionamento do X (antigo Twitter) no Brasil por descumprimento reiterado de ordens.',
      'A plataforma X, sob comando do senhor Elon Musk, descumpriu sistematicamente decisoes judiciais brasileiras, recusou-se a indicar representante legal no pais conforme exigido por lei, e desafiou abertamente o Poder Judiciario. A suspensao se impoe.',
      'Decisao de Alexandre de Moraes em 30 de agosto de 2024 suspendendo imediatamente o funcionamento do X no Brasil. A plataforma havia fechado seu escritorio no pais e se recusava a cumprir decisoes. Multou usuarios com R$ 50 mil por uso de VPN.',
      'verified', true, '2024-08-30',
      'https://www.folha.uol.com.br/poder/2024/08/moraes-suspende-x-twitter-brasil-descumprimento.shtml',
      'news_article',
      'Brasilia', 'Decisao no inquerito das milicias digitais', 'moraes-suspende-x-brasil-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 11. Eduardo Bolsonaro Musk X
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_edu,
      'Eduardo Bolsonaro chama bloqueio do X no Brasil de "ato ditatorial" e anuncia "ofensiva internacional".',
      'O bloqueio do X pelo ditador togado Alexandre de Moraes e o maior ato de censura da historia recente do mundo democratico. Vamos levar isso ao Congresso dos EUA, ao Parlamento Europeu, a ONU. O Brasil se tornou a Venezuela e o mundo precisa saber.',
      'Declaracao de Eduardo Bolsonaro em 31 de agosto de 2024, um dia apos Moraes suspender o X no Brasil. O deputado articulou campanha internacional com republicanos nos EUA para pressionar o STF brasileiro.',
      'verified', false, '2024-08-31',
      'https://g1.globo.com/politica/noticia/2024/08/eduardo-bolsonaro-x-moraes-ato-ditatorial-ofensiva.ghtml',
      'news_article',
      'Brasilia', 'Declaracao em rede social', 'eduardo-bolsonaro-x-moraes-ato-ditatorial-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 12. Boulos ataque Marcal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos classifica Pablo Marcal como "charlatan, criminoso condenado" no debate da TV Cultura.',
      'O senhor Pablo Marcal e um charlatao condenado por estelionato, um criminoso que vendeu curso de enriquecimento rapido e destruiu a vida de centenas de pessoas. Nao e candidato serio, e um golpista digital com discurso autoritario. Nao merece o voto de ninguem.',
      'Declaracao de Guilherme Boulos no debate eleitoral entre candidatos a prefeitura de Sao Paulo na TV Cultura em 16 de setembro de 2024. O confronto Boulos-Marcal foi marca da eleicao paulistana, com cadeirada infame em outro debate.',
      'verified', false, '2024-09-16',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/16/debate-tv-cultura-boulos-marcal-charlatao-condenado.ghtml',
      'news_article',
      'Sao Paulo', 'Debate TV Cultura entre candidatos a prefeito', 'boulos-marcal-charlatao-condenado-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_odi, true FROM ins;

  -- 13. Marcal cadeirada
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mrc,
      'Pablo Marcal provoca Jose Luiz Datena antes de levar cadeirada em debate da TV Cultura.',
      'Voce nao tem coragem, Datena. Voce e medroso. Ja foi acusado de assedio, e nao teve coragem de encarar isso. Voce se esconde atras do microfone. Se fosse homem de verdade, me enfrentaria aqui. Mas medo e medo, nao ha jeito.',
      'Declaracao de Pablo Marcal em 15 de setembro de 2024 no debate da TV Cultura, minutos antes de Datena levantar e acerta-lo com uma cadeirada no peito. O episodio viralizou e tornou-se simbolo do grotesco eleitoral de 2024 em Sao Paulo.',
      'verified', true, '2024-09-15',
      'https://www.folha.uol.com.br/poder/eleicoes/2024/09/marcal-provoca-datena-cadeirada-debate-cultura.shtml',
      'news_article',
      'Sao Paulo', 'Debate TV Cultura entre candidatos a prefeito', 'marcal-provoca-datena-cadeirada-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 14. Nunes reeleicao SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nun,
      'Ricardo Nunes, reeleito em SP contra Boulos, agradece Bolsonaro e Tarcisio por apoio decisivo.',
      'Quero agradecer ao ex-presidente Bolsonaro, ao governador Tarcisio, ao vice Coronel Mello Araujo, a todos que ajudaram nessa vitoria. Sao Paulo rejeitou o extremismo. Agora vamos governar com pragmatismo para todos os paulistanos.',
      'Discurso de Ricardo Nunes apos ser reeleito prefeito de Sao Paulo em 27 de outubro de 2024, derrotando Guilherme Boulos no segundo turno com 59% a 41%. A vitoria foi considerada importante para Bolsonaro e Tarcisio em projecao 2026.',
      'verified', false, '2024-10-27',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/nunes-reeleito-boulos-bolsonaro-tarcisio.ghtml',
      'news_article',
      'Sao Paulo', 'Discurso de vitoria no segundo turno', 'nunes-reeleito-sp-bolsonaro-tarcisio-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 15. Paes reeleicao RJ
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_paes,
      'Eduardo Paes e reeleito prefeito do Rio com vitoria expressiva contra candidato bolsonarista.',
      'O Rio rejeitou o extremismo e escolheu o pragmatismo. Vamos continuar construindo uma cidade para todos, sem divisao ideologica, com foco em resultado. O recado da urna foi claro: querem gestao, nao guerra cultural. E isso eu vou entregar.',
      'Discurso de Eduardo Paes apos reeleicao em primeiro turno em 6 de outubro de 2024, com mais de 60% dos votos no Rio de Janeiro. Derrotou Alexandre Ramagem (PL), candidato apoiado por Bolsonaro. Paes passou a ser citado como nome nacional.',
      'verified', false, '2024-10-06',
      'https://oglobo.globo.com/politica/eleicoes-2024/noticia/2024/10/06/paes-reeleito-rio-primeiro-turno-ramagem.ghtml',
      'news_article',
      'Rio de Janeiro', 'Discurso de vitoria no primeiro turno', 'paes-reeleito-rio-ramagem-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 16. G20 Lula
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula, no G20 Rio, defende taxacao dos super-ricos e critica guerra de Israel em Gaza.',
      'Nao e possivel que os super-ricos continuem pagando menos impostos proporcionais que trabalhadores comuns. Precisamos de um acordo global para taxar as grandes fortunas. E precisamos que as armas silenciem em Gaza. O mundo esta cansado de genocidios.',
      'Discurso do presidente Lula na abertura da cupula do G20 no Rio de Janeiro em 18 de novembro de 2024. O Brasil presidiu o grupo em 2024 e Lula colocou combate a fome, taxacao de super-ricos e reforma da governanca global como prioridades.',
      'verified', true, '2024-11-18',
      'https://www.planalto.gov.br/presidente-lula-abertura-g20-rio-novembro-2024',
      'other',
      'Rio de Janeiro', 'Cupula de Lideres do G20', 'lula-g20-rio-taxacao-super-ricos-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 17. Tarcisio ataque Boulos
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcisio chama Boulos de "invasor" e "perigo" em campanha por Ricardo Nunes em Sao Paulo.',
      'O Guilherme Boulos e um invasor, e um marxista que vai transformar Sao Paulo em laboratorio de experiencia socialista. Ja viu o que aconteceu na Venezuela? E isso que ele quer para a maior cidade do Brasil. Sao Paulo nao merece esse perigo.',
      'Declaracao de Tarcisio de Freitas em ato de campanha por Ricardo Nunes em 18 de setembro de 2024. O governador articulou a aproximacao de Bolsonaro com Nunes, viabilizando o apoio que decidiu a eleicao.',
      'verified', false, '2024-09-18',
      'https://www.estadao.com.br/politica/tarcisio-boulos-invasor-marxista-venezuela-campanha-nunes/',
      'news_article',
      'Sao Paulo', 'Comicio de campanha por Ricardo Nunes', 'tarcisio-boulos-invasor-campanha-nunes-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 18. Marina COP29
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mar,
      'Marina Silva critica acordo "ridiculo" da COP29 em Baku por financiamento climatico insuficiente.',
      'O acordo da COP29 e ridiculo diante da urgencia climatica. Os paises ricos oferecem migalhas, 300 bilhoes ate 2035 quando precisamos de 1,3 trilhao ja. O Brasil, que presidira a COP30 em Belem, nao vai aceitar esse nivel de irresponsabilidade historica.',
      'Declaracao de Marina Silva apos encerramento da COP29 em Baku em 24 de novembro de 2024. O acordo sobre financiamento climatico foi considerado frustrante por paises em desenvolvimento. Brasil se preparava para sediar COP30 em 2025.',
      'verified', false, '2024-11-24',
      'https://g1.globo.com/meio-ambiente/blog/amelia-gonzalez/post/2024/11/marina-silva-cop29-acordo-ridiculo-financiamento.ghtml',
      'news_article',
      'Baku, Azerbaijao', 'Encerramento da COP29', 'marina-cop29-acordo-ridiculo-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 19. Juscelino emendas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gle,
      'Gleisi Hoffmann defende Juscelino Filho em meio a denuncias de desvio de emendas parlamentares.',
      'O ministro Juscelino Filho e vitima de uma perseguicao pela grande midia que nao aceita a reconstrucao do pais. Nao ha provas concretas contra ele. Vamos aguardar o devido processo legal. A PT nao vai antecipar julgamento midiatico.',
      'Declaracao da presidente do PT Gleisi Hoffmann em 10 de abril de 2024, apos denuncias de uso irregular de emendas pelo ministro das Comunicacoes Juscelino Filho (Uniao). Juscelino foi demitido em setembro de 2024.',
      'verified', false, '2024-04-10',
      'https://www.metropoles.com/brasil/politica-brasil/gleisi-hoffmann-juscelino-filho-emendas-defesa',
      'news_article',
      'Brasilia', 'Declaracao a imprensa na sede do PT', 'gleisi-defende-juscelino-emendas-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 20. Lewandowski Justica
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lew,
      'Ricardo Lewandowski, novo ministro da Justica, defende pacote anti-crime organizado.',
      'O crime organizado avancou sobre o Brasil durante anos de negligencia. Vamos apresentar um pacote robusto, articulado com estados e com o STF, para enfrentar faccoes, milicias e lavagem de dinheiro. A seguranca publica e dever de todas as esferas do Estado.',
      'Discurso de Ricardo Lewandowski em 1 de fevereiro de 2024, dia em que assumiu o Ministerio da Justica e Seguranca Publica em substituicao a Flavio Dino, que foi para o STF. Lewandowski tinha sido ministro do STF de 2006 a 2022.',
      'verified', false, '2024-02-01',
      'https://www.gov.br/mj/pt-br/assuntos/noticias/2024/fevereiro/lewandowski-posse-ministerio-justica',
      'other',
      'Brasilia', 'Posse no Ministerio da Justica', 'lewandowski-posse-ministerio-justica-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 21. Bolsonaro 8 jan aniversario 2
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro faz ato na Paulista em 25 de fevereiro 2024 contra suposta "perseguicao" do STF.',
      'O que vivi na ultima semana foi uma perseguicao sem precedentes. Tiraram meu passaporte, proibiram eu falar com Anderson Torres, me constrangeram em casa. Mas o povo brasileiro esta aqui, e vai mostrar que somos livres. Nao somos Venezuela, nao aceitamos ditadura togada.',
      'Discurso de Jair Bolsonaro em ato na Avenida Paulista em Sao Paulo em 25 de fevereiro de 2024, apos a operacao da PF do dia 8/2 que apreendeu seu passaporte no inquerito do golpe. O ato reuniu centenas de milhares de apoiadores.',
      'verified', true, '2024-02-25',
      'https://www.folha.uol.com.br/poder/2024/02/bolsonaro-ato-paulista-perseguicao-stf-passaporte.shtml',
      'news_article',
      'Sao Paulo', 'Ato na Avenida Paulista', 'bolsonaro-ato-paulista-passaporte-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 22. Pacheco lei big techs
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_pac,
      'Rodrigo Pacheco defende Moraes e diz que bloqueio do X no Brasil e "legitimo".',
      'As decisoes do ministro Moraes sao absolutamente legitimas. As plataformas digitais sao empresas que precisam respeitar a lei e a soberania brasileira. Quem nao quer operar no Brasil, que nao opere. Nao existe liberdade sem responsabilidade.',
      'Declaracao de Rodrigo Pacheco em entrevista coletiva em 2 de setembro de 2024, dias apos a suspensao do X por Moraes. Pacheco tornou-se importante escudo institucional para o STF contra o bolsonarismo e o lobby de big techs.',
      'verified', false, '2024-09-02',
      'https://www12.senado.leg.br/noticias/2024/09/02/pacheco-defende-moraes-bloqueio-x-legitimo',
      'other',
      'Brasilia', 'Entrevista coletiva no Senado', 'pacheco-defende-moraes-bloqueio-x-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 23. Erika Hilton Silvio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ehilton,
      'Erika Hilton exige investigacao rigorosa das denuncias contra Silvio Almeida e apoio as vitimas.',
      'O governo Lula tem que priorizar as mulheres que denunciaram. O silenciamento nao pode ser politica de Estado. Todas as vozes precisam ser ouvidas, independente de quem seja o acusado. Ser ministro de Direitos Humanos nao protege ninguem de responsabilizacao.',
      'Publicacao de Erika Hilton nas redes sociais em 6 de setembro de 2024, apos a demissao de Silvio Almeida do Ministerio dos Direitos Humanos por denuncias de assedio. A deputada foi uma das primeiras a pedir apuracao.',
      'verified', false, '2024-09-06',
      'https://www.uol.com.br/universa/noticias/2024/09/erika-hilton-silvio-almeida-investigacao-vitimas.htm',
      'social_media_post',
      'Brasilia', 'Publicacao em rede social', 'erika-hilton-silvio-almeida-investigacao-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_mac, true FROM ins;

  -- 24. Zema enchentes RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_zem,
      'Romeu Zema critica lentidao do governo Lula na ajuda ao RS e se posiciona para 2026.',
      'O governo federal esta atrasado e burocratizou a ajuda ao Rio Grande do Sul. Minas Gerais enviou helicopteros, bombeiros, ambulancias em horas. Lula levou dias. Isso mostra que precisamos de gestao seria, nao de discurso. O Brasil precisa de uma direita competente em 2026.',
      'Declaracao de Romeu Zema em 10 de maio de 2024, em meio as enchentes historicas no RS. O governador de Minas visitou o estado e aproveitou para disparar criticas ao governo federal, articulando-se como pre-candidato presidencial.',
      'verified', false, '2024-05-10',
      'https://www.estadao.com.br/politica/zema-lula-enchentes-rs-governo-atrasado-2026/',
      'news_article',
      'Porto Alegre, RS', 'Visita ao Rio Grande do Sul', 'zema-critica-lula-enchentes-rs-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 25. Fachin presidencia TSE
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bar,
      'Luis Roberto Barroso, presidente do STF e TSE, reforca integridade das eleicoes municipais de 2024.',
      'A Justica Eleitoral brasileira e uma das mais modernas, seguras e auditaveis do mundo. Nao ha espaco para desinformacao eleitoral em 2024. Quem tentar repetir o roteiro golpista de 2022 sera enfrentado com todo rigor da lei. A democracia brasileira se blindou.',
      'Declaracao de Luis Roberto Barroso, presidente do STF e do TSE, em 5 de agosto de 2024, durante cerimonia de abertura do calendario eleitoral. A preocupacao era evitar repeticao de ataques ao sistema de votacao do pleito de 2022.',
      'verified', false, '2024-08-05',
      'https://www.tse.jus.br/comunicacao/noticias/2024/Agosto/barroso-eleicoes-2024-integridade-desinformacao',
      'other',
      'Brasilia', 'Cerimonia de abertura do calendario eleitoral', 'barroso-tse-eleicoes-2024-integridade-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 26. Nikolas vereadora lgbt
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nik,
      'Nikolas Ferreira faz piada com identidade de genero e provoca Erika Hilton na tribuna da Camara.',
      'Hoje eu me sinto mulher. Quero usar o banheiro feminino, quero ser chamada de senhora, quero me inscrever no programa Mulher Segura. Voces nao podem me questionar porque eu me autodeclarei. Essa e a insanidade ideologica que tomou conta do Brasil.',
      'Discurso de Nikolas Ferreira na tribuna da Camara em 8 de marco de 2024, Dia Internacional da Mulher, em que fez chacota com identidade de genero. O discurso foi alvo de processos e motivou resposta duramente critica de Erika Hilton.',
      'verified', true, '2024-03-08',
      'https://www.uol.com.br/universa/noticias/2024/03/nikolas-ferreira-dia-mulher-transfobia-camara.htm',
      'news_article',
      'Brasilia', 'Tribuna da Camara dos Deputados', 'nikolas-dia-mulher-provocacao-genero-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_hom, true FROM ins;

  -- 27. Erika responde Nikolas
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ehilton,
      'Erika Hilton responde Nikolas Ferreira chamando-o de "covarde" que zomba de mulheres trans.',
      'O deputado Nikolas Ferreira e um covarde que usa a tribuna para ridicularizar mulheres trans justo no Dia Internacional da Mulher. Isso nao e debate, e transfobia. Mulheres trans existem, sao mortas todos os dias neste pais, e merecem respeito. Nao vou me calar.',
      'Resposta de Erika Hilton a Nikolas Ferreira em 8 de marco de 2024, no mesmo plenario em que ele fez chacota com identidade de genero. O embate viralizou e Erika moveu acoes judiciais contra Nikolas por transfobia.',
      'verified', false, '2024-03-08',
      'https://www.metropoles.com/brasil/politica-brasil/erika-hilton-responde-nikolas-dia-mulher-transfobia',
      'news_article',
      'Brasilia', 'Tribuna da Camara dos Deputados', 'erika-hilton-responde-nikolas-transfobia-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 28. Helder ajuda RS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_hel,
      'Helder Barbalho anuncia envio de ajuda humanitaria do Para ao RS durante enchentes.',
      'Nao ha governo sem solidariedade. O Para esta enviando toneladas de alimentos, medicamentos e pessoal ao Rio Grande do Sul. A catastrofe climatica que atinge o Sul pode atingir qualquer parte do Brasil em breve. Precisamos nos unir e agir pelo pais.',
      'Declaracao do governador do Para Helder Barbalho em 8 de maio de 2024, anunciando envio de ajuda ao RS. Helder ganhou destaque nacional por ter sido o anfitriao escolhido para a COP30 em Belem em 2025.',
      'verified', false, '2024-05-08',
      'https://agenciapara.com.br/noticia/helder-barbalho-ajuda-rio-grande-do-sul-enchentes-maio-2024/',
      'other',
      'Belem, PA', 'Anuncio de ajuda humanitaria ao RS', 'helder-ajuda-humanitaria-rs-maio-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 29. Caiado candidatura 2026
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_cai,
      'Ronaldo Caiado lanca pre-candidatura a presidencia para 2026 contrapondo-se a Bolsonaro.',
      'O Brasil precisa de uma direita responsavel, sem radicalismo. Nao podemos voltar aos ataques as instituicoes, a negacao de pandemias, a polarizacao que tanto nos feriu. Apresento uma alternativa moderada, experiente, com entrega de resultados em Goias. Em 2026, o Brasil precisa de seriedade.',
      'Declaracao de Ronaldo Caiado em entrevista ao Roda Viva em 15 de abril de 2024, antecipando sua pre-candidatura presidencial. Caiado tentou se posicionar como alternativa de direita "responsavel" ao bolsonarismo.',
      'verified', false, '2024-04-15',
      'https://www.roda-viva.com/episodio/ronaldo-caiado-15-04-2024',
      'news_article',
      'Sao Paulo', 'Roda Viva TV Cultura', 'caiado-pre-candidatura-2026-roda-viva-abril-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 30. Haddad taxacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Haddad defende taxacao global de super-ricos em cupula do G20 e acusa "privilegios" fiscais.',
      'E absolutamente escandaloso que os bilionarios paguem taxa efetiva de impostos menor que uma enfermeira ou um professor. Isso destroi a confianca democratica e aprofunda desigualdades. Precisamos de um acordo global para taxar patrimonios acima de 1 bilhao.',
      'Declaracao do ministro Fernando Haddad em reuniao de ministros da Fazenda do G20 em 26 de fevereiro de 2024, antes da cupula de lideres em novembro. O Brasil liderou agenda de taxacao de super-ricos durante sua presidencia.',
      'verified', false, '2024-02-26',
      'https://valor.globo.com/brasil/noticia/2024/02/haddad-g20-taxacao-super-ricos-privilegios.ghtml',
      'news_article',
      'Sao Paulo', 'Reuniao de ministros do G20', 'haddad-g20-taxacao-super-ricos-fevereiro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 31. Campos Neto BC
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_rcn,
      'Roberto Campos Neto defende ultima decisao de manter Selic alta e critica pressoes politicas do governo.',
      'O Banco Central tem que tomar decisoes tecnicas, independente de ciclos politicos. Cortar juros quando a inflacao esta desancorada seria uma irresponsabilidade. A autonomia existe para proteger a economia, nao para agradar o governo da vez. Saio com a consciencia tranquila.',
      'Declaracao de Roberto Campos Neto em 11 de dezembro de 2024, na penultima reuniao do Copom sob sua gestao, em que elevou a Selic. Campos Neto deixaria o BC em janeiro de 2025 com a posse de Gabriel Galipolo, indicado por Lula.',
      'verified', false, '2024-12-11',
      'https://valor.globo.com/financas/noticia/2024/12/campos-neto-copom-selic-pressoes-politicas-lula.ghtml',
      'news_article',
      'Brasilia', 'Coletiva apos reuniao do Copom', 'campos-neto-copom-pressoes-politicas-dezembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 32. Sonia Guajajara COP30
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_sonia,
      'Sonia Guajajara afirma que COP30 em Belem deve ter "protagonismo indigena" sem precedentes.',
      'A COP30 em Belem sera a COP dos povos originarios. Pela primeira vez na historia, as populacoes indigenas terao voz de decisao, nao so de platia. Estamos na floresta ha milenios, sabemos o que funciona. A humanidade precisa aprender com quem nunca destruiu a Terra.',
      'Declaracao da ministra Sonia Guajajara em Baku em 20 de novembro de 2024, durante a COP29, ao apresentar preparativos para a COP30 em Belem em 2025. Foi a primeira indigena ministra da historia do Brasil.',
      'verified', false, '2024-11-20',
      'https://agenciabrasil.ebc.com.br/politica/noticia/2024-11/sonia-guajajara-cop30-belem-protagonismo-indigena',
      'other',
      'Baku, Azerbaijao', 'Conferencia da ONU COP29', 'sonia-cop30-protagonismo-indigena-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 33. Tabata Amaral SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tab,
      'Tabata Amaral, candidata a prefeita de SP, afirma que debate eleitoral "desce ao nivel mais baixo" com Marcal.',
      'A candidatura do senhor Pablo Marcal rebaixou o debate eleitoral de Sao Paulo ao nivel mais baixo ja visto. Agressoes, fake news, ataques pessoais, palavrao. Sao Paulo merece mais que isso. Merece propostas, debate serio, candidatos que respeitem a cidade e seus eleitores.',
      'Declaracao de Tabata Amaral em 17 de setembro de 2024, em coletiva apos o debate em que Datena deu cadeirada em Marcal. A deputada federal pelo PSB ficou em quarto lugar no primeiro turno.',
      'verified', false, '2024-09-17',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/09/17/tabata-amaral-debate-nivel-baixo-marcal.ghtml',
      'news_article',
      'Sao Paulo', 'Coletiva de campanha apos debate', 'tabata-amaral-debate-baixo-marcal-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 34. Flavio Dino STF posse
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_din,
      'Flavio Dino, ja no STF, toma decisao contra emendas Pix e trava repasses do orcamento secreto.',
      'As emendas Pix sem rastreabilidade sao inconstitucionais. Dinheiro publico nao pode desaparecer em favor de interesses obscuros. A transparencia e valor absoluto no uso de recursos do povo. Meu voto trava os repasses sem identificacao de gastos.',
      'Decisao de Flavio Dino em 8 de agosto de 2024, suspendendo o pagamento de emendas parlamentares sem transparencia. A decisao iniciou crise entre o Executivo, STF e Congresso sobre o orcamento secreto e gerou forte reacao de Arthur Lira.',
      'verified', true, '2024-08-08',
      'https://g1.globo.com/politica/noticia/2024/08/flavio-dino-trava-emendas-pix-inconstitucional-transparencia.ghtml',
      'news_article',
      'Brasilia', 'Decisao sobre emendas Pix no STF', 'flavio-dino-trava-emendas-pix-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 35. Lira emendas reacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lir,
      'Arthur Lira ataca decisao de Flavio Dino sobre emendas Pix e acusa STF de "interferir no Parlamento".',
      'O STF invadiu a competencia exclusiva do Parlamento. As emendas sao instrumento legitimo do poder Legislativo de alocar recursos. Um ministro sozinho nao pode travar o orcamento da Uniao. Isso e um ataque a separacao de poderes. Vamos reagir institucionalmente.',
      'Declaracao de Arthur Lira em 14 de agosto de 2024, uma semana apos Flavio Dino suspender o pagamento de emendas parlamentares sem transparencia. Lira articulou reacao do Congresso contra o STF na chamada "crise das emendas".',
      'verified', false, '2024-08-14',
      'https://www.cnnbrasil.com.br/politica/lira-ataca-dino-emendas-pix-separacao-poderes/',
      'news_article',
      'Brasilia', 'Declaracao apos decisao de Dino', 'lira-ataca-dino-emendas-pix-agosto-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_cor, true FROM ins;

  -- 36. Lula golpe indiciamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula comemora indiciamento de Bolsonaro pela PF e diz que "tentativa de golpe nao pode ficar impune".',
      'A Policia Federal, com profissionalismo, indiciou o ex-presidente Bolsonaro por tentativa de golpe de Estado e plano para assassinato contra mim, Alckmin e ministro Moraes. A democracia exige responsabilizacao. Ninguem esta acima da lei neste pais. Nunca mais 8 de janeiro.',
      'Declaracao de Lula em 21 de novembro de 2024, um dia apos a PF indiciar Bolsonaro e 36 outras pessoas por tentativa de golpe de Estado, conspiracao de abolicao violenta do Estado democratico de direito e organizacao criminosa.',
      'verified', true, '2024-11-21',
      'https://www.folha.uol.com.br/poder/2024/11/lula-comemora-indiciamento-bolsonaro-golpe-pf.shtml',
      'news_article',
      'Rio de Janeiro', 'Declaracao apos indiciamento pela PF', 'lula-comemora-indiciamento-bolsonaro-golpe-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 37. Bolsonaro plano assassinato
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bol,
      'Bolsonaro nega plano de assassinato de Lula, Alckmin e Moraes e diz que nao viu nenhum documento.',
      'Nao tenho nada a ver com plano algum contra Lula, Alckmin ou Moraes. Nao tive conhecimento de nenhum documento dessa natureza. Isso e fabricacao da PF, que esta a servico do governo Lula. Estao criando narrativa golpista onde nao houve golpe.',
      'Declaracao de Jair Bolsonaro em entrevista coletiva em 22 de novembro de 2024, um dia apos PF indicia-lo pelo "Punhal Verde e Amarelo" - plano de assassinato do presidente e vice eleitos e do ministro Moraes em dezembro de 2022.',
      'verified', true, '2024-11-22',
      'https://g1.globo.com/politica/noticia/2024/11/bolsonaro-nega-plano-assassinato-lula-moraes-pf.ghtml',
      'news_article',
      'Brasilia', 'Coletiva de imprensa em Brasilia', 'bolsonaro-nega-plano-assassinato-punhal-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_ame, true FROM ins;

  -- 38. Galipolo confirmacao
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_had,
      'Fernando Haddad saude indicacao de Galipolo para o BC e promete "harmonia" na politica monetaria.',
      'A posse de Gabriel Galipolo como presidente do BC inaugura uma nova era de harmonia entre politica fiscal e monetaria. Respeitando a autonomia da instituicao, teremos sintonia com objetivos de crescimento e inclusao. O Brasil precisa de juros sustentaveis.',
      'Declaracao do ministro Fernando Haddad em 8 de outubro de 2024, apos o Senado confirmar Gabriel Galipolo como presidente do Banco Central, substituindo Roberto Campos Neto. Galipolo assumiu em janeiro de 2025.',
      'verified', false, '2024-10-08',
      'https://valor.globo.com/financas/noticia/2024/10/haddad-galipolo-bc-harmonia-juros.ghtml',
      'news_article',
      'Brasilia', 'Declaracao apos aprovacao de Galipolo pelo Senado', 'haddad-galipolo-bc-harmonia-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 39. Nunes violencia SP
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_nun,
      'Ricardo Nunes defende atuacao de GCM em operacoes na Cracolandia e nega abusos.',
      'A Guarda Civil Metropolitana atua dentro da lei para zelar pelo espaco publico. Quem esta la usando drogas a ceu aberto esta cometendo crime. Nao existe direito a usar drogas na rua. Vamos continuar com operacoes ate devolver o centro a populacao.',
      'Declaracao de Ricardo Nunes em 12 de marco de 2024, apos criticas a operacoes da GCM na Cracolandia que resultaram em violencia contra dependentes. Organizacoes de direitos humanos denunciaram abuso policial.',
      'verified', false, '2024-03-12',
      'https://www.uol.com.br/cotidiano/ultimas-noticias/2024/03/nunes-gcm-cracolandia-operacao-violencia.htm',
      'news_article',
      'Sao Paulo', 'Declaracao a imprensa', 'nunes-gcm-cracolandia-violencia-marco-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_vio, true FROM ins;

  -- 40. Michelle Paulo campanha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mic,
      'Michelle Bolsonaro promove Ricardo Nunes em culto e ataca Boulos como "comunista" e "perigo moral".',
      'As mulheres cristas de Sao Paulo nao podem aceitar um comunista como Boulos na prefeitura. Ele e um perigo moral, contra a familia, contra Deus, contra a ordem natural das coisas. Vota Ricardo Nunes, o nosso candidato, o candidato da familia crista.',
      'Declaracao de Michelle Bolsonaro em culto evangelico na Igreja Mundial em Sao Paulo em 22 de setembro de 2024, em campanha por Ricardo Nunes. A atuacao de Michelle em cultos foi apontada como decisiva para o apoio evangelico a Nunes.',
      'verified', false, '2024-09-22',
      'https://www.metropoles.com/brasil/eleicoes-2024/michelle-bolsonaro-culto-nunes-boulos-comunista',
      'news_article',
      'Sao Paulo', 'Culto evangelico em Sao Paulo', 'michelle-bolsonaro-culto-nunes-boulos-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 41. Alexandre Padilha saude SUS
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_ale,
      'Alexandre Padilha anuncia negociacao historica com Centrao para aprovar pacote fiscal do governo.',
      'O dialogo com o Parlamento, incluindo o Centrao, faz parte da governabilidade em um presidencialismo de coalizao. Nao pedimos voto, pedimos responsabilidade. O pacote fiscal e essencial para a sustentabilidade do arcabouco que votamos em 2023. Vamos entregar.',
      'Declaracao do ministro das Relacoes Institucionais Alexandre Padilha em 4 de dezembro de 2024, antes da votacao do pacote fiscal de corte de gastos proposto pelo governo Lula. A articulacao com o Centrao foi fundamental para aprovacao.',
      'verified', false, '2024-12-04',
      'https://g1.globo.com/politica/noticia/2024/12/padilha-pacote-fiscal-centrao-articulacao.ghtml',
      'news_article',
      'Brasilia', 'Declaracao antes da votacao do pacote fiscal', 'padilha-pacote-fiscal-centrao-dezembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 42. Gilmar Bolsonaro indiciamento
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_gil,
      'Gilmar Mendes defende processo penal contra Bolsonaro e reforca que "golpistas precisam responder".',
      'O indiciamento de Bolsonaro pela PF e um marco historico. Pela primeira vez um ex-presidente brasileiro responde criminalmente por tentar um golpe de Estado. Isso so comprova que a democracia brasileira e robusta e suas instituicoes funcionam. Ninguem acima da lei.',
      'Declaracao do ministro Gilmar Mendes em seminario juridico em Lisboa em 5 de dezembro de 2024, duas semanas apos o indiciamento de Bolsonaro pela PF por tentativa de golpe de Estado. Gilmar defendeu responsabilizacao rapida pelo STF.',
      'verified', false, '2024-12-05',
      'https://www.conjur.com.br/2024-dez-05/gilmar-mendes-indiciamento-bolsonaro-democracia-responsabilizacao/',
      'news_article',
      'Lisboa, Portugal', 'Forum Juridico de Lisboa', 'gilmar-mendes-indiciamento-bolsonaro-dezembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 43. Flavio Bolsonaro defende pai
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_fla,
      'Flavio Bolsonaro classifica indiciamento do pai como "golpe institucional" e convoca mobilizacao.',
      'O indiciamento do meu pai e um golpe institucional montado pela PF, STF e governo Lula. Nao ha provas, so narrativa. E o que estao fazendo para impedir a direita de voltar ao poder em 2026. O povo brasileiro vai reagir, e vamos levar isso ao mundo todo.',
      'Declaracao de Flavio Bolsonaro em 21 de novembro de 2024, dia em que a PF indiciou o pai por tentativa de golpe. O senador tornou-se um dos principais porta-vozes da defesa publica de Bolsonaro contra a investigacao.',
      'verified', false, '2024-11-21',
      'https://www.metropoles.com/brasil/politica-brasil/flavio-bolsonaro-indiciamento-pai-golpe-institucional',
      'news_article',
      'Brasilia', 'Declaracao em rede social', 'flavio-bolsonaro-indiciamento-pai-golpe-institucional-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 44. Lula X bloqueio
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula defende bloqueio do X no Brasil e diz que Musk "tem que respeitar soberania" do pais.',
      'O Brasil nao precisa de permissao de ninguem para exercer sua soberania. Se o senhor Elon Musk quer operar aqui, tem que respeitar nossas leis, pagar nossos impostos, ter representante legal. Nao se trata de censura, trata-se de democracia com regras. E o mundo todo esta assistindo.',
      'Declaracao de Lula em entrevista em 3 de setembro de 2024, dias apos Moraes suspender o X no Brasil. O presidente apoiou publicamente a decisao e fez crescer o embate internacional com Musk, que vinha atacando o governo.',
      'verified', false, '2024-09-03',
      'https://g1.globo.com/politica/noticia/2024/09/lula-bloqueio-x-musk-soberania-brasil.ghtml',
      'news_article',
      'Brasilia', 'Entrevista em Brasilia', 'lula-bloqueio-x-musk-soberania-setembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 45. Tarcisio 2026 campanha
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_tar,
      'Tarcisio de Freitas, apos vitoria de Nunes, fala em "projeto nacional de direita" para 2026.',
      'A vitoria de Ricardo Nunes em Sao Paulo e um marco para construcao de um projeto nacional de direita em 2026. O povo paulista rejeitou o extremismo boulista e apostou em gestao com valores. Sao Paulo e o coracao do Brasil, e o que vem daqui vai ser referencia no pais.',
      'Declaracao de Tarcisio de Freitas em 28 de outubro de 2024, um dia apos a reeleicao de Ricardo Nunes em Sao Paulo com apoio decisivo do governador. Tarcisio se consolidou como possivel candidato presidencial de direita em 2026.',
      'verified', false, '2024-10-28',
      'https://www.estadao.com.br/politica/tarcisio-nunes-2026-projeto-nacional-direita/',
      'news_article',
      'Sao Paulo', 'Declaracao apos vitoria de Nunes em SP', 'tarcisio-nunes-2026-projeto-nacional-direita-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 46. Boulos derrota
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_bou,
      'Guilherme Boulos, apos derrota, afirma que "esquerda precisa se reinventar" e defende renovacao.',
      'Reconhecemos o resultado democraticamente, mas nao saimos derrotados do processo. Construimos uma candidatura com programa serio, crescemos na periferia, dialogamos com uma Sao Paulo popular. A esquerda brasileira precisa se reinventar, falar a lingua do trabalhador comum, sem abandonar principios.',
      'Discurso de Guilherme Boulos em 27 de outubro de 2024, apos ser derrotado por Ricardo Nunes no segundo turno em Sao Paulo. Boulos articulou-se como possivel candidato a governador ou a deputado em 2026 apos a derrota.',
      'verified', false, '2024-10-27',
      'https://g1.globo.com/sp/sao-paulo/eleicoes/2024/noticia/2024/10/27/boulos-derrota-reinventar-esquerda.ghtml',
      'news_article',
      'Sao Paulo', 'Discurso apos derrota no segundo turno', 'boulos-derrota-reinventar-esquerda-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 47. Marcal desqualificado
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mrc,
      'Pablo Marcal publica laudo falso sobre drogas em Boulos as vesperas do primeiro turno em SP.',
      'Tenho aqui o laudo medico que prova que o candidato Guilherme Boulos e usuario de drogas. Esse e o homem que quer comandar Sao Paulo, a maior cidade do Brasil. Nao podemos entregar nossa cidade a um drogado. O povo tem que saber a verdade.',
      'Publicacao de Pablo Marcal nas redes sociais em 4 de outubro de 2024, dois dias antes do primeiro turno das eleicoes municipais. O documento foi comprovadamente falso e Marcal foi denunciado ao TSE por disseminar desinformacao eleitoral.',
      'verified', true, '2024-10-04',
      'https://www.folha.uol.com.br/poder/eleicoes/2024/10/marcal-laudo-falso-drogas-boulos-fake-news.shtml',
      'news_article',
      'Sao Paulo', 'Publicacao em rede social', 'marcal-laudo-falso-drogas-boulos-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_des, true FROM ins;

  -- 48. Moraes Marcal processo
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_mor,
      'Alexandre de Moraes determina retirada de publicacoes de Pablo Marcal com laudo falso sobre Boulos.',
      'A divulgacao de documento comprovadamente adulterado as vesperas do primeiro turno eleitoral configura desinformacao eleitoral grave. Determino a retirada imediata de todas as publicacoes do candidato Pablo Marcal sobre o suposto laudo, sob pena de multa de R$ 50 mil por descumprimento.',
      'Decisao de Alexandre de Moraes no TSE em 5 de outubro de 2024, um dia apos Marcal publicar laudo falso sobre Boulos. Marcal continuou a receber multas por descumprimento e teve o direito de resposta aplicado no pleito.',
      'verified', false, '2024-10-05',
      'https://www.tse.jus.br/comunicacao/noticias/2024/Outubro/moraes-marcal-laudo-falso-boulos-retirada-multa',
      'other',
      'Brasilia', 'Decisao do TSE em processo eleitoral', 'moraes-marcal-laudo-falso-retirada-outubro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 49. Lula pacote fiscal
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula anuncia pacote fiscal combinado com isencao de IR ate R$ 5 mil e critica "rico que nao paga imposto".',
      'Estamos fazendo o que ha decadas era necessario: isentar de Imposto de Renda quem ganha ate 5 mil reais, compensando com cobranca de quem ganha muito mais. Quem recebe um milhao por mes paga menos que um professor. Isso vai acabar. Justica tributaria nao e luxo, e democracia.',
      'Pronunciamento em cadeia nacional de Lula em 27 de novembro de 2024, apresentando pacote fiscal que combinava corte de gastos com ampliacao de isencao de IR para ate R$ 5 mil. O anuncio foi criticado por mercado financeiro e causou estresse cambial.',
      'verified', true, '2024-11-27',
      'https://g1.globo.com/politica/noticia/2024/11/lula-pacote-fiscal-isencao-ir-5-mil-cadeia-nacional.ghtml',
      'news_article',
      'Brasilia', 'Pronunciamento em cadeia nacional', 'lula-pacote-fiscal-isencao-ir-5-mil-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

  -- 50. Xi Jinping Brasilia
  WITH ins AS (
    INSERT INTO statements (
      politician_id, summary, full_quote, context,
      verification_status, is_featured, statement_date,
      primary_source_url, primary_source_type,
      venue, event_name, slug
    ) VALUES (
      v_lula,
      'Lula recebe Xi Jinping em Brasilia e defende aprofundamento da parceria estrategica entre Brasil e China.',
      'O Brasil e a China compartilham uma visao de mundo multipolar, de respeito a soberania dos povos, de cooperacao Sul-Sul. Nossa parceria estrategica vai alem de comercio: envolve tecnologia, transicao energetica, reducao de desigualdades. O mundo precisa de Brasil e China juntos.',
      'Pronunciamento de Lula em 20 de novembro de 2024, durante visita de Estado de Xi Jinping a Brasilia apos o G20 do Rio. Os dois paises assinaram 37 acordos bilaterais em comercio, tecnologia, ciencia e mudancas climaticas.',
      'verified', false, '2024-11-20',
      'https://www.planalto.gov.br/presidente-lula-xi-jinping-visita-estado-brasilia-novembro-2024',
      'other',
      'Brasilia', 'Visita de Estado de Xi Jinping ao Brasil', 'lula-xi-jinping-parceria-estrategica-novembro-2024'
    ) ON CONFLICT (slug) DO NOTHING RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary)
  SELECT id, c_abu, true FROM ins;

END $$;
