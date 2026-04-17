-- Batch 124: 8 de Janeiro e desdobramentos (2023-2026)
DO $$
DECLARE
  v_mor UUID; v_lul UUID; v_lip UUID; v_dil UUID; v_tem UUID;
  v_aec UUID; v_fhc UUID; v_jair UUID; v_edu UUID; v_fla UUID;
  v_car UUID; v_mic UUID; v_dam UUID; v_pau UUID; v_mou UUID;
  v_gle UUID; v_had UUID; v_cir UUID; v_jse UUID; v_alc UUID;
  v_mar UUID; v_sar UUID; v_ren UUID; v_cun UUID; v_cha UUID;
  v_fre UUID; v_sil UUID; v_rje UUID; v_mag UUID; v_mfe UUID;
  v_axm UUID; v_gil UUID; v_bar UUID; v_tof UUID; v_fux UUID;
  v_fac UUID; v_car2 UUID; v_zan UUID; v_fdn UUID; v_jme UUID;
  v_lew UUID; v_ram UUID; v_zam UUID; v_dsi UUID; v_nik UUID;
  v_bki UUID; v_mvh UUID; v_ran UUID; v_eli UUID; v_dua UUID;
  v_jwa UUID; v_hco UUID; v_ott UUID; v_hmo UUID; v_lir UUID;
  v_pac UUID; v_dal UUID; v_iba UUID; v_tar UUID;
  c_cor UUID; c_obs UUID; c_abu UUID; c_ant UUID; c_des UUID;
  c_odi UUID; c_con UUID; c_nep UUID; c_int UUID; c_ame UUID;
  c_neg UUID; c_aut UUID; c_vio UUID;
