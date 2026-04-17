-- Batch 94: Dilma I + early Dilma II era (Jan 2011 - Dec 2014) - Part 1
DO $$
DECLARE
  v_dilma UUID; v_lula UUID; v_lulap UUID; v_fhc UUID; v_serra UUID;
  v_marta UUID; v_maluf UUID; v_aecio UUID; v_ciro UUID; v_alckmin UUID;
  v_jair UUID; v_edu UUID; v_fla UUID; v_renan UUID; v_gleisi UUID;
  v_moro UUID; v_jefferson UUID; v_silas UUID; v_cunha UUID; v_sarney UUID;
  v_haddad UUID; v_collor UUID; v_temer UUID; v_doria UUID; v_marcal UUID;
  c_cor UUID; c_des UUID; c_hom UUID; c_mis UUID; c_rac UUID;
  c_odi UUID; c_abu UUID; c_mac UUID; c_ant UUID; c_irr UUID;
  c_con UUID; c_nep UUID; c_vio UUID; c_int UUID; c_obs UUID;
BEGIN
  SELECT id INTO v_dilma FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_lula FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lulap FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_serra FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_marta FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_maluf FROM politicians WHERE slug = 'paulo-maluf';
  SELECT id INTO v_aecio FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_ciro FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_alckmin FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_renan FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_gleisi FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_moro FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_jefferson FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_silas FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_cunha FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_sarney FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_haddad FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_collor FROM politicians WHERE slug = 'collor';
  SELECT id INTO v_temer FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_doria FROM politicians WHERE slug = 'doria';
  SELECT id INTO v_marcal FROM politicians WHERE slug = 'pablo-marcal';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_rac FROM categories WHERE slug = 'racismo';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete combate implacável à corrupção no discurso de posse.', 'Não haverá transigência com o desvio de recursos públicos. A corrupção será combatida com o rigor da lei.', 'Discurso de posse no Congresso Nacional como primeira mulher presidente do Brasil.', 'verified', true, '2011-01-01', 'https://www1.folha.uol.com.br/poder/2011/01/862222-leia-integra-do-discurso-de-posse-de-dilma-no-congresso.shtml', 'news_article', 1, 'Congresso Nacional', 'Posse presidencial', 'dilma-posse-corrupcao-b94-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que não estupraria deputada Maria do Rosário porque ela "não merece".', 'Não estupro você porque você não merece.', 'Declaração no plenário da Câmara dirigida à deputada Maria do Rosário após debate sobre direitos humanos.', 'verified', true, '2014-12-09', 'https://g1.globo.com/politica/noticia/2014/12/bolsonaro-diz-que-nao-estupraria-deputada-porque-ela-nao-merece.html', 'news_article', 5, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-nao-estupraria-rosario-b94-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma diz que não tem medo de "passarinho" em resposta a crise do mensalão do DEM.', 'Eu não tenho medo de passarinho, não.', 'Resposta de Dilma a jornalistas sobre pressões políticas, em frase que virou bordão da presidente.', 'verified', false, '2011-06-15', 'https://www1.folha.uol.com.br/poder/2011/06/929855-dilma-diz-que-nao-tem-medo-de-passarinho.shtml', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'dilma-passarinho-b94-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende que ex-presidentes têm direito a gabinete e equipe vitalícios.', 'Ex-presidente não deixa de ser ex-presidente. Tenho direito a estrutura para continuar servindo o país.', 'Declaração após polêmicas sobre gastos com sua equipe de assessoria pós-mandato.', 'verified', false, '2011-03-22', 'https://oglobo.globo.com/politica/lula-defende-estrutura-ex-presidente-2836741', 'news_article', 2, 'Instituto Lula', 'Entrevista coletiva', 'lula-estrutura-ex-presidente-b94-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio acusa governo Dilma de aparelhamento do Estado.', 'O PT transformou o governo em um comitê partidário. Aparelharam o Estado brasileiro.', 'Discurso na tribuna do Senado criticando nomeações do governo federal.', 'verified', false, '2012-04-18', 'https://www12.senado.leg.br/noticias/materias/2012/04/18/aecio-acusa-governo-de-aparelhamento', 'news_article', 2, 'Senado Federal', 'Plenário', 'aecio-aparelhamento-estado-b94-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende ditadura e diz que erro foi torturar em vez de matar.', 'O erro da ditadura foi torturar e não matar.', 'Declaração em entrevista ao programa CQC da Band em 2011.', 'verified', true, '2011-05-30', 'https://www1.folha.uol.com.br/poder/2011/05/921860-bolsonaro-diz-em-programa-humor-que-erro-da-ditadura-foi-torturar-e-nao-matar.shtml', 'news_article', 5, 'Estúdio Band TV', 'Programa CQC', 'bolsonaro-erro-ditadura-matar-b94-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf nega acusações da Interpol e diz que é perseguição política.', 'Sou perseguido há décadas. A Interpol está equivocada e os inimigos políticos comemoram.', 'Declaração após novo pedido de prisão pela Interpol por desvios na Prefeitura de São Paulo.', 'verified', false, '2011-07-14', 'https://www1.folha.uol.com.br/poder/2011/07/943216-maluf-diz-que-e-perseguido-e-nega-acusacoes-da-interpol.shtml', 'news_article', 3, 'São Paulo', 'Coletiva de imprensa', 'maluf-interpol-perseguicao-b94-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan volta à presidência do Senado após escândalos anteriores.', 'Quem me acusou não conseguiu provar nada. Volto legitimado pelos pares.', 'Declaração após eleição que o recolocou na presidência do Senado apesar de investigações prévias.', 'verified', false, '2013-02-01', 'https://g1.globo.com/politica/noticia/2013/02/renan-calheiros-e-eleito-presidente-do-senado.html', 'news_article', 3, 'Senado Federal', 'Posse na presidência', 'renan-volta-presidencia-senado-b94-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Eduardo Cunha defende projeto do "Dia do Orgulho Hétero" na Câmara.', 'Precisamos valorizar a família tradicional. O orgulho heterossexual também merece ser celebrado.', 'Defesa de projeto apresentado por deputado aliado criando data comemorativa do orgulho heterossexual.', 'verified', false, '2011-11-23', 'https://www1.folha.uol.com.br/poder/1007876-deputados-evangelicos-defendem-dia-do-orgulho-hetero.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'cunha-dia-orgulho-hetero-b94-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma veta "kit anti-homofobia" após pressão da bancada evangélica.', 'Não vou fazer propaganda de opções sexuais. O material será suspenso.', 'Dilma suspendeu material do MEC contra homofobia em escolas após pressão de deputados evangélicos liderados por Cunha.', 'verified', true, '2011-05-25', 'https://g1.globo.com/politica/noticia/2011/05/dilma-suspende-distribuicao-do-kit-anti-homofobia-em-escolas.html', 'news_article', 3, 'Palácio do Planalto', 'Decisão presidencial', 'dilma-veto-kit-antihomofobia-b94-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara defende que homossexualidade é opção e pode ser "curada".', 'Homossexualidade é uma opção e existe tratamento para quem quer mudar.', 'Discurso em culto evangélico defendendo projeto da "cura gay" na Comissão de Direitos Humanos.', 'verified', false, '2013-06-18', 'https://www1.folha.uol.com.br/cotidiano/2013/06/1297850-evangelicos-defendem-cura-gay-em-plenario-da-camara.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Audiência pública CDH', 'silas-camara-cura-gay-b94-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que Dilma herdou "bomba-relógio" e defende continuidade do governo.', 'A Dilma herdou uma bomba-relógio da crise internacional. Está fazendo o que tem que fazer.', 'Lula defendeu sua sucessora em evento sindical em São Bernardo em meio a críticas ao ajuste fiscal.', 'verified', false, '2012-04-28', 'https://www1.folha.uol.com.br/poder/1082841-lula-defende-dilma-e-diz-que-ela-herdou-bomba-relogio.shtml', 'news_article', 1, 'São Bernardo do Campo', 'Ato da CUT', 'lula-dilma-bomba-relogio-b94-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Roberto Jefferson critica Dilma e pede CPI do mensalão do DEM.', 'Querem enterrar o mensalão do DEM para proteger o PSDB. É hora de CPI.', 'Declaração após votação do STF sobre o mensalão original e debate sobre CPI do DEM.', 'verified', false, '2012-08-15', 'https://www.istoedinheiro.com.br/noticias/politica/20120815/jefferson-critica-dilma-mensalao/85121.shtml', 'news_article', 2, 'Brasília', 'Coletiva PTB', 'jefferson-cpi-mensalao-dem-b94-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad, candidato a prefeito de SP, promete tarifa zero em etapas.', 'Vamos caminhar para a tarifa zero. É um sonho que pode se realizar.', 'Promessa de campanha do candidato do PT apoiado por Lula, durante debate eleitoral em SP.', 'verified', false, '2012-09-28', 'https://www1.folha.uol.com.br/poder/1159840-haddad-defende-tarifa-zero-em-debate.shtml', 'news_article', 1, 'São Paulo', 'Debate TV Bandeirantes', 'haddad-tarifa-zero-b94-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra ataca Haddad e chama candidatura de "laranja de Lula".', 'Haddad é um poste. O verdadeiro candidato é Lula.', 'Ataque de Serra na reta final da campanha municipal de São Paulo em 2012.', 'verified', false, '2012-10-20', 'https://oglobo.globo.com/politica/serra-chama-haddad-de-poste-6348221', 'news_article', 3, 'São Paulo', 'Debate Record', 'serra-haddad-poste-b94-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma minimiza protestos de junho e diz que "é legítimo manifestar".', 'A manifestação pacífica é legítima. Precisamos ouvir as ruas.', 'Pronunciamento oficial após primeira semana das Jornadas de Junho de 2013.', 'verified', true, '2013-06-21', 'https://g1.globo.com/politica/noticia/2013/06/leia-integra-do-pronunciamento-de-dilma-sobre-manifestacoes.html', 'news_article', 1, 'Palácio do Planalto', 'Pronunciamento em rede nacional', 'dilma-protestos-junho-b94-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin culpa vândalos por violência em protestos e defende PM.', 'Temos uma minoria de vândalos. A PM está fazendo o seu papel.', 'Declaração do governador após repressão da PM paulista a manifestantes e jornalistas no centro de SP.', 'verified', true, '2013-06-13', 'https://www1.folha.uol.com.br/cotidiano/2013/06/1294614-alckmin-critica-vandalos-e-defende-acao-da-pm.shtml', 'news_article', 3, 'Palácio dos Bandeirantes', 'Coletiva de imprensa', 'alckmin-vandalos-pm-b94-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad recua de aumento da tarifa após protestos violentos em SP.', 'Vamos revogar o aumento de 20 centavos. A cidade foi ouvida.', 'Anúncio conjunto com Alckmin após massivas manifestações pelo MPL em todo Brasil.', 'verified', true, '2013-06-19', 'https://g1.globo.com/sao-paulo/noticia/2013/06/haddad-e-alckmin-anunciam-reducao-da-tarifa-em-sp.html', 'news_article', 1, 'São Paulo', 'Coletiva Palácio dos Bandeirantes', 'haddad-recua-tarifa-b94-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que filho não correria risco de ser gay se fosse "bem educado".', 'Eu não corro esse risco. Meus filhos foram bem educados.', 'Entrevista à revista Playboy sobre ter filho gay; declaração gerou repúdio.', 'verified', true, '2011-06-01', 'https://www.istoe.com.br/bolsonaro-playboy-gay-filhos/', 'news_article', 4, 'Rio de Janeiro', 'Entrevista Playboy', 'bolsonaro-filho-gay-playboy-b94-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro na mesma entrevista diz que preferiria filho morto a gay.', 'Prefiro um filho morto em acidente do que aparecer com um bigodudo por aí.', 'Trecho da mesma entrevista à Playboy de 2011 que viralizou durante campanhas seguintes.', 'verified', true, '2011-06-01', 'https://www.cartacapital.com.br/politica/bolsonaro-playboy-filho-morto/', 'news_article', 5, 'Rio de Janeiro', 'Entrevista Playboy', 'bolsonaro-filho-morto-gay-b94-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney defende filha Roseana em crise política no Maranhão.', 'Minha filha é governadora eleita pelo povo. Não admito perseguição.', 'Declaração ao ser questionado sobre crise no Maranhão envolvendo a governadora Roseana Sarney.', 'verified', false, '2012-05-10', 'https://oglobo.globo.com/politica/sarney-defende-roseana-maranhao-4891123', 'news_article', 3, 'Brasília', 'Entrevista', 'sarney-defende-roseana-b94-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma anuncia 11 bilhões de reais para a Copa 2014 em meio a protestos.', 'A Copa vai mostrar o Brasil ao mundo. Os investimentos valerão a pena.', 'Defesa do pacote da Copa frente às críticas sobre gastos com estádios durante crise nos serviços públicos.', 'verified', false, '2013-06-22', 'https://www1.folha.uol.com.br/esporte/folhanacopa/2013/06/1296889-dilma-defende-gastos-com-a-copa-em-meio-a-protestos.shtml', 'news_article', 2, 'Brasília', 'Coletiva sobre Copa', 'dilma-gastos-copa-b94-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio critica "patrimonialismo" petista em convenção do PSDB.', 'O PT confunde o público e o privado. Vamos acabar com esse patrimonialismo.', 'Discurso na convenção nacional do PSDB que oficializou sua candidatura presidencial.', 'verified', true, '2014-06-14', 'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/06/aecio-oficializa-candidatura-em-convencao.html', 'news_article', 2, 'Brasília', 'Convenção PSDB', 'aecio-patrimonialismo-psdb-b94-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro critica demora do STF no julgamento do mensalão.', 'A demora da Justiça favorece a impunidade. O caso do mensalão tem que ter desfecho.', 'Entrevista do juiz federal Sergio Moro à Gazeta do Povo, período em que ainda atuava em Curitiba.', 'verified', false, '2012-08-02', 'https://www.gazetadopovo.com.br/vida-publica/justica-e-direito/moro-defende-celeridade-julgamento-mensalao/', 'news_article', 2, 'Curitiba', 'Entrevista Gazeta do Povo', 'moro-demora-mensalao-b94-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma vaiada na abertura da Copa defende ser "mulher guerreira".', 'Eu sou uma mulher guerreira. Não vou me abater com vaias.', 'Reação após ser xingada com palavrões na abertura da Copa em São Paulo ao lado de autoridades.', 'verified', true, '2014-06-13', 'https://g1.globo.com/politica/noticia/2014/06/dilma-e-vaiada-e-xingada-em-abertura-da-copa-em-sao-paulo.html', 'news_article', 2, 'Itaquerão', 'Abertura Copa 2014', 'dilma-vaias-copa-b94-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz em palestra paga que "quem não gosta, que procure outro país".', 'Quem não gosta do Brasil que procure outro país.', 'Em palestra paga em evento privado, Lula rebateu críticos da gestão Dilma em meio a protestos.', 'verified', false, '2013-07-22', 'https://www.istoedinheiro.com.br/lula-procure-outro-pais/', 'news_article', 3, 'São Paulo', 'Evento empresarial', 'lula-procure-outro-pais-b94-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que negros do quilombo "não servem nem para procriar".', 'Eles não fazem nada. Eu acho que nem para procriador servem mais.', 'Palestra em Clube Hebraica no Rio de Janeiro, gerando processo no MPF por racismo.', 'verified', true, '2014-04-04', 'https://oglobo.globo.com/politica/bolsonaro-diz-que-quilombolas-nao-servem-nem-para-procriar-12132811', 'news_article', 5, 'Clube Hebraica', 'Palestra no Hebraica', 'bolsonaro-quilombolas-procriar-b94-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC acusa Dilma de "desmontar" conquistas do Plano Real.', 'Dilma está desmontando o que construímos com o Real. Vão empurrar o país ao abismo.', 'Artigo de FHC criticando política econômica do governo Dilma publicado no Estadão.', 'verified', false, '2014-03-10', 'https://www.estadao.com.br/politica/fhc-critica-dilma-real-imp-,1140981', 'news_article', 2, 'São Paulo', 'Artigo em jornal', 'fhc-dilma-desmonte-real-b94-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha articula bloco contra governo Dilma antes da eleição.', 'O governo não tem maioria no Congresso. Vamos mostrar isso.', 'Articulação de Cunha no PMDB em preparação para assumir a presidência da Câmara em 2015.', 'verified', false, '2014-11-20', 'https://www1.folha.uol.com.br/poder/2014/11/1552033-cunha-articula-presidencia-da-camara.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Bastidores PMDB', 'cunha-articula-bloco-dilma-b94-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta defende união estável homoafetiva como direito de cidadania.', 'Não dá para negar direitos a quem ama. União homoafetiva é direito humano.', 'Discurso no Senado em defesa da decisão do STF que reconheceu união estável homoafetiva.', 'verified', false, '2011-05-05', 'https://www12.senado.leg.br/noticias/materias/2011/05/05/marta-defende-uniao-homoafetiva', 'news_article', 1, 'Senado Federal', 'Sessão plenária', 'marta-uniao-homoafetiva-b94-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor defende sua trajetória e minimiza impeachment de 92.', 'Fui vítima da maior injustiça política. O impeachment foi uma farsa.', 'Declaração de Collor, então senador, em evento do PTB em Alagoas.', 'verified', false, '2012-03-28', 'https://www.istoe.com.br/collor-impeachment-injustica/', 'news_article', 3, 'Maceió', 'Evento PTB', 'collor-impeachment-injustica-b94-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi, como ministra da Casa Civil, nega envolvimento do governo em corrupção.', 'O governo Dilma é o mais rigoroso do mundo no combate à corrupção.', 'Declaração em entrevista após nova denúncia envolvendo ministérios petistas.', 'verified', false, '2011-10-14', 'https://g1.globo.com/politica/noticia/2011/10/gleisi-defende-governo-combate-corrupcao.html', 'news_article', 2, 'Palácio do Planalto', 'Entrevista à imprensa', 'gleisi-governo-rigoroso-b94-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer, como vice, declara lealdade a Dilma em meio a rumores.', 'Minha lealdade à presidenta é total e absoluta.', 'Declaração de Temer após especulações sobre racha na base aliada em 2012.', 'verified', false, '2012-08-28', 'https://www1.folha.uol.com.br/poder/1144234-temer-afirma-lealdade-a-dilma.shtml', 'news_article', 1, 'Brasília', 'Entrevista', 'temer-lealdade-dilma-b94-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama nordestinos de "ignorantes" após vitória de Dilma.', 'Infelizmente, a ignorância que levou alguns nordestinos a votarem em Dilma.', 'Comentário em redes sociais após reeleição de Dilma em 2014 que gerou processo por crime de discriminação.', 'verified', true, '2014-10-27', 'https://www.cartacapital.com.br/politica/bolsonaro-nordestinos-ignorantes/', 'news_article', 4, 'Rio de Janeiro', 'Redes sociais', 'bolsonaro-nordestinos-ignorantes-b94-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio acusa Dilma de mentir em debate presidencial.', 'A presidenta está mentindo descaradamente para o povo brasileiro.', 'Ataque no último debate presidencial na Globo, reta final do segundo turno de 2014.', 'verified', true, '2014-10-24', 'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/aecio-e-dilma-em-debate-globo.html', 'news_article', 2, 'Rio de Janeiro', 'Debate Rede Globo', 'aecio-dilma-mentira-debate-b94-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma chama Aécio de "candidato do retrocesso" em horário eleitoral.', 'Aécio representa o retrocesso. Quer tirar direitos do trabalhador.', 'Propaganda eleitoral gratuita no segundo turno da campanha presidencial.', 'verified', false, '2014-10-15', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1532984-dilma-ataca-aecio-no-horario-eleitoral.shtml', 'news_article', 1, 'TV', 'Horário eleitoral gratuito', 'dilma-aecio-retrocesso-b94-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro anuncia primeira fase da Operação Lava Jato em Curitiba.', 'A operação é o resultado de meses de investigação contra esquema de doleiros.', 'Coletiva após deflagração da primeira fase da Lava Jato, originalmente focada em doleiros.', 'verified', true, '2014-03-17', 'https://g1.globo.com/pr/parana/noticia/2014/03/operacao-lava-jato-prende-doleiros-em-curitiba.html', 'news_article', 1, 'Curitiba', 'Operação Lava Jato - Fase 1', 'moro-lava-jato-primeira-fase-b94-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi critica Lava Jato e acusa operação de ter motivação política.', 'Tem seletividade na Lava Jato. Querem atingir o PT.', 'Declaração em entrevista após depoimentos envolvendo operadores ligados ao PT.', 'verified', false, '2014-11-25', 'https://www.cartacapital.com.br/politica/gleisi-lava-jato-seletividade/', 'news_article', 3, 'Brasília', 'Entrevista coletiva', 'gleisi-lava-jato-seletividade-b94-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes chama Dilma de "inepta" na condução da economia.', 'A Dilma é inepta na gestão econômica. Está destruindo o legado de Lula.', 'Entrevista de Ciro, sem cargo no governo, ao Jornal Nacional criticando a política econômica.', 'verified', false, '2014-02-15', 'https://www.valor.com.br/politica/ciro-gomes-dilma-inepta-economia-3467123', 'news_article', 3, 'Fortaleza', 'Entrevista TV Globo', 'ciro-dilma-inepta-b94-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende aprovação do Estatuto do Desarmado "ao contrário".', 'O certo é o cidadão de bem ter arma. Vou derrubar esse estatuto.', 'Discurso na Câmara defendendo revisão do Estatuto do Desarmamento.', 'verified', false, '2013-09-18', 'https://www1.folha.uol.com.br/poder/2013/09/1343221-bolsonaro-defende-armas-para-cidadao.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-armas-estatuto-b94-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan minimiza denúncias contra ele no caso da lobista.', 'São fofocas do passado. Fui absolvido pela ética do Senado.', 'Resposta de Renan Calheiros a reportagem que retomou caso da pensão paga por lobista.', 'verified', false, '2011-08-20', 'https://www.istoe.com.br/renan-lobista-fofoca/', 'news_article', 3, 'Brasília', 'Coletiva Senado', 'renan-lobista-fofoca-b94-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma demite ministro Antonio Palocci em meio a denúncias.', 'O ministro está renunciando por decisão própria. Agradeço os serviços.', 'Anúncio da saída de Palocci da Casa Civil após denúncias sobre crescimento patrimonial.', 'verified', true, '2011-06-07', 'https://g1.globo.com/politica/noticia/2011/06/palocci-deixa-governo-apos-denuncias-casa-civil.html', 'news_article', 2, 'Palácio do Planalto', 'Anúncio oficial', 'dilma-demite-palocci-b94-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que denúncias da Veja são "picuinha" contra seu partido.', 'Tem muita picuinha da imprensa contra o PT. A Veja é uma oposição política.', 'Declaração de Lula em entrevista à Rádio Bandeirantes durante série de denúncias da Veja.', 'verified', false, '2011-11-08', 'https://oglobo.globo.com/politica/lula-picuinha-veja-3202812', 'news_article', 2, 'São Paulo', 'Entrevista Rádio Bandeirantes', 'lula-veja-picuinha-b94-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha minimiza denúncias de corrupção contra aliados do governo Dilma.', 'Não podemos criminalizar política. Toda denúncia vira caso de polícia no Brasil.', 'Declaração em plenário em defesa de parlamentares investigados em meio a CPIs em andamento.', 'verified', false, '2013-05-22', 'https://www1.folha.uol.com.br/poder/2013/05/1281912-cunha-defende-politicos-em-cpis.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Discurso no plenário', 'cunha-criminalizacao-politica-b94-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves nega acusações de nepotismo em Minas Gerais.', 'Minha família não tem envolvimento indevido com a política mineira.', 'Resposta a reportagens sobre parentes em cargos no governo de Minas durante sua gestão.', 'verified', false, '2012-09-14', 'https://g1.globo.com/mg/minas-gerais/noticia/2012/09/aecio-nega-nepotismo-mg.html', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'aecio-nega-nepotismo-mg-b94-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy critica igrejas evangélicas em debate sobre laicidade.', 'Estamos vivendo uma invasão clerical no Estado. Igreja é igreja, Estado é Estado.', 'Discurso da senadora em defesa da laicidade após avanço da bancada evangélica.', 'verified', false, '2013-04-11', 'https://www12.senado.leg.br/noticias/materias/2013/04/11/marta-critica-bancada-evangelica', 'news_article', 2, 'Senado Federal', 'Discurso plenário', 'marta-laicidade-estado-b94-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Jefferson volta aos holofotes negando sigilo de suas delações.', 'Falei tudo o que sabia sobre o mensalão. Vocês agora vão ver mais.', 'Entrevista de Jefferson à ISTOÉ retomando protagonismo no caso julgado pelo STF.', 'verified', false, '2012-10-05', 'https://www.istoe.com.br/jefferson-delacao-mensalao/', 'news_article', 2, 'Rio de Janeiro', 'Entrevista ISTOÉ', 'jefferson-delacao-mensalao-b94-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma classifica mensalão como "tiro no pé" do PT.', 'Foi um erro grave. Não se faz política com caixa dois.', 'Entrevista à Folha em que Dilma se distanciou publicamente do escândalo julgado pelo STF.', 'verified', false, '2012-11-03', 'https://www1.folha.uol.com.br/poder/1181812-dilma-mensalao-tiro-no-pe.shtml', 'news_article', 2, 'Palácio do Planalto', 'Entrevista Folha', 'dilma-mensalao-tiro-no-pe-b94-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que julgamento do mensalão foi "farsa" em entrevista polêmica.', 'O julgamento é uma farsa. Querem atingir o PT e destruir o Dirceu.', 'Entrevista de Lula à Carta Capital defendendo José Dirceu em meio a condenações do STF.', 'verified', true, '2012-11-28', 'https://www.cartacapital.com.br/politica/lula-julgamento-mensalao-farsa/', 'news_article', 4, 'São Paulo', 'Entrevista Carta Capital', 'lula-mensalao-farsa-b94-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC celebra condenação do mensalão e diz que STF "fez história".', 'O STF fez história. A Justiça mostrou que pode funcionar no Brasil.', 'FHC se pronunciou após condenações do mensalão, evocando a necessidade de moralização pública.', 'verified', false, '2012-10-17', 'https://oglobo.globo.com/politica/fhc-stf-mensalao-historia-6427891', 'news_article', 1, 'São Paulo', 'Entrevista', 'fhc-mensalao-historia-b94-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende voto em Brilhante Ustra e cita coronel como herói.', 'Ustra é o herói brasileiro. Foi um homem que evitou que o Brasil virasse Cuba.', 'Declaração na CPI da Verdade na Câmara dos Deputados em defesa de torturador da ditadura.', 'verified', true, '2014-05-14', 'https://www1.folha.uol.com.br/poder/2014/05/1454412-bolsonaro-defende-ustra-em-audiencia.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Audiência Comissão da Verdade', 'bolsonaro-ustra-heroi-b94-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma defende Comissão Nacional da Verdade contra críticas militares.', 'A Comissão da Verdade é um direito do Brasil. Não admito revisionismo.', 'Dilma, ex-presa política, reagiu a declarações de clubes militares contra o trabalho da CNV.', 'verified', false, '2014-05-29', 'https://g1.globo.com/politica/noticia/2014/05/dilma-defende-comissao-da-verdade-e-critica-militares.html', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'dilma-defende-comissao-verdade-b94-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende intervenção militar em caso de vitória de Dilma.', 'Se o PT ganhar de novo, só as Forças Armadas para salvar o Brasil.', 'Declaração em comício pouco antes do segundo turno de 2014 sugerindo solução golpista.', 'verified', true, '2014-10-18', 'https://www.cartacapital.com.br/politica/bolsonaro-intervencao-militar-2014/', 'news_article', 5, 'Rio de Janeiro', 'Comício', 'bolsonaro-intervencao-militar-2014-b94-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio diz que não reconhece derrota e pede recontagem de votos.', 'Vamos pedir recontagem. O resultado é apertado demais para não ser auditado.', 'Declaração após derrota apertada no segundo turno para Dilma Rousseff.', 'verified', true, '2014-10-28', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1540112-aecio-pede-recontagem-de-votos.shtml', 'news_article', 3, 'Belo Horizonte', 'Coletiva pós-eleição', 'aecio-recontagem-votos-b94-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor vota para arquivar cassação de parlamentar no Senado.', 'Voto pela absolvição. Esse é o processo correto.', 'Voto de Collor, então senador, em processo de cassação no Conselho de Ética.', 'verified', false, '2013-12-04', 'https://oglobo.globo.com/politica/collor-vota-contra-cassacao-senador-10899112', 'news_article', 2, 'Senado Federal', 'Conselho de Ética', 'collor-voto-cassacao-b94-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad defende reforma política e financiamento público.', 'O poder econômico domina as eleições. Precisamos de reforma política urgente.', 'Discurso do prefeito de SP em evento da FNP defendendo bandeira histórica do PT.', 'verified', false, '2013-11-20', 'https://www1.folha.uol.com.br/poder/2013/11/1371128-haddad-defende-reforma-politica-fnp.shtml', 'news_article', 1, 'São Paulo', 'Evento FNP', 'haddad-reforma-politica-b94-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin defende crise hídrica como "questão divina" para São Paulo.', 'Só Deus pode mandar a chuva. Estamos fazendo tudo o que é humanamente possível.', 'Declaração durante crise hídrica em SP após escassez no Cantareira; gerou grande repercussão.', 'verified', true, '2014-10-30', 'https://g1.globo.com/sao-paulo/noticia/2014/10/alckmin-diz-que-so-deus-pode-resolver-crise-hidrica.html', 'news_article', 3, 'Palácio dos Bandeirantes', 'Coletiva sobre crise hídrica', 'alckmin-deus-crise-hidrica-b94-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma critica "pedaladas fiscais" já usadas por FHC.', 'Essa prática existe há décadas. Não é invenção do meu governo.', 'Defesa de Dilma em entrevista sobre as pedaladas fiscais que depois motivariam o impeachment.', 'verified', false, '2014-11-18', 'https://www.valor.com.br/politica/dilma-pedaladas-historicas-3781212', 'news_article', 2, 'Palácio do Planalto', 'Entrevista Valor', 'dilma-pedaladas-historicas-b94-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha ataca governo após denúncia sobre contas em nome de laranjas.', 'Nunca tive conta no exterior. São matérias armadas contra mim.', 'Resposta de Cunha a matéria preliminar sobre as contas suíças que viriam à tona em 2015.', 'verified', false, '2014-09-12', 'https://oglobo.globo.com/politica/cunha-nega-contas-exterior-13923123', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista', 'cunha-nega-contas-exterior-b94-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vota a favor de projeto que criminaliza movimentos sociais.', 'Movimento social é bandido. MST é bandido. Tem que colocar na cadeia.', 'Discurso em defesa de projeto de criminalização de protestos na Câmara em 2013.', 'verified', false, '2013-07-17', 'https://www1.folha.uol.com.br/poder/2013/07/1310181-bolsonaro-criminalizar-mst.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'bolsonaro-criminaliza-mst-b94-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula diz que quer voltar à presidência em 2018.', 'Se não tiver ninguém melhor, eu volto em 2018. Não tenho medo.', 'Declaração de Lula durante palestra em ato do PT em SP especulando sucessão presidencial.', 'verified', false, '2014-01-22', 'https://www1.folha.uol.com.br/poder/2014/01/1401812-lula-volta-2018.shtml', 'news_article', 2, 'São Paulo', 'Ato do PT', 'lula-volta-2018-b94-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma sanciona Marco Civil da Internet após Snowden.', 'O Brasil terá sua carta magna da internet. Privacidade é direito.', 'Cerimônia de sanção do Marco Civil em evento na NETmundial em SP após escândalo da NSA.', 'verified', true, '2014-04-23', 'https://g1.globo.com/politica/noticia/2014/04/dilma-sanciona-marco-civil-da-internet-em-sao-paulo.html', 'news_article', 1, 'São Paulo', 'Cerimônia NETmundial', 'dilma-marco-civil-internet-b94-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra desiste de candidatura presidencial em 2014 para Aécio.', 'Minha decisão é de unidade. Apoio integralmente Aécio.', 'Anúncio de desistência de José Serra pela candidatura em favor de Aécio em convenção PSDB.', 'verified', false, '2014-04-15', 'https://oglobo.globo.com/politica/eleicoes-2014/serra-desiste-apoia-aecio-12199821', 'news_article', 1, 'Brasília', 'Convenção PSDB', 'serra-desiste-aecio-b94-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes recusa ser vice de Dilma em 2014 citando divergências.', 'Não vou ser vice. Tenho muitas divergências com esse governo.', 'Declaração de Ciro Gomes à imprensa ao recusar proposta de integrar chapa petista.', 'verified', false, '2014-05-05', 'https://www.cartacapital.com.br/politica/ciro-recusa-vice-dilma-2014/', 'news_article', 1, 'Fortaleza', 'Entrevista', 'ciro-recusa-vice-dilma-b94-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara defende que casamento é "homem e mulher" em PL.', 'Casamento é entre homem e mulher. É Bíblia, é Constituição, é tradição.', 'Discurso em defesa do Estatuto da Família apresentado na Câmara em 2013.', 'verified', false, '2013-10-02', 'https://www1.folha.uol.com.br/poder/2013/10/1354412-silas-camara-casamento-estatuto-familia.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'silas-casamento-estatuto-b94-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insulta colega parlamentar chamando-a de "vagabunda".', 'Vagabunda, fique calada e me deixe falar.', 'Discussão no plenário da Câmara com deputada do PT que gerou pedido de cassação.', 'verified', false, '2013-03-13', 'https://g1.globo.com/politica/noticia/2013/03/bolsonaro-xinga-deputada-no-plenario.html', 'news_article', 4, 'Câmara dos Deputados', 'Sessão plenária', 'bolsonaro-vagabunda-deputada-b94-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf diz que "rouba, mas faz" defendendo seu legado em São Paulo.', 'Eu fiz. Os paulistanos sabem disso. A obra está aí.', 'Defesa do próprio legado em entrevista à Veja SP sobre investigações de lavagem de dinheiro.', 'verified', false, '2012-03-09', 'https://veja.abril.com.br/politica/maluf-rouba-mas-faz/', 'news_article', 3, 'São Paulo', 'Entrevista Veja SP', 'maluf-rouba-mas-faz-b94-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma sanciona Lei Maria da Penha ampliada contra feminicídio.', 'Não vamos aceitar mais mulher morta por ser mulher.', 'Cerimônia no Planalto sancionando ampliação da lei contra violência doméstica.', 'verified', false, '2013-05-12', 'https://g1.globo.com/politica/noticia/2013/05/dilma-sanciona-lei-feminicidio.html', 'news_article', 1, 'Palácio do Planalto', 'Cerimônia de sanção', 'dilma-sanciona-maria-penha-b94-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan defende PEC que reduz poderes do MP após Lava Jato.', 'O MP precisa de limites. Ninguém está acima da lei.', 'Discurso de Renan em defesa da PEC 37 em resposta ao protagonismo do MP nas operações.', 'verified', false, '2013-06-25', 'https://www12.senado.leg.br/noticias/materias/2013/06/25/renan-defende-pec-37', 'news_article', 4, 'Senado Federal', 'Discurso plenário', 'renan-pec-37-mp-b94-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio promete privatizar estatais se eleito presidente.', 'Vamos desestatizar o que não funciona. Estado precisa ser eficiente.', 'Promessa de campanha em sabatina com empresários no Lide.', 'verified', false, '2014-08-07', 'https://www.estadao.com.br/politica/aecio-privatizacoes-lide-imp-,1235918', 'news_article', 1, 'São Paulo', 'Sabatina Lide', 'aecio-privatizacoes-lide-b94-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete "não haver recessão" em plena crise de 2014.', 'Não vai haver recessão. Fiquem tranquilos.', 'Promessa de Dilma em meio a sinais de desaceleração que depois viraria recessão histórica.', 'verified', true, '2014-08-19', 'https://www1.folha.uol.com.br/mercado/2014/08/1502812-dilma-nao-havera-recessao.shtml', 'news_article', 3, 'Palácio do Planalto', 'Entrevista', 'dilma-nao-recessao-b94-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha defende desvinculação de receitas e ataca gastos sociais.', 'Temos que acabar com essa vinculação que amarra o orçamento.', 'Defesa na Câmara de PECs contra vinculação constitucional de receitas para saúde e educação.', 'verified', false, '2014-07-10', 'https://g1.globo.com/politica/noticia/2014/07/cunha-defende-desvinculacao-receitas.html', 'news_article', 2, 'Câmara dos Deputados', 'Plenário', 'cunha-desvinculacao-receitas-b94-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula ataca imprensa e chama jornalistas de "golpistas".', 'A grande imprensa é golpista. Querem derrubar governo eleito.', 'Discurso em ato pró-Dilma em SBC acusando mídia de conspiração pré-Lava Jato.', 'verified', false, '2014-11-15', 'https://www.cartacapital.com.br/politica/lula-imprensa-golpista-2014/', 'news_article', 3, 'São Bernardo do Campo', 'Ato CUT', 'lula-imprensa-golpista-b94-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro se elege deputado mais votado do RJ dedicando vitória a Ustra.', 'Minha vitória é dedicada ao Coronel Brilhante Ustra.', 'Em entrevista à imprensa após se eleger o deputado mais votado do Rio em 2014.', 'verified', true, '2014-10-06', 'https://oglobo.globo.com/politica/bolsonaro-eleicao-2014-ustra-14178221', 'news_article', 5, 'Rio de Janeiro', 'Coletiva pós-eleição', 'bolsonaro-eleito-dedica-ustra-b94-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro se elege pela primeira vez em 2014.', 'Vou dar continuidade ao trabalho do meu pai em Brasília.', 'Eduardo, filho de Jair, elegeu-se deputado federal por SP em sua primeira candidatura.', 'verified', false, '2014-10-07', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2014/noticia/2014/10/eduardo-bolsonaro-eleito-deputado-federal-sp.html', 'news_article', 2, 'São Paulo', 'Resultado eleitoral', 'eduardo-eleito-2014-b94-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro se reelege deputado estadual do RJ em 2014.', 'O povo reconheceu meu trabalho. Vou continuar defendendo a família.', 'Flávio se reelegeu deputado estadual do RJ em 2014, consolidando grupo familiar.', 'verified', false, '2014-10-08', 'https://oglobo.globo.com/politica/flavio-bolsonaro-reeleito-rj-2014-14158321', 'news_article', 1, 'Rio de Janeiro', 'Eleição estadual', 'flavio-reeleito-2014-b94-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney ataca Aécio e se alinha a Dilma em segundo turno.', 'Aécio representa o retrocesso. O PMDB fica com Dilma.', 'Declaração em convenção do PMDB apoiando Dilma formalmente no segundo turno.', 'verified', false, '2014-10-10', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1530112-sarney-pmdb-dilma.shtml', 'news_article', 2, 'Brasília', 'Convenção PMDB', 'sarney-apoia-dilma-b94-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma nomeia Graça Foster como primeira mulher presidente da Petrobras.', 'É um marco para as mulheres brasileiras. A Graça Foster é referência.', 'Cerimônia no Planalto anunciando Graça Foster como primeira presidente mulher da Petrobras.', 'verified', false, '2012-01-23', 'https://g1.globo.com/economia/noticia/2012/01/dilma-nomeia-graca-foster-petrobras.html', 'news_article', 1, 'Palácio do Planalto', 'Anúncio', 'dilma-graca-foster-petrobras-b94-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro aceita delação de Youssef no caso Lava Jato.', 'A delação premiada é instrumento eficaz de investigação.', 'Declaração após homologação do primeiro grande acordo de delação do caso Lava Jato.', 'verified', true, '2014-10-10', 'https://www.gazetadopovo.com.br/vida-publica/moro-delacao-youssef-lava-jato/', 'news_article', 2, 'Curitiba', 'Audiência Lava Jato', 'moro-delacao-youssef-b94-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha articula com Bolsonaro votos para presidência da Câmara.', 'Tenho o apoio de todos os setores. Vou ser presidente da Câmara.', 'Bastidores sobre articulação de Cunha incluindo apoio do grupo de Bolsonaro antes da eleição.', 'verified', false, '2014-12-15', 'https://oglobo.globo.com/politica/cunha-bolsonaro-votos-camara-14987112', 'news_article', 3, 'Brasília', 'Bastidores Câmara', 'cunha-bolsonaro-votos-camara-b94-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que vai "vetar" direitos humanos se chegar ao poder.', 'Esses direitos humanos defendem vagabundo. Comigo vai ser diferente.', 'Declaração em audiência na Câmara em 2012 criticando Comissão de Direitos Humanos.', 'verified', false, '2012-05-23', 'https://www1.folha.uol.com.br/poder/1092218-bolsonaro-critica-direitos-humanos.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-veta-direitos-humanos-b94-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula celebra aprovação de cotas raciais no ensino superior.', 'É uma conquista histórica. A reparação começa pela educação.', 'Declaração de Lula após sanção da Lei de Cotas em universidades federais.', 'verified', false, '2012-08-29', 'https://g1.globo.com/educacao/noticia/2012/08/lula-comemora-lei-de-cotas-raciais.html', 'news_article', 1, 'São Paulo', 'Evento Instituto Lula', 'lula-celebra-lei-cotas-b94-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta defende legalização do aborto em debate com evangélicos.', 'A criminalização do aborto mata mulheres pobres. É questão de saúde pública.', 'Marta Suplicy defendeu o direito ao aborto em debate no Senado sobre código penal.', 'verified', false, '2012-04-11', 'https://www.cartacapital.com.br/sociedade/marta-suplicy-aborto-codigo-penal/', 'news_article', 1, 'Senado Federal', 'Comissão Código Penal', 'marta-legalizacao-aborto-b94-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan convoca sessão para anular cassação de aliado.', 'A cassação foi política. O Senado vai corrigir.', 'Articulação de Renan para reverter cassação de senador do PMDB no Conselho de Ética.', 'verified', false, '2013-10-22', 'https://www12.senado.leg.br/noticias/materias/2013/10/22/renan-articula-cassacao', 'news_article', 3, 'Senado Federal', 'Sessão plenária', 'renan-anula-cassacao-b94-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma afirma que Petrobras é patrimônio "intocável" do país.', 'A Petrobras é nossa. Ninguém vai colocar a mão nesse patrimônio.', 'Declaração em Congresso Nacional do PT após surgimento de denúncias contra a estatal.', 'verified', true, '2014-09-07', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1513112-dilma-petrobras-patrimonio.shtml', 'news_article', 2, 'São Paulo', 'Congresso do PT', 'dilma-petrobras-patrimonio-b94-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio é denunciado por desvios no "aeroporto do Aécio" em MG.', 'É uma calúnia. O aeroporto foi uma obra pública importante.', 'Resposta a denúncia sobre suposto desvio e benefício particular com aeroporto em Cláudio-MG.', 'verified', false, '2014-08-22', 'https://www.istoe.com.br/aecio-aeroporto-claudio/', 'news_article', 4, 'Belo Horizonte', 'Coletiva de imprensa', 'aecio-aeroporto-claudio-b94-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha defende bancada evangélica contra projeto anti-homofobia.', 'Não aceitaremos projetos que criminalizem nossa fé.', 'Fala no encontro da bancada evangélica contra o PLC 122 que tipificava homofobia como crime.', 'verified', false, '2011-12-07', 'https://www1.folha.uol.com.br/poder/1014212-cunha-bancada-evangelica-homofobia.shtml', 'news_article', 4, 'Brasília', 'Encontro Bancada Evangélica', 'cunha-bancada-evangelica-plc122-b94-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro afirma que mulher deve ganhar menos porque "engravida".', 'A mulher engravida. Tem que ganhar menos no mercado.', 'Entrevista em que justificou desigualdade salarial pela maternidade, em 2014.', 'verified', true, '2014-02-15', 'https://oglobo.globo.com/politica/bolsonaro-mulher-menor-salario-engravida-11721218', 'news_article', 4, 'Rio de Janeiro', 'Entrevista Zero Hora', 'bolsonaro-mulher-engravida-salario-b94-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma defende Mais Médicos em meio a protestos contra cubanos.', 'Os médicos brasileiros tiveram chance. Não vamos deixar a população sem atendimento.', 'Declaração em cerimônia do programa Mais Médicos após entidades médicas protestarem.', 'verified', false, '2013-08-26', 'https://g1.globo.com/politica/noticia/2013/08/dilma-defende-mais-medicos-cubanos.html', 'news_article', 1, 'Brasília', 'Cerimônia Mais Médicos', 'dilma-mais-medicos-cubanos-b94-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula vê EUA espionando Petrobras e clama por soberania.', 'Os americanos espionam nossas empresas. Precisamos defender a soberania.', 'Resposta de Lula a revelações de Snowden sobre espionagem da NSA contra Petrobras.', 'verified', false, '2013-09-10', 'https://www.cartacapital.com.br/politica/lula-nsa-petrobras/', 'news_article', 2, 'São Paulo', 'Entrevista', 'lula-nsa-petrobras-b94-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney é acusado de nepotismo em caso de filhos e netos no Senado.', 'Minha família sempre serviu ao Brasil. Não há ilegalidade.', 'Resposta de Sarney a reportagens sobre parentes contratados em gabinetes do Senado.', 'verified', false, '2011-06-14', 'https://oglobo.globo.com/politica/sarney-nepotismo-senado-2781223', 'news_article', 4, 'Brasília', 'Coletiva Senado', 'sarney-nepotismo-senado-b94-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_nep, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende ditadura como "período glorioso" do Brasil.', 'A ditadura foi um período glorioso. Não houve ditadura, houve democracia.', 'Negação da ditadura em audiência na Câmara que tramitou Comissão da Verdade.', 'verified', true, '2013-09-12', 'https://www1.folha.uol.com.br/poder/2013/09/1342912-bolsonaro-ditadura-periodo-glorioso.shtml', 'news_article', 5, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-ditadura-gloriosa-b94-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin defende privatização da Sabesp em meio à crise.', 'A iniciativa privada traria eficiência. O Estado não dá conta sozinho.', 'Declaração do governador à Folha em setembro de 2014 durante crise hídrica crítica.', 'verified', false, '2014-09-29', 'https://www1.folha.uol.com.br/cotidiano/2014/09/1519812-alckmin-sabesp-privatizacao.shtml', 'news_article', 2, 'São Paulo', 'Entrevista', 'alckmin-sabesp-privatizacao-b94-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan minimiza CPI da Petrobras pedida pela oposição.', 'Essa CPI é manobra eleitoral. Não vai prosperar no Senado.', 'Renan, como presidente do Senado, barrou tramitação de CPI após Lava Jato começar.', 'verified', false, '2014-09-24', 'https://www12.senado.leg.br/noticias/materias/2014/09/24/renan-cpi-petrobras', 'news_article', 4, 'Senado Federal', 'Coletiva presidente do Senado', 'renan-barra-cpi-petrobras-b94-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi Hoffmann anuncia candidatura ao Senado pelo Paraná.', 'Vou ao Senado defender o projeto do PT e da Dilma.', 'Anúncio da candidatura ao Senado pelo Paraná, deixando a Casa Civil em 2014.', 'verified', false, '2014-02-04', 'https://g1.globo.com/pr/parana/eleicoes/2014/noticia/2014/02/gleisi-hoffmann-anuncia-senado-parana.html', 'news_article', 1, 'Curitiba', 'Anúncio pré-candidatura', 'gleisi-senado-parana-2014-b94-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC apoia protestos contra Dilma durante jornadas de junho.', 'As ruas estão dizendo algo que o governo não quer ouvir.', 'Artigo no Estadão de FHC durante protestos de junho lendo o movimento como crítica ao PT.', 'verified', false, '2013-06-25', 'https://www.estadao.com.br/politica/fhc-protestos-junho-imp-,1045612', 'news_article', 2, 'São Paulo', 'Artigo Estadão', 'fhc-protestos-junho-b94-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma reage à ameaça de CPI do mensalão tucano e defende transparência.', 'Todo dinheiro público deve ser investigado. Não temos nada a esconder.', 'Dilma em entrevista sobre CPI envolvendo denúncias contra tucanos em MG e DF.', 'verified', false, '2012-03-26', 'https://www1.folha.uol.com.br/poder/1063312-dilma-cpi-mensalao-tucano.shtml', 'news_article', 1, 'Palácio do Planalto', 'Entrevista', 'dilma-cpi-mensalao-tucano-b94-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro nega racismo em caso "galho mais alto da árvore".', 'Nunca fui racista. Só defendi a meritocracia.', 'Resposta a críticas após declarações sobre quilombolas e negros.', 'verified', false, '2014-04-10', 'https://oglobo.globo.com/politica/bolsonaro-nega-racismo-galho-12189821', 'news_article', 4, 'Rio de Janeiro', 'Entrevista TV', 'bolsonaro-nega-racismo-b94-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha compra apoio de pequenos partidos para presidência da Câmara.', 'Estamos conversando com todos. Vou construir a maior coalizão da história.', 'Articulação de Cunha comprando apoio de partidos nanicos com cargos antes da eleição em fevereiro.', 'verified', true, '2014-12-20', 'https://www1.folha.uol.com.br/poder/2014/12/1566621-cunha-apoio-nanicos-presidencia-camara.shtml', 'news_article', 4, 'Brasília', 'Bastidores Câmara', 'cunha-apoio-nanicos-camara-b94-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma toma posse em segundo mandato defendendo "nova matriz econômica".', 'Vamos continuar transformando o Brasil com inclusão social e ajuste.', 'Discurso de posse de Dilma em 1 de janeiro de 2015 - encerra janela 2014.', 'verified', true, '2014-12-31', 'https://g1.globo.com/politica/noticia/2014/12/governo-dilma-balanco-ano-2014.html', 'news_article', 1, 'Brasília', 'Balanço fim de ano', 'dilma-balanco-fim-2014-b94-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
