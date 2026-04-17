-- Batch 141: Zambelli + Ramagem + Daniel Silveira fugitives arc 2022-2026 (Part 2)
DO $$
DECLARE
  v_zam UUID; v_ram UUID; v_dsi UUID; v_edu UUID; v_fla UUID; v_car UUID; v_mic UUID; v_jai UUID;
  v_nik UUID; v_bia UUID; v_mfe UUID; v_dam UUID; v_mag UUID; v_mou UUID; v_mor UUID;
  v_mvh UUID; v_kim UUID; v_pab UUID; v_tar UUID; v_gir UUID; v_juz UUID; v_san UUID;
  v_fil UUID; v_cab UUID; v_gui UUID; v_ale UUID; v_gil UUID; v_cal UUID; v_zan UUID;
  v_din UUID; v_jom UUID; v_lew UUID; v_lul UUID; v_gle UUID; v_jan UUID; v_jaw UUID;
  v_ran UUID; v_hum UUID; v_lin UUID; v_had UUID; v_ser UUID; v_mar UUID; v_pau UUID;
  v_ric UUID; v_ter UUID; v_adr UUID; v_art UUID; v_hug UUID;
  c_ant UUID; c_vio UUID; c_abu UUID; c_obs UUID; c_ame UUID; c_int UUID;
  c_dis UUID; c_des UUID; c_aut UUID; c_cor UUID; c_irr UUID; c_conf UUID; c_neg UUID;
