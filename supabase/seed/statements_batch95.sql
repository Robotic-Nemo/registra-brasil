-- Batch 95: Dilma I + early Dilma II era (Jan 2011 - Dec 2014) - Part 2
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
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma lança PAC 2 prometendo 955 bilhões de reais em investimentos.', 'O PAC 2 vai mudar o Brasil. Mais investimento, mais emprego, mais crescimento.', 'Lançamento do Programa de Aceleração do Crescimento na segunda edição com Dilma presidente.', 'verified', false, '2011-03-29', 'https://g1.globo.com/politica/noticia/2011/03/dilma-lanca-pac-2.html', 'news_article', 1, 'Palácio do Planalto', 'Lançamento PAC 2', 'dilma-pac2-lancamento-b95-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula é diagnosticado com câncer na laringe em outubro de 2011.', 'Vou vencer esse câncer como venci outras lutas. Saio disso vivo.', 'Lula anuncia diagnóstico ao público em entrevista no Sírio-Libanês, início de tratamento.', 'verified', true, '2011-10-29', 'https://www1.folha.uol.com.br/poder/993333-lula-tem-cancer-laringe.shtml', 'news_article', 1, 'São Paulo', 'Comunicado Hospital Sírio-Libanês', 'lula-cancer-laringe-2011-b95-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma demite ministro do Turismo Pedro Novais por escândalo.', 'Não admito mau uso de dinheiro público. O ministro saiu.', 'Demissão de Pedro Novais após denúncia de uso de funcionários fantasmas no gabinete.', 'verified', false, '2011-09-14', 'https://oglobo.globo.com/politica/pedro-novais-deixa-ministerio-turismo-2694512', 'news_article', 1, 'Palácio do Planalto', 'Decisão presidencial', 'dilma-demite-pedro-novais-b95-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma demite Orlando Silva dos Esportes por escândalo da Timemania.', 'Independência dos poderes. A decisão foi dele sair.', 'Quarta demissão na faxina ética de Dilma, envolvendo ministério dos Esportes.', 'verified', false, '2011-10-26', 'https://g1.globo.com/politica/noticia/2011/10/orlando-silva-pede-demissao-esportes.html', 'news_article', 1, 'Palácio do Planalto', 'Comunicado oficial', 'dilma-demite-orlando-silva-b95-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende que casal gay não poderia adotar em audiência.', 'Criança adotada por casal gay vira bagunça. Deveria ser proibido.', 'Manifestação de Bolsonaro em audiência pública na Câmara em 2012.', 'verified', false, '2012-06-06', 'https://www.cartacapital.com.br/politica/bolsonaro-adocao-gay-audiencia/', 'news_article', 4, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-adocao-gay-b95-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma celebra decisão do STF sobre reconhecimento da união homoafetiva.', 'É uma decisão histórica que reconhece direitos iguais.', 'Declaração de Dilma após STF reconhecer união estável entre pessoas do mesmo sexo.', 'verified', false, '2011-05-06', 'https://g1.globo.com/politica/noticia/2011/05/dilma-celebra-uniao-homoafetiva-stf.html', 'news_article', 1, 'Palácio do Planalto', 'Declaração oficial', 'dilma-uniao-homoafetiva-stf-b95-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio trata Dilma como "senhora" em primeiro debate presidencial.', 'A senhora, presidenta, tem que responder a essa questão de corrupção.', 'Tratamento formal usado por Aécio em debate que gerou polêmica de gênero.', 'verified', false, '2014-08-26', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1508821-aecio-senhora-dilma-debate.shtml', 'news_article', 2, 'São Paulo', 'Debate Band TV', 'aecio-senhora-dilma-debate-b95-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro Gomes critica Marina Silva por "misticismo" na campanha.', 'A Marina vive no misticismo. Não pode governar o Brasil.', 'Ciro Gomes, em palestra, atacou Marina Silva quando ela subia nas pesquisas em 2014.', 'verified', false, '2014-09-04', 'https://www.istoe.com.br/ciro-marina-misticismo/', 'news_article', 3, 'Fortaleza', 'Palestra', 'ciro-marina-misticismo-b95-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro critica Lei Maria da Penha e diz que "beneficia vadias".', 'A Maria da Penha virou privilégio. Muita mulher é vadia e mente.', 'Declaração em entrevista de 2013 ao Yahoo Notícias sobre a lei de proteção às mulheres.', 'verified', true, '2013-10-22', 'https://www.cartacapital.com.br/politica/bolsonaro-maria-penha-vadias/', 'news_article', 5, 'Brasília', 'Entrevista Yahoo', 'bolsonaro-maria-penha-vadias-b95-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma acusa oposição de usar crise institucional contra ela.', 'Querem golpear a democracia. Não vão passar.', 'Reação ao aparente uso político de investigações na campanha eleitoral de 2014.', 'verified', false, '2014-09-20', 'https://www.cartacapital.com.br/politica/dilma-golpe-2014/', 'news_article', 2, 'Brasília', 'Comício Ceilândia', 'dilma-golpe-oposicao-b95-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra perde eleição para Haddad e atribui à "máquina petista".', 'Fui vencido pela máquina do PT e da Presidência.', 'Declaração de Serra na Globo após derrota para Haddad no primeiro turno de SP em 2012.', 'verified', false, '2012-10-08', 'https://oglobo.globo.com/politica/serra-derrotado-haddad-maquina-pt-6385812', 'news_article', 2, 'São Paulo', 'Coletiva pós-eleição', 'serra-derrota-haddad-maquina-b95-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad toma posse como prefeito de SP e promete priorizar transporte.', 'Transporte público será prioridade absoluta.', 'Discurso de posse de Fernando Haddad como prefeito de São Paulo em janeiro de 2013.', 'verified', true, '2013-01-01', 'https://g1.globo.com/sao-paulo/noticia/2013/01/haddad-toma-posse-prefeitura-sao-paulo.html', 'news_article', 1, 'Câmara Municipal de SP', 'Posse prefeito', 'haddad-posse-sp-2013-b95-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula faz palestras pagas em empresas durante o governo Dilma.', 'Sou palestrante. Trabalho como qualquer outro profissional.', 'Lula defendeu remuneração por palestras feitas em empreiteiras durante o mandato de Dilma.', 'verified', true, '2013-11-20', 'https://www1.folha.uol.com.br/poder/2013/11/1370121-lula-palestras-pagas-empreiteiras.shtml', 'news_article', 4, 'São Paulo', 'Entrevista Folha', 'lula-palestras-pagas-empreiteiras-b95-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma nega ter conhecido irregularidades na Petrobras.', 'Eu não sabia de nada. Quando soube, mandei investigar.', 'Declaração de Dilma em entrevista à Globo News sobre esquema de propinas na Petrobras.', 'verified', true, '2014-12-10', 'https://g1.globo.com/politica/noticia/2014/12/dilma-nega-saber-petrobras.html', 'news_article', 3, 'Palácio do Planalto', 'Entrevista Globo News', 'dilma-nega-saber-petrobras-b95-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro defende pena de morte e redução da maioridade penal.', 'Bandido bom é bandido morto. Pena de morte já.', 'Discurso de Bolsonaro em plenário defendendo pena de morte como solução para criminalidade.', 'verified', false, '2012-09-19', 'https://g1.globo.com/politica/noticia/2012/09/bolsonaro-defende-pena-de-morte-camara.html', 'news_article', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-pena-morte-camara-b95-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf é condenado por lavagem de dinheiro em NY.', 'Essa decisão americana é absurda. Sou vítima de injustiça.', 'Resposta de Maluf após tribunal de NY confirmar sua responsabilidade por lavagem.', 'verified', false, '2014-06-12', 'https://oglobo.globo.com/politica/maluf-condenacao-ny-lavagem-12841211', 'news_article', 3, 'São Paulo', 'Nota oficial', 'maluf-condenado-ny-b95-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan é denunciado pela PGR por fraude fiscal no caso Murad.', 'São denúncias antigas e vou provar minha inocência.', 'Renan Calheiros foi denunciado pela PGR em novembro de 2013 envolvendo empresário Mendes Júnior.', 'verified', false, '2013-11-13', 'https://www1.folha.uol.com.br/poder/2013/11/1371812-renan-denunciado-pgr-murad.shtml', 'news_article', 4, 'Brasília', 'Nota oficial', 'renan-denunciado-pgr-b95-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma anuncia plebiscito por reforma política durante protestos.', 'Vamos consultar o povo sobre reforma política. É democracia direta.', 'Proposta de Dilma lançada durante Jornadas de Junho que depois foi engavetada.', 'verified', false, '2013-06-24', 'https://g1.globo.com/politica/noticia/2013/06/dilma-propoe-plebiscito-reforma-politica.html', 'news_article', 1, 'Palácio do Planalto', 'Reunião com governadores', 'dilma-plebiscito-reforma-politica-b95-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha defende Estatuto da Família excluindo casais homossexuais.', 'Família é pai, mãe e filhos. Não vamos acolher outros modelos.', 'Defesa de Cunha, relator do projeto na Câmara, excluindo união homoafetiva do conceito de família.', 'verified', true, '2013-11-06', 'https://www1.folha.uol.com.br/poder/2013/11/1365212-cunha-estatuto-familia-gay.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Relatoria PL Estatuto', 'cunha-estatuto-familia-gay-b95-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_silas, 'Silas Câmara articula projeto de "Dia do Orgulho Cristão" no Brasil.', 'Queremos celebrar os valores cristãos. É dia de reafirmar a fé.', 'Projeto de Silas Câmara na Câmara em resposta à Parada Gay e debate sobre laicidade.', 'verified', false, '2012-07-12', 'https://g1.globo.com/politica/noticia/2012/07/silas-camara-dia-orgulho-cristao.html', 'news_article', 2, 'Câmara dos Deputados', 'Apresentação de PL', 'silas-orgulho-cristao-b95-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma chama Eduardo Campos de "homem de boa fé" em 2014.', 'Eduardo é um homem de bem. Lamento profundamente sua morte.', 'Declaração após tragédia aérea que matou Eduardo Campos em campanha presidencial.', 'verified', true, '2014-08-13', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1500912-dilma-homenagem-eduardo-campos.shtml', 'news_article', 1, 'Brasília', 'Nota oficial', 'dilma-eduardo-campos-morte-b95-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio acusa Dilma de usar PF para intimidar opositores.', 'A PF está sendo usada para perseguir a oposição.', 'Aécio denunciou na reta final de 2014 uso político da Polícia Federal em investigações.', 'verified', false, '2014-10-20', 'https://oglobo.globo.com/politica/eleicoes-2014/aecio-acusa-dilma-pf-14312112', 'news_article', 3, 'Brasília', 'Coletiva de imprensa', 'aecio-dilma-pf-intimidacao-b95-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula chama derrota de Aécio de "vitória do povo" em 2014.', 'A vitória do povo derrotou o candidato da elite.', 'Declaração de Lula em evento da CUT celebrando reeleição apertada de Dilma.', 'verified', false, '2014-11-01', 'https://www.cartacapital.com.br/politica/lula-vitoria-povo-dilma-2014/', 'news_article', 1, 'São Paulo', 'Ato da CUT', 'lula-vitoria-povo-b95-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama Dilma de "Manchuriana" em redes sociais.', 'A candidata Manchuriana vai destruir o Brasil.', 'Apelido pejorativo usado por Bolsonaro para Dilma durante campanha de 2014.', 'verified', false, '2014-08-30', 'https://oglobo.globo.com/politica/bolsonaro-manchuriana-dilma-13891234', 'news_article', 3, 'Rio de Janeiro', 'Redes sociais', 'bolsonaro-dilma-manchuriana-b95-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro prende primeiro diretor da Petrobras na Lava Jato.', 'A prisão é necessária para a instrução criminal. Os indícios são fortes.', 'Moro decretou prisão do ex-diretor Paulo Roberto Costa na primeira fase dedicada à Petrobras.', 'verified', true, '2014-05-20', 'https://www.gazetadopovo.com.br/vida-publica/paulo-roberto-costa-preso-lava-jato/', 'news_article', 1, 'Curitiba', 'Operação Bidone', 'moro-paulo-roberto-costa-preso-b95-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi defende Dilma contra críticas à gestão em reunião ministerial.', 'A presidenta está fazendo o que Brasil precisa. Vamos unidos.', 'Declaração de Gleisi Hoffmann em defesa enérgica de Dilma durante reuniões em 2013.', 'verified', false, '2013-10-01', 'https://g1.globo.com/politica/noticia/2013/10/gleisi-defende-dilma-reforma.html', 'news_article', 1, 'Palácio do Planalto', 'Reunião ministerial', 'gleisi-defende-dilma-2013-b95-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_temer, 'Temer participa de articulações paralelas com oposição em 2014.', 'São conversas naturais entre parlamentares.', 'Revelação de encontros de Temer com opositores em 2014 que gerou desconfiança da base petista.', 'verified', false, '2014-12-02', 'https://www1.folha.uol.com.br/poder/2014/12/1561112-temer-articula-oposicao.shtml', 'news_article', 3, 'Brasília', 'Reuniões paralelas', 'temer-articula-oposicao-b95-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma afirma que reajustes no Bolsa Família são compromisso do mandato.', 'Vamos aumentar o Bolsa Família. Não vou abandonar o mais pobre.', 'Dilma anuncia reajuste do Bolsa Família em ano eleitoral de 2014.', 'verified', false, '2014-05-01', 'https://g1.globo.com/politica/noticia/2014/05/dilma-reajuste-bolsa-familia.html', 'news_article', 1, 'Palácio do Planalto', '1º de Maio', 'dilma-reajuste-bolsa-familia-b95-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio Neves é acusado de assédio pela ex-assessora Andréa Neves.', 'É calúnia. Nunca pratiquei nenhum tipo de assédio.', 'Resposta de Aécio a matéria da Folha sobre tratamento dispensado a assessoras no governo de MG.', 'verified', false, '2014-09-12', 'https://www1.folha.uol.com.br/poder/eleicoes2014/2014/09/1515512-aecio-denuncias-assedio.shtml', 'news_article', 3, 'Belo Horizonte', 'Entrevista', 'aecio-denuncias-assedio-b95-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor vota a favor de CPI mas minimiza suas próprias contas irregulares.', 'Meu voto é técnico. Não tenho nada a temer.', 'Voto de Collor em CPI no Senado em 2013 apesar de ter suas próprias contas rejeitadas.', 'verified', false, '2013-09-18', 'https://www12.senado.leg.br/noticias/materias/2013/09/18/collor-vota-cpi', 'news_article', 3, 'Senado Federal', 'Sessão CPI', 'collor-voto-cpi-senado-b95-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro xinga presidente do BNDES de "incompetente".', 'O BNDES virou caixa do PT. A Luciano Coutinho é incompetente.', 'Ataque em plenário contra presidente do BNDES durante CPI em 2012.', 'verified', false, '2012-04-03', 'https://www1.folha.uol.com.br/poder/1069812-bolsonaro-ataca-bndes-coutinho.shtml', 'news_article', 3, 'Câmara dos Deputados', 'CPI do BNDES', 'bolsonaro-bndes-coutinho-b95-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete pacto nacional pela educação após protestos.', 'Vamos fazer o maior pacto pela educação da história. 10% do PIB.', 'Anúncio de Dilma em rede nacional após Jornadas de Junho prometendo reformas.', 'verified', true, '2013-06-24', 'https://g1.globo.com/politica/noticia/2013/06/dilma-pacto-nacional-protestos.html', 'news_article', 1, 'Palácio do Planalto', 'Pronunciamento rede nacional', 'dilma-pacto-nacional-protestos-b95-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha é eleito líder do PMDB na Câmara para articular oposição.', 'Sou líder escolhido pelos pares. Vou defender o Congresso.', 'Cunha consolida poder ao assumir liderança do PMDB na Câmara em 2013.', 'verified', false, '2013-02-19', 'https://www1.folha.uol.com.br/poder/2013/02/1233918-cunha-lider-pmdb-camara.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Eleição de liderança', 'cunha-lider-pmdb-camara-b95-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin defende ação da PM na Vila Sônia durante protestos.', 'A PM agiu corretamente. Os manifestantes foram violentos.', 'Defesa de Alckmin à ação policial que feriu jornalistas da Folha em junho de 2013.', 'verified', true, '2013-06-14', 'https://www1.folha.uol.com.br/cotidiano/2013/06/1295212-alckmin-defende-pm-jornalistas.shtml', 'news_article', 3, 'São Paulo', 'Coletiva de imprensa', 'alckmin-pm-vila-sonia-b95-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma nomeia Guido Mantega por lealdade mesmo com queda da popularidade.', 'Guido tem minha confiança. Vamos manter a política econômica.', 'Dilma mantém Guido Mantega na Fazenda apesar das pressões em 2014.', 'verified', false, '2014-06-10', 'https://www.valor.com.br/politica/dilma-mantega-lealdade-3569123', 'news_article', 2, 'Palácio do Planalto', 'Entrevista', 'dilma-mantem-mantega-b95-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula vai à Copa 2014 e critica vaias como "falta de educação".', 'Vaia em mulher não é educado. O povo tem que respeitar a presidenta.', 'Lula reagiu a vaias contra Dilma na abertura da Copa de 2014 no Itaquerão.', 'verified', false, '2014-06-14', 'https://oglobo.globo.com/esportes/copa-2014/lula-critica-vaias-dilma-copa-12945123', 'news_article', 2, 'São Paulo', 'Entrevista na Copa', 'lula-vaias-dilma-copa-b95-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio nega envolvimento no escândalo da Furnas.', 'Nunca tive qualquer envolvimento com Furnas. É mentira.', 'Resposta de Aécio a matéria da IstoÉ sobre propinas em contratos com Furnas em MG.', 'verified', false, '2014-09-18', 'https://www.istoe.com.br/aecio-furnas-escandalo/', 'news_article', 3, 'Belo Horizonte', 'Coletiva de imprensa', 'aecio-furnas-nega-b95-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro articula criação do "Partido da Ordem" em 2014.', 'Queremos um novo partido para defender a família e a ordem.', 'Primeiras articulações de Bolsonaro para deixar PP e criar nova legenda em 2014.', 'verified', false, '2014-11-10', 'https://www.cartacapital.com.br/politica/bolsonaro-partido-ordem-2014/', 'news_article', 3, 'Brasília', 'Bastidores Câmara', 'bolsonaro-partido-ordem-b95-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan reage a pedido de cassação de seu mandato.', 'Não houve enriquecimento ilícito. Os bens têm origem lícita.', 'Resposta de Renan a pedido do PSOL de cassação por improbidade, arquivado em 2014.', 'verified', false, '2014-03-12', 'https://www12.senado.leg.br/noticias/materias/2014/03/12/renan-reage-cassacao', 'news_article', 3, 'Senado Federal', 'Entrevista', 'renan-cassacao-reage-b95-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma defende Belo Monte apesar de protestos indígenas.', 'A obra vai sair. A energia é fundamental para o país.', 'Declaração de Dilma em pressão sobre continuidade de Belo Monte após manifestações indígenas.', 'verified', false, '2012-05-15', 'https://g1.globo.com/politica/noticia/2012/05/dilma-defende-belo-monte.html', 'news_article', 2, 'Brasília', 'Cerimônia oficial', 'dilma-defende-belo-monte-b95-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad instala faixas de ônibus contra a vontade do setor privado.', 'Vamos fazer as faixas. A cidade vai agradecer.', 'Declaração do prefeito sobre implantação de corredores de ônibus em SP em 2013.', 'verified', false, '2013-05-22', 'https://g1.globo.com/sao-paulo/noticia/2013/05/haddad-faixas-onibus-sao-paulo.html', 'news_article', 1, 'São Paulo', 'Coletiva Prefeitura', 'haddad-faixas-onibus-b95-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC compara governo Dilma a bolivarianismo.', 'Dilma está tomando caminho bolivariano. É um risco para o Brasil.', 'Artigo de FHC comparando Dilma a Chávez/Maduro publicado em coluna semanal.', 'verified', false, '2014-07-05', 'https://www.estadao.com.br/politica/fhc-dilma-bolivarianismo-imp-,1222871', 'news_article', 3, 'São Paulo', 'Artigo Estadão', 'fhc-dilma-bolivarianismo-b95-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula defende obra do Maracanã para Copa de 2014.', 'O Maracanã ficou lindo. Valeu cada centavo investido.', 'Defesa pública dos gastos em reforma do estádio icônico do Rio às vésperas da Copa.', 'verified', false, '2013-06-02', 'https://oglobo.globo.com/esportes/lula-maracana-reforma-8637611', 'news_article', 1, 'Rio de Janeiro', 'Inauguração Maracanã', 'lula-maracana-reforma-b95-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete abrir CPI da Petrobras após eleição.', 'A CPI vai sair. O Brasil precisa conhecer a verdade.', 'Declaração de Dilma no dia seguinte à eleição de 2014, em meio à crise da Lava Jato.', 'verified', false, '2014-10-28', 'https://g1.globo.com/politica/noticia/2014/10/dilma-cpi-petrobras-pos-eleicao.html', 'news_article', 2, 'Palácio do Planalto', 'Coletiva pós-eleição', 'dilma-cpi-petrobras-eleicao-b95-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro promete votar para derrubar Lei Rouanet.', 'A Lei Rouanet paga privilegiados. Vou derrubar isso.', 'Promessa de Bolsonaro em discurso criticando incentivos culturais federais em 2014.', 'verified', false, '2014-07-24', 'https://www1.folha.uol.com.br/ilustrada/2014/07/1493812-bolsonaro-lei-rouanet.shtml', 'news_article', 2, 'Brasília', 'Discurso Câmara', 'bolsonaro-lei-rouanet-derrubar-b95-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_serra, 'Serra acusa Dilma de "aparelhar" estatais para campanha.', 'O PT usa estatais como comitê de campanha.', 'Ataque de Serra durante debate eleitoral após denúncias envolvendo Petrobras e Eletrobras.', 'verified', false, '2014-08-14', 'https://oglobo.globo.com/politica/eleicoes-2014/serra-aparelhamento-estatais-13571122', 'news_article', 2, 'São Paulo', 'Debate SBT', 'serra-aparelhamento-estatais-b95-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha entra em rota de colisão com Dilma em 2014.', 'Se a presidenta me enfrentar, vai ter dificuldades.', 'Ameaça de Cunha ao governo em entrevista no fim de 2014 que pré-sinalizava impeachment.', 'verified', true, '2014-12-10', 'https://www1.folha.uol.com.br/poder/2014/12/1561712-cunha-ameaca-dilma-2014.shtml', 'news_article', 4, 'Brasília', 'Entrevista Folha', 'cunha-ameaca-dilma-2014-b95-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_marta, 'Marta Suplicy pede afastamento do PT após rompimento.', 'Saio do PT com tristeza. O partido não me representa mais.', 'Declaração de Marta em nota após deixar o ministério em 2014 e se afastar do PT.', 'verified', false, '2014-11-05', 'https://g1.globo.com/politica/noticia/2014/11/marta-suplicy-deixa-pt.html', 'news_article', 2, 'Brasília', 'Nota oficial', 'marta-deixa-pt-2014-b95-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sarney, 'Sarney defende foro privilegiado contra Lava Jato.', 'Foro privilegiado é cláusula pétrea. Não se mexe.', 'Declaração de Sarney em defesa de mecanismo que o protegia em meio a avanços investigativos.', 'verified', false, '2014-12-05', 'https://www12.senado.leg.br/noticias/materias/2014/12/05/sarney-foro-privilegiado', 'news_article', 3, 'Senado Federal', 'Discurso plenário', 'sarney-foro-privilegiado-b95-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro homologa delação de Alberto Youssef na Lava Jato.', 'A colaboração é fundamental para desmontar o esquema.', 'Moro homologou acordo de delação do doleiro Youssef, ampliando escopo da Lava Jato.', 'verified', true, '2014-10-21', 'https://g1.globo.com/politica/noticia/2014/10/moro-homologa-delacao-youssef.html', 'news_article', 1, 'Curitiba', 'Audiência Lava Jato', 'moro-homologa-youssef-b95-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma recusa acordo com Cunha sobre presidência da Câmara.', 'Não vou negociar com Cunha. Minha base tem candidato próprio.', 'Recusa de Dilma em apoiar Cunha, abrindo crise com o PMDB em 2014/2015.', 'verified', true, '2014-12-18', 'https://www1.folha.uol.com.br/poder/2014/12/1566112-dilma-recusa-cunha-camara.shtml', 'news_article', 3, 'Palácio do Planalto', 'Bastidores Planalto', 'dilma-recusa-cunha-camara-b95-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que índios deveriam "se integrar" e defende demarcação nula.', 'Índio tem que se integrar, não ficar em reserva.', 'Discurso de Bolsonaro em plenário da Câmara contra demarcação de terras indígenas em 2013.', 'verified', false, '2013-04-18', 'https://www.cartacapital.com.br/politica/bolsonaro-indios-integrar/', 'news_article', 4, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-indios-integrar-b95-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio pede recontagem digital após perder segundo turno.', 'Há indícios de problemas nas urnas. Vamos auditar.', 'Pedido formal de auditoria nas urnas após derrota, alimentando teorias conspiratórias.', 'verified', true, '2014-10-30', 'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/psdb-pede-auditoria-urnas.html', 'news_article', 4, 'Brasília', 'Pedido ao TSE', 'aecio-auditoria-urnas-b95-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fhc, 'FHC apoia pedido de auditoria das urnas pelo PSDB.', 'Não há nada de errado em auditar. É direito democrático.', 'FHC apoiou tentativa de Aécio de contestar resultado das urnas em 2014.', 'verified', false, '2014-11-01', 'https://www.estadao.com.br/politica/fhc-apoia-auditoria-urnas-imp-,1547612', 'news_article', 3, 'São Paulo', 'Artigo Estadão', 'fhc-auditoria-urnas-b95-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan diz que STF "legisla demais" e critica decisão sobre lei.', 'O STF está legislando. Isso extrapola suas atribuições.', 'Renan criticou o STF em audiência após série de decisões polêmicas contra o Legislativo.', 'verified', false, '2013-10-24', 'https://www12.senado.leg.br/noticias/materias/2013/10/24/renan-stf-legisla', 'news_article', 3, 'Senado Federal', 'Entrevista', 'renan-stf-legisla-demais-b95-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma inaugura arena da Copa em Cuiabá com protestos.', 'Os estádios são patrimônio do povo brasileiro.', 'Dilma inaugura Arena Pantanal em Cuiabá em meio a protestos contra os gastos.', 'verified', false, '2014-05-24', 'https://g1.globo.com/mt/mato-grosso/copa-do-mundo/2014/noticia/2014/05/dilma-arena-pantanal.html', 'news_article', 1, 'Cuiabá', 'Inauguração Arena Pantanal', 'dilma-arena-pantanal-b95-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad recorre a empréstimos internacionais para SP em 2014.', 'Precisamos do empréstimo para obras essenciais na cidade.', 'Haddad prefeito negociou empréstimos com BID e Banco Mundial para obras em SP em 2014.', 'verified', false, '2014-06-20', 'https://www1.folha.uol.com.br/cotidiano/2014/06/1470312-haddad-emprestimos-bid-sao-paulo.shtml', 'news_article', 1, 'São Paulo', 'Coletiva Prefeitura', 'haddad-emprestimos-bid-b95-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro chama alunos da USP de "vagabundos" em discurso.', 'Esses estudantes são vagabundos. Não querem trabalhar.', 'Discurso de Bolsonaro em 2013 criticando ocupação estudantil em universidades públicas.', 'verified', false, '2013-11-07', 'https://oglobo.globo.com/politica/bolsonaro-estudantes-vagabundos-10817211', 'news_article', 3, 'Câmara dos Deputados', 'Plenário', 'bolsonaro-usp-vagabundos-b95-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma celebra Copa 2014 como "boa Copa" apesar do 7x1.', 'A Copa foi bem organizada. O 7x1 é do futebol, não do Brasil.', 'Declaração de Dilma em coletiva após final da Copa de 2014, buscando superar a derrota.', 'verified', true, '2014-07-15', 'https://g1.globo.com/politica/noticia/2014/07/dilma-copa-7x1-brasil.html', 'news_article', 1, 'Palácio do Planalto', 'Coletiva pós-Copa', 'dilma-copa-71-coletiva-b95-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor apoia Dilma em 2014 e pede moeda única do Mercosul.', 'Apoio Dilma. Vamos em direção à moeda do Mercosul.', 'Declaração de Collor em entrevista apoiando Dilma no segundo turno da eleição 2014.', 'verified', false, '2014-10-15', 'https://oglobo.globo.com/politica/eleicoes-2014/collor-apoia-dilma-14199281', 'news_article', 1, 'Maceió', 'Entrevista TV Globo', 'collor-apoia-dilma-2014-b95-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha apresenta PL para criminalizar "homofobia ao avesso".', 'Precisamos de lei contra quem ataca heterossexuais.', 'Iniciativa de Cunha para criar crime contra críticas a heterossexualidade, retaliação ao PLC 122.', 'verified', false, '2013-12-12', 'https://www1.folha.uol.com.br/poder/2013/12/1385212-cunha-pl-homofobia-ao-avesso.shtml', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de PL', 'cunha-homofobia-avesso-b95-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma chama Aécio de "príncipe" em campanha eleitoral.', 'Aécio é o príncipe. Não sabe falar com o povo trabalhador.', 'Ataque de Dilma em Caravana do PT em campanha de 2014, classismo no discurso.', 'verified', false, '2014-09-23', 'https://www.cartacapital.com.br/politica/dilma-aecio-principe/', 'news_article', 2, 'Recife', 'Comício PT', 'dilma-aecio-principe-b95-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ciro, 'Ciro diz que "Dilma não sabe governar" em 2014.', 'A Dilma não sabe governar. Está destruindo o PT.', 'Ataque ácido de Ciro à gestão Dilma em entrevista em abril de 2014.', 'verified', false, '2014-04-08', 'https://www.istoe.com.br/ciro-dilma-nao-sabe-governar/', 'news_article', 3, 'Fortaleza', 'Entrevista ISTOÉ', 'ciro-dilma-nao-governa-b95-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro aprova tortura em defesa da "segurança nacional".', 'Tortura é legítima quando defende a pátria.', 'Defesa de Bolsonaro em audiência pública na CPI da ditadura em 2012.', 'verified', true, '2012-03-28', 'https://www.cartacapital.com.br/politica/bolsonaro-tortura-legitima-2012/', 'news_article', 5, 'Câmara dos Deputados', 'CPI da Ditadura', 'bolsonaro-tortura-legitima-b95-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula articula aliança PT-PMDB para continuidade de Dilma.', 'O PMDB é aliado histórico. Vamos manter a base unida.', 'Articulação de Lula nos bastidores em 2014 para manter PMDB na base com Temer no comando.', 'verified', false, '2014-06-15', 'https://www1.folha.uol.com.br/poder/2014/06/1470812-lula-pmdb-alianca-2014.shtml', 'news_article', 2, 'São Paulo', 'Bastidores Instituto Lula', 'lula-alianca-pt-pmdb-b95-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_maluf, 'Maluf tenta disputar eleição e é barrado pela Ficha Limpa.', 'Ficha Limpa é injusta. Estou pagando por erro antigo.', 'Reação de Maluf à decisão que o impediu de concorrer a deputado em 2014.', 'verified', false, '2014-07-02', 'https://g1.globo.com/sp/sao-paulo/eleicoes/2014/noticia/2014/07/maluf-barrado-ficha-limpa.html', 'news_article', 3, 'São Paulo', 'Coletiva', 'maluf-barrado-ficha-limpa-b95-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jefferson, 'Jefferson é preso para cumprir pena do mensalão.', 'Meu caso vai para a história. Fui perseguido por falar demais.', 'Jefferson começou a cumprir pena no mensalão após decisão final do STF em 2013.', 'verified', true, '2013-11-15', 'https://g1.globo.com/politica/mensalao/noticia/2013/11/roberto-jefferson-inicia-cumprimento-pena.html', 'news_article', 2, 'Rio de Janeiro', 'Início de pena', 'jefferson-preso-mensalao-b95-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma recebe Papa Francisco em evento da JMJ 2013.', 'Sua visita é uma honra para o Brasil. Bem-vindo.', 'Recepção oficial de Dilma ao Papa Francisco durante Jornada Mundial da Juventude no Rio.', 'verified', false, '2013-07-22', 'https://g1.globo.com/jmj/2013/noticia/2013/07/papa-francisco-jmj-rio-dilma.html', 'news_article', 1, 'Palácio Guanabara', 'Visita papal JMJ 2013', 'dilma-papa-francisco-jmj-b95-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alckmin, 'Alckmin nega crise hídrica até dias antes do racionamento.', 'Não vai faltar água em São Paulo. Fique tranquilo.', 'Declaração de Alckmin minimizando crise hídrica em março de 2014 durante campanha eleitoral.', 'verified', true, '2014-03-11', 'https://www1.folha.uol.com.br/cotidiano/2014/03/1426212-alckmin-nega-crise-hidrica.shtml', 'news_article', 4, 'São Paulo', 'Coletiva de imprensa', 'alckmin-nega-crise-hidrica-b95-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_irr, false FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora derrota do PT em estados em 2012.', 'O PT perdeu. O Brasil começa a abrir os olhos.', 'Comentário em redes sociais após resultado das eleições municipais de 2012.', 'verified', false, '2012-10-07', 'https://www1.folha.uol.com.br/poder/1163122-bolsonaro-derrota-pt-eleicoes.shtml', 'news_article', 2, 'Rio de Janeiro', 'Redes sociais', 'bolsonaro-comemora-derrota-pt-b95-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma promete "não mexer" em direitos trabalhistas.', 'Não vou mexer nos direitos do trabalhador. Podem confiar.', 'Promessa categórica de Dilma em 2014 contra alterações em leis trabalhistas.', 'verified', true, '2014-10-23', 'https://g1.globo.com/politica/eleicoes/2014/noticia/2014/10/dilma-promete-direitos-trabalhistas.html', 'news_article', 2, 'Brasília', 'Entrevista Rádio Bandeirantes', 'dilma-direitos-trabalhistas-b95-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio minimiza escândalo de mordomias em Minas Gerais.', 'São matérias sem fundamento. Nunca usei recursos de forma indevida.', 'Resposta a reportagem sobre uso de aeronave oficial por familiares em MG.', 'verified', false, '2014-09-25', 'https://veja.abril.com.br/politica/aecio-mordomias-minas-gerais/', 'news_article', 3, 'Belo Horizonte', 'Coletiva de imprensa', 'aecio-mordomias-mg-b95-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_abu, false FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vota contra PEC das Domésticas em 2012.', 'É um risco para famílias. Vai tirar empregos.', 'Voto de Bolsonaro contra a PEC que garantiu direitos a domésticas em 2012.', 'verified', false, '2012-12-18', 'https://g1.globo.com/politica/noticia/2012/12/bolsonaro-vota-contra-pec-domesticas.html', 'news_article', 3, 'Câmara dos Deputados', 'Votação PEC Domésticas', 'bolsonaro-contra-pec-domesticas-b95-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mac, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_haddad, 'Haddad encontra lixões clandestinos em SP e critica gestões anteriores.', 'A cidade virou um lixão. Vamos limpar São Paulo.', 'Crítica do prefeito às gestões tucanas anteriores por acúmulo de lixo clandestino na cidade.', 'verified', false, '2013-04-15', 'https://www1.folha.uol.com.br/cotidiano/2013/04/1265812-haddad-lixoes-clandestinos-sao-paulo.shtml', 'news_article', 1, 'São Paulo', 'Visita a lixões', 'haddad-lixoes-sp-b95-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha rejeita CPI da Petrobras de olho em barganha política.', 'A CPI só vai adiante quando houver interesse republicano.', 'Declaração de Cunha indicando uso da CPI como moeda de troca no fim de 2014.', 'verified', false, '2014-12-10', 'https://oglobo.globo.com/politica/cunha-cpi-petrobras-barganha-14987321', 'news_article', 4, 'Câmara dos Deputados', 'Entrevista Congresso', 'cunha-cpi-barganha-b95-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma veta iluminação do Planalto em homenagem ao STF após mensalão.', 'Respeito a independência dos poderes, mas não vou celebrar julgamento.', 'Decisão de Dilma de não se pronunciar publicamente sobre condenações do mensalão.', 'verified', false, '2012-12-18', 'https://www1.folha.uol.com.br/poder/1200112-dilma-mensalao-silencio.shtml', 'news_article', 2, 'Palácio do Planalto', 'Decisão presidencial', 'dilma-silencio-mensalao-b95-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro insulta jornalista chamando-a de "deslavada".', 'Essa jornalista é uma deslavada. Mentirosa profissional.', 'Ataque de Bolsonaro a jornalista durante entrevista em 2014.', 'verified', false, '2014-06-30', 'https://www.cartacapital.com.br/politica/bolsonaro-jornalista-deslavada-2014/', 'news_article', 3, 'Rio de Janeiro', 'Entrevista', 'bolsonaro-jornalista-deslavada-b95-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins UNION ALL SELECT id, c_mis, false FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula fala em "complô" da imprensa contra seu legado.', 'Tem complô internacional contra o Brasil e contra o PT.', 'Declaração de Lula em palestra em SP em 2014 sobre cobertura crítica da imprensa.', 'verified', false, '2014-10-08', 'https://veja.abril.com.br/politica/lula-complo-imprensa-2014/', 'news_article', 3, 'São Paulo', 'Palestra', 'lula-complo-imprensa-b95-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma inicia "nova matriz econômica" com desoneração setorial.', 'A desoneração vai salvar empregos na indústria.', 'Anúncio de desonerações fiscais da folha salarial em 2012 como parte de nova agenda.', 'verified', false, '2012-08-03', 'https://www.valor.com.br/politica/dilma-nova-matriz-economica-2821122', 'news_article', 1, 'Palácio do Planalto', 'Cerimônia econômica', 'dilma-nova-matriz-desoneracao-b95-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio acusa Dilma de "estelionato eleitoral" pós-eleição.', 'A presidenta cometeu estelionato eleitoral. Mentiu para o povo.', 'Ataque de Aécio a Dilma após anúncio de ajuste fiscal duro pós-eleição 2014.', 'verified', true, '2014-12-18', 'https://oglobo.globo.com/politica/aecio-estelionato-eleitoral-15127312', 'news_article', 3, 'Brasília', 'Entrevista O Globo', 'aecio-estelionato-eleitoral-b95-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que Dilma precisa de "psicólogo" e não de presidente.', 'A Dilma precisa de psicólogo, não de gabinete.', 'Ataque misógino de Bolsonaro à presidente no plenário da Câmara em 2014.', 'verified', false, '2014-04-02', 'https://www.cartacapital.com.br/politica/bolsonaro-dilma-psicologo/', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'bolsonaro-dilma-psicologo-b95-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_odi, false FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan barra projeto sobre investigação parlamentar.', 'Não aceito CPI sem o rito constitucional.', 'Renan barrou CPI solicitada pela oposição em 2014, usando regimento para protelar.', 'verified', false, '2014-11-06', 'https://www12.senado.leg.br/noticias/materias/2014/11/06/renan-barra-cpi', 'news_article', 3, 'Senado Federal', 'Presidência Senado', 'renan-barra-projeto-cpi-b95-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gleisi, 'Gleisi comemora eleição ao Senado e ataca Lava Jato.', 'A eleição prova que o povo está com a gente, apesar dos ataques.', 'Declaração de Gleisi após se eleger senadora pelo PR em 2014 em meio à Lava Jato.', 'verified', false, '2014-10-07', 'https://g1.globo.com/pr/parana/eleicoes/2014/noticia/2014/10/gleisi-eleita-senadora-parana.html', 'news_article', 2, 'Curitiba', 'Coletiva pós-eleição', 'gleisi-eleita-senadora-b95-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma minimiza denúncia de propina da SBM na Petrobras.', 'Estamos investigando a fundo. Quem errou vai pagar.', 'Resposta de Dilma a novas denúncias envolvendo contratos da Petrobras com SBM em 2014.', 'verified', false, '2014-03-07', 'https://www.valor.com.br/empresas/dilma-sbm-petrobras-propina-3483122', 'news_article', 2, 'Palácio do Planalto', 'Coletiva de imprensa', 'dilma-sbm-petrobras-b95-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha articula com empresários apoio à presidência da Câmara.', 'Conversei com todos os setores produtivos. O Congresso precisa ouvir o Brasil real.', 'Reuniões de Cunha com FIESP e CNI em dezembro de 2014 para buscar apoio à presidência.', 'verified', false, '2014-12-08', 'https://www1.folha.uol.com.br/mercado/2014/12/1563812-cunha-empresarios-apoio.shtml', 'news_article', 3, 'São Paulo', 'Reunião FIESP', 'cunha-empresarios-apoio-b95-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro diz que esquerda "inventou" racismo no Brasil.', 'No Brasil não tem racismo. É invenção da esquerda.', 'Declaração de Bolsonaro em audiência na Câmara sobre cotas raciais em 2012.', 'verified', true, '2012-07-18', 'https://oglobo.globo.com/politica/bolsonaro-racismo-invencao-esquerda-5458112', 'news_article', 4, 'Câmara dos Deputados', 'Audiência pública', 'bolsonaro-racismo-invencao-b95-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma sanciona Lei da Palmada apesar de críticas conservadoras.', 'Nenhuma criança pode sofrer violência como meio educativo.', 'Sanção de Dilma da lei Menino Bernardo em 2014 contra castigos físicos.', 'verified', false, '2014-06-26', 'https://g1.globo.com/politica/noticia/2014/06/dilma-sanciona-lei-palmada.html', 'news_article', 1, 'Palácio do Planalto', 'Sanção de lei', 'dilma-lei-palmada-b95-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_collor, 'Collor participa de articulação com Temer em 2014.', 'Conversamos sobre política. É natural entre parlamentares.', 'Encontros de Collor com Temer e outros articuladores no fim de 2014.', 'verified', false, '2014-12-12', 'https://oglobo.globo.com/politica/collor-temer-articulacao-15031112', 'news_article', 2, 'Brasília', 'Bastidores Congresso', 'collor-temer-articulacao-b95-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio deixa governo de Minas com obras inacabadas.', 'Deixamos obras em andamento que o sucessor vai concluir.', 'Balanço do mandato de Aécio como governador de MG, com polêmicas sobre obras paralisadas.', 'verified', false, '2011-04-12', 'https://www.istoe.com.br/aecio-obras-minas-inacabadas/', 'news_article', 2, 'Belo Horizonte', 'Entrevista ISTOÉ', 'aecio-obras-mg-inacabadas-b95-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lula, 'Lula critica Dilma por ajuste fiscal e alerta para queda na base.', 'A Dilma precisa ouvir o partido. O povo quer mais, não menos.', 'Conversa de Lula com Dilma após anúncio de ajuste fiscal duro com Levy em dezembro de 2014.', 'verified', true, '2014-12-22', 'https://www1.folha.uol.com.br/poder/2014/12/1568521-lula-critica-dilma-ajuste-fiscal.shtml', 'news_article', 3, 'São Paulo', 'Reunião Lula-Dilma', 'lula-dilma-ajuste-fiscal-b95-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha ironiza protestos contra ele na Câmara.', 'Essa gente não me intimida. Vou ser presidente mesmo.', 'Resposta sarcástica de Cunha a manifestações de oposição no Congresso em dezembro 2014.', 'verified', false, '2014-12-19', 'https://g1.globo.com/politica/noticia/2014/12/cunha-ironiza-protestos-camara.html', 'news_article', 3, 'Câmara dos Deputados', 'Coletiva de imprensa', 'cunha-ironiza-protestos-b95-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma anuncia Joaquim Levy para a Fazenda.', 'Levy é o nome certo para o momento. Vamos fazer o ajuste.', 'Dilma muda política econômica após eleição e anuncia Levy como guinada ortodoxa.', 'verified', true, '2014-11-27', 'https://www1.folha.uol.com.br/mercado/2014/11/1556912-dilma-levy-fazenda.shtml', 'news_article', 2, 'Palácio do Planalto', 'Anúncio ministerial', 'dilma-levy-fazenda-b95-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro compara movimento de juventude a "brigada vermelha".', 'Essa juventude petista é como brigada vermelha. Terroristas.', 'Ataque de Bolsonaro ao movimento estudantil em discurso no plenário da Câmara em 2013.', 'verified', false, '2013-08-14', 'https://www.cartacapital.com.br/politica/bolsonaro-juventude-brigada-vermelha/', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'bolsonaro-juventude-brigada-b95-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_renan, 'Renan minimiza críticas do TCU ao governo.', 'O TCU é instrumento técnico, não julga política.', 'Resposta de Renan ao TCU em 2014 sobre irregularidades em contas públicas.', 'verified', false, '2014-10-28', 'https://www12.senado.leg.br/noticias/materias/2014/10/28/renan-critica-tcu', 'news_article', 3, 'Senado Federal', 'Coletiva Senado', 'renan-minimiza-tcu-b95-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma faz discurso emocionado citando memórias de sua prisão.', 'Nunca voltaremos aos tempos sombrios. Nunca mais.', 'Discurso emocionado de Dilma na entrega do relatório da Comissão Nacional da Verdade.', 'verified', true, '2014-12-10', 'https://g1.globo.com/politica/noticia/2014/12/dilma-comissao-verdade-nunca-mais.html', 'news_article', 1, 'Palácio do Planalto', 'Entrega do relatório CNV', 'dilma-comissao-verdade-nunca-mais-b95-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_aecio, 'Aécio ataca Dilma com ironia sobre "passarinho".', 'A presidenta não tem medo de passarinho mas tem medo de debate.', 'Aécio usou frase célebre de Dilma contra ela em debate eleitoral na campanha 2014.', 'verified', false, '2014-10-24', 'https://www1.folha.uol.com.br/poder/eleicoes2014/1541212-aecio-passarinho-debate.shtml', 'news_article', 2, 'Rio de Janeiro', 'Debate Globo', 'aecio-passarinho-ironia-b95-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cunha, 'Cunha defende redução de idade penal para 16 anos.', 'Bandido de 16 anos é bandido igual. Tem que pagar.', 'Defesa de Cunha da PEC da redução da maioridade penal em 2013/2014.', 'verified', false, '2013-07-02', 'https://oglobo.globo.com/politica/cunha-maioridade-penal-reducao-8983121', 'news_article', 3, 'Câmara dos Deputados', 'Discurso plenário', 'cunha-maioridade-penal-b95-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vota contra o Estatuto da Igualdade Racial em 2010 e comenta em 2011.', 'Esse estatuto é racismo contra brancos. Absurdo.', 'Comentário posterior em palestra de Bolsonaro sobre voto contra o Estatuto da Igualdade Racial.', 'verified', false, '2011-11-14', 'https://www.cartacapital.com.br/politica/bolsonaro-igualdade-racial-2011/', 'news_article', 4, 'Rio de Janeiro', 'Palestra', 'bolsonaro-igualdade-racial-b95-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_moro, 'Moro anuncia novas fases da Lava Jato em final de 2014.', 'A operação é investigação de longa duração. Haverá novas fases.', 'Moro anuncia continuidade e expansão da Lava Jato em dezembro de 2014, prometendo mais fases.', 'verified', true, '2014-12-17', 'https://g1.globo.com/pr/parana/noticia/2014/12/moro-lava-jato-novas-fases.html', 'news_article', 2, 'Curitiba', 'Coletiva MPF/PF', 'moro-lava-jato-novas-fases-b95-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dilma, 'Dilma faz discurso de fim de ano apelando à unidade nacional.', 'O Brasil é maior que nossas divisões. Em 2015 vamos superar.', 'Discurso de fim de ano de 2014 de Dilma em meio a tensões políticas e crise econômica iminente.', 'verified', true, '2014-12-31', 'https://www1.folha.uol.com.br/poder/2014/12/1571812-dilma-discurso-fim-ano-2014.shtml', 'news_article', 1, 'Palácio do Planalto', 'Pronunciamento de fim de ano', 'dilma-discurso-fim-ano-2014-b95-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

END $$;
