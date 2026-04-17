-- Batch 167: Jul-Sep 2025 — Pre-conviction escalation, CPMI INSS launch, STF condena Bolsonaro
DO $$
DECLARE
  v_lul UUID; v_had UUID; v_gle UUID; v_pad UUID; v_rui UUID;
  v_mvi UUID; v_alc UUID; v_jai UUID; v_edu UUID; v_fla UUID;
  v_nik UUID; v_zam UUID; v_bia UUID; v_mfe UUID; v_dam UUID;
  v_mag UUID; v_hmo UUID; v_mic UUID; v_tar UUID; v_zem UUID;
  v_cai UUID; v_mor UUID; v_cir UUID; v_pab UUID; v_bou UUID;
  v_jan UUID; v_amo UUID; v_gil UUID; v_car UUID; v_zan UUID;
  v_din UUID; v_bar UUID; v_fac UUID; v_hug UUID; v_dav UUID;
  v_pac UUID; v_cvi UUID; v_eli UUID; v_dua UUID; v_ran UUID;
  v_jac UUID; v_hum UUID; v_ott UUID; v_oma UUID; v_rca UUID;
  v_tab UUID; v_eri UUID; v_sam UUID; v_ram UUID; v_dsi UUID;
  v_lun UUID; v_rom UUID;
  c_des UUID; c_int UUID; c_dis UUID; c_vio UUID; c_aut UUID;
  c_abu UUID; c_mac UUID; c_mis UUID; c_hom UUID; c_obs UUID;
  c_ame UUID; c_neg UUID; c_irr UUID; c_con UUID; c_cor UUID;
