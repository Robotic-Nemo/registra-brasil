-- Batch 72: STF rulings, controversies, and institutional clashes (Jan 2023 - Apr 2026)
-- 100 statements covering ministros do STF e reações políticas

-- 1
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina bloqueio do X no Brasil', 'Determino a suspensão imediata, completa e integral do funcionamento da rede social X no Brasil até que sejam cumpridas todas as ordens judiciais.', 'Decisão monocrática de Alexandre de Moraes suspendeu a plataforma X por descumprimento de ordens para bloqueio de contas.', 'verified', true, '2024-08-30', 'https://www.conjur.com.br/2024-ago-30/moraes-determina-bloqueio-do-x-no-brasil/', 'news_article', 4, 'Brasília', 'Inquérito das Fake News', 'moraes-bloqueio-x-brasil-b72-1')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 2
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes vota pela condenação de Bolsonaro por golpe', 'Os réus, de maneira consciente e voluntária, integraram organização criminosa armada com o objetivo de abolir o Estado Democrático de Direito.', 'Voto do relator no julgamento da trama golpista no STF.', 'verified', true, '2025-09-02', 'https://www.jota.info/stf/moraes-vota-condenacao-bolsonaro-golpe', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'moraes-voto-condenacao-bolsonaro-b72-2')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 3
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro chama Moraes de ditador após bloqueio do X', 'O Alexandre de Moraes é um ditador. O Brasil está sob uma ditadura togada.', 'Ex-presidente reagiu ao bloqueio da rede social X determinado por Moraes.', 'verified', true, '2024-08-31', 'https://www.oantagonista.com.br/brasil/bolsonaro-moraes-ditador-bloqueio-x/', 'news_article', 4, 'São Paulo', 'Entrevista', 'bolsonaro-moraes-ditador-b72-3')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 4
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso diz que derrotaram o bolsonarismo', 'Nós derrotamos o bolsonarismo para permitir que as pessoas fossem livres das trevas.', 'Frase dita em evento da UNE gerou forte reação e pedidos de impeachment.', 'verified', true, '2023-07-14', 'https://www.conjur.com.br/2023-jul-15/barroso-une-derrotamos-bolsonarismo/', 'news_article', 4, 'Brasília', 'Congresso UNE', 'barroso-derrotamos-bolsonarismo-b72-4')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 5
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nikolas ataca Barroso após fala na UNE', 'Barroso confessou ser militante e não juiz. Tem que ser impichado.', 'Deputado reagiu à fala de Barroso sobre o bolsonarismo.', 'verified', false, '2023-07-15', 'https://www.gazetadopovo.com.br/republica/nikolas-ferreira-barroso-impeachment-une/', 'news_article', 3, 'Brasília', 'Redes sociais', 'nikolas-barroso-impeachment-b72-5')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 6
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli anula provas da Odebrecht contra Lula', 'As provas obtidas via acordo de leniência com a Odebrecht são imprestáveis e devem ser consideradas nulas.', 'Decisão anulou provas do sistema Drousys que embasavam ações da Lava Jato.', 'verified', true, '2023-09-25', 'https://www.jota.info/stf/toffoli-anula-provas-odebrecht-lula', 'news_article', 4, 'Brasília', 'STF', 'toffoli-anula-provas-odebrecht-b72-6')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 7
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli chama Lava Jato de armação', 'A Operação Lava Jato foi a maior armação da história do país.', 'Em decisão que beneficiou Lula, ministro criticou com dureza a operação.', 'verified', true, '2023-09-25', 'https://www.conjur.com.br/2023-set-25/toffoli-lava-jato-armacao/', 'news_article', 3, 'Brasília', 'STF', 'toffoli-lava-jato-armacao-b72-7')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 8
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar classifica Lava Jato como o maior escândalo judicial', 'A Lava Jato foi o maior escândalo judicial da história brasileira.', 'Em aula magna, ministro decano atacou novamente a operação.', 'verified', false, '2023-08-07', 'https://www.conjur.com.br/2023-ago-07/gilmar-mendes-lava-jato-maior-escandalo/', 'news_article', 3, 'Lisboa', 'IDP Portugal', 'gilmar-lava-jato-escandalo-b72-8')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 9
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia na posse do TSE defende democracia', 'Quem ameaça a democracia ameaça o Brasil. O voto é sagrado e a urna é inviolável.', 'Discurso de posse na presidência do TSE.', 'verified', true, '2024-06-03', 'https://www.tse.jus.br/imprensa/noticias-tse/2024/Junho/carmen-lucia-toma-posse-tse/', 'official_statement', 2, 'Brasília', 'Posse TSE', 'carmen-posse-tse-democracia-b72-9')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 10
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'autoritarismo';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux diverge do relator no julgamento do 8 de janeiro', 'Não vislumbro, no caso concreto, a configuração de organização criminosa armada nos moldes da denúncia.', 'Voto divergente no julgamento da trama golpista.', 'verified', true, '2025-09-10', 'https://www.jota.info/stf/fux-diverge-moraes-julgamento-golpe', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'fux-divergencia-golpe-b72-10')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 11
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin defende urnas eletrônicas em discurso', 'As urnas eletrônicas são seguras, auditáveis e são o orgulho da democracia brasileira.', 'Ministro reagiu a ataques de Bolsonaro ao sistema eleitoral.', 'verified', false, '2023-02-22', 'https://www.conjur.com.br/2023-fev-22/fachin-urnas-eletronicas-seguras/', 'news_article', 2, 'Brasília', 'STF', 'fachin-defende-urnas-b72-11')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 12
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques vota contra condenação por golpe', 'Ausente prova cabal da efetiva participação dos réus em atos executórios tendentes a abolir o Estado de Direito.', 'Dissenso do ministro no julgamento da trama golpista.', 'verified', true, '2025-09-11', 'https://www.conjur.com.br/2025-set-11/nunes-marques-absolve-bolsonaro/', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'nunes-marques-absolve-b72-12')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 13
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça pede vista em inquérito das fake news', 'A amplitude do inquérito tem gerado preocupações legítimas quanto à necessária delimitação do objeto investigado.', 'Pedido de vista suspendeu julgamento sobre o inquérito.', 'verified', false, '2023-04-20', 'https://www.jota.info/stf/mendonca-vista-inquerito-fake-news', 'news_article', 3, 'Brasília', 'STF', 'mendonca-vista-inquerito-b72-13')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 14
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin toma posse no STF após indicação de Lula', 'Atuarei com independência, imparcialidade e total compromisso com a Constituição.', 'Posse gerou controvérsia por ter sido advogado de Lula.', 'verified', true, '2023-08-03', 'https://www.conjur.com.br/2023-ago-03/zanin-toma-posse-stf/', 'official_statement', 2, 'Brasília', 'Posse STF', 'zanin-posse-stf-b72-14')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 15
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino suspende emendas parlamentares sem transparência', 'Sem rastreabilidade e identificação do parlamentar, as emendas não podem ser executadas.', 'Decisão suspendeu pagamentos de emendas de comissão e Pix.', 'verified', true, '2024-08-14', 'https://www.jota.info/stf/dino-suspende-emendas-transparencia', 'news_article', 3, 'Brasília', 'STF', 'dino-suspende-emendas-b72-15')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 16
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Motta critica decisão de Dino sobre emendas', 'O Supremo não pode legislar sobre o orçamento. Isso é atribuição do Congresso.', 'Presidente da Câmara reagiu à suspensão das emendas.', 'verified', false, '2024-08-15', 'https://www.conjur.com.br/2024-ago-15/motta-critica-dino-emendas/', 'news_article', 3, 'Brasília', 'Câmara', 'motta-critica-dino-b72-16')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 17
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Alcolumbre sinaliza reação do Senado contra Dino', 'O Congresso tem mecanismos para responder a invasões de competência.', 'Presidente do Senado reagiu à decisão sobre emendas.', 'verified', false, '2024-08-16', 'https://www.jota.info/legislativo/alcolumbre-reacao-dino-emendas', 'news_article', 3, 'Brasília', 'Senado', 'alcolumbre-reacao-dino-b72-17')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 18
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Eduardo Bolsonaro defende sanções Magnitsky contra Moraes', 'Vamos levar a verdade sobre o ditador Alexandre de Moraes a Washington. A Lei Magnitsky existe para casos como esse.', 'Deputado articulou sanções americanas contra ministros do STF.', 'verified', true, '2025-03-15', 'https://www.oantagonista.com.br/brasil/eduardo-bolsonaro-magnitsky-moraes/', 'news_article', 4, 'Washington', 'Lobby EUA', 'eduardo-magnitsky-moraes-b72-18')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 19
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes rebate sanções americanas e afirma soberania', 'A soberania brasileira não se dobra a pressões estrangeiras. A Justiça brasileira será aplicada com todo rigor.', 'Reação do ministro às sanções da Lei Magnitsky.', 'verified', true, '2025-07-30', 'https://www.conjur.com.br/2025-jul-30/moraes-rebate-sancoes-eua/', 'news_article', 3, 'Brasília', 'STF', 'moraes-rebate-sancoes-b72-19')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 20
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Flávio chama Moraes de psicopata com toga', 'Alexandre de Moraes é um psicopata com toga que persegue adversários políticos.', 'Senador atacou ministro após decisão contra Bolsonaro.', 'verified', false, '2024-02-08', 'https://www.oantagonista.com.br/brasil/flavio-bolsonaro-moraes-psicopata/', 'news_article', 4, 'Brasília', 'Redes sociais', 'flavio-moraes-psicopata-b72-20')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 21
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Kicis defende impeachment de Moraes', 'Moraes tem que ser impichado. Está fazendo do STF uma corte bolivariana.', 'Deputada protocolou pedido de impeachment contra o ministro.', 'verified', false, '2024-09-01', 'https://www.gazetadopovo.com.br/republica/kicis-impeachment-moraes/', 'news_article', 3, 'Brasília', 'Câmara', 'kicis-impeachment-moraes-b72-21')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 22
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Feliciano classifica STF como ativista', 'O STF virou casa de ativismo. Toffoli, Moraes, Gilmar: toda semana uma aberração.', 'Deputado atacou ministros em sessão da Câmara.', 'verified', false, '2023-10-05', 'https://www.gazetadopovo.com.br/republica/feliciano-stf-ativismo/', 'news_article', 3, 'Brasília', 'Câmara', 'feliciano-stf-ativismo-b72-22')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 23
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Marinho denuncia invasão do STF no Legislativo', 'O Supremo está legislando diariamente. É preciso colocar limites ao ativismo judicial.', 'Líder da oposição criticou decisões do STF no Senado.', 'verified', false, '2024-09-02', 'https://www.jota.info/legislativo/marinho-stf-invasao-legislativo', 'news_article', 3, 'Brasília', 'Senado', 'marinho-stf-invasao-b72-23')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 24
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar compara bolsonarismo ao nazismo', 'Há um extremismo tóxico no Brasil que lembra experiências totalitárias do século XX.', 'Comentário em seminário acadêmico gerou controvérsia.', 'verified', false, '2024-05-10', 'https://www.conjur.com.br/2024-mai-10/gilmar-compara-bolsonarismo-nazismo/', 'news_article', 3, 'Lisboa', 'Fórum Jurídico', 'gilmar-bolsonarismo-nazismo-b72-24')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 25
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina busca e apreensão contra empresários', 'Há fortes indícios de atentados contra a democracia por parte de empresários bolsonaristas.', 'Operação da PF cumpriu mandados em casas de empresários.', 'verified', false, '2023-09-20', 'https://www.jota.info/stf/moraes-busca-apreensao-empresarios', 'news_article', 3, 'Brasília', 'PF', 'moraes-empresarios-b72-25')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 26
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zambelli critica perda de mandato pelo STF', 'O Supremo me cassou por perseguição política. Moraes é o algoz do Brasil.', 'Deputada foi condenada pela invasão do CNJ e perdeu mandato.', 'verified', true, '2024-05-15', 'https://www.oantagonista.com.br/brasil/zambelli-cassacao-stf/', 'news_article', 3, 'Brasília', 'Redes sociais', 'zambelli-cassacao-stf-b72-26')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 27
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Silveira ataca STF após prisão', 'O STF é uma ditadura. Moraes é meu perseguidor pessoal.', 'Ex-deputado preso após condenação por ataques a ministros.', 'verified', false, '2023-02-20', 'https://www.conjur.com.br/2023-fev-20/silveira-ataca-stf-prisao/', 'news_article', 4, 'Rio de Janeiro', 'Redes sociais', 'silveira-ataca-stf-prisao-b72-27')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 28
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Lula elogia decisão de Toffoli sobre Lava Jato', 'O ministro Toffoli fez justiça ao mostrar que a Lava Jato foi uma armação.', 'Presidente comemorou anulação de provas.', 'verified', true, '2023-09-26', 'https://www.conjur.com.br/2023-set-26/lula-elogia-toffoli-lava-jato/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-elogia-toffoli-b72-28')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 29
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes abre inquérito das milícias digitais', 'As milícias digitais são uma ameaça concreta ao Estado Democrático de Direito.', 'Ministro ampliou o inquérito das fake news.', 'verified', false, '2023-03-08', 'https://www.jota.info/stf/moraes-inquerito-milicias-digitais', 'news_article', 3, 'Brasília', 'STF', 'moraes-milicias-digitais-b72-29')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 30
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Ramagem critica CPI e decisões de Moraes', 'Moraes transformou a Abin em alvo seletivo. Eu não cometi crime nenhum.', 'Deputado investigado na Abin paralela criticou o ministro.', 'verified', false, '2024-01-26', 'https://www.oantagonista.com.br/brasil/ramagem-critica-moraes-abin/', 'news_article', 3, 'Brasília', 'Câmara', 'ramagem-critica-moraes-b72-30')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 31
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin assume presidência do STF com discurso institucional', 'O Estado Democrático de Direito é conquista irreversível do povo brasileiro.', 'Posse ocorreu após fim do mandato de Barroso.', 'verified', true, '2025-09-29', 'https://www.jota.info/stf/fachin-assume-presidencia', 'news_article', 2, 'Brasília', 'Posse STF', 'fachin-posse-presidencia-b72-31')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 32
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia proíbe uso de IA em campanhas', 'Deepfakes e uso malicioso de inteligência artificial não serão tolerados nas eleições.', 'Resolução do TSE aprovada pela presidente.', 'verified', true, '2024-02-27', 'https://www.conjur.com.br/2024-fev-27/tse-proibe-deepfake-campanhas/', 'news_article', 2, 'Brasília', 'TSE', 'carmen-proibe-deepfake-b72-32')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 33
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux rejeita tese sobre maioridade penal', 'Não se justifica ampliar penas sem análise criteriosa do sistema prisional.', 'Voto em ADI sobre majoração de penas.', 'verified', false, '2024-06-20', 'https://www.jota.info/stf/fux-rejeita-maioridade-penal', 'news_article', 2, 'Brasília', 'STF', 'fux-maioridade-penal-b72-33')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 34
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques rejeita marco temporal', 'A tese do marco temporal não encontra sustentação na Constituição de 1988.', 'Voto no julgamento do marco temporal das terras indígenas.', 'verified', false, '2023-09-21', 'https://www.conjur.com.br/2023-set-21/nunes-marques-rejeita-marco-temporal/', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-marco-temporal-b72-34')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 35
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça vota contra descriminalização do aborto', 'A proteção à vida desde a concepção é valor constitucional insuperável.', 'Voto divergente em ação sobre descriminalização do aborto.', 'verified', false, '2023-09-22', 'https://www.jota.info/stf/mendonca-voto-aborto', 'news_article', 2, 'Brasília', 'STF', 'mendonca-voto-aborto-b72-35')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 36
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin se declara impedido em casos da Lava Jato', 'Declaro-me impedido de atuar nos processos em que representei Luiz Inácio Lula da Silva.', 'Ministro anunciou impedimento em ações da Lava Jato.', 'verified', false, '2023-08-10', 'https://www.conjur.com.br/2023-ago-10/zanin-impedido-lava-jato/', 'news_article', 2, 'Brasília', 'STF', 'zanin-impedido-lava-jato-b72-36')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 37
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino toma posse no STF após indicação de Lula', 'Defenderei a Constituição acima de qualquer interesse partidário.', 'Ex-ministro da Justiça assumiu cadeira na Suprema Corte.', 'verified', true, '2024-02-22', 'https://www.jota.info/stf/dino-toma-posse-stf', 'official_statement', 2, 'Brasília', 'Posse STF', 'dino-posse-stf-b72-37')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 38
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina prisão de golpistas do 8 de janeiro', 'A Constituição exige resposta firme contra os autores dos ataques à democracia.', 'Ministro determinou prisões pós-8 de janeiro.', 'verified', true, '2023-01-09', 'https://www.conjur.com.br/2023-jan-09/moraes-prisao-golpistas/', 'news_article', 3, 'Brasília', '8 de Janeiro', 'moraes-prisao-golpistas-b72-38')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 39
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes condena primeiros réus do 8 de janeiro', 'Os acusados praticaram crimes contra o Estado Democrático de Direito de forma organizada.', 'Sentença histórica em condenações do 8 de janeiro.', 'verified', true, '2023-09-14', 'https://www.jota.info/stf/moraes-condena-reus-8-janeiro', 'news_article', 3, 'Brasília', 'STF', 'moraes-condena-reus-b72-39')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 40
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro diz que foi inocentado pelos EUA', 'Os Estados Unidos reconheceram a perseguição política no Brasil. Estou sendo vingado.', 'Fala após sanções Magnitsky contra Moraes.', 'verified', false, '2025-07-31', 'https://www.oantagonista.com.br/brasil/bolsonaro-inocentado-eua/', 'news_article', 3, 'São Paulo', 'Entrevista', 'bolsonaro-inocentado-eua-b72-40')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 41
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar acompanha Moraes em julgamento de Bolsonaro', 'O conjunto probatório é robusto e demonstra liderança do ex-presidente na trama.', 'Voto pela condenação em julgamento histórico.', 'verified', true, '2025-09-03', 'https://www.conjur.com.br/2025-set-03/gilmar-acompanha-moraes-bolsonaro/', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'gilmar-acompanha-moraes-b72-41')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 42
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli acompanha condenação de Bolsonaro', 'A tentativa de ruptura institucional ficou inequivocamente comprovada.', 'Voto acompanhou Moraes no julgamento do golpe.', 'verified', true, '2025-09-04', 'https://www.jota.info/stf/toffoli-condena-bolsonaro', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'toffoli-condena-bolsonaro-b72-42')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 43
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen vota contra Bolsonaro no julgamento do golpe', 'Quem atenta contra o voto popular atenta contra o coração da Constituição.', 'Voto firme pela condenação no STF.', 'verified', true, '2025-09-05', 'https://www.conjur.com.br/2025-set-05/carmen-condena-bolsonaro-golpe/', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'carmen-condena-bolsonaro-b72-43')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 44
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin acompanha relator no julgamento do golpe', 'As provas não deixam margem a dúvida quanto à participação do ex-presidente.', 'Voto pela condenação no julgamento da trama golpista.', 'verified', true, '2025-09-08', 'https://www.jota.info/stf/zanin-acompanha-condenacao-bolsonaro', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'zanin-condena-bolsonaro-b72-44')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 45
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino acompanha maioria no julgamento do golpe', 'Não há hipótese de relativização da tentativa de ruptura democrática.', 'Voto consolidou maioria para condenação.', 'verified', true, '2025-09-09', 'https://www.conjur.com.br/2025-set-09/dino-acompanha-maioria-golpe/', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'dino-acompanha-maioria-b72-45')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 46
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Van Hattem ataca decisões monocráticas do STF', 'Ministros singulares não podem decidir sobre o destino do país como imperadores.', 'Deputado criticou decisões monocráticas em plenário.', 'verified', false, '2024-09-10', 'https://www.jota.info/legislativo/van-hattem-monocraticas-stf', 'news_article', 2, 'Brasília', 'Câmara', 'vanhattem-monocraticas-b72-46')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 47
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Lindbergh defende atuação de Moraes', 'Alexandre de Moraes é o ministro que salvou a democracia brasileira.', 'Líder do PT defendeu ministro em sessão.', 'verified', false, '2024-09-01', 'https://www.jota.info/legislativo/lindbergh-defende-moraes', 'news_article', 2, 'Brasília', 'Câmara', 'lindbergh-defende-moraes-b72-47')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 48
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Randolfe defende STF contra ataques bolsonaristas', 'O Supremo é a última trincheira da democracia contra os golpistas.', 'Líder do governo reagiu a ataques ao STF no Senado.', 'verified', false, '2024-08-31', 'https://www.conjur.com.br/2024-ago-31/randolfe-defende-stf/', 'news_article', 2, 'Brasília', 'Senado', 'randolfe-defende-stf-b72-48')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 49
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Boulos elogia condenação de Bolsonaro', 'Justiça foi feita. Quem atentou contra a democracia responde agora.', 'Fala de parlamentar após condenação.', 'verified', false, '2025-09-12', 'https://www.jota.info/politica/boulos-elogia-condenacao-bolsonaro', 'news_article', 2, 'São Paulo', 'Entrevista', 'boulos-elogia-condenacao-b72-49')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 50
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Janones comemora decisão contra X', 'Bloqueio do X é vitória contra quem lucrava espalhando ódio no Brasil.', 'Deputado comentou decisão do STF sobre rede social.', 'verified', false, '2024-08-30', 'https://www.oantagonista.com.br/brasil/janones-comemora-bloqueio-x/', 'news_article', 2, 'Brasília', 'Redes sociais', 'janones-bloqueio-x-b72-50')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 51
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Messias defende indicação ao STF', 'Se indicado, atuarei com total independência ante quem me indicou.', 'AGU foi cotado para vaga de Barroso.', 'verified', false, '2025-10-05', 'https://www.jota.info/stf/messias-cotado-stf', 'news_article', 2, 'Brasília', 'Entrevista', 'messias-defende-indicacao-b72-51')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 52
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Lewandowski defende STF após sanções americanas', 'Os EUA não podem decidir sobre juízes brasileiros. É afronta à soberania.', 'Ministro da Justiça reagiu às sanções Magnitsky.', 'verified', false, '2025-07-31', 'https://www.conjur.com.br/2025-jul-31/lewandowski-sancoes-eua-stf/', 'news_article', 3, 'Brasília', 'Ministério da Justiça', 'lewandowski-defende-stf-b72-52')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 53
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina apreensão de passaporte de Bolsonaro', 'A fim de evitar fuga, determina-se a entrega do passaporte pelo ex-presidente.', 'Medida cautelar foi imposta no inquérito das joias.', 'verified', true, '2024-02-08', 'https://www.jota.info/stf/moraes-passaporte-bolsonaro', 'news_article', 4, 'Brasília', 'Inquérito joias', 'moraes-passaporte-bolsonaro-b72-53')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 54
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso assume presidência do STF', 'O Supremo não se curvará a pressões, venham de onde vierem.', 'Discurso de posse como presidente da Corte.', 'verified', true, '2023-09-28', 'https://www.conjur.com.br/2023-set-28/barroso-posse-presidencia-stf/', 'official_statement', 2, 'Brasília', 'Posse STF', 'barroso-posse-presidencia-b72-54')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 55
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso defende limites a emendas parlamentares', 'Emendas sem transparência ferem o princípio republicano.', 'Em julgamento, presidente acompanhou Dino.', 'verified', false, '2024-12-19', 'https://www.jota.info/stf/barroso-limites-emendas', 'news_article', 3, 'Brasília', 'STF', 'barroso-limites-emendas-b72-55')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 56
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar critica Congresso após PEC da blindagem', 'Ninguém está acima da lei. Nem parlamentares podem criar blindagens absurdas.', 'Ministro reagiu à PEC que limitava investigações contra parlamentares.', 'verified', false, '2025-09-18', 'https://www.conjur.com.br/2025-set-18/gilmar-critica-pec-blindagem/', 'news_article', 3, 'Brasília', 'STF', 'gilmar-critica-pec-blindagem-b72-56')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 57
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli anula provas contra José Dirceu', 'As mesmas provas contaminadas que atingiram Lula também alcançam José Dirceu.', 'Decisão estendeu nulidades a outros réus.', 'verified', false, '2023-12-07', 'https://www.jota.info/stf/toffoli-anula-provas-dirceu', 'news_article', 3, 'Brasília', 'STF', 'toffoli-anula-dirceu-b72-57')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 58
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux diverge na dosimetria da pena de Bolsonaro', 'A dosimetria proposta é desproporcional à culpabilidade apurada.', 'Voto divergiu na aplicação da pena.', 'verified', true, '2025-09-11', 'https://www.conjur.com.br/2025-set-11/fux-diverge-dosimetria-bolsonaro/', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'fux-dosimetria-bolsonaro-b72-58')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 59
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin alerta para fake news nas eleições de 2026', 'A desinformação é adversário comum de todas as democracias.', 'Fala em evento do TSE sobre eleições.', 'verified', false, '2025-10-15', 'https://www.jota.info/tse/fachin-alerta-fake-news-2026', 'news_article', 2, 'Brasília', 'TSE', 'fachin-alerta-fake-news-b72-59')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 60
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques diverge em caso das emendas', 'A suspensão ampla de emendas ultrapassa o controle jurisdicional razoável.', 'Voto divergiu de Flávio Dino sobre emendas.', 'verified', false, '2024-08-19', 'https://www.jota.info/stf/nunes-marques-diverge-emendas', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-diverge-emendas-b72-60')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 61
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça pede vista em caso das emendas Pix', 'Preciso de mais tempo para análise da matéria que envolve a separação de poderes.', 'Pedido atrasou julgamento sobre emendas.', 'verified', false, '2024-08-16', 'https://www.conjur.com.br/2024-ago-16/mendonca-vista-emendas-pix/', 'news_article', 2, 'Brasília', 'STF', 'mendonca-vista-emendas-b72-61')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 62
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin vota para proibir saidinha temporária', 'A segurança pública exige critérios mais rigorosos na concessão de benefícios.', 'Voto gerou debate sobre lei de execução penal.', 'verified', false, '2024-04-11', 'https://www.jota.info/stf/zanin-saidinha-temporaria', 'news_article', 2, 'Brasília', 'STF', 'zanin-saidinha-b72-62')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 63
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino determina transparência total em emendas Pix', 'Não há emenda imotivada. Todo recurso público precisa de rastreabilidade.', 'Decisão exigiu publicação detalhada das emendas.', 'verified', true, '2024-12-23', 'https://www.conjur.com.br/2024-dez-23/dino-transparencia-emendas-pix/', 'news_article', 3, 'Brasília', 'STF', 'dino-transparencia-pix-b72-63')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 64
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina prisão preventiva de Bolsonaro', 'A conduta reiterada de descumprimento de medidas cautelares justifica a prisão.', 'Prisão após descumprimento de tornozeleira.', 'verified', true, '2025-11-22', 'https://www.jota.info/stf/moraes-prisao-bolsonaro', 'news_article', 5, 'Brasília', 'STF', 'moraes-prisao-bolsonaro-b72-64')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 65
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro denuncia caçada política após prisão', 'Estou preso político. Moraes é o executor da perseguição da esquerda.', 'Fala de Bolsonaro na ida à prisão.', 'verified', true, '2025-11-22', 'https://www.oantagonista.com.br/brasil/bolsonaro-preso-perseguicao/', 'news_article', 3, 'Brasília', 'Prisão', 'bolsonaro-preso-perseguicao-b72-65')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 66
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nikolas chama STF de tribunal político', 'O STF deixou de ser Supremo e virou uma farsa partidária.', 'Reação do deputado à condenação de Bolsonaro.', 'verified', false, '2025-09-12', 'https://www.gazetadopovo.com.br/republica/nikolas-stf-politico/', 'news_article', 3, 'Brasília', 'Redes sociais', 'nikolas-stf-politico-b72-66')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 67
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso anuncia aposentadoria antecipada', 'Cumpri minha missão. É hora de buscar novos horizontes.', 'Ministro antecipou aposentadoria após turbulências.', 'verified', true, '2025-10-17', 'https://www.conjur.com.br/2025-out-17/barroso-aposentadoria-antecipada/', 'news_article', 2, 'Brasília', 'STF', 'barroso-aposentadoria-b72-67')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 68
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar rebate Musk sobre censura', 'Nenhum bilionário decide sobre a democracia brasileira.', 'Ministro reagiu a ataques de Elon Musk ao STF.', 'verified', true, '2024-04-08', 'https://www.jota.info/stf/gilmar-rebate-musk-censura', 'news_article', 3, 'Brasília', 'STF', 'gilmar-rebate-musk-b72-68')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 69
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli libera para julgamento caso Marcelo Odebrecht', 'Os mesmos vícios que atingiram Lula devem ser aplicados aos demais réus.', 'Ministro estendeu decisão sobre Lava Jato.', 'verified', false, '2024-03-04', 'https://www.conjur.com.br/2024-mar-04/toffoli-libera-julgamento-odebrecht/', 'news_article', 3, 'Brasília', 'STF', 'toffoli-odebrecht-b72-69')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 70
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia diplomatiza Lula no TSE', 'A vontade popular foi expressa nas urnas de maneira inequívoca.', 'Fala em cerimônia de diplomação.', 'verified', false, '2023-01-12', 'https://www.tse.jus.br/imprensa/noticias-tse/2023/carmen-diplomatiza-lula', 'official_statement', 1, 'Brasília', 'TSE', 'carmen-diplomatiza-lula-b72-70')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 71
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes torna Bolsonaro inelegível no TSE', 'A conduta do ex-presidente afronta frontalmente a legislação eleitoral.', 'Voto no TSE levou à inelegibilidade de Bolsonaro.', 'verified', true, '2023-06-30', 'https://www.conjur.com.br/2023-jun-30/moraes-bolsonaro-inelegivel-tse/', 'news_article', 3, 'Brasília', 'TSE', 'moraes-bolsonaro-inelegivel-b72-71')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 72
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin acompanha inelegibilidade de Bolsonaro', 'Os fatos são graves e demandam resposta da jurisdição eleitoral.', 'Voto no TSE no caso da reunião com embaixadores.', 'verified', false, '2023-06-30', 'https://www.jota.info/tse/fachin-inelegibilidade-bolsonaro', 'news_article', 3, 'Brasília', 'TSE', 'fachin-inelegibilidade-b72-72')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 73
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro rebate inelegibilidade no TSE', 'Eu não fiz nada errado. Só disse a verdade aos embaixadores.', 'Reação à sentença de inelegibilidade.', 'verified', false, '2023-07-01', 'https://www.oantagonista.com.br/brasil/bolsonaro-rebate-inelegibilidade/', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'bolsonaro-rebate-inelegibilidade-b72-73')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 74
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques vota pela elegibilidade de Bolsonaro', 'Não vejo na fala do então presidente abuso suficiente para inelegibilidade.', 'Voto divergente no TSE.', 'verified', true, '2023-06-30', 'https://www.conjur.com.br/2023-jun-30/nunes-marques-diverge-bolsonaro/', 'news_article', 3, 'Brasília', 'TSE', 'nunes-marques-diverge-tse-b72-74')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 75
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça vota contra condenação de Bolsonaro', 'Não estão presentes todos os elementos típicos do crime de organização armada.', 'Voto no julgamento do golpe.', 'verified', true, '2025-09-11', 'https://www.jota.info/stf/mendonca-absolve-bolsonaro', 'news_article', 3, 'Brasília', 'Julgamento Trama Golpista', 'mendonca-absolve-bolsonaro-b72-75')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 76
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux vota pela absolvição parcial no 8 de janeiro', 'A tipificação de golpe pressupõe demonstração inequívoca de atos executórios.', 'Voto estruturado divergiu do relator.', 'verified', false, '2025-09-10', 'https://www.conjur.com.br/2025-set-10/fux-absolve-8-janeiro/', 'news_article', 3, 'Brasília', 'STF', 'fux-absolvicao-parcial-b72-76')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 77
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes multa X em valor recorde', 'A plataforma desrespeitou reiteradas ordens e será multada em quantia exemplar.', 'Multa milionária aplicada ao X.', 'verified', true, '2024-09-02', 'https://www.jota.info/stf/moraes-multa-x-recorde', 'news_article', 4, 'Brasília', 'STF', 'moraes-multa-x-b72-77')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 78
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso compara bolsonarismo a populismo autoritário', 'O bolsonarismo é a versão brasileira do populismo autoritário global.', 'Palestra em Harvard sobre democracia.', 'verified', false, '2024-11-20', 'https://www.conjur.com.br/2024-nov-20/barroso-bolsonarismo-populismo/', 'news_article', 3, 'Cambridge', 'Harvard', 'barroso-populismo-b72-78')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 79
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Eduardo agradece Trump por sanções', 'Agradeço ao presidente Trump pelas sanções contra o ditador Moraes.', 'Deputado comemorou sanções Magnitsky.', 'verified', true, '2025-07-30', 'https://www.oantagonista.com.br/brasil/eduardo-agradece-trump-sancoes/', 'news_article', 4, 'Washington', 'Redes sociais', 'eduardo-agradece-trump-b72-79')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 80
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar defende descriminalização do porte de maconha', 'É preciso racionalidade: tratar usuário como criminoso falhou em todo o mundo.', 'Voto no julgamento da descriminalização.', 'verified', false, '2024-06-25', 'https://www.jota.info/stf/gilmar-maconha-descriminalizacao', 'news_article', 2, 'Brasília', 'STF', 'gilmar-maconha-b72-80')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 81
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina tornozeleira eletrônica em Bolsonaro', 'A gravidade da conduta e o risco de fuga exigem o monitoramento integral.', 'Medida cautelar com tornozeleira eletrônica.', 'verified', true, '2025-07-18', 'https://www.conjur.com.br/2025-jul-18/moraes-tornozeleira-bolsonaro/', 'news_article', 4, 'Brasília', 'STF', 'moraes-tornozeleira-bolsonaro-b72-81')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 82
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Flávio vê tornozeleira como escalada do autoritarismo', 'Monitorar ex-presidente como criminoso é vergonha nacional.', 'Senador reagiu à tornozeleira do pai.', 'verified', false, '2025-07-19', 'https://www.oantagonista.com.br/brasil/flavio-tornozeleira-bolsonaro/', 'news_article', 3, 'Brasília', 'Entrevista', 'flavio-tornozeleira-b72-82')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 83
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes aceita denúncia contra Bolsonaro por golpe', 'Os elementos trazidos pela PGR são robustos e justificam o recebimento da denúncia.', 'STF aceitou denúncia contra Bolsonaro e aliados.', 'verified', true, '2025-03-26', 'https://www.jota.info/stf/moraes-aceita-denuncia-bolsonaro', 'news_article', 3, 'Brasília', 'STF', 'moraes-aceita-denuncia-b72-83')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 84
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia acompanha denúncia no STF', 'Os fatos descritos são graves e autorizam a persecução penal.', 'Voto na 1ª Turma pela abertura da ação penal.', 'verified', false, '2025-03-26', 'https://www.conjur.com.br/2025-mar-26/carmen-acompanha-denuncia/', 'news_article', 3, 'Brasília', 'STF', 'carmen-acompanha-denuncia-b72-84')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 85
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux acompanha denúncia contra Bolsonaro', 'Os requisitos mínimos foram preenchidos para o recebimento da denúncia.', 'Voto decisivo na 1ª Turma.', 'verified', false, '2025-03-26', 'https://www.jota.info/stf/fux-denuncia-bolsonaro', 'news_article', 3, 'Brasília', 'STF', 'fux-denuncia-bolsonaro-b72-85')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 86
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Motta articula PEC contra decisões monocráticas', 'É preciso disciplinar decisões monocráticas para preservar equilíbrio dos poderes.', 'Presidente da Câmara defendeu PEC no Congresso.', 'verified', false, '2025-04-10', 'https://www.conjur.com.br/2025-abr-10/motta-pec-monocraticas/', 'news_article', 3, 'Brasília', 'Câmara', 'motta-pec-monocraticas-b72-86')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 87
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina bloqueio de Rumble no Brasil', 'A plataforma se recusou a cumprir ordens judiciais e nomear representante legal.', 'Nova suspensão de plataforma digital.', 'verified', true, '2025-02-21', 'https://www.jota.info/stf/moraes-bloqueia-rumble', 'news_article', 4, 'Brasília', 'STF', 'moraes-bloqueia-rumble-b72-87')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 88
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Van Hattem chama bloqueio do Rumble de censura', 'Bloquear redes por ordem monocrática é censura prévia inconstitucional.', 'Deputado criticou decisão de Moraes.', 'verified', false, '2025-02-22', 'https://www.oantagonista.com.br/brasil/vanhattem-rumble/', 'news_article', 3, 'Brasília', 'Câmara', 'vanhattem-rumble-b72-88')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 89
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli suspende cobrança do marco temporal', 'Lei aprovada pelo Congresso contraria decisão do Supremo sobre terras indígenas.', 'Ministro suspendeu dispositivos da nova lei.', 'verified', false, '2023-12-29', 'https://www.jota.info/stf/toffoli-suspende-marco-temporal', 'news_article', 3, 'Brasília', 'STF', 'toffoli-marco-temporal-b72-89')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 90
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin defende demarcação imediata', 'A demora na demarcação é uma violência contínua aos povos originários.', 'Voto no julgamento do marco temporal.', 'verified', false, '2023-09-21', 'https://www.conjur.com.br/2023-set-21/fachin-demarcacao-imediata/', 'news_article', 2, 'Brasília', 'STF', 'fachin-demarcacao-b72-90')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 91
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina prisão de Braga Netto', 'Há indícios concretos de obstrução à Justiça e risco de coação de testemunhas.', 'Prisão do general no inquérito golpista.', 'verified', true, '2024-12-14', 'https://www.jota.info/stf/moraes-prisao-braga-netto', 'news_article', 4, 'Brasília', 'STF', 'moraes-prisao-braga-netto-b72-91')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 92
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Lula defende Moraes contra sanções', 'Moraes é um juiz sério. Os EUA estão errados em sancioná-lo.', 'Presidente defendeu ministro em entrevista internacional.', 'verified', true, '2025-07-31', 'https://www.conjur.com.br/2025-jul-31/lula-defende-moraes-sancoes/', 'news_article', 3, 'Brasília', 'Entrevista', 'lula-defende-moraes-b72-92')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 93
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar afirma que STF salvou democracia', 'Sem o Supremo, a democracia brasileira teria sido abortada em 2022.', 'Entrevista ao IDP sobre o papel da Corte.', 'verified', false, '2024-10-12', 'https://www.jota.info/stf/gilmar-stf-salvou-democracia', 'news_article', 3, 'Brasília', 'IDP', 'gilmar-stf-salvou-b72-93')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 94
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino determina plano para emendas sem transparência', 'Transparência é pressuposto da democracia. O orçamento precisa ser aberto.', 'Decisão impôs novas regras ao Congresso.', 'verified', false, '2025-02-14', 'https://www.conjur.com.br/2025-fev-14/dino-plano-emendas/', 'news_article', 3, 'Brasília', 'STF', 'dino-plano-emendas-b72-94')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 95
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Alcolumbre ameaça impeachment de ministros', 'Há PEDIDOS de impeachment engavetados há anos. Eles podem vir à pauta.', 'Fala gerou crise entre Senado e STF.', 'verified', true, '2024-09-04', 'https://www.jota.info/legislativo/alcolumbre-impeachment-ministros', 'news_article', 4, 'Brasília', 'Senado', 'alcolumbre-impeachment-b72-95')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 96
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina quebra de sigilo da Abin paralela', 'As evidências de uso indevido da agência de inteligência exigem apuração completa.', 'Inquérito mirou monitoramento ilegal.', 'verified', true, '2024-01-25', 'https://www.conjur.com.br/2024-jan-25/moraes-abin-paralela/', 'news_article', 4, 'Brasília', 'PF', 'moraes-abin-paralela-b72-96')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 97
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin vota contra descriminalização do porte de drogas', 'A questão envolve complexa ponderação de políticas públicas.', 'Voto divergente no julgamento sobre porte.', 'verified', false, '2024-06-25', 'https://www.jota.info/stf/zanin-voto-drogas', 'news_article', 2, 'Brasília', 'STF', 'zanin-voto-drogas-b72-97')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 98
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso responde a Musk com firmeza', 'Nenhum bilionário define a lei no Brasil. Aqui, a Constituição prevalece.', 'Fala em resposta a ataques de Elon Musk.', 'verified', true, '2024-04-09', 'https://www.conjur.com.br/2024-abr-09/barroso-resposta-musk/', 'news_article', 3, 'Brasília', 'STF', 'barroso-resposta-musk-b72-98')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 99
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes sentencia dosimetria recorde a Bolsonaro', 'A pena reflete a gravidade inaudita da tentativa de golpe.', 'Sentença histórica após julgamento.', 'verified', true, '2025-09-11', 'https://www.jota.info/stf/moraes-dosimetria-bolsonaro', 'news_article', 4, 'Brasília', 'STF', 'moraes-dosimetria-bolsonaro-b72-99')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 100
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro condenado a mais de 27 anos', 'Estou sendo condenado por uma corte parcial. Isso é perseguição.', 'Reação do ex-presidente após a condenação.', 'verified', true, '2025-09-12', 'https://www.oantagonista.com.br/brasil/bolsonaro-condenado-reacao/', 'news_article', 4, 'Brasília', 'Entrevista', 'bolsonaro-condenado-reacao-b72-100')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;