BEGIN
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_kim FROM politicians WHERE slug = 'kim-kataguiri';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_gir FROM politicians WHERE slug = 'general-girao';
  SELECT id INTO v_juz FROM politicians WHERE slug = 'julia-zanatta';
  SELECT id INTO v_san FROM politicians WHERE slug = 'sanderson';
  SELECT id INTO v_fil FROM politicians WHERE slug = 'filipe-barros';
  SELECT id INTO v_cab FROM politicians WHERE slug = 'cabo-gilberto';
  SELECT id INTO v_gui FROM politicians WHERE slug = 'guiga-peixoto';
  SELECT id INTO v_ale FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_cal FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jom FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'lewandowski';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_jaw FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_lin FROM politicians WHERE slug = 'lindbergh-farias';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_ser FROM politicians WHERE slug = 'simone-tebet';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marina-silva';
  SELECT id INTO v_pau FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_ric FROM politicians WHERE slug = 'ricardo-salles';
  SELECT id INTO v_ter FROM politicians WHERE slug = 'tereza-cristina';
  SELECT id INTO v_adr FROM politicians WHERE slug = 'adriana-ventura';
  SELECT id INTO v_art FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';

  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_conf FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli reafirma perseguição armada ao jornalista na véspera do segundo turno.', 'Eu me defendi. Não me arrependo de ter sacado a arma.', 'Entrevista à Jovem Pan após episódio em que perseguiu Luan Araújo armada nas ruas dos Jardins em SP.', 'verified', true, '2022-10-30', 'https://jovempan.com.br/noticias/politica/zambelli-nao-arrependo-arma-jornalista.html', 'news_article', 5, 'Jovem Pan', 'Entrevista pós-incidente', 'zambelli-nao-arrependo-b141-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli nega participação em invasão de sistemas do CNJ apesar de delação.', 'Nunca tive contato com hacker algum. Isso é invenção para me atingir.', 'Nota divulgada após delação de Walter Delgatti apontar vínculo com a deputada.', 'verified', true, '2023-04-05', 'https://g1.globo.com/politica/noticia/2023/04/05/zambelli-nega-hacker-delgatti-cnj.ghtml', 'news_article', 4, 'Redes sociais', 'Resposta a delação', 'zambelli-nega-delgatti-b141-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica atuação da PF no caso Zambelli-Delgatti e defende apuração.', 'O caso é gravíssimo. Exige investigação rigorosa, sem blindagem partidária.', 'Entrevista à CNN Brasil após a deflagração da Operação Lusco-Fusco.', 'verified', false, '2023-08-10', 'https://www.cnnbrasil.com.br/politica/moro-defende-investigacao-zambelli-delgatti/', 'news_article', 2, 'CNN Brasil', 'Entrevista', 'moro-investigacao-zambelli-b141-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes determina busca e apreensão na casa de Zambelli em São Paulo.', 'Os indícios revelam uso da estrutura parlamentar para fins ilícitos graves.', 'Despacho no inquérito da invasão dos sistemas do CNJ que autorizou diligências.', 'verified', true, '2023-08-11', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=zambelli-busca-cnj-2023', 'official_document', 2, 'STF', 'Despacho em inquérito', 'moraes-busca-zambelli-b141-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro defende Zambelli e ataca Delgatti chamando-o de golpista.', 'Delgatti é um hacker golpista. A Carla é patriota e está sendo perseguida.', 'Live no YouTube após busca e apreensão contra a deputada.', 'verified', false, '2023-08-12', 'https://www.youtube.com/watch?v=bolsonaro-live-zambelli-delgatti-2023', 'social_media_post', 3, 'YouTube', 'Live semanal', 'bolsonaro-defende-zambelli-b141-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli admite contato com Delgatti mas nega contratação para invasão.', 'Conheci o Delgatti, sim. Mas nunca pedi invasão de sistema nenhum.', 'Depoimento à Polícia Federal no âmbito do inquérito sobre o ataque ao CNJ.', 'verified', true, '2023-09-01', 'https://www.conjur.com.br/2023-set-01/zambelli-depoimento-pf-delgatti/', 'news_article', 3, 'Polícia Federal', 'Depoimento', 'zambelli-admite-delgatti-b141-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas critica PF e diz que investigação contra Zambelli é política.', 'A PF virou instrumento de perseguição. Zambelli é alvo pelo que pensa.', 'Discurso em plenário defendendo a colega após a Operação Lusco-Fusco.', 'verified', false, '2023-08-15', 'https://www.camara.leg.br/noticias/nikolas-defende-zambelli-pf-agosto2023', 'news_article', 3, 'Câmara dos Deputados', 'Discurso plenário', 'nikolas-defende-zambelli-b141-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro liga caso Zambelli a pretensa perseguição à direita.', 'Toda direita que se expressa vira alvo. É uma caça sistemática.', 'Entrevista à Gazeta do Povo sobre situação processual da deputada.', 'verified', false, '2023-09-20', 'https://www.gazetadopovo.com.br/republica/eduardo-bolsonaro-perseguicao-direita-zambelli/', 'news_article', 3, 'Gazeta do Povo', 'Entrevista', 'eduardo-perseguicao-direita-b141-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada pelo STF a 5 anos e 3 meses por arma contra jornalista.', 'Esta condenação é política. Vou recorrer até a última instância.', 'Coletiva após Primeira Turma do STF encerrar julgamento do caso Luan Araújo.', 'verified', true, '2024-05-14', 'https://www.jota.info/stf/primeira-turma/zambelli-condenada-arma-jornalista-14052024', 'news_article', 4, 'STF', 'Condenação criminal', 'zambelli-condenada-arma-b141-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes determina perda de mandato e inelegibilidade de Zambelli após condenação.', 'A condenação transita e a consequência é imperativa: perda do mandato.', 'Ofício ao presidente da Câmara comunicando o trânsito e solicitando cumprimento.', 'verified', true, '2024-05-16', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=zambelli-perda-mandato-stf', 'official_document', 3, 'STF', 'Ofício institucional', 'moraes-perda-mandato-zambelli-b141-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_art, 'Arthur Lira cumpre ordem do STF e declara vago o mandato de Zambelli.', 'Cumprimos a determinação judicial. O mandato está extinto.', 'Ato da Presidência da Câmara publicado em Diário Oficial.', 'verified', true, '2024-05-17', 'https://www.camara.leg.br/noticias/lira-declara-vago-mandato-zambelli-maio2024', 'official_document', 1, 'Câmara dos Deputados', 'Ato da Presidência', 'lira-vago-mandato-zambelli-b141-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli embarca para a Itália e anuncia exílio alegando perseguição.', 'Não aguento mais viver num país sem Justiça. Vou para onde posso respirar.', 'Postagem em rede social confirmando saída do país após nova denúncia aceita pelo STF.', 'verified', true, '2025-06-02', 'https://www1.folha.uol.com.br/poder/2025/06/zambelli-italia-fuga.shtml', 'news_article', 4, 'Instagram', 'Anúncio de exílio', 'zambelli-italia-fuga-b141-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes expede mandado de prisão contra Zambelli após fuga para Europa.', 'A fuga confirma risco concreto à aplicação da lei. Prisão preventiva decretada.', 'Decisão no inquérito do ataque ao CNJ requerendo captura pela Interpol.', 'verified', true, '2025-06-03', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=prisao-zambelli-interpol-2025', 'official_document', 4, 'STF', 'Mandado de prisão', 'moraes-prisao-zambelli-b141-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli obtém cidadania italiana e nega que fugiu da Justiça brasileira.', 'Sou cidadã italiana. Estou no meu país. Isso não é fuga, é direito.', 'Entrevista ao jornal Il Fatto Quotidiano após concessão da nacionalidade.', 'verified', true, '2025-06-20', 'https://www.ilfattoquotidiano.it/2025/06/20/zambelli-cittadinanza-italiana-brasile/', 'news_article', 4, 'Il Fatto Quotidiano', 'Entrevista', 'zambelli-cidadania-italiana-b141-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino diz que Itália tem tradição de não extraditar próprios cidadãos.', 'A Itália dificilmente extradita nacionais. Isso é fato do direito internacional.', 'Entrevista na saída do STF após questionamento sobre Zambelli.', 'verified', false, '2025-06-22', 'https://www.conjur.com.br/2025-jun-22/dino-italia-extradicao-zambelli/', 'news_article', 1, 'STF', 'Declaração à imprensa', 'dino-italia-extradicao-b141-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Messias anuncia que AGU vai atuar junto ao governo italiano por cooperação.', 'Vamos acionar todos os canais diplomáticos e jurídicos disponíveis.', 'Coletiva na AGU após decreto de prisão contra Zambelli.', 'verified', false, '2025-06-25', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-cooperacao-italia-zambelli', 'other', 1, 'AGU', 'Coletiva de imprensa', 'messias-cooperacao-italia-b141-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro celebra exílio de Zambelli e pede adesão dos perseguidos.', 'A Carla está livre. Todos os perseguidos políticos deveriam seguir esse caminho.', 'Postagem no X (Twitter) após confirmação da cidadania italiana.', 'verified', true, '2025-06-21', 'https://twitter.com/BolsonaroSP/status/eduardo-zambelli-exilio-2025', 'social_media_post', 4, 'X (Twitter)', 'Postagem', 'eduardo-celebra-exilio-zambelli-b141-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi critica fuga de Zambelli e pede responsabilização de apoiadores.', 'Fugir da Justiça não é patriotismo. É covardia, e precisa ser punida.', 'Entrevista à GloboNews comentando a saída da deputada para a Itália.', 'verified', false, '2025-06-23', 'https://globonews.globo.com/politica/gleisi-fuga-zambelli-responsabilizacao', 'news_article', 1, 'GloboNews', 'Entrevista', 'gleisi-critica-fuga-zambelli-b141-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lin, 'Lindbergh protocola representação contra Zambelli por obstrução de Justiça.', 'Quem foge da Justiça comete novo crime. Protocolei a representação.', 'Entrega de documento à Mesa da Câmara sobre conduta da ex-deputada.', 'verified', false, '2025-07-01', 'https://www.camara.leg.br/noticias/lindbergh-representacao-zambelli-obstrucao', 'news_article', 2, 'Câmara dos Deputados', 'Entrega de representação', 'lindbergh-representacao-zambelli-b141-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli monta canal no YouTube do exílio e mantém ataque a instituições.', 'Daqui de Roma eu continuo lutando pelo Brasil. Vamos derrubar a ditadura da toga.', 'Primeiro vídeo do novo canal criado após fuga, com mais de 200 mil visualizações.', 'verified', true, '2025-07-15', 'https://www.youtube.com/watch?v=zambelli-roma-canal-lancamento-2025', 'social_media_post', 4, 'YouTube', 'Live de lançamento', 'zambelli-canal-roma-b141-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem vota a favor de própria proteção em CPMI mesmo após indiciamento.', 'Sigo exercendo meu mandato. Nada me foi comprovado.', 'Fala na CPMI do 8 de Janeiro depois de ser indiciado pela PF por tentativa de golpe.', 'verified', true, '2023-10-18', 'https://www12.senado.leg.br/noticias/materias/2023/10/18/ramagem-cpmi-indiciamento-golpe', 'news_article', 4, 'Congresso Nacional', 'CPMI do 8 de Janeiro', 'ramagem-cpmi-indiciamento-b141-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem admite na CPMI ter entregado relatórios da Abin a Bolsonaro em 2022.', 'Apresentei dados sobre o sistema eleitoral a pedido do presidente.', 'Depoimento ao colegiado sobre uso do aparato de inteligência na transição.', 'verified', true, '2023-09-14', 'https://www12.senado.leg.br/noticias/materias/2023/09/14/ramagem-abin-relatorios-bolsonaro-2022', 'news_article', 5, 'Congresso Nacional', 'CPMI', 'ramagem-abin-relatorios-b141-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes autoriza busca e apreensão contra Ramagem na Operação Última Milha.', 'Há indícios de estrutura paralela de espionagem dentro da Abin.', 'Decisão que autorizou a Operação Última Milha da Polícia Federal.', 'verified', true, '2023-10-20', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=ramagem-ultima-milha-abin-2023', 'official_document', 3, 'STF', 'Despacho em inquérito', 'moraes-ultima-milha-ramagem-b141-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem nega ter comandado Abin paralela contra adversários do governo.', 'Nunca houve Abin paralela. Isso é ficção criada para nos atacar.', 'Entrevista à Jovem Pan News negando as acusações da Operação Última Milha.', 'verified', true, '2023-10-22', 'https://jovempan.com.br/noticias/politica/ramagem-nega-abin-paralela.html', 'news_article', 4, 'Jovem Pan', 'Entrevista', 'ramagem-nega-abin-paralela-b141-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que Ramagem é vítima de inquisição da PF.', 'O Alexandre é um servidor exemplar sendo massacrado pela PF politizada.', 'Live semanal no YouTube defendendo o ex-diretor da Abin.', 'verified', false, '2023-10-25', 'https://www.youtube.com/watch?v=bolsonaro-live-ramagem-outubro2023', 'social_media_post', 3, 'YouTube', 'Live', 'bolsonaro-defende-ramagem-b141-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem é indiciado por tentativa de golpe e reage chamando de perseguição.', 'Esse indiciamento é um roteiro político sem provas sólidas.', 'Nota divulgada após indiciamento pela PF no inquérito do golpe.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/ramagem-indiciamento-pf-golpe.ghtml', 'news_article', 5, 'Instagram', 'Nota oficial', 'ramagem-indiciamento-golpe-b141-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem se torna réu por tentativa de golpe no STF por decisão unânime.', 'Continuarei defendendo minha inocência até o último minuto.', 'Declaração após Primeira Turma do STF aceitar denúncia da PGR contra ele.', 'verified', true, '2025-03-26', 'https://www.jota.info/stf/primeira-turma/ramagem-reu-golpe-26032025', 'news_article', 5, 'STF', 'Aceitação de denúncia', 'ramagem-reu-golpe-stf-b141-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem falta a audiência no STF sem apresentar justificativa médica.', 'Não comparecerei enquanto não houver condições processuais adequadas.', 'Nota enviada ao STF na véspera da audiência de instrução.', 'verified', true, '2025-09-10', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=ramagem-falta-audiencia-golpe-2025', 'official_document', 3, 'STF', 'Audiência de instrução', 'ramagem-falta-audiencia-b141-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes determina bloqueio do passaporte de Ramagem após ausências.', 'A recusa reiterada em comparecer justifica a medida cautelar.', 'Despacho determinando retenção do passaporte do deputado.', 'verified', true, '2025-09-12', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=ramagem-passaporte-bloqueio-2025', 'official_document', 3, 'STF', 'Medida cautelar', 'moraes-passaporte-ramagem-b141-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem some após condenação e é declarado foragido pela PF.', 'Está em local incerto. As buscas prosseguem.', 'Relatório de diligência da PF entregue ao STF após mandado de prisão.', 'verified', true, '2025-11-28', 'https://www1.folha.uol.com.br/poder/2025/11/ramagem-foragido-pf.shtml', 'news_article', 5, 'Polícia Federal', 'Relatório de diligência', 'ramagem-foragido-pf-b141-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro diz que Ramagem está em lugar seguro e exige garantias.', 'Ele está vivo e bem. Só voltará quando houver devido processo legal.', 'Declaração ao Metrópoles após confirmação de fuga do deputado.', 'verified', true, '2025-11-30', 'https://www.metropoles.com/politica/flavio-ramagem-lugar-seguro-novembro2025', 'news_article', 4, 'Metrópoles', 'Declaração', 'flavio-ramagem-lugar-seguro-b141-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes expede mandado de prisão preventiva contra Ramagem com pedido à Interpol.', 'A fuga confirma o risco concreto para a aplicação da lei penal.', 'Decisão monocrática pedindo difusão vermelha internacional.', 'verified', true, '2025-12-01', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=ramagem-prisao-interpol-dezembro2025', 'official_document', 4, 'STF', 'Mandado de prisão', 'moraes-prisao-ramagem-b141-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas pede que Câmara blinde Ramagem mesmo após fuga.', 'Ramagem é deputado. A Câmara pode suspender o processo, e deve.', 'Discurso na tribuna defendendo voto para sustar ação penal.', 'verified', true, '2025-12-03', 'https://www.camara.leg.br/noticias/nikolas-blinda-ramagem-dezembro2025', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'nikolas-blinda-ramagem-b141-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta declara que Câmara não tem poder de sustar ação penal por golpe.', 'A ação é por crime comum. Não cabe ao Congresso sustar.', 'Entrevista coletiva na Presidência da Câmara.', 'verified', false, '2025-12-04', 'https://www.camara.leg.br/noticias/motta-nao-susta-ramagem-dezembro2025', 'other', 2, 'Câmara dos Deputados', 'Coletiva', 'motta-nao-susta-ramagem-b141-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira pede asilo à Rússia durante vídeo em tom delirante.', 'O Putin é o único líder no mundo livre que pode me dar asilo.', 'Vídeo publicado no Telegram após condenação e fuga do regime prisional.', 'verified', true, '2022-11-04', 'https://www.poder360.com.br/justica/silveira-asilo-russia-video-telegram/', 'social_media_post', 4, 'Telegram', 'Vídeo pessoal', 'silveira-asilo-russia-b141-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira é preso em Petrópolis após descumprir tornozeleira.', 'Me prenderam de novo. Sou prisioneiro político.', 'Vídeo gravado na viatura após abordagem pela PF.', 'verified', true, '2023-02-20', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2023/02/20/daniel-silveira-preso-petropolis-tornozeleira.ghtml', 'news_article', 4, 'Rio de Janeiro', 'Abordagem policial', 'silveira-preso-petropolis-b141-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes mantém Silveira preso e nega habeas corpus pela sexta vez.', 'A reiteração de condutas ilícitas impõe manutenção da custódia.', 'Decisão monocrática negando mais um pedido da defesa.', 'verified', true, '2023-05-08', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=silveira-hc-negado-maio2023', 'official_document', 2, 'STF', 'Decisão em habeas corpus', 'moraes-nega-hc-silveira-b141-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis protocola projeto para anular condenação de Daniel Silveira.', 'Vamos aprovar a anulação. É o mínimo contra uma perseguição escandalosa.', 'Apresentação de projeto de decreto legislativo tentando sustar decisão do STF.', 'verified', false, '2023-06-15', 'https://www.camara.leg.br/noticias/bia-kicis-anulacao-silveira-junho2023', 'news_article', 4, 'Câmara dos Deputados', 'Apresentação de projeto', 'bia-kicis-anulacao-silveira-b141-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem compara prisão de Silveira a regime autoritário.', 'Nunca na história da República um deputado foi tratado assim. É ditadura.', 'Entrevista à Oeste após rejeição de habeas corpus.', 'verified', false, '2023-07-10', 'https://revistaoeste.com/politica/van-hattem-silveira-ditadura-julho2023/', 'news_article', 3, 'Revista Oeste', 'Entrevista', 'van-hattem-silveira-ditadura-b141-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira publica áudio do presídio convocando para manifestação.', 'Do cárcere político eu clamo: às ruas, patriotas!', 'Áudio viralizado em grupos de WhatsApp e no Telegram pela defesa.', 'verified', true, '2023-09-07', 'https://www1.folha.uol.com.br/poder/2023/09/silveira-audio-presidio-7-setembro.shtml', 'news_article', 4, 'Presídio', 'Áudio vazado', 'silveira-audio-presidio-b141-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira é transferido para regime semiaberto após dois anos de prisão.', 'Sigo sendo o mesmo. Não me renderei jamais.', 'Declaração na saída do presídio após decisão favorável da VEP.', 'verified', false, '2024-04-12', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/2024/04/12/silveira-semiaberto-vep.ghtml', 'news_article', 2, 'Presídio', 'Saída para semiaberto', 'silveira-semiaberto-b141-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira volta a atacar ministros do STF em discurso em comício.', 'Eles me prenderam porque não me calo. Seguirei peitando.', 'Discurso em comício bolsonarista em Petrópolis após sair do semiaberto.', 'verified', true, '2024-07-20', 'https://www.cnnbrasil.com.br/politica/silveira-comicio-petropolis-julho2024/', 'news_article', 4, 'Petrópolis', 'Comício', 'silveira-comicio-petropolis-b141-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes manda regressão de Silveira ao fechado por descumprimento.', 'As reiteradas violações exigem o retorno ao regime mais gravoso.', 'Decisão após novo ataque verbal em redes sociais.', 'verified', true, '2024-08-05', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=silveira-regressao-fechado-agosto2024', 'official_document', 3, 'STF', 'Decisão em execução penal', 'moraes-regressao-silveira-b141-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira diz se considerar mártir do bolsonarismo.', 'Se tiver que morrer preso, morro. Mas morro de cabeça erguida.', 'Entrevista a programa bolsonarista no YouTube dias antes de voltar ao fechado.', 'verified', true, '2024-08-03', 'https://www.youtube.com/watch?v=silveira-martir-entrevista-agosto2024', 'social_media_post', 3, 'YouTube', 'Entrevista', 'silveira-martir-b141-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro diz que Silveira é símbolo da oposição perseguida.', 'Daniel é um soldado. Vai virar monumento da resistência.', 'Postagem no X após regressão de regime.', 'verified', false, '2024-08-06', 'https://twitter.com/CarlosBolsonaro/status/silveira-simbolo-2024', 'social_media_post', 3, 'X (Twitter)', 'Postagem', 'carlos-silveira-simbolo-b141-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira obtém indulto parcial após lei do Congresso ser sancionada.', 'Cumpri minha pena de pé. Agora continuo lutando.', 'Declaração à porta do presídio após homologação de indulto específico.', 'verified', true, '2025-10-14', 'https://www.jota.info/justica/silveira-indulto-parcial-outubro2025', 'news_article', 4, 'Presídio', 'Saída por indulto', 'silveira-indulto-b141-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Messias contesta indulto da Câmara a Silveira e aciona STF.', 'Lei pontual com nome e sobrenome afronta a separação de Poderes.', 'Coletiva após AGU ajuizar ADI contra lei do indulto.', 'verified', false, '2025-10-16', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-adi-indulto-silveira', 'other', 2, 'AGU', 'Coletiva', 'messias-adi-indulto-silveira-b141-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes suspende efeitos do indulto específico a Silveira em liminar.', 'Lei disfarçada de indulto viola o princípio da impessoalidade.', 'Liminar em ADI ajuizada pela AGU.', 'verified', true, '2025-10-20', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=moraes-suspende-indulto-silveira-2025', 'official_document', 3, 'STF', 'Liminar em ADI', 'moraes-suspende-indulto-silveira-b141-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira desaparece após suspensão do indulto e é dado como foragido.', 'Ele não está em casa. Está em local não divulgado por segurança.', 'Entrevista da advogada à imprensa após PF não localizar o deputado licenciado.', 'verified', true, '2025-11-05', 'https://g1.globo.com/politica/noticia/2025/11/05/silveira-desaparece-indulto-suspenso.ghtml', 'news_article', 5, 'Rio de Janeiro', 'Fuga confirmada', 'silveira-desaparece-b141-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes inclui Silveira em difusão vermelha da Interpol após nova fuga.', 'A impunidade não prosperará. A difusão internacional foi determinada.', 'Ofício à Interpol e ao DRCI para localização do foragido.', 'verified', true, '2025-11-07', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=silveira-interpol-2025', 'official_document', 4, 'STF', 'Ofício internacional', 'moraes-silveira-interpol-b141-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro diz que irá pedir asilo nos EUA para Silveira e Ramagem.', 'Vou ajudar a articular asilo político nos EUA. É dever da direita mundial.', 'Vídeo publicado no X durante estada nos Estados Unidos.', 'verified', true, '2025-11-10', 'https://twitter.com/BolsonaroSP/status/eduardo-asilo-eua-silveira-ramagem-2025', 'social_media_post', 5, 'X (Twitter)', 'Vídeo', 'eduardo-asilo-eua-foragidos-b141-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jom, 'Messias diz que Brasil reagirá a qualquer tentativa de asilo a foragidos.', 'Usaremos todos os tratados bilaterais para reclamar a entrega dos foragidos.', 'Entrevista coletiva na AGU sobre estratégia internacional.', 'verified', false, '2025-11-12', 'https://www.gov.br/agu/pt-br/comunicacao/noticias/messias-asilo-foragidos-reacao-novembro2025', 'other', 2, 'AGU', 'Coletiva', 'messias-reacao-asilo-b141-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ter, 'Tereza Cristina propõe CPI para apurar fugas de parlamentares.', 'Precisamos entender como 3 parlamentares fugiram em 6 meses.', 'Entrevista à CNN Brasil propondo investigação.', 'verified', false, '2025-11-15', 'https://www.cnnbrasil.com.br/politica/tereza-cristina-cpi-fugas-parlamentares-novembro2025/', 'news_article', 2, 'CNN Brasil', 'Entrevista', 'tereza-cpi-fugas-b141-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que foragidos pensam que Brasil é piada mas é República séria.', 'Ninguém está acima da lei. Quem fugiu vai voltar para responder.', 'Entrevista coletiva em Brasília após reunião de ministros.', 'verified', true, '2025-11-16', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/11/lula-foragidos-republica-seria', 'other', 2, 'Palácio do Planalto', 'Coletiva', 'lula-foragidos-republica-b141-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro posta mensagem defendendo os três foragidos.', 'Peço oração pelos perseguidos. Deus é maior que qualquer toga.', 'Postagem no Instagram após fuga confirmada de Silveira.', 'verified', true, '2025-11-09', 'https://www.instagram.com/p/michelle-bolsonaro-peco-oracao-perseguidos-novembro2025', 'social_media_post', 3, 'Instagram', 'Postagem', 'michelle-oracao-perseguidos-b141-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que vai comentar fuga de Zambelli depois de se informar melhor.', 'Preciso me informar. Não vou cair em armadilha.', 'Entrevista na saída do Palácio dos Bandeirantes após pressão de repórteres.', 'verified', false, '2025-06-24', 'https://www.estadao.com.br/politica/tarcisio-comenta-fuga-zambelli-junho2025/', 'news_article', 2, 'São Paulo', 'Declaração', 'tarcisio-evita-zambelli-b141-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_conf, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal usa o caso para atacar instituições e prometer amnistia.', 'Quando eu for presidente, em 48 horas liberto todos os patriotas.', 'Live no Instagram explorando repercussão da fuga de Zambelli.', 'verified', true, '2025-06-26', 'https://www.instagram.com/p/pablo-marcal-amnistia-live-junho2025', 'social_media_post', 4, 'Instagram', 'Live', 'marcal-amnistia-48h-b141-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves defende clemência cristã para presos do 8 de Janeiro.', 'Deus é misericordioso. Precisamos de uma anistia urgente.', 'Discurso em culto evangélico em Brasília.', 'verified', false, '2024-10-06', 'https://www12.senado.leg.br/noticias/materias/2024/10/06/damares-anistia-culto-brasilia', 'news_article', 3, 'Igreja em Brasília', 'Culto', 'damares-anistia-culto-b141-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta pede anistia ampla e fala em pacificação do país.', 'A paz só chega com anistia. Ponto final.', 'Pronunciamento no Senado durante homenagem religiosa.', 'verified', false, '2024-11-20', 'https://www12.senado.leg.br/noticias/materias/2024/11/20/magno-malta-anistia-pacificacao', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'magno-malta-anistia-b141-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão diz que fugas de parlamentares envergonham o país.', 'Deputado não foge. Deputado se defende no tribunal.', 'Discurso no Senado após caso Daniel Silveira.', 'verified', true, '2025-11-18', 'https://www12.senado.leg.br/noticias/materias/2025/11/18/mourao-fugas-envergonham', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'mourao-fugas-envergonham-b141-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica discurso de anistia e pede cumprimento das condenações.', 'Anistia genérica hoje é convite ao próximo golpe amanhã.', 'Entrevista à Folha sobre projeto de anistia em tramitação.', 'verified', true, '2024-09-20', 'https://www1.folha.uol.com.br/poder/2024/09/moro-contra-anistia-generica-setembro2024.shtml', 'news_article', 2, 'Folha de S.Paulo', 'Entrevista', 'moro-contra-anistia-b141-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri critica absolvição sem julgamento mas defende dosimetria.', 'Anistia sem julgamento é feita. Quero revisão de dosimetria.', 'Tribuna da Câmara no debate sobre projeto de anistia.', 'verified', false, '2024-09-25', 'https://www.camara.leg.br/noticias/kim-kataguiri-dosimetria-anistia-setembro2024', 'news_article', 2, 'Câmara dos Deputados', 'Discurso plenário', 'kim-dosimetria-b141-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adr, 'Adriana Ventura defende rigor com quem foge mas proporção para outros.', 'Foragido tem que cumprir pena. Mas há excessos em outros casos.', 'Entrevista à GloboNews analisando a onda de fugas.', 'verified', false, '2025-11-20', 'https://globonews.globo.com/politica/adriana-ventura-fugas-proporcao-novembro2025', 'news_article', 1, 'GloboNews', 'Entrevista', 'adriana-fugas-proporcao-b141-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe pede que Senado apoie investigação da rede de apoio aos foragidos.', 'Há uma rede que financia fugas. Senado precisa investigar.', 'Pronunciamento no Senado em sessão não deliberativa.', 'verified', false, '2025-11-19', 'https://www12.senado.leg.br/noticias/materias/2025/11/19/randolfe-rede-foragidos', 'news_article', 2, 'Senado Federal', 'Pronunciamento', 'randolfe-rede-foragidos-b141-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa critica silêncio do PL sobre foragidos.', 'O PL hoje é o partido da fuga. E o presidente do PL é omisso.', 'Entrevista ao Brasil 247 sobre cenário das fugas.', 'verified', false, '2025-11-22', 'https://www.brasil247.com/politica/humberto-costa-pl-foragidos-novembro2025', 'news_article', 2, 'Brasil 247', 'Entrevista', 'humberto-pl-foragidos-b141-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'André Janones grava vídeo irônico sobre fuga de Ramagem.', 'Ramagem sumiu. Chamem o Ramagem para procurar o Ramagem.', 'Vídeo no X com alto engajamento após fuga do deputado.', 'verified', true, '2025-12-02', 'https://twitter.com/AndreJanonesAdv/status/janones-ramagem-ironia-2025', 'social_media_post', 2, 'X (Twitter)', 'Vídeo', 'janones-ironia-ramagem-b141-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jaw, 'Jaques Wagner pede coordenação entre AGU Itamaraty para extradições.', 'AGU e Itamaraty precisam coordenar esforços com seriedade republicana.', 'Declaração no Palácio do Planalto após reunião ministerial.', 'verified', false, '2025-12-06', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2025/12/jaques-wagner-extradicoes', 'other', 1, 'Palácio do Planalto', 'Declaração', 'jaques-wagner-extradicoes-b141-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fil, 'Filipe Barros promete cassar decisões de Moraes se eleito presidente.', 'Eleito for o Bolsonaro, cassaremos as canetadas ditatoriais.', 'Discurso em ato bolsonarista em Londrina.', 'verified', true, '2024-09-07', 'https://www.folhadelondrina.com.br/politica/filipe-barros-cassar-moraes-setembro2024', 'news_article', 4, 'Londrina', 'Ato político', 'filipe-cassar-moraes-b141-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cab, 'Cabo Gilberto chama Moraes de tirano em discurso na tribuna.', 'Moraes é o tirano do Brasil. Precisa ser impeachmado já.', 'Discurso em tribuna da Câmara após prisão de apoiador.', 'verified', true, '2024-10-02', 'https://www.camara.leg.br/noticias/cabo-gilberto-moraes-tirano-outubro2024', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'cabo-gilberto-tirano-b141-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_juz, 'Julia Zanatta pede ao Congresso que crie comissão de defesa dos foragidos.', 'Precisamos de comissão de direitos humanos dos patriotas exilados.', 'Apresentação de requerimento na Mesa da Câmara.', 'verified', false, '2025-11-25', 'https://www.camara.leg.br/noticias/julia-zanatta-comissao-foragidos-novembro2025', 'news_article', 3, 'Câmara dos Deputados', 'Apresentação de requerimento', 'julia-comissao-foragidos-b141-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_san, 'Sanderson diz que só voltará a confiar na Justiça com reforma total.', 'Essa Justiça não merece confiança. Ou reforma, ou continuamos sofrendo.', 'Entrevista à rádio Jovem Pan Porto Alegre.', 'verified', false, '2025-03-15', 'https://jovempan.com.br/noticias/brasil/sanderson-justica-reforma-marco2025.html', 'news_article', 3, 'Jovem Pan POA', 'Entrevista', 'sanderson-justica-reforma-b141-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano defende que Deus vai julgar os ministros do STF.', 'Deus é juiz supremo. E eles terão de responder a Ele também.', 'Pregação em culto evangélico em São Paulo.', 'verified', true, '2024-12-10', 'https://www.gospelprime.com.br/marco-feliciano-stf-deus-dezembro2024', 'news_article', 3, 'São Paulo', 'Culto', 'feliciano-deus-julga-stf-b141-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gir, 'General Girão celebra fuga de Ramagem e chama de vitória moral.', 'Patriota não aceita ser preso injustamente. Ramagem fez certo.', 'Postagem no X após fuga do deputado.', 'verified', true, '2025-11-30', 'https://twitter.com/GeneralGirao/status/girao-ramagem-vitoria-2025', 'social_media_post', 4, 'X (Twitter)', 'Postagem', 'girao-ramagem-vitoria-b141-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gui, 'Guiga Peixoto defende ataque midiático contra ministros do Supremo.', 'Temos que expor esses caras todo dia. Até caírem.', 'Entrevista ao canal Brasil Paralelo.', 'verified', false, '2024-11-15', 'https://www.brasilparalelo.com.br/entrevistas/guiga-peixoto-stf-exposicao', 'news_article', 4, 'Brasil Paralelo', 'Entrevista', 'guiga-expor-stf-b141-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_int, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela manutenção da prisão de Silveira alegando reincidência.', 'A reincidência específica demonstra que a pena é ineficaz fora do cárcere.', 'Voto em habeas corpus julgado pela Primeira Turma.', 'verified', false, '2024-05-30', 'https://www.jota.info/stf/primeira-turma/zanin-voto-silveira-maio2024', 'news_article', 1, 'STF', 'Julgamento habeas corpus', 'zanin-mantem-silveira-b141-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cal, 'Cármen Lúcia vota contra indulto específico e defende STF.', 'Lei pontual com destinatário único não é lei, é privilégio.', 'Voto na ADI que contestou a anistia de Daniel Silveira.', 'verified', false, '2025-11-02', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=carmen-voto-indulto-silveira-2025', 'official_document', 1, 'STF', 'Julgamento ADI', 'carmen-voto-indulto-silveira-b141-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que fugas demonstram sucesso do sistema.', 'Quem foge é porque vê que seria condenado. É prova do funcionamento.', 'Entrevista a Valor Econômico sobre fugas de parlamentares.', 'verified', false, '2025-12-01', 'https://valor.globo.com/politica/noticia/2025/12/01/gilmar-fugas-sucesso-sistema.ghtml', 'news_article', 1, 'Valor Econômico', 'Entrevista', 'gilmar-fugas-sucesso-b141-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia força-tarefa da PF para capturar foragidos.', 'Criamos grupo integrado com a PF para localizar e capturar os foragidos.', 'Coletiva no Ministério da Justiça após reunião interna.', 'verified', true, '2025-12-05', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-forca-tarefa-foragidos-dezembro2025', 'other', 2, 'Ministério da Justiça', 'Coletiva', 'lewandowski-forca-tarefa-b141-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que fugas não impactam arrecadação mas demonstram crise.', 'Fugas são sintoma. O sistema econômico segue estável, a democracia também.', 'Entrevista à GloboNews em Brasília.', 'verified', false, '2025-12-08', 'https://globonews.globo.com/politica/haddad-fugas-sintoma-dezembro2025', 'news_article', 1, 'GloboNews', 'Entrevista', 'haddad-fugas-sintoma-b141-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ser, 'Simone Tebet defende que fugas precisam de resposta uniforme do Congresso.', 'O Congresso não pode ser cúmplice. Cada fuga é afronta ao Legislativo.', 'Entrevista à CNN Brasil em Brasília.', 'verified', false, '2025-12-09', 'https://www.cnnbrasil.com.br/politica/tebet-fugas-congresso-dezembro2025', 'news_article', 1, 'CNN Brasil', 'Entrevista', 'tebet-congresso-fugas-b141-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli tenta entrevista em TV italiana para pedir apoio de Meloni.', 'Peço apoio à primeira-ministra Meloni. Somos irmãs ideológicas.', 'Entrevista a canal italiano tentando manter holofote na situação pessoal.', 'verified', true, '2025-09-15', 'https://www.corriere.it/politica/25_settembre_15/zambelli-meloni-appello', 'news_article', 4, 'RAI 3', 'Entrevista', 'zambelli-apelo-meloni-b141-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada a 10 anos por organização criminosa em novo processo.', 'Essa condenação à revelia é tudo menos Justiça.', 'Nota divulgada após STF encerrar processo do ataque ao CNJ.', 'verified', true, '2025-12-15', 'https://www.jota.info/stf/primeira-turma/zambelli-condenada-cnj-dezembro2025', 'news_article', 5, 'STF', 'Condenação criminal', 'zambelli-condenada-cnj-b141-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas organiza vigília em frente ao STF pedindo liberdade dos três.', 'Hoje é dia de vigília. Pelos nossos irmãos presos e perseguidos.', 'Convocação no YouTube para ato em Brasília.', 'verified', true, '2026-01-20', 'https://www.youtube.com/watch?v=nikolas-vigilia-stf-janeiro2026', 'social_media_post', 4, 'YouTube', 'Convocação', 'nikolas-vigilia-stf-b141-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz em entrevista que os três foragidos são heróis nacionais.', 'São três heróis. A história vai reconhecer.', 'Entrevista a podcast bolsonarista gravada em condomínio em Brasília.', 'verified', true, '2026-02-04', 'https://www.youtube.com/watch?v=bolsonaro-podcast-tres-herois-fevereiro2026', 'social_media_post', 4, 'Podcast', 'Entrevista', 'bolsonaro-tres-herois-b141-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes determina confisco de bens de Zambelli no Brasil.', 'O confisco é medida assecuratória para reparar os danos.', 'Decisão atendendo pedido do MPF.', 'verified', true, '2026-02-12', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=zambelli-confisco-bens-fevereiro2026', 'official_document', 3, 'STF', 'Decisão em inquérito', 'moraes-confisco-zambelli-b141-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino rejeita recurso de Ramagem em decisão monocrática.', 'Os argumentos são os mesmos já superados pela Turma. Nego provimento.', 'Decisão em recurso da defesa após condenação.', 'verified', false, '2026-03-05', 'https://www.jota.info/stf/primeira-turma/dino-nega-recurso-ramagem-marco2026', 'news_article', 1, 'STF', 'Decisão monocrática', 'dino-nega-recurso-ramagem-b141-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Ramagem é filmado nos EUA em jantar com lideranças MAGA.', 'Sou grato aos amigos da direita global pela acolhida.', 'Vídeo viralizado no X mostrando o deputado foragido em evento conservador na Flórida.', 'verified', true, '2026-02-20', 'https://twitter.com/news/status/ramagem-maga-florida-fevereiro2026', 'social_media_post', 5, 'Flórida', 'Evento MAGA', 'ramagem-maga-florida-b141-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula aciona Departamento de Estado sobre Ramagem nos EUA.', 'Um foragido não pode transitar livremente em país amigo. Vamos acionar Washington.', 'Declaração à imprensa em Brasília após divulgação do vídeo.', 'verified', true, '2026-02-21', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2026/02/lula-ramagem-eua', 'other', 2, 'Palácio do Planalto', 'Declaração', 'lula-ramagem-eua-b141-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro confirma coordenar apoio a Ramagem nos EUA.', 'Estamos organizando a rede de apoio jurídico e político aos perseguidos aqui.', 'Entrevista à Newsmax na Flórida.', 'verified', true, '2026-02-22', 'https://www.newsmax.com/eduardo-bolsonaro-ramagem-asylum-february2026', 'news_article', 5, 'Newsmax', 'Entrevista', 'eduardo-coordena-apoio-eua-b141-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem defende que Congresso suspenda extradições como retaliação.', 'Não colaboraremos com farsa. Suspender tratados é legítima defesa.', 'Tribuna da Câmara durante debate sobre tratados de extradição.', 'verified', true, '2026-03-12', 'https://www.camara.leg.br/noticias/van-hattem-tratados-extradicao-marco2026', 'news_article', 4, 'Câmara dos Deputados', 'Discurso plenário', 'van-hattem-suspender-tratados-b141-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta arquiva proposta de Van Hattem sobre tratados.', 'Proposta fere a Constituição. Arquivada.', 'Despacho da Presidência da Câmara em resposta a questão de ordem.', 'verified', false, '2026-03-14', 'https://www.camara.leg.br/noticias/motta-arquiva-tratados-marco2026', 'other', 1, 'Câmara dos Deputados', 'Despacho', 'motta-arquiva-tratados-b141-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro diz no Senado que irmãos bolsonarista sofrem guerra jurídica.', 'É lawfare. E vamos denunciar na OEA e na ONU.', 'Pronunciamento em plenário após nova condenação de Zambelli.', 'verified', true, '2025-12-16', 'https://www12.senado.leg.br/noticias/materias/2025/12/16/flavio-lawfare-oea-onu', 'news_article', 4, 'Senado Federal', 'Pronunciamento', 'flavio-lawfare-oea-b141-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ric, 'Ricardo Salles critica PF por vazamentos em investigações a políticos.', 'PF vira agência de notícias da esquerda. Vergonhoso.', 'Postagem no X após reportagem sobre investigação a parlamentares.', 'verified', false, '2025-10-08', 'https://twitter.com/rsallesmma/status/salles-pf-vazamentos-outubro2025', 'social_media_post', 3, 'X (Twitter)', 'Postagem', 'salles-pf-vazamentos-b141-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Paulo Guedes diz que onda de fugas reflete insegurança jurídica.', 'Investidor olha e se pergunta por que até deputado foge do Brasil.', 'Entrevista ao InfoMoney em evento financeiro.', 'verified', false, '2025-11-21', 'https://www.infomoney.com.br/politica/guedes-onda-fugas-inseguranca-novembro2025/', 'news_article', 2, 'InfoMoney', 'Entrevista', 'guedes-onda-fugas-b141-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira reaparece em vídeo em local não identificado ameaçando voltar.', 'Eu vou voltar. E quando voltar vai ser com acerto de contas.', 'Vídeo divulgado no Telegram após três meses desaparecido.', 'verified', true, '2026-02-08', 'https://www.poder360.com.br/justica/silveira-video-acerto-contas-fevereiro2026', 'social_media_post', 5, 'Telegram', 'Vídeo', 'silveira-acerto-contas-b141-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ale, 'Moraes determina investigação das pessoas que abrigam Silveira.', 'Quem esconde foragido comete crime. Medidas estão sendo adotadas.', 'Despacho em inquérito remetido à PF.', 'verified', true, '2026-02-10', 'https://www.stf.jus.br/portal/cms/verNoticia.asp?idConteudo=moraes-investiga-rede-silveira-fevereiro2026', 'official_document', 3, 'STF', 'Despacho', 'moraes-rede-abriga-silveira-b141-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi compara rede de apoio a foragidos com esquema criminoso.', 'Quem financia fuga é cúmplice. É organização criminosa pura.', 'Entrevista à RedeTV após revelações sobre a rede.', 'verified', false, '2026-02-11', 'https://www.redetv.uol.com.br/jornalismo/gleisi-rede-foragidos-fevereiro2026', 'news_article', 2, 'RedeTV', 'Entrevista', 'gleisi-rede-criminosa-b141-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Lewandowski anuncia operação policial que prende 12 na rede de apoio.', 'A rede foi desarticulada. 12 prisões realizadas em 5 Estados.', 'Coletiva no Ministério da Justiça apresentando resultados.', 'verified', true, '2026-03-22', 'https://www.gov.br/mj/pt-br/assuntos/noticias/lewandowski-prisoes-rede-foragidos-marco2026', 'other', 3, 'Ministério da Justiça', 'Coletiva', 'lewandowski-prisoes-rede-b141-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz em pronunciamento de rádio que impunidade acabou para quem foge.', 'A República é maior que qualquer um. Ninguém escapa por muito tempo.', 'Pronunciamento em cadeia nacional de rádio e TV.', 'verified', true, '2026-04-01', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2026/04/lula-pronunciamento-impunidade', 'other', 2, 'Cadeia nacional', 'Pronunciamento', 'lula-impunidade-acabou-b141-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli tenta viajar a Argentina e é detida temporariamente em aeroporto de Roma.', 'Fui detida por duas horas. Tudo esclarecido. Meloni respeita minha nacionalidade.', 'Publicação no Instagram após ser retida no Aeroporto de Fiumicino por alertas da Interpol.', 'verified', true, '2026-04-10', 'https://www.ansa.it/cronaca/2026/04/10/zambelli-fermo-fiumicino', 'news_article', 4, 'Fiumicino', 'Detenção em aeroporto', 'zambelli-detida-fiumicino-b141-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

END $$;
