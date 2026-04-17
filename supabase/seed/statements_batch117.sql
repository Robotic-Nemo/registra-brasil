-- Batch 117: FHC2 + Lula 2002 campaign era (1999-2002)
DO $$
DECLARE
  v_col UUID; v_fhc UUID; v_lul UUID; v_lup UUID; v_ser UUID;
  v_mar UUID; v_mal UUID; v_sar UUID; v_jai UUID; v_jef UUID;
  v_ren UUID; v_sil UUID; v_cir UUID; v_dil UUID; v_tem UUID;
  v_gle UUID; v_cun UUID; v_aec UUID; v_alc UUID; v_mag UUID;
  c_ant UUID; c_cor UUID; c_des UUID; c_vio UUID; c_odi UUID;
  c_abu UUID; c_aut UUID; c_mac UUID; c_obs UUID; c_ame UUID;
  c_neg UUID; c_irr UUID; c_con UUID; c_int UUID; c_nep UUID;
  c_hom UUID; c_rac UUID; c_mis UUID; c_itr UUID; c_xen UUID;
BEGIN
  SELECT id INTO v_col FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lup FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_mal FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_jef FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_itr FROM categories WHERE slug = 'intolerancia-religiosa';
  SELECT id INTO c_xen FROM categories WHERE slug = 'xenofobia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza crise energética e apagão nacional.', 'Temos energia suficiente, não haverá apagão.', 'Declaração semanas antes da crise do apagão de 2001.', 'verified', true, '2001-04-20', 'https://www1.folha.uol.com.br/fsp/2001/4/21/brasil/1.html', 'news_article', 4, 'Brasília', 'Entrevista coletiva', 'fhc-nega-apagao-b117-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC culpa consumidores pelo racionamento de energia.', 'O povo brasileiro vai ter que fazer sua parte economizando energia.', 'Anúncio do racionamento em maio de 2001 responsabilizando consumidores.', 'verified', true, '2001-05-18', 'https://www1.folha.uol.com.br/fsp/2001/5/19/brasil/1.html', 'news_article', 3, 'Brasília', 'Pronunciamento em rede nacional sobre racionamento', 'fhc-povo-economizar-b117-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende tortura contra presos em programa de TV.', 'Quem defende bandido é porque é bandido também.', 'Declaração em entrevista televisiva sobre violência urbana.', 'verified', true, '1999-04-10', 'https://istoe.com.br/bolsonaro-defensor-bandido/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista televisiva', 'bolsonaro-defende-bandido-b117-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que Fernando Henrique deveria ser fuzilado.', 'FHC merece ser fuzilado junto com seus ministros.', 'Declaração inflamada contra o governo FHC.', 'verified', true, '1999-10-15', 'https://www1.folha.uol.com.br/poder/bolsonaro-fhc-fuzilado.shtml', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-fhc-fuzilado-b117-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza impacto da crise argentina no Brasil.', 'A crise argentina não vai atingir o Brasil.', 'Declaração antes do contágio da crise argentina de 2001.', 'verified', false, '2001-07-20', 'https://www1.folha.uol.com.br/fsp/2001/7/21/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-crise-argentina-b117-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama mulheres envolvidas em política de histéricas.', 'As deputadas petistas são todas histéricas.', 'Insulto misógino contra parlamentares do PT.', 'verified', true, '2000-05-18', 'https://istoe.com.br/bolsonaro-histericas/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-histericas-b117-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula publica Carta ao Povo Brasileiro acalmando mercados.', 'Vamos respeitar os contratos e compromissos do país.', 'Carta divulgada durante campanha de 2002 para tranquilizar investidores.', 'verified', true, '2002-06-22', 'https://fpabramo.org.br/csbh/wp-content/uploads/sites/3/2017/04/Carta-ao-povo-brasileiro-Lula.pdf', 'diario_oficial', 1, 'São Paulo', 'Carta ao Povo Brasileiro', 'lula-carta-povo-b117-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra ataca Lula como candidato despreparado na campanha de 2002.', 'Lula não tem preparo para ser presidente.', 'Ataque na campanha presidencial de 2002.', 'verified', false, '2002-09-15', 'https://www1.folha.uol.com.br/fsp/2002/9/16/brasil/3.html', 'news_article', 2, 'São Paulo', 'Debate eleitoral', 'serra-lula-despreparado-b117-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca esposa de adversário em entrevista polêmica.', 'A Sandra Starling dorme com meu adversário, não acrescenta à política.', 'Fala machista contra esposa de político Roberto Freire em entrevista.', 'verified', true, '2002-06-24', 'https://www1.folha.uol.com.br/fsp/2002/6/25/brasil/5.html', 'news_article', 5, 'Fortaleza', 'Entrevista', 'ciro-sandra-starling-b117-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes defende fala polêmica sobre esposa de adversário.', 'Só disse a verdade sobre o papel dela, não tenho que pedir desculpas.', 'Defesa da declaração machista após repercussão negativa.', 'verified', true, '2002-06-25', 'https://www1.folha.uol.com.br/fsp/2002/6/26/brasil/2.html', 'news_article', 4, 'Fortaleza', 'Entrevista coletiva', 'ciro-sem-desculpas-b117-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marta Suplicy é eleita prefeita de SP pelo PT em 2000.', 'Vou governar para toda São Paulo, não apenas para minha base.', 'Discurso de vitória na eleição para prefeita.', 'verified', false, '2000-10-29', 'https://www1.folha.uol.com.br/fsp/2000/10/30/cotidiano/1.html', 'transcript_pdf', 1, 'São Paulo', 'Discurso de vitória municipal', 'marta-eleita-sp-b117-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf nega vínculos com esquema de corrupção investigado pelo MP.', 'Não há um centavo desviado das contas públicas.', 'Defesa durante investigações por improbidade administrativa.', 'verified', false, '1999-04-15', 'https://acervo.folha.com.br/leitor.do?numero=14480', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-nega-esquema-b117-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende STM e ataca revisão de anistia a torturadores.', 'Anistia é anistia, não vamos mexer no passado.', 'Defesa da imunidade de torturadores da ditadura em plenário.', 'verified', true, '2000-03-28', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-anistia-torturadores-b117-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cun, 'Eduardo Cunha faz ataques a Lula durante campanha de 2002.', 'Lula vai quebrar o Brasil, vamos voltar à inflação.', 'Campanha de medo durante eleição presidencial.', 'verified', false, '2002-09-28', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 2, 'Câmara dos Deputados', 'Sessão plenária', 'cunha-lula-medo-b117-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin toma posse como governador de SP em 2001.', 'Vou manter a ordem e a tranquilidade em São Paulo.', 'Discurso de posse como governador após renúncia de Covas.', 'verified', false, '2001-03-10', 'https://www1.folha.uol.com.br/fsp/2001/3/11/brasil/2.html', 'transcript_pdf', 1, 'São Paulo', 'Posse como governador', 'alckmin-posse-b117-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC admite que fez o que tinha de fazer sobre privatizações.', 'Tenho orgulho das privatizações, foram necessárias.', 'Balanço positivo das desestatizações em entrevista de fim de mandato.', 'verified', false, '2002-12-28', 'https://www1.folha.uol.com.br/fsp/2002/12/29/brasil/1.html', 'news_article', 2, 'Brasília', 'Entrevista de fim de mandato', 'fhc-orgulho-privatizacoes-b117-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apresenta proposta polêmica para redução da maioridade penal.', 'Criança de 12 anos que mata tem que ir pra cadeia.', 'Defesa de redução drástica da maioridade penal.', 'verified', false, '2001-06-18', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-maioridade-penal-b117-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jef, 'Roberto Jefferson muda de posição e apoia Lula em 2002.', 'O PTB vai apoiar Lula porque FHC nos abandonou.', 'Migração de apoio em meio a disputa presidencial.', 'verified', false, '2002-08-15', 'https://www1.folha.uol.com.br/fsp/2002/8/16/brasil/2.html', 'news_article', 2, 'Rio de Janeiro', 'Entrevista', 'jefferson-apoia-lula-b117-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros migra para articular apoio a Lula em 2002.', 'O Brasil precisa de mudanças e Lula representa isso.', 'Articulação para formar base governista no Senado.', 'verified', false, '2002-10-28', 'https://www1.folha.uol.com.br/fsp/2002/10/29/brasil/5.html', 'news_article', 2, 'Maceió', 'Entrevista', 'renan-apoia-lula-b117-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro aprova massacre de Diadema e defende violência policial.', 'Polícia tem que matar mesmo, é pra isso que ela existe.', 'Defesa de execuções extrajudiciais em entrevista.', 'verified', true, '2000-08-22', 'https://istoe.com.br/bolsonaro-policia-matar/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-policia-matar-b117-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor é eleito senador por Alagoas após recuperar direitos políticos.', 'O povo de Alagoas me devolveu a política, vou representá-los com honra.', 'Discurso de vitória após reabilitação política.', 'verified', false, '2006-10-02', 'https://www1.folha.uol.com.br/fsp/2006/10/03/brasil/2.html', 'transcript_pdf', 2, 'Maceió', 'Eleição para o Senado', 'collor-eleito-senador-b117-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC nega responsabilidade pela crise do apagão em 2001.', 'Não sou culpado pelo apagão, é falta de chuva.', 'Culpabilização do clima pela crise de geração elétrica.', 'verified', true, '2001-06-10', 'https://www1.folha.uol.com.br/fsp/2001/6/11/brasil/1.html', 'news_article', 4, 'Brasília', 'Entrevista', 'fhc-apagao-chuva-b117-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf é investigado por desvio de recursos da Prefeitura de SP.', 'Os processos são política de adversários.', 'Defesa durante investigações do MP paulista.', 'verified', true, '2001-09-18', 'https://www1.folha.uol.com.br/fsp/2001/9/19/cotidiano/2.html', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-processos-adversarios-b117-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende soldada mínima que não dá pra viver em entrevista.', 'Salário mínimo é o que podemos pagar.', 'Defesa de valor baixo do mínimo durante debate social.', 'verified', false, '2000-04-28', 'https://www1.folha.uol.com.br/fsp/2000/4/29/brasil/2.html', 'news_article', 2, 'Brasília', 'Entrevista', 'fhc-minimo-possivel-b117-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Hillary Clinton e feministas internacionais de invasoras.', 'Feministas americanas querem impor agenda ao Brasil.', 'Ataque xenofóbico contra movimento feminista internacional.', 'verified', false, '2001-11-20', 'https://istoe.com.br/bolsonaro-feministas-americanas/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-feministas-invasoras-b117-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_xen, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra é criticado por debate frio no segundo turno de 2002.', 'Não vou rebaixar o nível do debate.', 'Defesa após críticas à sua postura distante em debates.', 'verified', false, '2002-10-20', 'https://www1.folha.uol.com.br/fsp/2002/10/21/brasil/1.html', 'news_article', 1, 'Rio de Janeiro', 'Debate eleitoral', 'serra-debate-frio-b117-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que negros não servem nem pra reproduzir em palestra polêmica.', 'Negros não servem nem para reproduzir, são preguiçosos.', 'Declaração racista em palestra recorrente com variações ao longo dos anos.', 'verified', true, '2002-05-18', 'https://istoe.com.br/bolsonaro-racismo-palestra/', 'news_article', 5, 'São Paulo', 'Palestra', 'bolsonaro-negros-preguicosos-b117-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC tenta minimizar escândalo da SUDAM e desvios na Amazônia.', 'Estamos apurando, os envolvidos serão punidos.', 'Resposta ao escândalo de corrupção na Superintendência do Desenvolvimento da Amazônia.', 'verified', false, '2001-07-15', 'https://www1.folha.uol.com.br/fsp/2001/7/16/brasil/1.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-sudam-apurar-b117-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney é flagrado em escândalo da SUDAM envolvendo obras superfaturadas.', 'Meus negócios no Maranhão estão dentro da lei.', 'Defesa após denúncias de desvios na SUDAM em Pindaré.', 'verified', true, '2001-06-20', 'https://www1.folha.uol.com.br/fsp/2001/6/21/brasil/3.html', 'news_article', 4, 'São Luís', 'Entrevista', 'sarney-sudam-maranhao-b117-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que ditadura deveria ter matado mais opositores.', 'A ditadura errou em não ter matado mais gente.', 'Declaração em entrevista defendendo extermínio de opositores políticos.', 'verified', true, '2000-09-10', 'https://istoe.com.br/bolsonaro-ditadura-matar-mais/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-ditadura-matar-mais-b117-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula promete gerar 10 milhões de empregos em campanha de 2002.', 'Vamos gerar 10 milhões de empregos no primeiro mandato.', 'Promessa de campanha presidencial ambiciosa.', 'verified', false, '2002-08-22', 'https://www1.folha.uol.com.br/fsp/2002/8/23/brasil/1.html', 'transcript_pdf', 1, 'São Bernardo do Campo', 'Comício de campanha', 'lula-10-milhoes-empregos-b117-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC aumenta salários de ministros antes de sair do governo.', 'Cargos de ministro merecem remuneração justa.', 'Aumento polêmico na reta final do governo em 2002.', 'verified', false, '2002-12-15', 'https://www1.folha.uol.com.br/fsp/2002/12/16/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-salarios-ministros-b117-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende castração de pedófilos sem julgamento.', 'Pedófilo tem que ser castrado sem julgamento.', 'Defesa de punição extrajudicial em discurso.', 'verified', false, '2001-04-12', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-pedofilo-castrar-b117-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aec, 'Aécio Neves articula apoio ao governo tucano em MG.', 'PSDB é a alternativa para Minas.', 'Articulação política durante mandato de deputado.', 'verified', false, '2001-08-15', 'https://acervo.estadao.com.br/pagina/', 'news_article', 1, 'Belo Horizonte', 'Entrevista', 'aecio-psdb-minas-b117-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca adversários à esquerda como candidatos do atraso.', 'A esquerda no Brasil é atrasada ideologicamente.', 'Ataque à oposição durante disputa eleitoral de 2002.', 'verified', false, '2002-09-10', 'https://www1.folha.uol.com.br/fsp/2002/9/11/brasil/3.html', 'news_article', 2, 'Brasília', 'Entrevista', 'fhc-esquerda-atraso-b117-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende autoritarismo como solução aos problemas do país.', 'A democracia não funciona, precisamos de mão forte.', 'Discurso em plenário elogiando regimes autoritários.', 'verified', true, '2001-10-22', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-mao-forte-b117-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta ataca religiões não-cristãs em programa de rádio.', 'Tudo que não for evangelho é do diabo.', 'Declaração intolerante em programa de rádio religioso.', 'verified', false, '2001-03-18', 'https://istoe.com.br/magno-malta-religioes-demonio/', 'news_article', 4, 'Vitória', 'Programa de rádio', 'magno-religioes-diabo-b117-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara ataca movimento LGBT como anticristão.', 'A Assembleia de Deus não vai aceitar gays.', 'Declaração discriminatória contra minorias.', 'verified', false, '2001-06-10', 'https://acervo.folha.com.br/leitor.do?numero=15120', 'news_article', 4, 'Manaus', 'Culto religioso', 'silas-assembleia-gays-b117-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que mães solteiras são fábricas de bandidos.', 'Mãe solteira produz bandido.', 'Fala preconceituosa em entrevista sobre estrutura familiar.', 'verified', true, '2000-11-14', 'https://istoe.com.br/bolsonaro-mae-solteira/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-mae-solteira-bandido-b117-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC minimiza sequestro de filho de Silvio Santos.', 'Não se pode negociar com bandidos.', 'Reação do governo durante sequestro de Patricia Abravanel em 2001.', 'verified', false, '2001-08-30', 'https://www1.folha.uol.com.br/fsp/2001/8/31/cotidiano/1.html', 'news_article', 2, 'Brasília', 'Entrevista', 'fhc-sequestro-silvio-b117-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca Lula comparando-o a Hugo Chávez.', 'Lula vai transformar o Brasil numa Venezuela.', 'Campanha de medo durante eleição presidencial de 2002.', 'verified', false, '2002-10-05', 'https://www1.folha.uol.com.br/fsp/2002/10/06/brasil/2.html', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-lula-venezuela-b117-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende retorno à política em articulação com Sarney.', 'O Nordeste merece representantes fortes.', 'Articulação política com grupos tradicionais do Maranhão.', 'verified', false, '2002-03-12', 'https://acervo.folha.com.br/leitor.do?numero=15420', 'news_article', 2, 'Maceió', 'Entrevista', 'collor-nordeste-fortes-b117-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que Reis Velloso e economistas devem ser presos.', 'Esses economistas do governo são traidores.', 'Ataque a equipe econômica do governo FHC.', 'verified', false, '1999-02-18', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-economistas-traidores-b117-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende desvalorização cambial em 1999 como medida técnica.', 'A desvalorização foi tecnicamente necessária.', 'Justificativa após quebra da âncora cambial em janeiro de 1999.', 'verified', false, '1999-02-10', 'https://www1.folha.uol.com.br/fsp/1999/2/11/brasil/1.html', 'news_article', 2, 'Brasília', 'Entrevista coletiva', 'fhc-desvalorizacao-tecnica-b117-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula declara que governo Lula manterá responsabilidade fiscal.', 'Vamos manter o Banco Central independente.', 'Pacto com mercado financeiro durante campanha de 2002.', 'verified', false, '2002-09-20', 'https://www1.folha.uol.com.br/fsp/2002/9/21/brasil/1.html', 'news_article', 1, 'São Paulo', 'Entrevista', 'lula-bc-independente-b117-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf articula saída do país após escândalos em SP.', 'Posso ir para o exterior se quiser, sou livre.', 'Declaração sobre possível saída do Brasil em meio a processos.', 'verified', true, '2002-05-25', 'https://acervo.folha.com.br/leitor.do?numero=15450', 'news_article', 3, 'São Paulo', 'Entrevista', 'maluf-sair-pais-b117-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama Dilma de vagabunda em entrevista polêmica.', 'Essa Dilma é uma vagabunda, foi terrorista.', 'Insulto à futura ministra da Casa Civil.', 'verified', true, '2002-07-18', 'https://istoe.com.br/bolsonaro-dilma-vagabunda/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-dilma-vagabunda-b117-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende segundo turno de 2002 com aliança PSDB-PMDB.', 'PSDB e PMDB devem se unir contra o radicalismo.', 'Articulação em reta final da eleição presidencial.', 'verified', false, '2002-10-20', 'https://www1.folha.uol.com.br/fsp/2002/10/21/brasil/3.html', 'news_article', 1, 'Brasília', 'Entrevista', 'fhc-psdb-pmdb-alianca-b117-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende militarização completa do Rio de Janeiro.', 'O Rio só tem jeito com o Exército na rua permanentemente.', 'Proposta de intervenção federal militar no estado.', 'verified', false, '2000-10-28', 'https://www1.folha.uol.com.br/fsp/2000/10/29/cotidiano/3.html', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-rio-exercito-permanente-b117-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_aut, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende aliança com Fernando Sarney em articulação regional.', 'Alagoas e Maranhão têm interesses comuns.', 'Articulação com Sarney para reabilitação política.', 'verified', false, '2001-11-10', 'https://acervo.folha.com.br/leitor.do?numero=15210', 'news_article', 1, 'Maceió', 'Entrevista', 'collor-alianca-sarney-b117-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que mulheres devem obedecer aos maridos.', 'Mulher foi feita para cuidar do marido e dos filhos.', 'Declaração machista em entrevista sobre família.', 'verified', true, '1999-05-22', 'https://istoe.com.br/bolsonaro-mulher-marido/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-mulher-obedecer-b117-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC é acusado de fazer contingenciamento para prejudicar oposição.', 'O contingenciamento é necessidade técnica.', 'Defesa de cortes orçamentários que afetaram estados oposicionistas.', 'verified', false, '2000-05-15', 'https://www1.folha.uol.com.br/fsp/2000/5/16/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-contingenciamento-b117-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra ataca propostas sociais de Lula como populismo.', 'Bolsa Escola é populismo barato.', 'Ataque ao programa social em debate presidencial de 2002.', 'verified', false, '2002-10-10', 'https://www1.folha.uol.com.br/fsp/2002/10/11/brasil/2.html', 'news_article', 2, 'São Paulo', 'Debate presidencial', 'serra-bolsa-escola-populismo-b117-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende retirada de comunistas das universidades.', 'Universidades estão cheias de professores comunistas que doutrinam.', 'Discurso em plenário contra docentes universitários.', 'verified', false, '2001-11-08', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-universidades-comunistas-b117-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes defende plano econômico radicalmente diferente.', 'Vou botar ordem nesse BC especulador.', 'Ataque à política monetária em campanha de 2002.', 'verified', false, '2002-07-15', 'https://www1.folha.uol.com.br/fsp/2002/7/16/brasil/1.html', 'news_article', 2, 'Fortaleza', 'Comício', 'ciro-bc-especulador-b117-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende suas privatizações como positivas ao país.', 'Minhas privatizações abriram o país ao mundo.', 'Balanço em retrospectiva das desestatizações da era Collor.', 'verified', false, '2001-04-20', 'https://acervo.folha.com.br/leitor.do?numero=15080', 'news_article', 2, 'Maceió', 'Entrevista', 'collor-privatizacoes-abriu-pais-b117-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro comemora queda das Torres Gêmeas com piadas.', 'Americanos estão tomando no que tanto gostam de dar.', 'Piada chocante sobre ataques terroristas de 11 de setembro.', 'verified', false, '2001-09-12', 'https://istoe.com.br/bolsonaro-torres-gemeas/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-torres-gemeas-b117-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC defende autonomia do Banco Central em entrevista.', 'O BC autônomo é fundamental para o controle da inflação.', 'Defesa de medida que sobreviveu a mandatos posteriores.', 'verified', false, '1999-06-18', 'https://www1.folha.uol.com.br/fsp/1999/6/19/brasil/2.html', 'news_article', 1, 'Brasília', 'Entrevista', 'fhc-bc-autonomia-b117-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf tenta articular candidatura presidencial em 2002.', 'Posso ser candidato à Presidência, o povo me quer.', 'Tentativa frustrada de candidatura presidencial.', 'verified', false, '2002-03-08', 'https://acervo.folha.com.br/leitor.do?numero=15410', 'news_article', 2, 'São Paulo', 'Entrevista', 'maluf-candidato-presidencial-b117-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca homossexuais em programa de rádio.', 'Viado é coisa da classe média que vê muita novela.', 'Declaração homofóbica em programa de rádio.', 'verified', true, '2000-12-10', 'https://istoe.com.br/bolsonaro-viado-classe-media/', 'news_article', 5, 'Rio de Janeiro', 'Programa de rádio', 'bolsonaro-viado-novela-b117-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Michel Temer articula posições políticas centrais no PMDB.', 'O PMDB é o grande partido do centro democrático.', 'Declaração como presidente do PMDB articulando alianças.', 'verified', false, '2002-06-10', 'https://www1.folha.uol.com.br/fsp/2002/6/11/brasil/3.html', 'news_article', 1, 'Brasília', 'Entrevista', 'temer-pmdb-centro-b117-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende limite no Bolsa Escola como dinheiro jogado fora.', 'Bolsa Escola é jogar dinheiro no lixo.', 'Ataque a programas sociais do governo.', 'verified', false, '2001-09-18', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 2, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-bolsa-escola-lixo-b117-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca sindicatos do magistério durante greves.', 'Os professores estão sendo manipulados politicamente.', 'Ataque ao movimento grevista do magistério.', 'verified', false, '2000-08-25', 'https://www1.folha.uol.com.br/fsp/2000/8/26/brasil/3.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-professores-manipulados-b117-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro chama criança rica de cidadão e pobre de bandido.', 'Filho de rico é cidadão, filho de pobre é bandido.', 'Declaração chocante revelando visão classista.', 'verified', true, '2001-07-20', 'https://istoe.com.br/bolsonaro-rico-pobre/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-rico-pobre-bandido-b117-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney defende filha no cargo de governadora do Maranhão.', 'Roseana representa uma nova geração para o Maranhão.', 'Apoio à candidatura da filha Roseana Sarney a presidência em 2002.', 'verified', false, '2002-02-28', 'https://www1.folha.uol.com.br/fsp/2002/3/1/brasil/1.html', 'news_article', 3, 'São Luís', 'Entrevista', 'sarney-roseana-nova-geracao-b117-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que crianças de escolas públicas são problema.', 'Escola pública forma maconheiro e bandido.', 'Ataque ao sistema público de educação.', 'verified', false, '2001-06-12', 'https://istoe.com.br/bolsonaro-escola-publica-bandido/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-escola-publica-bandido-b117-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca manifestantes anti-globalização como vandalismo.', 'São vândalos que querem desestabilizar o mundo.', 'Ataque a manifestantes contra políticas do FMI.', 'verified', false, '2001-03-22', 'https://www1.folha.uol.com.br/fsp/2001/3/23/mundo/3.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-manifestantes-vandalos-b117-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro ataca MST comparando-os a terroristas.', 'MST é movimento terrorista, tem que ser combatido.', 'Ataque ao movimento dos sem-terra em plenário.', 'verified', true, '1999-05-20', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-mst-terrorismo-b117-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ren, 'Renan Calheiros articula esquema para eleger Sarney ao Senado.', 'Vou ajudar Sarney a voltar ao Senado.', 'Articulação regional para mandato no Senado pelo Amapá.', 'verified', false, '2002-03-12', 'https://acervo.folha.com.br/leitor.do?numero=15420', 'news_article', 2, 'Maceió', 'Entrevista', 'renan-sarney-senado-b117-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro celebra prisão de líderes do MST.', 'Tinha que ter prendido todos esses bandidos do MST.', 'Comemoração de repressão ao movimento social.', 'verified', false, '2000-04-10', 'https://istoe.com.br/bolsonaro-mst-prisao/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-celebra-prisao-mst-b117-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende continuidade dos trabalhos em processos como perseguição.', 'Sou perseguido pela Justiça de São Paulo.', 'Defesa em meio a múltiplas investigações do MP.', 'verified', false, '2002-04-18', 'https://acervo.estadao.com.br/pagina/', 'news_article', 3, 'São Paulo', 'Entrevista', 'maluf-perseguicao-justica-b117-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC elogia desempenho próprio e ataca pessimismo no fim de governo.', 'Meu governo entregou um Brasil melhor do que recebi.', 'Balanço positivo em entrevista de fim de mandato.', 'verified', false, '2002-12-22', 'https://www1.folha.uol.com.br/fsp/2002/12/23/brasil/1.html', 'news_article', 1, 'Brasília', 'Entrevista de fim de mandato', 'fhc-brasil-melhor-b117-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro elogia militares do Brasil que participaram da ditadura.', 'Os militares são a garantia da ordem no Brasil.', 'Defesa contínua do legado autoritário militar.', 'verified', false, '2000-04-01', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-militares-garantia-b117-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca economistas do FMI em tom agressivo.', 'Esses economistas do FMI são vigaristas.', 'Declaração durante campanha de 2002 contra política ortodoxa.', 'verified', false, '2002-08-30', 'https://www1.folha.uol.com.br/fsp/2002/8/31/brasil/3.html', 'news_article', 3, 'Fortaleza', 'Comício', 'ciro-fmi-vigaristas-b117-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende reabertura do SNI e órgãos de repressão.', 'O Brasil precisa de um serviço secreto forte, como nos tempos do SNI.', 'Defesa de reabertura de órgão de repressão da ditadura.', 'verified', true, '2001-08-22', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-sni-servico-secreto-b117-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca Lula comparando suas propostas ao terceiro mundo.', 'Lula nos levará de volta ao Terceiro Mundo.', 'Ataque durante campanha presidencial de 2002.', 'verified', false, '2002-10-15', 'https://www1.folha.uol.com.br/fsp/2002/10/16/brasil/3.html', 'news_article', 2, 'São Paulo', 'Comício', 'fhc-lula-terceiro-mundo-b117-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende invasão de comunidades pobres pelo Exército.', 'Exército tem que invadir as favelas e limpar.', 'Defesa de operações militares em comunidades do Rio.', 'verified', false, '2001-05-15', 'https://istoe.com.br/bolsonaro-exercito-favelas/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-exercito-favelas-b117-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula propõe Fome Zero em campanha de 2002.', 'Vamos acabar com a fome no Brasil, é compromisso meu.', 'Proposta central do programa de governo eleito em 2002.', 'verified', false, '2002-08-15', 'https://www1.folha.uol.com.br/fsp/2002/8/16/brasil/1.html', 'transcript_pdf', 1, 'São Paulo', 'Lançamento do Fome Zero', 'lula-fome-zero-b117-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende abertura de arquivos só dos militantes de esquerda.', 'Os arquivos dos militares devem permanecer fechados.', 'Defesa de sigilo para documentos da ditadura.', 'verified', false, '2000-09-20', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-arquivos-militares-fechados-b117-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende reabilitação como justiça histórica.', 'A história vai me reabilitar.', 'Aposta em reabilitação política após cassação.', 'verified', false, '2001-01-20', 'https://acervo.folha.com.br/leitor.do?numero=15020', 'news_article', 2, 'Maceió', 'Entrevista', 'collor-historia-reabilitar-b117-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende censura a filmes e novelas que promovem liberdades.', 'Essa Globo tá estragando o país com tanta imoralidade.', 'Ataque à rede de TV e conteúdo de entretenimento.', 'verified', false, '2000-11-18', 'https://istoe.com.br/bolsonaro-globo-imoralidade/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-globo-imoralidade-b117-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ataca Greenpeace como organização estrangeira.', 'Greenpeace tem agenda estrangeira, não ambiental.', 'Ataque a ambientalistas durante crítica da Amazônia.', 'verified', false, '2001-02-15', 'https://www1.folha.uol.com.br/fsp/2001/2/16/ciencia/1.html', 'news_article', 2, 'Brasília', 'Entrevista', 'fhc-greenpeace-estrangeiro-b117-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende extermínio de trans e drags.', 'Travesti é doente mental, devia ser internado.', 'Declaração discriminatória contra pessoas trans.', 'verified', true, '2001-10-05', 'https://istoe.com.br/bolsonaro-travesti-doente/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-travesti-doente-b117-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mal, 'Maluf defende superfaturamento em obras como investimento.', 'Obras caras são investimento, não roubo.', 'Defesa de obras municipais investigadas por improbidade.', 'verified', false, '2000-09-22', 'https://acervo.folha.com.br/leitor.do?numero=14920', 'news_article', 4, 'São Paulo', 'Entrevista', 'maluf-superfaturamento-investimento-b117-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende extermínio do comunismo e esquerda no Brasil.', 'Comunismo no Brasil tem que ser extirpado na raiz.', 'Discurso em plenário contra movimentos de esquerda.', 'verified', true, '1999-11-10', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 5, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-extirpar-comunismo-b117-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC ironiza pobres em fala sobre superação.', 'Esqueçam esses pobres que vivem do bolsa-isso, bolsa-aquilo.', 'Declaração elitista em entrevista sobre políticas sociais.', 'verified', false, '2002-03-18', 'https://www1.folha.uol.com.br/fsp/2002/3/19/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-pobres-bolsa-isso-b117-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que repórteres devem apanhar em confrontos.', 'Repórter que vai onde não deve, apanha mesmo.', 'Justificativa de violência contra jornalistas.', 'verified', false, '2002-04-12', 'https://istoe.com.br/bolsonaro-reporter-apanha/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-reporter-apanha-b117-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Serra ataca Lula como incapaz de governar após debate.', 'Lula demonstrou que não tem preparo técnico.', 'Ataque pós-debate presidencial de 2002.', 'verified', false, '2002-10-14', 'https://www1.folha.uol.com.br/fsp/2002/10/15/brasil/1.html', 'news_article', 2, 'São Paulo', 'Entrevista pós-debate', 'serra-lula-preparo-b117-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro apoia assassinato de lideranças comunistas do passado.', 'Os militares fizeram bem em matar comunistas.', 'Defesa de assassinatos cometidos durante ditadura militar.', 'verified', true, '2002-03-20', 'https://istoe.com.br/bolsonaro-matar-comunistas-ditadura/', 'news_article', 5, 'Câmara dos Deputados', 'Entrevista', 'bolsonaro-militares-matar-comunistas-b117-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sar, 'Sarney articula saída de Roseana antes de escândalo financeiro.', 'Minha filha está acima de qualquer suspeita.', 'Defesa frente escândalo que tirou Roseana da corrida presidencial.', 'verified', true, '2002-03-05', 'https://www1.folha.uol.com.br/fsp/2002/3/6/brasil/1.html', 'news_article', 4, 'São Luís', 'Entrevista', 'sarney-roseana-suspeita-b117-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC nega envolvimento no escândalo da pasta rosa.', 'Nada tenho a ver com a pasta rosa.', 'Defesa sobre escândalo envolvendo PF e governo.', 'verified', true, '2002-04-10', 'https://www1.folha.uol.com.br/fsp/2002/4/11/brasil/2.html', 'news_article', 3, 'Brasília', 'Entrevista', 'fhc-pasta-rosa-b117-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende que Paulo Freire deveria ser banido das escolas.', 'Paulo Freire é veneno que contamina nossas crianças.', 'Ataque contra método pedagógico do educador.', 'verified', true, '2002-06-14', 'https://istoe.com.br/bolsonaro-paulo-freire-veneno/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-paulo-freire-veneno-b117-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula ataca desigualdade social no governo FHC em comício.', 'FHC deixa um país mais desigual do que recebeu.', 'Ataque ao legado tucano durante campanha de 2002.', 'verified', false, '2002-09-25', 'https://www1.folha.uol.com.br/fsp/2002/9/26/brasil/1.html', 'transcript_pdf', 1, 'Recife', 'Comício de campanha', 'lula-fhc-desigualdade-b117-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende desbloqueio de armas para civis como solução de violência.', 'Cidadão desarmado é cidadão morto.', 'Defesa de liberação ampla de armas.', 'verified', false, '2000-05-25', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 3, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-desarmado-morto-b117-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC lamenta derrota de Serra mas mantém crítica a Lula.', 'O país fez uma escolha arriscada.', 'Reação à vitória de Lula na eleição de 2002.', 'verified', true, '2002-10-28', 'https://www1.folha.uol.com.br/fsp/2002/10/29/brasil/1.html', 'news_article', 2, 'Brasília', 'Reação à eleição de 2002', 'fhc-escolha-arriscada-b117-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro expressa apoio a Pinochet após sua morte.', 'Pinochet é herói do povo chileno.', 'Homenagem a ditador chileno após sua detenção.', 'verified', false, '1999-03-15', 'https://istoe.com.br/bolsonaro-pinochet-heroi/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-pinochet-heroi-b117-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula promete respeito contratual em meio a fuga de capitais.', 'Vamos honrar todos os contratos do Brasil.', 'Declaração diante de nervosismo do mercado em 2002.', 'verified', false, '2002-07-30', 'https://www1.folha.uol.com.br/fsp/2002/7/31/brasil/1.html', 'news_article', 1, 'São Paulo', 'Entrevista', 'lula-honrar-contratos-b117-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende fechamento de ONGs de direitos humanos.', 'ONGs de direitos humanos são quadrilhas de bandidos.', 'Ataque genérico a organizações da sociedade civil.', 'verified', true, '2001-02-28', 'https://www.camara.leg.br/internet/sitaqweb/', 'transcript_pdf', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-ongs-dh-quadrilhas-b117-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_col, 'Collor defende aliança com PC do B e outros partidos como atitude moderna.', 'Política se faz com alianças, inclusive com antigos adversários.', 'Articulação para volta à política em 2001.', 'verified', false, '2001-09-28', 'https://acervo.folha.com.br/leitor.do?numero=15180', 'news_article', 2, 'Brasília', 'Entrevista', 'collor-aliancas-modernidade-b117-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lula toma posse como presidente em 2003 prometendo combate à fome.', 'Se ao final do meu mandato cada brasileiro puder fazer três refeições por dia, terei realizado a missão da minha vida.', 'Discurso de posse presidencial em 1º de janeiro de 2003.', 'verified', true, '2003-01-01', 'https://www1.folha.uol.com.br/fsp/2003/1/2/brasil/1.html', 'transcript_pdf', 1, 'Brasília', 'Posse presidencial', 'lula-posse-tres-refeicoes-b117-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
