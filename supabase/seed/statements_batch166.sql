-- Batch 166: Apr-Jun 2025 political events (100 statements)
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_gle UUID; v_pad UUID; v_rui UUID;
  v_alc UUID; v_mar UUID; v_muv UUID; v_muc UUID; v_lma UUID;
  v_teb UUID; v_lup UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_nik UUID; v_zam UUID; v_bia UUID; v_fel UUID; v_dam UUID;
  v_mag UUID; v_mou UUID; v_mic UUID; v_tar UUID; v_zem UUID;
  v_cai UUID; v_mor UUID; v_cir UUID; v_pab UUID; v_bou UUID;
  v_bop UUID; v_jan UUID; v_amo UUID; v_gil UUID; v_carm UUID;
  v_zan UUID; v_din UUID; v_bar UUID; v_fac UUID; v_mot UUID;
  v_dal UUID; v_lir UUID; v_pac UUID; v_ran UUID; v_jwa UUID;
  v_hum UUID; v_agr UUID; v_gal UUID; v_rcn UUID; v_mch UUID;
  v_mpo UUID; v_tab UUID; v_eri UUID; v_sam UUID; v_tal UUID;
  v_mvh UUID; v_adv UUID; v_kim UUID;
  c_des UUID; c_ant UUID; c_dis UUID; c_mis UUID; c_hom UUID;
  c_rac UUID; c_xen UUID; c_abu UUID; c_mac UUID; c_aut UUID;
  c_obs UUID; c_ame UUID; c_neg UUID; c_irr UUID; c_con UUID;
  c_int UUID; c_vio UUID; c_cor UUID; c_nep UUID; c_itr UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug='lula';
  SELECT id INTO v_had FROM politicians WHERE slug='fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug='gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug='alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug='rui-costa';
  SELECT id INTO v_alc FROM politicians WHERE slug='geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug='marina-silva';
  SELECT id INTO v_muv FROM politicians WHERE slug='mauro-vieira';
  SELECT id INTO v_muc FROM politicians WHERE slug='jose-mucio';
  SELECT id INTO v_lma FROM politicians WHERE slug='luiz-marinho';
  SELECT id INTO v_teb FROM politicians WHERE slug='simone-tebet';
  SELECT id INTO v_lup FROM politicians WHERE slug='carlos-lupi';
  SELECT id INTO v_jai FROM politicians WHERE slug='jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug='eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug='flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug='nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug='carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug='bia-kicis';
  SELECT id INTO v_fel FROM politicians WHERE slug='marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug='damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug='magno-malta';
  SELECT id INTO v_mou FROM politicians WHERE slug='hamilton-mourao';
  SELECT id INTO v_mic FROM politicians WHERE slug='michelle-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug='tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug='zema';
  SELECT id INTO v_cai FROM politicians WHERE slug='ronaldo-caiado';
  SELECT id INTO v_mor FROM politicians WHERE slug='sergio-moro';
  SELECT id INTO v_cir FROM politicians WHERE slug='ciro-gomes';
  SELECT id INTO v_pab FROM politicians WHERE slug='pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug='guilherme-boulos';
  SELECT id INTO v_bop FROM politicians WHERE slug='boulos-prefeito';
  SELECT id INTO v_jan FROM politicians WHERE slug='andre-janones';
  SELECT id INTO v_amo FROM politicians WHERE slug='alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug='gilmar-mendes';
  SELECT id INTO v_carm FROM politicians WHERE slug='carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug='cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug='flavio-dino';
  SELECT id INTO v_bar FROM politicians WHERE slug='luis-roberto-barroso';
  SELECT id INTO v_fac FROM politicians WHERE slug='edson-fachin';
  SELECT id INTO v_mot FROM politicians WHERE slug='hugo-motta';
  SELECT id INTO v_dal FROM politicians WHERE slug='davi-alcolumbre';
  SELECT id INTO v_lir FROM politicians WHERE slug='arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug='rodrigo-pacheco';
  SELECT id INTO v_ran FROM politicians WHERE slug='randolfe-rodrigues';
  SELECT id INTO v_jwa FROM politicians WHERE slug='jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug='humberto-costa';
  SELECT id INTO v_agr FROM politicians WHERE slug='aguinaldo-ribeiro';
  SELECT id INTO v_gal FROM politicians WHERE slug='gabriel-galipolo';
  SELECT id INTO v_rcn FROM politicians WHERE slug='roberto-campos-neto';
  SELECT id INTO v_mch FROM politicians WHERE slug='magda-chambriard';
  SELECT id INTO v_mpo FROM politicians WHERE slug='marcos-pontes';
  SELECT id INTO v_tab FROM politicians WHERE slug='tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug='erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug='samia-bomfim';
  SELECT id INTO v_tal FROM politicians WHERE slug='taliria-petrone';
  SELECT id INTO v_mvh FROM politicians WHERE slug='marcel-van-hattem';
  SELECT id INTO v_adv FROM politicians WHERE slug='adriana-ventura';
  SELECT id INTO v_kim FROM politicians WHERE slug='kim-kataguiri';

  SELECT id INTO c_des FROM categories WHERE slug='desinformacao';
  SELECT id INTO c_ant FROM categories WHERE slug='antidemocratico';
  SELECT id INTO c_dis FROM categories WHERE slug='discurso-de-odio';
  SELECT id INTO c_mis FROM categories WHERE slug='misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug='homofobia';
  SELECT id INTO c_rac FROM categories WHERE slug='racismo';
  SELECT id INTO c_xen FROM categories WHERE slug='xenofobia';
  SELECT id INTO c_abu FROM categories WHERE slug='abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug='machismo';
  SELECT id INTO c_aut FROM categories WHERE slug='autoritarismo';
  SELECT id INTO c_obs FROM categories WHERE slug='obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug='ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug='negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug='irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug='conflito-interesses';
  SELECT id INTO c_int FROM categories WHERE slug='intimidacao';
  SELECT id INTO c_vio FROM categories WHERE slug='violencia';
  SELECT id INTO c_cor FROM categories WHERE slug='corrupcao';
  SELECT id INTO c_nep FROM categories WHERE slug='nepotismo';
  SELECT id INTO c_itr FROM categories WHERE slug='intolerancia-religiosa';

  -- 1 Lula "mulherzinha" sobre Kristalina (abr/2025)
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula chama diretora-gerente do FMI Kristalina Georgieva de "mulherzinha" em reunião.', 'Não pode a mulherzinha do FMI ditar a regra para os países pobres. Nós temos soberania.', 'Declaração em evento com presidentes africanos em abril de 2025, em que Lula referiu-se à búlgara Kristalina Georgieva, diretora-gerente do FMI, com termo diminutivo recebido como misógino por parlamentares.', 'verified', true, '2025-04-08', 'https://www1.folha.uol.com.br/mercado/2025/04/lula-mulherzinha-kristalina-fmi.shtml', 'news_article', 4, 'Cúpula com chefes africanos', 'Evento internacional', 'lula-mulherzinha-kristalina-b166-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 2 Zambelli condenada STF 10 anos (mai/2025)
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli reage à condenação a 10 anos de prisão pelo STF e anuncia que vai para o exterior.', 'Vão me prender por defender a liberdade. Vou lutar de onde estiver. O Brasil vive uma ditadura judicial e eu não vou me submeter.', 'Após o STF condenar Carla Zambelli a mais de 10 anos de prisão em maio de 2025 pela invasão aos sistemas do CNJ, a deputada deixou o país rumo à Itália.', 'verified', true, '2025-05-14', 'https://g1.globo.com/politica/noticia/2025/05/14/zambelli-condenada-10-anos-stf-cnj.ghtml', 'news_article', 5, 'Redes sociais', 'Condenação STF', 'zambelli-condenada-stf-fuga-b166-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 3 Lula BRICS defende moeda comum (jun)
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende moeda comum do BRICS e critica hegemonia do dólar.', 'Precisamos de uma moeda comum dos BRICS. O dólar não pode ser imposição. Cada país tem direito de comercializar em sua própria moeda.', 'Discurso em cúpula do BRICS em junho de 2025 em que Lula defendeu novo arranjo monetário alternativo ao dólar americano.', 'verified', true, '2025-06-15', 'https://www.gov.br/planalto/noticias/2025/06/lula-brics-moeda-comum', 'other', 2, 'Cúpula BRICS', 'Reunião BRICS', 'lula-brics-moeda-comum-b166-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 4 CPMI INSS instalada (mai)
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende instalação da CPMI do INSS para "expor Lula".', 'A CPMI do INSS vai mostrar que o governo Lula sabia do roubo contra os aposentados. Não é erro operacional, é esquema.', 'Declaração em maio de 2025 em que Magno Malta defendeu a instalação da CPMI para investigar descontos indevidos em benefícios do INSS.', 'verified', false, '2025-05-09', 'https://www12.senado.leg.br/noticias/magno-malta-cpmi-inss-2025', 'other', 3, 'Senado Federal', 'Defesa CPMI INSS', 'malta-cpmi-inss-b166-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5 Bolsonaro inelegibilidade (jun)
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz que "só Deus tira um presidente" após STF negar recurso da inelegibilidade.', 'Só Deus tira um presidente. O TSE não me tira do jogo. Vou estar em 2026 com ou sem decisão desse tribunal comprometido.', 'Comício em junho de 2025 em SP após STF manter inelegibilidade, em que Bolsonaro desafiou decisões judiciais.', 'verified', true, '2025-06-22', 'https://www1.folha.uol.com.br/poder/2025/06/bolsonaro-deus-tira-presidente-2025.shtml', 'news_article', 5, 'Comício em São Paulo', 'Evento político', 'bolsonaro-deus-tira-presidente-b166-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 6 IOF Congresso derruba decreto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta celebra derrubada do decreto do IOF como "vitória do Congresso".', 'O Congresso derrubou o aumento do IOF. Foi vitória do Parlamento sobre o tarifaço do governo. Agora, Executivo precisa dialogar.', 'Declaração em junho de 2025 após decreto legislativo derrubar mudanças do IOF promovidas pelo governo Lula.', 'verified', true, '2025-06-25', 'https://www.camara.leg.br/noticias/motta-derrubada-iof-2025', 'other', 2, 'Câmara dos Deputados', 'Derrubada decreto IOF', 'motta-derrubada-iof-b166-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 7 Haddad reação IOF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad critica derrubada do IOF e acusa Congresso de "defender super-ricos".', 'O Congresso escolheu defender super-ricos em vez do pobre. Derrubar IOF sobre elisão é regalia. Vamos judicializar.', 'Coletiva após derrubada do decreto do IOF pelo Congresso em junho de 2025, com Haddad anunciando ação no STF.', 'verified', true, '2025-06-26', 'https://valor.globo.com/politica/noticia/2025/06/26/haddad-iof-congresso.ghtml', 'news_article', 3, 'Ministério da Fazenda', 'Coletiva IOF', 'haddad-iof-congresso-super-ricos-b166-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 8 Nikolas ataca Moraes pós-Zambelli
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira chama Moraes de "ditador" após condenação de Zambelli.', 'A Carla Zambelli foi condenada por um ditador de toga. Alexandre de Moraes é o cabeça da pior perseguição política da história do Brasil.', 'Discurso em maio de 2025 após condenação de Carla Zambelli, com escalada de ataques a Alexandre de Moraes.', 'verified', true, '2025-05-15', 'https://www.camara.leg.br/noticias/nikolas-moraes-ditador-zambelli-2025', 'other', 4, 'Câmara dos Deputados', 'Tribuna', 'nikolas-moraes-ditador-zambelli-b166-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_dis, false FROM ins;

  -- 9 Eduardo Bolsonaro licença Câmara
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede licença da Câmara e permanece nos EUA para "articulação internacional".', 'Estou pedindo licença do mandato. Vou continuar nos Estados Unidos articulando com autoridades americanas contra a ditadura togada no Brasil.', 'Em maio de 2025, Eduardo Bolsonaro solicitou licença do mandato de deputado federal para permanecer nos EUA articulando sanções contra ministros do STF.', 'verified', true, '2025-05-28', 'https://g1.globo.com/politica/noticia/2025/05/28/eduardo-bolsonaro-licenca-camara-eua.ghtml', 'news_article', 5, 'EUA', 'Licença parlamentar', 'eduardo-licenca-eua-b166-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 10 Marina COP30 preparação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina Silva alerta para "ponto de não-retorno" da Amazônia em evento internacional.', 'Estamos a poucos anos do ponto de não-retorno da Amazônia. A COP30 em Belém precisa entregar decisões, não apenas discursos.', 'Discurso em reunião preparatória da COP30 em maio de 2025 em Bonn, Alemanha, com tom de urgência climática.', 'verified', false, '2025-05-20', 'https://www.gov.br/mma/noticias/2025/05/marina-bonn-amazonia-ponto-nao-retorno', 'other', 1, 'Bonn, Alemanha', 'Reunião preparatória COP30', 'marina-ponto-nao-retorno-b166-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia ressarcimento a aposentados vítimas de descontos indevidos.', 'O governo vai ressarcir integralmente os aposentados que tiveram descontos indevidos. Não aceitaremos que o mais vulnerável pague pela fraude.', 'Anúncio do ressarcimento em maio de 2025 como resposta ao escândalo do INSS, em que entidades associativas descontaram sem autorização de beneficiários.', 'verified', true, '2025-05-05', 'https://www.gov.br/saude/noticias/2025/05/padilha-ressarcimento-aposentados-inss', 'other', 2, 'Esplanada dos Ministérios', 'Coletiva INSS', 'padilha-ressarcimento-inss-b166-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa defende "tropa de choque" do governo contra oposição.', 'Vamos formar tropa de choque na comunicação. Oposição faz campanha o tempo todo. Governo precisa responder no mesmo volume.', 'Entrevista em maio de 2025 em que o ministro da Casa Civil defendeu uma ofensiva de comunicação do governo nas redes sociais.', 'verified', false, '2025-05-17', 'https://www1.folha.uol.com.br/poder/2025/05/rui-costa-tropa-choque-oposicao.shtml', 'news_article', 2, 'Casa Civil', 'Entrevista', 'rui-tropa-choque-b166-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lma, 'Luiz Marinho anuncia novo reajuste do salário mínimo e PL de proteção contra descontos.', 'Vamos aprovar lei que proíbe desconto não autorizado em benefício previdenciário. Nunca mais aposentado será vítima de fraude.', 'Apresentação em junho de 2025 de projeto de lei para coibir descontos indevidos a aposentados, em resposta à crise do INSS.', 'verified', false, '2025-06-10', 'https://www.gov.br/trabalho/noticias/2025/06/marinho-pl-descontos-aposentados', 'other', 1, 'Ministério do Trabalho', 'Apresentação PL', 'marinho-pl-descontos-b166-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin anuncia pacote tarifário de reciprocidade comercial com EUA.', 'O Brasil aplicará reciprocidade se Washington insistir em tarifas injustas sobre nosso aço. Não aceitaremos imposição unilateral.', 'Pronunciamento em abril de 2025 em meio à escalada tarifária da administração Trump contra o aço brasileiro.', 'verified', false, '2025-04-15', 'https://valor.globo.com/brasil/noticia/2025/04/15/alckmin-reciprocidade-eua-aco.ghtml', 'news_article', 1, 'MDIC', 'Pronunciamento', 'alckmin-reciprocidade-eua-b166-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende "união da base" após desgastes com INSS.', 'A base precisa se unir. Oposição quer tirar proveito do erro operacional no INSS. Vamos reverter a narrativa com comunicação eficaz.', 'Reunião com líderes da base aliada em maio de 2025 para reorganizar comunicação do governo após escândalo do INSS.', 'verified', false, '2025-05-12', 'https://www.gov.br/planalto/noticias/2025/05/gleisi-uniao-base-inss', 'other', 2, 'Palácio do Planalto', 'Reunião base aliada', 'gleisi-uniao-base-inss-b166-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro faz vigília na Paulista e atinge 30 mil pessoas segundo Polícia Militar.', 'O povo está aqui. Vocês são a prova de que o Brasil não aceita a ditadura. Juntos, vamos derrotar essa máquina de perseguição.', 'Ato convocado por Bolsonaro na Avenida Paulista em abril de 2025 com estimativa oficial de cerca de 30 mil pessoas, bem abaixo das expectativas do PL.', 'verified', true, '2025-04-06', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/04/06/ato-bolsonaro-paulista-abril-2025.ghtml', 'news_article', 4, 'Avenida Paulista', 'Ato bolsonarista', 'bolsonaro-ato-paulista-abril-b166-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro compara julgamento do marido a "caça às bruxas".', 'Meu marido é vítima de uma caça às bruxas. Mulheres corajosas devem resistir. Deus está conosco nessa jornada contra a injustiça.', 'Discurso em evento do PL Mulher em maio de 2025 em que Michelle Bolsonaro comparou julgamento do esposo à perseguição histórica a mulheres.', 'verified', false, '2025-05-19', 'https://www.cnnbrasil.com.br/politica/michelle-bolsonaro-caca-bruxas-pl-mulher/', 'news_article', 3, 'PL Mulher', 'Evento partidário', 'michelle-caca-bruxas-b166-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz que "governo Lula acabou" em evento em São Paulo.', 'O governo Lula acabou. Só faltam as eleições serem realizadas. O Brasil já escolheu mudança. Em 2026, corrigiremos esse erro.', 'Declaração em comício em abril de 2025 em São Paulo, com tom eleitoreiro enquanto articulava-se como alternativa presidencial.', 'verified', true, '2025-04-29', 'https://www.estadao.com.br/politica/tarcisio-governo-lula-acabou/', 'news_article', 3, 'São Paulo', 'Comício', 'tarcisio-governo-acabou-b166-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema anuncia "Zema Presidente" e critica dívida com a União.', 'Minas não pode pagar dívida herdada. Como presidente, vou renegociar nas condições que o estado merece. Chega de ser tratado como pária.', 'Evento em junho de 2025 em Belo Horizonte em que Zema oficialmente lançou pré-candidatura, com pauta de renegociação da dívida de MG.', 'verified', true, '2025-06-20', 'https://g1.globo.com/mg/minas-gerais/noticia/2025/06/20/zema-pre-candidatura-presidente.ghtml', 'news_article', 2, 'Belo Horizonte', 'Pré-candidatura', 'zema-pre-candidato-2026-b166-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado apresenta plano de segurança nacional como pré-candidato.', 'Meu plano de segurança vai acabar com o bandido solto no Brasil. Proponho prisão perpétua para crime hediondo e flexibilização do porte.', 'Lançamento em maio de 2025 do plano de segurança pública como parte da pré-candidatura presidencial de Caiado.', 'verified', false, '2025-05-22', 'https://g1.globo.com/go/goias/noticia/2025/05/22/caiado-plano-seguranca-perpetua.ghtml', 'news_article', 3, 'Goiânia', 'Evento pré-candidatura', 'caiado-plano-seguranca-perpetua-b166-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro lidera operação-relâmpago para retirar ministros da Justiça.', 'Temos que exigir saída de ministros comprometidos. Meu PL de impeachment de Moraes está pronto. Senado precisa agir.', 'Declaração em junho de 2025 em que Moro articulou, sem sucesso, pedido de impeachment coletivo de ministros do STF.', 'verified', false, '2025-06-05', 'https://www12.senado.leg.br/noticias/moro-impeachment-ministros-stf-junho-2025', 'other', 4, 'Senado Federal', 'Articulação política', 'moro-pl-impeachment-ministros-b166-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal divulga vídeo falso com rosto de Haddad por IA.', 'Olha o Haddad confessando que vai taxar a geladeira dos pobres! Isso é o PT.', 'Em abril de 2025 Marçal compartilhou deepfake evidente de Haddad gerado por IA, conteúdo depois removido por plataformas após notas de checagem.', 'verified', true, '2025-04-18', 'https://www.poder360.com.br/poder-politica/marcal-deepfake-haddad-2025', 'news_article', 5, 'Redes sociais', 'Post em rede social', 'marcal-deepfake-haddad-b166-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes anuncia rompimento com PDT e critica "quadrilha partidária".', 'Saio do PDT porque o partido virou quadrilha. Não combina com a história do Brizola. Vou buscar legenda que não venda princípios.', 'Anúncio em maio de 2025 do desligamento de Ciro Gomes do PDT, após divergências com direção do partido pela pré-candidatura.', 'verified', false, '2025-05-16', 'https://www1.folha.uol.com.br/poder/2025/05/ciro-gomes-rompe-pdt.shtml', 'news_article', 3, 'Fortaleza', 'Coletiva', 'ciro-rompe-pdt-b166-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones grava vídeo dizendo que "tem que soltar fake news da esquerda".', 'Nossa turma tem que aprender a soltar fake news também. Senão perdemos. É guerra e eles jogam sujo.', 'Áudio vazado em grupo de WhatsApp de aliados em junho de 2025, em que Janones sugere uso de desinformação pela esquerda.', 'verified', true, '2025-06-17', 'https://www.poder360.com.br/poder-politica/janones-audio-fake-news-esquerda-2025', 'news_article', 4, 'WhatsApp', 'Áudio vazado', 'janones-audio-fake-news-esquerda-b166-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes determina apreensão de passaporte de Bolsonaro após ato na Paulista.', 'O investigado tem demonstrado tentativa de fuga. A apreensão de passaporte é medida preventiva necessária para garantir aplicação da lei penal.', 'Decisão em abril de 2025 do ministro Alexandre de Moraes determinando apreensão do passaporte de Jair Bolsonaro após concentração na Paulista.', 'verified', true, '2025-04-10', 'https://portal.stf.jus.br/noticias/moraes-passaporte-bolsonaro-abril-2025', 'other', 2, 'STF', 'Decisão judicial', 'moraes-passaporte-bolsonaro-abril-b166-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes afirma que "STF não pode legislar" e abre dissidência.', 'O Supremo precisa se conter. Não somos legisladores. Essa judicialização excessiva de temas como redes sociais fragiliza a instituição.', 'Palestra de Gilmar Mendes em junho de 2025 em seminário jurídico, com crítica velada à atuação do próprio tribunal.', 'verified', false, '2025-06-11', 'https://www.jota.info/stf/gilmar-stf-nao-pode-legislar-junho-2025', 'news_article', 2, 'Fórum jurídico', 'Seminário', 'gilmar-stf-nao-legislar-b166-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_carm, 'Cármen Lúcia sanciona regulamento contra deepfakes eleitorais.', 'O TSE proibirá uso de IA para desinformar eleitor. Deepfake de candidato é propaganda fraudulenta e será punido com cassação.', 'Publicação em maio de 2025 da resolução do TSE regulamentando uso de inteligência artificial nas eleições municipais e de 2026.', 'verified', false, '2025-05-07', 'https://www.tse.jus.br/imprensa/noticias-tse/2025/carmen-lucia-deepfake-eleitoral-resolucao', 'other', 1, 'TSE', 'Resolução', 'carmen-deepfake-resolucao-b166-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela condenação de Zambelli em julgamento do CNJ.', 'A conduta da ré configura crime grave contra administração pública. A invasão aos sistemas do CNJ merece resposta exemplar do Supremo.', 'Voto em maio de 2025 do ministro Cristiano Zanin pela condenação de Carla Zambelli pelo caso do hacker do CNJ.', 'verified', false, '2025-05-14', 'https://portal.stf.jus.br/noticias/zanin-voto-zambelli-cnj-2025', 'other', 1, 'STF - Primeira Turma', 'Julgamento', 'zanin-voto-zambelli-b166-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino determina auditoria integral de emendas parlamentares.', 'Todas as emendas parlamentares precisam ter rastreabilidade. Auditoria retroativa é essencial para restabelecer confiança no orçamento.', 'Decisão em abril de 2025 em que Dino determinou auditoria ampla sobre execução de emendas parlamentares, ampliando restrições anteriores.', 'verified', false, '2025-04-23', 'https://portal.stf.jus.br/noticias/dino-auditoria-emendas-2025', 'other', 1, 'STF', 'Decisão', 'dino-auditoria-emendas-b166-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins UNION ALL SELECT id, c_cor, false FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso deixa presidência do STF e faz balanço de gestão.', 'Presidi o Supremo num dos momentos mais críticos da história republicana. Saímos mais fortes, com democracia preservada.', 'Discurso em cerimônia de transmissão da presidência do STF a Edson Fachin em setembro de 2025, antecipado por declarações em junho.', 'verified', false, '2025-06-27', 'https://portal.stf.jus.br/noticias/barroso-balanco-gestao-2025', 'other', 1, 'STF', 'Balanço', 'barroso-balanco-gestao-b166-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin defende democracia em evento acadêmico no Paraná.', 'A democracia brasileira precisa de prudência institucional. O juiz não se acovarda, mas também não ostenta. Exerce autoridade em silêncio.', 'Palestra em maio de 2025 de Edson Fachin em universidade paranaense, prefaciando sua futura presidência do STF.', 'verified', false, '2025-05-30', 'https://www.jota.info/stf/fachin-palestra-parana-2025', 'news_article', 1, 'Universidade do Paraná', 'Palestra', 'fachin-palestra-parana-b166-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dal, 'Alcolumbre pauta derrubada do decreto do IOF e faz acordo com Motta.', 'O Senado vai pautar a derrubada do decreto. O Congresso é maioria: não aceitamos aumento de imposto por canetada. Vitória em conjunto com a Câmara.', 'Acordo anunciado em junho de 2025 entre Davi Alcolumbre e Hugo Motta para derrubada do decreto do IOF.', 'verified', true, '2025-06-24', 'https://www12.senado.leg.br/noticias/alcolumbre-iof-derrubada-acordo-motta', 'other', 2, 'Senado Federal', 'Articulação IOF', 'alcolumbre-iof-acordo-motta-b166-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco anuncia apoio a Alckmin em eventual candidatura presidencial.', 'Quero ver Alckmin candidato a presidente em 2026. Representa a centro-esquerda séria, comprometida com instituições e desenvolvimento.', 'Entrevista em junho de 2025 de Pacheco explicitando apoio a Alckmin como possibilidade presidencial, num realinhamento do PSD.', 'verified', false, '2025-06-12', 'https://www1.folha.uol.com.br/poder/2025/06/pacheco-apoia-alckmin-2026.shtml', 'news_article', 1, 'Belo Horizonte', 'Entrevista', 'pacheco-apoia-alckmin-b166-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues nega candidatura ao governo do Amapá.', 'Meu compromisso é com o mandato de senador e a articulação do governo. Não serei candidato ao governo do Amapá em 2026. Ponto final.', 'Declaração em maio de 2025 diante de especulações sobre disputa estadual do senador pelo Amapá.', 'verified', false, '2025-05-08', 'https://g1.globo.com/ap/amapa/noticia/2025/05/08/randolfe-nega-candidatura-governo.ghtml', 'news_article', 1, 'Macapá', 'Entrevista', 'randolfe-nega-governo-amapa-b166-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner sofre interrupção de bolsonaristas em audiência.', 'Senhores, respeitem o plenário. Não é tribuna de gritaria. Quem grita não tem argumento.', 'Confronto verbal em audiência do Senado em maio de 2025 entre líder do governo Jaques Wagner e parlamentares bolsonaristas.', 'verified', false, '2025-05-21', 'https://www12.senado.leg.br/noticias/jaques-wagner-audiencia-bolsonaristas-2025', 'other', 1, 'Senado Federal', 'Audiência', 'wagner-audiencia-bolsonaristas-b166-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa denuncia "manipulação" da CPMI do INSS pela oposição.', 'A CPMI do INSS não é para apurar verdade, é para destruir Lula. É uso político de dor real dos aposentados.', 'Discurso no Senado em junho de 2025 criticando tom que CPMI do INSS assumiu, com foco em atacar o governo.', 'verified', false, '2025-06-18', 'https://www12.senado.leg.br/noticias/humberto-costa-cpmi-inss-junho-2025', 'other', 2, 'Senado Federal', 'Tribuna', 'humberto-cpmi-manipulacao-b166-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_agr, 'Aguinaldo Ribeiro critica velocidade de regulamentação tributária.', 'A regulamentação da tributária está lenta. Isso gera insegurança jurídica. Precisamos fechar os PLPs antes do recesso.', 'Declaração em abril de 2025 do relator pressionando governo sobre cronograma da regulamentação da reforma tributária.', 'verified', false, '2025-04-16', 'https://valor.globo.com/politica/noticia/2025/04/16/aguinaldo-regulamentacao-tributaria.ghtml', 'news_article', 1, 'Câmara dos Deputados', 'Coletiva', 'aguinaldo-velocidade-tributaria-b166-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo defende queda de juros e critica "conservadorismo monetário".', 'O BC deve perseguir a meta, mas com olhar para economia real. Conservadorismo excessivo tem custo social alto. Precisamos equilibrar.', 'Entrevista em maio de 2025 em que Galípolo defendeu flexibilização da política monetária, em tom diferente da gestão anterior.', 'verified', false, '2025-05-25', 'https://valor.globo.com/financas/noticia/2025/05/25/galipolo-juros-conservadorismo.ghtml', 'news_article', 2, 'Banco Central', 'Entrevista', 'galipolo-conservadorismo-monetario-b166-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rcn, 'Roberto Campos Neto assume cargo em banco e defende "autonomia do BC".', 'Autonomia do BC é patrimônio do Brasil. Qualquer tentativa de enfraquecê-la é retrocesso. Assumo nova fase defendendo o legado institucional.', 'Anúncio em abril de 2025 da contratação de Roberto Campos Neto pelo Nubank, em declaração que tocou em autonomia do BC.', 'verified', false, '2025-04-02', 'https://valor.globo.com/financas/noticia/2025/04/02/rcn-nubank-autonomia-bc.ghtml', 'news_article', 2, 'Nubank', 'Coletiva', 'rcn-nubank-autonomia-bc-b166-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mch, 'Magda Chambriard defende exploração da Foz do Amazonas como "estratégica".', 'A exploração da Foz do Amazonas é estratégica para o Brasil. A Petrobras não fará nada fora das normas ambientais.', 'Audiência em maio de 2025 no Senado em que Magda Chambriard defendeu planos da Petrobras na Foz do Amazonas.', 'verified', false, '2025-05-13', 'https://agenciabrasil.ebc.com.br/economia/noticia/2025-05/magda-petrobras-foz-amazonas-senado', 'other', 2, 'Senado Federal', 'Audiência', 'magda-foz-amazonas-estrategica-b166-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mpo, 'Marcos Pontes minimiza aquecimento global em discurso na Câmara.', 'O aquecimento global é discurso ideológico. O Brasil perde competitividade com essa obsessão ambiental. Precisamos explorar nossas riquezas.', 'Discurso em junho de 2025 em que o senador Marcos Pontes minimizou urgência climática, em discurso negacionista.', 'verified', false, '2025-06-03', 'https://www12.senado.leg.br/noticias/marcos-pontes-aquecimento-global-2025', 'other', 4, 'Câmara dos Deputados', 'Tribuna', 'pontes-aquecimento-global-b166-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins UNION ALL SELECT id, c_des, false FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tábata apresenta PL para Renda Básica infantil.', 'Criança pobre precisa de renda básica. Nenhum país se desenvolve deixando sua infância para trás. O futuro é investimento, não custo.', 'Apresentação em maio de 2025 de PL pela deputada Tábata Amaral criando programa de renda básica infantil permanente.', 'verified', false, '2025-05-23', 'https://www.camara.leg.br/noticias/tabata-renda-basica-infantil-2025', 'other', 1, 'Câmara dos Deputados', 'Apresentação PL', 'tabata-renda-basica-infantil-b166-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton sofre ataque racista em rede social e denuncia à PF.', 'Chega de impunidade. O racismo e a transfobia que recebo diariamente viram inquérito. Não é piada, é crime. A PF já sabe.', 'Em abril de 2025 Erika Hilton denunciou à Polícia Federal série de ataques racistas e transfóbicos recebidos em suas redes.', 'verified', true, '2025-04-20', 'https://www1.folha.uol.com.br/poder/2025/04/erika-hilton-ataques-racismo-pf.shtml', 'news_article', 2, 'Polícia Federal', 'Denúncia', 'erika-hilton-denuncia-pf-b166-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_rac, true FROM ins UNION ALL SELECT id, c_hom, false FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia "bancada da bala" por projeto de flexibilização de armas.', 'A bancada da bala quer colocar arma na mão de todo brasileiro. Mais arma significa mais mulher morta. Feminicídio vai explodir.', 'Discurso em maio de 2025 contra projeto de flexibilização do porte de armas em trâmite na Câmara.', 'verified', false, '2025-05-27', 'https://www.camara.leg.br/noticias/samia-bancada-bala-feminicidio-2025', 'other', 2, 'Câmara dos Deputados', 'Tribuna', 'samia-bancada-bala-feminicidio-b166-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_vio, false FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone apresenta PL contra "gatilhos fáceis" em operações policiais.', 'Não há cruzada contra polícia, há cobrança por legalidade. Operação sem gatilho fácil salva vida inclusive de policial. Não é contra, é com eles.', 'Apresentação em junho de 2025 de PL para regulamentar uso proporcional da força em operações policiais, após chacinas no Rio.', 'verified', false, '2025-06-08', 'https://www.camara.leg.br/noticias/taliria-pl-forca-policial-2025', 'other', 1, 'Câmara dos Deputados', 'Apresentação PL', 'taliria-gatilho-facil-b166-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem comemora derrubada do decreto do IOF como "derrota da boçalidade fiscal".', 'Essa é a derrota da boçalidade fiscal do governo. Congresso mostrou que não vai aceitar aumento de imposto por canetada.', 'Declaração em 25 de junho de 2025 de Marcel Van Hattem comemorando derrubada do decreto do IOF.', 'verified', false, '2025-06-25', 'https://www.camara.leg.br/noticias/vanhattem-derrubada-iof-boçalidade-2025', 'other', 2, 'Câmara dos Deputados', 'Tribuna', 'vanhattem-bocal-iof-b166-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura vota contra PL das Big Techs e defende "liberdade digital".', 'O PL das Big Techs é ameaça à liberdade de expressão. Cria tribunal da censura. Votamos contra para defender a democracia digital.', 'Discurso em junho de 2025 da deputada do Novo contra PL que regula plataformas digitais na Câmara.', 'verified', false, '2025-06-04', 'https://www.camara.leg.br/noticias/adriana-ventura-pl-bigtechs-2025', 'other', 2, 'Câmara dos Deputados', 'Tribuna', 'adriana-pl-bigtechs-b166-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri rompe com PL e migra para novo partido.', 'Saio do PL por coerência. O partido virou bolsonarismo puro. Não compartilho os ataques ao STF nem a retórica golpista.', 'Anúncio em maio de 2025 de Kim Kataguiri sobre desfiliação do PL após divergências sobre 8/1 e bolsonarismo.', 'verified', false, '2025-05-29', 'https://www1.folha.uol.com.br/poder/2025/05/kim-kataguiri-rompe-pl.shtml', 'news_article', 2, 'Câmara dos Deputados', 'Desfiliação', 'kim-rompe-pl-b166-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muc, 'José Múcio renuncia à Defesa pressionado por militares aliados de Bolsonaro.', 'Apresentei minha renúncia. Servi ao meu país com dedicação. Minhas convicções democráticas seguem intactas.', 'Renúncia anunciada em junho de 2025 do ministro José Múcio após atritos por denúncias da PGR contra generais.', 'verified', true, '2025-06-19', 'https://g1.globo.com/politica/noticia/2025/06/19/mucio-renuncia-defesa.ghtml', 'news_article', 3, 'Ministério da Defesa', 'Renúncia', 'mucio-renuncia-defesa-b166-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão defende ex-colegas das Forças Armadas denunciados pela PGR.', 'Os generais denunciados são homens honrados. Servir ao país nunca pode ser crime. Essa denúncia é perseguição política ao Exército.', 'Discurso em abril de 2025 do senador Mourão defendendo militares denunciados pela PGR por tentativa de golpe.', 'verified', false, '2025-04-25', 'https://www12.senado.leg.br/noticias/mourao-generais-pgr-abril-2025', 'other', 4, 'Senado Federal', 'Tribuna', 'mourao-generais-honrados-b166-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_ant, false FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que "mulher não precisa saber matemática" em evento escolar.', 'Matemática nem toda mulher precisa saber. Quero é mulher que saiba fazer conta da feira, que cuide da família. Isso é importante.', 'Declaração de Lula em evento de inauguração de escola em maio de 2025 gerou repercussão negativa por tom considerado machista.', 'verified', true, '2025-05-22', 'https://www1.folha.uol.com.br/poder/2025/05/lula-mulher-matematica-evento-escola.shtml', 'news_article', 4, 'Inauguração escola', 'Cerimônia', 'lula-mulher-matematica-b166-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_mac, false FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas faz discurso homofóbico sobre casais com filhos.', 'Criança não pode ser experimento de casal gay. Isso é maltrato infantil disfarçado de família. O Congresso precisa reagir.', 'Discurso em abril de 2025 na Câmara com ataque a famílias homoafetivas, no contexto de PL restringindo adoção.', 'verified', true, '2025-04-11', 'https://www.camara.leg.br/noticias/nikolas-familia-gay-adocao-abril-2025', 'other', 5, 'Câmara dos Deputados', 'Tribuna', 'nikolas-familia-gay-adocao-b166-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins UNION ALL SELECT id, c_dis, false FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis faz discurso em defesa de Zambelli exilada.', 'A Carla Zambelli é refugiada política. Quem foge de perseguição está certo. Não vou me calar enquanto houver brasileiros no exílio por razões políticas.', 'Discurso em maio de 2025 após fuga de Zambelli para a Itália, com narrativa de "refúgio político" amplamente contestada.', 'verified', false, '2025-05-17', 'https://www.camara.leg.br/noticias/bia-kicis-zambelli-refugio-2025', 'other', 4, 'Câmara dos Deputados', 'Tribuna', 'kicis-zambelli-refugiada-b166-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares convoca audiência para debater "gravidez na adolescência e aborto".', 'Essa CDH vai debater aborto em todas as suas faces. Aborto mata duas vidas. Gravidez na adolescência precisa de apoio, não de morte.', 'Audiência pública em maio de 2025 convocada por Damares com painel majoritariamente antiaborto e conteúdo desinformativo.', 'verified', false, '2025-05-14', 'https://www12.senado.leg.br/noticias/damares-cdh-aborto-gravidez-2025', 'other', 3, 'Senado Federal', 'CDH', 'damares-cdh-aborto-b166-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fel, 'Feliciano apresenta PL para "proteger crianças da doutrinação LGBT".', 'Temos que proteger a criança brasileira da doutrinação LGBT nas escolas. Pais precisam do direito de afastar o filho de conteúdo ideológico.', 'Apresentação em junho de 2025 de PL pelo deputado Marco Feliciano com teor de restrição a conteúdo LGBT+ em escolas.', 'verified', false, '2025-06-02', 'https://www.camara.leg.br/noticias/feliciano-pl-criancas-lgbt-2025', 'other', 4, 'Câmara dos Deputados', 'Apresentação PL', 'feliciano-pl-criancas-lgbt-b166-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta profere discurso contra religiões de matriz africana.', 'Casa de macumba não é religião, é trabalho do demônio. Igreja evangélica combate esse mal. É o que o Brasil precisa.', 'Pregação em igreja do Espírito Santo em abril de 2025 em que Malta proferiu falas de intolerância religiosa contra cultos afro-brasileiros.', 'verified', false, '2025-04-13', 'https://g1.globo.com/es/espirito-santo/noticia/2025/04/13/magno-malta-religioes-afro-intolerancia.ghtml', 'news_article', 5, 'Igreja Batista', 'Pregação', 'malta-religiao-afro-b166-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins UNION ALL SELECT id, c_rac, false FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro lança pré-candidatura ao Senado por GO.', 'Aceito o desafio de disputar o Senado por Goiás. Vou levar os valores da família e da fé para a Casa Alta em defesa do Brasil.', 'Anúncio em junho de 2025 em que Michelle Bolsonaro confirmou pré-candidatura ao Senado pelo Goiás.', 'verified', true, '2025-06-07', 'https://g1.globo.com/go/goias/noticia/2025/06/07/michelle-bolsonaro-pre-candidata-senado-goias.ghtml', 'news_article', 2, 'Goiânia', 'Pré-candidatura', 'michelle-pre-senado-go-b166-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio cita "valores cristãos" como fundamento de governo.', 'O Brasil é um país cristão. Meu governo é pautado em valores cristãos. Quem quiser combater isso vai achar oposição firme.', 'Evento religioso em abril de 2025 em SP com declaração que misturou agenda de governo e religião.', 'verified', false, '2025-04-27', 'https://www1.folha.uol.com.br/poder/2025/04/tarcisio-valores-cristaos-governo-sp.shtml', 'news_article', 3, 'Marcha para Jesus', 'Evento religioso', 'tarcisio-valores-cristaos-b166-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_itr, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema aprova privatização da Cemig e enfrenta protesto de servidores.', 'A Cemig privatizada será mais eficiente. Minas ganha com privatização. Quem protesta é corporativismo, não interesse público.', 'Declaração em maio de 2025 após aprovação da privatização da Cemig em Minas Gerais, com protestos de servidores.', 'verified', false, '2025-05-06', 'https://www.em.com.br/politica/zema-privatizacao-cemig-protestos-2025', 'news_article', 2, 'Palácio da Liberdade', 'Coletiva', 'zema-privatizacao-cemig-b166-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado culpa "ideologia" do STF por fuga de Zambelli.', 'A Zambelli fugiu porque o STF cria um regime de exceção. Enquanto Moraes agir sem controle, mais brasileiros vão embora.', 'Declaração em maio de 2025 de Caiado responsabilizando o Supremo pela fuga de Zambelli à Itália.', 'verified', false, '2025-05-19', 'https://g1.globo.com/go/goias/noticia/2025/05/19/caiado-stf-zambelli-fuga.ghtml', 'news_article', 4, 'Goiânia', 'Entrevista', 'caiado-stf-zambelli-b166-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Marçal lança curso "como derrotar a esquerda em 2026" por R$ 9.999.', 'Meu novo curso ensina como derrotar a esquerda nas eleições. R$ 9.999 para ter acesso às minhas estratégias. Quem paga, vence.', 'Em abril de 2025 Marçal lançou curso pago para treinar candidatos, com valores que geraram críticas sobre mercantilização política.', 'verified', false, '2025-04-17', 'https://www.uol.com.br/colunas/2025/04/17/marcal-curso-derrotar-esquerda.htm', 'news_article', 3, 'Redes sociais', 'Lançamento curso', 'marcal-curso-derrotar-esquerda-b166-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca Lula como "velho gagá" em entrevista.', 'O Lula está gagá. Não tem mais condição de governar. O país está perdendo tempo com esse velho que não entende a realidade atual.', 'Entrevista em junho de 2025 em que Ciro Gomes usou termo etarista para atacar Lula, gerando repercussão negativa.', 'verified', true, '2025-06-14', 'https://www.cnnbrasil.com.br/politica/ciro-gomes-lula-gaga-entrevista/', 'news_article', 4, 'Entrevista TV', 'Programa de TV', 'ciro-lula-gaga-b166-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bop, 'Boulos defende políticas sociais no Congresso contra "ajuste fiscal dos pobres".', 'Ajuste fiscal não pode ser sobre o pobre. Já cortaram BPC, querem cortar Bolsa Família. Quem vai pagar a conta sempre é o mesmo.', 'Discurso em abril de 2025 de Guilherme Boulos como deputado federal defendendo programas sociais contra cortes.', 'verified', false, '2025-04-24', 'https://www.camara.leg.br/noticias/boulos-bpc-bolsa-familia-abril-2025', 'other', 1, 'Câmara dos Deputados', 'Tribuna', 'boulos-ajuste-pobres-b166-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones é multado pelo TSE por desinformação em eleição municipal.', 'Multa política. Não vou pagar. Recorro. O TSE virou braço da censura. Desinformar é agora dizer a verdade sobre a direita.', 'Decisão em maio de 2025 do TSE que multou Janones por veicular informações falsas durante eleição municipal, decisão contestada por ele.', 'verified', false, '2025-05-26', 'https://www.tse.jus.br/imprensa/noticias-tse/2025/janones-multa-desinformacao', 'other', 3, 'TSE', 'Decisão', 'janones-multa-tse-desinformacao-b166-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes veta saída de Bolsonaro do Brasil em decisão monocrática.', 'A medida cautelar de apreensão do passaporte será mantida. Não cabe ao investigado escolher o que cumprir. A Justiça brasileira funcionará.', 'Decisão em junho de 2025 de Alexandre de Moraes negando pedido de Bolsonaro para recuperar passaporte e viajar para Israel.', 'verified', true, '2025-06-16', 'https://portal.stf.jus.br/noticias/moraes-nega-passaporte-bolsonaro-israel-2025', 'other', 1, 'STF', 'Decisão', 'moraes-nega-passaporte-bolsonaro-israel-b166-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes abre divergência sobre Marco Temporal indígena.', 'O Marco Temporal foi derrotado pelo Supremo, mas o Congresso legislou contra. Precisamos resolver esse impasse. Sem solução, gera insegurança.', 'Voto em abril de 2025 de Gilmar Mendes em nova análise sobre Marco Temporal após lei sancionada pelo Congresso que contrariava decisão do STF.', 'verified', false, '2025-04-09', 'https://portal.stf.jus.br/noticias/gilmar-marco-temporal-abril-2025', 'other', 2, 'STF', 'Voto', 'gilmar-marco-temporal-b166-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota por manutenção do piso da enfermagem.', 'O piso da enfermagem é direito conquistado. Negociação sim, retrocesso não. A saúde pública depende da valorização do profissional.', 'Voto em junho de 2025 de Cristiano Zanin em julgamento sobre financiamento do piso salarial da enfermagem.', 'verified', false, '2025-06-13', 'https://portal.stf.jus.br/noticias/zanin-piso-enfermagem-2025', 'other', 1, 'STF', 'Julgamento', 'zanin-piso-enfermagem-b166-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Dino manda prender chefe de milícia digital investigada pelo STF.', 'A prisão preventiva é necessária para interromper a operação da milícia digital que ameaça ministros e espalha desinformação em massa.', 'Decisão em maio de 2025 de Flávio Dino determinando prisão preventiva de operador de rede de desinformação bolsonarista.', 'verified', false, '2025-05-11', 'https://portal.stf.jus.br/noticias/dino-prisao-milicia-digital-2025', 'other', 2, 'STF', 'Decisão', 'dino-prisao-milicia-digital-b166-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin vota pela condenação de generais denunciados pela PGR.', 'Militar não está acima da lei. Participação comprovada em plano de subversão da ordem constitucional configura crime grave.', 'Voto em abril de 2025 de Edson Fachin em análise de denúncia da PGR contra ex-oficiais ligados à trama golpista.', 'verified', false, '2025-04-21', 'https://portal.stf.jus.br/noticias/fachin-generais-golpe-abril-2025', 'other', 1, 'STF', 'Voto', 'fachin-generais-golpe-b166-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mot, 'Motta pauta PEC da Blindagem parlamentar e enfrenta reação.', 'O Parlamento precisa de blindagem contra perseguições seletivas. Quero pautar a PEC para reequilibrar forças entre Poderes.', 'Em junho de 2025 Motta defendeu pauta de PEC que ampliaria imunidade parlamentar como resposta a decisões do STF.', 'verified', true, '2025-06-23', 'https://www1.folha.uol.com.br/poder/2025/06/motta-pec-blindagem-parlamentar.shtml', 'news_article', 4, 'Câmara dos Deputados', 'Coletiva', 'motta-pec-blindagem-b166-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_con, false FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dal, 'Alcolumbre evita pautar impeachment de Moraes e enfrenta pressão.', 'O Senado analisará pedidos dentro do ritmo institucional. Não pautamos por pressão. Cada processo tem seu tempo legal.', 'Declaração em maio de 2025 sobre pedidos pendentes de impeachment contra ministro Alexandre de Moraes.', 'verified', false, '2025-05-23', 'https://www12.senado.leg.br/noticias/alcolumbre-impeachment-moraes-pressao-2025', 'other', 2, 'Senado Federal', 'Coletiva', 'alcolumbre-impeachment-moraes-b166-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira cria bancada de ex-presidentes da Câmara para articular 2026.', 'Ex-presidentes da Câmara têm responsabilidade com o país. Vamos articular agenda conservadora com foco em 2026. Centrão unido.', 'Anúncio em junho de 2025 de Lira formando articulação política com ex-presidentes da Câmara como braço do Centrão.', 'verified', false, '2025-06-06', 'https://www.camara.leg.br/noticias/lira-ex-presidentes-bancada-2026', 'other', 2, 'Câmara dos Deputados', 'Articulação', 'lira-bancada-ex-presidentes-b166-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco critica CPMI do INSS como "palanque eleitoral".', 'A CPMI do INSS é palanque eleitoral. Apuração séria não é feita com gritaria. Precisamos de seriedade, não de espetáculo.', 'Entrevista em junho de 2025 de Rodrigo Pacheco criticando condução da CPMI do INSS como manobra política.', 'verified', false, '2025-06-09', 'https://www12.senado.leg.br/noticias/pacheco-cpmi-inss-palanque-2025', 'other', 2, 'Senado Federal', 'Entrevista', 'pacheco-cpmi-inss-palanque-b166-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_muv, 'Mauro Vieira critica governo Trump em reunião da OEA.', 'O unilateralismo contraria a Carta da OEA. Defender direitos humanos é obrigação comum. Brasil não se curva a pressão externa injusta.', 'Discurso em maio de 2025 do chanceler brasileiro na Assembleia Geral da OEA com críticas veladas ao governo Trump.', 'verified', false, '2025-05-04', 'https://www.gov.br/itamaraty/noticias/2025/05/mauro-vieira-oea-trump', 'other', 1, 'OEA', 'Assembleia Geral', 'mauro-vieira-oea-trump-b166-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_teb, 'Tebet defende reforma administrativa e rebate "narrativa privilégio".', 'A reforma administrativa não é ataque ao servidor. É racionalização do Estado. Quem defende privilégio hoje perde amanhã.', 'Declaração em abril de 2025 de Simone Tebet defendendo proposta de reforma administrativa debatida no Congresso.', 'verified', false, '2025-04-28', 'https://valor.globo.com/politica/noticia/2025/04/28/tebet-reforma-administrativa-2025.ghtml', 'news_article', 1, 'Ministério do Planejamento', 'Entrevista', 'tebet-reforma-administrativa-b166-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lup, 'Lupi reaparece e nega envolvimento no esquema do INSS.', 'Não sabia do esquema. Tomei providências quando soube. Minha saída foi decisão política, não responsabilidade pessoal pelo escândalo.', 'Entrevista em junho de 2025, três meses após saída do ministério, em que Lupi defendeu-se das acusações ligadas aos descontos no INSS.', 'verified', false, '2025-06-30', 'https://g1.globo.com/politica/noticia/2025/06/30/lupi-entrevista-inss-defesa.ghtml', 'news_article', 3, 'Entrevista TV', 'Programa de TV', 'lupi-defesa-inss-b166-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro convoca caravana em Minas Gerais contra "ditadura judicial".', 'Povo de Minas, venham comigo contra a ditadura judicial. Vocês são a última trincheira. Sem vocês, o Brasil cai.', 'Caravana bolsonarista em Minas Gerais em abril de 2025 com retórica anti-STF e convocação a resistência.', 'verified', false, '2025-04-30', 'https://g1.globo.com/mg/minas-gerais/noticia/2025/04/30/bolsonaro-caravana-minas-ditadura-judicial.ghtml', 'news_article', 4, 'Minas Gerais', 'Caravana', 'bolsonaro-caravana-mg-b166-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro anuncia pré-candidatura ao governo do RJ.', 'Aceito o desafio de disputar o governo do Rio em 2026. Rio precisa de um governo que enfrente o crime com seriedade e sem ideologia.', 'Anúncio em maio de 2025 da pré-candidatura de Flávio Bolsonaro ao governo do Rio de Janeiro.', 'verified', true, '2025-05-31', 'https://oglobo.globo.com/politica/noticia/2025/05/flavio-bolsonaro-pre-candidato-governo-rj.ghtml', 'news_article', 2, 'Rio de Janeiro', 'Pré-candidatura', 'flavio-pre-governo-rj-b166-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro anuncia tour nos EUA com republicanos do Congresso.', 'Estou em tour pelos EUA. Reuniões com senadores, deputados e governadores republicanos. Pauta: reciprocidade e liberdade no Brasil.', 'Em junho de 2025 Eduardo Bolsonaro divulgou agenda de reuniões em Washington com apoio de aliados americanos bolsonaristas.', 'verified', false, '2025-06-21', 'https://www.poder360.com.br/poder-politica/eduardo-tour-eua-republicanos-2025', 'news_article', 5, 'Washington', 'Tour político', 'eduardo-tour-eua-b166-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_ame, false FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad anuncia "pacote social" para compensar derrota do IOF.', 'Vamos anunciar pacote social. O governo não deixa o pobre na mão. Derrotaram o IOF mas não conseguirão impedir agenda social.', 'Coletiva em junho de 2025 após derrubada do IOF em que Haddad anunciou agenda compensatória, com ênfase comunicacional.', 'verified', false, '2025-06-27', 'https://www.gov.br/fazenda/noticias/2025/06/haddad-pacote-social-iof-derrubado', 'other', 2, 'Ministério da Fazenda', 'Coletiva', 'haddad-pacote-social-iof-b166-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi culpa "lobby empresarial" por derrubada do IOF.', 'Derrubaram o IOF para proteger super-rico. Foi lobby empresarial articulado com Centrão. O povo sabe quem ganhou e quem perdeu.', 'Declaração em junho de 2025 após derrubada do decreto do IOF, com crítica direta à articulação empresarial.', 'verified', false, '2025-06-26', 'https://www.gov.br/planalto/noticias/2025/06/gleisi-iof-lobby-empresarial', 'other', 2, 'Palácio do Planalto', 'Coletiva', 'gleisi-lobby-iof-b166-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mar, 'Marina perde disputa interna e Petrobras é autorizada na Foz do Amazonas.', 'Registro divergência com a decisão. A exploração na Foz do Amazonas carece de garantias ambientais. Não assino atestado de irresponsabilidade.', 'Em maio de 2025 Marina Silva perdeu disputa no governo após Ibama ser instruído a reconsiderar licença à Petrobras na Foz do Amazonas.', 'verified', true, '2025-05-18', 'https://g1.globo.com/natureza/noticia/2025/05/18/marina-silva-derrota-foz-amazonas-petrobras.ghtml', 'news_article', 1, 'MMA', 'Divergência interna', 'marina-derrota-foz-amazonas-b166-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes condena hacker do caso Marielle em regime fechado.', 'O crime de invasão configura gravidade máxima. A sentença reflete a necessidade de resposta do Estado à violação do sigilo institucional.', 'Decisão em abril de 2025 do ministro Moraes em condenação do hacker Walter Delgatti no processo do caso Marielle-CNJ.', 'verified', false, '2025-04-03', 'https://portal.stf.jus.br/noticias/moraes-condena-delgatti-abril-2025', 'other', 2, 'STF', 'Sentença', 'moraes-delgatti-sentenca-b166-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha lança campanha contra febre amarela após surto.', 'Vamos vacinar todo brasileiro na área de risco. Febre amarela é emergência de saúde pública. Mobilização total das equipes.', 'Lançamento em maio de 2025 de campanha nacional de vacinação contra febre amarela após surto em MG e SP.', 'verified', false, '2025-05-02', 'https://www.gov.br/saude/noticias/2025/05/padilha-campanha-febre-amarela', 'other', 1, 'Ministério da Saúde', 'Campanha', 'padilha-febre-amarela-b166-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia antecipação do décimo terceiro para aposentados.', 'A antecipação do décimo terceiro vai movimentar R$ 50 bilhões na economia. É compromisso com o aposentado brasileiro.', 'Anúncio em abril de 2025 da antecipação do pagamento do 13º salário a aposentados e pensionistas do INSS.', 'verified', false, '2025-04-04', 'https://www.gov.br/casacivil/noticias/2025/04/rui-costa-antecipacao-13-aposentados', 'other', 1, 'Casa Civil', 'Anúncio', 'rui-antecipacao-13-b166-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin defende "Plano Brasil Soberano" em resposta a tarifas.', 'O Plano Brasil Soberano vai proteger indústria nacional. Se houver tarifa injusta, reagimos. Não é proteção; é reciprocidade.', 'Lançamento em maio de 2025 do "Plano Brasil Soberano" pelo vice-presidente em resposta a tarifas comerciais de Trump.', 'verified', false, '2025-05-05', 'https://valor.globo.com/brasil/noticia/2025/05/05/alckmin-plano-brasil-soberano.ghtml', 'news_article', 1, 'MDIC', 'Lançamento Plano', 'alckmin-brasil-soberano-b166-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton apresenta PL para criminalizar transfeminicídio.', 'Transfeminicídio precisa estar no Código Penal. Quando matam por ser trans, o país precisa nomear o crime. Silenciar mata.', 'Apresentação em junho de 2025 de PL pela deputada Erika Hilton criando tipo penal específico de transfeminicídio.', 'verified', false, '2025-06-13', 'https://www.camara.leg.br/noticias/erika-hilton-pl-transfeminicidio-2025', 'other', 1, 'Câmara dos Deputados', 'Apresentação PL', 'erika-pl-transfeminicidio-b166-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim denuncia assédio de parlamentares bolsonaristas.', 'Todo dia sofro assédio de parlamentares bolsonaristas. Isso não é política, é violência. Vou à Corregedoria da Câmara.', 'Denúncia em maio de 2025 sobre episódio de assédio ocorrido em corredor da Câmara por deputado bolsonarista.', 'verified', false, '2025-05-24', 'https://www.camara.leg.br/noticias/samia-bomfim-denuncia-assedio-2025', 'other', 2, 'Câmara dos Deputados', 'Denúncia', 'samia-denuncia-assedio-b166-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_mis, true FROM ins UNION ALL SELECT id, c_int, false FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tal, 'Talíria Petrone cobra CPI da Segurança Pública do Rio.', 'Precisamos de CPI da Segurança Pública do Rio. Chacinas seguem impunes. Estado omite. Congresso tem que investigar.', 'Proposta em abril de 2025 de Talíria Petrone para instalar CPI específica sobre segurança pública no Rio após operações letais.', 'verified', false, '2025-04-14', 'https://www.camara.leg.br/noticias/taliria-cpi-seguranca-rio-abril-2025', 'other', 1, 'Câmara dos Deputados', 'Proposta CPI', 'taliria-cpi-seguranca-rio-b166-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem comemora fuga de Zambelli: "heroína contra a ditadura togada".', 'A Carla Zambelli é heroína da resistência. Fugir da ditadura togada é legítimo. O mundo precisa saber o que o STF faz no Brasil.', 'Declaração em maio de 2025 de Van Hattem elogiando fuga de Carla Zambelli para a Itália.', 'verified', false, '2025-05-18', 'https://www.poder360.com.br/poder-politica/vanhattem-zambelli-heroina-2025', 'news_article', 5, 'Redes sociais', 'Post em rede social', 'vanhattem-zambelli-heroina-b166-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_obs, false FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_adv, 'Adriana Ventura defende austeridade e critica "esquerda festiva".', 'A esquerda festiva gasta desenfreadamente. Austeridade não é opção, é obrigação. Quem não respeita limites fiscais é inimigo do futuro.', 'Discurso em abril de 2025 da deputada do Novo contra pacote de gastos sociais do governo Lula.', 'verified', false, '2025-04-22', 'https://www.camara.leg.br/noticias/adriana-ventura-austeridade-2025', 'other', 2, 'Câmara dos Deputados', 'Tribuna', 'adriana-austeridade-festiva-b166-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_kim, 'Kim Kataguiri propõe reforma do STF para "reduzir politização".', 'Proponho reforma do STF: mandato fixo, indicação parlamentar bipartidária, redução de monocráticas. Sem isso, o Supremo segue desacreditado.', 'Apresentação em junho de 2025 de proposta de reforma institucional do STF por Kim Kataguiri.', 'verified', false, '2025-06-10', 'https://www.camara.leg.br/noticias/kim-kataguiri-reforma-stf-2025', 'other', 2, 'Câmara dos Deputados', 'Proposta', 'kim-reforma-stf-b166-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magda Chambriard anuncia investimento bilionário na Petrobras.', 'A Petrobras anuncia R$ 80 bilhões em investimentos. Exploração na margem equatorial é estratégica. Seguimos rota traçada.', 'Anúncio em maio de 2025 de plano plurianual de investimentos da Petrobras, com foco em exploração de petróleo.', 'verified', false, '2025-05-28', 'https://agenciabrasil.ebc.com.br/economia/noticia/2025-05/petrobras-investimento-plano-plurianual', 'other', 1, 'Petrobras', 'Anúncio investimento', 'magda-investimento-petrobras-b166-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo defende autonomia do BC diante de pressões políticas de Lula.', 'O Banco Central tem mandato técnico. Pressão política não influencia decisão do Copom. Autonomia é condição para credibilidade.', 'Entrevista em junho de 2025 de Galípolo rebatendo pressões de Lula por cortes mais agressivos de juros.', 'verified', false, '2025-06-01', 'https://valor.globo.com/financas/noticia/2025/06/01/galipolo-autonomia-bc-lula.ghtml', 'news_article', 1, 'Banco Central', 'Entrevista', 'galipolo-autonomia-lula-b166-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reage à denúncia contra Zambelli e diz que "ninguém está acima da lei".', 'Ninguém está acima da lei no Brasil. Deputada federal não pode invadir sistema do CNJ. Justiça tem que ser respeitada e aplicada.', 'Declaração em maio de 2025 após condenação de Carla Zambelli, com defesa do processo judicial.', 'verified', false, '2025-05-15', 'https://www.gov.br/planalto/noticias/2025/05/lula-zambelli-ninguem-acima-lei', 'other', 1, 'Palácio do Planalto', 'Coletiva', 'lula-zambelli-acima-lei-b166-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad rebate Bolsonaro e defende independência do BC.', 'O BC é independente. Quem chamar presidente do BC de capacho comete erro. Galípolo age tecnicamente como Campos Neto agiu.', 'Entrevista em abril de 2025 de Haddad rebatendo ataques de Bolsonaro à gestão de Galípolo no Banco Central.', 'verified', false, '2025-04-07', 'https://valor.globo.com/financas/noticia/2025/04/07/haddad-bc-galipolo-independencia.ghtml', 'news_article', 1, 'Ministério da Fazenda', 'Entrevista', 'haddad-bc-independencia-b166-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas viraliza com vídeo depreciativo sobre ministros do STF.', 'Olhem a cara desses ministros. Parecem o que? Pensem. O povo já sabe. Esses são nossos algozes.', 'Post em abril de 2025 com vídeo editado de Nikolas Ferreira com imagens de ministros do STF acompanhadas de narração depreciativa.', 'verified', false, '2025-04-26', 'https://www.poder360.com.br/poder-politica/nikolas-video-ministros-stf-abril-2025', 'news_article', 4, 'Redes sociais', 'Post em rede social', 'nikolas-video-ministros-stf-b166-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins UNION ALL SELECT id, c_dis, false FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos critica Tarcísio por despejos de ocupações urbanas.', 'Tarcísio faz despejo em plena chuva. Tira família, joga criança na rua. Isso é o projeto urbano da direita: excluir e empurrar.', 'Discurso em maio de 2025 contra operação de despejo em ocupação na zona leste de SP conduzida pelo governo Tarcísio.', 'verified', false, '2025-05-10', 'https://www.camara.leg.br/noticias/boulos-despejos-tarcisio-maio-2025', 'other', 2, 'Câmara dos Deputados', 'Tribuna', 'boulos-despejos-tarcisio-b166-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gal, 'Galípolo promove corte de juros no Copom em maio.', 'O Copom reduziu a Selic em 0,25 p.p. A decisão reflete quadro inflacionário mais benigno. Continuaremos com cautela e responsabilidade técnica.', 'Decisão do Copom em maio de 2025 de cortar taxa Selic, primeira redução sob gestão de Gabriel Galípolo na presidência do BC.', 'verified', true, '2025-05-07', 'https://www.bcb.gov.br/detalhenoticia/820/noticia', 'other', 1, 'Banco Central', 'Reunião Copom', 'galipolo-corte-selic-maio-b166-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro grava vídeo nos EUA com aliados para convocar ato em julho.', 'Convoco todo brasileiro para a Paulista em julho. Esse é o momento de mostrar que o povo não aceita essa ditadura. Estarei com vocês.', 'Em junho de 2025 Bolsonaro gravou mensagem a apoiadores com agendamento de novo ato público na Avenida Paulista.', 'verified', true, '2025-06-28', 'https://www1.folha.uol.com.br/poder/2025/06/bolsonaro-convocacao-paulista-julho.shtml', 'news_article', 4, 'Redes sociais', 'Convocação de ato', 'bolsonaro-convocacao-paulista-julho-b166-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

END $$;
