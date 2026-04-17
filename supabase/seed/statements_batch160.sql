-- Batch 160: Operações anticorrupção, PF e MPF (2023-2026)
DO $$
DECLARE
  v_fel UUID; v_dam UUID; v_mag UUID; v_sil UUID; v_kic UUID;
  v_nik UUID; v_mic UUID; v_pmc UUID; v_jair UUID; v_edu UUID;
  v_fla UUID; v_car UUID; v_mou UUID; v_sal UUID; v_dsi UUID;
  v_zam UUID; v_ram UUID; v_van UUID; v_kim UUID; v_adr UUID;
  v_gir UUID; v_zan UUID; v_san UUID; v_bar UUID; v_gil UUID;
  v_gui UUID; v_hil UUID; v_bom UUID; v_pet UUID; v_jan UUID;
  v_orl UUID; v_chi UUID; v_frx UUID; v_had UUID; v_lul UUID;
  v_gle UUID; v_pad UUID; v_mes UUID; v_lew UUID; v_din UUID;
  v_amo UUID; v_gme UUID; v_mar UUID; v_eln UUID; v_agu UUID;
  v_via UUID; v_elg UUID; v_dua UUID; v_jaq UUID; v_hum UUID;
  v_ran UUID; v_mor UUID;
  c_cor UUID; c_abu UUID; c_con UUID; c_nep UUID; c_obs UUID;
  c_int UUID; c_des UUID; c_aut UUID; c_odi UUID;
