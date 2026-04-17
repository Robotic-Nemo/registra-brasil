-- Batch 73: STF rulings, controversies, and institutional clashes (Jan 2023 - Apr 2026)
-- 100 statements - continuation

-- 1
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes aplica multa diária ao X por descumprimento', 'A cada dia de descumprimento, R$ 50 mil de multa por usuário que burlar o bloqueio.', 'Decisão ampliou pressão sobre Elon Musk.', 'verified', true, '2024-08-31', 'https://www.conjur.com.br/2024-ago-31/moraes-multa-diaria-x/', 'news_article', 4, 'Brasília', 'STF', 'moraes-multa-diaria-x-b73-1')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 2
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar defende bloqueio do X', 'Musk não pode se colocar acima das leis brasileiras. O bloqueio é legítimo.', 'Ministro apoiou decisão de Moraes.', 'verified', false, '2024-09-01', 'https://www.jota.info/stf/gilmar-defende-bloqueio-x', 'news_article', 3, 'Brasília', 'STF', 'gilmar-defende-bloqueio-x-b73-2')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 3
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia referenda bloqueio do X', 'Empresa de qualquer lugar do mundo tem que cumprir leis do país onde opera.', 'Voto em colegiado confirmou decisão monocrática.', 'verified', true, '2024-09-02', 'https://www.conjur.com.br/2024-set-02/carmen-referenda-bloqueio-x/', 'news_article', 3, 'Brasília', 'STF', 'carmen-referenda-bloqueio-b73-3')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 4
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli acompanha bloqueio do X', 'Não se pode tolerar descumprimento de ordens judiciais por nenhuma empresa.', 'Ministro referendou bloqueio no colegiado.', 'verified', false, '2024-09-02', 'https://www.jota.info/stf/toffoli-bloqueio-x', 'news_article', 3, 'Brasília', 'STF', 'toffoli-bloqueio-x-b73-4')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 5
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso defende regulação de redes sociais', 'Não é aceitável que redes sociais sejam território sem lei.', 'Presidente do STF cobrou regulação no Congresso.', 'verified', false, '2024-05-03', 'https://www.conjur.com.br/2024-mai-03/barroso-regulacao-redes/', 'news_article', 2, 'São Paulo', 'FGV', 'barroso-regulacao-redes-b73-5')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 6
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin defende responsabilização de big techs', 'As plataformas não podem ser imunes ao dano que geram.', 'Voto em caso sobre Marco Civil da Internet.', 'verified', false, '2024-11-28', 'https://www.jota.info/stf/fachin-responsabilidade-bigtechs', 'news_article', 2, 'Brasília', 'STF', 'fachin-bigtechs-b73-6')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 7
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes amplia responsabilidade do Marco Civil', 'As plataformas devem retirar conteúdos manifestamente ilícitos sem necessidade de ordem judicial.', 'Voto reinterpretou art. 19 do Marco Civil.', 'verified', true, '2024-12-05', 'https://www.conjur.com.br/2024-dez-05/moraes-marco-civil-plataformas/', 'news_article', 3, 'Brasília', 'STF', 'moraes-marco-civil-b73-7')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 8
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça diverge no julgamento do Marco Civil', 'Impor responsabilização ampla é converter plataformas em censores privados.', 'Voto divergente em julgamento.', 'verified', false, '2024-12-18', 'https://www.jota.info/stf/mendonca-diverge-marco-civil', 'news_article', 2, 'Brasília', 'STF', 'mendonca-marco-civil-b73-8')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 9
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques defende limites à regulação', 'O excesso regulatório ameaça a própria liberdade que se pretende proteger.', 'Voto divergente no caso do Marco Civil.', 'verified', false, '2024-12-18', 'https://www.conjur.com.br/2024-dez-18/nunes-marques-limites-regulacao/', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-regulacao-b73-9')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 10
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux posiciona-se com cautela no Marco Civil', 'A responsabilização exige criteriosa ponderação constitucional.', 'Voto intermediário sobre o Marco Civil.', 'verified', false, '2024-12-19', 'https://www.jota.info/stf/fux-cautela-marco-civil', 'news_article', 2, 'Brasília', 'STF', 'fux-cautela-marco-civil-b73-10')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 11
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin acompanha Moraes no Marco Civil', 'É necessário enfrentar a impunidade na esfera digital.', 'Voto acompanhou relator.', 'verified', false, '2024-12-18', 'https://www.jota.info/stf/zanin-marco-civil', 'news_article', 2, 'Brasília', 'STF', 'zanin-marco-civil-b73-11')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 12
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino defende regulação com limites', 'A liberdade de expressão não autoriza o crime nem o discurso de ódio.', 'Voto no julgamento do Marco Civil.', 'verified', false, '2024-12-19', 'https://www.conjur.com.br/2024-dez-19/dino-regulacao-limites/', 'news_article', 2, 'Brasília', 'STF', 'dino-regulacao-limites-b73-12')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 13
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro pede intervenção americana no STF', 'Somente os EUA podem nos ajudar a enfrentar essa ditadura togada.', 'Fala em ato com aliados da direita internacional.', 'verified', false, '2025-02-25', 'https://www.oantagonista.com.br/brasil/bolsonaro-pede-intervencao-eua/', 'news_article', 5, 'São Paulo', 'Ato', 'bolsonaro-intervencao-eua-b73-13')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 14
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes inclui Bolsonaro em inquérito sobre coação', 'A convocação de intervenção estrangeira configura coação no curso do processo.', 'Bolsonaro virou alvo por pedir intervenção dos EUA.', 'verified', true, '2025-02-26', 'https://www.conjur.com.br/2025-fev-26/moraes-inclui-bolsonaro-coacao/', 'news_article', 4, 'Brasília', 'STF', 'moraes-bolsonaro-coacao-b73-14')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 15
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Eduardo pede asilo político nos EUA', 'Diante da perseguição de Moraes, cogito pedir asilo para continuar a luta.', 'Deputado anunciou mudança para EUA.', 'verified', true, '2025-03-18', 'https://www.jota.info/politica/eduardo-bolsonaro-asilo-eua', 'news_article', 4, 'Washington', 'Entrevista', 'eduardo-asilo-eua-b73-15')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 16
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes bloqueia bens de Eduardo Bolsonaro', 'O bloqueio de bens é medida necessária ante indícios de lobby golpista.', 'Decisão foi questionada por juristas.', 'verified', true, '2025-07-20', 'https://www.oantagonista.com.br/brasil/moraes-bloqueia-eduardo/', 'news_article', 4, 'Brasília', 'STF', 'moraes-bloqueia-eduardo-b73-16')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 17
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar critica PEC da blindagem de parlamentares', 'O Parlamento não pode se transformar em seita imune ao direito.', 'Reação à PEC aprovada pela Câmara.', 'verified', true, '2025-09-17', 'https://www.conjur.com.br/2025-set-17/gilmar-pec-blindagem/', 'news_article', 4, 'Brasília', 'STF', 'gilmar-pec-blindagem-b73-17')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 18
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Motta defende PEC da blindagem', 'A PEC garante equilíbrio entre os poderes e previne abusos judiciais.', 'Presidente da Câmara pautou a PEC.', 'verified', true, '2025-09-16', 'https://www.jota.info/legislativo/motta-pec-blindagem', 'news_article', 4, 'Brasília', 'Câmara', 'motta-defende-pec-b73-18')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 19
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes sinaliza que derrubará PEC da blindagem', 'Nenhuma emenda pode revogar cláusula pétrea do acesso à Justiça.', 'Fala em palestra sobre ativismo judicial.', 'verified', false, '2025-09-18', 'https://www.conjur.com.br/2025-set-18/moraes-pec-blindagem/', 'news_article', 3, 'São Paulo', 'FGV', 'moraes-sinaliza-pec-b73-19')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 20
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli critica PEC da blindagem', 'Blindagem ampla para parlamentares é retrocesso inaceitável.', 'Ministro reagiu à PEC em entrevista.', 'verified', false, '2025-09-19', 'https://www.jota.info/stf/toffoli-critica-pec-blindagem', 'news_article', 3, 'Brasília', 'Entrevista', 'toffoli-critica-pec-b73-20')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 21
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia afirma ser absurdo blindar deputado', 'Blindar qualquer um contra a lei é contra a República.', 'Reação à PEC aprovada pela Câmara.', 'verified', false, '2025-09-18', 'https://www.conjur.com.br/2025-set-18/carmen-blindar-deputado/', 'news_article', 3, 'Brasília', 'STF', 'carmen-blindar-deputado-b73-21')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 22
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux critica PEC da blindagem', 'Anistia e blindagem distorcem o pacto constitucional.', 'Ministro comentou PEC em palestra.', 'verified', false, '2025-09-20', 'https://www.jota.info/stf/fux-pec-blindagem', 'news_article', 3, 'Rio de Janeiro', 'PUC-Rio', 'fux-pec-blindagem-b73-22')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 23
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin declara anistia inconstitucional', 'Anistia para golpistas é inconstitucional e contraria a Constituição cidadã.', 'Posicionamento sobre PL da anistia.', 'verified', true, '2025-09-25', 'https://www.conjur.com.br/2025-set-25/fachin-anistia-inconstitucional/', 'news_article', 3, 'Brasília', 'STF', 'fachin-anistia-inconstitucional-b73-23')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 24
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Kicis defende anistia ampla aos presos', 'Anistia imediata para todos presos injustamente pelo 8 de janeiro.', 'Fala em ato em Brasília.', 'verified', false, '2025-05-25', 'https://www.gazetadopovo.com.br/republica/kicis-anistia-ampla/', 'news_article', 3, 'Brasília', 'Ato', 'kicis-anistia-ampla-b73-24')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 25
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Feliciano chama condenações de perseguição', 'Ninguém é golpista. Eles estavam apenas protestando por sua pátria.', 'Fala em ato por anistia.', 'verified', false, '2025-04-21', 'https://www.oantagonista.com.br/brasil/feliciano-perseguicao-8-janeiro/', 'news_article', 3, 'Brasília', 'Ato', 'feliciano-perseguicao-b73-25')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 26
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes condena Braga Netto por trama golpista', 'O general foi elo central na orquestração da tentativa de golpe.', 'Voto pela condenação do ex-ministro.', 'verified', true, '2025-09-06', 'https://www.conjur.com.br/2025-set-06/moraes-condena-braga-netto/', 'news_article', 4, 'Brasília', 'STF', 'moraes-braga-netto-b73-26')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 27
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes condena Anderson Torres por golpe', 'Omissão deliberada do então ministro facilitou a invasão dos Três Poderes.', 'Voto pela condenação do ex-ministro da Justiça.', 'verified', true, '2025-09-07', 'https://www.jota.info/stf/moraes-condena-anderson-torres', 'news_article', 4, 'Brasília', 'STF', 'moraes-anderson-torres-b73-27')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 28
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar afirma derrota do bolsonarismo nos tribunais', 'O bolsonarismo colecionará derrotas sucessivas nos tribunais.', 'Entrevista em Lisboa.', 'verified', false, '2025-08-10', 'https://www.conjur.com.br/2025-ago-10/gilmar-derrota-bolsonarismo/', 'news_article', 3, 'Lisboa', 'IDP', 'gilmar-derrota-bolsonarismo-b73-28')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 29
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia defende voto eletrônico em 2026', 'A urna é tecnológica, segura e brasileira. Seguirá em 2026.', 'Fala em abertura de ano judiciário do TSE.', 'verified', false, '2025-02-10', 'https://www.tse.jus.br/imprensa/noticias-tse/2025/carmen-voto-eletronico', 'official_statement', 2, 'Brasília', 'TSE', 'carmen-voto-eletronico-b73-29')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 30
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina depoimento de Mauro Cid', 'O colaborador será ouvido sobre os episódios do planejamento do golpe.', 'Colaboração premiada do ex-ajudante de ordens.', 'verified', false, '2023-09-05', 'https://www.jota.info/stf/moraes-depoimento-mauro-cid', 'news_article', 3, 'Brasília', 'STF', 'moraes-depoimento-cid-b73-30')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 31
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques rejeita rescisão da colaboração de Cid', 'Não vislumbro indícios suficientes para descredenciar a colaboração.', 'Voto divergente sobre Mauro Cid.', 'verified', false, '2024-05-15', 'https://www.conjur.com.br/2024-mai-15/nunes-marques-colaboracao-cid/', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-cid-b73-31')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 32
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin preside 1ª Turma e recebe críticas', 'Assumo a presidência da turma comprometido com o melhor das tradições do STF.', 'Zanin assumiu presidência da 1ª Turma.', 'verified', false, '2025-02-20', 'https://www.jota.info/stf/zanin-preside-turma', 'news_article', 2, 'Brasília', 'STF', 'zanin-preside-turma-b73-32')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 33
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino nega articulação com Lula em decisões', 'Minhas decisões são jurídicas. Não recebo orientação do Planalto.', 'Ministro respondeu a críticas da oposição.', 'verified', false, '2024-09-10', 'https://www.conjur.com.br/2024-set-10/dino-nega-articulacao-lula/', 'news_article', 2, 'Brasília', 'STF', 'dino-nega-articulacao-b73-33')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 34
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Marinho acusa Dino de agir em defesa do governo', 'Dino é ministro-advogado do PT no Supremo. Isso é indisfarçável.', 'Líder da oposição ataca ministro no Senado.', 'verified', false, '2025-02-15', 'https://www.jota.info/legislativo/marinho-acusa-dino', 'news_article', 3, 'Brasília', 'Senado', 'marinho-acusa-dino-b73-34')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 35
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes manda prender jornalista brasileiro nos EUA', 'Os fatos narrados podem tipificar crimes contra a ordem democrática.', 'Pedido de extradição gerou polêmica.', 'verified', false, '2024-03-21', 'https://www.oantagonista.com.br/brasil/moraes-jornalista-eua/', 'news_article', 4, 'Brasília', 'STF', 'moraes-jornalista-eua-b73-35')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 36
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso afirma que 8 de janeiro foi golpe frustrado', 'O que aconteceu em 8 de janeiro foi uma tentativa de golpe, sem meias palavras.', 'Entrevista a revista internacional.', 'verified', false, '2023-11-10', 'https://www.conjur.com.br/2023-nov-10/barroso-8-janeiro-golpe/', 'news_article', 2, 'Nova York', 'Entrevista', 'barroso-8-janeiro-golpe-b73-36')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 37
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina bloqueio de contas de jornalistas', 'As postagens divulgavam informações sigilosas do inquérito.', 'Jornalistas tiveram contas bloqueadas no X.', 'verified', false, '2024-04-08', 'https://www.jota.info/stf/moraes-bloqueia-contas-jornalistas', 'news_article', 4, 'Brasília', 'STF', 'moraes-contas-jornalistas-b73-37')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 38
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Van Hattem denuncia Twitter Files brasileiro', 'As revelações mostram uso político do STF contra adversários.', 'Deputado citou vazamento de ordens do STF.', 'verified', false, '2024-04-04', 'https://www.gazetadopovo.com.br/republica/vanhattem-twitter-files/', 'news_article', 3, 'Brasília', 'Câmara', 'vanhattem-twitter-files-b73-38')
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
    VALUES (v_p, 'Moraes abre inquérito contra Musk', 'Os atos do empresário Elon Musk podem tipificar crimes contra o Estado Democrático.', 'Inquérito contra Musk por descumprimento de ordens.', 'verified', true, '2024-04-07', 'https://www.conjur.com.br/2024-abr-07/moraes-inquerito-musk/', 'news_article', 4, 'Brasília', 'STF', 'moraes-inquerito-musk-b73-39')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 40
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Eduardo ataca Moraes em viagem a Washington', 'Moraes é ditador e perseguidor. Apresentei dossiê ao governo Trump.', 'Deputado em agenda com aliados americanos.', 'verified', false, '2025-02-26', 'https://www.oantagonista.com.br/brasil/eduardo-ataca-moraes-washington/', 'news_article', 4, 'Washington', 'Lobby EUA', 'eduardo-ataca-moraes-b73-40')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 41
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Lindbergh denuncia lobby de Eduardo contra Moraes', 'Eduardo Bolsonaro pratica traição à pátria ao pedir sanções contra juiz brasileiro.', 'Líder da bancada reagiu.', 'verified', false, '2025-03-16', 'https://www.jota.info/legislativo/lindbergh-denuncia-lobby-eduardo', 'news_article', 3, 'Brasília', 'Câmara', 'lindbergh-denuncia-eduardo-b73-41')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 42
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes abre inquérito contra Eduardo Bolsonaro', 'O deputado tem atuado para obter sanções contra ministros brasileiros.', 'Inquérito aberto no STF.', 'verified', true, '2025-03-17', 'https://www.conjur.com.br/2025-mar-17/moraes-inquerito-eduardo/', 'news_article', 4, 'Brasília', 'STF', 'moraes-inquerito-eduardo-b73-42')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 43
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar concede liberdade a empresário bolsonarista', 'A prisão preventiva não se justifica sem novos fatos concretos.', 'Decisão contrariou colega Moraes.', 'verified', false, '2024-11-18', 'https://www.jota.info/stf/gilmar-liberdade-empresario', 'news_article', 3, 'Brasília', 'STF', 'gilmar-liberdade-empresario-b73-43')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 44
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'obstrucao-justica';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli anula provas contra Palocci', 'A Lava Jato tratou com arbítrio empresas e executivos.', 'Decisão beneficiou ex-ministro.', 'verified', false, '2024-06-07', 'https://www.conjur.com.br/2024-jun-07/toffoli-anula-palocci/', 'news_article', 3, 'Brasília', 'STF', 'toffoli-anula-palocci-b73-44')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 45
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes ataca negacionismo eleitoral no TSE', 'Não se tolera mais a indústria de mentiras sobre as urnas.', 'Fala em sessão do TSE.', 'verified', false, '2024-10-04', 'https://www.tse.jus.br/imprensa/noticias-tse/2024/moraes-negacionismo-eleitoral', 'official_statement', 2, 'Brasília', 'TSE', 'moraes-negacionismo-tse-b73-45')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 46
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin reafirma que golpe nao se consumou por bravura democrática', 'O Brasil resistiu porque a democracia brasileira tem raízes profundas.', 'Fala em evento da OAB.', 'verified', false, '2024-01-08', 'https://www.conjur.com.br/2024-jan-08/fachin-8-janeiro-um-ano/', 'news_article', 2, 'Brasília', 'OAB', 'fachin-8-janeiro-um-ano-b73-46')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 47
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques vota para anular condenação de militar', 'A prova colhida em ambiente castrense foi obtida com irregularidades.', 'Voto divergente em caso militar.', 'verified', false, '2024-07-12', 'https://www.jota.info/stf/nunes-marques-anula-militar', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-militar-b73-47')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 48
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça defende liberdade religiosa em decisão', 'Nenhuma ideologia pode subjugar a liberdade de consciência do cidadão.', 'Voto em caso sobre aulas religiosas.', 'verified', false, '2024-03-22', 'https://www.conjur.com.br/2024-mar-22/mendonca-liberdade-religiosa/', 'news_article', 2, 'Brasília', 'STF', 'mendonca-liberdade-religiosa-b73-48')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 49
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin condena Zambelli em julgamento', 'A conduta configura gravíssima violação à dignidade do Parlamento.', 'Voto decisivo na condenação de Zambelli.', 'verified', false, '2024-05-14', 'https://www.jota.info/stf/zanin-condena-zambelli', 'news_article', 3, 'Brasília', 'STF', 'zanin-condena-zambelli-b73-49')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 50
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino refuta críticas bolsonaristas ao STF', 'O desserviço à democracia não muda quando vem de parlamentares.', 'Ministro respondeu a ataques no plenário.', 'verified', false, '2025-02-20', 'https://www.jota.info/stf/dino-refuta-bolsonaristas', 'news_article', 3, 'Brasília', 'STF', 'dino-refuta-bolsonaristas-b73-50')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 51
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes diz que não se intimida com sanções estrangeiras', 'Juiz brasileiro não se dobra a chantagens. A Constituição é o nosso guia.', 'Fala em sessão solene do TSE.', 'verified', true, '2025-08-05', 'https://www.conjur.com.br/2025-ago-05/moraes-nao-se-intimida/', 'news_article', 3, 'Brasília', 'TSE', 'moraes-nao-se-intimida-b73-51')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 52
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso reage a sanções dos EUA', 'Sanções contra ministros brasileiros são inaceitável interferência.', 'Nota conjunta divulgada pela Corte.', 'verified', true, '2025-07-30', 'https://www.jota.info/stf/barroso-reage-sancoes', 'news_article', 3, 'Brasília', 'STF', 'barroso-reage-sancoes-b73-52')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 53
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia afirma que toga brasileira não se curva', 'Todo ato de ameaça externa à soberania encontrará resposta da Justiça.', 'Fala após sanções Magnitsky.', 'verified', false, '2025-07-31', 'https://www.conjur.com.br/2025-jul-31/carmen-toga-nao-se-curva/', 'news_article', 3, 'Brasília', 'STF', 'carmen-toga-nao-curva-b73-53')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 54
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli denuncia ataques transnacionais à Corte', 'O Brasil não é quintal de quem quer que seja.', 'Entrevista sobre sanções Magnitsky.', 'verified', false, '2025-08-01', 'https://www.jota.info/stf/toffoli-ataques-transnacionais', 'news_article', 3, 'Brasília', 'Entrevista', 'toffoli-ataques-transnacionais-b73-54')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 55
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Randolfe lidera ato em solidariedade a Moraes', 'Estamos ao lado de Moraes, defendendo a Justiça contra estrangeiros.', 'Ato em Brasília convocado por parlamentares.', 'verified', false, '2025-07-31', 'https://www.oantagonista.com.br/brasil/randolfe-ato-moraes/', 'news_article', 2, 'Brasília', 'Ato', 'randolfe-ato-moraes-b73-55')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 56
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Boulos apoia resposta brasileira a Trump', 'Nenhum imperialismo nos dirá quem julga quem no Brasil.', 'Fala em ato pela soberania.', 'verified', false, '2025-08-01', 'https://www.conjur.com.br/2025-ago-01/boulos-resposta-trump/', 'news_article', 2, 'São Paulo', 'Ato', 'boulos-resposta-trump-b73-56')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 57
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Flávio promove ato contra STF', 'Precisamos acabar com a tirania do Supremo com a força das ruas.', 'Ato bolsonarista na Paulista.', 'verified', false, '2025-06-29', 'https://www.oantagonista.com.br/brasil/flavio-ato-stf/', 'news_article', 4, 'São Paulo', 'Ato', 'flavio-ato-stf-b73-57')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 58
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nikolas fala em derrubar o STF por voto popular', 'Vamos derrubar essa ditadura togada pelo voto em 2026.', 'Fala em ato contra o STF.', 'verified', false, '2025-06-29', 'https://www.gazetadopovo.com.br/republica/nikolas-derrubar-stf/', 'news_article', 4, 'São Paulo', 'Ato', 'nikolas-derrubar-stf-b73-58')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 59
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes determina prisão de Filipe Martins', 'Há risco concreto de fuga do ex-assessor diante de elementos de coação.', 'Ex-assessor de Bolsonaro foi preso.', 'verified', true, '2024-02-08', 'https://www.conjur.com.br/2024-fev-08/moraes-prende-filipe-martins/', 'news_article', 4, 'Brasília', 'STF', 'moraes-prende-filipe-martins-b73-59')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 60
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes manda soltar Filipe Martins após meses', 'A prisão já atingiu seu escopo cautelar e não há razão para sua manutenção.', 'Libertação após críticas à prisão prolongada.', 'verified', false, '2024-09-10', 'https://www.jota.info/stf/moraes-solta-filipe-martins', 'news_article', 3, 'Brasília', 'STF', 'moraes-solta-filipe-martins-b73-60')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 61
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar comemora 20 anos no STF com crítica à extrema-direita', 'A extrema-direita é o maior perigo à democracia brasileira.', 'Evento no STF pelos 20 anos do ministro.', 'verified', false, '2023-06-20', 'https://www.conjur.com.br/2023-jun-20/gilmar-20-anos-stf/', 'news_article', 2, 'Brasília', 'STF', 'gilmar-20-anos-stf-b73-61')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 62
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli equipara Moro a Eichmann', 'Moro agiu com tanta frieza quanto os burocratas do regime totalitário.', 'Fala gerou polêmica e reação intensa.', 'verified', true, '2023-12-07', 'https://www.conjur.com.br/2023-dez-07/toffoli-moro-eichmann/', 'news_article', 3, 'Brasília', 'STF', 'toffoli-moro-eichmann-b73-62')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 63
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin defende a Lava Jato em ato contrário a Toffoli', 'A Lava Jato apurou a maior cadeia de corrupção da história.', 'Voto divergente de Toffoli na anulação.', 'verified', false, '2023-10-02', 'https://www.jota.info/stf/fachin-defende-lava-jato', 'news_article', 3, 'Brasília', 'STF', 'fachin-defende-lava-jato-b73-63')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 64
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux rebate Toffoli sobre Lava Jato', 'Não se pode desqualificar uma operação que mudou a história do país.', 'Declaração em evento sobre combate à corrupção.', 'verified', false, '2023-12-10', 'https://www.conjur.com.br/2023-dez-10/fux-rebate-toffoli/', 'news_article', 3, 'Rio de Janeiro', 'Seminário', 'fux-rebate-toffoli-b73-64')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 65
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen nega anulação de provas contra Cabral', 'Os elementos probatórios foram produzidos em conformidade com a lei.', 'Voto divergiu de Toffoli.', 'verified', false, '2024-04-02', 'https://www.jota.info/stf/carmen-provas-cabral', 'news_article', 2, 'Brasília', 'STF', 'carmen-provas-cabral-b73-65')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 66
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'desinformacao';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes combate desinformação eleitoral em 2024', 'As fake news eleitorais serão combatidas com o máximo rigor.', 'Fala em abertura das eleições municipais.', 'verified', false, '2024-08-16', 'https://www.conjur.com.br/2024-ago-16/moraes-desinformacao-eleitoral/', 'news_article', 2, 'Brasília', 'TSE', 'moraes-desinformacao-eleitoral-b73-66')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 67
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes encerra presidência do TSE destacando eleições sem ataques', 'Concluímos um ciclo eleitoral sem ataques contra as urnas.', 'Despedida da presidência do TSE.', 'verified', false, '2024-06-02', 'https://www.jota.info/tse/moraes-encerra-presidencia', 'official_statement', 2, 'Brasília', 'TSE', 'moraes-encerra-tse-b73-67')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 68
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso fala em guerra contra desinformação', 'A desinformação é uma guerra contra a realidade.', 'Palestra no Palácio do Itamaraty.', 'verified', false, '2024-10-28', 'https://www.conjur.com.br/2024-out-28/barroso-guerra-desinformacao/', 'news_article', 2, 'Brasília', 'Itamaraty', 'barroso-guerra-desinformacao-b73-68')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 69
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino defende punição de autores de golpismo', 'Não há conciliação com golpistas. A Constituição exige responsabilização.', 'Voto contra anistia.', 'verified', false, '2025-09-26', 'https://www.jota.info/stf/dino-punir-golpismo', 'news_article', 3, 'Brasília', 'STF', 'dino-punir-golpismo-b73-69')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 70
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes proíbe Bolsonaro de contato com embaixadas', 'Fica vedado o contato com representações diplomáticas a fim de evitar articulações golpistas.', 'Medidas cautelares ampliadas contra Bolsonaro.', 'verified', true, '2025-07-18', 'https://www.conjur.com.br/2025-jul-18/moraes-veta-embaixadas-bolsonaro/', 'news_article', 4, 'Brasília', 'STF', 'moraes-veta-embaixadas-b73-70')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 71
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Bolsonaro descumpre cautelares e visita embaixada', 'Ninguém vai me calar. Vou onde for preciso para mostrar a verdade.', 'Visita gerou novo pedido de prisão.', 'verified', true, '2025-07-21', 'https://www.oantagonista.com.br/brasil/bolsonaro-descumpre-cautelares/', 'news_article', 4, 'Brasília', 'Embaixada', 'bolsonaro-descumpre-cautelares-b73-71')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 72
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar afirma que há cansaço da democracia', 'O Brasil vive cansaço da democracia, mas não podemos ceder ao autoritarismo.', 'Palestra em Lisboa sobre instituições.', 'verified', false, '2025-03-10', 'https://www.jota.info/stf/gilmar-cansaco-democracia', 'news_article', 3, 'Lisboa', 'Fórum Jurídico', 'gilmar-cansaco-democracia-b73-72')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 73
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes diz que golpistas serão responsabilizados', 'Golpistas pagarão, um a um, por seus crimes contra a democracia.', 'Fala em sessão solene do STF.', 'verified', false, '2024-01-08', 'https://www.conjur.com.br/2024-jan-08/moraes-golpistas-responsabilizados/', 'news_article', 3, 'Brasília', 'STF', 'moraes-golpistas-responsabilizados-b73-73')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 74
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zambelli anuncia fuga após condenação', 'Vou para a Itália. Não tenho mais paz nem segurança no Brasil.', 'Deputada fugiu para a Europa.', 'verified', true, '2025-06-03', 'https://www.oantagonista.com.br/brasil/zambelli-foge-italia/', 'news_article', 4, 'Roma', 'Fuga', 'zambelli-foge-italia-b73-74')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 75
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes decreta prisão de Zambelli', 'A fuga da parlamentar condenada configura fundamento para prisão preventiva.', 'Prisão após fuga para Itália.', 'verified', true, '2025-06-04', 'https://www.jota.info/stf/moraes-prisao-zambelli-fuga', 'news_article', 4, 'Brasília', 'STF', 'moraes-prisao-zambelli-fuga-b73-75')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 76
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso afirma que STF não é adversário do Congresso', 'Não somos adversários. Somos poderes em diálogo permanente.', 'Fala para reduzir tensão com o Congresso.', 'verified', false, '2024-09-15', 'https://www.conjur.com.br/2024-set-15/barroso-stf-congresso/', 'news_article', 2, 'Brasília', 'STF', 'barroso-stf-congresso-b73-76')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 77
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Alcolumbre pressiona STF por indicação ao Supremo', 'Espero do governo nome que tenha o perfil jurídico e respeite o Senado.', 'Presidente do Senado condicionou indicação.', 'verified', false, '2025-10-20', 'https://www.jota.info/legislativo/alcolumbre-indicacao-stf', 'news_article', 2, 'Brasília', 'Senado', 'alcolumbre-pressiona-indicacao-b73-77')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 78
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Messias promete autonomia se indicado ao STF', 'Indicado, decidirei à luz da Constituição, sem alinhamentos partidários.', 'AGU cotado para vaga no Supremo.', 'verified', false, '2025-11-01', 'https://www.conjur.com.br/2025-nov-01/messias-promete-autonomia/', 'news_article', 2, 'Brasília', 'Entrevista', 'messias-promete-autonomia-b73-78')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 79
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'autoritarismo';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes proíbe entrevistas de Bolsonaro', 'Ficam vedadas entrevistas até julgamento final para preservar instrução.', 'Nova cautelar gerou críticas de juristas.', 'verified', true, '2025-08-04', 'https://www.oantagonista.com.br/brasil/moraes-proibe-entrevistas-bolsonaro/', 'news_article', 4, 'Brasília', 'STF', 'moraes-proibe-entrevistas-b73-79')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 80
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Van Hattem denuncia censura prévia', 'Proibir entrevistas é censura prévia, inconstitucional desde 1988.', 'Crítica a decisão de Moraes.', 'verified', false, '2025-08-05', 'https://www.jota.info/legislativo/vanhattem-censura-previa', 'news_article', 3, 'Brasília', 'Câmara', 'vanhattem-censura-previa-b73-80')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 81
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes recusa anistia no STF', 'Não cabe ao Parlamento perdoar golpistas já condenados.', 'Fala em resposta ao PL da anistia.', 'verified', true, '2025-09-30', 'https://www.conjur.com.br/2025-set-30/moraes-recusa-anistia/', 'news_article', 4, 'Brasília', 'STF', 'moraes-recusa-anistia-b73-81')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 82
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin faz discurso contra PL da anistia no STF', 'Anistiar é rasgar a Constituição. O STF não admitirá essa afronta.', 'Primeiro discurso como presidente.', 'verified', true, '2025-09-29', 'https://www.jota.info/stf/fachin-discurso-anistia', 'news_article', 3, 'Brasília', 'STF', 'fachin-discurso-anistia-b73-82')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 83
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_c FROM categories WHERE slug = 'ameaca-instituicoes';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Feliciano critica presidência de Fachin', 'Fachin preside a mais arbitrária Corte da história democrática.', 'Fala em plenário.', 'verified', false, '2025-09-30', 'https://www.gazetadopovo.com.br/republica/feliciano-critica-fachin/', 'news_article', 2, 'Brasília', 'Câmara', 'feliciano-critica-fachin-b73-83')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 84
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Barroso fecha presidência com balanço', 'Sai de cena como cheguei: com respeito à Constituição e à democracia.', 'Sessão solene de despedida da presidência.', 'verified', false, '2025-09-28', 'https://www.conjur.com.br/2025-set-28/barroso-balanço-presidencia/', 'news_article', 2, 'Brasília', 'STF', 'barroso-balanço-presidencia-b73-84')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 85
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes multa X em valor diário', 'Multa de R$ 200 mil por dia enquanto rede social descumprir decisões.', 'Multa arrochou ainda mais o X.', 'verified', false, '2024-04-10', 'https://www.jota.info/stf/moraes-multa-diaria-x-200', 'news_article', 3, 'Brasília', 'STF', 'moraes-multa-diaria-x-200-b73-85')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 86
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar critica tentativa de criminalizar ministros', 'A responsabilização política de juízes é legítima; a criminalização é autoritária.', 'Fala sobre ataques a ministros.', 'verified', false, '2024-09-04', 'https://www.conjur.com.br/2024-set-04/gilmar-criminalizar-ministros/', 'news_article', 3, 'Brasília', 'STF', 'gilmar-criminalizar-ministros-b73-86')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 87
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_c FROM categories WHERE slug = 'conflito-interesses';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Toffoli estende nulidades a Emilio Odebrecht', 'Aplicam-se ao réu os mesmos critérios de nulidade reconhecidos anteriormente.', 'Decisão em cadeia após anulações.', 'verified', false, '2024-08-20', 'https://www.jota.info/stf/toffoli-emilio-odebrecht', 'news_article', 3, 'Brasília', 'STF', 'toffoli-emilio-odebrecht-b73-87')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 88
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Cármen Lúcia encerra presidência do TSE', 'Seguimos defendendo o voto livre, seguro e auditável.', 'Cerimônia de passagem da presidência.', 'verified', false, '2025-06-02', 'https://www.tse.jus.br/imprensa/noticias-tse/2025/carmen-encerra-tse', 'official_statement', 2, 'Brasília', 'TSE', 'carmen-encerra-tse-b73-88')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 89
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fux vota por soltura de presos do 8 de janeiro', 'Há casos de excesso prisional que impõem liberação imediata.', 'Ministro abriu divergência em HCs coletivos.', 'verified', false, '2024-04-30', 'https://www.conjur.com.br/2024-abr-30/fux-soltura-8-janeiro/', 'news_article', 3, 'Brasília', 'STF', 'fux-soltura-8-janeiro-b73-89')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 90
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'nunes-marques';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Nunes Marques vota por mitigar penas do 8 de janeiro', 'Muitas condenações são desproporcionais à conduta efetiva.', 'Voto em caso de ré do 8 de janeiro.', 'verified', false, '2024-10-15', 'https://www.jota.info/stf/nunes-marques-mitiga-penas', 'news_article', 2, 'Brasília', 'STF', 'nunes-marques-mitiga-penas-b73-90')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 91
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'andre-mendonca';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Mendonça vota por mitigar penas do 8 de janeiro', 'Não há prova suficiente para aplicação da pena máxima.', 'Voto em caso de atacantes menos graves.', 'verified', false, '2024-10-15', 'https://www.conjur.com.br/2024-out-15/mendonca-mitiga-penas/', 'news_article', 2, 'Brasília', 'STF', 'mendonca-mitiga-penas-b73-91')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 92
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin pede convergência ao Congresso', 'Precisamos pactuar soluções que preservem a Constituição.', 'Fala em encontro com lideranças.', 'verified', false, '2025-10-02', 'https://www.jota.info/stf/fachin-convergencia-congresso', 'news_article', 2, 'Brasília', 'STF', 'fachin-convergencia-congresso-b73-92')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 93
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes bloqueia ato golpista convocado por aliados de Bolsonaro', 'Ameaças de ocupação de órgãos públicos não serão toleradas.', 'Proibição de manifestações golpistas.', 'verified', false, '2024-03-08', 'https://www.conjur.com.br/2024-mar-08/moraes-bloqueia-ato-golpista/', 'news_article', 3, 'Brasília', 'STF', 'moraes-bloqueia-ato-b73-93')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 94
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Zanin vota por restringir indulto natalino', 'A ampliação do indulto não deve abarcar crimes contra a democracia.', 'Voto em julgamento sobre indulto.', 'verified', false, '2024-12-10', 'https://www.jota.info/stf/zanin-restringir-indulto', 'news_article', 2, 'Brasília', 'STF', 'zanin-restringir-indulto-b73-94')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 95
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Dino impõe novas condições para emendas em 2026', 'Não será permitido retrocesso no controle de gasto público.', 'Nova decisão sobre emendas parlamentares.', 'verified', true, '2026-02-05', 'https://www.conjur.com.br/2026-fev-05/dino-novas-condicoes-emendas/', 'news_article', 3, 'Brasília', 'STF', 'dino-novas-condicoes-b73-95')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 96
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes reafirma preparação do TSE para 2026', 'A Justiça Eleitoral está preparada para proteger as eleições presidenciais.', 'Balanço prévio das eleições de 2026.', 'verified', false, '2026-03-15', 'https://www.jota.info/tse/moraes-preparacao-2026', 'news_article', 2, 'Brasília', 'TSE', 'moraes-preparacao-2026-b73-96')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 97
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin convoca ministros para pacto democrático', 'Brasil precisa de pacto entre os poderes em 2026.', 'Presidente do STF convocou reunião dos Três Poderes.', 'verified', true, '2026-01-15', 'https://www.conjur.com.br/2026-jan-15/fachin-pacto-democratico/', 'news_article', 2, 'Brasília', 'STF', 'fachin-pacto-democratico-b73-97')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 98
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Gilmar alerta para risco de regressão autoritária', 'O Brasil precisa defender suas instituições com vigilância diuturna.', 'Fala no IDP sobre as eleições de 2026.', 'verified', false, '2026-02-28', 'https://www.jota.info/stf/gilmar-alerta-regressao', 'news_article', 3, 'Brasília', 'IDP', 'gilmar-alerta-regressao-b73-98')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 99
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_c FROM categories WHERE slug = 'abuso-de-poder';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Moraes rejeita recurso final de Bolsonaro', 'A defesa não trouxe elementos novos capazes de alterar o julgamento.', 'Embargos rejeitados no julgamento do golpe.', 'verified', true, '2026-03-04', 'https://www.conjur.com.br/2026-mar-04/moraes-rejeita-embargos-bolsonaro/', 'news_article', 4, 'Brasília', 'STF', 'moraes-rejeita-embargos-b73-99')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;

-- 100
DO $$
DECLARE v_p UUID; v_c UUID;
BEGIN
  SELECT id INTO v_p FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_c FROM categories WHERE slug = 'antidemocratico';
  WITH ins AS (
    INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug)
    VALUES (v_p, 'Fachin afirma transição de poder em 2026 será garantida', 'A transição democrática de 2026 será garantida pelo STF.', 'Compromisso público em ano eleitoral.', 'verified', true, '2026-04-10', 'https://www.jota.info/stf/fachin-transicao-2026', 'news_article', 3, 'Brasília', 'STF', 'fachin-transicao-2026-b73-100')
    RETURNING id
  )
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, v_c, true FROM ins;
END $$;