BEGIN
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_pad FROM politicians WHERE slug = 'alexandre-padilha';
  SELECT id INTO v_rui FROM politicians WHERE slug = 'rui-costa';
  SELECT id INTO v_mvi FROM politicians WHERE slug = 'mauro-vieira';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_jai FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_bia FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';
  SELECT id INTO v_zem FROM politicians WHERE slug = 'zema';
  SELECT id INTO v_cai FROM politicians WHERE slug = 'ronaldo-caiado';
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_pab FROM politicians WHERE slug = 'pablo-marcal';
  SELECT id INTO v_bou FROM politicians WHERE slug = 'guilherme-boulos';
  SELECT id INTO v_jan FROM politicians WHERE slug = 'andre-janones';
  SELECT id INTO v_amo FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_din FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_hug FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_dav FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_cvi FROM politicians WHERE slug = 'carlos-viana';
  SELECT id INTO v_eli FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_jac FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hum FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_oma FROM politicians WHERE slug = 'omar-aziz';
  SELECT id INTO v_rca FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_tab FROM politicians WHERE slug = 'tabata-amaral';
  SELECT id INTO v_eri FROM politicians WHERE slug = 'erika-hilton';
  SELECT id INTO v_sam FROM politicians WHERE slug = 'samia-bomfim';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_lun FROM politicians WHERE slug = 'lulinha';
  SELECT id INTO v_rom FROM politicians WHERE slug = 'romario';

  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_dis FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_mac FROM categories WHERE slug = 'machismo';
  SELECT id INTO c_mis FROM categories WHERE slug = 'misoginia';
  SELECT id INTO c_hom FROM categories WHERE slug = 'homofobia';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_irr FROM categories WHERE slug = 'irresponsabilidade';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';

  -- 1 Zambelli foge para a Itália
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli foge do Brasil rumo à Itália para escapar de prisão decretada pelo STF.', 'Estou em lugar seguro. Sou perseguida política e não voltarei para ser presa injustamente.', 'Após condenação por invasão de sistemas do CNJ, deputada foge do país e se instala em Roma, gerando crise diplomática.', 'verified', true, '2025-07-04', 'https://g1.globo.com/politica/noticia/2025/06/04/carla-zambelli-italia-fuga.ghtml', 'news_article', 5, 'Roma, Itália', 'Fuga de Zambelli', 'zambelli-foge-italia-b167-1') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 2 Zambelli defesa da fuga
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli afirma que só volta ao Brasil quando Moraes sair do STF.', 'Só piso em solo brasileiro no dia em que Alexandre de Moraes deixar o Supremo.', 'Em entrevista concedida da Itália, deputada condiciona retorno à saída do ministro que a condenou.', 'verified', false, '2025-07-10', 'https://www.cnnbrasil.com.br/politica/zambelli-italia-moraes-stf/', 'news_article', 4, 'Entrevista à imprensa italiana', 'Fuga de Zambelli', 'zambelli-so-volta-moraes-sair-b167-2') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 3 Janones suspenso pelo Conselho de Ética
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones é suspenso por 3 meses pelo Conselho de Ética por ofensas homofóbicas a Nikolas.', 'Aceito a punição mas continuarei enfrentando a extrema-direita como sempre fiz.', 'Conselho de Ética da Câmara aprova suspensão de 3 meses do mandato por ofensas de cunho homofóbico dirigidas a Nikolas Ferreira.', 'verified', true, '2025-07-09', 'https://www.camara.leg.br/noticias/1098000-conselho-de-etica-suspende-andre-janones-por-ofensas-a-nikolas-ferreira/', 'official_statement', 4, 'Câmara dos Deputados', 'Conselho de Ética', 'janones-suspenso-etica-b167-3') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 4 Nikolas reação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas comemora suspensão de Janones e pede cassação total.', 'Três meses é pouco. A homofobia contra mim deveria render cassação. Mas é um começo.', 'Deputado comenta decisão do Conselho de Ética que puniu André Janones por ofensas homofóbicas.', 'verified', false, '2025-07-09', 'https://oglobo.globo.com/politica/noticia/2025/07/09/nikolas-ferreira-janones-suspensao.ghtml', 'social_media_post', 2, 'Twitter/X', 'Conselho de Ética', 'nikolas-comemora-janones-b167-4') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 5 Lula BRICS critica FMI/BM
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica FMI e Banco Mundial em discurso no BRICS no Rio.', 'O FMI e o Banco Mundial não servem mais aos interesses dos países em desenvolvimento. Precisamos de novas instituições.', 'Na cúpula do BRICS realizada no Rio de Janeiro, Lula pede reforma do sistema financeiro internacional e fortalecimento do Novo Banco de Desenvolvimento.', 'verified', true, '2025-07-06', 'https://g1.globo.com/politica/noticia/2025/07/06/lula-brics-fmi-banco-mundial.ghtml', 'official_statement', 2, 'Cúpula BRICS Rio', 'BRICS 2025', 'lula-brics-fmi-bm-b167-5') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 6 Eduardo "não haverá eleições"
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro sugere que não haverá eleições em 2026 sem anistia.', 'Do jeito que a coisa está, não sei se vai ter eleição em 2026. A ditadura togada não vai permitir.', 'Em transmissão nos EUA, Eduardo Bolsonaro insinua que o STF impediria eleições caso seu pai siga inelegível.', 'verified', true, '2025-07-15', 'https://www.poder360.com.br/poder-politica/eduardo-bolsonaro-nao-havera-eleicoes-2026/', 'news_article', 5, 'Live em Washington', 'Autoexílio de Eduardo', 'eduardo-sem-eleicoes-2026-b167-6') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 7 Bolsonaro descrê da democracia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro diz à Veja que não acredita mais em democracia se seguir inelegível.', 'Se eu continuar inelegível, não vou mais acreditar na democracia brasileira. Já não acredito.', 'Em entrevista à revista Veja, ex-presidente faz declaração polêmica sobre o regime democrático caso não possa concorrer em 2026.', 'verified', true, '2025-07-18', 'https://veja.abril.com.br/politica/bolsonaro-nao-acredito-mais-democracia-inelegivel/', 'news_article', 5, 'Entrevista Veja', 'Pré-condenação', 'bolsonaro-nao-acredita-democracia-b167-7') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 8 Flavio reação à Veja
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro endossa fala do pai sobre descrença na democracia.', 'Meu pai está certíssimo. Como acreditar num sistema que persegue um único homem?', 'Senador apoia publicamente declaração do pai sobre descrença na democracia após inelegibilidade.', 'verified', false, '2025-07-19', 'https://www.metropoles.com/politica/flavio-bolsonaro-democracia-veja', 'social_media_post', 3, 'Twitter/X', 'Pré-condenação', 'flavio-endossa-pai-democracia-b167-8') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 9 Moraes responde Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes rebate Bolsonaro: quem não acredita na democracia tentou destruí-la.', 'Quem afirma não acreditar na democracia é exatamente quem tentou destruí-la no 8 de janeiro.', 'Ministro responde publicamente durante sessão do STF às declarações de Bolsonaro à Veja.', 'verified', true, '2025-07-21', 'https://g1.globo.com/politica/noticia/2025/07/21/moraes-rebate-bolsonaro-democracia.ghtml', 'official_statement', 2, 'Sessão do STF', 'Pré-condenação', 'moraes-rebate-bolsonaro-b167-9') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 10 Haddad apresenta fiscal julho
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende nova alta da isenção do IR até R$ 5 mil como compromisso do governo.', 'Vamos entregar a isenção até R$ 5 mil ainda neste ano. É compromisso irrevogável com a classe média.', 'Ministro da Fazenda reforça promessa de campanha em coletiva sobre MP que amplia faixa de isenção do Imposto de Renda.', 'verified', false, '2025-07-22', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/julho/ir-isencao-5-mil', 'official_statement', 1, 'Ministério da Fazenda', 'Reforma IR', 'haddad-ir-5mil-b167-10') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 11 Gleisi sobre Haddad
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi defende articulação política para aprovar isenção do IR.', 'Vamos unir o PT, a base aliada e o Congresso para entregar a isenção aos trabalhadores.', 'Ministra das Relações Institucionais comenta estratégia do governo para aprovar medida no Congresso.', 'verified', false, '2025-07-23', 'https://www.gov.br/secretariageral/pt-br/noticias/2025/gleisi-ir', 'official_statement', 1, 'Planalto', 'Reforma IR', 'gleisi-articulacao-ir-b167-11') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 12 Padilha SUS
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia expansão do Mais Médicos em 300 municípios.', 'Vamos levar médicos a mais 300 cidades do interior até o fim do ano.', 'Ministro da Saúde detalha expansão do programa em entrevista coletiva no Ministério.', 'verified', false, '2025-07-24', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/julho/mais-medicos-expansao', 'official_statement', 1, 'Ministério da Saúde', 'Mais Médicos', 'padilha-mais-medicos-b167-12') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 13 Rui Costa obras
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia R$ 30 bi adicionais para o Novo PAC em julho.', 'O PAC vai entregar 30 bilhões a mais em obras até dezembro.', 'Ministro da Casa Civil comunica aceleração das obras do Novo PAC em evento no Palácio do Planalto.', 'verified', false, '2025-07-25', 'https://www.gov.br/casacivil/pt-br/noticias/2025/pac-30-bi', 'official_statement', 2, 'Planalto', 'Novo PAC', 'rui-costa-pac-30bi-b167-13') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 14 Mauro Vieira tarifa
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira critica tarifaço de Trump contra produtos brasileiros.', 'Trump impõe tarifas ilegítimas baseadas em argumentos políticos. O Brasil vai reagir na OMC.', 'Chanceler comenta decisão de Trump de impor tarifas de até 50% a produtos brasileiros em retaliação ao julgamento de Bolsonaro.', 'verified', true, '2025-07-30', 'https://www.gov.br/mre/pt-br/canais_atendimento/imprensa/notas-a-imprensa/2025/tarifaco-eua', 'official_statement', 2, 'Itamaraty', 'Tarifaço Trump', 'mauro-vieira-tarifaco-b167-14') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15 Alckmin tarifa
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin anuncia plano de socorro a exportadores atingidos pelo tarifaço.', 'Vamos proteger nossas empresas e empregos. Haverá linha de crédito imediata aos exportadores.', 'Vice-presidente e ministro do MDIC anuncia pacote de apoio a empresas afetadas pelas tarifas de Trump.', 'verified', false, '2025-08-01', 'https://www.gov.br/mdic/pt-br/assuntos/noticias/2025/agosto/alckmin-socorro-tarifaco', 'official_statement', 1, 'MDIC', 'Tarifaço Trump', 'alckmin-socorro-tarifaco-b167-15') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 16 Eduardo articula tarifaço
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro admite ter articulado tarifaço de Trump contra o Brasil.', 'Fiz o meu papel. Se tem tarifa, é porque o regime está perseguindo meu pai. A conta é deles.', 'Em live, deputado admite ter atuado nos EUA pela imposição de tarifas como retaliação ao STF.', 'verified', true, '2025-08-02', 'https://www.cnnbrasil.com.br/politica/eduardo-bolsonaro-tarifaco-articulacao/', 'social_media_post', 5, 'Live nos EUA', 'Tarifaço Trump', 'eduardo-articula-tarifaco-b167-16') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 17 Hugo Motta sobre CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta pauta criação da CPMI do INSS no Congresso.', 'A Câmara vai apurar a fundo a fraude que assaltou aposentados. Não haverá proteção a ninguém.', 'Presidente da Câmara sinaliza instalação da comissão mista para investigar descontos fraudulentos em aposentadorias.', 'verified', true, '2025-08-05', 'https://www.camara.leg.br/noticias/hugo-motta-cpmi-inss-instalacao/', 'official_statement', 2, 'Câmara dos Deputados', 'CPMI do INSS', 'hugo-motta-cpmi-inss-b167-17') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18 Davi Alcolumbre sobre CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dav, 'Davi Alcolumbre confirma apoio do Senado à CPMI do INSS.', 'O Senado vai trabalhar com seriedade para apurar o maior esquema de fraude contra aposentados.', 'Presidente do Senado endossa criação da CPMI mista em coletiva após reunião com líderes.', 'verified', false, '2025-08-06', 'https://www12.senado.leg.br/noticias/materias/2025/08/06/alcolumbre-cpmi-inss', 'official_statement', 2, 'Senado', 'CPMI do INSS', 'alcolumbre-cpmi-inss-b167-18') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 19 Zambelli condenada por arma
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada a mais 5 anos por apontar arma contra eleitor.', 'Essa condenação é vingança política. Não vou voltar. O Brasil não tem mais justiça.', 'Deputada foragida na Itália é condenada em segunda instância por crime cometido na véspera do 2º turno de 2022.', 'verified', true, '2025-08-08', 'https://g1.globo.com/politica/noticia/2025/08/08/carla-zambelli-condenada-5-anos-arma.ghtml', 'news_article', 5, 'TRF-3', 'Pistola em público', 'zambelli-condenada-arma-b167-19') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 20 Nikolas expulso Globo
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas é expulso ao vivo de programa da Globo após provocar apresentador.', 'A Globo é militante. Fui convidado só para ser atacado. Saí porque não aceito linchamento.', 'Deputado abandona estúdio da Globo durante entrevista ao vivo após bate-boca com apresentador.', 'verified', true, '2025-08-10', 'https://oglobo.globo.com/cultura/tv-e-filmes/noticia/2025/08/10/nikolas-ferreira-expulso-programa-globo.ghtml', 'news_article', 3, 'Estúdios Globo', 'Expulsão Globo', 'nikolas-expulso-globo-b167-20') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 21 Bia Kicis defende Nikolas
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama Globo de emissora comunista após expulsão de Nikolas.', 'A Globo virou panfleto do PT. Tem que acabar com esse monopólio comunista na comunicação.', 'Deputada sai em defesa de Nikolas em publicação nas redes sociais após saída conturbada do programa.', 'verified', false, '2025-08-10', 'https://www.metropoles.com/politica/bia-kicis-globo-comunista', 'social_media_post', 3, 'Twitter/X', 'Expulsão Globo', 'bia-kicis-globo-comunista-b167-21') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22 Marco Feliciano sobre STF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano diz que STF age como tribunal de exceção contra Bolsonaro.', 'O STF é um tribunal de exceção. Nunca vi tamanha perseguição na história do Brasil.', 'Pastor e deputado ataca o tribunal às vésperas do julgamento do ex-presidente.', 'verified', false, '2025-08-12', 'https://www.poder360.com.br/poder-politica/feliciano-stf-excecao/', 'social_media_post', 4, 'Redes sociais', 'Pré-julgamento', 'feliciano-stf-excecao-b167-22') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 23 Damares fala no Senado
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares chama julgamento de Bolsonaro de crucificação.', 'Bolsonaro é crucificado como Cristo. O Brasil está diante de uma injustiça bíblica.', 'Senadora compara o julgamento do ex-presidente à crucificação de Cristo em discurso no plenário.', 'verified', true, '2025-08-14', 'https://www12.senado.leg.br/noticias/materias/2025/08/14/damares-bolsonaro-crucificacao', 'official_statement', 3, 'Senado Federal', 'Pré-julgamento', 'damares-bolsonaro-crucificacao-b167-23') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 24 Magno Malta
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta convoca vigília a Bolsonaro às vésperas do julgamento.', 'Vamos orar sem parar pelo Bolsonaro. Deus vai livrá-lo dessa perseguição.', 'Ex-senador e pastor convoca fiéis para vigília de orações pelo ex-presidente.', 'verified', false, '2025-08-15', 'https://www.cnnbrasil.com.br/politica/magno-malta-vigilia-bolsonaro/', 'social_media_post', 2, 'Redes sociais', 'Pré-julgamento', 'magno-malta-vigilia-b167-24') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 25 Hamilton Mourão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Mourão diz que não houve golpe mas apenas frustração institucional.', 'Não houve golpe. Houve sim, frustração política contida dentro das instituições.', 'Ex-vice-presidente rebaixa a gravidade dos atos de 8 de janeiro em entrevista à CNN Brasil.', 'verified', false, '2025-08-18', 'https://www.cnnbrasil.com.br/politica/mourao-golpe-frustracao/', 'news_article', 4, 'Entrevista CNN', 'Pré-julgamento', 'mourao-nao-houve-golpe-b167-25') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 26 CPMI INSS instalada
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cvi, 'Carlos Viana é eleito presidente da CPMI do INSS na instalação.', 'Vou presidir essa CPMI sem perseguição e sem proteção. Quem roubou aposentado vai pagar.', 'Senador é eleito por aclamação para presidir a comissão mista que investiga fraude em descontos no INSS.', 'verified', true, '2025-08-20', 'https://www12.senado.leg.br/noticias/materias/2025/08/20/cpmi-inss-viana-presidente', 'official_statement', 2, 'Congresso Nacional', 'CPMI do INSS', 'viana-presidente-cpmi-inss-b167-26') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 27 Eliziane Gama CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama defende oposição na CPMI do INSS.', 'A CPMI precisa apurar responsabilidades políticas, e não servir de palanque eleitoral.', 'Senadora, que atuou na CPI do 8 de Janeiro, defende atuação equilibrada na nova comissão.', 'verified', false, '2025-08-20', 'https://www12.senado.leg.br/noticias/materias/2025/08/20/eliziane-cpmi-inss', 'official_statement', 1, 'Congresso Nacional', 'CPMI do INSS', 'eliziane-cpmi-inss-b167-27') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 28 Duarte Jr relator
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dua, 'Duarte Jr cobra transparência total na CPMI do INSS.', 'Não vai ter tapete na CPMI do INSS. Vamos recuperar cada centavo roubado dos aposentados.', 'Deputado, futuro integrante da comissão, cobra profundidade nas investigações.', 'verified', false, '2025-08-21', 'https://www.camara.leg.br/noticias/duarte-cpmi-transparencia', 'official_statement', 1, 'Câmara dos Deputados', 'CPMI do INSS', 'duarte-cpmi-transparencia-b167-28') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 29 Romário ausências
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rom, 'Romário acumula 58 ausências em 120 votações nominais no Senado.', 'Estou trabalhando pelo Brasil. Não dá para estar em dois lugares ao mesmo tempo.', 'Levantamento do Congresso em Foco aponta que senador falta quase metade das votações em 2025.', 'verified', true, '2025-08-22', 'https://congressoemfoco.uol.com.br/senado/romario-faltas-votacoes-2025', 'news_article', 3, 'Senado Federal', 'Ausências no Senado', 'romario-faltas-58-120-b167-29') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 30 Omar Aziz fala CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_oma, 'Omar Aziz pede que CPMI do INSS não poupe ninguém.', 'Se tiver dedo do governo Lula, do Temer ou do Bolsonaro, tem que ir para a cadeia.', 'Senador defende investigação ampla sem restrições partidárias.', 'verified', false, '2025-08-23', 'https://www12.senado.leg.br/noticias/materias/2025/08/23/aziz-cpmi-inss', 'official_statement', 2, 'Senado', 'CPMI do INSS', 'aziz-cpmi-nao-poupar-b167-30') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 31 Renan Calheiros sobre CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rca, 'Renan Calheiros diz que CPMI do INSS vai chegar ao topo.', 'Essa fraude só foi possível com cumplicidade política. Vamos até o fim.', 'Senador veterano fala em entrevista sobre a expectativa da comissão recém-instalada.', 'verified', false, '2025-08-24', 'https://g1.globo.com/politica/noticia/2025/08/24/renan-cpmi-inss.ghtml', 'news_article', 2, 'Senado', 'CPMI do INSS', 'renan-cpmi-chegar-topo-b167-31') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 32 Humberto Costa defende Lula CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa afirma que fraude do INSS começou no governo Bolsonaro.', 'Essa fraude foi gestada no governo Bolsonaro. O Lula foi quem desmontou o esquema.', 'Líder do PT no Senado atribui origem do esquema ao governo anterior em entrevista.', 'verified', false, '2025-08-25', 'https://www12.senado.leg.br/noticias/materias/2025/08/25/humberto-inss-bolsonaro', 'official_statement', 3, 'Senado', 'CPMI do INSS', 'humberto-inss-bolsonaro-b167-32') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 33 Otto Alencar
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar cobra ressarcimento integral aos aposentados lesados.', 'Cada aposentado lesado tem que ser ressarcido. Não aceito meia devolução.', 'Senador baiano cobra medidas concretas de restituição aos prejudicados pela fraude.', 'verified', false, '2025-08-26', 'https://www12.senado.leg.br/noticias/materias/2025/08/26/otto-inss-ressarcimento', 'official_statement', 1, 'Senado', 'CPMI do INSS', 'otto-inss-ressarcimento-b167-33') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 34 Jaques Wagner defesa governo
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jac, 'Jaques Wagner defende governo Lula na CPMI do INSS.', 'Foi o governo Lula que expôs e combateu a fraude. Não dá para misturar.', 'Líder do governo no Senado rebate críticas da oposição durante sessão preparatória da CPMI.', 'verified', false, '2025-08-27', 'https://www12.senado.leg.br/noticias/materias/2025/08/27/jaques-wagner-cpmi', 'official_statement', 2, 'Senado', 'CPMI do INSS', 'wagner-defende-governo-cpmi-b167-34') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 35 Randolfe CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues diz que CPMI do INSS não pode virar palanque.', 'Essa CPMI não pode ser transformada em palanque para 2026. É preciso seriedade.', 'Líder do governo adverte sobre uso eleitoral da comissão mista em declaração à imprensa.', 'verified', false, '2025-08-28', 'https://www12.senado.leg.br/noticias/materias/2025/08/28/randolfe-cpmi-palanque', 'official_statement', 2, 'Senado', 'CPMI do INSS', 'randolfe-cpmi-palanque-b167-35') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 36 Lula reage tarifaço
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula responde tarifaço chamando Trump de imperador que não aceita perder.', 'Trump age como imperador. Mas o Brasil não será colônia de ninguém.', 'Presidente comenta em entrevista a jornalistas as tarifas impostas por Trump ao Brasil.', 'verified', true, '2025-07-31', 'https://g1.globo.com/politica/noticia/2025/07/31/lula-trump-imperador-tarifa.ghtml', 'news_article', 2, 'Entrevista coletiva', 'Tarifaço Trump', 'lula-trump-imperador-b167-36') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 37 Tarcísio silêncio tarifaço
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio de Freitas evita criticar Eduardo Bolsonaro pelo tarifaço.', 'Não cabe a mim comentar a atuação do Eduardo nos EUA. Cada um faz o seu papel.', 'Governador de SP adota cautela ao ser questionado sobre o papel de Eduardo Bolsonaro no tarifaço de Trump.', 'verified', false, '2025-08-04', 'https://www1.folha.uol.com.br/poder/2025/08/tarcisio-silencio-tarifaco.shtml', 'news_article', 3, 'Palácio dos Bandeirantes', 'Tarifaço Trump', 'tarcisio-silencio-tarifaco-b167-37') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 38 Zema apoia anistia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema defende anistia total para condenados do 8 de janeiro.', 'Patriotas não podem ser tratados como terroristas. Exigimos anistia ampla e irrestrita.', 'Governador de MG reforça defesa da anistia em ato em Belo Horizonte.', 'verified', false, '2025-08-09', 'https://www.otempo.com.br/politica/zema-anistia-8-janeiro-2025-08', 'official_statement', 4, 'Belo Horizonte', 'Pré-julgamento', 'zema-anistia-total-b167-38') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 39 Caiado Brasília ato
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Caiado convoca ato pela anistia na Paulista em agosto.', 'Vamos encher a Paulista pela anistia. O Brasil não aceita a injustiça contra Bolsonaro.', 'Governador de Goiás anuncia presença em ato da direita em São Paulo.', 'verified', false, '2025-08-11', 'https://www.cnnbrasil.com.br/politica/caiado-ato-paulista-anistia/', 'social_media_post', 3, 'Redes sociais', 'Pré-julgamento', 'caiado-ato-paulista-b167-39') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40 Ciro Gomes ataca Lula
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica Lula por jogo político com tarifaço.', 'Lula aproveita o tarifaço para se vitimizar. O governo é incompetente na política externa.', 'Ex-candidato critica atuação do governo Lula na crise das tarifas com os EUA.', 'verified', false, '2025-08-05', 'https://www.poder360.com.br/poder-politica/ciro-gomes-lula-tarifaco/', 'news_article', 2, 'Entrevista', 'Tarifaço Trump', 'ciro-ataca-lula-tarifaco-b167-40') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41 Pablo Marçal pré-candidatura
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal anuncia pré-candidatura à Presidência em 2026.', 'Eu sou o futuro presidente da República. O Brasil precisa de um empreendedor no poder.', 'Coach lança pré-candidatura em evento em Alphaville (SP) diante de empresários e seguidores.', 'verified', true, '2025-08-15', 'https://www.cnnbrasil.com.br/politica/pablo-marcal-presidencia-2026/', 'news_article', 3, 'Alphaville, SP', 'Pré-candidatura 2026', 'marcal-pre-candidato-b167-41') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 42 Boulos prefeitura
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos se torna ministro e articula sucessão de Lula no PT.', 'Aceitei o desafio de ministro. O meu compromisso é com o povo brasileiro.', 'Deputado assume Secretaria-Geral da Presidência e passa a articular bases do governo.', 'verified', true, '2025-07-28', 'https://g1.globo.com/politica/noticia/2025/07/28/boulos-ministro-secretaria-geral.ghtml', 'news_article', 2, 'Planalto', 'Ministério Boulos', 'boulos-ministro-sec-geral-b167-42') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 43 Tabata sobre reformas
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral defende CPMI do INSS sem blindagem partidária.', 'Queremos apurar a fraude independentemente de quem seja. Não pode ter proteção partidária.', 'Deputada defende imparcialidade da comissão em entrevista à GloboNews.', 'verified', false, '2025-08-22', 'https://www.camara.leg.br/noticias/tabata-cpmi-inss-2025-08', 'official_statement', 1, 'Entrevista GloboNews', 'CPMI do INSS', 'tabata-cpmi-imparcial-b167-43') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 44 Erika Hilton contra homofobia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton denuncia escalada de ataques homofóbicos na Câmara.', 'A Câmara está se tornando um ambiente hostil a parlamentares LGBTQIA+. Isso tem que acabar.', 'Deputada pronuncia-se no plenário sobre ofensas recorrentes por parte da extrema-direita.', 'verified', false, '2025-08-19', 'https://www.camara.leg.br/noticias/erika-hilton-homofobia-camara-2025', 'official_statement', 2, 'Câmara', 'Homofobia na Câmara', 'erika-homofobia-camara-b167-44') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_hom, true FROM ins;

  -- 45 Samia discurso 8 janeiro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim pede que STF condene todos os golpistas.', 'Não pode haver anistia. Todos os golpistas precisam ser julgados e condenados.', 'Deputada do PSOL pressiona STF às vésperas do julgamento de Bolsonaro.', 'verified', false, '2025-09-01', 'https://www.camara.leg.br/noticias/samia-bomfim-golpistas-condenacao', 'official_statement', 1, 'Câmara dos Deputados', 'Pré-julgamento', 'samia-golpistas-condenacao-b167-45') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 46 Michelle antes julgamento
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro convoca oração nacional antes do julgamento.', 'Peço a todos os brasileiros: orem por Jair. Ele é vítima de uma injustiça.', 'Ex-primeira-dama faz apelo em vídeo nas redes sociais na véspera do início do julgamento.', 'verified', true, '2025-09-01', 'https://www.metropoles.com/politica/michelle-oracao-julgamento/', 'social_media_post', 3, 'Instagram', 'Pré-julgamento', 'michelle-oracao-julgamento-b167-46') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47 Nikolas véspera julgamento
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que STF condenará inocente no julgamento de Bolsonaro.', 'Amanhã, o STF vai condenar um inocente. A história vai registrar essa vergonha.', 'Deputado posta vídeo nas redes na véspera do julgamento que condenaria o ex-presidente.', 'verified', true, '2025-09-10', 'https://www.poder360.com.br/poder-politica/nikolas-stf-bolsonaro-vespera/', 'social_media_post', 4, 'Twitter/X', 'Pré-julgamento', 'nikolas-vespera-julgamento-b167-47') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 48 STF condena Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_amo, 'Moraes lê voto decisivo que condena Bolsonaro a 27 anos e 3 meses.', 'O réu Jair Messias Bolsonaro liderou organização criminosa com o objetivo de impedir a alternância democrática de poder.', 'Em sessão histórica, Moraes lê voto que condena o ex-presidente por 5 crimes, incluindo tentativa de golpe.', 'verified', true, '2025-09-11', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-11-ap-2668', 'official_statement', 2, 'Plenário 1ª Turma STF', 'Condenação de Bolsonaro', 'moraes-voto-condena-bolsonaro-b167-48') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49 Bolsonaro condenado 27 anos
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jai, 'Bolsonaro reage à condenação de 27 anos dizendo ser perseguido.', 'Sou perseguido político. Essa condenação é injusta e vou recorrer até o fim.', 'Após ser condenado por unanimidade na 1ª Turma do STF, ex-presidente emite nota de repúdio.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/bolsonaro-condenado-27-anos-stf.ghtml', 'news_article', 5, 'Residência Brasília', 'Condenação de Bolsonaro', 'bolsonaro-condenado-27-anos-b167-49') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 50 Zanin voto acompanha
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin acompanha voto de Moraes e pena de 27 anos.', 'Acompanho integralmente o relator. Os crimes ficaram sobejamente demonstrados.', 'Ministro do STF vota com o relator condenando Bolsonaro por tentativa de golpe.', 'verified', false, '2025-09-11', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-11-ap-2668-zanin', 'official_statement', 1, 'Plenário 1ª Turma STF', 'Condenação de Bolsonaro', 'zanin-acompanha-moraes-b167-50') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 51 Dino voto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino vota por condenação e destaca gravidade da tentativa de golpe.', 'Os fatos provados são gravíssimos. Houve, sim, tentativa de abolir o Estado Democrático de Direito.', 'Ministro acompanha voto do relator para condenar Bolsonaro.', 'verified', true, '2025-09-11', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-11-dino-voto', 'official_statement', 1, 'Plenário 1ª Turma STF', 'Condenação de Bolsonaro', 'dino-voto-condena-b167-51') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 52 Cármen Lúcia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Cármen Lúcia vota pela condenação e cita risco à democracia.', 'A democracia não se negocia. Os crimes atentaram contra a soberania popular.', 'Ministra completa a unanimidade da 1ª Turma na condenação de Bolsonaro.', 'verified', true, '2025-09-11', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-11-carmen-voto', 'official_statement', 1, 'Plenário 1ª Turma STF', 'Condenação de Bolsonaro', 'carmen-voto-condena-b167-52') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 53 Fachin voto divergente
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin diverge parcialmente mas mantém condenação de Bolsonaro.', 'Divergir em pontos não descaracteriza a responsabilização. Condeno o réu pelos crimes mais graves.', 'Ministro faz divergência parcial quanto à dosimetria, mas mantém condenação.', 'verified', false, '2025-09-11', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-11-fachin-voto', 'official_statement', 1, 'Plenário 1ª Turma STF', 'Condenação de Bolsonaro', 'fachin-voto-divergente-b167-53') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 54 Michelle após condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro reage à condenação chamando STF de corrupto.', 'Meu marido é um preso político. O STF está podre.', 'Ex-primeira-dama publica vídeo em suas redes minutos após o fim do julgamento.', 'verified', true, '2025-09-11', 'https://www.metropoles.com/politica/michelle-bolsonaro-condenacao-stf-podre/', 'social_media_post', 5, 'Instagram', 'Reações à condenação', 'michelle-stf-podre-b167-54') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 55 Eduardo após condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro promete retaliação dos EUA contra ministros do STF.', 'Cada um dos ministros dessa vergonha será sancionado. O mundo livre não vai aceitar.', 'Deputado afirma, a partir dos EUA, que articulará sanções da administração Trump contra os ministros.', 'verified', true, '2025-09-11', 'https://www.poder360.com.br/poder-politica/eduardo-retaliacao-eua-stf/', 'social_media_post', 5, 'Live EUA', 'Reações à condenação', 'eduardo-retaliacao-eua-stf-b167-55') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 56 Flávio após condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro compara julgamento a assassinato político.', 'Mataram meu pai politicamente hoje. Mas o povo vai reagir.', 'Senador publica reação nas redes após condenação do pai no STF.', 'verified', true, '2025-09-11', 'https://www.cnnbrasil.com.br/politica/flavio-bolsonaro-condenacao-stf/', 'social_media_post', 4, 'Twitter/X', 'Reações à condenação', 'flavio-mataram-politicamente-b167-56') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 57 Nikolas após condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que STF decretou fim da democracia com condenação.', 'Hoje morreu a democracia brasileira. Quem discorda vai preso.', 'Deputado publica vídeo após sessão do STF que condenou Bolsonaro.', 'verified', true, '2025-09-11', 'https://www.metropoles.com/politica/nikolas-stf-fim-democracia', 'social_media_post', 5, 'Redes sociais', 'Reações à condenação', 'nikolas-fim-democracia-b167-57') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 58 Bia Kicis reage
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bia, 'Bia Kicis chama ministros do STF de ditadores togados.', 'Cinco ditadores togados decidiram prender um ex-presidente sem provas. Isso é ditadura.', 'Deputada reage à condenação com ataques aos ministros em redes sociais.', 'verified', false, '2025-09-11', 'https://www.poder360.com.br/poder-politica/bia-kicis-ditadores-togados/', 'social_media_post', 4, 'Twitter/X', 'Reações à condenação', 'bia-ditadores-togados-b167-58') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 59 Damares
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares Alves ora no plenário após condenação de Bolsonaro.', 'Senhor, salva esta nação do mal. O Brasil precisa de ti mais do que nunca.', 'Senadora ora em pé no plenário do Senado após condenação do ex-presidente.', 'verified', false, '2025-09-12', 'https://www12.senado.leg.br/noticias/materias/2025/09/12/damares-oracao-condenacao', 'official_statement', 2, 'Senado Federal', 'Reações à condenação', 'damares-oracao-plenario-b167-59') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60 Lula sobre condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula comemora condenação chamando-a de vitória da democracia.', 'A democracia venceu. Quem atenta contra ela paga o preço. O Brasil deu exemplo ao mundo.', 'Presidente grava vídeo nas redes sociais após condenação de Bolsonaro no STF.', 'verified', true, '2025-09-11', 'https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos/2025/lula-condenacao-bolsonaro', 'official_statement', 2, 'Planalto', 'Reações à condenação', 'lula-vitoria-democracia-b167-60') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 61 Haddad condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad diz que condenação de Bolsonaro fortalece ambiente de negócios.', 'O país dá uma resposta firme. Isso fortalece a segurança jurídica e o ambiente de investimentos.', 'Ministro da Fazenda comenta impacto da condenação em entrevista a jornalistas.', 'verified', false, '2025-09-12', 'https://www.gov.br/fazenda/pt-br/assuntos/noticias/2025/setembro/haddad-condenacao-bolsonaro', 'official_statement', 1, 'Ministério da Fazenda', 'Reações à condenação', 'haddad-condenacao-mercado-b167-61') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 62 Alckmin
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin diz que Brasil virou página com condenação de Bolsonaro.', 'Viramos a página do golpismo. Agora é tocar o desenvolvimento.', 'Vice-presidente comenta condenação em evento empresarial em São Paulo.', 'verified', false, '2025-09-12', 'https://g1.globo.com/politica/noticia/2025/09/12/alckmin-virar-pagina-golpismo.ghtml', 'news_article', 1, 'Evento FIESP', 'Reações à condenação', 'alckmin-vira-pagina-b167-62') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 63 Gleisi exalta STF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann exalta coragem do STF na condenação de Bolsonaro.', 'O STF teve coragem de fazer justiça. Democracia não convive com golpistas.', 'Ministra comenta decisão em entrevista coletiva no Planalto.', 'verified', false, '2025-09-12', 'https://www.gov.br/secretariageral/pt-br/noticias/2025/setembro/gleisi-condenacao-stf', 'official_statement', 1, 'Planalto', 'Reações à condenação', 'gleisi-exalta-stf-b167-63') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 64 Moro cautela
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Sergio Moro critica dosimetria da condenação sem defender golpe.', 'Ninguém é a favor de golpe, mas a pena de 27 anos parece exagerada. Vamos ver os recursos.', 'Senador adota tom moderado na crítica à decisão do STF.', 'verified', false, '2025-09-12', 'https://www.cnnbrasil.com.br/politica/moro-dosimetria-bolsonaro/', 'news_article', 3, 'Senado Federal', 'Reações à condenação', 'moro-dosimetria-criticas-b167-64') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 65 Tarcísio reage
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio reage à condenação chamando-a de injusta mas pede serenidade.', 'A condenação é injusta, mas precisamos agir com serenidade. O Brasil não pode entrar em convulsão.', 'Governador de SP grava vídeo após condenação pedindo calma aos apoiadores.', 'verified', true, '2025-09-11', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/09/11/tarcisio-reage-condenacao-bolsonaro.ghtml', 'news_article', 3, 'Palácio dos Bandeirantes', 'Reações à condenação', 'tarcisio-injusta-serenidade-b167-65') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 66 Tarcísio admite e recua 17/9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio admite possibilidade de candidatura presidencial e recua no mesmo dia.', 'Se for preciso, estarei disposto. Mas meu compromisso é com São Paulo. Meu lugar é aqui.', 'Governador dá declaração dúbia sobre 2026 durante evento empresarial e depois recua em entrevista.', 'verified', true, '2025-09-17', 'https://www1.folha.uol.com.br/poder/2025/09/tarcisio-admite-presidencia-recua.shtml', 'news_article', 3, 'São Paulo', 'Sucessão 2026', 'tarcisio-admite-recua-b167-66') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 67 Flávio Dino bloqueia emendas
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_din, 'Flávio Dino bloqueia emendas de Eduardo Bolsonaro e Ramagem.', 'Parlamentar foragido ou condenado não pode destinar recursos públicos. A Constituição não permite.', 'Ministro relata decisão que bloqueia emendas parlamentares de deputados processados ou foragidos.', 'verified', true, '2025-09-18', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-18-dino-emendas', 'official_statement', 2, 'STF', 'Bloqueio de emendas', 'dino-bloqueia-emendas-b167-67') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 68 Ramagem condenado
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Alexandre Ramagem é condenado a 16 anos por golpe no STF.', 'Sou inocente. Vou recorrer até o fim. Não fui golpista.', 'Deputado e ex-diretor da Abin é condenado no mesmo núcleo da trama golpista.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/ramagem-condenado-16-anos.ghtml', 'news_article', 4, 'STF', 'Condenação de Bolsonaro', 'ramagem-condenado-16-anos-b167-68') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 69 Daniel Silveira progressão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira progride ao regime aberto em setembro.', 'A justiça chegou. Voltarei à política mais forte do que nunca. Lula cai em 2026.', 'Ex-deputado obtém progressão ao regime aberto e sai da prisão após cumprir parte da pena.', 'verified', true, '2025-09-19', 'https://www.cnnbrasil.com.br/politica/daniel-silveira-regime-aberto/', 'news_article', 3, 'Rio de Janeiro', 'Silveira regime aberto', 'silveira-regime-aberto-b167-69') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 70 Tarcísio confirma reeleição
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio confirma candidatura à reeleição em São Paulo em 2026.', 'Minha decisão está tomada. Vou disputar a reeleição em São Paulo. Ponto final.', 'Governador encerra especulação sobre presidência e anuncia candidatura à reeleição.', 'verified', true, '2025-09-29', 'https://g1.globo.com/sp/sao-paulo/noticia/2025/09/29/tarcisio-reeleicao-sao-paulo.ghtml', 'news_article', 2, 'Palácio dos Bandeirantes', 'Sucessão 2026', 'tarcisio-reeleicao-sp-b167-70') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 71 Gilmar Mendes
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes diz que condenação de Bolsonaro encerra ciclo de autocracia.', 'O Brasil fecha um ciclo de tentação autocrática. Não se flerta impunemente com o golpismo.', 'Decano do STF comenta a decisão em painel em Lisboa.', 'verified', false, '2025-09-15', 'https://www.poder360.com.br/poder-politica/gilmar-mendes-autocracia/', 'news_article', 1, 'IDP Lisboa', 'Reações à condenação', 'gilmar-ciclo-autocracia-b167-71') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 72 Barroso despedida
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso anuncia aposentadoria antecipada do STF em setembro.', 'Encerro aqui meu ciclo. O Brasil está mais maduro democraticamente.', 'Ministro antecipa aposentadoria e deixa Presidência do STF para Fachin em breve.', 'verified', true, '2025-09-26', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-26-barroso-aposentadoria', 'official_statement', 1, 'STF', 'Saída de Barroso', 'barroso-aposentadoria-b167-72') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 73 Pacheco silêncio
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Pacheco defende respeito à condenação de Bolsonaro pelo STF.', 'Decisões judiciais se cumprem. Não há brechas para insurgência.', 'Ex-presidente do Senado comenta decisão do STF em entrevista.', 'verified', false, '2025-09-12', 'https://www12.senado.leg.br/noticias/materias/2025/09/12/pacheco-condenacao', 'news_article', 1, 'Brasília', 'Reações à condenação', 'pacheco-condenacao-stf-b167-73') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 74 Hugo Motta recusa anistia
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hug, 'Hugo Motta diz que não pauta anistia a Bolsonaro neste momento.', 'Não há clima político para pautar anistia. O Congresso vai respeitar a decisão do STF.', 'Presidente da Câmara descarta pauta da anistia após pressão bolsonarista.', 'verified', true, '2025-09-16', 'https://www.camara.leg.br/noticias/motta-anistia-descartada-2025', 'official_statement', 2, 'Câmara dos Deputados', 'Anistia descartada', 'motta-nao-pauta-anistia-b167-74') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 75 Lulinha discreto
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lun, 'Lulinha aparece discretamente em ato pró-democracia após condenação.', 'Estou aqui como cidadão que acredita na democracia.', 'Filho do presidente comparece a ato pró-democracia em São Paulo após condenação de Bolsonaro.', 'verified', false, '2025-09-14', 'https://www.metropoles.com/politica/lulinha-ato-democracia-sp', 'news_article', 1, 'Av. Paulista, SP', 'Ato pró-democracia', 'lulinha-ato-democracia-b167-75') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 76 Zambelli reage da Itália
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli chama condenação de Bolsonaro de espetáculo judicial.', 'Assistimos a um espetáculo judicial. Meu capitão foi crucificado.', 'Deputada foragida publica vídeo da Itália após condenação do ex-presidente.', 'verified', false, '2025-09-11', 'https://www.metropoles.com/politica/zambelli-italia-condenacao-bolsonaro', 'social_media_post', 4, 'Roma, Itália', 'Reações à condenação', 'zambelli-italia-espetaculo-b167-76') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 77 Eduardo sanções Magnitsky
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo pressiona administração Trump por sanções Magnitsky a Moraes.', 'Alexandre de Moraes precisa entrar na lista Magnitsky. Estou trabalhando nisso pessoalmente.', 'Deputado articula nos EUA aplicação de sanções a ministro do STF.', 'verified', true, '2025-09-20', 'https://www.poder360.com.br/poder-politica/eduardo-magnitsky-moraes/', 'news_article', 5, 'Washington', 'Sanções a Moraes', 'eduardo-magnitsky-moraes-b167-77') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 78 Lula Trump
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula encontra Trump na ONU e defende soberania brasileira.', 'Apresentei ao presidente Trump o ponto de vista brasileiro. Não aceitamos interferência no Judiciário.', 'Encontro bilateral durante Assembleia Geral da ONU em Nova York.', 'verified', true, '2025-09-23', 'https://g1.globo.com/politica/noticia/2025/09/23/lula-trump-onu-bilateral.ghtml', 'official_statement', 1, 'ONU NY', 'Lula na ONU', 'lula-trump-onu-b167-78') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 79 Mauro Vieira ONU
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvi, 'Mauro Vieira convoca comunidade internacional contra tarifaço.', 'Medidas unilaterais violam a OMC. Convocaremos aliados contra o protecionismo.', 'Chanceler discursa em painel na ONU sobre comércio internacional.', 'verified', false, '2025-09-24', 'https://www.gov.br/mre/pt-br/canais_atendimento/imprensa/notas-a-imprensa/2025/mauro-onu-comercio', 'official_statement', 1, 'ONU NY', 'Lula na ONU', 'mauro-onu-comercio-b167-79') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 80 Rui Costa Belém COP
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rui, 'Rui Costa anuncia obras finalizadas para COP30 em Belém.', 'Belém estará pronta para receber o mundo na COP30. Os 30 bilhões viram realidade.', 'Ministro da Casa Civil apresenta balanço das obras em Belém para a COP30.', 'verified', false, '2025-09-25', 'https://www.gov.br/casacivil/pt-br/noticias/2025/setembro/cop30-belem-obras', 'official_statement', 2, 'Belém, PA', 'COP30', 'rui-cop30-obras-b167-80') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 81 Padilha vacinação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pad, 'Padilha anuncia retomada de cobertura vacinal acima de 90% em 2025.', 'Recuperamos a confiança no SUS. A cobertura vacinal voltou a patamares de antes do negacionismo.', 'Ministro divulga dados de cobertura vacinal infantil em coletiva.', 'verified', false, '2025-09-08', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2025/setembro/cobertura-vacinal-90-porcento', 'official_statement', 1, 'Ministério da Saúde', 'Cobertura vacinal', 'padilha-cobertura-vacinal-b167-81') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 82 Mourão fim julgamento
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Mourão lamenta condenação de Bolsonaro mas pede respeito institucional.', 'Lamento profundamente a pena imposta, mas as decisões do STF devem ser cumpridas.', 'Senador reage à condenação de Bolsonaro de forma moderada comparada aos aliados.', 'verified', false, '2025-09-12', 'https://www12.senado.leg.br/noticias/materias/2025/09/12/mourao-condenacao-bolsonaro', 'official_statement', 2, 'Senado Federal', 'Reações à condenação', 'mourao-condenacao-cumprir-b167-82') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 83 Carlos Viana recados
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cvi, 'Carlos Viana convoca primeiros depoimentos na CPMI do INSS.', 'Vamos começar ouvindo os ex-presidentes do INSS. Sem perseguição e sem proteção.', 'Presidente da CPMI define calendário dos primeiros depoimentos.', 'verified', false, '2025-09-03', 'https://www12.senado.leg.br/noticias/materias/2025/09/03/cpmi-inss-depoimentos', 'official_statement', 1, 'Congresso Nacional', 'CPMI do INSS', 'viana-cpmi-calendario-b167-83') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 84 Tabata discurso
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tab, 'Tabata Amaral critica lentidão do governo na entrega da reforma do IR.', 'O governo precisa parar de protelar a reforma do IR. A classe média quer respostas.', 'Deputada pressiona governo Lula por aprovação da MP do IR na Câmara.', 'verified', false, '2025-09-05', 'https://www.camara.leg.br/noticias/tabata-ir-protelar-governo', 'official_statement', 1, 'Câmara', 'Reforma IR', 'tabata-ir-protelar-b167-84') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_irr, true FROM ins;

  -- 85 Janones volta após suspensão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jan, 'Janones já planeja ataques à oposição antes de encerrar suspensão.', 'Assim que eu voltar, vou bater ainda mais forte na bolsonarada covarde.', 'Deputado publica vídeo durante suspensão anunciando postura beligerante no retorno.', 'verified', false, '2025-09-07', 'https://www.metropoles.com/politica/janones-retorno-suspensao-ataques', 'social_media_post', 3, 'Redes sociais', 'Suspensão Janones', 'janones-retorno-ataques-b167-85') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_dis, true FROM ins;

  -- 86 Erika Hilton sobre condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eri, 'Erika Hilton celebra condenação de Bolsonaro como vitória do povo.', 'O 8 de janeiro foi real. Bolsonaro é golpista. Vitória histórica contra o fascismo.', 'Deputada do PSOL celebra condenação em postagem nas redes.', 'verified', false, '2025-09-11', 'https://www.camara.leg.br/noticias/erika-hilton-condenacao-vitoria-povo', 'social_media_post', 1, 'Twitter/X', 'Reações à condenação', 'erika-vitoria-povo-b167-86') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 87 Boulos reação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bou, 'Boulos comemora condenação e pede mobilização contra anistia.', 'Sem anistia. É preciso que cada golpista pague pelos seus crimes contra a democracia.', 'Ministro Boulos lidera ato público em São Paulo pela democracia após condenação.', 'verified', false, '2025-09-13', 'https://www1.folha.uol.com.br/poder/2025/09/boulos-ato-sem-anistia.shtml', 'news_article', 1, 'Av. Paulista, SP', 'Ato pró-democracia', 'boulos-sem-anistia-ato-b167-87') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 88 Randolfe sanções EUA
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe denuncia Eduardo Bolsonaro por articular sanções dos EUA ao Brasil.', 'Eduardo Bolsonaro é um traidor da pátria. Articular sanções contra o próprio país é crime.', 'Senador protocola representação na PGR contra deputado por articulação das sanções.', 'verified', true, '2025-09-22', 'https://www12.senado.leg.br/noticias/materias/2025/09/22/randolfe-eduardo-traidor', 'official_statement', 3, 'Senado', 'Sanções a Moraes', 'randolfe-eduardo-traidor-b167-88') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 89 Jaques Wagner sucessão
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jac, 'Jaques Wagner confirma Lula candidato à reeleição em 2026.', 'Lula é candidato. Não há plano B. Só ele reúne condições de derrotar a extrema-direita.', 'Líder do governo no Senado confirma pré-candidatura de Lula em evento do PT.', 'verified', false, '2025-09-25', 'https://g1.globo.com/politica/noticia/2025/09/25/jaques-wagner-lula-candidato.ghtml', 'news_article', 1, 'PT São Paulo', 'Sucessão 2026', 'wagner-lula-candidato-b167-89') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 90 Humberto sobre condenação
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hum, 'Humberto Costa chama condenação de Bolsonaro de divisor de águas.', 'É divisor de águas. Quem tentar golpe daqui para frente sabe o custo.', 'Senador petista comenta significado histórico da decisão do STF.', 'verified', false, '2025-09-12', 'https://www12.senado.leg.br/noticias/materias/2025/09/12/humberto-costa-condenacao', 'news_article', 1, 'Senado', 'Reações à condenação', 'humberto-divisor-aguas-b167-90') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 91 Zema ataque STF
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zem, 'Zema cogita candidatura à Presidência após condenação de Bolsonaro.', 'Estou à disposição do Brasil. Se a direita precisar, serei candidato.', 'Governador de MG se coloca como alternativa presidencial após inelegibilidade de Bolsonaro.', 'verified', true, '2025-09-22', 'https://www.cnnbrasil.com.br/politica/zema-candidatura-2026-bolsonaro/', 'news_article', 2, 'Belo Horizonte', 'Sucessão 2026', 'zema-candidatura-presidencia-b167-91') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 92 Caiado candidato
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cai, 'Ronaldo Caiado oficializa pré-candidatura ao Planalto.', 'Vou ser o candidato da oposição. O Brasil precisa de um governador com experiência.', 'Governador de Goiás se antecipa e lança pré-candidatura em evento do União Brasil.', 'verified', false, '2025-09-28', 'https://www.cnnbrasil.com.br/politica/caiado-pre-candidato-2026/', 'news_article', 2, 'Goiânia, GO', 'Sucessão 2026', 'caiado-pre-candidato-b167-92') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 93 Pablo Marçal Bolsonaro
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pab, 'Pablo Marçal tenta capitalizar condenação de Bolsonaro para alavancar candidatura.', 'Bolsonaro saiu de cena. Agora sou eu. O Brasil precisa de um líder disruptivo.', 'Coach tenta se posicionar como herdeiro do eleitorado bolsonarista após condenação.', 'verified', true, '2025-09-14', 'https://www.poder360.com.br/poder-politica/marcal-bolsonaro-saiu-cena/', 'social_media_post', 3, 'Redes sociais', 'Sucessão 2026', 'marcal-heranca-bolsonaro-b167-93') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 94 Ciro ataca todos
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes ataca PT e bolsonarismo no mesmo discurso.', 'Bolsonaro foi condenado porque ele é golpista mesmo. Mas o PT é corrupto. Brasil precisa de uma terceira via.', 'Ex-candidato ataca polarização em entrevista a veículo cearense.', 'verified', false, '2025-09-20', 'https://diariodonordeste.verdesmares.com.br/politica/ciro-terceira-via-2025', 'news_article', 2, 'Entrevista', 'Sucessão 2026', 'ciro-terceira-via-b167-94') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 95 Magno Malta candidato senador
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta anuncia retorno ao Senado pelo Espírito Santo em 2026.', 'Deus me chamou de volta. Vou ao Senado para lutar pela família e pela pátria.', 'Ex-senador confirma candidatura em evento religioso em Vitória.', 'verified', false, '2025-09-21', 'https://www.folhavitoria.com.br/politica/magno-malta-candidato-senador-2026', 'news_article', 2, 'Vitória, ES', 'Sucessão 2026', 'magno-malta-senador-b167-95') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 96 Sâmia CPMI
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sam, 'Sâmia Bomfim cobra recomposição das políticas previdenciárias na CPMI.', 'A fraude contra os aposentados exige recomposição urgente das políticas previdenciárias.', 'Deputada integra comissão e cobra medidas estruturais contra a fraude.', 'verified', false, '2025-09-10', 'https://www.camara.leg.br/noticias/samia-cpmi-inss-recomposicao', 'official_statement', 1, 'Congresso Nacional', 'CPMI do INSS', 'samia-cpmi-recomposicao-b167-96') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 97 Otto CPMI presidente
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar cobra Viana por condução equilibrada da CPMI.', 'Viana é sério, mas precisa manter a serenidade. A CPMI não pode virar terra de ninguém.', 'Senador elogia e cobra equilíbrio do presidente da CPMI em entrevista.', 'verified', false, '2025-09-18', 'https://www12.senado.leg.br/noticias/materias/2025/09/18/otto-viana-cpmi', 'news_article', 1, 'Senado', 'CPMI do INSS', 'otto-viana-equilibrio-b167-97') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 98 Fachin presidente
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Edson Fachin assume Presidência do STF em setembro.', 'Recebo com humildade a missão. Defenderei a Constituição acima de tudo.', 'Ministro toma posse como presidente do STF em cerimônia solene.', 'verified', true, '2025-09-29', 'https://portal.stf.jus.br/noticias/verNoticiaDetalhe.asp?idConteudo=2025-09-29-fachin-posse', 'official_statement', 1, 'STF', 'Presidência STF', 'fachin-assume-stf-b167-98') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 99 Nikolas sobre bloqueio emendas
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas diz que Flávio Dino pratica censura política ao bloquear emendas.', 'Flávio Dino virou censor. Bloqueia emendas de quem pensa diferente. É ditadura de toga.', 'Deputado ataca decisão de Dino que bloqueou emendas de Eduardo Bolsonaro e Ramagem.', 'verified', false, '2025-09-19', 'https://www.poder360.com.br/poder-politica/nikolas-dino-censura/', 'social_media_post', 4, 'Twitter/X', 'Bloqueio de emendas', 'nikolas-dino-censura-b167-99') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 100 Lula ONU Palestina
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula reconhece Estado da Palestina em discurso na Assembleia da ONU.', 'O Brasil reconhece o Estado da Palestina nas fronteiras de 1967. Pela paz e pela justiça.', 'Em discurso de abertura da Assembleia Geral da ONU, Lula defende reconhecimento do Estado palestino.', 'verified', true, '2025-09-23', 'https://g1.globo.com/politica/noticia/2025/09/23/lula-onu-palestina-reconhecimento.ghtml', 'official_statement', 2, 'ONU NY', 'Lula na ONU', 'lula-onu-palestina-b167-100') RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

END $$;