BEGIN
  SELECT id INTO v_mor FROM politicians WHERE slug = 'sergio-moro';
  SELECT id INTO v_lul FROM politicians WHERE slug = 'lula';
  SELECT id INTO v_lip FROM politicians WHERE slug = 'luis-inacio-passado';
  SELECT id INTO v_dil FROM politicians WHERE slug = 'dilma-rousseff';
  SELECT id INTO v_tem FROM politicians WHERE slug = 'michel-temer';
  SELECT id INTO v_aec FROM politicians WHERE slug = 'aecio-neves';
  SELECT id INTO v_fhc FROM politicians WHERE slug = 'fernando-henrique';
  SELECT id INTO v_jair FROM politicians WHERE slug = 'jair-bolsonaro';
  SELECT id INTO v_edu FROM politicians WHERE slug = 'eduardo-bolsonaro';
  SELECT id INTO v_fla FROM politicians WHERE slug = 'flavio-bolsonaro';
  SELECT id INTO v_car FROM politicians WHERE slug = 'carlos-bolsonaro';
  SELECT id INTO v_mic FROM politicians WHERE slug = 'michelle-bolsonaro';
  SELECT id INTO v_dam FROM politicians WHERE slug = 'damares-alves';
  SELECT id INTO v_pau FROM politicians WHERE slug = 'paulo-guedes';
  SELECT id INTO v_mou FROM politicians WHERE slug = 'hamilton-mourao';
  SELECT id INTO v_gle FROM politicians WHERE slug = 'gleisi-hoffmann';
  SELECT id INTO v_had FROM politicians WHERE slug = 'fernando-haddad';
  SELECT id INTO v_cir FROM politicians WHERE slug = 'ciro-gomes';
  SELECT id INTO v_jse FROM politicians WHERE slug = 'jose-serra';
  SELECT id INTO v_alc FROM politicians WHERE slug = 'geraldo-alckmin';
  SELECT id INTO v_mar FROM politicians WHERE slug = 'marta-suplicy';
  SELECT id INTO v_sar FROM politicians WHERE slug = 'jose-sarney';
  SELECT id INTO v_ren FROM politicians WHERE slug = 'renan-calheiros';
  SELECT id INTO v_cun FROM politicians WHERE slug = 'cunha';
  SELECT id INTO v_cha FROM politicians WHERE slug = 'chico-alencar';
  SELECT id INTO v_fre FROM politicians WHERE slug = 'marcelo-freixo';
  SELECT id INTO v_sil FROM politicians WHERE slug = 'silas-camara';
  SELECT id INTO v_rje FROM politicians WHERE slug = 'roberto-jefferson';
  SELECT id INTO v_mag FROM politicians WHERE slug = 'magno-malta';
  SELECT id INTO v_mfe FROM politicians WHERE slug = 'marco-feliciano';
  SELECT id INTO v_axm FROM politicians WHERE slug = 'alexandre-de-moraes';
  SELECT id INTO v_gil FROM politicians WHERE slug = 'gilmar-mendes';
  SELECT id INTO v_bar FROM politicians WHERE slug = 'luis-roberto-barroso';
  SELECT id INTO v_tof FROM politicians WHERE slug = 'dias-toffoli';
  SELECT id INTO v_fux FROM politicians WHERE slug = 'luiz-fux';
  SELECT id INTO v_fac FROM politicians WHERE slug = 'edson-fachin';
  SELECT id INTO v_car2 FROM politicians WHERE slug = 'carmen-lucia';
  SELECT id INTO v_zan FROM politicians WHERE slug = 'cristiano-zanin';
  SELECT id INTO v_fdn FROM politicians WHERE slug = 'flavio-dino';
  SELECT id INTO v_jme FROM politicians WHERE slug = 'jorge-messias';
  SELECT id INTO v_lew FROM politicians WHERE slug = 'ricardo-lewandowski';
  SELECT id INTO v_ram FROM politicians WHERE slug = 'alexandre-ramagem';
  SELECT id INTO v_zam FROM politicians WHERE slug = 'carla-zambelli';
  SELECT id INTO v_dsi FROM politicians WHERE slug = 'daniel-silveira';
  SELECT id INTO v_nik FROM politicians WHERE slug = 'nikolas-ferreira';
  SELECT id INTO v_bki FROM politicians WHERE slug = 'bia-kicis';
  SELECT id INTO v_mvh FROM politicians WHERE slug = 'marcel-van-hattem';
  SELECT id INTO v_ran FROM politicians WHERE slug = 'randolfe-rodrigues';
  SELECT id INTO v_eli FROM politicians WHERE slug = 'eliziane-gama';
  SELECT id INTO v_dua FROM politicians WHERE slug = 'duarte-jr';
  SELECT id INTO v_jwa FROM politicians WHERE slug = 'jaques-wagner';
  SELECT id INTO v_hco FROM politicians WHERE slug = 'humberto-costa';
  SELECT id INTO v_ott FROM politicians WHERE slug = 'otto-alencar';
  SELECT id INTO v_hmo FROM politicians WHERE slug = 'hugo-motta';
  SELECT id INTO v_lir FROM politicians WHERE slug = 'arthur-lira';
  SELECT id INTO v_pac FROM politicians WHERE slug = 'rodrigo-pacheco';
  SELECT id INTO v_dal FROM politicians WHERE slug = 'davi-alcolumbre';
  SELECT id INTO v_iba FROM politicians WHERE slug = 'ibaneis-rocha';
  SELECT id INTO v_tar FROM politicians WHERE slug = 'tarcisio-de-freitas';

  SELECT id INTO c_cor FROM categories WHERE slug = 'corrupcao';
  SELECT id INTO c_obs FROM categories WHERE slug = 'obstrucao-justica';
  SELECT id INTO c_abu FROM categories WHERE slug = 'abuso-de-poder';
  SELECT id INTO c_ant FROM categories WHERE slug = 'antidemocratico';
  SELECT id INTO c_des FROM categories WHERE slug = 'desinformacao';
  SELECT id INTO c_odi FROM categories WHERE slug = 'discurso-de-odio';
  SELECT id INTO c_con FROM categories WHERE slug = 'conflito-interesses';
  SELECT id INTO c_nep FROM categories WHERE slug = 'nepotismo';
  SELECT id INTO c_int FROM categories WHERE slug = 'intimidacao';
  SELECT id INTO c_ame FROM categories WHERE slug = 'ameaca-instituicoes';
  SELECT id INTO c_neg FROM categories WHERE slug = 'negacionismo';
  SELECT id INTO c_aut FROM categories WHERE slug = 'autoritarismo';
  SELECT id INTO c_vio FROM categories WHERE slug = 'violencia';

  -- 1
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula toma posse como presidente após derrotar Bolsonaro.', 'A democracia venceu. Não há inimigo a ser destruído, há um país a ser reconstruído.', 'Discurso de posse no Congresso Nacional após vencer eleição de 2022.', 'verified', true, '2023-01-01', 'https://g1.globo.com/politica/noticia/2023/01/01/lula-toma-posse-como-presidente.ghtml', 'other', 2, 'Brasília', 'Posse presidencial', 'lula-posse-2023-b124-1') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 2
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro foge para os EUA dias antes do fim do mandato.', 'Decidi viajar. Voltarei ao Brasil quando entender necessário.', 'Presidente deixa o país sem passar faixa a Lula, desembarcando em Orlando.', 'verified', true, '2022-12-30', 'https://www1.folha.uol.com.br/poder/2022/12/bolsonaro-viaja-para-os-eua-antes-do-fim-do-mandato.shtml', 'social_media_post', 4, 'Orlando', 'Viagem aos EUA', 'bolsonaro-foge-eua-b124-2') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 3
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaristas invadem sedes dos três Poderes em Brasília.', 'Os patriotas são o Brasil de verdade. Não são vândalos.', 'Publicação em rede social horas após a invasão de 8 de janeiro.', 'verified', true, '2023-01-08', 'https://g1.globo.com/politica/noticia/2023/01/08/bolsonaristas-invadem-congresso-stf-planalto.ghtml', 'social_media_post', 5, 'Orlando', '8 de janeiro', 'bolsonaro-patriotas-8-janeiro-b124-3') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 4
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula decreta intervenção federal no DF após ataques golpistas.', 'Vamos descobrir quem financiou esses vândalos. Eles serão punidos com rigor.', 'Pronunciamento do presidente em Araraquara após ataques.', 'verified', true, '2023-01-08', 'https://www1.folha.uol.com.br/poder/2023/01/lula-decreta-intervencao-federal-no-df.shtml', 'other', 3, 'Araraquara', 'Pronunciamento pós-ataques', 'lula-intervencao-df-b124-4') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 5
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes determina prisão de golpistas e acampados.', 'A democracia precisa ser defendida com rigor. Não há impunidade para atentado à ordem.', 'Decisão no STF ordenando desmonte de acampamentos e prisão de envolvidos.', 'verified', true, '2023-01-08', 'https://oglobo.globo.com/politica/moraes-determina-prisao-de-golpistas-e-acampados-25004321', 'other', 3, 'Brasília', 'Decisão no STF', 'moraes-prisao-golpistas-b124-5') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 6
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_iba, 'Ibaneis Rocha é afastado do governo do DF por omissão no 8 de janeiro.', 'Não houve omissão do GDF. A segurança foi planejada, mas fomos surpreendidos.', 'Declaração após decisão de afastamento determinada por Alexandre de Moraes.', 'verified', true, '2023-01-08', 'https://g1.globo.com/df/distrito-federal/noticia/ibaneis-e-afastado-do-governo-do-df.ghtml', 'news_article', 4, 'Brasília', 'Afastamento do GDF', 'ibaneis-afastamento-8-janeiro-b124-6') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 7
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro publica vídeo dias após 8 de janeiro e depois apaga.', 'A eleição foi fraudada. Mas os patriotas pacíficos foram injustiçados.', 'Vídeo publicado e apagado em poucas horas, preservado por reportagens.', 'verified', true, '2023-01-10', 'https://www1.folha.uol.com.br/poder/2023/01/bolsonaro-publica-e-apaga-video-sobre-fraude-eleitoral.shtml', 'social_media_post', 5, 'Orlando', 'Vídeo apagado', 'bolsonaro-video-apagado-fraude-b124-7') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 8
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira minimiza 8 de janeiro como ''passeio de domingo''.', 'Foi uma manifestação pacífica que escapou ao controle. Não foi tentativa de golpe.', 'Entrevista à mídia bolsonarista negando tentativa de golpe.', 'verified', true, '2023-01-12', 'https://veja.abril.com.br/politica/nikolas-ferreira-minimiza-8-de-janeiro/', 'news_article', 4, 'Brasília', 'Entrevista à imprensa', 'nikolas-minimiza-8-janeiro-b124-8') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 9
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli é flagrada perseguindo homem armada em São Paulo.', 'Eu estava sendo ameaçada. Tinha direito de me defender.', 'Vídeo viraliza mostrando deputada apontando arma para eleitor antes do 2º turno.', 'verified', true, '2022-10-29', 'https://g1.globo.com/sp/sao-paulo/noticia/zambelli-aponta-arma-para-homem.ghtml', 'social_media_post', 5, 'São Paulo', 'Ato em São Paulo', 'zambelli-arma-sp-b124-9') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 10
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli nega envolvimento no 8 de janeiro.', 'Estava em casa com minha filha. Não tive qualquer relação com os atos.', 'Coletiva na Câmara após especulações sobre participação na articulação.', 'verified', true, '2023-01-15', 'https://www1.folha.uol.com.br/poder/2023/01/zambelli-nega-envolvimento-no-8-de-janeiro.shtml', 'news_article', 4, 'Brasília', 'Coletiva na Câmara', 'zambelli-nega-8-janeiro-b124-10') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 11
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco condena invasão e defende rigor contra golpistas.', 'Atentado à democracia não pode ficar impune. O Senado estará firme.', 'Pronunciamento após vistoria nos danos causados no Congresso.', 'verified', true, '2023-01-09', 'https://www12.senado.leg.br/noticias/materias/2023/01/09/pacheco-condena-invasao-e-defende-rigor', 'other', 2, 'Brasília', 'Vistoria no Congresso', 'pacheco-condena-invasao-b124-11') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 12
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira classifica 8 de janeiro como ''falta de cabeça''.', 'O que houve foi uma falta de cabeça. A democracia prevaleceu.', 'Declaração no dia seguinte aos ataques, com tom considerado leniente pela oposição.', 'verified', true, '2023-01-09', 'https://g1.globo.com/politica/noticia/lira-classifica-invasao-como-falta-de-cabeca.ghtml', 'news_article', 4, 'Brasília', 'Coletiva na Câmara', 'lira-falta-de-cabeca-b124-12') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 13
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bar, 'Barroso defende que 8 de janeiro foi tentativa de golpe de Estado.', 'Foi tentativa de golpe de Estado. Não há outra interpretação cabível.', 'Palestra em Washington sobre ataques e resposta institucional.', 'verified', true, '2023-02-14', 'https://oglobo.globo.com/politica/barroso-defende-que-8-de-janeiro-foi-tentativa-de-golpe-25210543', 'other', 2, 'Washington', 'Palestra no Wilson Center', 'barroso-golpe-8-janeiro-b124-13') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 14
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama é relatora da CPI do 8 de janeiro.', 'Vamos responsabilizar quem planejou, executou e financiou os ataques à democracia.', 'Declaração ao assumir a relatoria da CPI Mista.', 'verified', true, '2023-04-27', 'https://www12.senado.leg.br/noticias/materias/2023/04/27/eliziane-relatora-cpi-8-janeiro', 'other', 2, 'Brasília', 'Instalação da CPI', 'eliziane-relatora-cpi-b124-14') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 15
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe Rodrigues preside CPMI do 8 de janeiro no Senado.', 'Tudo será apurado. Nenhum articulador do golpe ficará sem resposta.', 'Declaração ao assumir a presidência da comissão mista parlamentar.', 'verified', false, '2023-04-27', 'https://www12.senado.leg.br/noticias/materias/2023/04/27/randolfe-preside-cpmi', 'other', 2, 'Brasília', 'Instalação da CPMI', 'randolfe-cpmi-8-janeiro-b124-15') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 16
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro volta ao Brasil após quase três meses nos EUA.', 'Voltei para fazer oposição e defender o Brasil da esquerda comunista.', 'Declaração ao desembarcar em Brasília após retorno dos EUA.', 'verified', true, '2023-03-30', 'https://www1.folha.uol.com.br/poder/2023/03/bolsonaro-volta-ao-brasil-apos-3-meses-nos-eua.shtml', 'other', 3, 'Brasília', 'Retorno ao Brasil', 'bolsonaro-volta-eua-b124-16') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 17
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'TSE torna Bolsonaro inelegível por abuso de poder na reunião com embaixadores.', 'O uso da máquina pública para disseminar mentiras caracteriza abuso.', 'Voto do relator Benedito Gonçalves no TSE; Moraes acompanha.', 'verified', true, '2023-06-30', 'https://g1.globo.com/politica/noticia/2023/06/30/tse-torna-bolsonaro-inelegivel.ghtml', 'other', 4, 'Brasília', 'Julgamento no TSE', 'tse-inelegibilidade-bolsonaro-b124-17') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 18
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro reage à inelegibilidade dizendo ser vítima de perseguição.', 'É uma facada nas costas da democracia. Me cassaram por defender o Brasil.', 'Entrevista coletiva após decisão do TSE.', 'verified', true, '2023-06-30', 'https://veja.abril.com.br/politica/bolsonaro-reage-a-inelegibilidade/', 'news_article', 3, 'Brasília', 'Coletiva pós-TSE', 'bolsonaro-reage-inelegibilidade-b124-18') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 19
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Fernando Haddad é nomeado ministro da Fazenda.', 'Vamos reconstruir a economia com responsabilidade fiscal e inclusão social.', 'Declaração na posse no Ministério da Fazenda em janeiro de 2023.', 'verified', false, '2023-01-02', 'https://valor.globo.com/politica/noticia/haddad-toma-posse-na-fazenda.ghtml', 'other', 1, 'Brasília', 'Posse no Ministério', 'haddad-posse-fazenda-b124-19') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 20
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_alc, 'Alckmin toma posse como vice-presidente e ministro da Indústria.', 'Vamos reindustrializar o Brasil. É a principal missão do governo.', 'Discurso de posse como vice-presidente em Brasília.', 'verified', false, '2023-01-02', 'https://g1.globo.com/politica/noticia/alckmin-toma-posse-como-vice.ghtml', 'other', 1, 'Brasília', 'Posse como vice', 'alckmin-posse-vice-b124-20') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 21
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fdn, 'Flávio Dino assume Ministério da Justiça e promete firmeza contra golpismo.', 'Quem atentou contra a democracia vai responder. Não haverá complacência.', 'Discurso de posse no Ministério da Justiça.', 'verified', false, '2023-01-02', 'https://www1.folha.uol.com.br/poder/2023/01/flavio-dino-toma-posse-na-justica.shtml', 'other', 1, 'Brasília', 'Posse no MJ', 'dino-posse-justica-b124-21') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 22
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jme, 'Jorge Messias defende julgamento rigoroso de envolvidos no 8 de janeiro.', 'A AGU atuará com firmeza para responsabilizar financiadores e incentivadores.', 'Declaração à imprensa sobre estratégia jurídica do governo.', 'verified', false, '2023-02-10', 'https://g1.globo.com/politica/noticia/messias-defende-rigor-no-8-de-janeiro.ghtml', 'news_article', 1, 'Brasília', 'Coletiva da AGU', 'messias-rigor-8-janeiro-b124-22') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 23
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Cristiano Zanin é indicado para o STF por Lula.', 'Honra-me a indicação. Atuarei com imparcialidade e respeito à Constituição.', 'Coletiva de imprensa após sabatina no Senado.', 'verified', true, '2023-06-21', 'https://oglobo.globo.com/politica/zanin-e-indicado-ao-stf-25512789', 'news_article', 2, 'Brasília', 'Anúncio ao STF', 'zanin-indicado-stf-b124-23') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 24
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro critica indicação de Zanin ao STF.', 'Advogado de parte interessada não deveria julgar seus adversários.', 'Declaração como senador eleito, criticando escolha de Lula.', 'verified', true, '2023-06-22', 'https://veja.abril.com.br/politica/moro-critica-indicacao-de-zanin/', 'news_article', 3, 'Brasília', 'Entrevista à Veja', 'moro-critica-zanin-b124-24') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 25
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula defende indicação de Zanin como legítima.', 'Zanin é um jurista brilhante. Toda a vida de alguém não se resume a um caso.', 'Entrevista coletiva em Brasília defendendo a escolha.', 'verified', false, '2023-06-23', 'https://g1.globo.com/politica/noticia/lula-defende-indicacao-de-zanin.ghtml', 'news_article', 2, 'Brasília', 'Coletiva no Planalto', 'lula-defende-zanin-b124-25') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 26
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira é preso após ter mandato cassado e perder foro.', 'Eu sou um mártir. Vocês vão me prender, mas outros virão.', 'Declaração ao ser preso pela PF em Petrópolis.', 'verified', true, '2023-02-20', 'https://g1.globo.com/rj/regiao-serrana/noticia/2023/02/20/daniel-silveira-e-preso.ghtml', 'news_article', 4, 'Petrópolis', 'Prisão de Silveira', 'silveira-preso-petropolis-b124-26') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 27
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_bki, 'Bia Kicis defende Daniel Silveira em plenário.', 'Silveira é um preso político. Está sendo perseguido pelo Supremo.', 'Discurso na Câmara dos Deputados após a prisão.', 'verified', false, '2023-02-22', 'https://www1.folha.uol.com.br/poder/2023/02/bia-kicis-defende-daniel-silveira.shtml', 'other', 3, 'Brasília', 'Plenário da Câmara', 'bia-kicis-defende-silveira-b124-27') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 28
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Marcel van Hattem critica atuação de Moraes no STF.', 'Moraes concentra poder de polícia, investigação e julgamento. É inconstitucional.', 'Entrevista crítica ao inquérito das fake news.', 'verified', false, '2023-03-15', 'https://veja.abril.com.br/politica/van-hattem-critica-moraes/', 'news_article', 3, 'Brasília', 'Entrevista à Veja', 'vanhattem-critica-moraes-b124-28') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 29
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula com trumpistas apoio ao pai nos EUA.', 'Meu pai é vítima do mesmo establishment global que persegue Trump.', 'Participação em evento da CPAC com aliados da direita americana.', 'verified', true, '2023-03-03', 'https://www1.folha.uol.com.br/mundo/2023/03/eduardo-articula-apoio-a-bolsonaro-nos-eua.shtml', 'other', 4, 'Washington', 'CPAC 2023', 'eduardo-articula-eua-b124-29') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 30
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro tenta minimizar responsabilidade do pai no 8 de janeiro.', 'Meu pai estava fora do país. Não há como responsabilizá-lo pelos atos.', 'Entrevista defendendo pai após indiciamento pela PF.', 'verified', true, '2023-11-23', 'https://g1.globo.com/politica/noticia/flavio-minimiza-responsabilidade-do-pai.ghtml', 'news_article', 4, 'Brasília', 'Entrevista na Câmara', 'flavio-minimiza-responsabilidade-pai-b124-30') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 31
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ram, 'Alexandre Ramagem é indiciado pela PF por monitoramento ilegal.', 'Eu cumpri ordens institucionais. Não há ilegalidade no trabalho da Abin.', 'Resposta a indiciamento por uso da Abin para monitorar adversários.', 'verified', true, '2024-01-25', 'https://www1.folha.uol.com.br/poder/2024/01/ramagem-e-indiciado-pela-pf.shtml', 'news_article', 5, 'Brasília', 'Indiciamento da PF', 'ramagem-indiciado-abin-b124-31') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 32
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'PF faz busca e apreensão contra Bolsonaro em operação sobre joias sauditas.', 'Nunca recebi nada do governo saudita para ganho próprio. É perseguição.', 'Declaração após operação em sua casa em Brasília.', 'verified', true, '2023-08-11', 'https://g1.globo.com/politica/noticia/pf-faz-operacao-contra-bolsonaro-sobre-joias.ghtml', 'news_article', 5, 'Brasília', 'Operação da PF', 'bolsonaro-busca-joias-b124-32') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 33
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro depõe à PF sobre fraude em cartões de vacina.', 'Não fraudei cartão de vacina nenhum. Desconheço essas alegações.', 'Declaração após depoimento na Superintendência da PF.', 'verified', true, '2023-05-03', 'https://www1.folha.uol.com.br/poder/2023/05/bolsonaro-depoe-a-pf-sobre-fraude-em-cartoes.shtml', 'news_article', 4, 'Brasília', 'Depoimento na PF', 'bolsonaro-depoe-cartoes-vacina-b124-33') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 34
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro é alvo em investigação sobre joias presidenciais.', 'Não tive acesso a joias nem desvio. Essa história é inventada.', 'Coletiva após inclusão em investigação federal.', 'verified', true, '2023-09-15', 'https://oglobo.globo.com/politica/michelle-e-alvo-em-investigacao-sobre-joias-25678921', 'news_article', 4, 'Brasília', 'Coletiva do PL', 'michelle-joias-investigacao-b124-34') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_cor, true FROM ins;

  -- 35
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mou, 'Mourão assume cadeira no Senado e critica Lula em primeiro discurso.', 'O governo Lula traz de volta o ranço ideológico que tanto atrasou o Brasil.', 'Discurso de posse como senador pelo Rio Grande do Sul.', 'verified', false, '2023-02-01', 'https://www12.senado.leg.br/noticias/materias/2023/02/01/mourao-toma-posse-e-critica-governo-lula', 'other', 2, 'Brasília', 'Posse como senador', 'mourao-posse-senado-b124-35') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 36
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dam, 'Damares minimiza abusos em terra yanomami durante governo Bolsonaro.', 'Não houve genocídio yanomami. Foram imagens manipuladas para atacar o governo anterior.', 'Declaração no Senado durante sabatina como senadora.', 'verified', true, '2023-02-08', 'https://www12.senado.leg.br/noticias/materias/2023/02/08/damares-minimiza-situacao-yanomami', 'other', 5, 'Brasília', 'Sessão do Senado', 'damares-nega-yanomami-b124-36') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_neg, true FROM ins;

  -- 37
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula decreta emergência em saúde para yanomamis.', 'É genocídio. O governo Bolsonaro fez vista grossa ao extermínio.', 'Pronunciamento em Boa Vista após visitar comunidades yanomamis.', 'verified', true, '2023-01-21', 'https://g1.globo.com/rr/roraima/noticia/lula-visita-yanomamis-e-fala-em-genocidio.ghtml', 'other', 3, 'Boa Vista', 'Visita a Roraima', 'lula-genocidio-yanomami-b124-37') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 38
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira faz fala misógina no Dia da Mulher em plenário.', 'Hoje é o Dia da Mulher, então devo me apresentar como mulher para falar.', 'Discurso polêmico em plenário com gesto de peruca no 8 de março.', 'verified', true, '2023-03-08', 'https://www1.folha.uol.com.br/poder/2023/03/nikolas-faz-fala-misogina-no-dia-da-mulher.shtml', 'other', 4, 'Brasília', 'Plenário da Câmara', 'nikolas-misoginia-8-marco-b124-38') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_odi, true FROM ins;

  -- 39
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio governa SP com mix de liberalismo econômico e bolsonarismo.', 'Lula perdeu para Bolsonaro em São Paulo. O eleitor é claro sobre o que quer.', 'Entrevista ao Valor no primeiro semestre como governador.', 'verified', false, '2023-04-12', 'https://valor.globo.com/politica/noticia/tarcisio-entrevista-ao-valor.ghtml', 'news_article', 2, 'São Paulo', 'Entrevista ao Valor', 'tarcisio-liberalismo-bolsonarismo-b124-39') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 40
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes determina tornozeleira a Bolsonaro.', 'A conduta revela risco de fuga e descumprimento de obrigações judiciais.', 'Decisão monocrática no inquérito sobre tentativa de golpe.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/2024/02/08/moraes-decreta-tornozeleira-para-bolsonaro.ghtml', 'other', 4, 'Brasília', 'Decisão no STF', 'moraes-tornozeleira-bolsonaro-b124-40') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 41
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é indiciado pela PF por tentativa de golpe.', 'Sou inocente. O indiciamento é peça de ficção política.', 'Declaração após indiciamento da PF por liderança de organização criminosa.', 'verified', true, '2024-11-21', 'https://g1.globo.com/politica/noticia/2024/11/21/pf-indicia-bolsonaro-por-tentativa-de-golpe.ghtml', 'news_article', 5, 'Brasília', 'Indiciamento da PF', 'bolsonaro-indiciado-golpe-b124-41') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 42
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é apontado por PF em plano de assassinato de Lula e Moraes.', 'Nunca soube, nunca avalizei e nunca participaria de plano desse tipo.', 'Declaração à imprensa após revelação do relatório ''Punhal Verde e Amarelo''.', 'verified', true, '2024-11-22', 'https://www1.folha.uol.com.br/poder/2024/11/pf-aponta-bolsonaro-em-plano-para-matar-lula.shtml', 'news_article', 5, 'Brasília', 'Relatório Punhal Verde e Amarelo', 'bolsonaro-plano-matar-lula-b124-42') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 43
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula diz que vai superar plano de assassinato e cumprir mandato.', 'Queriam me matar, mas não me abaterão. Vou governar até o último dia.', 'Entrevista à Globo News após revelação do plano.', 'verified', true, '2024-11-23', 'https://oglobo.globo.com/politica/lula-reage-a-plano-de-assassinato-25967432', 'news_article', 3, 'Brasília', 'Entrevista à Globo News', 'lula-plano-assassinato-b124-43') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 44
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fdn, 'Flávio Dino assume vaga no STF após indicação de Lula.', 'Atuarei com independência, lealdade à Constituição e respeito à democracia.', 'Discurso de posse no STF em Brasília.', 'verified', true, '2024-02-22', 'https://www1.folha.uol.com.br/poder/2024/02/flavio-dino-toma-posse-no-stf.shtml', 'other', 2, 'Brasília', 'Posse no STF', 'dino-posse-stf-b124-44') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_con, true FROM ins;

  -- 45
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lew, 'Ricardo Lewandowski assume Ministério da Justiça.', 'Defender a democracia é minha prioridade. Golpismo não passará.', 'Discurso de posse no MJ em substituição a Flávio Dino.', 'verified', false, '2024-02-01', 'https://g1.globo.com/politica/noticia/lewandowski-toma-posse-na-justica.ghtml', 'other', 1, 'Brasília', 'Posse no MJ', 'lewandowski-posse-mj-b124-45') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 46
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mor, 'Moro é alvo de cassação por abuso de poder eleitoral no TRE-PR.', 'Sou vítima de perseguição política por quem quer me tirar do caminho.', 'Entrevista após decisão do TRE-PR que o colocou em risco de perder mandato.', 'verified', true, '2024-04-01', 'https://veja.abril.com.br/politica/moro-alvo-de-cassacao-no-tre-pr/', 'news_article', 3, 'Curitiba', 'Julgamento no TRE-PR', 'moro-cassacao-tre-pr-b124-46') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 47
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Carla Zambelli foge do Brasil após ser condenada pelo STF.', 'Vou me defender de onde estiver. Aqui não há mais garantias de defesa.', 'Declaração em vídeo publicado após fuga para a Itália em 2025.', 'verified', true, '2025-06-04', 'https://g1.globo.com/politica/noticia/2025/06/04/zambelli-deixa-o-brasil.ghtml', 'social_media_post', 5, 'Roma', 'Fuga para a Itália', 'zambelli-foge-italia-b124-47') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_obs, true FROM ins;

  -- 48
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes determina bloqueio do X (ex-Twitter) no Brasil.', 'A plataforma descumpriu reiteradamente ordens judiciais e deve ser suspensa.', 'Decisão monocrática após Musk fechar escritório da empresa no país.', 'verified', true, '2024-08-30', 'https://www1.folha.uol.com.br/mercado/2024/08/moraes-determina-bloqueio-do-x-no-brasil.shtml', 'other', 3, 'Brasília', 'Decisão no STF', 'moraes-bloqueio-x-b124-48') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 49
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas Ferreira acusa Moraes de censura com bloqueio do X.', 'Moraes virou censor-chefe do Brasil. Apaga opiniões contrárias ao governo.', 'Série de vídeos nas redes após bloqueio do X.', 'verified', true, '2024-08-31', 'https://veja.abril.com.br/politica/nikolas-acusa-moraes-de-censura/', 'social_media_post', 4, 'Belo Horizonte', 'Publicações em vídeo', 'nikolas-moraes-censura-b124-49') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 50
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mvh, 'Van Hattem pede PEC contra ministros do STF.', 'Precisamos de mandato e impeachment facilitado. O STF extrapolou.', 'Discurso em plenário defendendo PEC ''Anti-Moraes''.', 'verified', false, '2024-09-05', 'https://www1.folha.uol.com.br/poder/2024/09/van-hattem-pec-contra-ministros-stf.shtml', 'other', 3, 'Brasília', 'Plenário da Câmara', 'vanhattem-pec-stf-b124-50') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 51
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta é eleito presidente da Câmara dos Deputados.', 'Vou presidir a Câmara com diálogo e respeito à independência dos Poderes.', 'Discurso de posse como presidente da Câmara em fevereiro de 2025.', 'verified', true, '2025-02-01', 'https://g1.globo.com/politica/noticia/2025/02/01/hugo-motta-eleito-presidente-da-camara.ghtml', 'other', 2, 'Brasília', 'Posse na Câmara', 'motta-eleito-camara-b124-51') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 52
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dal, 'Davi Alcolumbre é eleito presidente do Senado para novo mandato.', 'O Senado terá papel central no equilíbrio institucional do país.', 'Discurso de posse como presidente do Senado em fevereiro de 2025.', 'verified', false, '2025-02-01', 'https://www12.senado.leg.br/noticias/materias/2025/02/01/alcolumbre-eleito-senado', 'other', 2, 'Brasília', 'Posse no Senado', 'alcolumbre-eleito-senado-b124-52') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 53
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Moraes recebe denúncia da PGR contra Bolsonaro e 33 aliados por trama golpista.', 'A denúncia preenche os requisitos legais e descreve fatos graves contra a democracia.', 'Relator no STF analisa denúncia oferecida pela PGR contra 34 pessoas por cinco crimes.', 'verified', true, '2025-02-18', 'https://g1.globo.com/politica/noticia/2025/02/18/pgr-denuncia-bolsonaro-por-golpe.ghtml', 'other', 5, 'Brasília', 'Denúncia ao STF', 'pgr-denuncia-bolsonaro-golpe-b124-53') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 54
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro vira réu no STF em ação sobre trama golpista.', 'Sou inocente. A história vai me absolver como absolveu Getúlio.', 'Declaração após Primeira Turma do STF aceitar denúncia por unanimidade.', 'verified', true, '2025-03-26', 'https://www1.folha.uol.com.br/poder/2025/03/stf-torna-bolsonaro-reu-por-tentativa-de-golpe.shtml', 'news_article', 5, 'Brasília', 'Aceitação da denúncia', 'bolsonaro-reu-trama-golpista-b124-54') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 55
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gle, 'Gleisi Hoffmann assume Secretaria de Relações Institucionais.', 'Estarei com o presidente Lula para construir maioria no Congresso.', 'Posse no Palácio do Planalto como ministra.', 'verified', false, '2025-03-05', 'https://g1.globo.com/politica/noticia/2025/03/05/gleisi-toma-posse-como-ministra.ghtml', 'other', 1, 'Brasília', 'Posse como ministra', 'gleisi-posse-sri-b124-55') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 56
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tem, 'Temer opina que denúncia contra Bolsonaro é juridicamente frágil.', 'O tipo penal exige ato de execução. Houve apenas discurso.', 'Entrevista à Veja sobre denúncia da PGR.', 'verified', false, '2025-02-25', 'https://veja.abril.com.br/politica/temer-denuncia-bolsonaro-fragil/', 'news_article', 3, 'São Paulo', 'Entrevista à Veja', 'temer-denuncia-bolsonaro-fragil-b124-56') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 57
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula critica Estados Unidos por apoio silencioso a Bolsonaro.', 'Chega de tutela estrangeira. O Brasil é soberano para julgar seus golpistas.', 'Discurso em evento com lideranças da América Latina.', 'verified', false, '2025-03-10', 'https://www1.folha.uol.com.br/poder/2025/03/lula-critica-eua-sobre-bolsonaro.shtml', 'other', 2, 'Brasília', 'Cúpula latino-americana', 'lula-critica-eua-bolsonaro-b124-57') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 58
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro pede licença do mandato e vai aos EUA articular pressão.', 'Vou lutar pelo meu pai nos EUA. Lá posso ser mais útil do que aqui.', 'Pedido de licença da Câmara para articular pressão contra o STF.', 'verified', true, '2025-03-18', 'https://g1.globo.com/politica/noticia/eduardo-bolsonaro-pede-licenca-e-vai-aos-eua.ghtml', 'news_article', 4, 'Washington', 'Viagem aos EUA', 'eduardo-licenca-eua-b124-58') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 59
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio diz preferir Bolsonaro como candidato em 2026.', 'Bolsonaro é o nome natural. Não se especula nomes alternativos enquanto ele estiver na disputa.', 'Entrevista ao Estadão sobre cenário eleitoral de 2026.', 'verified', false, '2025-05-20', 'https://politica.estadao.com.br/noticias/geral,tarcisio-prefere-bolsonaro-candidato,70004512345', 'news_article', 2, 'São Paulo', 'Entrevista ao Estadão', 'tarcisio-prefere-bolsonaro-candidato-b124-59') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 60
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_had, 'Haddad defende reforma tributária como legado do governo.', 'A reforma é o maior avanço fiscal da nossa geração. Vai destravar o Brasil.', 'Coletiva após aprovação da regulamentação da reforma tributária.', 'verified', false, '2025-01-17', 'https://valor.globo.com/politica/noticia/haddad-defende-reforma-tributaria.ghtml', 'news_article', 1, 'Brasília', 'Coletiva no Ministério', 'haddad-reforma-tributaria-b124-60') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 61
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cir, 'Ciro Gomes critica governo Lula e polariza com PT.', 'O PT aparelhou novamente o Estado. O Brasil precisa de uma terceira via.', 'Entrevista ao Roda Viva sobre cenário de 2026.', 'verified', false, '2025-06-02', 'https://www.cartacapital.com.br/politica/ciro-critica-governo-lula-2025/', 'news_article', 2, 'São Paulo', 'Roda Viva', 'ciro-critica-lula-2025-b124-61') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 62
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_axm, 'Alexandre de Moraes condena núcleos do golpe por atos preparatórios.', 'Os atos de execução estão amplamente comprovados. Não há dúvida razoável.', 'Voto no STF condenando réus ligados à trama golpista de 2022-2023.', 'verified', true, '2025-09-02', 'https://g1.globo.com/politica/noticia/2025/09/02/moraes-vota-condenacao-golpistas.ghtml', 'other', 4, 'Brasília', 'Julgamento do golpe', 'moraes-voto-golpe-2025-b124-62') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 63
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro é condenado pelo STF por tentativa de golpe.', 'Essa condenação é injusta. Vou recorrer e não sou criminoso.', 'Declaração após condenação histórica de ex-presidente por golpe.', 'verified', true, '2025-09-11', 'https://www1.folha.uol.com.br/poder/2025/09/bolsonaro-e-condenado-por-tentativa-de-golpe.shtml', 'other', 5, 'Brasília', 'Condenação histórica', 'bolsonaro-condenado-golpe-b124-63') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 64
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula celebra condenação de Bolsonaro como vitória da democracia.', 'A democracia brasileira venceu. Ninguém está acima da lei.', 'Pronunciamento no Planalto após condenação no STF.', 'verified', true, '2025-09-11', 'https://g1.globo.com/politica/noticia/2025/09/11/lula-celebra-condenacao-bolsonaro.ghtml', 'other', 2, 'Brasília', 'Pronunciamento no Planalto', 'lula-celebra-condenacao-bolsonaro-b124-64') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 65
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fla, 'Flávio Bolsonaro promete lutar no Congresso pela anistia do pai.', 'O PL de anistia é a nossa bandeira. Lutaremos por ela até as últimas consequências.', 'Declaração no Senado após a condenação do ex-presidente.', 'verified', true, '2025-09-12', 'https://www12.senado.leg.br/noticias/materias/2025/09/12/flavio-anistia-pai', 'other', 4, 'Brasília', 'Plenário do Senado', 'flavio-anistia-congresso-b124-65') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 66
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_tar, 'Tarcísio promete indulto a Bolsonaro se eleito presidente.', 'Se eu for presidente, vou dar indulto a Bolsonaro. Ele é um preso político.', 'Entrevista a podcast declarando intenção pública de indulto.', 'verified', true, '2025-10-08', 'https://veja.abril.com.br/politica/tarcisio-promete-indulto-bolsonaro/', 'news_article', 5, 'São Paulo', 'Podcast político', 'tarcisio-promete-indulto-bolsonaro-b124-66') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 67
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hmo, 'Hugo Motta barra urgência de PL de anistia em meio a pressão.', 'A Câmara vai debater com responsabilidade. Não haverá atropelos.', 'Coletiva após rejeição de pedido de urgência.', 'verified', false, '2025-09-20', 'https://g1.globo.com/politica/noticia/motta-barra-urgencia-anistia.ghtml', 'news_article', 2, 'Brasília', 'Coletiva na Câmara', 'motta-barra-urgencia-anistia-b124-67') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 68
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_nik, 'Nikolas lidera ato pela anistia dos golpistas em SP.', 'Nenhum patriota fica para trás. Vamos anistiar os presos políticos.', 'Discurso na Av. Paulista em ato bolsonarista.', 'verified', true, '2025-09-07', 'https://www1.folha.uol.com.br/poder/2025/09/nikolas-lidera-ato-pela-anistia.shtml', 'other', 5, 'São Paulo', 'Ato na Paulista', 'nikolas-ato-anistia-paulista-b124-68') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 69
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mic, 'Michelle Bolsonaro discursa em ato pela anistia chamando apoiadores.', 'Jair é um homem de Deus. Deus vai livrar a família Bolsonaro da injustiça.', 'Discurso em ato na Paulista pedindo anistia.', 'verified', true, '2025-09-07', 'https://g1.globo.com/sp/sao-paulo/noticia/michelle-discursa-em-ato-pela-anistia.ghtml', 'other', 4, 'São Paulo', 'Ato na Paulista', 'michelle-ato-anistia-b124-69') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 70
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lir, 'Arthur Lira defende anistia parcial aos envolvidos no 8 de janeiro.', 'Penas de 17 anos são desproporcionais. Precisamos rever.', 'Declaração a jornalistas sobre projeto de anistia na Câmara.', 'verified', false, '2024-04-10', 'https://oglobo.globo.com/politica/lira-defende-anistia-parcial-8-janeiro-25854321', 'news_article', 4, 'Brasília', 'Coletiva na Câmara', 'lira-anistia-parcial-b124-70') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 71
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pac, 'Rodrigo Pacheco rejeita anistia ampla a golpistas do 8 de janeiro.', 'Anistiar quem atentou contra os Poderes seria premiar o crime.', 'Entrevista ao Jornal Nacional sobre projetos no Senado.', 'verified', false, '2024-04-15', 'https://g1.globo.com/politica/noticia/pacheco-rejeita-anistia-8-de-janeiro.ghtml', 'news_article', 2, 'Brasília', 'Entrevista ao JN', 'pacheco-rejeita-anistia-b124-71') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 72
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fre, 'Freixo vira secretário de Turismo e defende combate ao bolsonarismo.', 'O bolsonarismo precisa ser enfrentado no campo das ideias e da política.', 'Entrevista à CBN como secretário nacional de Turismo.', 'verified', false, '2023-04-15', 'https://www.cartacapital.com.br/politica/freixo-bolsonarismo-ideias/', 'news_article', 1, 'Brasília', 'Entrevista à CBN', 'freixo-bolsonarismo-ideias-b124-72') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 73
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_rje, 'Roberto Jefferson é condenado a mais anos por ataque à PF.', 'Eu me defendi de abuso de autoridade. Não me rendo a injustiça.', 'Declaração em entrevista após nova condenação.', 'verified', true, '2023-08-15', 'https://g1.globo.com/rj/rio-de-janeiro/noticia/roberto-jefferson-e-condenado-a-mais-anos.ghtml', 'other', 4, 'Rio de Janeiro', 'Nova condenação', 'rje-condenado-ataque-pf-b124-73') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_vio, true FROM ins;

  -- 74
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mag, 'Magno Malta defende Bolsonaro após condenação no STF.', 'Bolsonaro é inocente. O STF se transformou em instrumento de perseguição.', 'Pronunciamento em ato bolsonarista em Vitória.', 'verified', false, '2025-09-14', 'https://veja.abril.com.br/politica/magno-malta-defende-bolsonaro-condenacao/', 'other', 3, 'Vitória', 'Ato em Vitória', 'malta-defende-bolsonaro-stf-b124-74') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 75
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_sil, 'Silas Câmara defende anistia como reconciliação nacional.', 'O perdão é virtude cristã. Precisamos reconciliar o Brasil.', 'Discurso em culto parlamentar evangélico em Brasília.', 'verified', false, '2025-10-15', 'https://www.cartacapital.com.br/politica/silas-camara-defende-anistia/', 'other', 3, 'Brasília', 'Culto parlamentar', 'silas-anistia-reconciliacao-b124-75') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 76
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_mfe, 'Marco Feliciano pede anistia a Bolsonaro em culto com bolsonaristas.', 'Deus vai libertar Jair. Nossos irmãos injustamente presos serão libertados.', 'Culto em São Paulo com forte presença bolsonarista.', 'verified', false, '2025-09-21', 'https://www1.folha.uol.com.br/poder/2025/09/feliciano-anistia-bolsonaro-culto.shtml', 'other', 4, 'São Paulo', 'Culto evangélico', 'feliciano-anistia-bolsonaro-culto-b124-76') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 77
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ott, 'Otto Alencar critica golpismo e defende Moraes.', 'O ministro Moraes cumpre a Constituição. Ataques contra ele são contra a democracia.', 'Discurso no Senado em defesa do STF.', 'verified', false, '2024-09-10', 'https://www12.senado.leg.br/noticias/materias/2024/09/10/otto-defende-moraes-stf', 'other', 2, 'Brasília', 'Sessão do Senado', 'otto-defende-moraes-b124-77') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 78
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jwa, 'Jaques Wagner defende reforma ministerial e agenda do governo.', 'Lula precisa de maioria sólida no Congresso para entregar resultados.', 'Entrevista à CNN sobre articulação política.', 'verified', false, '2024-08-20', 'https://www.cnnbrasil.com.br/politica/wagner-reforma-ministerial/', 'news_article', 1, 'Brasília', 'Entrevista à CNN', 'wagner-reforma-ministerial-b124-78') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 79
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_hco, 'Humberto Costa rebate Moro em plenário do Senado.', 'Moro foi juiz parcial e hoje é senador acuado pela Justiça.', 'Discurso de réplica em embate no plenário.', 'verified', false, '2023-06-05', 'https://www12.senado.leg.br/noticias/materias/2023/06/05/humberto-costa-rebate-moro', 'other', 2, 'Brasília', 'Sessão do Senado', 'humberto-rebate-moro-b124-79') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 80
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_cha, 'Chico Alencar critica tentativa de anistia aos golpistas.', 'Anistiar golpistas é assinar atestado de óbito da democracia.', 'Artigo publicado na Carta Capital sobre PL da anistia.', 'verified', false, '2025-03-20', 'https://www.cartacapital.com.br/politica/chico-alencar-contra-anistia-golpistas/', 'news_article', 2, 'Rio de Janeiro', 'Artigo na Carta Capital', 'chico-critica-anistia-golpistas-b124-80') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 81
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_eli, 'Eliziane Gama apresenta relatório final da CPMI do 8 de janeiro.', 'Identificamos 61 nomes para indiciamento por tentativa de golpe.', 'Leitura do relatório final na CPMI em outubro de 2023.', 'verified', true, '2023-10-17', 'https://www12.senado.leg.br/noticias/materias/2023/10/17/eliziane-apresenta-relatorio-final-cpmi', 'other', 2, 'Brasília', 'Relatório da CPMI', 'eliziane-relatorio-cpmi-b124-81') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 82
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_ran, 'Randolfe deixa a Rede e ingressa no PT.', 'O momento exige união das forças democráticas. Junto-me ao PT com convicção.', 'Anúncio em coletiva em Brasília sobre mudança de partido.', 'verified', true, '2023-12-15', 'https://g1.globo.com/politica/noticia/randolfe-deixa-a-rede-e-ingressa-no-pt.ghtml', 'news_article', 2, 'Brasília', 'Anúncio de filiação', 'randolfe-entra-pt-b124-82') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 83
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_gil, 'Gilmar Mendes vota com maioria por inelegibilidade de Bolsonaro.', 'Há abuso de poder inequívoco, o que caracteriza o tipo previsto em lei.', 'Voto no julgamento do TSE sobre reunião com embaixadores.', 'verified', true, '2023-06-30', 'https://www1.folha.uol.com.br/poder/2023/06/gilmar-mendes-vota-pela-inelegibilidade-de-bolsonaro.shtml', 'other', 3, 'Brasília', 'Julgamento no TSE', 'gilmar-voto-inelegibilidade-b124-83') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 84
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fux, 'Fux diverge do plenário e vota por absolver Bolsonaro no julgamento do golpe.', 'Sem ato executório, não há crime consumado. Há dúvida sobre intenção.', 'Voto divergente no julgamento do STF em setembro de 2025.', 'verified', true, '2025-09-09', 'https://oglobo.globo.com/politica/fux-diverge-e-absolve-bolsonaro-26034521', 'other', 3, 'Brasília', 'Julgamento no STF', 'fux-absolve-bolsonaro-b124-84') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 85
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fac, 'Fachin vota pela condenação de Bolsonaro por trama golpista.', 'Os fatos demonstram articulação para subverter o resultado eleitoral.', 'Voto no julgamento do núcleo da trama golpista.', 'verified', true, '2025-09-04', 'https://g1.globo.com/politica/noticia/fachin-vota-pela-condenacao-bolsonaro.ghtml', 'other', 3, 'Brasília', 'Julgamento no STF', 'fachin-voto-condenacao-bolsonaro-b124-85') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 86
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car2, 'Cármen Lúcia vota pela condenação e destaca documentos da minuta golpista.', 'A minuta do golpe é prova documental robusta. Não há como negar.', 'Voto no julgamento sobre trama golpista.', 'verified', true, '2025-09-05', 'https://www1.folha.uol.com.br/poder/2025/09/carmen-lucia-vota-contra-bolsonaro.shtml', 'other', 3, 'Brasília', 'Julgamento no STF', 'carmen-voto-minuta-golpe-b124-86') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 87
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zan, 'Zanin vota pela condenação de Bolsonaro.', 'Os atos preparatórios e de execução estão caracterizados.', 'Voto no STF no julgamento do golpe, acompanhando relator.', 'verified', true, '2025-09-08', 'https://g1.globo.com/politica/noticia/zanin-vota-pela-condenacao-de-bolsonaro.ghtml', 'other', 3, 'Brasília', 'Julgamento no STF', 'zanin-voto-condenacao-b124-87') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 88
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_fdn, 'Flávio Dino vota pela condenação e destaca riscos do golpismo.', 'Tolerar o golpismo é abrir caminho para sua repetição.', 'Voto no julgamento do STF como ministro.', 'verified', true, '2025-09-08', 'https://oglobo.globo.com/politica/dino-vota-pela-condenacao-bolsonaro-26076543', 'other', 3, 'Brasília', 'Julgamento no STF', 'dino-voto-condenacao-b124-88') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 89
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro descumpre medidas cautelares e é recolhido à prisão domiciliar.', 'Vou cumprir, mas com indignação. É injusto o que fazem comigo.', 'Declaração após Moraes decretar prisão domiciliar por descumprimento.', 'verified', true, '2025-08-04', 'https://www1.folha.uol.com.br/poder/2025/08/bolsonaro-e-colocado-em-prisao-domiciliar.shtml', 'news_article', 5, 'Brasília', 'Prisão domiciliar', 'bolsonaro-prisao-domiciliar-b124-89') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 90
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_edu, 'Eduardo Bolsonaro articula sanções de Trump contra Moraes.', 'Esperamos que o governo Trump ajude a libertar meu pai das perseguições.', 'Entrevista à Fox News pedindo pressão internacional sobre Brasil.', 'verified', true, '2025-04-15', 'https://veja.abril.com.br/politica/eduardo-articula-sancoes-trump-moraes/', 'news_article', 5, 'Washington', 'Entrevista à Fox News', 'eduardo-sancoes-trump-moraes-b124-90') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 91
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula denuncia pressão de Trump e tarifas contra o Brasil.', 'Não aceitaremos tutela. O Brasil tem soberania para julgar seus crimes.', 'Pronunciamento após tarifaço anunciado por Trump em julho de 2025.', 'verified', true, '2025-07-10', 'https://g1.globo.com/politica/noticia/lula-denuncia-tarifaco-de-trump.ghtml', 'other', 2, 'Brasília', 'Pronunciamento no Planalto', 'lula-denuncia-tarifaco-trump-b124-91') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 92
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro comemora tarifaço de Trump contra Brasil.', 'Trump está defendendo a liberdade no mundo. O tarifaço é resposta à tirania daqui.', 'Declaração em nota oficial após medidas dos EUA.', 'verified', true, '2025-07-10', 'https://www1.folha.uol.com.br/mundo/2025/07/bolsonaro-comemora-tarifaco-trump.shtml', 'social_media_post', 5, 'Brasília', 'Nota nas redes sociais', 'bolsonaro-comemora-tarifaco-b124-92') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 93
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_car, 'Carlos Bolsonaro ataca STF em série de tweets pela anistia.', 'O STF virou a pior máquina de perseguição da história. Anistia já!', 'Série de publicações em rede social atacando ministros.', 'verified', true, '2025-09-15', 'https://g1.globo.com/politica/noticia/carlos-bolsonaro-ataca-stf-anistia.ghtml', 'social_media_post', 4, 'Rio de Janeiro', 'Publicações no X', 'carlos-ataca-stf-anistia-b124-93') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ame, true FROM ins;

  -- 94
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_zam, 'Zambelli é condenada a 10 anos pelo STF em ação sobre ataque hacker ao CNJ.', 'Ficou provada a autoria intelectual na fraude de dados do sistema.', 'Declaração de Moraes ao fim do julgamento que condenou a deputada.', 'verified', true, '2025-05-13', 'https://oglobo.globo.com/politica/zambelli-e-condenada-a-10-anos-25898765', 'other', 5, 'Brasília', 'Julgamento no STF', 'zambelli-condenada-10-anos-b124-94') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_abu, true FROM ins;

  -- 95
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dsi, 'Daniel Silveira tem pedido de anistia negado pelo STF novamente.', 'Sou injustiçado. Continuo firme e não me arrependo de nada.', 'Declaração em vídeo de dentro da prisão após negativa.', 'verified', true, '2024-07-12', 'https://www1.folha.uol.com.br/poder/2024/07/silveira-tem-anistia-negada.shtml', 'social_media_post', 4, 'Rio de Janeiro', 'Vídeo da prisão', 'silveira-anistia-negada-b124-95') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_ant, true FROM ins;

  -- 96
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_pau, 'Paulo Guedes critica condução econômica de Haddad.', 'O governo está desperdiçando todo o trabalho fiscal que fizemos.', 'Entrevista ao Valor sobre política econômica do governo Lula.', 'verified', false, '2024-05-20', 'https://valor.globo.com/politica/noticia/guedes-critica-haddad-fiscal.ghtml', 'news_article', 2, 'São Paulo', 'Entrevista ao Valor', 'guedes-critica-haddad-b124-96') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 97
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_dil, 'Dilma Rousseff preside Banco dos BRICS em Xangai.', 'O Banco dos BRICS será a alternativa ao sistema financeiro dominado pelos EUA.', 'Discurso como presidente do NDB em Xangai.', 'verified', false, '2024-06-10', 'https://www1.folha.uol.com.br/mundo/2024/06/dilma-discursa-como-presidente-do-banco-dos-brics.shtml', 'other', 1, 'Xangai', 'Conferência do NDB', 'dilma-presidente-brics-b124-97') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 98
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lip, 'Lula comenta críticas internacionais à sua atuação em conflitos.', 'O Brasil defende paz e diplomacia. Nunca fomos país belicista.', 'Entrevista à imprensa internacional sobre guerra na Ucrânia e Gaza.', 'verified', false, '2023-11-02', 'https://g1.globo.com/politica/noticia/lula-comenta-criticas-internacionais.ghtml', 'news_article', 2, 'Brasília', 'Coletiva internacional', 'lula-criticas-internacionais-b124-98') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 99
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_jair, 'Bolsonaro tem passaporte apreendido e é proibido de contatar investigados.', 'Eu não vou fugir. Sou brasileiro e confio na Justiça apesar de tudo.', 'Declaração a jornalistas após apreensão do passaporte pela PF.', 'verified', true, '2024-02-08', 'https://g1.globo.com/politica/noticia/bolsonaro-tem-passaporte-apreendido.ghtml', 'news_article', 4, 'Brasília', 'Operação Tempus Veritatis', 'bolsonaro-passaporte-apreendido-b124-99') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

  -- 100
  WITH ins AS (INSERT INTO statements (politician_id, summary, full_quote, context, verification_status, is_featured, statement_date, primary_source_url, primary_source_type, severity_score, venue, event_name, slug) VALUES (v_lul, 'Lula encerra discurso em Brasília aos 3 anos do 8 de janeiro defendendo democracia.', 'A democracia não se cansa. Três anos depois, os que atentaram pagam pelos seus atos.', 'Discurso em ato pelos 3 anos do 8 de janeiro no Congresso Nacional.', 'verified', true, '2026-01-08', 'https://g1.globo.com/politica/noticia/2026/01/08/lula-discursa-em-ato-dos-3-anos-do-8-de-janeiro.ghtml', 'other', 2, 'Brasília', '3 anos do 8 de janeiro', 'lula-discurso-3-anos-8-janeiro-b124-100') ON CONFLICT (slug) DO NOTHING RETURNING id)
  INSERT INTO statement_categories (statement_id, category_id, is_primary) SELECT id, c_des, true FROM ins;

END $$;