BEGIN
  SELECT id INTO v_fel  FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam  FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag  FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_sil  FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_kic  FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_nik  FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_mic  FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_pmc  FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu  FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla  FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car  FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mou  FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_sal  FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_dsi  FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_zam  FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram  FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_van  FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim  FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_adr  FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_gir  FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_zan  FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san  FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_bar  FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_gil  FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gui  FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_hil  FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_bom  FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_pet  FROM politicians WHERE slug = 'taliria-petrone';
  SELECT id INTO v_jan  FROM politicians WHERE slug = 'jandira-feghali';
  SELECT id INTO v_orl  FROM politicians WHERE slug = 'orlando-silva';
  SELECT id INTO v_chi  FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_frx  FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_had  FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_lul  FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle  FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad  FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_mes  FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew  FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_din  FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_amo  FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gme  FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_mar  FROM politicians WHERE slug = 'rogerio-marinho';
  SELECT id INTO v_eln  FROM politicians WHERE slug = 'elmar-nascimento';
  SELECT id INTO v_agu  FROM politicians WHERE slug = 'aguinaldo-ribeiro';
  SELECT id INTO v_via  FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_elg  FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua  FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jaq  FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum  FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ran  FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_mor  FROM politicians WHERE slug = 'sergio-moro';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é alvo da operação Lucas 12:2 da PF sobre joias sauditas.', 'Tudo é perseguição. Essas joias eram presente ao Estado, não pessoal.', 'Deflagração da operação da PF em 2023.', 'verified', true, '2023-08-10', 'https://g1.globo.com/politica/noticia/2023/08/10/pf-operacao-joias-bolsonaro.ghtml', 'news_article', 5, 'Brasília', 'Operação da PF', 'pf-operacao-joias-bolsonaro-b160-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro é investigada por receber Pix de advogado em esquema de joias.', 'Recebi empréstimo de pessoa idônea. Não tem nada de errado.', 'Investigação da PF em 2023.', 'verified', true, '2023-09-05', 'https://www1.folha.uol.com.br/poder/2023/09/michelle-pix-joias.shtml', 'news_article', 4, 'Brasília', 'Operação da PF', 'michelle-pix-joias-b160-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Alexandre Ramagem é indiciado pela PF por uso ilegal da Abin.', 'Tudo feito dentro da lei. Não houve nenhuma ilegalidade.', 'Indiciamento no caso Abin paralela em 2024.', 'verified', true, '2024-01-25', 'https://g1.globo.com/politica/noticia/2024/01/25/ramagem-indiciado-abin-paralela.ghtml', 'news_article', 5, 'Brasília', 'PF', 'ramagem-abin-paralela-b160-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro é alvo de operação sobre Abin paralela no Rio.', 'Estou tranquilo. Vão encontrar nada porque não fiz nada errado.', 'Busca e apreensão da PF em 2024.', 'verified', true, '2024-01-25', 'https://g1.globo.com/politica/noticia/2024/01/25/carlos-bolsonaro-abin-paralela-rio.ghtml', 'news_article', 5, 'Rio de Janeiro', 'Operação da PF', 'carlos-bolsonaro-abin-paralela-b160-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro tem caso da rachadinha reaberto no MPRJ.', 'Caso antigo, já esclarecido. É perseguição política.', 'Reabertura de investigação em 2023.', 'verified', false, '2023-07-15', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2023/07/15/flavio-rachadinha-reaberta.ghtml', 'news_article', 4, 'Rio de Janeiro', 'MPRJ', 'flavio-rachadinha-reaberta-b160-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles é denunciado pela PF em caso de exportação ilegal de madeira.', 'Tudo legal. Não houve qualquer favorecimento na minha gestão.', 'Denúncia da PF em 2023.', 'verified', false, '2023-10-04', 'https://www1.folha.uol.com.br/ambiente/2023/10/salles-denunciado-madeira-ilegal.shtml', 'news_article', 5, 'Brasília', 'PF', 'salles-madeira-ilegal-denuncia-b160-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é alvo de operação da PF por invasão ao CNJ.', 'Estão me perseguindo. Não tenho nada a ver com isso.', 'Deflagração da operação em 2023.', 'verified', true, '2023-11-08', 'https://g1.globo.com/politica/noticia/2023/11/08/zambelli-operacao-cnj.ghtml', 'news_article', 5, 'São Paulo', 'Operação da PF', 'zambelli-operacao-cnj-b160-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'PF indicia Bolsonaro por fraude em cartões de vacina da Covid-19.', 'Nunca adulterei cartão de vacina. Tudo é invenção.', 'Indiciamento em 2024.', 'verified', true, '2024-03-19', 'https://g1.globo.com/politica/noticia/2024/03/19/pf-indicia-bolsonaro-cartao-vacina.ghtml', 'news_article', 5, 'Brasília', 'PF', 'pf-indicia-bolsonaro-cartao-vacina-b160-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende independência da PF e do MPF.', 'A Polícia Federal e o Ministério Público têm autonomia. Eu respeito isso.', 'Entrevista em 2024.', 'verified', false, '2024-02-10', 'https://www.gov.br/planalto/pt-br/2024/02/lula-pf-mpf-independencia', 'other', 1, 'Brasília', 'Entrevista', 'lula-pf-mpf-independencia-b160-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino assina decreto reforçando estrutura da PF como ministro.', 'A PF precisa de condições para investigar sem interferência.', 'Anúncio como ministro da Justiça em 2023.', 'verified', false, '2023-03-22', 'https://www.gov.br/justica/pt-br/2023/03/dino-decreto-pf', 'other', 1, 'Brasília', 'Ministério da Justiça', 'dino-decreto-pf-b160-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é indiciado pela PF por golpe de Estado.', 'Nunca houve golpe. É tudo narrativa da imprensa.', 'Indiciamento em 2024.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/pf-indicia-bolsonaro-golpe.ghtml', 'news_article', 5, 'Brasília', 'PF', 'pf-indicia-bolsonaro-golpe-b160-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro defende punição aos envolvidos em tentativa de golpe.', 'Quem tentou dar golpe tem que ir para a cadeia. Não há dois pesos.', 'Declaração no Senado em 2024.', 'verified', false, '2024-11-22', 'https://www12.senado.leg.br/noticias/materias/2024/11/22/moro-puniicao-golpe', 'other', 2, 'Brasília', 'Senado Federal', 'moro-punicao-golpe-b160-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Alexandre de Moraes autoriza busca e apreensão em operação sobre Abin paralela.', 'Há indícios robustos do uso do aparato estatal para fins ilegais.', 'Decisão no STF em 2024.', 'verified', true, '2024-01-25', 'https://www.stf.jus.br/noticias/1060-moraes-abin-paralela', 'other', 3, 'Brasília', 'STF', 'moraes-abin-paralela-busca-b160-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira é preso em operação da PF após descumprir medidas.', 'Nunca vou me calar. Perseguem um patriota.', 'Prisão em 2023.', 'verified', true, '2023-02-20', 'https://g1.globo.com/politica/noticia/2023/02/20/daniel-silveira-preso-pf.ghtml', 'news_article', 5, 'Rio de Janeiro', 'PF', 'daniel-silveira-preso-pf-b160-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_elg, 'Eliziane Gama elogia atuação da PF na CPMI do 8 de Janeiro.', 'A PF e o MPF mostraram trabalho técnico impecável. Parabéns.', 'Discurso na CPMI em 2023.', 'verified', false, '2023-10-18', 'https://www12.senado.leg.br/noticias/materias/2023/10/18/eliziane-elogio-pf-cpmi', 'other', 1, 'Brasília', 'CPMI do 8 de Janeiro', 'eliziane-elogio-pf-cpmi-b160-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano ataca PF por "perseguição a Bolsonaro" em operação.', 'A PF está atuando como polícia política. Vergonhoso.', 'Declaração em 2024.', 'verified', false, '2024-02-08', 'https://www.camara.leg.br/noticias/1015-feliciano-pf-perseguicao', 'other', 4, 'Brasília', 'Câmara dos Deputados', 'feliciano-pf-perseguicao-b160-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis tenta bloquear CPI que investiga Abin paralela.', 'Não vamos deixar isso prosperar. É ilegal.', 'Movimento na Câmara em 2024.', 'verified', false, '2024-02-15', 'https://www.camara.leg.br/noticias/1016-kicis-cpi-abin', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'kicis-cpi-abin-bloqueio-b160-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Marcel Van Hattem critica o que chama de "lawfare" contra Bolsonaro.', 'Estão usando o Judiciário para perseguir adversários. É lawfare.', 'Entrevista em 2024.', 'verified', false, '2024-03-05', 'https://www1.folha.uol.com.br/poder/2024/03/vanhattem-lawfare-bolsonaro.shtml', 'other', 3, 'Brasília', 'Entrevista', 'vanhattem-lawfare-bolsonaro-b160-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe elogia PF por desmonte de estrutura golpista.', 'A PF salvou a democracia. Parabéns aos delegados.', 'Entrevista em 2024.', 'verified', false, '2024-11-22', 'https://www12.senado.leg.br/noticias/materias/2024/11/22/randolfe-pf-golpe', 'other', 1, 'Brasília', 'Senado Federal', 'randolfe-pf-golpe-b160-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Rogério Marinho critica operação da PF em propriedade de aliados.', 'Excesso da PF. Estão fazendo caça às bruxas.', 'Declaração no Senado em 2024.', 'verified', false, '2024-05-10', 'https://www12.senado.leg.br/noticias/materias/2024/05/10/marinho-pf-caca-bruxas', 'other', 3, 'Brasília', 'Senado Federal', 'marinho-pf-caca-bruxas-b160-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agu, 'Aguinaldo Ribeiro é mencionado em delação sobre orçamento secreto.', 'Não tenho nada a esclarecer. Atuei sempre dentro da lei.', 'Reportagem em 2024.', 'verified', false, '2024-04-22', 'https://www1.folha.uol.com.br/poder/2024/04/aguinaldo-delacao-orcamento.shtml', 'news_article', 3, 'Brasília', 'Investigação jornalística', 'aguinaldo-delacao-orcamento-b160-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eln, 'Elmar Nascimento é citado em operação do MPF sobre emendas.', 'Tudo transparente. As emendas seguiram o rito.', 'Citação em operação em 2024.', 'verified', false, '2024-06-25', 'https://g1.globo.com/ba/bahia/noticia/2024/06/25/elmar-mpf-emendas.ghtml', 'news_article', 3, 'Brasília', 'MPF', 'elmar-mpf-emendas-b160-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada pelo STF a 5 anos e 3 meses por caso Bolsolão.', 'Vou recorrer. Sou inocente e continuarei lutando.', 'Condenação no STF em 2024.', 'verified', true, '2024-05-14', 'https://g1.globo.com/politica/noticia/2024/05/14/stf-condena-zambelli.ghtml', 'news_article', 5, 'Brasília', 'STF', 'stf-condena-zambelli-b160-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino aciona PF após ataques de Bolsonaro a Moraes.', 'A polícia vai apurar todas as ameaças. Não há impunidade.', 'Anúncio como ministro da Justiça em 2023.', 'verified', false, '2023-07-11', 'https://www.gov.br/justica/pt-br/2023/07/dino-pf-ameacas-moraes', 'other', 2, 'Brasília', 'Ministério da Justiça', 'dino-pf-ameacas-moraes-b160-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão é ouvido por PF sobre episódio das joias sauditas.', 'Prestei meus esclarecimentos. Não há irregularidade da minha parte.', 'Depoimento em 2023.', 'verified', false, '2023-09-20', 'https://www1.folha.uol.com.br/poder/2023/09/mourao-joias-depoimento.shtml', 'news_article', 3, 'Brasília', 'PF', 'mourao-joias-depoimento-b160-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa defende apuração sem política contra Bolsonaro.', 'A Justiça tem que seguir seu curso. Sem coro de vitimismo.', 'Discurso no Senado em 2024.', 'verified', false, '2024-03-25', 'https://www12.senado.leg.br/noticias/materias/2024/03/25/humberto-bolsonaro-apuracao', 'other', 1, 'Brasília', 'Senado Federal', 'humberto-bolsonaro-apuracao-b160-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro é intimado pela PF sobre contatos com Trump.', 'Nada demais. Conversei com lideranças americanas.', 'Intimação em 2024.', 'verified', false, '2024-07-05', 'https://g1.globo.com/politica/noticia/2024/07/05/eduardo-bolsonaro-pf-trump.ghtml', 'news_article', 3, 'Brasília', 'PF', 'eduardo-bolsonaro-pf-trump-b160-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski defende novo pacote anticorrupção como ministro.', 'O Brasil precisa avançar no combate à corrupção. Vamos apresentar projetos.', 'Anúncio como ministro da Justiça em 2024.', 'verified', false, '2024-02-01', 'https://www.gov.br/justica/pt-br/2024/02/lewandowski-pacote-anticorrupcao', 'other', 1, 'Brasília', 'Ministério da Justiça', 'lewandowski-pacote-anticorrupcao-b160-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gme, 'Gilmar Mendes critica tentativas de interferência política na PF.', 'A PF não pode ser instrumento político. Isso seria gravíssimo.', 'Discurso em 2024.', 'verified', false, '2024-04-12', 'https://www.stf.jus.br/noticias/1070-gilmar-pf-interferencia', 'other', 2, 'Brasília', 'STF', 'gilmar-pf-interferencia-b160-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem passaporte apreendido pela PF.', 'Que medo tem de mim? Isso é ridículo.', 'Operação da PF em 2024.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/2024/02/08/bolsonaro-passaporte-apreendido.ghtml', 'news_article', 5, 'Brasília', 'PF', 'bolsonaro-passaporte-apreendido-b160-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro é investigado por esquema de monitoramento ilegal.', 'Não monitorei ninguém. É mais uma invenção.', 'Investigação em 2024.', 'verified', true, '2024-01-25', 'https://g1.globo.com/politica/noticia/2024/01/25/carlos-monitoramento-ilegal.ghtml', 'news_article', 5, 'Rio de Janeiro', 'PF', 'carlos-monitoramento-ilegal-b160-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Jorge Messias defende operações contra desvios de emendas Pix.', 'A AGU atuará em conjunto com PF para combater desvios de emendas.', 'Declaração em 2024.', 'verified', false, '2024-08-20', 'https://www.gov.br/agu/pt-br/2024/08/messias-emendas-pix', 'other', 2, 'Brasília', 'AGU', 'messias-emendas-pix-b160-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara é mencionado em delação sobre venda de emendas.', 'Não recebi nenhum valor. É calúnia pura.', 'Delação em 2024.', 'verified', false, '2024-09-10', 'https://www1.folha.uol.com.br/poder/2024/09/silas-camara-delacao-emendas.shtml', 'news_article', 4, 'Brasília', 'MPF', 'silas-camara-delacao-emendas-b160-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares é alvo de inquérito por interferência no caso Henry.', 'Atuei como ministra. Não há nada de errado.', 'Inquérito em 2023.', 'verified', false, '2023-05-08', 'https://g1.globo.com/politica/noticia/2023/05/08/damares-inquerito-henry.ghtml', 'news_article', 4, 'Brasília', 'PF', 'damares-inquerito-henry-b160-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foge do Brasil e é incluída na difusão vermelha da Interpol.', 'Não fugi. Estou exercendo direito de defesa.', 'Saída do Brasil em 2025.', 'verified', true, '2025-06-04', 'https://g1.globo.com/politica/noticia/2025/06/04/zambelli-interpol-difusao-vermelha.ghtml', 'news_article', 5, 'Roma', 'Interpol', 'zambelli-interpol-difusao-b160-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaq, 'Jaques Wagner aprova ações da PF contra golpistas.', 'O Brasil precisa responsabilizar quem atentou contra a democracia.', 'Discurso no Senado em 2024.', 'verified', false, '2024-11-23', 'https://www12.senado.leg.br/noticias/materias/2024/11/23/wagner-pf-golpistas', 'other', 1, 'Brasília', 'Senado Federal', 'wagner-pf-golpistas-b160-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem articula apoio parlamentar para barrar investigações.', 'Sou parlamentar. Tenho direito à imunidade.', 'Reportagem em 2024.', 'verified', false, '2024-03-15', 'https://www1.folha.uol.com.br/poder/2024/03/ramagem-imunidade-parlamentar.shtml', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'ramagem-imunidade-parlamentar-b160-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson defende ex-militares investigados por golpe.', 'Esses militares defenderam a pátria. São heróis, não criminosos.', 'Discurso em 2024.', 'verified', false, '2024-11-25', 'https://www.camara.leg.br/noticias/1050-sanderson-militares-golpe', 'other', 4, 'Brasília', 'Câmara dos Deputados', 'sanderson-militares-golpe-b160-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann celebra denúncia da PGR contra Bolsonaro.', 'A Justiça funcionou. Ninguém está acima da lei.', 'Entrevista em 2025.', 'verified', false, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/gleisi-denuncia-pgr-bolsonaro.ghtml', 'other', 1, 'Brasília', 'PT', 'gleisi-denuncia-pgr-bolsonaro-b160-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é denunciado pela PGR por tentativa de golpe de Estado.', 'Isso é farsa. Não vou fugir de nada.', 'Denúncia em 2025.', 'verified', true, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/pgr-denuncia-bolsonaro-golpe.ghtml', 'news_article', 5, 'Brasília', 'PGR', 'pgr-denuncia-bolsonaro-golpe-b160-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_frx, 'Marcelo Freixo defende que corrupção deve ser combatida sem viés.', 'Corrupção é corrupção. Não pode ter dois pesos e duas medidas.', 'Entrevista em 2024.', 'verified', false, '2024-06-10', 'https://www1.folha.uol.com.br/poder/2024/06/freixo-corrupcao-sem-vies.shtml', 'other', 1, 'Rio de Janeiro', 'Entrevista', 'freixo-corrupcao-sem-vies-b160-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Filipe Barros organiza ato contra operações da PF em Brasília.', 'Vamos às ruas contra a perseguição política.', 'Convocação em 2024.', 'verified', false, '2024-03-12', 'https://www.camara.leg.br/noticias/1020-barros-ato-pf', 'social_media_post', 4, 'Brasília', 'Câmara dos Deputados', 'barros-ato-contra-pf-b160-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad apoia investigações sobre fraudes no INSS.', 'Vamos cooperar com a PF. Quem fraudou vai ser punido.', 'Declaração em 2025.', 'verified', false, '2025-04-24', 'https://www.gov.br/fazenda/pt-br/2025/04/haddad-inss-fraude', 'other', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-inss-fraude-b160-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_orl, 'Orlando Silva denuncia influência de bets em parlamentares.', 'Parlamentares recebendo recursos de bets é gravíssimo. Precisa apurar.', 'Discurso em 2024.', 'verified', false, '2024-09-15', 'https://www.camara.leg.br/noticias/1045-orlando-bets-parlamentares', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'orlando-bets-parlamentares-b160-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira é condenado a mais 8 anos por descumprir tornozeleira.', 'Sou preso político. Vou recorrer.', 'Condenação em 2024.', 'verified', true, '2024-04-17', 'https://g1.globo.com/politica/noticia/2024/04/17/daniel-silveira-condenado-tornozeleira.ghtml', 'news_article', 5, 'Brasília', 'STF', 'silveira-condenado-tornozeleira-b160-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sal, 'Ricardo Salles é bloqueado pelo STF de atuar como consultor ambiental.', 'Restrição absurda. Posso trabalhar em qualquer área.', 'Decisão do STF em 2024.', 'verified', false, '2024-05-22', 'https://www.stf.jus.br/noticias/1075-salles-bloqueio-consultor', 'news_article', 4, 'Brasília', 'STF', 'salles-bloqueio-consultor-b160-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Pablo Marçal é condenado em primeira instância por pirâmide financeira.', 'Vou recorrer. Sou empresário honesto.', 'Condenação em 2024.', 'verified', true, '2024-09-28', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/09/28/marcal-condenado-piramide.ghtml', 'news_article', 4, 'São Paulo', 'Justiça de SP', 'marcal-condenado-piramide-b160-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta é ouvido pela PF sobre doações a igrejas.', 'As doações são regulares. Tudo declarado.', 'Depoimento em 2024.', 'verified', false, '2024-07-18', 'https://www1.folha.uol.com.br/poder/2024/07/malta-pf-doacoes-igrejas.shtml', 'news_article', 3, 'Vitória', 'PF', 'malta-pf-doacoes-igrejas-b160-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali defende ampliação do combate à corrupção.', 'O combate à corrupção precisa de recursos e de isenção.', 'Discurso na Câmara em 2024.', 'verified', false, '2024-08-22', 'https://www.camara.leg.br/noticias/1042-jandira-combate-corrupcao', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'jandira-combate-corrupcao-b160-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão ataca PF em live após operação contra militares.', 'A PF virou KGB. Vergonhoso o que fazem com patriotas.', 'Live em rede social em 2024.', 'verified', false, '2024-02-09', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/02/09/girao-pf-kgb.htm', 'social_media_post', 5, 'Brasília', 'Live em rede social', 'girao-pf-kgb-b160-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula sanciona lei reforçando Coaf e combate à lavagem de dinheiro.', 'A lei aperta o cerco contra lavagem. Brasil mais transparente.', 'Sanção em 2023.', 'verified', false, '2023-12-21', 'https://www.gov.br/planalto/pt-br/2023/12/lula-lei-coaf', 'other', 1, 'Brasília', 'Palácio do Planalto', 'lula-lei-coaf-b160-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura propõe auditoria independente em emendas Pix.', 'Sem transparência, não tem combate à corrupção. Vamos auditar.', 'Proposta em 2024.', 'verified', false, '2024-09-05', 'https://www.camara.leg.br/noticias/1044-adriana-auditoria-emendas', 'other', 1, 'Brasília', 'Câmara dos Deputados', 'adriana-auditoria-emendas-b160-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri defende mais autonomia para a PF.', 'A PF precisa de proteção contra interferência política.', 'Entrevista em 2024.', 'verified', false, '2024-05-08', 'https://www1.folha.uol.com.br/poder/2024/05/kim-autonomia-pf.shtml', 'other', 1, 'São Paulo', 'Entrevista', 'kim-autonomia-pf-b160-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro ataca Ministério Público como "militante".', 'O MP virou militância política. Isso é inaceitável.', 'Discurso em 2024.', 'verified', false, '2024-03-28', 'https://www12.senado.leg.br/noticias/materias/2024/03/28/flavio-mp-militante', 'other', 4, 'Brasília', 'Senado Federal', 'flavio-mp-militante-b160-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é proibido pelo STF de ter contato com outros investigados.', 'Absurdo. Nem com meus filhos posso falar?', 'Decisão em 2024.', 'verified', true, '2024-06-20', 'https://g1.globo.com/politica/noticia/2024/06/20/bolsonaro-stf-contato-investigados.ghtml', 'news_article', 4, 'Brasília', 'STF', 'bolsonaro-stf-contato-investigados-b160-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Alexandre Padilha apoia operações contra fraude em saúde.', 'Quem desvia do SUS, desvia da vida. Vamos endurecer.', 'Declaração em 2024.', 'verified', false, '2024-10-05', 'https://www.gov.br/saude/pt-br/2024/10/padilha-fraude-saude', 'other', 2, 'Brasília', 'Ministério da Saúde', 'padilha-fraude-saude-b160-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr denuncia esquema de repasses suspeitos no Maranhão.', 'Precisamos rastrear esses recursos. A população está sendo lesada.', 'Denúncia em 2024.', 'verified', false, '2024-07-15', 'https://www.camara.leg.br/noticias/1038-duarte-repasses-maranhao', 'other', 2, 'São Luís', 'Câmara dos Deputados', 'duarte-repasses-maranhao-b160-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pet, 'Talíria Petrone exige apuração de desvios em milícias no Rio.', 'Milícia é Estado paralelo. Precisamos enfrentar o crime organizado.', 'Discurso em 2024.', 'verified', false, '2024-03-10', 'https://www.camara.leg.br/noticias/1018-taliria-milicias-rio', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'taliria-milicias-rio-b160-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão critica atuação da PGR no caso dos militares.', 'A PGR está atropelando devido processo legal.', 'Discurso no Senado em 2024.', 'verified', false, '2024-12-05', 'https://www12.senado.leg.br/noticias/materias/2024/12/05/mourao-pgr-militares', 'other', 3, 'Brasília', 'Senado Federal', 'mourao-pgr-militares-b160-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Júlia Zanatta compara operação da PF a "regime bolivariano".', 'O Brasil virou Venezuela. Isso é ditadura.', 'Publicação em rede social em 2024.', 'verified', false, '2024-02-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/02/10/zanatta-pf-bolivariano.htm', 'social_media_post', 4, 'Florianópolis', 'Rede social', 'zanatta-pf-bolivariano-b160-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina prisão preventiva de coronel envolvido em trama golpista.', 'Há risco à ordem pública. A prisão preventiva é necessária.', 'Decisão em 2024.', 'verified', true, '2024-11-25', 'https://www.stf.jus.br/noticias/1080-moraes-prisao-coronel-golpe', 'other', 3, 'Brasília', 'STF', 'moraes-prisao-coronel-golpe-b160-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_via, 'Carlos Viana ataca "ativismo" do MPF.', 'O MPF foi capturado por agenda de esquerda.', 'Discurso no Senado em 2024.', 'verified', false, '2024-08-05', 'https://www12.senado.leg.br/noticias/materias/2024/08/05/viana-mpf-ativismo', 'other', 3, 'Brasília', 'Senado Federal', 'viana-mpf-ativismo-b160-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Rogério Marinho defende servidores da Caixa investigados por fraude.', 'Servidores não podem ser perseguidos. Vamos defender.', 'Discurso em 2024.', 'verified', false, '2024-06-15', 'https://www12.senado.leg.br/noticias/materias/2024/06/15/marinho-servidores-caixa', 'other', 3, 'Brasília', 'Senado Federal', 'marinho-servidores-caixa-b160-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gui, 'Guiga Peixoto vota contra punição à Zambelli.', 'Não vou ajudar a punir colega. Solidariedade partidária.', 'Voto em conselho de ética em 2024.', 'verified', false, '2024-04-25', 'https://www.camara.leg.br/noticias/1025-guiga-voto-zambelli', 'news_article', 3, 'Brasília', 'Conselho de Ética', 'guiga-voto-zambelli-b160-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hil, 'Erika Hilton pede prisão preventiva de envolvidos em trama golpista.', 'Não há democracia com golpistas soltos. Tem que prender.', 'Discurso em 2024.', 'verified', false, '2024-11-28', 'https://www.camara.leg.br/noticias/1055-hilton-prisao-golpistas', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'hilton-prisao-golpistas-b160-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é réu no STF por trama golpista.', 'Esse julgamento é farsa. Brasil está entregue.', 'Decisão do STF em 2025.', 'verified', true, '2025-03-26', 'https://g1.globo.com/politica/noticia/2025/03/26/bolsonaro-reu-stf-golpe.ghtml', 'news_article', 5, 'Brasília', 'STF', 'bolsonaro-reu-stf-golpe-b160-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bom, 'Sâmia Bomfim denuncia esquemas em emendas parlamentares.', 'Emenda Pix virou esquema de caixa 2. Precisa investigar.', 'Discurso em 2024.', 'verified', false, '2024-10-08', 'https://www.camara.leg.br/noticias/1050-samia-emendas-pix-caixa2', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'samia-emendas-pix-caixa2-b160-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_chi, 'Chico Alencar fala em "Brasil mais transparente" após operações.', 'Que bom que as instituições estão funcionando. Isso é democracia.', 'Entrevista em 2024.', 'verified', false, '2024-02-12', 'https://www.camara.leg.br/noticias/1018-chico-alencar-transparencia', 'other', 1, 'Rio de Janeiro', 'Entrevista', 'chico-alencar-transparencia-b160-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia reforço a Força-Tarefa contra facções.', 'O crime organizado é inimigo do Brasil. Nosso combate será implacável.', 'Anúncio em 2024.', 'verified', false, '2024-08-18', 'https://www.gov.br/justica/pt-br/2024/08/lewandowski-forca-tarefa-faccoes', 'other', 1, 'Brasília', 'Ministério da Justiça', 'lewandowski-forca-tarefa-faccoes-b160-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro pede asilo na embaixada da Hungria em meio à investigação.', 'Fui convidado pelo embaixador. Não tem asilo nenhum.', 'Revelação em 2024.', 'verified', true, '2024-03-25', 'https://g1.globo.com/politica/noticia/2024/03/25/bolsonaro-asilo-hungria.ghtml', 'news_article', 5, 'Brasília', 'Embaixada da Hungria', 'bolsonaro-asilo-hungria-b160-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula no Congresso dos EUA contra operações no Brasil.', 'Vamos pedir sanções contra Moraes. Ele persegue brasileiros.', 'Visita a Washington em 2024.', 'verified', true, '2024-11-05', 'https://www1.folha.uol.com.br/poder/2024/11/eduardo-eua-sancoes-moraes.shtml', 'news_article', 4, 'Washington', 'Congresso dos EUA', 'eduardo-eua-sancoes-moraes-b160-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano propõe anistia ampla para envolvidos em 8 de Janeiro.', 'Essas pessoas são inocentes. Merecem anistia já.', 'Apresentação de PL em 2024.', 'verified', false, '2024-09-18', 'https://www.camara.leg.br/noticias/1047-feliciano-anistia-8j', 'other', 4, 'Brasília', 'Câmara dos Deputados', 'feliciano-anistia-8j-b160-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica anistia e compara a "passar pano para golpistas".', 'Anistia é passar pano. Golpista tem que responder.', 'Declaração em 2024.', 'verified', false, '2024-09-20', 'https://g1.globo.com/politica/noticia/2024/09/20/gleisi-anistia-passar-pano.ghtml', 'other', 2, 'Brasília', 'PT', 'gleisi-anistia-passar-pano-b160-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara bloqueia CPI sobre emendas do Centrão.', 'CPI não é a forma adequada. Vamos barrar.', 'Movimento na Câmara em 2024.', 'verified', false, '2024-10-22', 'https://www.camara.leg.br/noticias/1052-silas-camara-bloqueia-cpi-emendas', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'silas-camara-bloqueia-cpi-emendas-b160-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares é multada pelo TCU por ações da pasta de Direitos Humanos.', 'Vou recorrer. Todas as minhas ações foram legais.', 'Decisão do TCU em 2024.', 'verified', false, '2024-07-25', 'https://www1.folha.uol.com.br/poder/2024/07/damares-multada-tcu.shtml', 'news_article', 4, 'Brasília', 'TCU', 'damares-multada-tcu-b160-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe defende ampla apuração de emendas Pix.', 'Sem transparência, o orçamento vira bagunça. Tem que apurar.', 'Declaração em 2024.', 'verified', false, '2024-10-10', 'https://www12.senado.leg.br/noticias/materias/2024/10/10/randolfe-emendas-pix', 'other', 1, 'Brasília', 'Senado Federal', 'randolfe-emendas-pix-b160-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira grava vídeo em presídio atacando a PF.', 'A PF virou instrumento de tortura. Querem me calar.', 'Vídeo em 2024.', 'verified', false, '2024-05-02', 'https://noticias.uol.com.br/politica/ultimas-noticias/2024/05/02/silveira-video-presidio-pf.htm', 'social_media_post', 4, 'Bangu', 'Presídio', 'silveira-video-presidio-pf-b160-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira publica vídeo atacando PGR.', 'A PGR é braço do PT. Está tudo aparelhado.', 'Publicação em rede social em 2024.', 'verified', true, '2024-12-02', 'https://g1.globo.com/politica/noticia/2024/12/02/nikolas-ataque-pgr.ghtml', 'social_media_post', 4, 'Belo Horizonte', 'Rede social', 'nikolas-ataque-pgr-b160-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kic, 'Bia Kicis tenta blindar Ramagem em conselho de ética.', 'Não temos nada a apurar. Ramagem é íntegro.', 'Votação em 2024.', 'verified', false, '2024-04-20', 'https://www.camara.leg.br/noticias/1024-kicis-ramagem-conselho-etica', 'news_article', 4, 'Brasília', 'Conselho de Ética', 'kicis-ramagem-conselho-etica-b160-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mes, 'Messias defende aplicação integral da Lei Anticorrupção.', 'Empresas que corrompem têm que pagar caro. A lei é dura e vai ser aplicada.', 'Entrevista em 2024.', 'verified', false, '2024-06-05', 'https://www.gov.br/agu/pt-br/2024/06/messias-lei-anticorrupcao', 'other', 1, 'Brasília', 'AGU', 'messias-lei-anticorrupcao-b160-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pmc, 'Marçal tem bens bloqueados pela Justiça em ação civil pública.', 'É perseguição empresarial. Vou mostrar minha inocência.', 'Decisão em 2024.', 'verified', false, '2024-10-15', 'https://g1.globo.com/sp/sao-paulo/noticia/2024/10/15/marcal-bens-bloqueados.ghtml', 'news_article', 4, 'São Paulo', 'Justiça de SP', 'marcal-bens-bloqueados-b160-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'PF indicia Bolsonaro por assédio sexual a ajudante.', 'Mentira. Nunca tive esse comportamento. Imprensa golpista.', 'Indiciamento em 2025.', 'verified', true, '2025-03-10', 'https://g1.globo.com/politica/noticia/2025/03/10/pf-indicia-bolsonaro-assedio.ghtml', 'news_article', 5, 'Brasília', 'PF', 'pf-indicia-bolsonaro-assedio-b160-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara indica parente para cargo em estatal.', 'É pessoa qualificada. Não tem nada de nepotismo.', 'Reportagem em 2025.', 'verified', false, '2025-04-10', 'https://noticias.uol.com.br/politica/ultimas-noticias/2025/04/10/silas-camara-parente-estatal.htm', 'news_article', 4, 'Brasília', 'Câmara dos Deputados', 'silas-camara-parente-estatal-b160-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano é alvo de inquérito por uso indevido de verba de gabinete.', 'Tudo usado para o mandato. Não há nada demais.', 'Inquérito em 2024.', 'verified', false, '2024-08-10', 'https://www1.folha.uol.com.br/poder/2024/08/feliciano-verba-gabinete.shtml', 'news_article', 4, 'Brasília', 'PF', 'feliciano-verba-gabinete-b160-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada em novo processo sobre falsidade ideológica.', 'Tudo fabricação. Sou vítima de perseguição global.', 'Condenação em 2025.', 'verified', true, '2025-07-08', 'https://g1.globo.com/politica/noticia/2025/07/08/zambelli-falsidade-condenacao.ghtml', 'news_article', 4, 'Brasília', 'STF', 'zambelli-falsidade-condenacao-b160-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é condenado pelo STF a 27 anos por golpe de Estado.', 'Sou preso político. O mundo está vendo.', 'Condenação em 2025.', 'verified', true, '2025-11-28', 'https://g1.globo.com/politica/noticia/2025/11/28/stf-condena-bolsonaro-golpe.ghtml', 'news_article', 5, 'Brasília', 'STF', 'stf-condena-bolsonaro-golpe-b160-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comenta condenação de Bolsonaro: "Justiça funciona".', 'Todos são iguais perante a lei. Quem comete crime responde.', 'Declaração em 2025.', 'verified', true, '2025-11-29', 'https://www.gov.br/planalto/pt-br/2025/11/lula-condenacao-bolsonaro', 'other', 2, 'Brasília', 'Palácio do Planalto', 'lula-condenacao-bolsonaro-b160-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem foge do Brasil antes de execução de pena.', 'Estou exercendo direito de defesa.', 'Saída do Brasil em 2025.', 'verified', true, '2025-09-10', 'https://g1.globo.com/politica/noticia/2025/09/10/ramagem-foge-brasil.ghtml', 'news_article', 5, 'Miami', 'Foragido', 'ramagem-foge-brasil-b160-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_van, 'Van Hattem defende imunidade parlamentar de Ramagem.', 'A imunidade tem que ser respeitada. É direito constitucional.', 'Discurso em 2025.', 'verified', false, '2025-09-12', 'https://www.camara.leg.br/noticias/1080-vanhattem-imunidade-ramagem', 'other', 3, 'Brasília', 'Câmara dos Deputados', 'vanhattem-imunidade-ramagem-b160-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro critica "anistia" para aliados de Bolsonaro.', 'Não dá para anistiar. A Justiça tem que prevalecer.', 'Entrevista em 2025.', 'verified', false, '2025-05-22', 'https://www12.senado.leg.br/noticias/materias/2025/05/22/moro-anistia-aliados', 'other', 2, 'Brasília', 'Senado Federal', 'moro-anistia-aliados-b160-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gme, 'Gilmar Mendes vota a favor da condenação de Bolsonaro.', 'As provas são robustas. A condenação é necessária.', 'Voto no STF em 2025.', 'verified', true, '2025-11-28', 'https://www.stf.jus.br/noticias/1090-gilmar-voto-bolsonaro', 'other', 3, 'Brasília', 'STF', 'gilmar-voto-bolsonaro-b160-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad celebra operação contra sonegadores gigantes.', 'Quem sonega, rouba da saúde e da educação. Vamos atrás.', 'Operação em 2025.', 'verified', false, '2025-03-20', 'https://www.gov.br/fazenda/pt-br/2025/03/haddad-operacao-sonegadores', 'other', 2, 'Brasília', 'Ministério da Fazenda', 'haddad-operacao-sonegadores-b160-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro é citado em delação de ex-assessor.', 'Delação de traidor. Não tem valor.', 'Delação em 2025.', 'verified', false, '2025-06-15', 'https://www1.folha.uol.com.br/poder/2025/06/carlos-bolsonaro-delacao.shtml', 'news_article', 4, 'Rio de Janeiro', 'MPF', 'carlos-bolsonaro-delacao-b160-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro é condenado por peculato no caso rachadinhas.', 'Vou recorrer. Sou inocente.', 'Condenação em 2025.', 'verified', true, '2025-08-22', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2025/08/22/flavio-bolsonaro-condenado-rachadinha.ghtml', 'news_article', 5, 'Rio de Janeiro', 'Justiça do RJ', 'flavio-bolsonaro-condenado-rachadinha-b160-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta é citado em nova operação sobre ONG evangélica.', 'Continuamos sendo perseguidos por sermos cristãos.', 'Operação em 2025.', 'verified', false, '2025-07-05', 'https://g1.globo.com/es/espirito-santo/noticia/2025/07/05/magno-malta-ong-operacao.ghtml', 'news_article', 4, 'Vitória', 'PF', 'magno-malta-ong-operacao-b160-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino, como ministro do STF, vota por manter denúncia contra Bolsonaro.', 'As provas são suficientes. A denúncia deve ser recebida.', 'Voto no STF em 2025.', 'verified', false, '2025-03-26', 'https://www.stf.jus.br/noticias/1085-dino-voto-bolsonaro', 'other', 3, 'Brasília', 'STF', 'dino-voto-denuncia-bolsonaro-b160-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Jandira Feghali celebra condenação por golpe.', 'A democracia venceu. Lula, STF e PF salvaram o Brasil.', 'Declaração em 2025.', 'verified', false, '2025-11-29', 'https://www.camara.leg.br/noticias/1090-jandira-condenacao-golpe', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'jandira-condenacao-golpe-b160-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura pede investigação de fraudes eleitorais no TSE.', 'Não sou bolsonarista, mas precisamos investigar tudo. Sempre.', 'Discurso em 2025.', 'verified', false, '2025-04-02', 'https://www.camara.leg.br/noticias/1075-adriana-fraudes-eleitorais', 'other', 2, 'Brasília', 'Câmara dos Deputados', 'adriana-fraudes-eleitorais-b160-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina início da execução da pena de Bolsonaro.', 'A decisão transitou em julgado. Não há recurso com efeito suspensivo.', 'Decisão em 2026.', 'verified', true, '2026-02-15', 'https://www.stf.jus.br/noticias/1095-moraes-execucao-bolsonaro', 'other', 4, 'Brasília', 'STF', 'moraes-execucao-bolsonaro-b160-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia balanço: operações da PF quebraram recorde em 2025.', 'O Brasil fez história no combate à corrupção. Vamos continuar.', 'Balanço anual em 2026.', 'verified', true, '2026-01-15', 'https://www.gov.br/justica/pt-br/2026/01/lewandowski-balanco-pf-2025', 'other', 2, 'Brasília', 'Ministério da Justiça', 'lewandowski-balanco-pf-2025-b160-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

END $$;
